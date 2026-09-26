Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7649F346FA8
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386029; cv=none; b=bTgYNtuXyQOOQGzclYiAWUaX4t6mSlrYWqTQA6CCrR/FzD8hAZPd6r7GWE2G2Kb0MCGFKaXPvu6EAOc+IymktNGxKaWYZ+Q+AAWW39IYY/4sRvWXw/uF8gA3KpXscXSYtmMPv0Z2HvRqJx+3dccft+/ps9+CahGlhfet+jzxOdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386029; c=relaxed/simple;
	bh=63YgMjSoshar0xDWzMVLixeTo3R/48xbfBz+bAHRHOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvMz66rXSathKWyxsb8gxUBDEyL1MtimQIrvEarGtc22NdR0e4NboKT5m7RMbd2lE210s1IwiuLta0lr0XCiUD5HQYe9WfFgLFbDqZyHAeYQNOojAV/Onr9Axmp8Z4yN6/sjLMm0Cn9y2QUP559dYurQW54uN2TNkUHwAidDrhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCX4fauM; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCX4fauM"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33e619af891so962045eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386027; x=1790990827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqsezoWP2Ednz3QYVwaxDEsfOUo+jPEkG8h1FlSDS0g=;
        b=tCX4fauMAyONSozS2L/HJcmsyzptj0Eo4obVc6Ro8ARhORFOeF2F44IULfdecnSA/Q
         +/bgbmeI50XVE00jVzqQtkua34C1hrUZ0kPydSmKuHE2tImezM1PgGFepGeTCQ+RxEC0
         8mvPeUtN+UmdR36EDUXVgZkZ6Y5IldDS2WkKlN6bAA/7VAYX7OMfgsumxuxLlN3Z4LRl
         D5bG0LSHBsXttp9j8AOTIC/AJCMwgJhuGNoYgGm5AXEXn/PRBDbUp9q52vIl4T5wR89i
         uEFFy+xRuDgKec1b0UTnynLLsG7RhVK/zKzsscKUk5GSxthCf58IdLMo1ybKZKH+6aOX
         zgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386027; x=1790990827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JqsezoWP2Ednz3QYVwaxDEsfOUo+jPEkG8h1FlSDS0g=;
        b=TlVOOQnad3Jq/+c81tBdj5URm6G9KmVcVnV9Exibgi6Et4mEPesk8EihjCd+VyHd6R
         RbqsPMhTnQpougmZoZQShlMUzZCUT702KE6G3YbdyXUZQGQ1GKOf/ubBd5lP3XDR/jtB
         kG+ApBcRwtvL/KfvtFzve3ES9/xP31ddfq7EzWe4df/wmyHIuOYP8xj0G5YBijDJETHf
         ENaDQmSzzFnx9/tJ5fuHujan/Kya0Rp2BodmI+tUfumYEfi0vKlORyIPso3swvKRNbkR
         9F1e6i20Fmn0nUwLYVd9H6BWMR6FiZkN1CGW+DOeEZ5QST6gTVEqWfztr62XieSPzVmN
         Dkdw==
X-Forwarded-Encrypted: i=1; AKwUvByhWjAZbgDSJVHYFA30fQ9M2dBaCjIV/XaOgDRZmerSpoGB7kGD8jopR9DssCyPNb/XtCCj9cBFVhpkYjk=@vger.kernel.org
X-Gm-Message-State: AFuF++kKXJTlUcHj2tArFEDj5cQMIdtZzOQ81IP8moMtZVq974z/3Av8
	I3nrEgW2cd3EGTZZX4veUTiKo/LjbvzrixUF5dtHlRBFyu5+5SI3wHIQ
X-Gm-Gg: AYBFou08i9+2tAqyVn0TmBs1xUGJnoGioQoS9doSoefOUyFhiapqwCjWqS8PUIWDOq0
	aAtHetpsLxh3eBN/o2tY9itHTg1r7R+sMrrNKRn6EMmIsw9gxR0owYjWtBNTx8DRu/QTBFa19dc
	1fKY/LbztF4VPTM11ZyzlyvaaWZqn+fWrGubXF7p+bI05kXcKrFLIDuqwXGVuBX53Q0pjiJT/Tj
	PKM9SzIcu3O1eV/rUnra2c866sSKGHjQKbzW9Xf2U6AlWeikokhPAVx2Ob3vlWtvj7lnj+9a1n5
	0AuDLpRjex5tNXFAZHVm3yxqSskBaVxoO+1INJrSS2DPj+rmO2GX1EEEjmWi0kReD1FBk5jAWVu
	ETZ40EHWYwEIRlX+Wco9+BWFJW4aUF54FaitSC1Z7ZikOOESKvNVEJsq6S4BhbPQKsEt98NHx/X
	FHbPojcAmb9PzltXthMS+klCrjnbjjYgOcMv5yxzE/X+wPpiU00UPoH9/qkIYmAsuOL9yuMp7/d
	LtWpquP4ZT75TeOQZ+nognNsGapaNrtGv+aJXj0c4Y2uxXRbLVQwPVEzadOShEFNtB7ce3iYjkX
	RX7YhZmK8xNBDjj5lnuarF2VcYEsks1aqhrz7zmcmQP0AGTVRDDVjnHCMeZLE9vvtFgnWQQLqpY
	1qy2w3fs6
X-Received: by 2002:a05:7300:a21d:b0:341:4778:5bbb with SMTP id 5a478bee46e88-3427217ef3fmr1383944eec.13.1790386026840;
        Fri, 25 Sep 2026 18:27:06 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341f2b18cbfsm6746171eec.30.2026.09.25.18.27.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 18:27:06 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] bitmap: test bitmap_parselist() with text after the group size
Date: Sat, 26 Sep 2026 06:56:49 +0530
Message-ID: <20260926012651.15524-5-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260926012651.15524-1-jain.sm@gmail.com>
References: <20260926012651.15524-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bitmap_parselist() cases where 'N' or 'all' directly follows the
group size of a "range:used/group" region.  These were accepted before
"bitmap: bitmap_parselist(): reject trailing characters after group
size" and must return -EINVAL.

Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
 lib/test_bitmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 35bb18f6e326..f316a82840f5 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -528,6 +528,9 @@ static const struct test_bitmap_parselist parselist_tests[] __initconst = {
 	{-EINVAL, "a-31:10/1", NULL, 8, 0},
 	{-EINVAL, "0-31:a/1", NULL, 8, 0},
 	{-EINVAL, "0-\n", NULL, 8, 0},
+	{-EINVAL, "0-7:1/2N", NULL, 8, 0},
+	{-EINVAL, "0-7:1/2all", NULL, 8, 0},
+	{-EINVAL, "all:1/2N", NULL, 8, 0},
 
 };
 
-- 
2.43.0

