Received: from mta0.migadu.com (out-205.mta0.migadu.com [91.218.175.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1807837C11C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410561; cv=none; b=Uf0TlCEbFuVHF8tl0rjVSDGdjWY04SwWmMCehDJrZzniXYlxHdDaoWOPT6fSpa4R9RE19DrnVUYfbVxZusaTUGOG6L/P3vx5ZJOPzAkgBggojwN7mdJ9JVMoHJlswE2vbtRpfAS3Lh7spkQUkcMohFMj3dtzi7GsYY6s17HW1C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410561; c=relaxed/simple;
	bh=qObNzLXGSe7+Pmcx9Xq5nh28Or/vlg/B3dDK4Ucq8e4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSkeJAv3Fc8g8hTPzKpkIhP6kpl405xiUcI53PuewVRj361WYC6lppz3vbNnL6EHk2Myogb8ZZFganVK9GMdnbSkaKwCI6fXYCLnFwcqXYAFHV4woRcMeeAn4axhhDgOCBx3iw/QrUcMXGYhKpbx8YEGVRWSJUijVqZR5KonjMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dI9KGDtP; arc=none smtp.client-ip=91.218.175.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dI9KGDtP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qObNzLXGSe7+Pmcx9Xq5nh28Or/vlg/B3dDK4Ucq8e4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789410554; v=1; x=1790015354;
 b=dI9KGDtPaHyHth18ymZLyq7sVaOKTv72PwiLl8YBpnTB+pD6SMFt0qArJTUK9PeYDYC3hZZQ
 Igokrt1f5QVGARfrSRkwTivl+NVv4fssIIkuDQaU0FDz4hjuS3fuc+hzbJqNs7DBoEwDcGOm8Co
 DmpsWExJUAAS8Fjkg4NcMnqA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fbdb2930a7d63bf4;
	Mon, 14 Sep 2026 18:29:14 +0000
X-Mizu-Trace-ID: fbdb2930a7d63bf4
X-Migadu-Flow: FLOW_OUT
Message-ID: <1ec1211c-51bb-4bd4-82c9-160216953c1e@linux.dev>
Date: Mon, 14 Sep 2026 20:21:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soundwire: bus: Don't unassign dev_num before
 unregistering device
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
References: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
 <20260911161903.419814-2-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260911161903.419814-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 18:19, Charles Keepax wrote:
> Don't mark dev_num as unassigned until after device_unregister()
> has been called. The driver may want to communicate with the
> device as part of the driver remove operation, so the dev_num
> should remain assigned until that has completed.

That change looks fine.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

But I am a bit worried about the dev_num handling now that I think of
it. This is *only* at the manager level. At the peripheral level, the
dev_num register has not been modified so the hardware still reports as
ATTACHED with the dev_num whose mask was cleared on the host side.
IOW we have a zombie peripheral on the link, and if we do a sequence
rmmod/insmod things could be fun...
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/soundwire/bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index aeaae5a57c89d..b17718f4277ed 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -175,8 +175,9 @@ static int sdw_delete_slave(struct device *dev, void *data)
>  
>  	sdw_slave_debugfs_exit(slave);
>  
> -	mutex_lock(&bus->bus_lock);
> +	device_unregister(dev);
>  
> +	mutex_lock(&bus->bus_lock);
>  	if (slave->dev_num) { /* clear dev_num if assigned */
>  		clear_bit(slave->dev_num, bus->assigned);
>  		if (bus->ops && bus->ops->put_device_num)
> @@ -185,7 +186,6 @@ static int sdw_delete_slave(struct device *dev, void *data)
>  	list_del_init(&slave->node);
>  	mutex_unlock(&bus->bus_lock);
>  
> -	device_unregister(dev);
>  	return 0;
>  }
>  

