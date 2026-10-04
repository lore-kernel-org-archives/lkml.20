Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A349B377A81
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791110627; cv=none; b=NPYuxkzrh85iNh/NpVS3axGr35h5lqe3kKfYwfoaYeBsLJlb7N5dJmYxHBaxHs+atp5hEAeaB2tJI4Pl4RQ6+T5JdZ+jqx1nd5Y3pb1GZjqiA+DvWmfOZK48jCNQNmMy7hPxUdrlqwGsGPg3FrUPjEn96FR+9en3vEQOf0uYnr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791110627; c=relaxed/simple;
	bh=hcocD3BnT8CdOqPzpyusgPL1v8JIiSzrfyMqca98N+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g1cRV6UsvvAZmJEZSXFbtknBiG3MAJijWT+ZMoekHM/udMyFfCYUQeD/sCU6mqCAWoXLL9/8mdj49rtxvcaY2NGRtoW31ZoyZcDRXtA3t5DIYrmm2SOX30F0hQDfrvOoAFprJJG2Quzb7Y4yED1cLngM9dq68p5spColjxORclU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNcBohkK; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNcBohkK"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15354aa70e8so1801181c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791110626; x=1791715426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0woykvoAO5TomuuBQM4gQruWpQXJsME0/h5WzmLnGHw=;
        b=MNcBohkKNp6ylOq6iuUosYRR/dKC0Bq4Fd5MojzVrixqzPAEnDB4WoiObzwkeBpa0C
         RoSlCkEJV/XZ5XWVwadn+lasX5L7iQPHSEozAJoQGHATWI08mW9vJlphWJy3Txh1sm8M
         DMtd8IDMLHUi7QU53yQRKWvq5ZmOoL4RU3ZGPxYSasZMrlob85ib4LQItbCC23DLl8vW
         F18fRjzzV7YHKh2f/a9cBlsrTXHdKNSrGJa29SvDOeUfd5YA03Zp/WToktEwJT8t56g9
         plqRmpmyyESH25BNDpRNwOFu5nFT2IF2nVxYlEwqkR+vxxg2LtjahblmERWjqyacLE1R
         WOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791110626; x=1791715426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0woykvoAO5TomuuBQM4gQruWpQXJsME0/h5WzmLnGHw=;
        b=HO/na0AJmE+XCkBU+NN+Fx1M840/6mnHJh7/nc2LhPQVMYdQ1haCO1jaksTcbhVQbN
         i9o8kHitjHqREuodRPgxVybBC/4dOFmjfxfwLzE2waX3U/vUSwiQdME1jPRWItIl9vAh
         7/hT5oVsS33QrVsuaWX2K37BsT3OmAbFCAJMv4F7gOXjj7XjYkDgwbbvql1skixPEnro
         yVVJCHv47iXf629xElcFx1nKEPe9RkW44PwmMaRqjKNWv+L5WDGLFIzA97KWNLlFdhDC
         LM83udoL6fVzTa/eiR5KcSPsh6JoYSzq3HCR2QaVAcb93EbFplTl7W2echhB2tuL39Yl
         HDbQ==
X-Forwarded-Encrypted: i=1; AKwUvByrlWCLxLp/6HrJgTlQSgEqb9gXTjFn6kpxkHLcxJimpB92ni1g4XM7rPNmT3+JQ/RQOYTHZuHVu6rv9ik=@vger.kernel.org
X-Gm-Message-State: AFuF++ncXKIqZ5rKUWLghSkfx2XODW6/t36+wHAR2kUUfOtky4aWjLnM
	QBnRokwjBXHp2m0VF4O6le9Or491BpW7BjOi7CoHOYXWAE6mTGy3ElIq
X-Gm-Gg: AYBFou1CDtooTtVy4BdYaIdPEVJC+M5nL2vncr269w6piPLQQcJxCJQJhwRf3EJiMSs
	tc9uPbq0X6AvlmRCaSct7pE0wqlq5UdHD4+IXzqYnxsOEYj7vlsVW9gbfqNhzIRPR8LXp9xbTFJ
	8gHQv77m2y6c71709tUB+6EA66t+KpQmBlKNOTPHz5xAFSZrMRfb9vwzWLvX5b+L4PCufURmJ+9
	YGgZaDPqFdE3J5xdBHt5Qe8AeT5hih34ABOkvzJ9xeMO8zFxaT22/U7SAWwA6AIu+GnHUgGxDiv
	Kvcbivm9J5pzLx7U8JFMWApdoby8sZ+lfMcCs22u7DVCRehEa1lT4mYLLLzE9N13wLdu9FAaJMk
	Of6XPNy4aUtpRs21mvY9yMtN4VTaVp/kmHDIg7LIgU9SOUku1ObBdvcT5hvnuNCRTH9G8+u32Nq
	NPS+0aI5aBQ2Xejrk7Hiuv9B7vOvoTXqP/qfFHgSHkT7fwKldLOGXYt1v7U/J9V4iBjnGFv9s3H
	naJy/Mhj0ATCdcqG8FZP7oFTsjtBfELm/qOl7t5puRty3ffObyklobJeUun1ucNqB29BSp00r0x
	fjffXh97E2FkVLEs
X-Received: by 2002:a05:701b:2514:b0:144:ed03:8972 with SMTP id a92af1059eb24-151c32ddc15mr6493829c88.16.1791110625561;
        Sun, 04 Oct 2026 03:43:45 -0700 (PDT)
Received: from kapoor ([117.235.129.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272bb9basm4019140eec.24.2026.10.04.03.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 03:43:44 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: andriy.shevchenko@intel.com
Cc: jbhayana@google.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	geert@linux-m68k.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH] iio: common: scmi_sensors: fix truncating 64-bit divisions
Date: Sun,  4 Oct 2026 16:13:31 +0530
Message-ID: <20261004104334.82610-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <asFW-3IPAgFIDViV@ashevche-desk.local>
References: <asFW-3IPAgFIDViV@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 03, 2026, Andy Shevchenko wrote:
> On Sat, Oct 03, 2026 at 11:25:55AM +0530, Arnav Kapoor wrote:
> > Assisted-by: Claude:claude-opus-5-5 coccinelle
>
> Assisted-by: LLM coccinelle

Right, I missed that the documented format had changed. Fixed in v2.

> > +			time_ns = div64_u64(time,
> > +					    int_pow(10, abs(tstamp_scale)));
>
> It's fine to have 82 character single line in this case.

Will do.

> > +	*hz = div64_u64_rem(NSEC_PER_SEC, interval_ns, &rem);
>
> I would expect to see this be a frequency unit to help with left side of the
> equation
>
> 	*hz = div64_u64_rem(HZ_PER_GHZ, interval_ns, &rem);
>
> > +	*uhz = div64_u64(rem * 1000000UL, interval_ns);
>
> And MICROHZ_PER_HZ here respectively.

Makes sense, I'll use both in v2.

Thanks for the review!

Arnav
