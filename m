Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044510;
	b=J9CYC4yQPXOtGiOGmtRd5P7Q03NDQTDD4eeR1hlq1eXRtWJTec3hc1KsBvmuLiPUveTV
	 EBQtzHPemO9ZKnEmMg+Z2w+hyt+Oc1dLMjBMM5m43EUk0mLIRpR9LRpyA2YghL3fqIhvW
	 QXbG8ZDTbwrKL+WSyohgNJ3d/sPK8NxYa+7p5LcBJ7ohvEUw55SG6hwVxVCSxJ0lmjJKY
	 96auS1zjJ1Vwbj5UCa8NSeHXxH+vvcoP6ZaWQ94U1/Lr3qh3g21UeGDJb0INBGvlsWKYa
	 q16K40V/rroMs4D40vAWuGOvGvca9ywqHpK5CJBN+H4690kYx3G8GSTdET+gEY+kscA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zNDsPiw4j0+WNidf/YoMdMZHFxZqM2vx1Wj8dYRujeE=;
	b=diEZuCAyJgX9H62LS+DRDiGXA/KDZb9HPXIr9Q1HUnqQd72uvBhfGTOXdAPWtdclSwvu
	 jzlL+Mf3HQLKN1YGY613gAS416Wz9hF2FkKKBoXvN3TlbJZJm6UTV/zpMQQx1l5IJw+3m
	 JvOrbp4fYGU7sOnwhkueUYdgq0oNYMzOYji1ZCYN+CHxPmgB1cgDwphgNSP0IyVpez8bH
	 BAcPwBIkzd3N3hxO48ppfNLnduf6M0PqZlmUIhq722vKhs6joAVtseNhbH9GaY9ZQLRH/
	 eDgWngvTzBSyUbA0XcRQTvF2YRldJyZSHwftH74qz3BPYDx38OAXDF/JbW/q55nGJmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTHFVLQ7;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD65606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBD65606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTHFVLQ7
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36dbde64409so1980196eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044509; x=1794649309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNDsPiw4j0+WNidf/YoMdMZHFxZqM2vx1Wj8dYRujeE=;
        b=wTHFVLQ7lIK8cCXieQb/LiXf/TGXT18n+melB6SbVAQtrewoWsMtNSpaRRmmiyMWeK
         J3e1fUnsbEP8O9GbYUo/qnOn+pBmltZ7VSr9piae9TDTbJrU0jQtR+beThqNBizI/sA6
         GrGAgLSo7K14uD7iFbhCW7sLyanqbul+D2aVIhub9Dlv4Gw0XlaeZpopOALiqhKx9cnl
         7DUFH2VjVXCWm4pRAyltmscVNmpz7xeYGdQK85CU8Wjjb+9KqXahF7I3lWNkBWZ0ec7r
         Pmbmb8PjauMHCuqDUm/s/EmQu0qje812wBNU/IdF3mizlDBgEvAWH308u0N/VyaWT37k
         fvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044509; x=1794649309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNDsPiw4j0+WNidf/YoMdMZHFxZqM2vx1Wj8dYRujeE=;
        b=SDw7ePNjj5Cs+U58Elxyb+XJrlvMomd1sMQt/pTwgIUUJV/JH/EcjmZSUNkPsVbOIM
         7L8A86ZBlhMHl21VYTC1jKaz74OyPIimCxj3kqbfJqsGNHIW17B4R6Rr8wSNCG34+C3Z
         wHxpSt8t/6iYle7gD/C/UfuI7lTmIesVXgkduDJ4b1AzznGcMD2zLXwNcwLxmXmTBxPM
         yfuRi9WinE3mTPYYtgQYkWIbvjtMtOk2Xs1gqptH5T+t2S4D3ia8Uoff0/yjZRpMLARv
         fsFjywQpb0Sh2hL+uQKFmaVnQFwKbsf4jyEaGZeMb45CiCGJEEPKitNdji5ie6UEy2K+
         jDhw==
X-Forwarded-Encrypted: i=1; AKwUvByy792n0Tghw0t1S+vso6DyAXKmabEjSZg9DFs5XHWwuDqoVTXsCyQ55ieABwB4kcVJJ62hnyfI5ChuxLg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h7UF6jhvHUXWEA/IoyjvZtp3un5RYdyqv9s9boQhfHTRkvmkB
	BGvuNDfi0XW/4giCoX06ZDd9JkTpPjTSNCAq+QFmO2ZYEKwg7yKbiLwR
X-Gm-Gg: AYBFou1lJUXAq8aIdDqtXftyHgSEVjxztb9GcZbTehyRXIEvGJhNMLd4zvgYmGHz9b5
	D+ApwbBUEM3CVQqHfEk6f+pJSiqBcNIYTJ5i54SnYMYyfPBxv81XsmOYibEw55CJ34mlJmNOOaa
	YkzUkZZSouOSeJGGip6knT39+p+FauULlTmV2mnWoLwwG9z5YjZ6fQa/SxDwtLntV9ZZ5/0sv/M
	36v/S3XzsW5R/cdQtDeFNAlI9R4xoEHF+0hnvwcis4ClqGLytZtFMMqfL7LDxxa7ZYiVgRpMY3X
	R2kgQ/Hz89zpZPa2pVUy40Z7BKioILgEqJkLWInT17nuTT/4xJZ6BoHqtAb58Xh6lOH1V7ogJtI
	8b6ONQyM3Plhg8zJFVu4YvmHrKJXpu3tuTA4xP9LlCtcyOhlp8V9prahnyp4i6UXSlnWMjpJnKI
	cStAYSQWgVGXkNL7nbYS6ZUE6WMhb50YXYss3ZacnVLa3IMFpPHkJtRZ/EU32AxIv1fGeU7BYTX
	O6jfbu8GrR66j9ZDccX61u4jdeHKYO4bOrmv7ISNp6wPRcN47DYJPTl4CPedl7Qy9Gdlv1kAKzD
	K32qFCC84RSKPQJOoE2TVDCUebhirwrLTDEaAA7DiBexVoqdUzRY0Md0488H8CjXog3yLYxCTpc
	LSj5kFAesuW2Bkp+oft9XcJNip6+rJtreuNdYxWTK
X-Received: by 2002:a05:7301:b0c:b0:36d:c3db:9802 with SMTP id 5a478bee46e88-36f76023a2cmr6744419eec.18.1794044508755;
        Sat, 07 Nov 2026 01:41:48 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fd0000sm12554457eec.21.2026.11.07.01.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:41:48 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] soundwire: Fix Critical and High issues reported by Sashiko
Date: Sat,  7 Nov 2026 18:41:40 +0900
Message-ID: <20261107094140.3951536-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103095445.81414-1-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a Dell Latitude 9420 (Tiger Lake, SOF IPC3, sof_sdw with rt711-sdca
on link 0, two rt1316 on links 1 and 2 that are aggregated into one
Speaker stream, and rt714 on link 3), I tested this series on top of
soundwire next at commit afd88e7ad781. Only patches 1-4 run on this
machine. The intel_ace2x and qcom patches are not exercised here.

With and without the series:
- all four peripherals attach at boot
- playback and capture work on every endpoint
- 40 start/stop cycles of the multi-link Speaker stream (10 of them
  after the links had runtime suspended), all links streaming at the
  same time, and Jack Out start/stop while Speaker was playing all
  passed
- ALSA pcm-test: 24 pass, 0 fail
- the dev-properties, dp0 and dpN sysfs attributes of all four
  peripherals read back identical (the words arrays are empty on these
  codecs, so only the trailing newline goes through the changed code)

With the series, s2idle with Speaker playback and Microphone capture
running: all four peripherals were attached again after resume, both
streams continued after aplay/arecord re-prepared them, and playback and
capture on every endpoint still worked. There were no SoundWire or SOF
kernel messages. I did not run the same s2idle test without the series.

These runs only take the normal paths, so the failure cases that
patches 3 and 4 guard against were not hit.

I ran these with Claude Code (Claude Opus 5.5) on the laptop.

I am sending Tested-by on patches 1-4 only, in replies to those
patches.
