Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B1F39CD0D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856769; cv=none; b=LpfadIlkedvPX61U3jHcLpb+7TXjFxsyeC6XYEpk2ButtFnWbagwSwO6uWGIiuqz+JOdThsOcCxJRoA1PHy0/Jj4j+P8DpBf63CQprDyo7cAFrQ5FaIrXCrw52aBd7MgYxrbVHNrKOCoEn+GoTK7S1eZ0tWykTaDAgrc83a/Mnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856769; c=relaxed/simple;
	bh=dS+6K47RdU7JCOyZhcqLZCz+MyMVwLXxGjunz4dnTJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sSaA5wxAFyXmlFe3IapWSEknLQ7zKqovC2lsnb2HOk2VKBXSr25wnojWJxElMWR8GGk+qp9JwQdrHJw82toNBj8w+wjQccT9qtShKICOArwimeXeC6FAHRg/S1fU6fFjWU5p4dK0jC0LLGXz5/yJZ149ZgzcX2AOC2BzeskKBQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCeXS/IK; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCeXS/IK"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1443742a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856767; x=1790461567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vWO+urElYoH8T/pGFCPoNzRf+th4w0q5P1g3714HYQ=;
        b=gCeXS/IKXaQ+myAL+6QfPbRCbAUtUYuvD6R/+9ow/eVvVKsNl2X0Z8cYqnO+5CFr1U
         k8+vB1dxQ5SSl79WP/prRGJX25yF0UcB6k78B5f5Wgrp4B1N49iPDXfupK3c1YaNv7Dw
         9zmgTxfxPKEkdS/5TNYRQDs/NHF52q4ZYA54Uel6TjV4OXLwvtoVdhaxOXM2a3mT2EIr
         sDoy2OgQQn09cs33wl/wPt6rkcNqC1fvH1ytDNCyhjdnc5/DAw5XQqCgfMS7WIwfsgFP
         iBBaOkhzSy9yjPSJnj3j/s+M1eLtmXUHtayvaQamYqdzCgkpQ+l59ZZRuzbhi38Yn/wQ
         1ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856767; x=1790461567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vWO+urElYoH8T/pGFCPoNzRf+th4w0q5P1g3714HYQ=;
        b=qVFT29n6oW3WRoCXFOD7OQQRrPb8T6YbFZCHokOObIVEFPIe1TpQ0qAGxTlgtXp4kv
         lwYfbBRwInABGw7J2RG0ExwwFHJkFjT7zetxoouvEPrhYIOpSRiS4pnjrJcvw92+vSDE
         3A2RrQa1OstwC1BOZJqDrcH+0XLr3BCXvtmZDLgtHNsvkcGuaMjKBoRSSy8J9mkwKIPC
         oefdOaBRaV8f0zBSHIH1/gj3T37e/Xi4JvCgioV08kMaBpp4UskojbPmikV2OrshtJLq
         39LVjzJCID1yup0KFyVxJG+AcCkuj9ngRDO/jJqMspYxhvTAp1E5JjGBrUifFYxycIFx
         Ckmw==
X-Forwarded-Encrypted: i=1; AKwUvBz+rjJUwrjF/hzWVomsXqqLJssB/7qDYik/HpHe5ClT1H8hfZ4PphNHwa6l6I4DADSpni1wYT50138k2Xk=@vger.kernel.org
X-Gm-Message-State: AFuF++lakqb1nq+PgYrpXLxLFO34RS17XPtwD+kNMRdga1rr5ugADH+a
	rP0pvL8KCJMJLdkG8wsoHd0RgB2un1vMmRkD1OFjOh10sgmN02CWyUOTRou47wP8
X-Gm-Gg: AYBFou3IuaYEuJehq4OP+1ZL7CpoWQdDziWxety9TFIHqLT/+8r7FpCP6vlHnPLy33X
	zMTE1kJQJtNhB9vDZzC6dlYslsDxH8heSsZHPNzHmJLCO9kchUH9GQmgYDDUyjTT68kYzghIe5i
	uthHWwWj+gzkjpDaz4/TPfmr9/tFUSrG9xiHjZIvZyLrZoDs1bE8rHsggtxHHsDU2etW/+J3Fqq
	dI+keWlU7PUCfhbelo6qM0lCTpftWQ87PzpHXsgPR+UEqsrKY6+n+H/+v8X05qIOnDTDbwZs+dq
	z95m766do8d/uVCumiWm8Otwc23OSEJc13PLsNpSfTNECPb/KVj8OsS+1abB2CBxl8qsQW8aGpu
	Icn8/kUC1p6hdPC3YqFj+mpO4xfSdcSN4I5e1WVpY5FEzmnECU6MxXqRbF/QHnH/ydm6YHW8rSj
	lEY07nL57KZLb1KmU5e491IylvQzUyCUbOq2wkMn/q1pOpHWEJdZd1xFCPIikysXJR0NLrYLOnE
	U84ana571Ckn1N53SPBreYm/6oIkHdBXbDG/IX4Xo6Fw38b7Eou3uwuG63boCLLKjZBEGSL2Yo7
	P1iw8PeZnClwpJUgzRLZ
X-Received: by 2002:a17:90b:2d47:b0:39d:eac2:7bb1 with SMTP id 98e67ed59e1d1-39e54ce1695mr17837962a91.4.1789856766869;
        Sat, 19 Sep 2026 15:26:06 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a023cf10bbsm2034432a91.3.2026.09.19.15.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:26:06 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	brauner@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hfs: validate drAlBlkSiz and fs_ablocks in hfs_mdb_get()
Date: Sat, 19 Sep 2026 22:26:05 +0000
Message-ID: <20260919222605.3794529-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In hfs_mdb_get() (fs/hfs/mdb.c), reject images with allocation block
size (drAlBlkSiz) of 0 or not a multiple of HFS_SECTOR_SIZE (512), or
with fs_ablocks == 0, preventing a divide-by-zero trap and out-of-bounds
bitmap scans on crafted HFS images.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/hfs/mdb.c b/fs/hfs/mdb.c
index 277de712f9d4..9e78c561a3f1 100644
--- a/fs/hfs/mdb.c
+++ b/fs/hfs/mdb.c
@@ -204,6 +204,11 @@ int hfs_mdb_get(struct super_block *sb)
 	/* These parameters are read from the MDB, and never written */
 	HFS_SB(sb)->part_start = part_start;
 	HFS_SB(sb)->fs_ablocks = be16_to_cpu(mdb->drNmAlBlks);
+	if (!HFS_SB(sb)->fs_ablocks) {
+		brelse(bh);
+		HFS_SB(sb)->mdb_bh = NULL;
+		return -EINVAL;
+	}
 	HFS_SB(sb)->fs_div = HFS_SB(sb)->alloc_blksz >> sb->s_blocksize_bits;
 	HFS_SB(sb)->clumpablks = be32_to_cpu(mdb->drClpSiz) /
 				 HFS_SB(sb)->alloc_blksz;
