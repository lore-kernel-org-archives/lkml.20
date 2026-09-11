Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52B0489FA3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134266; cv=none; b=Lo9hW7Tb3SAjFH422fC3GsYmZTpK1nG9HVbl+ojLI3gdXL1IweYV2g57ZlsUog1766oP4srKfQ/QbVOxgIpomHRSVTZPaghXPt4yGbl5Ctg9zUzVO8tndbQDIq6xy+hJaF5vdLKdHGrpVumxwlIzrKR6ZJVnYVoDETJe6+zlHDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134266; c=relaxed/simple;
	bh=mjF2BEVmE/cfZKi26LJxInRozzTj8lQQw4ZM8GginD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZ8raGx5+lhMuvTmQxInkO4RMfFL2ZU7K+Web9PSB/7rwKdViNO9cESLtQ5IUga+BnpjGnE9eF3TvyJnvMgmAWADi0bx4VIpyAtrmYWiT3W5aAaiiNezq0LPb0ek8kkcdc5FPhcovKrU45LqEOMv95o7cRN/d24aTVp/wAaZo0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtT/kMTH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtT/kMTH"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eefae4so2140915ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789134264; x=1789739064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1KsTdivOxtvr7J+dR/PNhHfipIhjRnfvGWIk4hbog4=;
        b=VtT/kMTHLCxwu59gRfhwmrzJVho2/IXMbrY6RTUAwpKFtZE1N3TNw1RTCczU/ZrQD1
         qTe3Mclr6ydqTJOCePBvUpHtYs/pJCUl5ACtHOd7nmxxS5woTzeZfQzfLBpGQZr5w2sX
         nVtwMZfqcb7S1UwVgFFz/cchmRRBM6/so9H5JOsZJZUzc1+GB3pBNJjUVrF2j7TSIqhb
         r5gIl7K5ZYDi8IriVwlEpqS7M/F0cw/wG3KQ9khDUNArmCACnBQmqxGKCnUzuOeQloOc
         yEpVRzGahEn56FGEA6PxZDoUYuVKDaOzZntEQh/KeehgMmFJ9dGmxVfNqt0wKnDHiCXA
         podg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134264; x=1789739064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C1KsTdivOxtvr7J+dR/PNhHfipIhjRnfvGWIk4hbog4=;
        b=UHSnNt+Q9UQ0FPr3PvzpAERiPgiZ2KyRhzyclqi/V6oCEd02n/SNiJdeLLscCP2G4v
         qJmGeC7huAM5z/EeeAlIqY8iE6BtyO8jiFLOUIE500mKHqHH7cwvYZZA32QKAoqHNPGv
         hXyxsyf/lvIBbmb0p0aVdQGJ6MrTVuTZYJrHdCKYFo8lIGDcYrPwO/3XacfBn7smVFH9
         4FBKT1U2sNaOhdsPN76E4FEagvYBcrfwkSidY0Hfl3PnW/ipfam8LJIBNFZ+Ks95wvEC
         2ZBuIBhRDqQT13DBUyz8eZ5Uo7qW7bd1TbRQn8f/qNAFV58tmDpD6MrvHiG1tQkV9DXM
         RUGw==
X-Forwarded-Encrypted: i=1; AKwUvBxb+P1nKqiFHlE+q0BgiiEJC1Aqqb5yMqGoeCm8MdB4arjpef43pvT3Tbt/uICXYCtMlq7qH6HftPKy3Q0=@vger.kernel.org
X-Gm-Message-State: AFuF++kTJl4Ih6MQxSSO7ykrdq/6Q1Phc8A6E3zdk9zfVwSOsaOSKBso
	kMwq0VyApff39/u6eZQcGxauT/lgjXL8ANCLHh8Soap1ErO/OPdC5TMP
X-Gm-Gg: AYBFou3uf0f39lbPdc+BgvdVcq1w1SFexubcI824xK0kQ3pOjCsD1wTNOXBDoMl7keT
	nr1+TxOqWyT6B83/JpfHbF1pqv8jRSe01AoF/NyJDygjrgiQ8wa7VdtcO0cY2sORZyQ12HLyJQd
	eUvlnd/VdGTBAwPf03z/2huo05q4AsDghDppYq5jzgVFQ0PfFAYiVwCtuqxQBP+TBzR9KWe0rnG
	tzmoWk4AbHL2Q2fJLjpWgn/1AwoLMjwRg/oVlMdAbkJJuZ2Ly78bMFhFAoYwRahtjaHDZUpFsku
	/0prVqIzcjVywxXo9f1qr8Oud1peN4J5nvsRQIHcaCqBSEqHJbuqyjDjy0ySm8TeKKDjW0vkZAs
	4/Lv9jVmjNLUMCI+p4VBwgVm+IqiSJN9TUbPV1riaK7REZEFbegquTLPK5/En9icuiyAuuUf/9h
	2xkzUY06aNfi39T0M18AIMPBF1tPt8FlyBjjQvUi7DD7GEJ1V9ktE//gWqnK2Aog0siW3iOUMxe
	A5LJn3EKHlpzHINENn8zm34yAe3YwkFCKm3XNuYTd8sz3Ggmv+ZhDqz2U2SXAs7ED33EiOufAKN
X-Received: by 2002:a17:903:2f05:b0:2d7:4bc8:41a4 with SMTP id d9443c01a7336-2dd2a336477mr45257095ad.10.1789134263808;
        Fri, 11 Sep 2026 06:44:23 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfe815bsm11666245ad.68.2026.09.11.06.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:44:21 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/alsa: Test writes to IEC958 controls
Date: Fri, 11 Sep 2026 22:44:16 +0900
Message-ID: <20260911134416.1860354-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <21cc0424-8b57-4be4-9555-892b980d2f74@sirena.org.uk>
References: <21cc0424-8b57-4be4-9555-892b980d2f74@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 08, 2026 at 05:23:19PM +0100, Mark Brown wrote:

Thanks for the detailed review.

> You're using "grading" a bunch, I think you mean "check"?  It makes
> things hard to follow.

Yes, that's what I meant. Will change it.

> It seems like we should have a test that we can actually find this
> control, right now it looks like we silently ignore it being missing.
> Are all IEC958 controls supposed to have one of these?

I couldn't find anything saying they must. 32 of the 36 writable
Playback Defaults in the tree have a Con Mask, Pro Mask or Mask sibling,
4 don't (fsl_spdif, fsl_xcvr, uniperif_player, stm32_sai_sub). The
driver docs only ask that mask and default share an iface, and
sound/core doesn't check. So unless there's a rule I'm missing I'll keep
the non audio guess for those and print that no mask was found, rather
than fail them.

> This will fail without reporting a diagnostic which isn't helpful.

Right, thanks. Will add one. I'll print the raw return value rather
than snd_strerror() since three of the wait_for_event() paths hand back
a bare -1.

> Aren't there two cases here?  There's the case where the device
> advertised a mask where we presumably know that the control ought to be
> writable, and there's the case where we just guessed a bit to write
> where it's more legitimate that the write got ignored.

Yes, good point. I'll split on whether a mask was found. With one,
walk every advertised bit except the layout bit through
write_and_verify() and fail if a bit doesn't stick, same as the integer
loop does. Without one, keep the v2 guess and only check the event.
That also means drop_events() only runs on the guess path.

> In theory we could also probe every single bit advertised rather than
> just the first one, that's more what the tests for other control types
> do.

That falls out of the split. 11 writes per control on the HDA card
here.

One thing I'd like to check with you first. Failing on an advertised
bit that's dropped turns three drivers that pass today into failures:
au88x0 (mask says 0xff, put() reads only the FS bits), ice1712 on Delta
1010 and Mediastation (mask 0xff, no put callback), and rme32 in
professional layout (mask advertises the whole emphasis field, the
converter reads one value). I think those are the mask not matching the
driver, which is the kind of thing the test is for, but I don't have
any of that hardware. I'll go with strict for v3 unless you'd rather
those were reported without failing. Happy to do either.

Thanks,
HyeongJun
