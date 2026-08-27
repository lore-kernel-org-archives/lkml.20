Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2B01E0DE8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851295; cv=none; b=C6d2ECT7L6CZdOmp/ORZxqBETlpgs/4xIEn9I+oq43R4Jw5iZ5KI109fWq1W30XBxztvtbOadsvhBZb79g+LpGxodxGH+1Vr4ZTwopSWrvNR/9pB7Q6RrO2ZHMKmQExEhUQSiGLxwYRhvGRGzIE/Kfz8oU3wuEN+izIXwJUPHF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851295; c=relaxed/simple;
	bh=TUonyImlFY/rVwlfDRO8v/UDvMzUF1i/lMk0MIe4OQY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MGmpSwINwjNbP8Fv5zj7jkkcywhq6Hyu/bzCk72lVwmKMMYUqWQCs8HEPmywLBZLDly0cKEXafVgqhi5MTtEEaf8r23Ww+E6h3WzPV+17VGLwHoGHPpw6sX9vA5wFhXtUH+P0uf/9Gpt1ddGDIU0IYQu2nSzVcW/bfKFJgrtEdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pcw5T/F/; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pcw5T/F/"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso272556a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851293; x=1788456093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F4arbSueCZ9tfuttAJ7Jp1lnf9RoIfNdNZ1KOU8xkt0=;
        b=Pcw5T/F/ZBt9n41E+hERCR85NlqKpFAI492ZQceN39hdQCtM3T8eEQpf/Nl6Csi9QM
         S98cKf6csMDeaAgh/Se5zRR6/jXWQaYrSGvr6dk2+MAr0xhfcECiXJrh8TEBA7PWo1Lu
         O4gVuhMDKbjuK56klQ2FPSjg+XrR23s3XJNq/4hfw4J2oRQLUZJqiifBpzkLvsFNNjJM
         PD3lNjWVQWIpYD5SnL1ukcbmOTureBZhXanSkAuXa5mI/6pxCQcFll9vbmvqDco526TH
         Nim7+yaJyJ1avrt7W9DfkM1nct3cei9TYhr38766VLT0NMpkWlOl8M14kGrZvhRIdrfk
         KSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851293; x=1788456093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4arbSueCZ9tfuttAJ7Jp1lnf9RoIfNdNZ1KOU8xkt0=;
        b=QyWaqE/1OsfioR9M1eWjq15R2qpcAL4G4Dvw8YKbP5UVWMv0IKSKMKCrMGmTHyInwz
         PI3vp3WSEg772EhGi4RP5AOowp+CHFX3q+41bxpKrbz0Ciy3C1tAHZCaYh0lh8Rk7am3
         OJV8eCKiC7OWRYd/6V5eCEB//EY5388vp+lfn5/h/sILazhM2Z4EKp3EgF7fHIHSGNnG
         1D3qDchX4DDQ4CXI2wODAJfDhRtg6xDs7CYCJvj4S+s3UtB/zSffL1VVrNt2UZ2BxsX5
         IteQ6myJ2H484SAUFFbjqKJsYxTA0G++o53BTCSf68tn+KRUUs5R+VIUbvpMy9DS+JgJ
         sIWg==
X-Forwarded-Encrypted: i=1; AHgh+Rrfqqveavtg9pv6MJLdp4MAmjMNsmx0VaE5laVB+luOcTMteRS9aQgN+5WJi0cFdMBU3VPvx/C1mlPWa6Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nJtajEpruo+ecdLkWM2AP9GQdxeALPD2QkMLdv899W0lTb8I5B
	+frth8W1F0cIEl2SkmnGtwBHcQKdZhOiIpnQoXMjHWOcJPTzgipRxMX1
X-Gm-Gg: AR+sD10hmp7XtIboTZMJz/+xE7Mvpciu4LzTLPGC3ybSeFUGohWs0A0GfnAoB4W5B2J
	+l61RE/GTAjnpg7bJMhMwIxevmOmaWqjfzvQoFlJ5LGHNIgLMnlng77nAUW4WxP2/1KQG0zyxk9
	i0toUj7L1yQ8Bv/Mk+B2YgR+nzr7KqwTMeXfYW33wRawI/c9D1q99HLKjOkc5ZxxR3ByhHVhDHX
	zJr2EPyZ1M5v8ikSEcorYtYoszSWAkEOS26bmJ5QM1R+0c8zTDWmMCnwOKq78Q+/iDjO2aODOYk
	VhSgfB63L8tM3EPwZtP/5CDPvkNAwEePC56AnrGvJyuPE8pLNmaOmdyd26BdEj2QLubHyGacjY4
	D0ragy7nEGhXOHKXp1nBPSPyXkf/9u/jSWiMzVwpKzJoWtQeQslb7aaC1L/QmidsIoQyDAByAxf
	gxpvu9nhJDcN5r+gE4bAYAqlGLVaiK9Tj1Z3aw5Wc9lIp9YraBZTgM4CGVDAXdJWbl5aqA+R0vv
	3UVYRgWTF5iWImmo+WWTZZ1GcAdlNKHw+8f
X-Received: by 2002:a17:90a:e185:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-396d0ecbdb9mr1509289a91.6.1787851293068;
        Thu, 27 Aug 2026 10:21:33 -0700 (PDT)
Received: from debian.ari ([47.30.51.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eedd13sm17797165c88.1.2026.08.27.10.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:21:32 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v4 0/8] iio: adc: ti-ads1015: modernize driver
Date: Thu, 27 Aug 2026 22:50:52 +0530
Message-Id: <20260827172100.39176-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series modernizes the ti-ads1015 driver by updating its runtime PM
handling, error handling, resource management, and register bitfield
operations.

This series builds on the series [1] and:
- replaces SET_RUNTIME_PM_OPS() with DEFINE_RUNTIME_DEV_PM_OPS().
- sorts the driver headers.
- uses a local device pointer in probe.
- converts suitable error paths to dev_err_probe().
- drops unneeded < 0 error checks.
- converts mutex and runtime PM handling to managed resources.
- replaces custom shift macros with FIELD_PREP()/FIELD_GET().
- removes the redundant ads1015_set_conv_mode() helper.

[1] https://lore.kernel.org/all/20260529183708.17819-1-sozdayvek@gmail.com/

---
v4:
- Rebased the series as requested by Jonathan Cameron.
- Use devm_pm_runtime_set_active_enabled() for runtime PM setup.
- Reworked the register bitfield changes and inlined
  ads1015_set_conv_mode() following review feedback.
- Incorporated review feedback from Jonathan Cameron and Andy Shevchenko.

v3: https://lore.kernel.org/linux-iio/20260812164433.23011-1-architanant5@gmail.com/

Archit Anant (8):
  iio: adc: ti-ads1015: use DEFINE_RUNTIME_DEV_PM_OPS()
  iio: adc: ti-ads1015: sort headers alphabetically
  iio: adc: ti-ads1015: use local device pointer in probe
  iio: adc: ti-ads1015: use dev_err_probe() for error handling
  iio: adc: ti-ads1015: drop unneeded < 0 error checks
  iio: adc: ti-ads1015: Convert to managed resources
  iio: adc: ti-ads1015: replace custom shift macros with FIELD_PREP/GET
  iio: adc: ti-ads1015: inline ads1015_set_conv_mode()

 drivers/iio/adc/ti-ads1015.c | 153 ++++++++++++++++-------------------
 1 file changed, 69 insertions(+), 84 deletions(-)

-- 
2.39.5

