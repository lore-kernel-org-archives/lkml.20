Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AF7396D25
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762226; cv=none; b=gFdVrVpNx9SpMKVozkCi7kOnWBl0YJJBRGMitaS/Jetv0qlHgnx2AGZkA6Xh6ofJfWaPYV2T/B8sBEb3TLBIq+ZRfWzBJdlofi9CHP6s/UJken1HQtr6gykDjID9IVwcn66o6/yXygWNdhP3KOR3nTpHIon5ni3KZaqEObnblao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762226; c=relaxed/simple;
	bh=VI8MxQ0lNW+8BWr0AXnblXDQ59Q+yA+hRIJORHoateU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZE4PVrrcUtOLyvANbTxByaUIkZhkzTLx/CLJco0BikgisPQJ6b/di9zlMDq4mVI8jKUcgNHNGCNlmOfWtggZjzPAHkAzgKtxoEpbOPJS99irY/+OThFCXLefRPoXb5x7NN4YVoJEno7yuMpIuVeeQZ21O/1q5w1HQnNmdWA+Ahc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATirTtnh; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATirTtnh"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso2253043b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762222; x=1789367022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=msXTzYnzJavvzpDXAjHXqbhMmcnKVqpL0bUaIhk+izI=;
        b=ATirTtnhYfelNTrwGaDQnNwEpUDeADyaL3hd32xpvNfcAfRZNo9MG4gAeoOOLpJAPH
         9oNpPXV8dhcz74Yk0CRmTRgodqYdd+vczHZlauYJZoyaUCIaPBEHkUVPZTca4BWoblMx
         xKdW+jJ68xvWu9p0XyhHvXHAdZvqPYwYmILAYkMEYVCvAtt4tgCcroiLil0PCHZKIQfG
         yhWScKtWgQBGbpL+dDtvgT6TA4lkmfGbhVMuIwBvirlxPI1wBG5anNCqWOQh3lspPusq
         bESEdF6TC6bYGbJ5dK7PfRqKh23Uda5HI0UiLS9uLfk8AieKvwhfbROC3qYyihFu8u3O
         uBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762222; x=1789367022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msXTzYnzJavvzpDXAjHXqbhMmcnKVqpL0bUaIhk+izI=;
        b=s1CtlgXOtfcoe4MOviz/1RZcPt3q/Ww34OLQ1YZTWDn6oDPHCpquUFZP+Ic6EKxvm0
         Sa4A+sYeIa1UtOT54W95n3wH+Hp/UeesF5byd4s5CwEe+oSBPQ8g/fCfdY4WF705EBR8
         ylhNkNR+Da6aNevTz+EHN2KUv6YrXDFOQ5avpSBgcAwNvu0eLHdIkaPw/eKnPhfW2XqO
         D3NC8QWMv7aMy7e7N2yx7rc4HpJ8lgXvWgLwahKY1dP/sAliLHQC5U4ysCOPezmzSlfU
         fUtuX4/fzndG+6B0oFQIlXLn3eb1t1EfOF47PlV0QmIGRwp9jlFmU8nIVB1VoemJekDj
         4jaw==
X-Gm-Message-State: AFuF++ljNDB2wdqZoa+qnT2GW3Ka8R+lV03ZCPJ5RiTl1gE4xJI/KJNI
	oDtrIPZnnzoIXuUHi7w1T1UDvFizgChITsSBIveqXdcCOGgeDf/ASoiq
X-Gm-Gg: AYBFou1MeAUk0wgWFBUg5e19Djz5ITJL9iO1cd0U4knyH+Bm5ekWlGZR2cgf9+ao2i7
	Q6ruFCurQEj8A6nif6VtJv6y2iK9VcE1mqsFNUB32MZ9PFfz4ya7t0W8BtA5jnoQsTmAvdcDfx9
	UJC+sJK5nfZ8UPCKa+IeYDj7QCvBDE4QyLDuGUHSKN/yMaeS0ldC9+BnjGCXsONTkUsmAWBJJQv
	L/In9utnyxx/mvG0W4e9V4LJd/zYlBlyxAAUOZk8tqTA7bN1Vf+pPrjXMvRHqa9wJu86xeJ1eLo
	gc6c18rMpVE0xpsgpqOxSUJRmGG1nhBjVvJnSHJZcF1qYtK9hp22fOhptkf3KnZuhWsApzLbLHD
	CIo6q+yZANNW+Duz+aysiiOBhxFzHkv2GANHOQEy1fJfSTLMlak5u5JhW57jovwl/StHOKV06wa
	C0ALMtuQCaFzD5yzSjaVdIC9fFEeuaCvC6ibzfn0+vkRmFWuFOLaAEUPw84Xgcw0RwxKaevvG/y
	um6R0yvTbfiKg==
X-Received: by 2002:a05:6a21:118e:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3da3a1cef30mr33680755637.25.1788762222314;
        Sun, 06 Sep 2026 23:23:42 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm27613457eec.2.2026.09.06.23.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:23:42 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] kernel: fix typo "upto" in comment
Date: Mon,  7 Sep 2026 11:53:38 +0530
Message-ID: <20260907062338.10890-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 kernel/workqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 1ae3732a2c51..b6afb7cee661 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -8264,7 +8264,7 @@ static void __init wq_cpu_intensive_thresh_init(void)
 	 * lot slower CPUs including microcontrollers where the threshold is way
 	 * too low.
 	 *
-	 * Let's scale up the threshold upto 1 second if BogoMips is below 4000.
+	 * Let's scale up the threshold up to 1 second if BogoMips is below 4000.
 	 * This is by no means accurate but it doesn't have to be. The mechanism
 	 * is still useful even when the threshold is fully scaled up. Also, as
 	 * the reports would usually be applicable to everyone, some machines
-- 
2.48.1

