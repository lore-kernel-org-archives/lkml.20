Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505677;
	b=CUbVWkTibYzsWRvWtMTKXsWw15PWwTgyrwXuWFjCTJxZa8wmRBpQUx/T6I4N/YuIoikH
	 xpyJ6tp5X+LS10JFlDuSZ+OV+dnWaJPohlMYb9cSycEsP80uCuBPX+djEfldwIfapsKRY
	 V3AHidNdH7ekpwMuNG/F0k3mCQmUSw7tMlrnGe96froAgHCBoTZ23vrcDJjemgSJccf+c
	 AwzKJ/6yL++qOX/7ggtexETRjtOzggkmDXeHN0tITkStoJR7sk3abyRmQEfNlH+7nvsEb
	 XCU99dJoDJ6ewBWuixNK93EmANqoHlpma0Af6Q+Fn697nOQuAAfv88+tWKakYfLGi6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zEsuZyfDjSWj/BpGeHEM3jz4WjCMQaIiWWeMu5F0b1c=;
	b=D7wX2pg4u4SGRoVWBV1Aey/Oq0/Yhk4psvlisRAePxB0wZoC5s1pu4/X3nzVJ2QC7fBj
	 zoBYeEUuxMY07dBHd2PhQS69zQ2PvzErVqhWtWH5xCGogvDX7lQFW+6xrLCTwlggUbif+
	 QzfnWGLj4Ffdp6s5tCMnmoch/i7vC9xgHgltoV+VdVxQukwujokLH0VkbZAQS4r3Odxb3
	 6Hihe2XnEaCHrqRNVBXHT77X8ONvdNy8uIkKtz95/LSytunqZQFKI2t0IY3nP/DUl52Fk
	 0DNIPAFNr6UHd5uLG/hA0Afb8uKHIry2Ml1I2jzP7NIIljI9ZNeKgIkW2DGRUlAK7aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="QMLhtJ/y";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1804606AA2E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1804606AA2E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QMLhtJ/y
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e04773687so973206f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505675; x=1793110475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEsuZyfDjSWj/BpGeHEM3jz4WjCMQaIiWWeMu5F0b1c=;
        b=QMLhtJ/y4NSHZItSc7srqIghcCaAhr1j8x0Vht0rNppW51Pi2HyvVi6N5v4pa8B88t
         a9D/o5qoeqwerLUcMi0Pb/ppeU5kgXepX+fODjMW6ycDPzeB4ssxaurLYS2VOxVOQQ93
         WbBezIojpi3KkdhXpoy3+2I9ZoVtkQV1iCUcwzBSpw9FAv7V0t362ZaiBXjtNwarT5EY
         2d8GvoqLcBmT98zj5jGSMoiuvTVH30/ZboFvzV+UiLpLhcADD3TIa00bwRaQNKQC+1Ym
         st7Fmk8XILZlG6xA49W8lBdoaY/upgfdFjK9dxMfFlcEre0J+Y2A/2UjnfC1bmjoeGXH
         527Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505675; x=1793110475;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zEsuZyfDjSWj/BpGeHEM3jz4WjCMQaIiWWeMu5F0b1c=;
        b=nDKLyKrnx8K5hyLkM/KR6UEHtqfrPcTCcjqnPnD36PwctjdMQiqFn54wWJI183KfNx
         L4Q8UN89C2dyG1qDBITu4qY2OQVf7vE5llIzd4/rmNZ+jpRhNZa06tC4r7mMxTiSZB5w
         Y+9pRR7NvNx5La6hZ5tzh4YXoG9VxBNHQS/RolR3+x+xPA1J7GD1RW5yaBu3UyG4pscx
         SEscF4ZXJn3kVPyCqbw1J2LDnQZ6KuPP72sYZ7cMA4ozI/YXIFb98aInBmVQntMMeRGH
         IBZRnXWLurzFwnUagTF4+VgyI9yb0tCqsVfD7ToDPkrPtmIkhjj62LBghewTjXNnzXLK
         yDrQ==
X-Forwarded-Encrypted: i=1; AKwUvBypjkxdsKhCvZuFLH3gr09MFH1mI18f36FKX5AdpgDyKWaDsBw5fqSrk1eMthg358AYBDPGG7BLhyBL+ZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5QFKW3Y1EDhEYCSWyz7BRJc9Ui4MpMbpA8Yjt3bRRwZFPOJnH
	YWF69KLcmucr036Ed19tuN/8NikwocvTCn+izqCFvZjNGmwjEsur5DkN
X-Gm-Gg: AYBFou2SUiG4qCbqZ2zo0eUzHnF6JMrd4qInvSm69MYUDMde+Zhl9kZq84VWBqNbDu9
	PdSNZQMcTViVcBVdQd3jhfqX460kuVM2mqn4FpfTo0BK3sZkcseho96nsEguS+yjI65BV7unhqE
	8DBBBCXzITrR0aID6EgNa3ijxQH3I+lBJjv57dCWudxgmtJOAS0elurjMsDvFMp4U2hxm8KWwhR
	UidtAWVf7GSvAdw8GZc4JBvxdTyXpddEDmxzMGe3lkIDEIcThO3PVizKFMZ4jq2pMstnAoDhjqk
	Xnv9eOoQ6FDeKSFIjxVoLUOJwN3/QI640KSc2bniim1juot8eHi4syy7aAsn6fce/VTGOfYJ6vo
	nUz0gacwjsiepoow2R8JAKIyXzbHIyGi1/lXCRhqh31+Ik5Q3GruH56Od+c3GD8NeVcL7g4OdTQ
	BK6fhTFOknxUUp16l6sW0CEV9Es/mqdyzmKtu5Yg2KsEwlERKKTrNhKSk5Kucvs2qHcQtnFgiI2
	4KtDN2BptA8jXiGfdzYeMW01nAwqG9P8Erv+XvZr+Ar2hplAojy1s0EniRZjzPFVazh1bVRFATh
	Y9g/NI5v/iSY1jIqlfxXSpDvqO50B4O0NGMW5LMADOk=
X-Received: by 2002:a5d:528f:0:b0:48c:466e:9d08 with SMTP id ffacd0b85a97d-48e07fa94bemr15933068f8f.43.1792505674826;
        Tue, 20 Oct 2026 07:14:34 -0700 (PDT)
Received: from archlinux.cern.ch (ppilicho-1.dyndns.cern.ch. [2001:1458:202:228::101:227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80f9cdsm6256287f8f.11.2026.10.20.07.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:14:34 -0700 (PDT)
From: Patryk Pilichowski <pat.pilichowski@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patryk Pilichowski <pat.pilichowski@gmail.com>
Subject: [PATCH v2 0/2] platform/x86: msi-wmi: Ignore WMI events for keys also handled by atkbd
Date: Tue, 20 Oct 2026 16:14:25 +0200
Message-ID: <20261020141427.1580282-1-pat.pilichowski@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On MSI notebooks, several keys send a WMI event through the Wind event
GUID in addition to a regular AT keyboard event, and each press logs
"Unknown key pressed". This series marks those codes as KE_IGNORE.

Patch 1 sorts the existing scancodes numerically with no functional
change, as suggested by Ilpo. Patch 2 adds the new entries.

Changes in v2:
- Split into two patches: first sort the existing scancodes
  numerically, give every entry an explicit value and use lowercase
  hex (Ilpo)
- Add the new scancodes in sorted order

v1: https://lore.kernel.org/platform-driver-x86/20260926165034.94254-1-pat.pilichowski@gmail.com/

Patryk Pilichowski (2):
  platform/x86: msi-wmi: Sort scancodes numerically
  platform/x86: msi-wmi: Ignore WMI events for keys also handled by
    atkbd

 drivers/platform/x86/msi-wmi.c | 35 +++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)


base-commit: 893018d51f27ec0449155b0afe371aaf65380630
-- 
2.56.0

