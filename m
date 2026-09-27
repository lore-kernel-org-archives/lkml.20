Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4087F311C36
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519688; cv=none; b=e+rcHR7MFJlDknOBwW//+b6LwZaOJQNTTm9QPnCkBqZ+El2sGLEKT6drZ2PJNSoOrNqzhiwSfKS0Fv1YEs6AE9115aVgGQrCUj32vspdDblVGWzieXdGWm99uvNKAso2xQwrDfSIRe/GuIzppgjWVdFVP56uQcW3ZDu7+ZBBA/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519688; c=relaxed/simple;
	bh=t809EJHx5kUQBjDntgyGjqe3vqFHCFfH5QgQ2pb/Ddw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dMT9Qc6GwrUahZ7kxfUOwkPoqmfq9cXolR0K+Y179y+M8pj4iKBbwKp+ucuzcnfRQpd9hW8xXwSFQm60upnKH5Ax2M6zzZ6M3vH7bEktiGMb6RpDr8mRL4u7e4sXS/nCSQk8fOuqvkvXsaOu2uHbYV7/mUmMJ3etj/u3GJ9/TiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qp7Yt15W; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qp7Yt15W"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3429bca3880so1762130eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519683; x=1791124483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhDenXpiUHLZ1Ej69EgBT1lJ0mR2rE8poGppaQ4kv/4=;
        b=Qp7Yt15WXhu2YVs5mMOLuG012cODzXYrEqLMGlEeIxyYAoHioNV8HA1/DDz3NEZPVV
         pqYLjXDQPnKJro7Ux4y7d2DhV0cW2UL2IXkGVTsquqnwTF+EbzEk86uVp/5e+KHunxgX
         rPJv5KwHQngY1MSODLxH1Tb3yY1srLtNVDYJ7DzTcYZaPzGe7ef9uX1Uj21V3z9KQZnC
         WttNSNSLfQp8RQQ6j7YeXM6kkYbrn3G3Lot5DX50FDdOe50qtTn8YJojXa/3J1s4TX7C
         xKy+Y0PrNsRi8dcu9oA01ZVQ7Jei/Ohqk+n3EMV6lISFNhw2lH0e6EJcFk2pNMtQY2wx
         YGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519683; x=1791124483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhDenXpiUHLZ1Ej69EgBT1lJ0mR2rE8poGppaQ4kv/4=;
        b=0NC7GYafkH2orSYUzlOADWJraUejbRQKQDXChzhw+yHRIvIyNjV0vervNJOLXZYJLA
         pdz9ixjphr5WHVHAZXrihHX5e/YAerVe2opqRV5F3L+f3OGnX0h2aLPeyke74/5/1+jP
         3RemXfVyO4ATiwZJ5SA0elbhWYhfELsEvE03kJ3k+mgsYvAX1sL8X8F/RaDkB0waCq0y
         TWirqm0GdF3lcYGBzoatVUVk3FSrUKbx/Wdn+jLol58Kq5+g2ewLZn3FsaTK1w3OW3tZ
         CvfTS4UIa6BOl4TU1Yyo4dxQkGFNUszUc9qruDXwzqsdg3nlP2PkxFRk0aom/MCk++ME
         VpvA==
X-Forwarded-Encrypted: i=1; AKwUvBw9vyPXOE4QmbT5I87RGIMMSatiD3naX/hbw0VwP4pHt9axmAwpijoUqQz2teNzFSR7ojDcvkbFDVtJ8vk=@vger.kernel.org
X-Gm-Message-State: AFuF++mfZX1ZF34/+ngkrXqitgt36mZNu7+ZbCoQCmrDsV3U9RBTlDPD
	jSSj2xsa4TKbDM6x6Q149l5Jn0dLXZHmJX5V7P1QdhcY29ZvOhm4ZfR6
X-Gm-Gg: AYBFou1gJet0p0Xc6OITCQ3K/+2hCFLiIy/EMh4PXUR3aVjVHbeXTaF0gprDUwj2Kg0
	5V4dAV5tNQk7g3CrhVnU9+AyRjqlbmZu9btRSw/HO0P1TTxuC+mPKixhsUrobQXHudrjLsnWWNO
	IMWcjgwnxSUjQ4sEj6d+oVV9CkUYyJVEF31DqtGoTJzSeoYVmwzZ3X8vJyvZZd60B5H92JEOkVZ
	SCg57D0aO8kxIaMrFQT6H3A8zyNTQ59XNmBJmy5dZIb6e1K09Z28Qh/CDFvvdHHvCiKltOMdNcj
	RWvcTdjamRYRHRIgpl0AkmZggd+V2x8WeebiWNZjV+9LSmZnr0R05yQdCojppkMNsaX5rHipw86
	eDr92B24RwhirQ3ymq1EGfmgrXHvtp1osTMTx+/NTlZh+6UAHtelPOCqlyGJWugo6IujHNIjN9A
	4e89zu+fOevORCHVGb82MFuvL0sqWUDmQfdM82gt+CsC5Ek+ARsVRkmTXQ+JFpQUb0Tgdf3COoX
	v0VqP1/W3QNicjsqApeYMfs1xIV+8pBEmZchFvIrhk3Q9jpg3EznOz8IFKv
X-Received: by 2002:a05:7300:3e95:b0:33c:1fc9:3c17 with SMTP id 5a478bee46e88-34272c4f357mr6534823eec.36.1790519683266;
        Sun, 27 Sep 2026 07:34:43 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:34:41 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 02/12] powerpc/pseries: Rework hugepage invalidate to remove conditional locking
Date: Sun, 27 Sep 2026 20:03:43 +0530
Message-Id: <89d8ff14a479760d1a37cae9f7667a07feaad0a2.1790517984.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790517984.git.ritesh.list@gmail.com>
References: <cover.1790517984.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang's compiler based static context analysis does not work with locks
that are conditionally taken like in __pSeries_lpar_hugepage_invalidate().

lpar.c:1240:6: error: spinlock 'pSeries_lpar_tlbie_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]

But this also simplifies the function definition in my opinion - so this
is also a win.

No functional change intended.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 94cd30e9f6e1..abd77c45cbf4 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1224,26 +1224,33 @@ static void hugepage_bulk_invalidate(unsigned long *slot, unsigned long *vpn,
 		BUG_ON(rc != H_SUCCESS);
 	}
 }
-
-static void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
+static void __pSeries_lpar_hugepage_invalidate_unlocked(unsigned long *slot,
 						      unsigned long *vpn,
 						      int count, int psize,
 						      int ssize)
 {
-	unsigned long flags = 0;
-	int lock_tlbie = !mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE);
-
-	if (lock_tlbie)
-		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
-
 	/* Assuming THP size is 16M */
 	if (is_supported_hlbkrm(psize, MMU_PAGE_16M))
 		hugepage_block_invalidate(slot, vpn, count, psize, ssize);
 	else
 		hugepage_bulk_invalidate(slot, vpn, count, psize, ssize);
+}
 
-	if (lock_tlbie)
+static void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
+						      unsigned long *vpn,
+						      int count, int psize,
+						      int ssize)
+{
+	unsigned long flags = 0;
+
+	if (!mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE)) {
+		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
+		__pSeries_lpar_hugepage_invalidate_unlocked(slot, vpn, count, psize, ssize);
 		spin_unlock_irqrestore(&pSeries_lpar_tlbie_lock, flags);
+		return;
+	}
+
+	__pSeries_lpar_hugepage_invalidate_unlocked(slot, vpn, count, psize, ssize);
 }
 
 static void pSeries_lpar_hugepage_invalidate(unsigned long vsid,
-- 
2.39.5

