Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291A544E66B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363319; cv=none; b=a5IUtoH32UHzu7BMmbmfBJvEIda3qqHrjCRJBginbUsVePkRM5Qx4TFnh+b7oLZSlF1ekhehfgct4JP1w1/H3V6B08iFOZQH8PRTBmY/15mJJOf30t0MlQunZn6wTmBgf3J37gkmXA7AaZjSgoLbn8mgqFP6IJoYqG5BGfzBgm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363319; c=relaxed/simple;
	bh=pRig2jwfRvKIPmscPv3ga8MjLPmvBeWTyHRup+5LxN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwBF00WQhZnR3pHbRtNzgMALoBALhf+qmU4Y97mEDa0BYa9cWmwRzYWEptIsLoQ/7apazfE4rshYz92tpst4HgAIeZInBDKiDOf1b4yamQ/N2STbA4pciUc1IkscCZfQyXnaibKIdhreVZ/vWcA0MAp0rrywm6KkLyh64fgS5qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZE17Nib; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZE17Nib"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a061a13884so13448215e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791363316; x=1791968116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=idGrLQ96uf8XUCDMxXSwM26M1eSYrrZBxKOU5D9zkzs=;
        b=JZE17Nib2Vjng4ryH+LLlIkU5DZi/0OSlS5srF5fkQbJ0gVTCfzC9vEqomaXL/KIR9
         /Ylr6LQoheCY+DpnQFToSd41UPY3pmL2OyNRXdpexscevpzpGUwVMDfyRi5pNd0J+k3T
         cIsNto2JlXJn/bI43xzRMOj5NBo2BVe4q5PiEM9NE2iJGVo7b0WTC65ZIK/6EOG4DNen
         iF+/Yiu7YnFpUa8kAEceg1VW+l5AOtJ6EWQPGWXE2jYLuK/9XCHE2H764fkDyEuzh90F
         AxSILEkkFMckzZH/M7QOakHkFLnF8yM87H9y7DnhFx2f+qc3ntDBhlbMZEyrxU9jaxnr
         WkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363316; x=1791968116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idGrLQ96uf8XUCDMxXSwM26M1eSYrrZBxKOU5D9zkzs=;
        b=x8gYXpmWh/yU9uq/rOZSDlHm1XmED9jqeI2sTud8TT+uq5HVoVX2QbEsfvZDtTlhqE
         z47dotv6P5WzbWPq2FtTGFa2Zb+XzbelAtvacolqPag2nNNyszX7uTpXpIFhs0H5ZLTf
         gCvBOeknYY45x0nFUyFPL+x33OZ3FeHLSBUOfBsqFSw5NWxp+Rq5ypCX2iMfzBSlFOO9
         rY2xSRg8Ssgqrd+owQRDKYL5VCL0QHEWPfuHRDWSnuw2/V15Zmij84TYhtgXq5ZTsz2t
         xeZLursbkA0IALg7ziRsrLfzESz2sRMRZ1NsJv8UBWjhGNRlNKihWya7eKmUxzLZPTu6
         kwmA==
X-Forwarded-Encrypted: i=1; AKwUvBy2n9joPfc17t29OiGDbNL1BYv1I66TmvaB8VeUO0ag6TDDo/bjTTE87LF8A5yR26Bk7/sGhn40Uw/ERfQ=@vger.kernel.org
X-Gm-Message-State: AFuF++liTtRHbIXAgan9GS5nOhXHyrFMOwxUwadlEmm/V+DuhHx/YuYO
	CXchGE+eKPzKn5nDLVTIfcGSFCdg0vvO31iD1uxEWy+yG1o57ArF8br221uUGw==
X-Gm-Gg: AYBFou1TD7VVb80xuamsakkA+iMDTg4Ha6CvnGYCV+NlkvJByXdIIcswhAdNtPb1W7b
	mjZUc/7/ONKFS6DkEt+AnZsZqEYGeNT7o0btzwmZApBsaC28bDBPM6pQOI0hfD484MJW5BkwbMU
	r5Mg/7ACF3WabAiAu07SKwH9itMBCNeE5lI6DLY8mxWuqX5DUdoTDV0xlnRoYcyvoUaYsRB/Q4G
	sIlP4zIUHLdIdaRB4dFxqXWEI1cWAFyctHo/BsYOyFo/XTMNTzz6E0WjF+xogYXZJd0bUMg+JZL
	erEna99QsHjwYD3qezecTHaNGthlDAh5fbji18m2MA/U5UY2HayVj+y1GY5CeNNySmNvr+6tjKz
	6v0V1up4mnTkTP4F5av46FJOiV4a9J1uLcZCbBqLuSa5tu8BWzvfhFwOm63ejJsCv80ZnHivpe1
	0l3Ah+UUElkJELwm8mlNh9vSdMzXZ4SO3lmWch2ve8/IQioZMEGoYNTsWbAqCSzUdmJ6TTtY9SG
	AJIAecuFnOKAfEdC4A=
X-Received: by 2002:a05:600c:a088:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4a180313b89mr20150835e9.5.1791363316178;
        Wed, 07 Oct 2026 01:55:16 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm81709225e9.2.2026.10.07.01.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:55:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] leds: aat1290: Add support for AAT1270
Date: Wed,  7 Oct 2026 11:54:54 +0300
Message-ID: <20261007085457.98762-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document AAT1270 and FLINH pin, adjust driver to suport AAT1270.

Svyatoslav Ryhel (3):
  dt-bindings: leds: skyworks,aat1290: Document AAT1270 Current
    Regulator for Flash LEDs
  dt-bindings: leds: skyworks,aat1290: Document FLINH pin
  leds: aat1290: Add support for AAT1270 Current Regulator for Flash
    LEDs

 .../bindings/leds/skyworks,aat1290.yaml       |  8 ++-
 drivers/leds/flash/leds-aat1290.c             | 66 +++++++++++++------
 2 files changed, 54 insertions(+), 20 deletions(-)

-- 
2.53.0

