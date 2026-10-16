Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E48B480336;
	Fri, 16 Oct 2026 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157788; cv=none; b=KNMKLF7XCnJ35K/J3v87GmgW30jitlQpnMD/+quwkhwwNN/DeTzVsJwVt1aO60aBnMg91KYWEZP3FuEN+ZMOIGS3sEFcY4KDvgWyNQM/yoMzTvKVv/GcbHnQecYBxowIR45rL68KAOh1M+1GpWcSbmUF4UqeGLjI27kTKBfV6R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157788; c=relaxed/simple;
	bh=d+XfALpztwK2vxu3QZ5NEzlKpy29pcMFQPXeyWXddXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5udpwZ/4QyuQZKJYRva2Cdi9EkspQoEwkoiQpTdzt/jszUvHLIIbSUGdTbKh4ZLiwtwZY63dLaf97VQ7FHlfafmnX7h3PC5MbCtWeS7774xNtqC+qw53by0AP7XKcvIfwWruoZHv96fCwRYAmWjr2P2Pr9ywTCc6SKIRAG4+RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuLDilKZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuLDilKZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0121F000C4;
	Fri, 16 Oct 2026 13:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792157787;
	bh=ZT13x7ybUhfmaPQnZzDMRSkYcee43yo/uoYUDT3gmJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZuLDilKZqnN+dJkrDigaSXGM3mOa2paaJVfwbPbLggoll0Hngy3vuDUwBA8PCcXO0
	 1PYpmYYu9Qkm85RludL1YtSaKe0ypDZz3bHOBwDEaep/DpgoogbDJJCo0xcWr2FjU4
	 V5wwiTt1qzNUH/ZTpl+U40D0n9CdwO4kFPqYZZ/ru5HiKzT4EGuz1td7zYbgEf6pzO
	 D4fUZUZnCzILjvt98OQ/jewOFY0+XpSYDu8DOFcEMFk6sIwbYgLiyXT3GYcJnJx5k6
	 r6f/sRKxfj5FIqv6seR67HOFXhqPmtYjbeRERfDhdaIU3+Hu2YL7xJBdzKZW0s29f4
	 iN4rLcY7KTzCQ==
Message-ID: <8f0d0c71-a199-4f7a-ad66-ecd32c888fa3@kernel.org>
Date: Fri, 16 Oct 2026 14:36:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: venus: vdec: signal EOS with a real buffer
To: David Heidelberg <david@ixit.cz>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260928-venus-vdec-eos-v1-0-6e9eb3ce9849@ixit.cz>
 <20260928-venus-vdec-eos-v1-1-6e9eb3ce9849@ixit.cz>
 <179153733762.2596899.11570084120645960007.b4-reply@b4>
 <mqFCP16y1EJxrCWt4Y1OG7uFyjiRGPjrl41Ir16DfZJkd2EmympX-jaQOp-dkmABkKKAjhVhGXLy3CuESH_puw==@protonmail.internalid>
 <da8b6a26-334d-461d-b0a6-8c38161e5e12@ixit.cz>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <da8b6a26-334d-461d-b0a6-8c38161e5e12@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/10/2026 14:34, David Heidelberg wrote:
> On 09/10/2026 11:15,bod@kernel.org wrote:
>> On 2026-09-28 23:40 +0200, David Heidelberg wrote:
>>> The decoder tells the firmware about the end of the stream with an empty
>>> buffer command whose address is a dummy (0xdeadb000), because the host
>>> has no input buffer to name. The SDM845 (Venus v4) firmware validates
>>> that address and rejects it:
>>>
>>>     IsBufferProtected(1087): VenusCoreCtrl: CP_UNKNOWN, buffer straddles
>>>     CP & non-CP regions
>>>     vDec_EmptyBuffer(1932): Invalidate buffer in ETB
>>>
>>> and raises HFI_ERR_SESSION_FATAL, reported by the driver as
>>>
>>>     qcom-venus aa00000.video-codec: session error: event id:1001 (deadb000)
>>>
>>> Both queues are then put into an error state, so the drain never
>>> completes and every V4L2_DEC_CMD_STOP ends the stream with an error:
>>> GStreamer's poll() fails at end of file, ffmpeg aborts.
>>>
>>> Allocate a small buffer the first time a decoder instance is drained and
>>> use its device address for the EOS command, so the firmware gets an
>>> address that is mapped and outside the protected regions. The firmware
>>> then drains normally: all frames are returned and the last capture
>>> buffer carries V4L2_BUF_FLAG_LAST. The NULL address used by old IRIS2
>>> firmware is left alone.
>>>
>>> Assisted-by: LLM
>>> Fixes: beac82904a87 ("media: venus: make decoder compliant with stateful codec API")
>>> Signed-off-by: David Heidelberg<david@ixit.cz>
>> The logic stacks up as I read it but, I want to see this a) work on sdm845
>> and b) not break on sm8250 before applying.
> On sdm845 it works great (tested multiple sdm845 phones with `livi --demo-h264`
> and loop enabled. I don't have sm8250, thus that's up to someone with the device 🙂
> 
> David

heh I do have it.

I will test ;)

---
bod
