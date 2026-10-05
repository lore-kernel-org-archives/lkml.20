Received: from mail-vs2-f34.google.com (mail-vs2-f34.google.com [74.125.227.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5653921F6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232776; cv=none; b=O2v5b4T2pQV4WK2rEd4bGP4yf1AkaOEcH8jel0ct9+QorsuJXyOUDc4vc9o3IiXG9zCoa2gBdmHeSt1UzjBHac0n/a8wMTsn3F8HZ+HXsrcXDw5AjnjYEzSXzlGWbTY2foPl6f3LY57PbF7JJM77PyHe/AItUBOIedYuoxpHtis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232776; c=relaxed/simple;
	bh=W8+JkQSMqBDxJZXNAx4qDJE766xaxIYGmX4KE6Hx2As=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jDb2+evlFenACuo/q5lOxqtid9AR5+8V6+2U//Xd93uaLbQ78VtCGq3jNR1r0fUoH2WZ5UdAn8d3ymKSgELyagFaUHLHLKWnc7G1wbw9ru8vd6xlwHA3vLMvwMiqOcsMFxm6ZSlh4oLo/x4LB7PnBbtNCEjakDeYA+v065Qkqac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhkcu7ha; arc=none smtp.client-ip=74.125.227.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhkcu7ha"
Received: by mail-vs2-f34.google.com with SMTP id 71dfb90a1353d-5e3938dda85so686411e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232774; x=1791837574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxI9jOWrXLzRQeo91PfnufO4X1292wU3kDq7ULz84yY=;
        b=qhkcu7haTWdql7/wAfggVNEt757MobLBEtR+1CZYZRzmAUbzf0qpkH1D7VpRQZ5SsJ
         f+Mm7bp1jz5Y/8V1E+1tsJo0JKwVibvFKWeqznS3XEba48YVY0g1LHrqiBaFyKpCFfTX
         GBGgPG2sQDWo6TxJYeBPGPxyXTd15yhK+iNfgl7YPGNoJBT15g1Fw8c+2Ajg5Nn2rqKw
         rsIgleyczJdOPi6J0yghprW5QAC58lxBZCAizNhUnuEtRoGKtyqHephzRh1EmLf/5pYt
         MMcgeG8hkaMJEXxOMkBAvUCzdbMBC0iYqrGIQ1q/kC/Yk0nelvZfj1T4SifqJs729fYw
         iUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232774; x=1791837574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxI9jOWrXLzRQeo91PfnufO4X1292wU3kDq7ULz84yY=;
        b=xEmdMMWYW4k9KhFi5iOOLScrvNorCvW2gWEWGml3zfJPmgXZwIw0SkCYuAf06b1+IS
         jFfAUx6NvbHrM6LgUk7udOwS79eeDAUHqL0AtUN++I7DUPj48ZJOpnB2vv3KcVVBacxw
         huPSsbvIbdn6ieW18b4qnUcRXo1/+z1bLxuZht4pkJjIHCxFUQF2qKKK2LUco67LUyx+
         Z+TG1pYp5Ms3jqErV0FgiQInazPWck3Yws2NM30wu9DP9R4WjeZJ2ZzRVZCVpz/e2Brr
         Dtrso+rDh3g/rUbg/SnQT0XvUqg6GqClijDgag3soANlEfQYAlQ6yez2gsBgCuTAq7k4
         /WbA==
X-Forwarded-Encrypted: i=1; AKwUvBzDVH7DfZCYxIe9F/SydxkTEcaAnmq4OeQtcAeVaISfmmcfrRbHXRCySQdwzbaXTO7DqBMsfxkbHGUPMVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+5cqzLKPtVh7SP4svzYFOcDwonnfVDqV5WCne46Is8fOFtAKz
	GCbvOb94lV4HPKZTj4HMnXXiYAACd8vd6R2ds+8BzCDms5s00GKqUjHk
X-Gm-Gg: AYBFou0MCXXh+OYOJBAfam74C6JsA6uNZRkm9Jn+CeUxuXaxHYs8PUmZ3NTp0wTdf9c
	DBSoGXSYeSCoWiTN2pQCAf2U98u6ga6AW1NA4QV67i5nf7F8BAcbSKLahDBZ8KaFg5p+UkC8yFQ
	4LtEnU+1LcIsaWxmC/dcms3JI6jOuEv4K4EZ1Qm9fX3rWuBRBbRqjqAvGLSV+CAHXdX1HVqrBVr
	K6fb4tZtGhpH6a7CLNCVXFKtt+EW43mFxN67GkVED5IyrEa5WM68cEY+dznrcUme1b89g0JNpzB
	ss4hXtw6L6/Gc9X/sZLeSrSuherwiujwZJSpu/aaHgfW+H0JFwUUx6X0BK9sqrJ0q6Js43f09wI
	8FZ+fJRkUP+Fd9Y0fgrlDnZDfQsIzfbNdiMaY6o6OXCWmfuv/a/BhlnOCB6/DU0+tiDqi8AMPZz
	dZjN70Q98T49uTYZ2tCOubjK5Bv83ZiH8T/wbmkqllNMS12dTiHY1V5Fswb3e5m1POgQF5m2omY
	ECZHe56/5RQzxZOjAUhAn1/J8uKKmH4ymM+vt2fmpWPZ6IAfiLukzg6m9coInyKlLfDdsDHefYE
	v6GVCI+Zm4M3aqQ0ftMJbyJ6ffVtOGQL9FscA+1IGD/zgC6l
X-Received: by 2002:a05:6122:d0b:b0:5c9:c60e:3a4a with SMTP id 71dfb90a1353d-5dab3263c43mr4109827e0c.22.1791232773813;
        Mon, 05 Oct 2026 13:39:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e54e8006d9sm542088e0c.4.2026.10.05.13.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:39:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: sparclinux@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] sparc64: Define p4d_page() instead of stubbing it to NULL
Date: Mon,  5 Oct 2026 13:39:30 -0700
Message-ID: <20261005203930.246598-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A sparc64 allmodconfig build with LLVM fails in vmalloc_to_page():

  mm/vmalloc.c: error: performing pointer arithmetic on a null pointer
  has undefined behavior [-Werror,-Wnull-pointer-arithmetic]

sparc64 defines p4d_page() as NULL, on the assumption that it is only
used by stubbed out hugetlb gup code. Generic code now uses it in
vmalloc_to_page(), ptdump and KASAN. In vmalloc_to_page() the NULL is
used in pointer arithmetic, which clang diagnoses even though the
branch is unreachable on sparc64.

Define p4d_page() in terms of p4d_pgtable(), the same way pud_page() is
defined in terms of pud_pgtable(). sparc64 has no p4d leaf mappings, so
there is no functional change.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/sparc/include/asm/pgtable_64.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 35a217bf6e5c..c5eff6efe514 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -850,8 +850,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 #define p4d_present(p4d)		(p4d_val(p4d) != 0U)
 #define p4d_clear(p4dp)			(p4d_val(*(p4dp)) = 0UL)
 
-/* only used by the stubbed out hugetlb gup code, should never be called */
-#define p4d_page(p4d)			NULL
+#define p4d_page(p4d)			virt_to_page((void *)p4d_pgtable(p4d))
 
 #define pud_leaf pud_leaf
 static inline bool pud_leaf(pud_t pud)
-- 
2.56.0

