Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733317;
	b=UKhltcObeQem2WFJ1wof1XfA59CTDYstpdHxuy9/sz0kGan9JT5eVVaZgCRPRumqTvE7
	 CjNjhq8b45gsr2BECaCqIfgOEahR7ccZlwngSiSQ8m3q/LNw6+A9ktEXqcw42WGdQwIW+
	 ZrAoESlVlEjFC93hq46xlwog4ccFW2YwP/WYOj+Sky8fOEc8bqOGUjZblSLUHDvqXcrAp
	 fFCLueR9s5Lr6BkOtFxI+iUgwMUCspmi3cMlNkdo0latsgBB+E+Q0bx1lnL9/n32+/jc6
	 Wl+ABB6krY47Pq32ksACTtfkjoNEWCkjA/X26Ll/+JERrrsILpEmqf5JhCHKh6tOYHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=por2T3Gp+tEuNMPyL/YvZC06GbeieK6i8ZhJKNw1bi8=;
	b=QuLr71qY9niJBf5QtIYL0xZzysMtdilmdADI9Whx2BhPyDv7kcxbzLB8nDmZdr8zraE6
	 B+r5/NA96j5nxG7taLduaSBXqCg9G3tKgfCZ+KsZF1wlex85F96ifbGQzM/nqu4MmWBMm
	 Mb7ZNXKMNaPSSHw2/UzO2t82vpVqaMz5rzHswF0e+l1C8IXy/gHub/T95R6FcfLQixFAs
	 MlndNsfB4ifDlF+rn18n6VnaPG/FNPxrkUz7E55SiAEseYva1/G9o+guA8lrkyiSqu9+m
	 zYqtlOtMwL0nULmjhlmaItWyJtHkh6UqVZLX4bLnC+PReuuMT/d+pczmfmTiLERN8fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6eo4mK+;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BB9606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BB9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6eo4mK+
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso391846066b.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733315; x=1795338115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=por2T3Gp+tEuNMPyL/YvZC06GbeieK6i8ZhJKNw1bi8=;
        b=C6eo4mK+MFDgCNoUEcklPjlO1ph6zkPxXk5Du/g4M4E9WkY/4MB7EhWYSkSG3O2Y6f
         srDSDJA1emEc4AvqwID5YxXswF/6xjFE2hqo4ktd3Wugnh4NZ6gnDzYpf1fvZpnsSC+D
         MHwS2c3EguCfbZvWa72eynSoAWQ0HH3bYUK1mwF08SD9YAXcdA1XkRawDatF4ob+2HZw
         rg19N4xzudep2TcranCcCjU2EtixMs9aMatoc3cLCso/w0q2XKrVuLhmqPeTCMpGXNon
         kiavz30P5qbqkebbDACq0uemp0Cmt0Q7O8cw+w53xLUUutqaq+r3fUE6O4m4tpD0CGrE
         YI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733315; x=1795338115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=por2T3Gp+tEuNMPyL/YvZC06GbeieK6i8ZhJKNw1bi8=;
        b=NxOpngUgWFshANGT351RfRIOzlC4WeD68o6yha2cpaNLDh/UE71EIb0BxlpgZCrsey
         DLLQt9hni6vtGUcyYxSEVLPiLCIlV7KSBfHgUEfwiAkdJOfu+quBUqT2xEnuEc9+vuBc
         nKgRolrpC+e8pkcxc8ANCXxIM5blYM3DmgwxY2sB+ENNl+h0EqCkNPjPY5oJgteWyBSX
         F0Htu40J/fNMhwNlzdGRcj1eIfTPCvSSpT6KnDekqCuebg3hI9MuUkhRJa/b12cfkh1X
         +AkFNL+QPUSS57r7U4pkOUvzu2gImzRcS9m+EbzgaUmOXMyMadgpc/4ObIVjWoyxrniq
         m18A==
X-Gm-Message-State: APuU4Z9wZYG+EoNVjfCK4EDmLv4uTBkC8+Ofd4kmrJ5XIS4jZ+Abp6Gz
	ua6rKTdIvRS9KocGg3XWybXFBQPDiJxBcRRf7On0bbMmkBoOUJ1qjzT7
X-Gm-Gg: AYBFou3bPxJL07ZVdEnyxCa/WX8JaRaZjKlT2MU4i5lP2qRq5I66PAQ+xnX27hhjHDW
	97efkHhd7Yjqcz5TNeX9U9KveF1sNYfCjicveTW3qYNvWVFqYM2+dCCvPHuB+1kPpb1QO9pF1qC
	TpE74TAQnyfKf6iTShwDPYc6fpvCPkReIypX9/wruUa2ABd5/etGsIouICvR6KmTi5+98z+ND77
	e1ItI9ls9bp15J7mhkFE96nflMmb5WIivUM+hRZyB9oh+Mzf8P3DYGxaZPC275m3xVNKc4Kh9rV
	gKl6Hv6kYP9II6FNp6TDqRJEVcT0pszGri4x8Q0VL1u9eB08rZMAa03S8CUl8Mxpf8I6Fo2+Fbs
	C2Jr9QN0zZmdZ5PD0rZO/tvFB3zsEZSJOinZX7mhf/ERRzD29YtrUCSpc4FbV9+w0yXp/omsTU5
	FiT1dfwppu+quLTfYo1W+PHqK+y1JjRbHV2QoJ62PVEcoFIlZXxomBZqwaXWuJCW5z2M9Yfq9pP
	FFQTMOn1w3C/sNdMg33Iex4obRapDxMmkI23ldamiRHx1UO79agtoOZmzXXvWDbcdUOrjCTUQsS
	iBdBcyTzKC2/qnetemRtQvmVW6LWMyDTpwHAGIBccCLplPAiwGchAJzcgIZ5n5mQV53NBwaGsXi
	jXUEiU06l7w==
X-Received: by 2002:a17:907:944e:b0:c29:22cf:b0f5 with SMTP id a640c23a62f3a-c509634ac8cmr591328266b.33.1794733315249;
        Sun, 15 Nov 2026 01:01:55 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:01:54 -0800 (PST)
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
Subject: [PATCH v5 0/5] mfd: max8907: Schema, pdata and poweroff
Date: Sun, 15 Nov 2026 11:01:42 +0200
Message-ID: <20261115090147.95337-1-clamor95@gmail.com>
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

Changes in v5:
- rebased to be applicable on top of devm_kzalloc_obj conversion
- added restart handler
---

Svyatoslav Ryhel (5):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler
  mfd: max8907: Add restart handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
 drivers/mfd/max8907.c                         | 176 +++++------
 drivers/regulator/max8907-regulator.c         |  11 +-
 include/linux/mfd/max8907.h                   |   6 +-
 5 files changed, 365 insertions(+), 180 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

