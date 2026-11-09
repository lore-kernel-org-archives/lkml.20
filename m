Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229186;
	b=eiydpF3RVO9dunfwzcGIFctezNPbQLObeoG6VfrbNafdYmqfILMStBjOjbqg2Khh/7r2
	 Z4clZRGd3Rd55Pgw+lwQfUxLIpHDaGkmfVzkBgajOtNyWeblZQkRUPozNCcufAlRvXHJv
	 5v6alTlqkEBNk1k+gduq7b4RQ11WicX75Czh0RhHFbrxGBbVRrJaGaeGxi1gbExP1A5n6
	 Z1H+lUQ/w23Chm8MUyVLlFovZXrClFcBh+ZtJ21cYXmaFqNwaPDOtOFSMwVUuQcNWIaTN
	 //4ANRmqE9vqQJ4hmYQjt/CUTEQdLIua6baLrOKOx0pitjxmK1otkFAgkMgzA64gNbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=uACShyT2+cRLfD/fxPOkvmS+FRCydCrY0eS4MhiCrLk=;
	b=qHl/KblKe0EGWVrEjRt0iaRRZMAd/c9v4si9LtTKe9a0paeqeNAJlooE2AyRt8tmBY5i
	 7ecKVx3CFiFauWQXkSKlrmSep3wLAxw8ETa5MtXFpOg8kbgiuYZjpnqxiz40ZRrLaj35s
	 nbuYoG05ht+rcayf6JfOnkddPPq0ghJxvimPOYYuTbwiKAJHgotFFkKGq/rJbgcVYcRAB
	 7Qm0/g5Fw4NvincKNjIOutonpal7zSEjco/kYOXyR4DaAFNQUt3jIGx7bFVAeNqA67Q3S
	 ru5X1NRPXcESFZMp2I72Hi7s9YqtZ4c50Mn+gHB7NyeBS5GVy7mkJ6fVLo8dEnlNfOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i7oefJru;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487D606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A487D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i7oefJru
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3acb1224533so86677a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229185; x=1794833985; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uACShyT2+cRLfD/fxPOkvmS+FRCydCrY0eS4MhiCrLk=;
        b=i7oefJruKiOPmCRut0ygCzqWulvMWeHDliOjqs7eWdgvx90lFeiO63RGDAY9dGkcj1
         kZrFpbzP/1zR+acWAAEBzc88xth01Stx+q5JEbfpEdcqYeioEBfKNzZWfpL/nOuxLjk5
         AzLSpee0D2vq5LCvYGc3RFB1I4We2JhQXEisNEXl4wb+aj8BdZU/7+ZmFk+ecxxyGVfg
         9Hp4P+q4efAx9IkszyGiHFqrHLM73eXK/Z3Pa62MqBd6jfPJ9SgEIE9OLX6Pz2mbLmjD
         dO+3FZKHi9DH/FY2GN2kEj4TLTmKnjKa9/9FRvpExvUnuMTyDcONa+iQOFQ/Q0wNPDsM
         PGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229185; x=1794833985;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uACShyT2+cRLfD/fxPOkvmS+FRCydCrY0eS4MhiCrLk=;
        b=VeMnGcpQ92joaIs+JVi03RRvEORGzzwCbFjYIwUqHtybHy3mlzSl6eW+Gi69+WNu0r
         ZvONBLqmt0hPB3izgiNKuRgdKR+pmegE4E+xdQ8TiMpedmfyExrCZz8p18Pc1AeG1tST
         //A478HUCDYPxWf3S+vdjKYNI2l5N4MYLi74UVOzBO+NLomoNN9kwy2iCeFF3B364LqK
         JhKUWGLAaGSDRyTwSBJUWB+v5lfdAS2n4tDqwLDgy28tGoPfxBGoxJVvjxyXtwV/R25c
         iQp5YMZvDyNC1nVUafxvw3TfEFLEJkg3ayBiZKOWmsmal7qYvW8PJHayMAn87BO2mF6A
         pWEw==
X-Forwarded-Encrypted: i=1; AL+hErHxZCJtc49EifQsOl/+wIfNdvONubp4uxSQ9qUUeFccOhH25PsgpFcTI+W2KB1a/+2AAGBQ8YFGDH0VIkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nA0YGAXpaUTpQ4LQLhmZgYNsqLabBjHVv/yRrt1CQm+sP8I/7
	gscZEeJ8S4z3oD0mQx1VAsH1BL+sDgPvOMC+SaDTW5W0aQZ2gDfjfCKX
X-Gm-Gg: AYBFou3xbATrstGCO6Zr3LBt1QHBwrzhxvkswQIXVCqjy3RQ8uaEy7Z29YWRcEND2i3
	aIYDM0w7GpljNY7ho13EEZG5q/k0iGO+l3zigvl7BkjflpBm8TOL7dSTCiY40rPpFXbKXUXuU68
	iQRETBKx/h0jT/2fgzGAApN3I5FBn/k8Ux4VF1vldpg/bM9M36/TKn0e/wsOUdd495HG/fsSHM4
	1+/a8wI94pmG2FGZ6yfGTOWAOthdP85PzFf2fdjnLkNbayQv4Srd7+PXbs79f3QTOF2/+NRKk1H
	ZwTKXSE7Wf/6Sr2QZebLzy0fPFB/jo3UbBnIwPIkcbnC6XW1/Qv4S7FWjHV3Ab4aJfrHtNg8+v0
	Ry9RgbGxYpmJnIkjHqTiFdAzsGX5XUSA7UN4XH39hkB9w6D2ZVJjabazoJi/W8QzsLGltiTGWVx
	0Id353td3cbiXCmIAn9lp7XzNhWFZXI/tv6UbMxMcohD8FFVCIExA91vgf46JEpz8C/z5Ij/0mG
	vzOxT2sUI0Pf2jliZF/KXVU7nk0OscxzlHEqYiU0cVGcg+LUiKM2TcnAmeHDcMx81kB3Qjj/Mlv
	MIn5b6MEq11q1EJn6WPc9gnso1SoNHnOk2HG2yBt3ZpBrB9Dv6WigMTcL+nWJojGmgQ=
X-Received: by 2002:a17:90b:4405:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3b12cb3d220mr5659477a91.0.1794229184648;
        Mon, 09 Nov 2026 04:59:44 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969694aasm1534153a12.25.2026.11.09.04.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:59:44 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v2 0/3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
Date: Mon, 09 Nov 2026 20:59:28 +0800
Message-Id: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALDD8WoC/3WOyw6CMBREf4V07VXbVEhc+R+GmD4uUAOU9FaiE
 v7dFuPS5ZzMnMzCCINDYudiYQFnR86PKYhdwUynxhbB2ZSZOIqS82MJbxpU33tzo6giYKJWWsN
 FVbK0mQI27rn5rvU300Pf0cQsyQ2tCEEHNZouIy0hk8NPCzb4CbI7lztH0YfX9m7mWfrvyMyBg
 z5VspEVl8o2l3ZQrt8bP7B6XdcPrYz3zukAAAA=
X-Change-ID: 20261106-zsmalloc_stat-e261d4dc1276
To: Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Xueyuan Chen <xueyuan.chen21@gmail.com>
X-Mailer: b4 0.16.0

Drop CONFIG_ZSMALLOC_STAT instead of making the counters conditional. The
option only controls the debugfs interface, while the class counters are
updated unconditionally. Removing it simplifies the code.

Following Nhat's suggestion, remove CONFIG_ZSMALLOC_STAT and rely on
the existing debugfs API stubs when CONFIG_DEBUG_FS=n.

---
Changes in v2:
- Drop CONFIG_ZSMALLOC_STAT instead of making the counters conditional.
- Update configuration files and documentation.
- Link to v1: https://patch.msgid.link/20261106-zsmalloc_stat-v1-1-b574f4714adf@gmail.com

---
Xueyuan Chen (3):
      mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
      mm: remove CONFIG_ZSMALLOC_STAT
      docs: zsmalloc: describe statistics with CONFIG_DEBUG_FS

 Documentation/mm/zsmalloc.rst                    |  2 +-
 Documentation/translations/zh_CN/mm/zsmalloc.rst |  2 +-
 arch/s390/configs/debug_defconfig                |  2 +-
 arch/s390/configs/defconfig                      |  2 +-
 drivers/gpu/drm/ci/arm.config                    |  2 +-
 drivers/gpu/drm/ci/arm64.config                  |  2 +-
 drivers/gpu/drm/ci/x86_64.config                 |  2 +-
 mm/Kconfig                                       |  9 -------
 mm/zsmalloc.c                                    | 33 ++----------------------
 9 files changed, 9 insertions(+), 47 deletions(-)
---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd

--  
Best regards,
Xueyuan

