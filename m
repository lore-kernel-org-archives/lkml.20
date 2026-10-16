Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA052FD1DA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149075; cv=none; b=riZz18R4xMH+cy5SlXJGmwhs56K39wMjxnJEjVy9w7485YDgd8iZSara4vlt1d0GY2qsrjO2gLsX5Y6W2+ojChv5cRmPQ5CZgRgVFmxoOQ3V7w14Jauzc7acyGHbiOV4TTe+7xtvZkETrs91BNX/3oheTk5KTViAFjdFS0rl/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149075; c=relaxed/simple;
	bh=xAJs71cM9DprpLBpYEnHv4Bf8KdOTtbO7D6SI9MMQgc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=cH6BBG4PuRZj3N9By10kmzDxbWR/yG/EuK468tqvUqS6xsVoBxKpmBJIDaGbDFmkGghAdsNdvW0HvEqU3tolWC6vPiWVdSY5c/uaTeeW5/dUXkXvYRaXCOKSJZ+QEuZSD4AIM+OXLHyptNOcvhKzcGrF5CZ72M2DgoHiCCiGSuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaIhcAK5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaIhcAK5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso4743435e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792149073; x=1792753873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnuW/OOXaqHlbXOfdHIcI88XLuBIeupcknQAWrpkOY4=;
        b=QaIhcAK5ERBOayGZ1Ssz2EFGMUSIN+fQz+Y/lXeqAKvGSUKRGCiM2lY6eDpyKxgoGS
         3puANXrAlVZOJFVUvD2ewNTb7tBrhcm4++8DsK3+JpkYunI6jDFrJtQ5aImGwdm1vpcT
         7TBKT1cunK8nEX19kRTwRkQWz2nxp62Rw2aWKHxr0JmlStkVD90/tGH6EtSBGWNExTST
         /JnCR2EXD+5ERfHKofnsiYmo/S4sKG8J1pabRhGb9AOsaUcDDVaaaO6Z5noKKQikCNnq
         met54fFkT/gGHLMUMjRyqZ0lUR8ba4AJqXOgi+RBPsw+j6jn1MROIEn5XlI0X9CUoPR5
         mpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149073; x=1792753873;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OnuW/OOXaqHlbXOfdHIcI88XLuBIeupcknQAWrpkOY4=;
        b=SIBAe0jYo91lpuQhEMvOtfUzyciQdVphrzWEyo9HvCWaRoXA7C7HOmp+h3HzR+JY8n
         efMU23RUDjk+7UiPBdxLphnh33gpqTja4is/6JnwSpbcF6EdIASk58RWCoA2qlRQ7Igm
         xWqSGZlKInDeu24+FEJr4t/OQXgweYYh5tvVIisG267Dya56vHdG2gyg2ENg5z2Y0HlN
         XDQQgkzM/SRgMt4lKFFDy7PrLl/MGFpNMaUwYvsdNzujBa+Po9jt94La25GVFuP0/2rn
         +tcPjBfbj2vJzaVpZmFIlQEtPyW6lHrC0xq40RzbUmQqDaYNvVX5HFhjXXa4oQNJJp04
         pKuA==
X-Forwarded-Encrypted: i=1; AKwUvBw7IyY48rr6Pk6Tls/sbAtaVjIdxPW8mgy8npBO06n7N/Af+nXPjV/WFQrVIB5d86G+2nbssgUSQuYdrUo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRSYvHZ0I5KPcYh0g/zj0dBGi29Bfom/Tc1eM5Cb2MSBDwXtaM
	RKigDbGvnLAd/3+Cxg4f8kVAqIeUzxYBLqRmYiWBxusVKxi0rorg/Mfq
X-Gm-Gg: AYBFou31/DU+h7jFiBbctLyYoFfDQDNU3mAbEGlX9CsX7+fPO+ZAssdHsH1thVJO2Eq
	gr+Ixrsc1QRZdSETDj8EGt++4lRCq3bFrmUjlrQt92GgNb5wTTan930dR65PrzX342BzZIxgCXG
	PG+IHenOAMPJTsa4yhdOMu+hTE/fCctKcmLPx0v/ZjI2qHkEhN1NFI4NVML+icFz8cgiEOjEpkB
	MeH+2RjdrS0mijHrNPO3w/rPll52fKS2ko5B7EIZpq5z1cYcs/GwklG8GPbhA63PLbvo1/3swkF
	LM7KG0qZEeGXDpWCfRWTa7F4eXaDd51Rnl8Y1V/otbcF1c+nRYWFNJNGCmC4T/1D/3Tg3ZPk6cX
	MdoGh1FM0GuwETS4aS3Id8J63nzu9pV+fiRFpOK+uQspAixeKzAKxJCu8wsEzBi0yCGLu4XG+YZ
	KGb+aQtwRNRlqNftNSIdCG8t9M8UmMAwloqklIz2iK7RGUbEBqJcD/K/ToTpiNHiP4Nveewiiu7
	NIO7aj2pog=
X-Received: by 2002:a05:600d:13:b0:4a1:c6a2:5566 with SMTP id 5b1f17b1804b1-4a1c6a25769mr57893665e9.26.1792149072417;
        Fri, 16 Oct 2026 04:11:12 -0700 (PDT)
Received: from ADRIAN-PC.lan ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c575esm3928308f8f.10.2026.10.16.04.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:11:11 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH] kbuild: depmod: fallback to /boot/System.map-KERNELRELEASE
Date: Fri, 16 Oct 2026 13:11:06 +0200
Message-Id: <20261016111106.221542-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When installing external modules (M=...) against packaged kernel headers
such as linux-headers built via 'make bindeb-pkg', ${objtree}/System.map
is absent because System.map is located in:
/boot/System.map-${KERNELRELEASE}

Currently, scripts/depmod.sh only checks ${objtree}/System.map and skips
running depmod with a warning, leaving newly installed out-of-tree
modules unindexed in modules.dep.

Fall back to ${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE} when
${objtree}/System.map is not readable so that depmod runs properly
during external module installation.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 scripts/depmod.sh | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/depmod.sh b/scripts/depmod.sh
index 3c34fecac..d6d1b9547 100755
--- a/scripts/depmod.sh
+++ b/scripts/depmod.sh
@@ -12,9 +12,14 @@ KERNELRELEASE=$1
 
 : ${DEPMOD:=depmod}
 
-if ! test -r "${objtree}/System.map" ; then
-	echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
-	exit 0
+system_map="${objtree}/System.map"
+if ! test -r "${system_map}" ; then
+	if test -r "${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE}" ; then
+		system_map="${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE}"
+	else
+		echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
+		exit 0
+	fi
 fi
 
 # legacy behavior: "depmod" in /sbin, no /sbin in PATH
@@ -25,7 +30,7 @@ if [ -z $(command -v $DEPMOD) ]; then
 	exit 0
 fi
 
-set -- -ae -F "${objtree}/System.map"
+set -- -ae -F "${system_map}"
 if test -n "$INSTALL_MOD_PATH"; then
 	set -- "$@" -b "$INSTALL_MOD_PATH"
 fi
-- 
2.39.5

