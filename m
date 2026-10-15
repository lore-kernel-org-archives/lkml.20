Received: from mail-ed2-f6.google.com (mail-ed2-f6.google.com [74.125.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031D34A0147
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051900; cv=none; b=HyeWIhbG/Up13PgnuuaayZ2waFBXmk+rppFQ/cAjrXnzfElZ1D06LF86WBTWZH1TXM79AjgkzXZvhym1HeTehHKXMrt7jdToaecCMeOkg3q8f5upHzPbmi+LDBb7uvdpTTZ1D6PvEEtXRgDk2kG0FxVRs1OOrzUXTJuI94KAi/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051900; c=relaxed/simple;
	bh=2r3UVH+gyPAGLc1KXm+ystOLHCuv31r4fdl346qvDdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YI/668/KldvyMCjhyiDY4e3SYcxDGYw4BPiV47SKDAgOyiOjmM66ihs4dyU4OyCteFn+oFKXYQxqaTeWFeDA+7ERSE7wtTBSmjqF3Z6TGn0JsYuvnqb1QzDyaARLPWEqIMqZGucKaAHg953oRnDkgignWAT4hFzQ1SI6q2o+g78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hydLT4e3; arc=none smtp.client-ip=74.125.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hydLT4e3"
Received: by mail-ed2-f6.google.com with SMTP id 4fb4d7f45d1cf-6a5d790cce1so1019616a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051897; x=1792656697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJuw0HG6b0/g50rFnImD3mqXWKPn47lEKfqXU/zgoNc=;
        b=hydLT4e3jIk9K5ebHmQFcBnmPtkptiadJmX5UPwOQ3/iar+5t6lhwuJVEtEeyoHCew
         tpK+a6WpQZSo3/hvxgpyFed1mAUxItUOa78+9ROM7XGxs6jTwq05HIqQNC/ryp1TnELE
         1OjyNMDWdmrgHLa3XkPoW40ZGt8AOdpxfHKFc5g2Qq1dDxziuy0L/sh/r1lTMuSntuVU
         n4Tl3A4br3ik8zGRRVuwJ9HfoPPeGdC8YVmXVsxng6agyGvfjCtXe6Is/aDdA2UtVbUu
         MaXgMdAC7+nemxUIv5jhG+FwdnHctVxSyHoyZOIiP1oH6Mtn1UMXvNUF0gSCAlSBgFrU
         29Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051897; x=1792656697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJuw0HG6b0/g50rFnImD3mqXWKPn47lEKfqXU/zgoNc=;
        b=WvhVSEDrxw0U2+vTRCOfNCxmyAfy7p03xcHevO6YMZquFhTbecB0UBddjvSDWiN0Vs
         pLpNjDraw6owV+tOxHppDuBNSNsgxh9fkq0KDIEYgb0wq1od0LPWF33uaRPRLmZXBNnm
         WcEB9JD4Mcl2l4KfonHYWzvWHCCCCEs9NymaKLxwE1cPXs7RfaPTMVVIXp+/xkaKaFbv
         z+u+OnbZ9unuHeBmyEyZIs6Yt982dpIcAGcP8KFLQ+eT1D+1exkSa7CP1PTzYXvbHyc/
         a01GtwpjGocNoubLeB3BxYedq2g0fcd9Ne7ACmZm0jnClNP7b5D9LkQLSl4gAD0YRHAu
         xAgw==
X-Forwarded-Encrypted: i=1; AKwUvBxqLcRSdCBQjgbcEQpORh+bf2TT3hCnVFW67xv+yyL8XsoaN23dxJYm6TvWPK5kFRk/gQl43zWt34QBAh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKag1pJ6Fu266YbW7uRqcN1yGxOZtqLoUSvH7vqdykMrZpaJL0T
	IBHD8rt9eEWYC4QPx2K0NyZxiPpmCs+4EZaXOrLT0xiTCwiXkaHsylLSdtyLRTvf
X-Gm-Gg: AYBFou0AwsyIrZtUjsv2AvOsh0ezOJyBS7Lu3ACUsz3Q+xo6iAH3LRS8lYuEpxv2kbV
	tlT5g0Mgtny/LK/ce4YlawEUcyaPuGD/gr7NcsCUuAbDaIr0E3atMUJ6Jq+3r/eMtnHkIaUOgcs
	7hVdkPcguYpDtRfgnPiQTLvkl3dyE0NRjEP/vtVKNlQY6yXgvOGzb+JIg+B8Yqv7SzFaOyUMTO0
	QtcYhCHDho4cFNTRxOkA250HQb+dBGGzYt1+koZsoBytsed6UEYqhB39JLnwo0c3G+WEszlER9k
	IPwyRphs0OQ/zqGWr+OJLhVEQjv/042rRa83mxS6u1t/ruQh8t9twdFfQ2hGTAn0ohFeocG/5UK
	lDHN+m/Pmz87KhQV7TrA8b8S6wAsP3JTUb72yqAfa8Inm7CLOXrZHEx+tKSGf571skt6gWDXnmY
	MDv7rSovsRfoM+0XN8k2YiK1p476M2VtPGSjY5UfLcF+WyybCDc5DNq4C48IlaTFdflWC4/Wi13
	l8v4tXS8ogxwT7BYE3bGGnEZbmjdjJ0stRxThAp+V1Vqk32Z9jTkmJGwYWcnLtN7xZw2bSBnn+z
	+MtebjN/42YuiMJ6kQbzGJNBtQ==
X-Received: by 2002:a17:907:3f87:b0:c2e:2e1b:30e3 with SMTP id a640c23a62f3a-c31aa00e12fmr1974043666b.21.1792051896835;
        Thu, 15 Oct 2026 01:11:36 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda5297b0sm96080666b.63.2026.10.15.01.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:11:36 -0700 (PDT)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v2 0/1] i2c: i2c-xiic: fix clearing of bnb irq
Date: Thu, 15 Oct 2026 10:11:26 +0200
Message-ID: <20261015081127.1566244-1-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear all,

This patch fixes the clearing routine for the bus not busy (bnb) irq.
The bnb is used to indicate that the current transfer is done.
A high level view of the software flow for tx:

* init i2c controller
* prepare all registers ( fill fifo, enable irqs, ... )
* start i2c txfer
* clear and enable bnb
* wait for completion
* ( serve interrupts )
* ( bnb interrupt ): complete completion

The datasheet ( pg090-axi-iic, Interrupt-Status-Register ISR)
states that the bnb bit can only be cleared if
the bus busy bit in the status register is set.
So the iic controller must have recognized that their is some activity
on the bus. ( Start condition )

Currently the bnb bit is cleared without checking or waiting for this
condition. This can lead to spurious bnb interrupts.

I am kind of unsure which branch to use for handing in my patch, 
this one is based i2c/i2c-fixes. 

Kind regards, 

Thilo Zirnstein
---

Changes in v2: 
- Unintentional changes removed .

Thilo Zirnstein (1):
  i2c: i2c-xiic: fix clearing of bnb irq

 drivers/i2c/busses/i2c-xiic.c | 42 +++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

-- 
2.43.0

