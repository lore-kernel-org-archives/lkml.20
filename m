Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949BD4A13A0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612286; cv=none; b=VdO63oxiOJ/lRj1NEa5j4A3jAQKKWpSiTf9ShXJUvUoD2bOOtWfvlJ8SGlzOaQpkMA8YQ1U8uYjVNPgQa3vEC+/vBtiDj8D0qwPW0S0pI4jle5f22UHkJ67NW1Ef/d09FHZCXJHVm7eer7R+K8gQkmwjMLUfNzFYzqUoZMnK9es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612286; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYzSmqw7H6ClE/ejV0jCFs6gLUMRUNaMCQm7NfUkeIfN53gexoDtwKKtSgjgbW7u8y1HmmGszMQZWiH4oDv2hzC+uiLX/kRjAr3wmD0l1u6bAosmFcthDu9hD9tjEdAYJnNNuree3MHgeU7CgseH4QIYvyPSSBClDrd52QKQ5eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxA+t2+o; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxA+t2+o"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-85590c5aeabso1319585b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612284; x=1789217084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=kxA+t2+oXL2x7EMXQO7yKd8Q2TsrzpN5J8KcJOxJtzo8UCq3Pq/eQ6OvRiTbgGBKxU
         FG+jB4lrUw+ogJbMGc97bJp0QdX+qQ3BK2GPWguDm7swABoeHQMsqmGcQmA97C9Fwg87
         4yx1Ama1LFuuEwDwqpCNuCA44gll0EabgP7oCJwFKGpQ5NOlDYja3XbJ0+PkaGDAt5RZ
         +xf/jqCwbhA94ngMM55TRADZAAVSgHx55/KmIatYzZFnJbkstYvE7oH1T76VfioL9+T8
         Fv2sShwtLS4PLZy6xiVs5TQmfgI+fDgrCi1pWTrl0JpdRy1g+SFUxkjJy4RjNKv418nJ
         7V7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612284; x=1789217084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=lg20FgipNcu9wt4KyvjK7qxCZbDemuj0nHC9Rez83V51QM0Ee/YW6XIJZd1nexQ9N1
         4P8RwgfkYjL1J01Z8YjRXuFtUaXjchsA1/jOUvWj9DCj8bbds08si7IGSS96J6wSEyk/
         IvUHOF86SR59fYVjnqCXOy5O68md9QxozkNb12ExvGK/2hb4wGSl6QmVN5ZWC4KQo38h
         l5Uf0uhe9FVI3OMPIlkX9PCI7Ne/A/C5prqTX4SbaTIofrq9HBGpFkA/DTWUtRYpwHr8
         7FjkOxZrmTwUpWy62OMg7u0/Bcqp7M0CK8yO83VyxsePNTUCH5q7+k91AlEaSM+BatG6
         sP2w==
X-Forwarded-Encrypted: i=1; AKwUvBzzhQYX/nudAbz6kNv/MEw4F5I7qxlnRBJQo5/ZKgITqwDO/ATqkcREsi8xkBm8DYWhmgelw0Pinz9evjI=@vger.kernel.org
X-Gm-Message-State: AFuF++l1vrxJ3Oztb6TKx1knR+bp/jnn+LwAIWEuPv6gheHL9yYagsbb
	9bUcCjnmPzYIoKquSK9yBcP2H4dl5RRp0L90KRyXjZpW9pJ7uZc/OTX8
X-Gm-Gg: AYBFou3ukJn3tPL301B4STcE8wYM9Z+g10eOWqJTTtbhaqTTuq/BzBO/PSKkfbHtSv8
	qSX9yq60rTLNlMoWC4+mzDDsZvMy7hx6cPmJfEYMCGD9Ro+slygau192+kK4vGotofVbC6iiyZp
	EpFA3otO5emuK9vs6sNmPR4bBtPEXN5B2bJGeL/6b41oTGUQVilQ2dz2hbku8z3WhLAFF0iuz0/
	t+KXte/GcvUJ1ugjqsBAfvoQJVcKavGiU5/nmVdffVrt8Msb0K8oR860RzKfcjR4NsTOvlTIl2H
	XLoJTDxFT8X7mKWxswtAKtoJ+ldgypR/d50Gr/4cTu3ZIFDiHNksqYXh5R3Qs3kgf8urpie4bVK
	QES25S9ETUZbkbE4TAS4Yf1jET83GAl58QeuTCXzjP9qSHJUHW+mgCYnxG+n0W3E1gQsnKMOM1b
	6mU8BGudvISj+4ru8WEdzgonew/oCMpsF0ZnIQDeAdzdjD9iFAzmljYNwWThNdPQaxmhUxYUUo7
	tys61ZdZyZTRu0b0z9tcz67uUuRgwCrr+y8/b1E4ATK
X-Received: by 2002:a05:6a21:b97:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3da3a0cc429mr18182599637.23.1788612283674;
        Sat, 05 Sep 2026 05:44:43 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3346ea43377sm11740417eec.3.2026.09.05.05.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:44:43 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v7 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 09:44:33 -0300
Message-ID: <20260905124434.6163-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905124434.6163-1-breno3011alves@gmail.com>
References: <20260905124434.6163-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..f81d1f31a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316)  += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

