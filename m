Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B3339BFF8
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510658; cv=none; b=lZDrn6zgpHKLw3HyFTnp+fNdyNH003kMh4scC1FVvgVcK7TWLFQbTgtLlG291vfrOH9hJHx/jTwSuMEg83UT9WEtbtIXOK38AbBT9KrPn+GQoEqTCx3m8ptAQyr+HqI1S3Y5Teks8EyrqSyV2wBwaeHOqut2iVApDyjjtiVlB7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510658; c=relaxed/simple;
	bh=JKbnCaIfmpdVJXM5YFAPNROoauvccZAiwILQlR0vHFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xcw6RvTF0nu3YjI7K/ZZ/vEsuaoglQcLXvOtlRSHuxrigk+qtnGwmdv+hP3vT8fkAlZE2Uv4/jO0xGxWGsv/r4I9GTEkuUUfBK9WC8EoeAam/Y3nM4/79Czu5ImyWdonltMWjZ+7Y1p5AvoOUAl2BcGRshJNSjdkiC0zlQdE2Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZ3aP91h; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZ3aP91h"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f38so8978415ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790510655; x=1791115455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lY7ubxHQGnEZ+clckpxrjcQkIrKZ8NMO8GGEkfEwk1w=;
        b=NZ3aP91hkNdOBI/FFC/p2jtev9OaYqtfl4EnBTJcB5QIU01epzAKtOriiNQEa0v220
         tiAmNkmdYCyUz1si3AAGusoaiSwSPYU8lh7Q238oB4XsHIbH5kvI7x9qBYuthjiw50Wj
         aXR2tBcc5AI3v049Fj+TPmszbBtm1oUh1mvl7Lr1EzHCun+KxFqNqoucmRCoD2nSV2bT
         W45Q3xPLpxkua+12LdPT0ZoDUiWhNqM4v1y9hpETyHijJmDB6if0q3oWHa7Nr7/RJRfY
         UqvpDTNFOxgobYCpDxVpMlLcmeWKDldIjjn7nZT8rfHGGF6st96OFtrsJ23A2tVIQSle
         jfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790510655; x=1791115455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lY7ubxHQGnEZ+clckpxrjcQkIrKZ8NMO8GGEkfEwk1w=;
        b=RO5SF/l4JY96KfOyYNMsa0QKQ1c2Rtl26i3UH2SntVvP5M9RZHpntmZ6b/9UhDBvg4
         S8pLOZsV4M7obqCMS/YYQPNU2aIBC7ymlGSh9ih0wIcPIcl6gyCCMyW6jB+au7o+SllV
         7MsbKSifAfVfUVivGNqKyniaqa8Fyo/4IOFOdeJyu33eY0YwxLR8gTvmrZ8aLfxD46Bb
         AOWeJy9XZvh4pH1VzjzfWqv60H57pAcuHgm4aXJa1nJ0NQlm6Wo2y+i8WcoI8sV4scoD
         bYNpQeDzwJlcBMj/yVjgn37N4kL3wJoISJu5yh7yXCaASttQvvyA8aUfRqdCMXwekkva
         b2hA==
X-Forwarded-Encrypted: i=1; AKwUvBz1oTc23FwozenCirYft5auRv5A24X6HBM/mKLn0T7yifvBhwjDuYXwEtL3W6R0hzFbzEYRTNy5ptUBUBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFw0dELFdh9vr/eCt1awjGKyNRMtNggXb8jLIIX9IKc6JZyCBZ
	X1dprvQprOyat3NdA6VKJK7Kt720ewKtl1uasCjPgf2eqhbkiffANzvd
X-Gm-Gg: AYBFou1uqzHwb0J/jWpDpyc6BiDZikjp0d4DTrzrnOnbC/kXxXgH3mJSOsJofIwWqCQ
	L/Ay7kt9aeYiYpJw+IIzaY3Ji4//IZfsjO2SQ6R2rQgIOSTlEDIPhzukIMei9vbe/M6KLnPMBOC
	7qaP27B6+bmiJiveS/oIEFdxwQAmBNajaKBSmhP0qwWkb/pVhFs+wyQ8LJXieFJMp8rdWTZMYdE
	4kaFYO/RchmZFoFXOmaswiIYu1bqHRRqlPCq4ZoU/qQ6Cz2tEy962avDIze/ZM6djk40G18yR6g
	wG2dCJqlMcH1orPIcqfAaAq2XUDntsBFuH1ZSju/Z4cbuSeNOOqqtvM3Tp1MWcWZE+H1wzIzA9t
	Oqfj0GX6TGMBy2n6nqzbt04BwNfgYTb6rQ5UtsOCkKr05dwwCopCS0WqEmAfQruQZrbrrjCu+tf
	iRKIdIDHOvkZmp7uWFHzKEpBsrJHzuDf2Yk5d902M+O24l1IebE0c+aJqtrdPnXYr57f1xWA==
X-Received: by 2002:a17:903:1b2e:b0:2df:9e2d:862a with SMTP id d9443c01a7336-2df9e2d8d3fmr39841315ad.54.1790510655243;
        Sun, 27 Sep 2026 05:04:15 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d459:e6::17:243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913ff040sm27887735ad.32.2026.09.27.05.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:04:14 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Chas Williams <3chas3@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net/atm: fix shift-out-of-bounds in __vcc_connect()/find_ci()
Date: Sun, 27 Sep 2026 19:04:10 +0700
Message-ID: <20260927120410.44906-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev->ci_range.vpi_bits and vci_bits are documented (1..8 and 1..16)
values a driver assigns after atm_dev_register(), with ATM_CI_MAX (-1)
meaning "no restriction". find_ci() and __vcc_connect() use them
directly as shift counts (1 << bits, x >> bits) without ever handling
either the -1 sentinel or the all-zero value the field holds between
atm_dev_register() making the device visible and the driver actually
setting ci_range.

usbatm_atm_init() has exactly that window: it calls atm_dev_register()
and only afterwards sets ci_range.vpi_bits/vci_bits. A bind() on
AF_ATMPVC/AF_ATMSVC racing in during that window sees a vci_bits (or
vpi_bits) value outside the documented range, and the plain shift is
undefined behaviour, reported by UBSAN as a negative shift exponent.

Add ci_range_bound(), which turns a vpi_bits/vci_bits value into the
exclusive upper bound of the VPI/VCI space, treating ATM_CI_MAX and
any other value outside the documented range as "use the maximum
range" instead of shifting by it. Use it at every site that currently
shifts by ci_range.vpi_bits/vci_bits. The __vcc_connect() bounds check
also gains an explicit vpi/vci < 0 check, since it used to rely on the
implementation-defined sign-extension of the old ">>" for rejecting
values other than the ATM_VPI/VCI_ANY/UNSPEC sentinels.

Reported-by: syzbot+f6ac161ee9699270b8dd@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f6ac161ee9699270b8dd
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
No C reproducer was attached to the syzbot dashboard for this report,
so I converted the syz reproducer to C myself with syz-prog2c at the
syzkaller revision syzbot used, and ran it in QEMU (KVM, x86_64)
against syzbot's own kernel/config/disk image. It enumerates a fake
USB device over raw-gadget matching idVendor 0x0572 / idProduct 0xcafe
(binds drivers/usb/atm/cxacru.c), then races a
setsockopt(SO_ATMQOS)+bind(AF_ATMPVC) against it:

  usb 1-1: New USB device found, idVendor=0572, idProduct=cafe
  ------------[ cut here ]------------
  UBSAN: shift-out-of-bounds in net/atm/common.c:382:32
  shift exponent -1 is negative
   __vcc_connect+0x14b4/0x19c0
   vcc_connect+0x328/0x8f0
   pvc_bind+0x272/0x380
  cxacru 1-1:1.0: send of cm 0x91 failed (-71)

The "send of cm 0x91 failed" line right after the crash confirms the
bind() really does win the race against cxacru's own device bring-up.
This reproduced on every run against the unpatched kernel; with this
patch applied I ran the same reproducer 6 times back to back and saw
no UBSAN report in any of them. checkpatch.pl is clean on the diff.

 net/atm/common.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/net/atm/common.c b/net/atm/common.c
index 81195727fa18..bb6bc26eb599 100644
--- a/net/atm/common.c
+++ b/net/atm/common.c
@@ -327,6 +327,21 @@ static int check_ci(const struct atm_vcc *vcc, short vpi, int vci)
 	return 0;
 }
 
+/*
+ * ci_range.vpi_bits/vci_bits are documented as 1..8 / 1..16, with
+ * ATM_CI_MAX (-1) meaning "no restriction". Neither that sentinel nor
+ * the all-zero value the field holds before a driver's probe has set
+ * it (see the register-before-ci_range-is-set race in usbatm_atm_init())
+ * is a valid shift count, so compute the exclusive upper bound instead
+ * of shifting a VPI/VCI by a possibly negative or out-of-range amount.
+ */
+static int ci_range_bound(signed char bits, int max_bits)
+{
+	if (bits <= 0 || bits > max_bits)
+		return 1 << max_bits;
+	return 1 << bits;
+}
+
 static int find_ci(const struct atm_vcc *vcc, short *vpi, int *vci)
 {
 	static short p;        /* poor man's per-device cache */
@@ -342,12 +357,13 @@ static int find_ci(const struct atm_vcc *vcc, short *vpi, int *vci)
 	/* last scan may have left values out of bounds for current device */
 	if (*vpi != ATM_VPI_ANY)
 		p = *vpi;
-	else if (p >= 1 << vcc->dev->ci_range.vpi_bits)
+	else if (p >= ci_range_bound(vcc->dev->ci_range.vpi_bits, 8))
 		p = 0;
 	if (*vci != ATM_VCI_ANY)
 		c = *vci;
-	else if (c < ATM_NOT_RSV_VCI || c >= 1 << vcc->dev->ci_range.vci_bits)
-			c = ATM_NOT_RSV_VCI;
+	else if (c < ATM_NOT_RSV_VCI ||
+		 c >= ci_range_bound(vcc->dev->ci_range.vci_bits, 16))
+		c = ATM_NOT_RSV_VCI;
 	old_p = p;
 	old_c = c;
 	do {
@@ -358,13 +374,13 @@ static int find_ci(const struct atm_vcc *vcc, short *vpi, int *vci)
 		}
 		if (*vci == ATM_VCI_ANY) {
 			c++;
-			if (c >= 1 << vcc->dev->ci_range.vci_bits)
+			if (c >= ci_range_bound(vcc->dev->ci_range.vci_bits, 16))
 				c = ATM_NOT_RSV_VCI;
 		}
 		if ((c == ATM_NOT_RSV_VCI || *vci != ATM_VCI_ANY) &&
 		    *vpi == ATM_VPI_ANY) {
 			p++;
-			if (p >= 1 << vcc->dev->ci_range.vpi_bits)
+			if (p >= ci_range_bound(vcc->dev->ci_range.vpi_bits, 8))
 				p = 0;
 		}
 	} while (old_p != p || old_c != c);
@@ -378,8 +394,9 @@ static int __vcc_connect(struct atm_vcc *vcc, struct atm_dev *dev, short vpi,
 	int error;
 
 	if ((vpi != ATM_VPI_UNSPEC && vpi != ATM_VPI_ANY &&
-	    vpi >> dev->ci_range.vpi_bits) || (vci != ATM_VCI_UNSPEC &&
-	    vci != ATM_VCI_ANY && vci >> dev->ci_range.vci_bits))
+	    (vpi < 0 || vpi >= ci_range_bound(dev->ci_range.vpi_bits, 8))) ||
+	    (vci != ATM_VCI_UNSPEC && vci != ATM_VCI_ANY &&
+	    (vci < 0 || vci >= ci_range_bound(dev->ci_range.vci_bits, 16))))
 		return -EINVAL;
 	if (vci > 0 && vci < ATM_NOT_RSV_VCI && !capable(CAP_NET_BIND_SERVICE))
 		return -EPERM;
-- 
2.43.0

