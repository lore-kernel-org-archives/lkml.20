Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00DA49B44F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370231; cv=none; b=fAmIMn0pgyuQvyb3Nbzb4eJ5MSKkKTcP3+vLsetePTwxZzE/SxMt37lcglK8vg0BaNBysS8Cq+b6WOqvDz2tUpxhgJx8TOEZPpcWZFYNDoLKCb5WmeZcWxQyxdgOuQzL/huwubR/gcHUNOt7KVeaFpYUqWLBsEGHmgjqx+xl7yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370231; c=relaxed/simple;
	bh=Rqq82mXap3QWi8qxupFNRiibC+E7mkRico8pb8TXSx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VvOG6laDauRddjzjMUi297fOUA9JosQQQuKVHtbGJ6MTUwqgUPo5V5EwmwBqNlTTl5plNcDZQG/iRv7sj6OVW/bJkIwdXGa3F0ib1PbT94MUDSpReDyAaH0fGQka3gn8m6LRvrGkpDl+FV8nSSVhRuVNonVDM6v+eMIMqbwExIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWNMhMMj; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWNMhMMj"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-891d19d00ceso209655b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370193; x=1791974993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7ewnhiOAYTkhckTbYMDVbfEbiyDiHZjPtjjAe7KL24=;
        b=fWNMhMMjTXKiA4GiwS5OUZ5+HpQmcXXcNfDLBepQPSL0m2KXUu89Is8I6YYerPVQfD
         0u0Nbt749WtIFutDDNDrBUcHr+6Yw0XQSYoZrFAQYOMtMQbmX7GudFpVZlnNzl/PC5Fb
         yDuPDwu/SAIUj/E5iWU+aQ7EDW2FVSsKmxmDyNPFIIlpbqtNNQaq/34h5mQ5QVyAj+X+
         Y/PnTjW2MCFjsadr9G2R8bug4sRf0x9Iko2tOZ5O+iXnJEhMi/fUqSKO0ulJIwQGz2Xb
         S4Bj/8URmzuLhH/2nyJq8EPC/iBNChEuifMdlMh24MrosAvBiF3EKAIsJGWZMbD3qxpw
         a+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370193; x=1791974993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7ewnhiOAYTkhckTbYMDVbfEbiyDiHZjPtjjAe7KL24=;
        b=U9S0RtC5KI74I+Bl9pUbjnPr/Z/Qf/F1nW2xIqLbnearbAq/p3VV4UPf9u6fCnjJAd
         Xm/kjO3upwBchlYunJRKnoMvuTERzrsoklIpADOCoNv+qg9XSIaAYDWWrRRVo3P1Fv1L
         TDZEibVpPO5Hke07wZflzIQ3J+YHFbkeWPNtocMJZox1sNm4krF5a3F3bK/Govh6CZC/
         4IkYn9fLWU8fbE0XJ/J7ZNKM92XXTh66m0sJizulquSqyGyxaMwae6FsKseiHgDufptg
         gD5XLMx+EjssPO+KtmXhmJrw6GCI6OkD2F+QpxUBLQqJWMrpzHq54ljNJk47YaqfS0JJ
         4f6A==
X-Forwarded-Encrypted: i=1; AKwUvByc6YBgBSiAAZmQtAC0SNtByX3jL5b4wbID1PE1Y7AFBoQYv0v80TQA2UStBVWNr/2JQLKayABoXGBtecg=@vger.kernel.org
X-Gm-Message-State: AFuF++ndpuBLYzejE152zewi6MoY4K9TzWk/FHG6oh8aAUylRWYCe1dl
	Mnna5zYHsNcS7o51ekemP8upcQ0Vq3DA1j+xqrT87oeEH6Gy8gS1dEyX
X-Gm-Gg: AYBFou1RCIiLUM7lRRfP2QcuompuUA/O38IYeOdQQoXk+PKaSsvDVjC+5fp/QBmEz5Q
	jakGHhE7mLwot+KBFRbEAG2RPtCKB81WB0OsTlLabnnAniYIre3qPh/UZNF1571xMfli8a9ZXoQ
	u7ihypRrzBzu/XatZr7by8IUcIBOxPElQfeVSjc946BWuLKi009ihplT+WJiVabYPMtjcusVRUZ
	4PMyOjBmXJR8fnW9jkJ7rX2KCSwCl8sB7O0eJP8/Xozpo1cnbyoP1K0Bn2aNXVXwRhltZpWLFgU
	TBSNCn8ErEQDDvXQABK7thoQ4ofId52Q9xxQpxG/GwB/TOi7oeFduVxh0RT+J/jHz2rrM6P2zjG
	XgjXjMGbbuyx62hU2HOwUDaIoVejIdkdY1I4wOI5H85OsosVVGcs3qHwYvRXH0Gim3M0CBjsthm
	RmIiO/jTIEj1tQsp4K3Lww3CME3hrhluNZquL+4U6gA7iFNK1unUvC/K980ALmaKXUj2AcJZSQG
	KSanifp2HCWk8bRqemktpovG+6YCoLjqcQyB8RrOhls+8PiL5JxnTUdVYD+5aEWMOd0vI03ahvv
	O19f80YWbcY97A==
X-Received: by 2002:a05:6a00:4106:b0:880:4b56:dc2c with SMTP id d2e1a72fcca58-891b138dd1emr1529776b3a.34.1791370192900;
        Wed, 07 Oct 2026 03:49:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8918891808bsm1197898b3a.10.2026.10.07.03.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:49:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Luca Weiss <luca@lucaweiss.eu>,
	Hans Verkuil <hverkuil@kernel.org>,
	Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] media: i2c: propagate GPIO errors
Date: Wed,  7 Oct 2026 17:49:36 +0700
Message-ID: <20261007104940.507820-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

Some drivers use devm_gpiod_get_optional(), but do not properly handle
errors returned by the GPIO lookup.

This series fixes the error handling in three drivers by propagating
the errors returned by devm_gpiod_get_optional().

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  media: i2c: ov2685: propagate reset GPIO errors
  media: i2c: ov2732: propagate GPIO errors
  media: i2c: ov5647: propagate pwdn GPIO errors

 drivers/media/i2c/ov2685.c | 7 +++----
 drivers/media/i2c/ov2732.c | 6 ++++++
 drivers/media/i2c/ov5647.c | 7 +++----
 3 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.43.0

