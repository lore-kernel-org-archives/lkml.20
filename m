Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101611;
	b=Jp2nfv0OCrXqbXS6EZvdXyyFlitjyALhP0fnlBI+24R2wdqyxZq17xPmvqBUYdZ/mn6t
	 i+Hjzgb7n3Vm1DkfUbh4nT+uqVoGt4xY8XfexhROoC6LJfNiRju8kzqPhN1P2Hx+0YB6b
	 NbetNNINt2Srga+f+zu2oCKFzGcBkAmsgint81Mq2VWM9GSFc++EkHxNeeaiq0Gzo9jUw
	 HhE2bWa5m3cw9G+vMlfnkxzPdeT+1wio9gINLyB5a4woDEIKkPuh19f4CDU6pTG79gil4
	 2Ho9uZJwoco7D9EZPgov+cpjnY8uWjjn/6GkbibHlmDnvZ1VtUQuuA7PbRbOZ+gUhqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cD5gPt3rxQPjXYH1ipKJ6amZslyQfip3D0gAJFQDmwA=;
	b=lw6zHOH7tlKRQTf8SWOlUD34JryUX9tQ4WbbbBxr6PIoFiQ0Q5dRMqy45tdoCQJqe2qT
	 d/2ag2w1CcBmD9DAsR4eem8VRrUXr9z68+fEt6Yw5yGL4owWnmWZlu4DUezUxfwZKUpxV
	 COW58thr4DhJC5tTFenSdTAL9MKQ8/QxbDZse8PcsJrd+Yh2bBm3HRTFvEHwseZIXUbnF
	 zCpqG/Xday/i1PkWPPoafGcklxXoFoS3skXDfg3UWiMdrhI6Ta80FDpE8lz7vOQwkTTOU
	 I0C6GnolGZDKnDxR+Z9n0paipwUOXb3K6gPoLNABaJ4WA4IgXfbT9M5fxiym7G9uMjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=STjV0ADF;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3CA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD3CA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=STjV0ADF
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c43fbcb4393so567065566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101609; x=1793706409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cD5gPt3rxQPjXYH1ipKJ6amZslyQfip3D0gAJFQDmwA=;
        b=STjV0ADFFfwY3KFt+PS+8OVbQeTk85S5kWC7jKPZK2G80klnFRlCF6F46hd+FWNlBl
         rSJhxgaKj39/NCRoT6Wpr40yGtEMq8aft4EPPSu+IdBp/E1Vp4YMrB03oEBhRtO1m0vq
         ++0yZbAwHEITTMKqw0Sdg48ZVYp6NgZkgaxDtK0rAICQlYigVmRN0cHjS1VM6/QhFPFS
         ZZETrxPYfVoyHBvBu4LmK+qVYk0uT+lGw3LUBBjJG0iSz+bOylVcB2T2Z+eXLXAHTnp1
         jHBtvv8ZG4qcLcZcyCenDWxb3/ZxGW7s6DZHoJo3pPdbyAhoGEYoKR20Zvq/9/txHOiC
         axzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101609; x=1793706409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cD5gPt3rxQPjXYH1ipKJ6amZslyQfip3D0gAJFQDmwA=;
        b=ukpoIVnOBAEJsQeh2jUse+ZszxA5pmZsMl6N+Dg9wL7mTU5S1VfV56e/OzUCXSE8E1
         OVtu1v5lqQywd4hAbJgFbr5JKVTgSwdKbAlLEtko87F2t80Pm5UFK9ZDfd4Tlts6pPLd
         /2kW9+CiGJ3/zHeVEYuG4E2KiQg6FQGoc+o4D5f7mLRLmE680s1n9PtfnDlcss45dpvr
         WYTe/sAdh12EVMj0q7I+iMfKD4ltVJyN2JOO9HveqL7iO3Wvd2Kdc6oKhryqi9R3eaf1
         JQ3iZBIqjpm4YQCeURwKPEbuVIcMOCdgcdrdCvS7Fu+gn1Pl4oK8cCnDTxOcYrmG2CEg
         YriQ==
X-Gm-Message-State: AFq9FYKYXiy5MuExYCIq1w+c3CMItGUBZaNmER1LHgrjLCGbshyvaNAM
	4Xul7lsTtwSwU/FJdHEpstYddCa8Wa7ze3+G998L7Hwj6Y6YEPqY3z7n
X-Gm-Gg: AYBFou28+E0nOh2Tj6z9XLWc4DUkAqzxhuYaG9xLskGxAN7a65XlHfxnVJyllgQaQ5G
	g98ir6iD69J7S3uNuYVsip/Ni+oP44L9bzPQKRTrgO/s23l5JEf+r/5hoiTE498muv/2TW9+daw
	YBHrH+RXenWmvepILyHdUCoEFDVlhx2x7xGvdBflreezoDuikmD0rxED4Bs6YSyr7WEeW3enIL5
	MAecLrJu27KJhCZzQZ3gUlI+nHwwtTTjkrbbripr+gWl5LzUWl9TJ6gpdjAM/D93iVAY7f9OYNF
	Ry6sPhob+T5edpTtHmkuJQ/vP/+zT63fNDnPgPxJLpf7mEPGpd/kbvQIYXekNXEt6uiFWMDxuFs
	Iyo5f0slZ4exdEEkqgcV+A1qoGI/17i0VR+raPiOAVVWKVEQFNzPdw0pDOJ2R3j467oyWYri1e7
	HX1nzde+zbagA+09v6Za+j+YbENn5zRGcw6d96iyUQ3poFd6sbQY+vxNuDDnjXKEdY/9m51xx8h
	pcuZXP6150GlaiMMO3zKXzkwVhEsKs4wl1/q5jj+hGPBhwRMcsd13vIbjqxic2W8N4VR/vCCMbI
	KfVzKA9w
X-Received: by 2002:a17:907:3f90:b0:c2e:640f:f9f0 with SMTP id a640c23a62f3a-c46bdacc9a6mr1123370766b.5.1793101608817;
        Tue, 27 Oct 2026 04:46:48 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm430692866b.37.2026.10.27.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:46:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v4 0/4] mfd: max8907: Schema, pdata and poweroff
Date: Tue, 27 Oct 2026 13:46:30 +0200
Message-ID: <20261027114634.79706-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

---
Changes in v2:
- fixed max8907_power_off return

Changes in v3:
- added idata check in max8907_regulator_probe() for BBAT/SDBY/VRTC
- added conversion to devm_ helpers commit
- switch to devm_register_power_off_handler() and
  of_device_is_system_power_controller()

Changes in v4:
- dropped in-supply type definitions in schema
---

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
 drivers/mfd/max8907.c                         | 159 ++++------
 drivers/regulator/max8907-regulator.c         |  11 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 347 insertions(+), 180 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

