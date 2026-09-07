Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B48837C109
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756597; cv=none; b=MTLjpC+EozK3y6D4k4uGSMi9hW/S/tNDdLDkaJDfDcscSD+mVNfc0nwKATtGrNOZAT32XqDQT/n1uQuhq7Ii0G/o8jqU/cg+fQOLm/FVgErULkd7AoUz3zPQYiQgz45UaDiMkDLd2+6IRdKl8j0wStNFYwIegGj+vsRGENrBvIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756597; c=relaxed/simple;
	bh=MufJgkHYL+VNIEsgNZPce4x2p1dXEPQuvTjqk9RTdjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2O+N7dZWbphl8VedhYptAYtnTm4AyHfaUxxL72CSDv7WnMP8IghMRxwWir/r3/SzwlqJn1AHdk0EbOtftUcm2bWQjKerLRpJGGoq6YiJ+dF8SFAXU7f9iRelidStDYOS7k0jWIjsGm1Uuk8hQAHmOFRvv+L/7VJcdzzizyrzMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWS5Ki9M; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWS5Ki9M"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2408420a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756595; x=1789361395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdOEATPtEQel+h6L2ijhx9rvUk9Oqw2JLvQ6upawX2c=;
        b=GWS5Ki9MFtSjrnBbsh7IGk5MEeD7CVTgRZ+9wTa541vhCFEn+hAgx4h4gwnrDMx6q/
         7+SdoV8/N+nS6UL90woUnWGPSsb2CQzgiwK3T4WhsPX0L9Z6UXhgPfWYKJTki0+B9vMQ
         Yvtao6xJwHJj6LQNqzbE4ywlBbdcEJ2BLYxf1pg+Jd1lIITzp8kiawIq2M6rANs4DvxB
         5TnBjmsaa13R7M+Ecv8jR4hq0/UIHTrMrOiJmrMzPwbV4pByKlPFc2izCH5PLSNQVsmT
         O5g787UGm9fvnW4YnhmzenjCdCsMyz0drFLuadN3dfRZ8MmRfv837ajFaLpUx3NT8Tin
         +JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756595; x=1789361395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vdOEATPtEQel+h6L2ijhx9rvUk9Oqw2JLvQ6upawX2c=;
        b=GtpcyRKt8wmQvcNaEvZ5gvv1joTETwM9diNJlj3hSBSr6T1IVrMEmt8bsvJ1g26z8l
         vr6zS22Hdi4zWEuTD+lnDOQZhg/gBChaFI9lng3DRsax9nsssCR56gEjxvfLszf4Gpn4
         w6V9GO0kGElirmTVsqqnubK4Yk1s9VfOmJ/SIuKwR/A0irGYZZLZ7pdTHMG8Tk6DbtTG
         kHf6nFhungktUPjKXeHMN9Kgr+Frccn6G5Pxn9zRxoI2pRWlhhxPYoFLZnv1yJk93yKo
         SbO3hLLYVbr7YHYkEJUh0MtZpskZFUt4SThtikjQ1Uov0TJGVk2bYMgcv2cnMby/KzCB
         fQ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9ypWbqdJjn7GREdgl5Uvwjp/yg5fxtLr8C6V6rFwTZlvSK7DhF47X1q8K++ozZlconil35ghiHeUnV/g=@vger.kernel.org
X-Gm-Message-State: AFuF++k24e2eZZjTqQsQcfH4cpZ/K7/PRTnfwJ0PPUa1AqZQe3u0JxMO
	oPZYwsToQ0LfVlBcxS7dERtsPCCR9zQBaLBGB73i4b7tih0AxtGk7UXL
X-Gm-Gg: AYBFou0izZI2q8ZxpbZEZ1ygAkTJ6SVZ/iTnAQJJDwPvEe9iyQ0ktPjWCxAaQq/wOeH
	8wbRk1tSCrARFcK4qnzbP5j3eTuh3qTjjNIgQnWS0qk/1XLvvEnBIR55Fl/53wWAVrjr9qVEaix
	6TJEOF7j7egCaj2J1gBLObPLgM+bcLfzvN0/Gv76l+igiVH91OcsfsupuHaLOnawSPzEXfY+rB3
	XdH2V22WQibVZ1P/8rylfaPhIo6/EGIedXOkeCqN7GAypAgvmbBqG1NSf2HniZZlp3HMmi+2vEr
	L0+Q3wieUSVafQxwzG80BS0l7aRCJM1HjsS4G0xrpk6/HI+0h4gWES7zNKC7pSjW5LgNHOMO7sN
	e29J1RjroqShDhxKBCzzAd0k3mjbCiBSx4afG4yLWeFEQvoOJEBgisuDDMk5VHm/M1dsSzewgLW
	035g/I522haBXtJfydfTn7K2hlhFnBlmTH5bNfZsGXXIP42+9V2fbzrEDPw+Q7E5n7bRjSBKoTF
	emIsqnKFyug8BA=
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr32748395a91.24.1788756595436;
        Sun, 06 Sep 2026 21:49:55 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm21501484eec.6.2026.09.06.21.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:49:55 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>
Cc: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH v2 1/2] Drivers: hv: vmbus: fix typo "substract" in comment
Date: Mon,  7 Sep 2026 10:19:45 +0530
Message-ID: <20260907044946.10813-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044946.10813-1-hemanth.selam@gmail.com>
References: <20260907044946.10813-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "substract" to "subtract", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches a comment, no
code changes.

The subject prefix changed since v1, from "hv:" to "Drivers: hv: vmbus:",
for consistency with the rest of the subsystem's history as Michael Kelley
pointed out.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/hv/channel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index f4370617deac..c36ec14529b9 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -79,7 +79,7 @@ static inline u32 hv_ring_gpadl_send_hvpgoffset(u32 offset)
 	 * therefore leaving a (PAGE_SIZE - HV_HYP_PAGE_SIZE) gap.
 	 *
 	 * And to calculate the effective send offset in gpadl, we need to
-	 * substract this gap.
+	 * subtract this gap.
 	 */
 	return (offset - (PAGE_SIZE - HV_HYP_PAGE_SIZE)) >> HV_HYP_PAGE_SHIFT;
 }
