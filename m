Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993527;
	b=35LdBj5ENPk83mCyTYaOMpQIk1k7kFgfzfH1cjClEXKW1NdW+siqh08oSavLUbQDe1aq
	 iM4nkAUICkbYETn1n0AtM3bINvsodEtUt+r7Q3gvSde6qS3nmea/p31LfA/9vNd6wwmQL
	 byxWxZ+0MY3s/U/agbU0DQWD2h3Grkz/NAmWhf8Ieh+SLb1pJo/oe0sTaa3uBN+2Y2v7P
	 LDd2ajPojEdiJsDgx+eKX1Ou+RxCU2fAT+8xrMOI+wz9Gfe3NwTmW9FK4YRQRtRuLdYfQ
	 xsoEHFSF68Q7fXLd4mnCtnjUUBIBdebBv8ev7gkaKC1s1U/q0w4JoDkG48eMGASpRhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Iw0r9KyM9yE8+UHLOBvRU3eF9rfoOEr06pAaRlmDbAI=;
	b=UGl0oWFou4zuNN0VbVMx/ADPw+zFmgzMZqvdSGQq8D+mure7AVC/CCHPzVm7eB2U3w0s
	 x6Gqlobtj99VEc/a5cbYTLdC4hAPozViYnFY8T6Y5ZBUflZLW9kJHdROo5xFvd0D5OPps
	 vEr/mJbEnmOCdlvJ6/+4ZgOHvk164KYy9mV8BRIyFm4ESVGrsQ3sJdwG7ocrKLAuxAOGX
	 f/b0AdJzYj48n9yySFiwa7TAro7fB+cUUZNFLRtG1EQ09I8x5ydwceBhukF/Mw470Zgxg
	 8HQyK/VOz9H4nBLOguAolF+nKNJmyHRAbPW7KC3r+07AFEMrkuPYwYk8fzE+5lK0p7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JOLCqPsW;
	arc=none smtp.remote-ip=209.85.208.197
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6AF606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE6AF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JOLCqPsW
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3ab3089df39so4054381fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793993525; x=1794598325; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iw0r9KyM9yE8+UHLOBvRU3eF9rfoOEr06pAaRlmDbAI=;
        b=JOLCqPsWEhNqvFOx3/qaiUcFebdO112TNKsSqX2AFW5xG81g+8535F24cncdWzB9d0
         NijKGrQduJPe8aMZlBWGmexK/h2h9cay7gxZ+wMrq9yQFHgl5dyvrlANHcgvLKcvvap1
         VTOUupmkJEuDGKnveoP7c4sVve4o9I3+FO/NpJq3+9+VtTbYRMjXilKh7JvuN1L5yK1+
         RD9+bTKAEOaS239HwvTaWfCn6WDPcXnKNPEHYIJmJ2w+QA4UaVoP4BROpNoAi2/uWIMF
         FjpLb4UydY+jEPABvttUBtOrdZ4+9Fp0ssgtVfwhUiVLHBKUiF6jsdrf2fc/6Ue1cfMP
         pa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993525; x=1794598325;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw0r9KyM9yE8+UHLOBvRU3eF9rfoOEr06pAaRlmDbAI=;
        b=JVZG3/4sb7H0X5tcbZyI/qnpDctWAnU20y87s+BpEZltJDsEfDZUx9eCtUozke94Hr
         1uywB5DNObQbi7K4l6/Pvps4Pd8eV0wRTini9CSPu38L8IrHq9Yf32ogV/dq62zJDbSK
         PQ85pOVS77iwroiXWJi2h8/cvPRQOwSTWTsAk1DVIVhuWYkzN2Q9ogm+u6hRlM36XogM
         61zkSTON8qX16UXnejyw/25YxWN5c1OoVn6r9T7Wq/RlCdEFRxU6ZkBOs6vdh+WKT0A1
         03c4P4Eq7UeyvXd92zujin7Jt+mx/dHZISQpvqifEwqvfXYSPwXbWIJ6sMUfpDMIm634
         AuNw==
X-Forwarded-Encrypted: i=1; AL+hErFc1MQ4+azFPGyhaVkiUznFjvNSU+NilZ4+ptkgA0NTC7HbqkIL9iob+KQprRpqaHjMpp+EmI2K9++YgzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FljWEQXpU4vLt75kYf4ZGEMek+zAH73BUAlDuR1rmNmoUe6mr
	Ya9lEs3Kfzy/eUdDKA7Gb4+uUPLdRi2fImcIdaEW99Y28wTiE9Di5aavwlMPuZSnm2zryQH5nG0
	s7uxquYcFUw==
X-Received: from ljgi21.prod.google.com ([2002:a2e:8095:0:b0:3ac:f040:c4e9])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:31d1:b0:3a9:7e4d:7fc5
 with SMTP id 38308e7fff4ca-3acf3b2f8cemr7731911fa.18.1793993524757; Fri, 06
 Nov 2026 11:32:04 -0800 (PST)
Date: Fri,  6 Nov 2026 19:31:14 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106193129.43493-1-dbalint@google.com>
Subject: [PATCH v1 0/3] Introduce cros_ec power monitoring
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds the ChromeOS EC On-Device Power Monitoring 
(cros_ec_pwrmon) driver to read onboard power-monitoring ADCs,
such as PAC194x, wired through the embedded controller (EC).

Several ChromeOS platforms are equipped with onboard ADCs that are
connected to the EC via I2C bus. The driver interfaces with the EC
via the existing EC_CMD_PWRMON host command API (and EC_MKBP_EVENT_PWRMON
events) to manage ADC accumulation and expose accumulated per-rail energy
through an IIO sysfs attribute.

The driver is only loaded when the underlying hardware feature is present.
The series also fixes alignment padding in EC_CMD_PWRMON definitions.

Daniel Balint (3):
  platform/chrome: cros_ec: fix alignment of ec_params_pwrmon
  iio: adc: add cros_ec_pwrmon driver
  mfd: cros_ec: load cros_ec_pwrmon on supported ECs

 .../ABI/testing/sysfs-bus-iio-cros-ec         |  13 +
 MAINTAINERS                                   |   7 +
 drivers/iio/adc/Kconfig                       |  11 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/cros_ec_pwrmon.c              | 333 ++++++++++++++++++
 drivers/mfd/cros_ec_dev.c                     |   9 +
 .../linux/platform_data/cros_ec_commands.h    |   2 +
 7 files changed, 376 insertions(+)
 create mode 100644 drivers/iio/adc/cros_ec_pwrmon.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.455.g6c5a503b38-goog

