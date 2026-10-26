Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048231;
	b=5mBVOZ0lXVR/pTJ05cd4WXWN8Q1+iwtlbaa4Wy0JSQ7O0SJozfmGOUR8Po9SaWrosm6h
	 /xRaw+jctfZQW7e4QIxPTVQHeHaoD6yy+LNUBSJClba1s6CsDXgjY/e22yvuzOFpJOQcD
	 Uyx4uUPdfwSLyrrPG3qfGaTPQR5PNTfMwEiLp9q6yqBk+YA7AiHOEiskL/2OcV/5OSZR8
	 DGa2uH0j+p9Vkt4Xg7vFwI5NJp5YhgFfHPrUPfO3x+2O/IEV6ZsUta/MfFfBU/vtDkwCa
	 6ySg5kZrdP5e60OWw2BN5Kvjn3T7u3gvbsAJytKZwega+x11Pn+WV5bUFDgSktjGzcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V67+FxKk3y5OO2gy++J87FLYTX6VlhstikqZH6vOo0g=;
	b=uBnbe1gGgb5KZ/h3cX1quG/nN/kaQifLfY51xDqOKJeGP1dn2Tc5/ow6NyjVRKkTZUOB
	 fpPkIsSFkzd7LDbNHNh/VerfqZDrsIxdL7VB7JIwt/dtnTdcySn1ip4HmfAiesu1s/SRt
	 /GoP5UtPbhpCJ7NNnqnCpfAx4KJcul63uq70LZknQ94JlZvS8YcyJD7qwHJ2jJlvYlTPo
	 CDV63IvkHIxCwWuWsnKK2BV0rOSJICgtP9KxR9oAxs9GfkxyOo6t1LVxwbuiHoDGi2pEi
	 STknWXLtZ1Z4ZlbIt0krmuRsSJGFAha+Gz9Il2mUMtG2oD/X/eGayCFeAl1lrkG7t8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HIfeYggq;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC06C606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC06C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HIfeYggq
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso4799825e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048229; x=1793653029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V67+FxKk3y5OO2gy++J87FLYTX6VlhstikqZH6vOo0g=;
        b=HIfeYggqWa9GaYp9u12rT5ntmit6gR3K1jGdqHreVjrrkTQsvg/HME13ej2a2rUg5q
         cdvBAJ6OBv5YWCmNxeFsTgeXZcpDcbLYNaxyLMTHRHsOIcDfpjaPI3dyKk6ZZhe0Ik7H
         vApMy3kp+RD5r1qDeV7jZWJT7X6xsUBlWQhRFfhIegE/evn7pBqQZmBVJKBmyTpeEuXI
         Pk7aj9BApm6C+I2n1b5FbeAhn5kExruzUegnOSNzfDwNM1bdyYYQBPiBkb7+uVKqRsBq
         L8Sv64PeXHZlNSdtVkDCcrikzxisatvah+mGXu5ZqaO3mHmxzGUXPr5EkL9CjbP83+Rl
         3B0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048229; x=1793653029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V67+FxKk3y5OO2gy++J87FLYTX6VlhstikqZH6vOo0g=;
        b=qHTIDFjECsKyw0n8xpKGYa+M2as6gcKSX9/zie/40z5rwC566Jo6zz9iGck7xZ1sFy
         MJeeP4O71221NnWZNc8dx2lEAVCPmSfHS2h1OABV63ukrgISgryVsxaZC+1WbYo0ADx9
         lDQX/b/qdzOwzP7Xfh4SwXUI1wgqZTKyWWyvfTUpXZiejssNE3PXovCtxegiRInXiVLu
         OjLzfK22PxtLpOYOHJriFhkl8tygJlrdhnu44CaaAExJfuW7yszCk3DMB/WxUHOpQheG
         W/YwI3sStnPA4Wx6TFRd8A1/I9Flmbb6kKDNvQuj74mJi5DugDA6gvIKXLa/oosEm4gt
         sJLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzws5bh7kMB2uoWEBf9No5RydM3rsD49GE8JmIX1ms3Y+0pR0XpLPI7ovMilR5PeZMsyem9hRgE+NEJ/38=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtoIeHHs6ZcqwVYMVUUUZnNwP4FyP4r2pJXya9UuZLOQLSwDcT
	2PVZdIJg8dKwo6GXabHkeW51Ee9peERVhi3IQ6YPGJ2qO1kjVm234mPC
X-Gm-Gg: AYBFou24K86SucT2xB3/+XvD0cQscuitcnmrsBQjJXfSzd/pWjpGKX6Tahj7D3JW/nM
	/RvQ/4HVFbLRgDeSR8eRftRXx2v/dsq+kf4jBWehIGMMOMlL+wq6UH7bw39HaDJ9pmcVwTfwLPm
	A4es1wFZ0hMoPC8MIeRexBFZMGJ9V6wZu8D4ZsATDhlL2MtAVqSyGQWBZ/CWFTtSidKkkxayq3L
	nx53hn8k6kBG3RicCPHRGYTWJdWA2DBfTECgULYIf6sbqcH1yLRprqJeqnPU0sYJ/PscpvVGOMW
	b1fEB9eiSDHPTJbUOZJxhKi2qD6DBQalU3whn3tSPu8an+7/T2taC7MoUfSV8hcZ3FG70MBT+mM
	kCuym76S1ZAVn+YLTQV66cN7oFqI2G4Lif5A8a4Y4zMXLXPRcFQisBAmW138zsyX3UU2SjHQ7BK
	ALBYYXuU95yBAmyMQj3qA65QNG8beVXIO4PtDFmUpK6yB3iKfPSxW2EmsQb6nNODkIPX/TEAM6I
	CzQewXCsetve+22yERSMWANgGDySFqIBRszHmYPiYTq1JeuFnC8V9HR9axjol1bmtmsQtB9go6+
	mA==
X-Received: by 2002:a05:600c:4e87:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a35aca7643mr165038545e9.25.1793048229307;
        Mon, 26 Oct 2026 13:57:09 -0700 (PDT)
Received: from pop-os.. ([87.248.177.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a029332sm193725085e9.4.2026.10.26.13.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:57:08 -0700 (PDT)
From: Albu Victor-Marian <albu.victor.m@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Albu Victor-Marian <albu.victor.m@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: checkpatch cleanup in ieee80211 files
Date: Mon, 26 Oct 2026 22:56:56 +0200
Message-ID: <20261026205659.181065-1-albu.victor.m@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series cleans up style issues identified by checkpatch.pl in
rtw_ieee80211.c and ieee80211.h.

Patch 1 converts some rate and mode check macros to static inline functions.
Patch 2 uses BIT() macro where checkpatch requests for it.
Patch 3 fixes line length, alignment and a CamelCase name.

No functional change is intended.
Compile tested only. 

Albu Victor-Marian (3):
  staging: rtl8723bs: convert rate and mode check macros to inline
  staging: rtl8723bs: use BIT() macro for bit definitions
  staging: rtl8723bs: fix spacing and line length in ieee80211 files

 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  92 ++++++-----
 drivers/staging/rtl8723bs/include/ieee80211.h | 147 ++++++++++--------
 2 files changed, 132 insertions(+), 107 deletions(-)

-- 
2.43.0

