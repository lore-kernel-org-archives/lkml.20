Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1830239C657
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334506; cv=none; b=FDSzbya8nqOTc40t2XTyu3nKIGciv9aFLDLMgvZSaoTmYQzGxRT01ZVzelw5u9DDHNUCl403S22iC9k+rO46hO3gi1FghJ8pby5RlUjwilly8Umqvj7Y77zy0rD45NchUD8FN2w2cgSBKvpcI6WGEhaSS6UAx48JgnU/lQf00L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334506; c=relaxed/simple;
	bh=UTR8+ch4ryIY7tRDO5W3HY3l+J2/4/c+7TP/kDYrcqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sdldi730HnX4JFfAjKYq+VEGi1M5Us9CmOoLnCJ63QqRdgc+ZbKK7VlQ/KNge3lmpzFo8xKj9thsdp1pmK8JiWZqIm/zzr8S1mdBCyGmk0i6128Ac6TP1gWR2O8g5o+u13oV+6FUpSMUT7QsZrgNNcm8BoXjb0pwZcvjC8xKydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=N6aYCz98; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=zJn3UOdS; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="N6aYCz98";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="zJn3UOdS"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DKYDue1192645
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Ubm0
	LbdrqVHYg4PE+94rjzX7D+QKZrMTkJ+a2PDrQYg=; b=N6aYCz98usOklcND6VjW
	izjfgVh3jZycdRHSkWmDskMyG04aU1oO9iMRjo3cHQtH+VL6hlmBO7XRoDT9YsR7
	sGZPA9f19riUOzVan/2P7yWzKgeGXfkbYWk5vJh92ixqHeTzyrVlcDOQ9ytU8+SD
	MtBHlBi+J004crPbM0MJDzqe+SlhOS8EzPYT7Rx48jK5bEXVqVLhyk7laQjV+6qe
	jf54gbKL0s2eKpMhIZQFJHtB9ieqAbZC/NFRjyWsWlHErYnXGUtoz+Ke6rCeyoKQ
	ofCOc7F5x/JywvISJHL+YrOxo0cSrzj46cBW/YmonuukVLFowf4IGnYITR9RR8Ku
	dg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gnqqt2s22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:42 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8341cfb4so58078676d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789334502; x=1789939302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ubm0LbdrqVHYg4PE+94rjzX7D+QKZrMTkJ+a2PDrQYg=;
        b=zJn3UOdSU9pXwDGwOc82teU5yyewsx1izR0Szbi4P2siljX5PPrEm6SBe39TLITpeh
         F0Jq/K43ud+Rzsf5tb5RHjMsDQVJd0D6TWu1x2+YDwuXotOCd/ZyYaWrgJDzkbPybsXC
         tN5SJQE5ctW6bgtu9g74e3qjavDPDEIySlxAdmXvvDKZ+p/Kw8on/unskueRHVApvVlw
         N3XTPCUAIKVl/DDvg8Ew/yZKgd61Aou18bs5PZ/FpWDTnR7zKQsSl4R26d7LB0fE6OUB
         yo1m2Hk7/3h148EIDXOu23Nws/rQSGDVsypMLnWUtyP/ONRkiJDzIQ1106S0ksUrEA7X
         ThAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334502; x=1789939302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ubm0LbdrqVHYg4PE+94rjzX7D+QKZrMTkJ+a2PDrQYg=;
        b=rER9zCDJAh6Tu1KDBzqhX7WFKO5ciHQzyiu78mCfisy3SSYxfJf21T16Q4Rjca45Ge
         sTaGLNEmayzQbtFI3ohxsMFMgO7jdpJzze/2o1KABqk+ayej4BDVTFGplTtSjxO4Rvi9
         Sv8CAgXwrIEZXzYTZEsuL0KgeOqk1svj4QvStrxdaVe+ViXUrkwP7cpA0sEuE/xHjgNU
         +ZR91WF5h3fv/ggPAG16CotIpig8PdiCXpMiLuFvOq3GQl968jvCiiDgHoMLvk5MSv9b
         b41JTFfme5AcTVyFFYzv+u0UfrHgriwzUxruqj7s32c/8cjz9qhPXmaa/rE+VA6WJ/e/
         gbGA==
X-Forwarded-Encrypted: i=1; AKwUvBy2OJnhb+VJ0q3s3ZQSEjJ0mV8g4J96Z23yt9W91shFmYjq2aS+tRvI9GeuXi+9DK4gCSFSIdzzWHYTkeo=@vger.kernel.org
X-Gm-Message-State: AFuF++nMOVOHr11mKcZ8kkbetQRLPR9j+jHr6Qyg0mIbKox0sDiACZbC
	N75r8RVHvk4Q2F3rswSW5itbKCRPtt1SUkw6oG7jPl/9+Cr4bJ05+aORL4/C3+mQEhpkMsDlfVZ
	hgIC+fkKYvj8vKOZWyqEhj8aLJqksv2QtGaPgPScbe5zzO+UezZwm+03SamRCig==
X-Gm-Gg: AYBFou0GpwU0HNLkM/lvEK9wPsC38L7GLPkr2x66zt0MG5DTaiOjNyDYA2wEwnBhfNO
	WJQetbTJe9Jf8vmXhYA5u4oO/Sg40FZPZPeK3mn14A/V6cutx0Qo2ZQ2lVpke1Q03JdCd+25ADZ
	JtFpIkW+PlBMK4+xAOSX79UA+bqDrLFYX22+QrPwBhmxs3mN5ayhv98j1i3tAZaxxFpqlGQWFPt
	BM0D/rsvlxIk9kE1aV/3+byYWx2WjCeeh4q4IJPF6ZeDzE8zbkxXCqlOTUMNA5U4ead1Ct8Zvbn
	WcAphdEwf6KONEVYUennozJ8YvFGEDsbRVDfo96UhEPw+FVFJ92Cn6KWYWujF5pr5FjqFVBAQN5
	fs0v6myplOUQYcI0O641uuV0f3rzs7IrZ+T70H0TIa6qeURvVVQvQsA==
X-Received: by 2002:ad4:5cc3:0:b0:910:3453:d4a5 with SMTP id 6a1803df08f44-9121daaa77emr124611756d6.31.1789334502016;
        Sun, 13 Sep 2026 14:21:42 -0700 (PDT)
X-Received: by 2002:ad4:5cc3:0:b0:910:3453:d4a5 with SMTP id 6a1803df08f44-9121daaa77emr124611556d6.31.1789334501613;
        Sun, 13 Sep 2026 14:21:41 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3a50sm78432696d6.40.2026.09.13.14.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:21:41 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 13 Sep 2026 17:21:28 -0400
Subject: [PATCH v2 16/16] btrfs: remove TRANS_JOIN_NOLOCK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-btrfs-remove-v1-space-cache-v2-16-186767a7e106@columbia.edu>
References: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
In-Reply-To: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789334484; l=3141;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=UTR8+ch4ryIY7tRDO5W3HY3l+J2/4/c+7TP/kDYrcqQ=;
 b=YXPUciB67uSyqLI9Un79rZpTow+H/No65LW1qiYVQ7f51090sdxJIx7JufFADXGN8Zf/x7Fk5
 1fXGTeA3qE+AjWlrOoOOQ73h8x7w2TPLdlL62Cmx+JUiiNR4cRhu1Oi
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=N8y8hG9B c=1 sm=1 tr=0 ts=6aa713e6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=bdDZCe7T2lofFMgrKTwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwNSBTYWx0ZWRfXx+jdxdFa7QlH
 06CSwQ2QnSsTnIB+gFhybjWClS+VNxCfeOWkxEw2u2jARs8noNFa1SamRC6JARccYVG6NqfG0US
 Z46kv2Ybbri6S6r4Z4QQNxq76YuYbLQwZKn0UPnl9+/5G4ShF+n4
X-Proofpoint-ORIG-GUID: 3x1WJw7_UWvsy2lDecrs1vYJhPhxgVDf
X-Proofpoint-GUID: 3x1WJw7_UWvsy2lDecrs1vYJhPhxgVDf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwNSBTYWx0ZWRfX5nLL2DxsXMH9
 kCwcbOYSX8L7Ws7bVPGlXIeTo0U2XQmRuVCkI4wjl9i7bUanvhhYLHq4jCOEj8Owr8brmO9Imz9
 fYocnOz+VuIpZOoynj4ZQ0nWbDuAFUYf6wabjZgskjcwf1VJVjoC6DbJyKyhs/P4BFjKYY9qRxC
 lH63+iCvtwIgwxhvm9ynPE9myiqxbofgFdmQI5lhCc71pKJ37nCv/+MC4/87xyGI69FKMOdXOhH
 Yu+2XmUZ4+vEKTd2B/peJ6ZJSLsTypWVKDlWZqH67t5SwP3PjrvToXUkyiVhH014YEkCX5YLZu2
 aOh4EkNtU1KZ3OJsfVdzBWGXeLfkHdr8G6zz2MBa96f6dBZFEO/Pon2YOeu2+4MNSVXmOzI3vhf
 28r/pERcZ1jlrNVuloDRqLlMt2c3i6FQCdhfDXbkRvLg72I8q/jQS8lTovwtk0DCRM0Lm6Dmepn
 1pqWOuuJ4+tnmQK5zJA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=10
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130305

btrfs_join_transaction_spacecache() was the only user of
TRANS_JOIN_NOLOCK and is gone, so remove the join type, its entries in
the blocked types table, and the special cases in join_transaction() and
start_transaction().

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/transaction.c | 17 +----------------
 fs/btrfs/transaction.h |  2 --
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/fs/btrfs/transaction.c b/fs/btrfs/transaction.c
index ccc8d5840355..01d577cc13bc 100644
--- a/fs/btrfs/transaction.c
+++ b/fs/btrfs/transaction.c
@@ -125,17 +125,14 @@ static const unsigned int btrfs_blocked_trans_types[TRANS_STATE_MAX] = {
 	[TRANS_STATE_UNBLOCKED]		= (__TRANS_START |
 					   __TRANS_ATTACH |
 					   __TRANS_JOIN |
-					   __TRANS_JOIN_NOLOCK |
 					   __TRANS_JOIN_NOSTART),
 	[TRANS_STATE_SUPER_COMMITTED]	= (__TRANS_START |
 					   __TRANS_ATTACH |
 					   __TRANS_JOIN |
-					   __TRANS_JOIN_NOLOCK |
 					   __TRANS_JOIN_NOSTART),
 	[TRANS_STATE_COMPLETED]		= (__TRANS_START |
 					   __TRANS_ATTACH |
 					   __TRANS_JOIN |
-					   __TRANS_JOIN_NOLOCK |
 					   __TRANS_JOIN_NOSTART),
 };
 
@@ -310,12 +307,6 @@ static noinline int join_transaction(struct btrfs_fs_info *fs_info,
 	if (type == TRANS_ATTACH || type == TRANS_JOIN_NOSTART)
 		return -ENOENT;
 
-	/*
-	 * JOIN_NOLOCK only happens during the transaction commit, so
-	 * it is impossible that ->running_transaction is NULL
-	 */
-	BUG_ON(type == TRANS_JOIN_NOLOCK);
-
 	cur_trans = kmalloc_obj(*cur_trans, GFP_NOFS);
 	if (!cur_trans)
 		return -ENOMEM;
@@ -708,14 +699,8 @@ start_transaction(struct btrfs_root *root, unsigned int num_items,
 	}
 
 	/*
-	 * If we are JOIN_NOLOCK we're already committing a transaction and
-	 * waiting on this guy, so we don't need to do the sb_start_intwrite
-	 * because we're already holding a ref.  We need this because we could
-	 * have raced in and did an fsync() on a file which can kick a commit
-	 * and then we deadlock with somebody doing a freeze.
-	 *
 	 * If we are ATTACH, it means we just want to catch the current
-	 * transaction and commit it, so we needn't do sb_start_intwrite(). 
+	 * transaction and commit it, so we needn't do sb_start_intwrite().
 	 */
 	if (type & __TRANS_FREEZABLE)
 		sb_start_intwrite(fs_info->sb);
diff --git a/fs/btrfs/transaction.h b/fs/btrfs/transaction.h
index d2e2dd6101bc..813f0a261b21 100644
--- a/fs/btrfs/transaction.h
+++ b/fs/btrfs/transaction.h
@@ -100,7 +100,6 @@ enum {
 	ENUM_BIT(__TRANS_START),
 	ENUM_BIT(__TRANS_ATTACH),
 	ENUM_BIT(__TRANS_JOIN),
-	ENUM_BIT(__TRANS_JOIN_NOLOCK),
 	ENUM_BIT(__TRANS_DUMMY),
 	ENUM_BIT(__TRANS_JOIN_NOSTART),
 };
@@ -108,7 +107,6 @@ enum {
 #define TRANS_START		(__TRANS_START | __TRANS_FREEZABLE)
 #define TRANS_ATTACH		(__TRANS_ATTACH)
 #define TRANS_JOIN		(__TRANS_JOIN | __TRANS_FREEZABLE)
-#define TRANS_JOIN_NOLOCK	(__TRANS_JOIN_NOLOCK)
 #define TRANS_JOIN_NOSTART	(__TRANS_JOIN_NOSTART)
 
 #define TRANS_EXTWRITERS	(__TRANS_START | __TRANS_ATTACH)

-- 
2.39.5

