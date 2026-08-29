Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D77A3264C1
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989629; cv=none; b=afNagiAzL/FbN3Cnpf+jruqkbwV7fPif5RuqlO3+8qpyVXww+WgjmxlUr2y+c0knHp3fG3kH0RPxT6QqXea90zrHfLv7/ZvYh4Y/kMuhXwkvcTrJOV4y7FGhESqghs+x6iUK5flaftxuXf3UR2r5kZ1CgLHCQaMve///0abuKQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989629; c=relaxed/simple;
	bh=F+k64I/whcdTvBpi75E6T6u1RKpAOmS/TI4FGXuJfvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZZqviNshe2VcsknMbmgNmdK4GY7jOXk8oYgyBgwSJh7NXOXACSU/pujEmdGFBz88WFeIGKV1yUBUBzvscJiM+wKSfWZO3+qSb24PKCIICiUrtmB47F6UvVvwWRe6XfGH3XDvp3XRpc02huN2+YjTpFiqE/tDgu2/WZXVa8Gf7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeGaky8L; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeGaky8L"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6efd73032so24756695ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787989627; x=1788594427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlfOvgBEtySKIOUVBBOTKpFAbjQZaUCTZO6eqUdoNDE=;
        b=IeGaky8Lo/o8ALrS0LKBlKF5uUWMn3pZkRjKtfd2l00d0WR8yPcafWCLievg5+zj7Z
         mdm4VlgBpd3DciIUfgtcB1F8ImFLhnIcxxEsM68II4jrbmP02DXKyx2ybcOPdCEKN3PW
         KMpSmaEjdFx6caJYwfHjCeV0mJk9HrFqErP0WTDOaeQ3qPHttLEIvEhdGpd3ug77KJKx
         PuMJavbY9zK2oo81riXmF0E9Irx6h2lSZ9/V0U/ah8pNVXKgzW1OdIM1KpCkPcHmZkvc
         ubWkvdXSCCs6mqvAFD6Fhf2yTXO4TEm57dMhFQ1MP+UjpcDpa2FY5i0uUBHrH82dP112
         c4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787989627; x=1788594427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlfOvgBEtySKIOUVBBOTKpFAbjQZaUCTZO6eqUdoNDE=;
        b=NlZD3M09jNrlrIcUDt/VEOEBnWxKGkAEBWDc35siFp7tNdo0T3CJBTEuvJmT/FJHqV
         de55Cdc+32/Wgf43BJHqC/R00EeGawCcV8fiHzMu6XJgjzA60W8/kWEl2jWNVi5WL0HN
         /O1xf/rliKLG9bQgsPpfnT8qd07KbR1k9b17mAT6gcpWWFYZRfd6wXvwJdau5aVZQh/Y
         BRCerdfFfLUpecDg4dQ/13aDzaLAVp5o6tK/kWYjoQE55Uu0E3NidvB3o96nMZEEq4kN
         H52/A1ZXGopg1JGkbXra50I4D/KYtiOtQ02g04UCXhArk6nZlOjSyiA1e4Unre8gRVOr
         k9AA==
X-Gm-Message-State: AFuF++l1o1jeol9Jy6R9giz7iH1daD+wApx6maLq8KzhnfL2VbT/nYwb
	AFBV9cbsKC1/A9qX8ZlZ5gEQcJAkgAngaoWUrp474vVKGUblooE93V1M
X-Gm-Gg: AYBFou0C6QOzH8SfGSzIE2rTSvQIzNU2YbpKxv0wNkQhHX51BC+Hf+zaxeugzatkpKj
	08eVTDiU6M9O8vVUZOmnuxjJEN3rCNHPsdcqsnAeSngORbMRo62nAY6AfO5d/oBWDBZrt/l9tIh
	TcR+6J7+H+g8Yltr4jrcPT7jhnFw9KSMyhnb8rl/wgi7xclCAsQamyc47SKNbiw1MZCoNyFvWk2
	YcfN/ZboLWJMkjaFBP8DLbUsTY1xCzbC7PJAbP9bfETjxyUjobZse8llcNq1LlJSLMWk31uYr9x
	2NpMxELJv4nttG+CuZdRDZFsTF8CTpbl9gZmvQX+owvupDJrd8ItAkq0X4iQY+EilzfBR0BdDQQ
	Jn4/WVl0QV+bJqYKFr4q/spAyoDhrHz4WBrlPERoVv8h9a2N6DPRT4WLa81kj37GqaLjeKdUmOm
	hGIWqV5vMTS4L31PQR6mf4k2V3k0elSurKdE49xDwZh+Hsj0sFOi3XnQUyfCw3f/0Fu71ztOc67
	44ghM48dJKgAxGs5D8ZnxKmivol
X-Received: by 2002:a17:90b:2243:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-3989b3097b0mr3060892a91.1.1787989627434;
        Sat, 29 Aug 2026 00:47:07 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1992435sm11159127a91.13.2026.08.29.00.47.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 00:47:07 -0700 (PDT)
From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [RESEND RFC PATCH v2 02/13] mm/swap: slightly cleanup the code for hibernation error handling
Date: Sat, 29 Aug 2026 15:46:58 +0800
Message-ID: <20260829-swap-pcp-priq-v2-resend-2-68d3d925578c@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
References: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Restructure the error paths in pin_hibernation_swap_type() using a
goto out pattern to avoid repeated spin_unlock() calls and simplify
the return flow.  Also simplify unpin_hibernation_swap_type() by
making the si NULL check inline, and clean up find_first_swap() to
avoid an early return inside the loop.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Tested-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 mm/swapfile.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 0f962cdfa5c0..46772d0e3e68 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2260,21 +2260,18 @@ static int __find_hibernation_swap_type(dev_t device, sector_t offset)
  */
 int pin_hibernation_swap_type(dev_t device, sector_t offset)
 {
-	int type;
+	int ret;
 	struct swap_info_struct *si;
 
 	spin_lock(&swap_lock);
+	ret = __find_hibernation_swap_type(device, offset);
+	if (ret < 0)
+		goto out;
 
-	type = __find_hibernation_swap_type(device, offset);
-	if (type < 0) {
-		spin_unlock(&swap_lock);
-		return type;
-	}
-
-	si = swap_type_to_info(type);
+	si = swap_type_to_info(ret);
 	if (WARN_ON_ONCE(!si)) {
-		spin_unlock(&swap_lock);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out;
 	}
 
 	/*
@@ -2283,14 +2280,15 @@ int pin_hibernation_swap_type(dev_t device, sector_t offset)
 	 * the same session.
 	 */
 	if (WARN_ON_ONCE(si->flags & SWP_HIBERNATION)) {
-		spin_unlock(&swap_lock);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto out;
 	}
 
 	si->flags |= SWP_HIBERNATION;
 
+out:
 	spin_unlock(&swap_lock);
-	return type;
+	return ret;
 }
 
 /**
@@ -2309,11 +2307,8 @@ void unpin_hibernation_swap_type(int type)
 
 	spin_lock(&swap_lock);
 	si = swap_type_to_info(type);
-	if (!si) {
-		spin_unlock(&swap_lock);
-		return;
-	}
-	si->flags &= ~SWP_HIBERNATION;
+	if (si)
+		si->flags &= ~SWP_HIBERNATION;
 	spin_unlock(&swap_lock);
 }
 
@@ -2348,7 +2343,7 @@ int find_hibernation_swap_type(dev_t device, sector_t offset)
 
 int find_first_swap(dev_t *device)
 {
-	int type;
+	int type, ret = -ENODEV;
 
 	spin_lock(&swap_lock);
 	for (type = 0; type < nr_swapfiles; type++) {
@@ -2357,11 +2352,11 @@ int find_first_swap(dev_t *device)
 		if (!(sis->flags & SWP_WRITEOK))
 			continue;
 		*device = sis->bdev->bd_dev;
-		spin_unlock(&swap_lock);
-		return type;
+		ret = type;
+		break;
 	}
 	spin_unlock(&swap_lock);
-	return -ENODEV;
+	return ret;
 }
 
 /*
-- 
2.55.0

