Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243189;
	b=R7TZYu23/cB4U+uQZhzRJ6WvAVoLI69SkS2HTdGNoNSnwqbmxkegDvFs0u0z83gEMDxo
	 /Lq2mwuJA0pNMqS6g/zKK9DvMi+1kYbnGlxXDEucADbgjJAtTeHOlFp/44dXJNPHuxRWu
	 GRTSflLVX1jMxf05dKn5WB8um5CE/5TRxW6tedQY01hbHj2mL8djQZkaYf2qUXTTv+oPd
	 1w+OaDJTYwtgmu0dY40+N8dp0V6yES4OYbp5gA3Ge5z2btAEfvzkp5Bfoel74gmems8li
	 VaEEqDfsX7LIXIAZNt5hPtltVGy03gRkCk4Wu76qWBA90UX3FoXgrZZh1c/JwPIApVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z7vOdYC1HqFK8JixxA84vEBBAbwDaoWom/YZ8hiImMk=;
	b=2WiYFGRoSGlXm8ImvjySAdj2n9Y93WprdrQ4a3gzP1ouALbazIlg7gwiUR951/i0xQPH
	 ceYlW5g2by6WJHj9Ug9DYfTkXZ9gY5bZQ/9/N3AESeeEXmRLCZkMn5ZqSQXj2SHNdDqnE
	 GL0n2N1VUFgHeK1q6gU/6Cz/miThd+hMbnl/F/ir5pY9wluIE9orjjQvhUFB32VTjrKn/
	 mc7/OXgPE2qvstFsc/P6LRUJeNhN+ZC0eJwJNrXee7/JIVGLTGVFg53rkbEsDiM17ICKv
	 Aig7i2rK6BiOY8zh2GLUqDOMRPPGtN7LoDG9TOf+sicyxrxsuXlSbefFsYsNrzWgl8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPjpfpa3;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5B0606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE5B0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPjpfpa3
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb681de50eso350357a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243188; x=1794847988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7vOdYC1HqFK8JixxA84vEBBAbwDaoWom/YZ8hiImMk=;
        b=TPjpfpa3a4JgJaOvtDHt5n8VroAk7b3Y1sSBp7zORaF6eQZt6aofksUZ6jVxk7dUQ2
         nZJbathGaa3Paf8pNkn4BS2iweMyUm/4KEAh/3phM1Xc88scV9XchMReJPvCpgqHij6/
         vdi3SE83aFnnpcxHZZsqwgu+WG5JuWULDTNb42iIipydm43/pMLODFmjTUZfNO0jcVsW
         phGLaZDxPpNXMyl0Sx0eFXiYsw/3zRJMCTYmSkMXRnBO+t19AiHDG4NSTIa6s/19kZkT
         +VeGb4uBfwMf7UiTsF09uMAC/ETbhfwmj8qp/wZ4nw8I+rX6XDplelwj3+2nLoQnMZn/
         vt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243188; x=1794847988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7vOdYC1HqFK8JixxA84vEBBAbwDaoWom/YZ8hiImMk=;
        b=Iz1gn3uXfFfdGjBFZQ0RBAxgvJrZM4eBaABFoVuvgOiyEqXPE3CeK8sANuBl8fOM9a
         rE6TF7BAlyzMOSpFvFJSS1n+0fSeqAHbf/8qi9xCXxfTKDS+AgnK9TmoMYuParn3RiEk
         PkuHiso9aXbewZVmsNDgFp82WmQtwgeYhjB210Ef0/+iPSQ1LoDm/MFbr9bihnf1nBSp
         2eyj7Mhcsd6a9lnXjO8iY3sEJqvUTVGJdjvBdR0daGmV4UdMMRqHZdtHhvb7VHJJf2Op
         R6lHak3Z9luAvrioIUYO7cDBTJVGV9/nvnLVJd3do+E7L0QLWNKhCL2JSlreSpNftXmH
         HYJw==
X-Forwarded-Encrypted: i=1; AL+hErHwmleN6wkgL5B84Jypxtg5ExHptin9toBLZfZdCBEVEVU3V92P7DonqncHsV060yjsHIAjUxtTiX6YsNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h+QALcwKpre0wc9z9O3Q9rX0NyTsk1VEKIKcug/wa7DOkftHW
	o6iRnjTOMOt/7ALKVBgomurG5Vxk6FBEw8/2XVCgE/n7GqL0HdEwWgcn
X-Gm-Gg: AYBFou37XpH9gA1f1DVNkFD1FMwMEfPsNMqZF/r1yJ7pFZInBgZdArTy8lE6Bi8mHLe
	aXyvHideOOlN3kIW6lz/b2Dv+4ftz8ZYlBJFfhbBfkHs0j31ZVxsS9rIa70BobyHaGIsOGCnjRv
	4iIs0+0k7IzAynyTpFs4Pk9TTej6H/G3vawwATLeAzNH7hWAFHXFEoDFyw8nnTIR7rZZCZtB1re
	U3W8iQOmUMiNrVN+FLLjn/e40vsgP82ZGd0CRKG4VCNOkRf92nmD6vuWG4kHqEfNAXq+QVFImBs
	LKMFYAiiA1j5vOjgIkKpky0ExdxSygtPHZz874KADqgVdIW4JdX05XQd++YyJuUR6QJGHUGFyI2
	GfgfzMKr1LYnh/nCJpLUrmZfPxhQtV/fykNqC/XuJBcYndc2PW3EFPcBU71aySzgjSGVXfYDDxe
	3/NBBclFxCGDyCMqDxx1ZLZYAJEiiAvXsdqmRCn9F6jljzwtB5ZRVNRfIwlerlC6GcPZ0GYwywt
	fErLwDfVguHHi41NOVwQD1p5ukkSmvIkP6JBfepLxNBjNVYqROrIBFc3+GXjNxFW9RdpzbYCmq3
	XlpLRCZW2/npsYPrTOIL0/fbpUf0NfuXy+rW7O9pbO4lA3McTO8HIlMyE2IyvFYqV09aQ6l40sR
	kiA7Wh2CuhjjyGSVyKuPeqPwOfw==
X-Received: by 2002:a17:90b:4ac8:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b166ce98e9mr249063a91.54.1794243187918;
        Mon, 09 Nov 2026 08:53:07 -0800 (PST)
Received: from debian.ari ([152.56.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm6455688a91.4.2026.11.09.08.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:53:05 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v6 00/11] iio: adc: ti-ads1015: modernize resource management and driver setup
Date: Mon,  9 Nov 2026 22:21:28 +0530
Message-Id: <20261109165139.30803-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
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

This series modernizes the ti-ads1015 driver by updating its runtime PM
handling, error handling, resource management, and register bitfield
operations.

This series builds on top of Stepan Ionichev's devm error path fix [1] and:

- Replaces SET_RUNTIME_PM_OPS() with DEFINE_RUNTIME_DEV_PM_OPS().
- Sorts the driver headers alphabetically.
- Returns -ENODATA when match data is missing.
- Uses a local device pointer in probe.
- Converts suitable error paths to dev_err_probe().
- Drops unnecessary '< 0' error checks for functions returning 0 or an
error.
- Converts mutex initialization to devm_mutex_init().
- Transitions runtime PM setup to devm_pm_runtime_set_active_enabled().
- Removes the unnecessary ads1015_set_power_state() helper and uses
runtime PM helpers directly at the call sites.
- Inlines the redundant ads1015_set_conv_mode() helper.
- Replaces custom shift macros with FIELD_PREP()/FIELD_GET().

[1] https://lore.kernel.org/all/20260529183708.17819-1-sozdayvek@gmail.com/

---

Changes in v6:
- Added a patch to remove the unnecessary ads1015_set_power_state() helper.
- Incorporated review feedback into the existing patches, including the FIELD_PREP()/FIELD_GET() conversion.

Changes in v5:
https://lore.kernel.org/linux-iio/20260827172100.39176-1-architanant5@gmail.com/

Archit Anant (11):
  iio: adc: ti-ads1015: use DEFINE_RUNTIME_DEV_PM_OPS()
  iio: adc: ti-ads1015: Sort headers alphabetically
  iio: adc: ti-ads1015: use local device pointer in probe
  iio: adc: ti-ads1015: return -ENODATA when match data is missing
  iio: adc: ti-ads1015: use dev_err_probe() for error handling
  iio: adc: ti-ads1015: Remove ads1015_set_power_state()
  iio: adc: ti-ads1015: drop unneeded < 0 error checks
  iio: adc: ti-ads1015: use devm_mutex_init()
  iio: adc: ti-ads1015: use managed runtime PM setup
  iio: adc: ti-ads1015: inline ads1015_set_conv_mode()
  iio: adc: ti-ads1015: Replace custom shift macros with FIELD_PREP/GET

 drivers/iio/adc/ti-ads1015.c | 237 +++++++++++++++++------------------
 1 file changed, 115 insertions(+), 122 deletions(-)

-- 
2.39.5

