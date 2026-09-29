Received: from mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737AC54CF69
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706957; cv=none; b=C3LrI3taeJU4QrrvtfMnJ/eUbyn1kbY2XZBXCTEB9WX55IovcyGo+aYrnYbHwmQrXCO1LN1C0OIaA/LVA9+uRLOevqBzPd+AEzUJnysEnl6tYDK7jNgReeJzpsyatN+iD/Rn9ERdY6n9KnR5jWFVLy/bHmRrXpJ2xgQZXcopwKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706957; c=relaxed/simple;
	bh=fn51ZkghnBzxbNueGsLShJS2j0VzQRLLmfTenFa3W9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7wYOoKvlnK9qt05t5fJjIKnzlzz+edk83LNeEMlxI6W4jj9WgM2VpCxnAIlHYlNJD/XMfSazZz4i9OWzZ1hMnFxf6Tab7e4eyw8v/BNG+6w8hbmudnyufLpbVeRCOrjR7W+FMNUCO/1xfrV6VoPCGQkmv4NdcX5jSTDyEMfJe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=spzH3u6x; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="spzH3u6x"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fn51ZkghnBzxbNueGsLShJS2j0VzQRLLmfTenFa3W9M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790706953; v=1; x=1791311753;
 b=spzH3u6xIIM4rE4Ci2v06HT+g0BYG2655gBNbyzvG6HOSKevE07CkW1uLNTLy4SQdk0/UtZx
 T0IoTJbgU3OKwkgt4F9zaLt/CiCvZp5P669qkH7Q3KpCacWmzaolOHGjut99okuKpzQ9UCxNr/I
 MOCcupopJ6GtOBuLvjQWAfZA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 275d02f060ae6bbe;
	Tue, 29 Sep 2026 18:35:52 +0000
X-Mizu-Trace-ID: 275d02f060ae6bbe
X-Migadu-Flow: FLOW_OUT
Message-ID: <5aab68e8-7ce9-46e1-9dd1-5cc226560096@linux.dev>
Date: Tue, 29 Sep 2026 20:34:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Allow SoundWire devices to communicate during
 remove
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/26 17:42, Charles Keepax wrote:
> Currently on Intel systems SoundWire drivers can't communicate with the
> device during driver removal. This is primarily because the IRQs are
> disabled before the driver remove callback is run. The result of this is
> such transactions timeout causing a) a lot of errors in the log and b)
> driver remove to take a very long time.
> 
> This issue affects cs42l43 and cs42l45, primarily due to both using
> regmap IRQ.
> 
>  soundwire_intel soundwire_intel.link.0: IO transfer timed out, cmd 3 device 6 addr 5d len 1
>  soundwire sdw-master-0-0: trf on Slave 6 failed:-110 write addr 5d count 0
>  sdca_class sdw:0:0:01fa:4245:01: Failed to sync masks in 5d
> 
> As regmap IRQ is torn down it will mask the interrupts that are
> removed. However, there are many valid reasons a driver might want
> communicate with the device during removal, others would include
> disabling jack detection, putting the device into the lowest possible
> power state to save power, etc.
> 
> This patch set attempts to address this problem trying to locate the
> reason interrupts are disabled, fixing that and then leaving the IRQs
> enabled for the remove callback.
> 
> Thanks,
> Charles
> 
> Changes since v1:
>  - Add a new helper to destroy the children on the bus separately, this
>    allows the IRQs to be disabled for final cleanup.
>  - Split device_unregister into device_del and put_device.
> 
> Changes since v1:
>  - Add a new helper to destroy the children on the bus separately, this
>    allows the IRQs to be disabled for final cleanup.
>  - Split device_unregister into device_del and put_device.
> 
> Charles Keepax (3):
>   soundwire: bus: Don't unassign dev_num before unregistering device
>   soundwire: bus: Expose a helper to remove devices from the bus
>   soundwire: intel_auxdevice: Don't disable IRQs before removing
>     children

I've run out of objections and can't think of a better solution, so for
the patchset:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

Thanks Charles!

