Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932817;
	b=MCDyRxfJf8whnMAsR/lN+NevZPTBnDLfman3Jvz98Rm7iNJdvmlr2yPSkaqTaCrddWcx
	 2HUExhkOIFu9/MdD9AL2xVMtotj0r5ctyAK+QVgITT87Di00MmdSjYHiXBfqlae7jOyt2
	 5jvZUvljkaeWgsuXCuFjIVsHbJwU5wKb2aFfvS49l/ByMrlWB4WrswxNOvUlE6HBDMDw+
	 29vHHwFdTtEPzmLQ1KOMeGn7MxBOEW2gMbdNx8XwsrdZBEYVHgMJstR8lCYAKbp1hQzUZ
	 4ncjkoQM6pj2YekODVGHkx/SSzSl3w3VTEkP8Ad0O7k9JYUp1wrToeQOOhovcDVaoBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MK0x3nBQPvSgNRrTqRWrccBMM8y8IU0drMw0at/VEos=;
	b=Pmr314EvshzcJZvh82VBvTPZwHP8S5QZ+7C6yKrjvTADlvwWOQSeZPAphU3I1RV+NVCa
	 CP6qZpSJqq225WXgB8LcUGQG+Zhcev8fmtZ/odKz1tnHBZLfixNjtM0hjhiotMbmmI7c4
	 9FpORYRfKjQRN7l92f9zt+LMArsYgMnnWkq45rC7wM4EPW2zIsZ872Uhsey0dARGMAg9p
	 bpduqq1JngBqApFzLMAE43+muLEzDiLTW2/moWS0Q80HKebPUHczK47Nk54Q9DWgb5eD8
	 GumUJ/ql90SDwPVXsHzo1U3Q4iQYYWAZc2zl0VKEdaDxv39TaimhKGKgUHegbGSlxZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBjLaSaD;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3E2606A326
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC3E2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBjLaSaD
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a215e64962so14503375e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792932815; x=1793537615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MK0x3nBQPvSgNRrTqRWrccBMM8y8IU0drMw0at/VEos=;
        b=FBjLaSaDH3fZfQWRluwUMgZreHqpA5e7QVqgiXVE2TBAvUPiYk+tfdCfjqnU4S3IVT
         w4FlAjggUyXYJYQNf4Fn6e4aASunt1Q8VlqmiI/nSVuZTQmcX0oF36lV1a+mEQ3+NBM6
         EWwEjfO++fjR5dR/RLhuUe6X+aK4Dbk0y2i2wtvyOoZgUZbbOH9lqvv/CiLxYl/nlAHt
         51YIVXvgOd2nbXsrgBySQCexfP2tbToiLV11Rvp1uOUX8TUa0gVSQXyZtG9FGN9jc7dh
         DGvFZUbihe/jP2Jchjf0qMxHaLtc2sJAqxPmhUpqZHr/0xQkBognGoyFQxm315GuA5B6
         70hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792932815; x=1793537615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MK0x3nBQPvSgNRrTqRWrccBMM8y8IU0drMw0at/VEos=;
        b=gX6/f+MnM5fm8InwrTfAwB0gsonY+8bJrkYH74b5oJ1Rfw7OI4CTO/BsduLpbrBicX
         op4aw2G4l9iZv4wo6SeiLQfqfT/IfRfOrQLbWwEjyjpIRlMpXEmpClpolPmI+nTExZZb
         nNgUJaAgjBWDAVESHRyskj6hvzw8tPD9ng40oBV0uaImqlGD4KwucyYWFdal3WRIbgG6
         ZlnboNPub6DuTC9lDTrEgyMdzBO/tsroOn5qb/vA/B+ilIu4J3B+C++/MQkILu3FiO05
         ZIpD67iXJ5Ycm6U7g6hg2VKkGFotovUu6d2HIIBy8SI/PIv3YH7bZVN/FRm6FcjgTf81
         30Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxU9CanQmpMAA/9ol8cSeUC1ZaFQsmEaf9BU4WKyEGxzryUgKm+914MO6/eM8dgfmnJhHq1Ywj9m2hie5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6pgzERAq/TvV+YnzmqKO9KnHSTT/tefDMAyLqg9b31wXNsX3Q
	JZ5Z9J8jZR4gwkidvSvYNWotsQJISHwy3lPxU+U24t6inXUthGwfzJTX
X-Gm-Gg: AYBFou0D0+3IU2aCfR15ATa+NfkOwMPiEYNJvvdHhH4S9WME/sH9dfHZRk2dXoFORNM
	8wvS5XAz7hILcqet7axhiCK3VXTHJH2XZhk92hI5dlHYyuqaWEtYEikdgXC7swUHELV8GZosVY1
	u4bGPF5rglL8XYW9IMoV1VIwdubKwTnIufVPxs2TPS/fqCylK7a0PSDfWwm4AIre0dhKgI5X5Mk
	coUMXUDAmdBVzKDtpEkNYwM1KTFmtvfjS6aF7rit7cIZolbW/omxgEC1KYJ5mcdNY/FPd7duOrm
	BOCC3CgpiLjhh4p7/g+fXqmqAH8nPeYOst5hnhDK7dSS8cTEWR/NLoWu5IV8qb8QA6552lxsyBE
	MsFr81WhcYfG0OvvjirdQQqZlIY5ryjLLf+6zhncZACs6W+Iz0WpNhccRYTlimCyi3CUU8lz7PE
	rTPAwcmxB9fH+YhwkN81bpdQnkITOqNG8HHW2SIu5qBgXgL3Da6G8tFHAvutsK1nkxE/4U9gXXy
	2orEkTPTF9WfdUwbSY9pkR06A4upyPbhU1Ci7+QpRgjl77YWXimwFuRGCTK8YLFTQIenEEqdNqf
	Z4ULUwiky5iEgCsBjN1SyYlRz/z0J1OC4zJmOAdwj+jZzR8KbeDGj0tFU+Fv+k0mXJB0
X-Received: by 2002:a05:600c:c110:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a35ac91142mr63664005e9.7.1792932815147;
        Sun, 25 Oct 2026 05:53:35 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm9792478f8f.16.2026.10.25.05.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:53:34 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: lpass-macro: release macro and dcodec clocks in runtime suspend
Date: Sun, 25 Oct 2026 12:53:33 +0000
Message-ID: <20261025125333.208382-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f17f962d-22d7-4a88-bdcc-9be6556040f1@packett.cool>
References: <f17f962d-22d7-4a88-bdcc-9be6556040f1@packett.cool>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/24/26 Val Packett wrote:
> You're working with a tree that's months out of date! This does not
> apply to linux-next at all.
>
> Commit a5ee3180a2a7 ("ASoC: codecs: lpass-{tx,rx}-macro: switch to PM
> clock framework")

Thanks, you are right: I was on a 7.2-based downstream tree. With the
PM clock framework in all four macros this patch is not needed, so
please consider it withdrawn. I will check against linux-next before
sending anything else, and I will drop the attribution tags.

Ramón
