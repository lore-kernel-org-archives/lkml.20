Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBD328C037
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790438118; cv=none; b=eWjpaPn7MHhl1DziWprLeHY/yifa213e/JUru8xLDZ0uEHsh8gwtedk674B35tvxoiiwXGVYkyOBvKQuBorsK2VnFMT4yF3x2YCo3oL7tX0d5d4fg4GoEPxUx7ctbFyrgCTh9xFBhZCFuoo8Dtslynke2knBQcoFIMTRvE+9Vv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790438118; c=relaxed/simple;
	bh=OEXposXAbefo/GAh73NRPiUnFmStR22LjrEG+iq90D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=seZVkUj1P1rpPGBwpPxqr79ANpvow/W1IJl7o0+6h1//jSNpY4bLQ2w9dZ3jUNywX1HwWGJ67XALT3MA79VKdxXAVZBJv3ef34B/HneQ/rxgha3jEI5fCiONQy58QriSCsiFD/qwtDfk1nc+459qZcP7TQfInoZJ9xHnSsjJgVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d55OufLa; arc=none smtp.client-ip=91.218.175.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d55OufLa"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OEXposXAbefo/GAh73NRPiUnFmStR22LjrEG+iq90D4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790438112; v=1; x=1791042912;
 b=d55OufLan7CYlpJqdm5o0Dp2NduYIXtMYlT/vNH3Mu7qPLT8x5OIE+ch1sSaPZuz30J20Nrp
 od70gg5EXP1Gv9eW9W4lbxoLbF7FUdyp2VIOmMFEzkwneVf1F51uQVNLpLHW8eaWt8P40P2VM1R
 p9qRZx9sFEnnjMQ91d/5eFHM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5e1378074cd801b7;
	Sat, 26 Sep 2026 15:55:11 +0000
X-Mizu-Trace-ID: 5e1378074cd801b7
X-Migadu-Flow: FLOW_OUT
Message-ID: <2c4ea801-f048-405d-a163-e65691e93fc7@linux.dev>
Date: Sat, 26 Sep 2026 17:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
> index 901a71262094f..1439cef43462d 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -508,8 +508,13 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
>  	if (!bus->prop.hw_disabled) {
>  		sdw_intel_debugfs_exit(sdw);
>  		cancel_delayed_work_sync(&cdns->attach_dwork);
> -		sdw_cdns_enable_interrupt(cdns, false);
>  	}
> +
> +	sdw_bus_slaves_delete(bus);
> +
> +	if (!bus->prop.hw_disabled)
> +		sdw_cdns_enable_interrupt(cdns, false);
> +
>  	sdw_bus_master_delete(bus);
>  }

sorry, not following - this sequence seems to rely on *two* calls to
sdw_bus_slaves_delete(), is this intentional or I am missing something?


 void sdw_bus_master_delete(struct sdw_bus *bus)
 {
-	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+	sdw_bus_slaves_delete(bus); <<< this would be the second call?
+	sdw_bus_slaves_put(bus);



