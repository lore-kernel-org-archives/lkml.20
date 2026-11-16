Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.68.154.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820820;
	b=E4bGDO7R0m9BXFyo1hsIVn5CobP017bx2nU7tde1wz4VONiY/bk8c6Xn6f56+HM9vw3o
	 ksHDlpAPjmv7QEUJvcJIK6+uYTatEbkj5Q25SWNsg1YjVr+MsGvJkm3VsbRRPvndkbSrP
	 hw92HiMiF+AtvryTft3iN6IdBK3Y4r7f6tGiGNjPZGFSm5EPlN7KLEjotp/ZHESPcobn+
	 07cUoBprAd0tuOeNb7TD8tFucHJBuY6GAa/ULiQ/bbbV+fZ37DKRg4vNceO4EtLMvnRYx
	 0O9VwuRIEJGnrIHa5US5bpxjyTEU7WydjqK2vpZlM21IFWC2xtrH/DdgdUv2PAl5F4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820820;
	h=DMARC-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=k+wOuVk0Dr+o/+JpRBrIEXz83gTiweTC0xIvCalJCXc=;
	b=sqVJh5FlJA99j3sR2PsKuslUsODeuCJm5/pYvoH0HYIFxcgJizFmjV0nyAojFV+214rU
	 ypFyJx2EzuaN/xWq76qiraeicKAOZdQlyATT2cFrqi8mIkTZLqT9rF6ITBnv/u7aqc44R
	 R7aVLBa4z635RAWnhRyCYWf0EN6OIxn1C8RjVUfpThUoW1HRyOD5W4O4FQN17QFd5YN1a
	 bQzroM9mbQEW0EwuoqCNc9StqRcdIczCO26wCsfDat5R3S2vd31Z0Mf1d0jNdJuEVBsAd
	 QgQgWM6xxQD5by5I3f0SDOX0GI+y1Kke2j77s9kBRcNm37dXQIRhdKX6xKroNEQfcyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fromdisposition.org;
	spf=pass smtp.mailfrom=fromdisposition.org;
	dkim=pass header.d=fromdisposition.org header.i=@fromdisposition.org header.a=rsa-sha256 header.s=mail header.b=AoKjACI+;
	arc=none smtp.remote-ip=51.68.154.128
Received: from 4do.net (4do.net [51.68.154.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94A8606A323;
	Mon, 16 Nov 2026 09:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A94A8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fromdisposition.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromdisposition.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fromdisposition.org header.i=@fromdisposition.org header.a=rsa-sha256 header.s=mail header.b=AoKjACI+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fromdisposition.org;
	s=mail; t=1794820811;
	bh=GrxWz7efrCMYHUVm6uX3hNeflkQ7aBKkrpH9+rrDivQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AoKjACI+BQ0t/iCTSnaeCeZL0VUkjIlbPm9eHZc8yzrb7B1uPNAG6TuZ4jT+Y1+EP
	 01LuJPqGtt+SVAWSkoPqgpXZm9U9WAQkFc6Kvjy08AbmleItojeYAejBr1wrP/OflL
	 kswuC4d6jwqxD8Phl8M2I+Y3JFRnOyVZDYH51aCQN7+fJy4104vF2kVaHdHXzR/sdW
	 Y1a5TPNV9YXqIeo9NGlunMk8qvhhrlxrXPYVvZ+XBDd5vidpU7dkNX3vX5a6qSoHds
	 Ed0Copt4Jecygq+J7BJsvUVCMLHskcJEdlv53J/+kHsmkgwRKZ2G2cFI9EkI3uHb+6
	 bc8GTSk6e8gsQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 09:20:11 +0000
From: Demeter Barna <me@fromdisposition.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Michael McAllister <me@michaelmcallister.org>, Srinivas Kandagatla
 <srini@kernel.org>, Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: qcom: q6asm: Correct the 24-bit PCM format
In-Reply-To: <16b8f649-f464-43a3-b372-868351df9117@oss.qualcomm.com>
References: <179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org>
 <f3485a790ffdafe635b84b5d68730dad@fromdisposition.org>
 <179416102230.53258.7301268454500974217.q6asm-pcm-format-v2@michaelmcallister.org>
 <16b8f649-f464-43a3-b372-868351df9117@oss.qualcomm.com>
Message-ID: <8832ef4d735b3fcdf48a2bf2a9997975@fromdisposition.org>
X-Sender: me@fromdisposition.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-15 13:12, Srinivas Kandagatla wrote:
> Can you please try this change and see if it helps. I have not tested
> this myself as am travelling atm.

Hi Srinivas,

Thanks, I gave it a go on SM8350.

The DSP takes the V4 blocks without complaining, but nothing changes for
me: S24_LE playback is still 48 dB down, same as without the patch. I
played a 440 Hz tone and recorded it with the DMICs:

                                     without    with
   S16_LE                            -25 dBFS   -25 dBFS
   S24_LE (bits 23:0)                -73 dBFS   -73 dBFS
   S24_LE, shifted into bits 31:8    -25 dBFS   -25 dBFS

Capture is the same story, the samples still come back in bits 31:8.

Michael's v2 does work here, for what it's worth: S32_LE playback comes
out at -25 dBFS like S16_LE, and S32_LE capture records the tone at the
same level as S16_LE.

So it looks like this DSP just ignores mode 23. Maybe that depends on
the firmware version, but with the firmware this device ships it doesn't
work. If you have another way to fix this in mind, I'm happy to test it.
