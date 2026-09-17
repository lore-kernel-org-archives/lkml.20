Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9784251118B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658421; cv=none; b=plkmUKFsI0ijJk4n0B2RFtnSCxipdaalTaE523tE9QBlytW8vrhIDq1nDoLM7FKq9UUSmJ7bZh4wlzKUgOHIwnTFxdXC5XqrDEsN9xUnxHXAaleR8udcxrltL4+W7bc1Lf2pJbFCaZF/nqbUb6HD1K93mlh1WKohXlg6UBLBtPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658421; c=relaxed/simple;
	bh=d6UKzQKyPiGJsGM+Qu7tJG56YQxLOxqIMP9yGCsnkHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UYV8+SlxHnCErFKs7bi+bt4bmbHJ9Ui9eAninSNutnoremoYP4WSE70vu8E+2s47niL5haxesRnSt8U2if9tfHRUZZOZFbCk5f9q1q0x09PLLcC3F/jYOkOKUcKTBkj1fhQAcnO2A/Et3V3E/mHawn/esaKEjYj3uxFZna19ZO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULytia+7; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULytia+7"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba92so856214a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789658409; x=1790263209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rh2mXdJ4Gx0vDgozfrCs3n1I8ixRE20WMk7/6kOasWU=;
        b=ULytia+7XYXtHm2WEvND6LCK207mHNIP8hvusm8aJJo7ABVuEudD2A1H3v+JF//u3n
         1Z0qK97I4havFOwM1RBn53cQ2VxbU54go3Z8TPW6Dvdf22v6g4+k7PoFca/tuAl/+VZn
         a5aBFtPxoyx6I1BNPOLd3jOEIqSAiCJaFiuWuJEP19f9ZpdrQhVc+muYZlcrKoJlIE3A
         Cscu6fk//V4IyMz5jU+ct2mpxhy1a3N7EknX0BYw02wDHpZ/LtiTvEVkx2xK16Q9H2RA
         qhtjEGcDK7PVyOI8cQRUiZwcigNrmRVha64Suy3j7Qf8SUz+fTZVz+irvEmUQNG45+WK
         7DsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658409; x=1790263209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rh2mXdJ4Gx0vDgozfrCs3n1I8ixRE20WMk7/6kOasWU=;
        b=tLz8qTiSDpxRy8/2M0wx/03dGkbIIdTOr/uqUYSUZ1I1t6SKPxpMQIZtWTY5dvoR1J
         p0wOeg/oe9YlUH60+OOO95qLZdyE3OiS1pKXMcK4HP+E064ZkYLo91jYR8U5Ob03aq36
         3GpKVQhhK4ulUq0sr4Lj7B1oebQcLDb3Unq7nzzF9qyDOL7WsDsWkeiZZyvzAFhL++iV
         foUpOTLkKc1LBvBivRtfevuwq4/GcWx8WzamxdHf7d6fOlq3s86GA+9C+D9duqWVoZP/
         vqilQ9I8KLuKr8L87/fLHhbrIUfr4JnWGBgRCBH+crA9H0pa4ou3Aut+w+KKvv7/xiOA
         F3rw==
X-Forwarded-Encrypted: i=1; AKwUvBxEqbmUBsdEJdIhZoiKIkbBbF2vCCZJrhOfLBsfFGoduYqjQ9XAKF5CYFoxR/1k8YsRqdjhbvMc6ybAhns=@vger.kernel.org
X-Gm-Message-State: AFuF++lDlKT/oZI4YTG5YBKeQ11RYxfgxCBB7CCgYehJg6vNNVhsVdo/
	Fnh6UtzoCvHA8Iz772v6v67JviX4/vCa59OiPRK/Flhjb4JWbxMYKROa
X-Gm-Gg: AYBFou1D7Np2TGn6SC/7t0DMv5NyV0PN8IKh+XOeDCaKihNHqMusVDUfJAHXS/a0F/3
	w5/yfYcuwSIoMxvp+n8S5Omwr43NYr2/UK02Kr74GDPyWs33R0TX/ty4I/2H34FI9bCmcpYsO+5
	7/EyIiZzPRWxdGqVbxy92KTyOHVDGjJmam0rUEftVfROtbpCMg5dCGcxjNiUgwUuMdxnz2Ll0tJ
	Zxt+HKM3OMOyKmaH9L1P29u0Z5GcUfurTn/KetJ7HLbvkBHhtP9vW9GMPsYj/P2iH2g39sZyK/0
	KjIwrdebY2qa2kF6rG7tK8oX0MjF3fq5O9OTQn+eW72puAwWki8jNevsIqLsz+2VEBDN1A7CbmY
	tbFcv0xlEbLdWf1xe2ayGLvWqt1YahKELJeGdiKcECcWy4qC7itFZ9tZhxlo3W6tbT6Yso+4ZBc
	fGCSfU2JMayDb2DzRtTFbuqLJtLUTC0UQ/nsCZ9fyY3g4DsMlTVjKtAVLEPcOGSVHabQdO+1hl9
	i+e9MX1ykPUbJXdh+2nNlc=
X-Received: by 2002:a17:90b:4cc8:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39e1e330a2dmr17165225a91.10.1789658409372;
        Thu, 17 Sep 2026 08:20:09 -0700 (PDT)
Received: from csl-conti-dell7859.ntu.edu.sg ([155.69.199.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35b589c2sm5556269a91.0.2026.09.17.08.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:20:08 -0700 (PDT)
From: MarkLee131 <kaixuanli0131@gmail.com>
X-Google-Original-From: MarkLee131 <kaixuan.li@ntu.edu.sg>
To: linux-ext4@vger.kernel.org
Cc: Kaixuan Li <kaixuanli0131@gmail.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ext4: don't read past the UAPI struct in EXT4_IOC_GROUP_ADD
Date: Thu, 17 Sep 2026 23:19:49 +0800
Message-Id: <20260917151949.415967-1-kaixuan.li@ntu.edu.sg>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaixuan Li <kaixuanli0131@gmail.com>

EXT4_IOC_GROUP_ADD casts the user pointer to struct ext4_new_group_input,
its UAPI type, but sizes the copy by struct ext4_new_group_data, the
internal type:

	struct ext4_new_group_data input;

	if (copy_from_user(&input, (struct ext4_new_group_input __user *)arg,
			sizeof(input)))

The UAPI struct is 40 bytes, the internal one 48.  A caller that follows
the UAPI and allocates 40 bytes gets 8 bytes read past its object, and the
ioctl returns EFAULT when those bytes are unmapped.  The internal struct
has carried the extra fields since ext4 was split from ext3, so the copy
has always over-read the UAPI object.

The two extra fields are not used from this path: free_clusters_count is
overwritten by verify_group_input(), and mdata_blocks is used only by
ext4_resize_fs(), which builds its own group_data array.  The compat path
already copies the six UAPI fields individually; the native path does not.

Copy the UAPI struct, then set the internal fields from it.

Reproducible on v6.12.9 and v7.2.4 by placing a 40-byte struct at the end
of a mapped page whose successor is unmapped: the ioctl returns EFAULT.

Signed-off-by: Kaixuan Li <kaixuanli0131@gmail.com>
---
Built fs/ext4/ioctl.o warning-free (W=1, x86_64 defconfig) and checkpatch-clean.
The bug (EFAULT on a conforming 40-byte object) was reproduced under QEMU on
v6.12.9 and v7.2.4; the fix itself was not runtime-tested.
 fs/ext4/ioctl.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index c8387e6a2c6e..ea3cd8cdae25 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -1674,12 +1674,22 @@ static long __ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	}
 
 	case EXT4_IOC_GROUP_ADD: {
+		struct ext4_new_group_input uinput;
 		struct ext4_new_group_data input;
 
-		if (copy_from_user(&input, (struct ext4_new_group_input __user *)arg,
-				sizeof(input)))
+		if (copy_from_user(&uinput,
+				   (struct ext4_new_group_input __user *)arg,
+				   sizeof(uinput)))
 			return -EFAULT;
 
+		memset(&input, 0, sizeof(input));
+		input.group		= uinput.group;
+		input.block_bitmap	= uinput.block_bitmap;
+		input.inode_bitmap	= uinput.inode_bitmap;
+		input.inode_table	= uinput.inode_table;
+		input.blocks_count	= uinput.blocks_count;
+		input.reserved_blocks	= uinput.reserved_blocks;
+
 		return ext4_ioctl_group_add(filp, &input);
 	}
 
-- 
2.34.1

