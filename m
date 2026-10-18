Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6426C3D47BD
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792338869; cv=none; b=arSfz5mBLvR7EuBlIvxKE8gosvIo+5J2OpH9jLVcFWjarvGe32pfFRa12Tn0ZUYMwGH3FCisJHBohhIsH5WUEj0hxC9eI/yH70ZFkd4EuN17lD248SaEiXE17GZPnxK7PVwf/4IYq0WzLtSUy2OYNtgwH2eUI1O/b2ADambBbrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792338869; c=relaxed/simple;
	bh=TN0F72Od49q/9VsV0FPLYXRT8mvo8Ym05QTkvme9qKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YVUcF7+geKNU3dG8RrZUQsRzibqxsv+9+Mq4etdimwFUg7mn6LCe+woX3hmjrP//Zt+HI5D6uTCeU7e8zjiqaZrkscbljl0DgrVQ5XzxKMPDBrmSQndElUt8e0zWhXecf2+AfEI7hJidom7RRFSYM3KDnYIF3S7yFTCaQ71wbWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUa7ebE7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUa7ebE7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so12633445e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792338866; x=1792943666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TN0F72Od49q/9VsV0FPLYXRT8mvo8Ym05QTkvme9qKI=;
        b=aUa7ebE73UwZVE4PgjDEGUbVxjNzSBL7rA/IBW+retNCeKe4sogMYJ2jIlON+gxWp7
         2cmBMPFiR9o9QFDyQx2YRh8ueS9mfomjs561Iiry2zkfGnRiJQSPyvQhHBZCLMHSF/vy
         htZSZM8PYMj9kNw8SDHXwrkVcOJn8SWjwPDexl9QYm4piY7MArp7cVQccnsuhp02cbs6
         NI5tmn7KUTg9bn5hzAa4VYfmGkjXKoRKkgqpxeUBwjPTIGsgpq8wMJgyG9g7x1rPk8B/
         d8jHFBbYeWgIMt1QlTYMXtt0hIUVGPm8S7Ld/T+GE4YMZdc4P42ubuQybTkxHjRghxZy
         cclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792338866; x=1792943666;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TN0F72Od49q/9VsV0FPLYXRT8mvo8Ym05QTkvme9qKI=;
        b=qNPyRdUg9nt9CeV+ifiCPa+aMz0al2kojjrkvnir76+wiXPAUlrCAfzrostTLMJHpm
         wp78WoMMGeewvfEVvcspl20+ewl0jTyzXuear0ptJg9I1Ef622PImIlwicjqLztFL/RS
         TgFVlmAOPiZFb5uq4lJAIDSg3ZyIPGZFmR2w1KawkS//ArXAHNu6YW1eUiq38fhvG7//
         g5knE+UUPk6iJXAsWQAYEXN/NCxBGuIF/2iuJsZarsUIlwOCDq0PQbMeZadvjYV751A1
         cAdaJbkioDaxiWyUL1J/TRQ9E1qBicj+X0YtIO3ZUnPSuLmxz9+eynhTepHfczHZq+X8
         o37Q==
X-Forwarded-Encrypted: i=1; AKwUvBzpCciv03pqI5IH9LB2+c2acfI3T1aSPXFe1ZkgzwzFBx0AuOyuGx9QSzEHIjcDrRTCFGyJquiVTe/d5D0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpnIuDLrHTISmAhZZuyJcSpzrCTy7XovLMB+yvUpzoek0Pm+5o
	DPEixHL0P8+k3yzVrVlZkVamuX4LiWXd60nkq7h5OJqC2teA3Xnaj6Cm
X-Gm-Gg: AYBFou3QMM98soHH/okNr98hpTcoeFWd7JByDcqLjG5RA+L60xfRvULDUHlFh2U+50L
	sBSaB+TeGJ89WnYf4PdYJ1mktQy1Ci2NSmbHDqCH3qPuQxyY8VXzhtrYj0c/KmV0otdS3Skp7Kk
	MTE2BXx5SNcM5yeMXr0lVTyY0zv2OuNBOTaW72wrY3T3BU/o8HZzW6W91D4+6S86aePcbsNJYCc
	/6zLgaq9b5PeGfehSXELHmqpf4FL1Eb9ynRVl50K55RVfkuoPAjxk1t/Q0X1RXzkIAvyVVbURrr
	uRg3AbuN64xt998NisrxTQVVtKq2frUzYQRaNJ8lbkKfKL/r5JLK10CmSYzE2wcUdqnsjXJtTRj
	Qs/BmCEoXDR648NdWwCcy0MtrQSc2natQulNyt9T3bQHJbUfFUlfT1WkK8vj8ltiWuKd5sZ+Hzk
	VnJDhPBiDiWBi8nQN18on6bqPR+SEUIVWdFd8+B4jmCoSEfG9hVbKoWQoH0l92iLYipfJLKnQZH
	L7YphVwzU2B241dEYMw8kI8WqdqowNEzhT0z6jPQUw5BEPsdT9f2CzTtWDV7QE0mkbQYYy4Ji3r
	fcmAlwgpuQ520xCDsPLOgQ==
X-Received: by 2002:a05:600c:3b1e:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a1d75f9341mr124952765e9.12.1792338866523;
        Sun, 18 Oct 2026 08:54:26 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8af2fcesm227892415e9.8.2026.10.18.08.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:54:26 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	Amir Vajid <amir.vajid@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/10] firmware: arm_scmi: vendors: Qualcomm Generic Vendor Extensions
Date: Sun, 18 Oct 2026 15:54:25 +0000
Message-ID: <20261018155425.1299660-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I tested patches 1-9 of this series on a Microsoft Surface Pro 11
(X1E80100, "hamoa"), on top of 7.2.8 with Linux booted at EL2.

Without memlat the CPU never raises DDR/LLCC: the cpu-bwmon instances
stay at their lowest vote (4.8 GB/s) under full load. STREAM triad with
12 threads gives 38 GB/s at EL2 and 41 GB/s under Gunyah at EL1. With
the series it reaches 67 GB/s; the ddr/llcc devfreq devices go back to
547/300 MHz when idle. llama.cpp on the CPU (Qwen3-8B Q4_0) goes from
7 to 21 tokens/s of generation.

s2idle is not affected: CXSD + AOSD + DDR stay in their low power modes
for 99.9% of an 880 s suspend.

One thing I noticed: the protocol 0x80 module (qcom-generic-ext) does
not get autoloaded from the protocol@80 node here, so I load it and
scmi-qcom-memlat-devfreq from a service at boot.

Tested-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>

Thanks,
Ramón
