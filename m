Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401597;
	b=ICfaBEgWmAnoCbhti7sH1WHWMJN7LpgD8oUDrGgamnpXX1/l+qz7JMumnc3A/B71B2Yr
	 Ekmg2lbGGHe+QzJFjiO8+CWK4iGEFWB8KNx0TpWIf7uwLwGqtirrap9IbZpggLpfnmuNH
	 VmneB9vr1sNctsGhpnzeA9u0eRXdkVE358gQxl58msp0WAywGZR5dE3xgpJliEtnij6cJ
	 ZEVZ3RbOno8ySbcCWZpz1RQHDoP+DfnpDlry3pwRUvTSwuKcFUxuqfAYNCI5ppKE1jAS7
	 xtCa74GnVmxfhUuEddUb/o33lt2xeH7ArMXhEq5K7OPduBS8u1TlMDoJ+WqJqJ6srpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g2sjA6cABSNzxAYxR70z3q1ml4Hdcp04R6x1d5IKBJk=;
	b=CQ2viFl2lLewoUdqeTw8/TjMbJ/we9Fx4aoaPN6N3rzjvu55o/jcVnmbF37AhqDZ3gO7
	 8WwIKplgma0okBPRh9TZTHHFo2wtytuK4bmiDdEEQ3iHJHza/Q/VGNAWWMn/nzKYmR07C
	 +MMfOAm7YCeY5MydI63dMfsaXsREO2G4/H0ZjPPG38Cf8cK55sdjYPzeU6N7N48AGlu0z
	 x+2kkevZl4vriC1rvO12wRbV3B+o0SVezyFIdYRUMJftrUN2PcRYGLfSUTSj2/1CXej9b
	 12f8ZbA2NaPHrVjZYg1z9OZWYT4yjsZSsZiN02uCO7LazpCsoAhD12ZeJRTCvYGpZkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QQwliFBL;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABE3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ABE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QQwliFBL
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso1754547c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794401596; x=1795006396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2sjA6cABSNzxAYxR70z3q1ml4Hdcp04R6x1d5IKBJk=;
        b=QQwliFBL59LbzdPN+fSHueOXUcK2ZuWGPBBNhxVaab/2KI0FxdLaia5tHIamDE4n2m
         ZxY+nPghSkD1yImiBgfT+qKSSU7ngLRcx/Sy2N3ym42WL4dl3Xy+hvYt86qaL3kXuku6
         5ZOmvnE/4V4Lz4YqZq4n5iPqwrP2xHg/Ophy6fU/bYfz9EKoq01HfVCGbDd9REjSgMA5
         MIjq36d5M9WDQ+M/VU9teTVorh3y4OUL40rdQEeIIfDn/zLuXIhn2hWZ0srqYw5RTjm6
         48txMAUAqJOgj8CnSoGYJnO5BQ50YO/ZggG/vfdpMb97wlBcdhhoX9NWJYEWaoOMtkKi
         t95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401596; x=1795006396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2sjA6cABSNzxAYxR70z3q1ml4Hdcp04R6x1d5IKBJk=;
        b=PgsWx2IyRxuDaExlIDs0aYvm4HYNTtC/geRU/d9plGBzFk3MRUmtpoxvwcS6C2WQ3x
         n4XxewS8o02pmbm9zER/wrRLZ+p9c+fIvM+pWKpjEVFh3mgBWMDCJ3up9Kh3KzPBXMm3
         GFNauunBa49WUXOYJYIXXZx2BWF8UbCoum6Xhj75CfqaOV4nngEP3tPDV76yiMWeSJ1r
         0ARZmY16cci5N+yM3xWcZKxgTCOc9x25QvvcmzsWwkYLs4GRVZWfXIlVJZmryY/yD8BO
         dey68MyoX1P8gl1MhQTNfTA3lA4/mBtFY+SbCaKJj9CvjbtEzGL2vZpuAx7/XtxOkJlz
         iCpw==
X-Forwarded-Encrypted: i=1; AL+hErHMNhn+6K9zhsxYwPvB+gOm44fdH5bBg55sEoaR5Ln5HI0tlmBGldTwpJWx/Y8FsJrXqyaK+qhqgyEqf1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eJujt8sjh7lCSNaz6LHZHQ9fA/S/ELolKxmU7R5q5mI+9DvZ4
	yOtzwjN1u7lRklZA/7pKCMXpUkPewlHfNs0PSEQa48dFLJ4aYxRY2ctN
X-Gm-Gg: AYBFou11hzo3r9hpIIKTHjvtCMOWHPk1FkOpQCwglfFCAht58/gB9yXljA6hnINjFKh
	OAQ/ZMEUWJPpOxRXuP0iMGUZTQ5YVIIBFoqMRHXquWekkwRZXFq4oo8RiRHvq/T4/ezDKlwOB+Z
	duVWcyexjdP7kobaw/jGG0RikKwRkNVWusUd4NDv/W/HK7gJ0wXwoAyrfO+AQM93XgR8OOxaMFo
	o0ta5jfu9/2L3+OZS3/mpgpH7NPO/krZUD+GocWMchejzaARviuDkDDa6LmUHEzdzRqhl2arLvg
	SxA09C1Bwobf/UbWEWQuViu04d/Wiu2Eor6XJixVotOOmqpOUVJLwla/vuzLKjTqS0EIGxiCSzc
	VtFsJA5nhTuPNpqvBF1Se7gg94OtgYNm5F85MFEVZZecMBzFOF8qE0v/t5KI5WhhEF0QgFl+7bc
	JpRl67SQRA84hPqCwLT6ycZY5n+HzO6x3Zm49aKT1DwPE/dsrTc6PyaW24uw0oj0E87SAXFK82V
	Dex/diAF5EGqGQaXYq6ldI6y5ddBUsX+gPqz4NaHEJHtszR4VM2w4d2n3i2FuZG9O+PQ4U3UR8f
	PNLlWzWfW21KtuivILCjG35/B0X2gXKSbBu/W79Ly5V8ivFmCVREDYSRl0GAaUSz9DpTPPPUgIE
	DAY1wLYhjJIZUoYlx1WMGtDM5/bjEHaXLXh505g==
X-Received: by 2002:a05:693c:41c2:10b0:36e:58f3:6f0e with SMTP id 5a478bee46e88-37682f9334fmr3045707eec.5.1794401596123;
        Wed, 11 Nov 2026 04:53:16 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm18487673eec.14.2026.11.11.04.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:53:15 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] ext4: report sub-block project quotas in statfs
Date: Wed, 11 Nov 2026 12:53:04 +0000
Message-ID: <20261111125304.96354-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ext4_statfs_project() converts the selected space limit from bytes to
filesystem blocks before checking whether it is nonzero. A nonzero quota
smaller than one block therefore skips the project space adjustments.

For example, a valid 1 KiB hard limit on a 4 KiB-block filesystem leaves
statvfs() and df reporting the underlying filesystem's space, even when
unprivileged data allocation fails with EDQUOT.

Test the byte limit before converting it to filesystem blocks. The
resulting zero block limit then clamps the project space statistics to
zero. Keep the existing rounding and the rule that a zero byte limit
means no quota.

Fixes: 689c958cbe6b ("ext4: add project quota support")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
Changes in v2:
- Add Jan Kara's Reviewed-by. No code changes.

v1: https://lore.kernel.org/linux-ext4/20261101125847.54531-1-dennylin0707@gmail.com/

 fs/ext4/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 9cae52471dee..91c1a54730f6 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -7001,11 +7001,11 @@ static int ext4_statfs_project(struct super_block *sb,
 
 	limit = min_not_zero(dquot->dq_dqb.dqb_bsoftlimit,
 			     dquot->dq_dqb.dqb_bhardlimit);
-	limit >>= sb->s_blocksize_bits;
 
 	if (limit) {
 		uint64_t	remaining = 0;
 
+		limit >>= sb->s_blocksize_bits;
 		curblock = (dquot->dq_dqb.dqb_curspace +
 			    dquot->dq_dqb.dqb_rsvspace) >> sb->s_blocksize_bits;
 		if (limit > curblock)
-- 
2.43.0

