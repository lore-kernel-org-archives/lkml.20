Received: from mta0.migadu.com (out-40.mta0.migadu.com [91.218.175.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27184CE690
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499323; cv=none; b=KRdzrgzROJtaHDhSPt8XlkVF1IJvcX+myiXntG7aV2kKyTf4M+ujnHqwkqOIKr8Ox9/z6GxdqT+vZvb6iZevQwjYIiVRhwCp8AVRsQCtnQP4IhFrNBcaX0GvBzt3CDr/AT1FZWPq7yBXtDey6bQvHNNpFcdGIuO77bcN0nVgKoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499323; c=relaxed/simple;
	bh=v5FkDF1OJRgoUbj67ryuGqHQMqQUpqnHwLRpAAHOQ+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBjebNd753Av4WupWd7FHdeyDhB95OB1FTjmuHasxykjwU2eJ1amGRc1Z+AwSePLB7/0OysRDRongzrDcE/+DBiZaJDoFKcyX+IMPvC7k+jBARFcoHBdrY00MixvH2kLj70FV924PASKcbwXC7SNLxwaGm/YYN4l4nWBvBEFKYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UjOsT72q; arc=none smtp.client-ip=91.218.175.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UjOsT72q"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=v5FkDF1OJRgoUbj67ryuGqHQMqQUpqnHwLRpAAHOQ+4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789499319; v=1; x=1790104119;
 b=UjOsT72qK4VI7jIVgqIgLxDV4aX8c+hamE66ByO/uAIn/dzy8tUpYk1GMPerh5RgTncH9xXQ
 kkjHlt46vKs7doRySN5K03/GjslgaiTMvYAz6t4EofTkn/Xi3nzVA8MaFvlfh/mTT6D2CBeRbQm
 RfqMOgVtbrIn45PL92gcXWq8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 100fb2393ce94054;
	Tue, 15 Sep 2026 19:08:39 +0000
X-Mizu-Trace-ID: 100fb2393ce94054
X-Migadu-Flow: FLOW_OUT
Message-ID: <528a9777-1587-4dfc-a366-000fc0867d4b@linux.dev>
Date: Tue, 15 Sep 2026 21:08:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC/soundwire: remove ghost peripherals from the
 mach table
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, tiwai@suse.de
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
References: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/26 15:13, Bard Liao wrote:
> ACPI may report a ghost SoundWire peripheral. It will cause unexpected
> error like duplicated links, codec driver can't probe, etc. This series
> check the presence of SoundWire peripherals and skip the non-existing
> peripherals.

I am afraid this raises quite a few opens, such as the 'mockup' support
and delayed enumeration.

A better way to only deal with actual codecs would be to only probe
codec drivers when the codecs report as ATTACHED and get enumerated,
instead of during the ACPI parsing stage.
This is a solution that was discussed a ong time ago, probably circa
2016, during one of the LPC miniconferences, and the direction from
maintainers was that the probe could be used to enable resources (power,
gpio, clocks) that might be required for the hardware codec to become
functional and report as ATTACHED. That's the reason why the probe is
done on all codecs exposed in ACPI, even 'ghost' ones, with an
update_status() callback to the codec driver when the presence of that
codec is detected on the bus.

In practice I am not aware of any codec drivers doing anything with
power/gpio/clocks in the probe stages, at least for ACPI platforms, so
it may be a good time to revisit this direction. SDCA class drivers do
exactly what I described, the subdevices are registered only upon
enumeration, not during ACPI parsing. It's a much simpler design with a
lot fewer potential races.

Problems:
- this would be a very invasive change to sdw_slave_add(), with the
device_register() skipped and moved to the enumeration stage. It'd have
to be opt-in and used only a newer platforms to avoid breaking the
'legacy' devices.
- there is still *nothing* that would tell you that all codec hardware
on a given platform completed the enumeration. You could have a fixed
delay but this would need to be large enough to cover all cases and that
could make the platform boot slower than the current solution - not ideal.

Another option would be to parse the ACPI0018 device, which describes
audio endpoints and makes references to codecs, which could be used to
filter out 'ghost' codecs that don't provide any endpoints. The spec for
this ACPI0018 is not public but could be reverse-engineered from Windows
platforms. The main benefit is that this filtering could be done in the
ACPI parsing stages and not change anything in the probe and startup
sequences.
