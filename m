Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861665;
	b=c+4MetsljzPIn3GMp6y4UuhU7J5l+1NIuIaMc13Zf2FXx785oJ5YGcHqHODGSO/XYOYO
	 /0FZiBj3BUwYJkvp9PT0UvW5CSqU82LqB6mZMHZ0SVJMc4tGJs4BIpqnPsUzl+nRg6uDI
	 dtBuG9V5M7TmGiX/lltuzqWKYuj6euRF3A9GCj3BT1i6225akXPiUidGDONfF39dktN18
	 CxpcGGNltKfAMWqFovud2OXwmgJ3P7Y4EMwyysbXTKDGUN7j0B5OXrSma3g0V9ACjjd/j
	 z9ei7rUhCpxjOWpLfn9WTxdp69+sW4AOwR5CvQy1QqTY5e4qza3W59PpeqgP7EMgq9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=heu0s5zjpk0XxoTZwlmNXaLWRfZMoSQ9VqcGdYp9bZk=;
	b=luUMTFrTG55+4dBuCFU5PzgK6FT6VOZpO5C5B3tGXeamGKLoonZmRuo5llyKn4coNpD9
	 hDBmi09eyIErjhKB1OZcoUsu090WyYvNTMvmA9cywRL6Ck9SBwc5NIO8int+rmIErp0b3
	 dCtz52cmsgRIXopaSghrDYY2rwX80k/KeSF1X/FSUiix8Sz/FbtB5iAccPzU092cjPgQG
	 RWK3dfIOZfAo6Vw22n/5kG1ruqpKAsg1d4kEZso/DKksLAzDJOqoiqReW6ukQcv42pJJT
	 mEbNANV4qlQWLEyGmBQpRMfLjmBOTp3Aigxf1sLabyWJAoLz9lexuDQMqVnB2OTcXkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XW/dZMRp";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99A4606A887
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B99A4606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XW/dZMRp
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso2137835a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861663; x=1795466463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=heu0s5zjpk0XxoTZwlmNXaLWRfZMoSQ9VqcGdYp9bZk=;
        b=XW/dZMRpYlcTMu3EK5fSAbGYbpIvwUxofNRmsrggNENF52WOYMEOqdSHk+D2OaaOmO
         uFctrmRrGm/RS1XymcFwob3WMbppd53CfcFNnH6j89Gg/MdgXfS4qtYqm4AgXGfWrqXF
         8EQb62+eggNC3Wwj+9lv6sNkyaWsCLW/MJhC+nCNR/uQ6ogG90VnZBaurMlqWLbNxMPM
         lKvmTE1LWUvo8HHxUQFxjQC+wD4rfoFJnh+MP6603Kv2Mzd5FGS2drEa9OyiERLEg+BO
         EpyRgfGjwLikmUBSQkAxNAhITlo2bOJ2QZCWUHQzZxjUleJNZ8gOexj72hz4jnlNvAzH
         X16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861663; x=1795466463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=heu0s5zjpk0XxoTZwlmNXaLWRfZMoSQ9VqcGdYp9bZk=;
        b=MgBkrNZ6gKRlpoBtVtS7pr4b9N1CaWXTDLMX6fAFDy+PYpK+6/LXWL/5guUNxG51KH
         NeoxvUt4VzyVNqLdISxDJGWkUAttya9Lf3pmLi8BYBog4V2ufFO0MLkLWomim8Uqxn9Y
         6Kam26SV1txd5zqW5TlwETCwl/Y2cRCiAVJG8qaSfd5GM4pEAqlGfq38Alwjf0gGoUD8
         vndwtsxu2UywiDQdkbRJaFOvBUo8hlnmwFoOzIsISUGD/HiFJvbpqAqvaL6B3o3C7DCv
         tKTFHBJHC47bdO770vKVP+xCDR5OZXHEtDuhGhx2umOVXVMn2MM1Vt5bw+V7g0U5bd28
         2EvQ==
X-Forwarded-Encrypted: i=1; AL+hErElo8Qa/eykcRFyecJ+/NBdxMca4P9qYk+r0WLgqxAB30IIJ+frS+EulOsDlnRWJcbtTIpqCBWRh4tp0WU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PY94mVlKY8zKGB4Q1nKxM6ymvrKMo23YmpUIESQdEw9/8/UkU
	uoZ3wfjdZt0rh/enrpuV+DIgTf+rawr8pmLANr+V7Ke5xnnFY9IUx1+/
X-Gm-Gg: AZFdTZdrtcpZcStoNJbtXILza7RoSSDSAmoptV5pLubrR8io10ouCKbGHEcuBZxVl1j
	WLUCjb7kytiDpuuxJHSI+IVqVN6hWSsXaXE1HycdsbpmAA142/NyHj2FUpQDSbC/exJ+JTqoBaj
	ee1nvs62bhQlLpYN2kkGDRZ58mpH0TfkX84wbFMFLGWyk4h+Wbw+rJIZGxx/0DrFOtw/0z9bk4j
	Fkef39l6Ulh3uJYsbk/OyBflvpfWPXll/CMbX6oR4i7lUNXrd+yPv9HNPtr2LvQMQqEjYmx5S7S
	auJg/XcZQib3W0Zd8RZXYil9xjXM7ydR+s5Xccop+0MHdGkwQ+VLCCc/SkZUmHlsAb/J+NnVHUA
	/SO3NNsn3z4FlyCnxD54mxbuV2HaVqaRGuL7CYpmYoOFVKVVVEYZ5pL7b0rtRPyAjKUX1JjLpUV
	dyj951RViFwpsClzX3fuzP5U9SjY01IcXh/fgZL4YsVuCxCHFFnrO6G1I4usHgsQj8h17wQeLm7
	GH7wSuZo4CQ8o9QKWTSyKpIHfrZD8ydvd+h8roDc9JkAJn5AqhTuFL5DWwgev7288Txq2Ls4Xog
	AVUPO0lvQpMHLDeZPE/LFMY3jsRPqzMyFiPbOFpNLb+Qoax2gRKiR1BFnuFOL4PqK5VRHPYF7fa
	WvaHE/vrjWTvYv5439V1VZDwbyjb+mH1dV6QMD2rQSwf9q1Ip99SY7Ls9tKYDnI8BlcOYxSGxF1
	z+38w=
X-Received: by 2002:a17:90a:c88b:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b1b0b6049emr10406718a91.43.1794861663475;
        Mon, 16 Nov 2026 12:41:03 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a87202sm3833645ad.58.2026.11.16.12.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:41:02 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Morton <akpm@osdl.org>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] platform/x86: dell: dcdbas: Suppress bind attributes of the platform driver
Date: Mon, 16 Nov 2026 12:40:50 -0800
Message-ID: <c3e83cad97cd52fe9ee130630ca4d7cae7f7f2de.1794861287.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794861287.git.rosenp@gmail.com>
References: <cover.1794861287.git.rosenp@gmail.com>
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

The dcdbas platform device is created by the module itself and stays
in use for as long as the module is loaded: dell-smbios-smm allocates
its SMI buffers against it through dcdbas_smi_alloc() whether or not
the driver is bound.

Binding the driver again after an unbind also leaks state:
dcdbas_check_wsmt() runs a second time and memremap()s the firmware
SMI buffer again, overwriting bios_buffer and leaking the previous
mapping.

Unbinding or rebinding the device by hand is not useful, so hide the
bind and unbind files.

Fixes: 12c956c4f32e ("firmware: dcdbas: Add support for WSMT ACPI table")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 69365627fd8f..cd72f8c29a86 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -708,6 +708,7 @@ static void dcdbas_remove(struct platform_device *dev)
 static struct platform_driver dcdbas_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.suppress_bind_attrs = true,
 	},
 	.probe		= dcdbas_probe,
 	.remove		= dcdbas_remove,
-- 
2.56.1

