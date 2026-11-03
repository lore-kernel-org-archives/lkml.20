Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708389;
	b=w6wEEPdJYIHjI3vI5uatr/Pg7n9DJPEDDMH/WHDlYjzKOUzaTYOB2ckWl6hE9IOf1uWN
	 1fvQqsOW5cQn+hzyVz9sEb0M31B8ygTqqXTachJmgQY4yyU4po5OiPkXq9kw+HiJicvCE
	 MfjnWvwIXCzKPrgCm0GCSOv5HtRjgEg/2/cO/SPDMeKsDkkEehmy38EqWNGPwuJZNRnhA
	 WaoFTq56KWt+r4W6CtfqVD4otqICm2u9VPNqxSYVq4ArMx7r9TIzK5jZL+LS1OsCA2Pmx
	 EjHTa3B9nZP36riFGl37i3obYGuJtpxhWik/oK8rplSXrM5hpM8CzUp+9S+OozQaQ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708389;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=POwmkuKuZt+3esNskzrXPk+zZUe1C1spyDLFbmW5YFo=;
	b=Uxv+5jyaTY704SO4jOMeDWSRTrw3dTf5ZXBSHaGW6MLphdu8V1cbPQ1hoyKHIPlsiW+p
	 Zh0IvD9HXP+Z9ehYBUI4VYRA7ClpDdsJOheVqwcesuRc6pXs9JK/sOJhMEI4AoboLADS0
	 1cYsjoi2053zuaj4+t4e06ybNE7RNoaNlkoKjW3g8ShLBC9ci9nSAxVf9p99MoQtugfDv
	 ilnHVmwUNtw/pgFQDvR4V1Ct/sRNtWDr76P/aMzk2VfVNqyRzT+BqTjqGwftopNxWDfTs
	 G+Tva6bEnvspiYo2SpRmDcW+PpihZZaJscFxy+Y1kOZSt4B7Mqkul4IvqHFOFg/ZQeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FVqTLxYV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3330606A326;
	Tue,  3 Nov 2026 12:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FVqTLxYV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6A61F000C1;
	Tue,  3 Nov 2026 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793708388;
	bh=POwmkuKuZt+3esNskzrXPk+zZUe1C1spyDLFbmW5YFo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FVqTLxYVXhhvCCs2K2udWe77IUJZaW0gxJnll2Ek6FOW9d1ANmypr4R2AGUDKTDeC
	 lWECtjLWqnLaEg4nmB6O3KBAo5ebBLR31GoOZIA2w+7w2aR3GdyO7yFmBdZ/K+9ENs
	 X7FhxdrBT08pErwLMOeuG8N9SNU3YaTtIyeYshqcEaRdxvtiUstEhjeeaUekosmuQ0
	 11EL/aJJP4nMIn5l8c76xspxRK4LUULIVZiDWqcZG8pmY+WMEb2oLmQTR3BIJwni43
	 DfTSUxE3CDPox/gEvZxnLpHWSsYTdAySbrQ474RXMygfzLeGZRwV+PKFWBMgtugBvo
	 oeTev71XIJEwQ==
Message-ID: <7f3e822e-3749-41c5-8390-e6d74b203927@kernel.org>
Date: Tue, 3 Nov 2026 12:19:45 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
 <MPrRsE5vvB26tbMAT443IrH7Zr_tyIPaFwvQfnZj5TJUaM5uN8MyHB6kU6Y7rW92Sy35A5GfNcv95YOt-4YUNw==@protonmail.internalid>
 <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/11/2026 07:11, Gjorgji Rosikopulos (Consultant) wrote:
>> +
>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
>> +{
>> +	struct v4l2_event event = {
>> +		.type = V4L2_EVENT_FRAME_SYNC,
>> +		.id = id,
>> +		.u.frame_sync.frame_sequence =
>> +			atomic_inc_return(&csid->sof_seq[id]),
>> +	};
> On first look this was looking strange because the id is used for the
> control id events not for frame sync. But on second thought it may make
> sense, but the question is how the userspace should interpret those ids?
> As of today userspace does not have any info for the VC and csid internal
> pipelines (so called lines). So with the current state of the code
> the id is VC which makes sense becouse the SOF/EOF packets are recieved
> based on VC. So i am thinking of two options:

The id is not the VC its the CSID:id/port/line-number. VCs don't change 
what this means; its the SOF event as seen by the CSI decoder - inside 
of which there may be multiple VC:DT combos.

This is also the case for PIX which is just another CSID 
port/id/line-number.

> 
> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>     and will be well known to userspace for which line is reported.
> 
> 2. Add and propose extension of videodev2 documentation that
>     id of frame_sync event types represents SOF per virtual channel.
> 
> Personally i votoe for (1) because it will well fit with stream-api
> support and usespace will have clear understanding of the SOF to which
> stream belongs.

You know from the media graph which CSID drives which VFE:output so it 
is 100% possible to know which CSID:SOF relates to which VFE always. 
CSID::SOF is a hardware description of what the CSID decoder sees. I 
don't support mis-reporting it as a VFE event TBH.

More than that though, there is in-fact a VFE specific SOF/EOF and EPOCH 
event but these require the CSID feeding a frame into the VFE pipeline 
and the VFE moving through its own state-machine to process that frame.

So they are separate signals and separate logical events representing 
different things with different timings in hardware, meaning different 
things to userspace.

CSID:SOF is the thing you want to trigger off of if you are for example 
trying to align an IMU timestamp, not VFE SOF.

Feel free to propose VFE:SOF/EOF if it makes sense for VCs - I don't 
think I have a clear picture of what you want to do there - interested 
though.

---
bod
