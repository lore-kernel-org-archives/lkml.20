Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677964B515E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825481; cv=none; b=WFVSCBTPC7yrBFe+guFxLgl3AnJMiGbLP3Enbsre6WVQH98gj3wDgkxC0f6QhrN0L8UQbPnakt5uoKP6SrKQKnFRXMKI7QRTk5lSKMkayW43VEJbd9YbXm/eM5D9FsGhRPvmbICvOfL+GoNTkrF+wNJh2KVljOJjnaQEZEZQC5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825481; c=relaxed/simple;
	bh=QBIcsQLcF0lGzSWLBeS00QzPICpzsDSCLhjaLY/pBiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtLhfMRSZkaImzS325cunzsvj8C5CnBeSD2eoloDsR3pogthFaUwyYl9Fq1xJE3Cc75uGMyA9edkHxVqYpw+5zbfSlABcIZnyznq5tk4ZiR+ZHJHO5WI3Ce/onFdOTjLPBPvsyXJTmaED5WyHxHwj0+tbYc1sIrz6maaemcjw4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=XpqjHG3x; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=3gBZ1QCH; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="XpqjHG3x";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="3gBZ1QCH"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CGcYTe800439
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=KtKA
	qYq+gxnKs1Lb3GJx6ekyg+ZNrhCScOr9M/h0lLM=; b=XpqjHG3xA2SkybAu3DiB
	PwBHJb9RM/1gTxZSYQMca5dt9ab4Z4YULEC+CgCh6cBIQq79Fc1YIh3PDj4uhsg7
	9cYSYIx3UFmoGycVgUyyTLDcIUjsuZbZEcyOfjX6fMeefbI+Yih58fuDWGC48NUQ
	6i5ax/BIp+Fodm50tozPEapXGcSwr+to2fT4ZgJLIOwwGOjdbGFSEkUMolcVLnoe
	t9Qmqu6CjwvNMfDiqkA6w8DqdSaON4iVHPhaaR5UdkWvzVlHTqKR8No4eQuau+7h
	ZVlAH97SK4/ZkTrsY63bNKbiJ4dcGuiHyul/bnZU4C2a822oko84g7QSLyM5je9z
	wQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h91x6sc00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:17:59 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53397b6e05aso48215471cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791825478; x=1792430278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KtKAqYq+gxnKs1Lb3GJx6ekyg+ZNrhCScOr9M/h0lLM=;
        b=3gBZ1QCHYGtcjuFvCsuxTPjqz+tjBC/IGlyCuTnePS17WFzQT9kqNFl8juPWmmnNWm
         rVR6gv+JnRha5IKYQARoq9GrbofxrPVxTqiufig5u05SQ0Zn56Bjq53ic0U57dokqw+H
         vfQ/0MUxlQJNPIvLAK/3sWkLO4kY84ZdTw2h5VQM/CdcJXtLsuml+ASRdihcpMPpFrm1
         8r9TKn5t/cSYVY7RVXQTVOVB76w6gwM1F7w6rwdQcWkqgzKpPvpQIwufEmqOPyfWh57f
         bL8Udg6ktqZP2JaKrkmtrAT5RoN/B56yT+DxvcPXxP7rMoWy5foEmdiCm3b0O9J8hBYo
         LjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825478; x=1792430278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KtKAqYq+gxnKs1Lb3GJx6ekyg+ZNrhCScOr9M/h0lLM=;
        b=h6kZAoQMTfemvo12i38Crh4QtovMiha/RH5v7etekbQlG+3+MFf9eJadrTZwlfvRHf
         VIfnzf3n5jSyKNG32izf+4bVONj9+M9nX/b6m5/aFFYlAbI/HbOpINWHYaiHRB8vTP5F
         fEBMrspIrukIqHdO+PBBiLW/+QMGzkU4/9ZtHziKvhIbqEITY9fM+nZioRTmnfLUpJG0
         R+61XBQh5DHhyPeM5pC5KtDzTJV3vTnl5FS71rB83TfYg1DAAPekSza9/qKpgawjgSXD
         kliBC2PEp3rGAxRcPd98U//uZ+QtTapO/qLo4Xn4K6+4jbxAflyIkUFC3xV2dhRZtj2d
         9Q9A==
X-Forwarded-Encrypted: i=1; AKwUvBznAVImEf3awz8Rlz9hb/6f0Qa2to6OMxQkSGDuFwUXEUbymcgpn2gZvO1Gel4kUl8EYopH96+DbrPkbeM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+iqOv0OrtAEvm1aRdnSHROw83rogpDO4TbXhye/UkjMhwsj6U
	o7gHlQ26xFZD+Sdiw5hDMGIrLMFu2f4OckFNVtW0ukYKUxW6d+Qm0i24hfV40xvlhnzGQ5u6l9B
	SN2dvNZYkSF1UqiLX0y1adDr8Q12ypiuJeIOprRakh0+YGZVCKUED78wG+63TGg==
X-Gm-Gg: AYBFou3oqr7aLA/sNFvGd3o0Hed7UNjiPSRgE8UZCgvXxghOvvIciFtVfXKkzwqFH5W
	uu/TB2XZycky3froR//fFbjZcS74dD9fYCM2LpKH/WD/j0kKjWE12VOtFfy0Jo9gxafp/V4d2nW
	tY0SZ2CSK7mxqF4tQKret7D89rYCXWi4WW+jqlkwfDcW63TgzRYETnY2zsvM9drlBbhvDhPVbG+
	st02v3ZXaNVPeRHxE8d0JSs8eRfJVA6jM5Y1JcLSOVyigCUEjYGk4e/n6OIT0pRXeGx70W3qGAg
	WNizxJ7hy5iee2ycr6+Hz2865vhHbJ0L7XkRUnf5uN7wkrnKbqtpzaSmT2aYoOAQmDPZ7/tgxVy
	tSTLpKJyytETO95L/NMJrYUuW9u9XtDftfUf+CXO84ah5SBc=
X-Received: by 2002:a05:622a:551a:b0:535:2283:20a3 with SMTP id d75a77b69052e-5359fb5bbf6mr176677261cf.33.1791825478583;
        Mon, 12 Oct 2026 10:17:58 -0700 (PDT)
X-Received: by 2002:a05:622a:551a:b0:535:2283:20a3 with SMTP id d75a77b69052e-5359fb5bbf6mr176676791cf.33.1791825477958;
        Mon, 12 Oct 2026 10:17:57 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b79a186sm84105241cf.20.2026.10.12.10.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:17:56 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 13:17:40 -0400
Subject: [PATCH RFC v2 1/3] ext4: reject atomic writes on inodes that can't
 do direct I/O
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-ext4-atomic-no-fallback-v2-1-c4b30c60e500@columbia.edu>
References: <20261012-ext4-atomic-no-fallback-v2-0-c4b30c60e500@columbia.edu>
In-Reply-To: <20261012-ext4-atomic-no-fallback-v2-0-c4b30c60e500@columbia.edu>
To: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
        Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>,
        Ojaswin Mujoo <ojaswin@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Zhang Yi <yi.zhang@huawei.com>, Christoph Hellwig <hch@lst.de>,
        John Garry <john.garry@linux.dev>,
        "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791825472; l=3165;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=QBIcsQLcF0lGzSWLBeS00QzPICpzsDSCLhjaLY/pBiI=;
 b=YS6Dulle1AWPmZZj/9tTcUzDGQR6mW9u3i7+Q+9LD8k5tWNoa1C+HBP8CsbcX8l0y66V4OkBs
 +sg6up/2J0TCIKqdPA7vpTXo2thcxsYPjr5iUDRuOXu8DsZpXKBCLb7
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: e-s4NO_WMjV7KOtPGzgUZECC_CmpRw6x
X-Proofpoint-ORIG-GUID: e-s4NO_WMjV7KOtPGzgUZECC_CmpRw6x
X-Authority-Analysis: v=2.4 cv=DrDDa2/+ c=1 sm=1 tr=0 ts=6acd1647 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=kI3bK8AaFqafbXCuNFkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2OCBTYWx0ZWRfX9iOJ2QjYX+60
 3HDaZmk6f2wmDLwVbk4L+luYnEQBA75y55Soxzokd+IR2Qrgq5AeOSNaukKKOIGYFC+xcHDFNSN
 rs28bEJSL+hEXxUqlzZ8URxBI1G30SFowNp3uTX0f4Yiwsw3gkzGjQfp2fsCmsZuwZxOI7291vm
 3Ikb7Fur5dIYcmzfVvaJ5BgItdJwtDTLcxSJF8U+vpQ23MNasufXtEB8oGdvfqFAVGOR5QllVAO
 Ffl6qgAV90v74DKrRPIYdUi5tEnQq7q5ux5g3qQ6rMswGzx3BxwF6Y479sVrl6xOwOyxf4xRASC
 F9/ypdkNB5sdRaqIh0Ne6EodelwhqDElAHgHKHAzCyjQAj9akRSLmG4XuTSAiFrjuAGlugKQeKP
 0jtSM9GH550A9va6dTQswGWD5ifteqf59rtJreLi/f3UMOI46lFWW6Tzmct4qFd4wqSPNJ28kl8
 JLXXIFx8AY7P6OCY2iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2OCBTYWx0ZWRfXwVvt3ATCtjOi
 iIk8j+0uk7nf4LlWaiYGswCJqOR3bLcgzTWnBicMuQHnVs5vIVazWvYvKdzrGntifM6ckqG+bgv
 9EhA23z0yPFMfMcUmAaziLiXnXcInCgH9hE4u32TnLh3GSfptC73
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=10 phishscore=0 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120068

ext4_dio_write_iter() falls back to buffered I/O when the inode can't do
direct I/O at all, i.e. journaled data, inline data or verity. That
fallback runs before any atomic write handling, and
ext4_buffered_write_iter() doesn't look at IOCB_ATOMIC, so an atomic
write to such an inode is silently done as a plain buffered write with
no torn-write protection.

ext4_inode_can_atomic_write() makes it worse for journaled data by
advertising atomic writes for those inodes: statx() reports atomic write
limits and the file gets FMODE_CAN_ATOMIC_WRITE, so the write passes the
VFS checks and reaches the fallback. This is reachable with
data=journal, or with chattr +j on a nodelalloc mount. Inline data
inodes don't have the extents flag and verity files can't be opened for
writing, so those are refused before ext4 sees the write, but the
fallback would still accept them.

Reject IOCB_ATOMIC in ext4_buffered_write_iter(), next to the existing
IOCB_NOWAIT rejection, so neither fallback into it can complete an
atomic write non-atomically. Also require ext4_dio_alignment() to be
nonzero in ext4_inode_can_atomic_write(), so statx() stops advertising
atomic writes for these inodes and VFS refuses RWF_ATOMIC early. The
runtime check is still needed, as the journal data flag can be changed
on an open file.

Fixes: b7987a7d69a4 ("ext4: Support setting FMODE_CAN_ATOMIC_WRITE")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260909-ext4-atomic-no-fallback-v1-1-5a6b9539c002%40columbia.edu
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ext4/ext4.h | 8 +++++++-
 fs/ext4/file.c | 8 ++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 724a27e8be61..5115f067a9f5 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -4057,12 +4057,18 @@ static inline int ext4_buffer_uptodate(struct buffer_head *bh)
 	return buffer_uptodate(bh);
 }
 
+/*
+ * Atomic writes are only supported through direct I/O, so an inode that
+ * can't do direct I/O at all (journaled data, inline data, verity) can't do
+ * atomic writes either.
+ */
 static inline bool ext4_inode_can_atomic_write(struct inode *inode)
 {
 
 	return S_ISREG(inode->i_mode) &&
 		ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS) &&
-		EXT4_SB(inode->i_sb)->s_awu_min > 0;
+		EXT4_SB(inode->i_sb)->s_awu_min > 0 &&
+		ext4_dio_alignment(inode) != 0;
 }
 
 extern int ext4_block_write_begin(handle_t *handle, struct folio *folio,
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 374b4bc25bd5..19a8843ac420 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -339,6 +339,14 @@ static ssize_t ext4_buffered_write_iter(struct kiocb *iocb,
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		return -EOPNOTSUPP;
 
+	/*
+	 * Buffered I/O provides no torn-write protection. The direct I/O path
+	 * falls back here for inodes that can't do direct I/O at all, so an
+	 * atomic write must be rejected rather than silently done non-atomically.
+	 */
+	if (iocb->ki_flags & IOCB_ATOMIC)
+		return -EOPNOTSUPP;
+
 	inode_lock(inode);
 
 	/*

-- 
2.39.5

