Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15DC2F90E0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830418; cv=none; b=ovmVMzs19aoKCggvVbbBnBW77ExaJd7UNhiHonGWfENiEmJG2/PudIEuOYSYqghCQ5aHhtj1eTIWIkwUdhe2zpC0zQwvwTufLse6ImO4CDQ5ZyxReC/5dPmT+qqYs+0k6ui6Kt3LAXxJO5Yls4xo4jPQn8yKu3Bq1+hkQEc4Twc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830418; c=relaxed/simple;
	bh=zFxwTdYCThz/pj4rRJQzgRssc/yjoLDS6oQG1BqOgds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pK82SiYsLOi3IVuvRBD5N13i4NcaVM44ou5gL/zqZLIFt3DFVh6AfFXMzCNqkRex0LT+mN1j1XjKBwDQVmDHvJKLbFSdgUaMTFPFOkMw2RrkFekG4FciZqo66+1/0Mml9KdTb13UgcskVhjxB+ya0D7E1aI7xsC/TlgLYorY9jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=SWx6llIR; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=kY33UHcR; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="SWx6llIR";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="kY33UHcR"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6880upEQ726802
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 21:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=07fe
	Mxoum7S5Ym2PiVCScGldmIwxg5T94sGONJXUkrc=; b=SWx6llIRK4edzFA1nNHz
	Si6bjHFv74o41wQLBUYaGKWIdm7jkSl8DSflVrixwq4Rc+MzrA3+NdKnyLuM/uTw
	4TnHeQ8c0W2/0btJdbfXXdyXduSmdvLY4xUNlzcfUdP5d3Tl+cLfQGP8ugDwpK97
	etz7Ab2Z0qvAculvlbVjDV4aQDzLt7EiOnp73UDNCWwVJZQrUL/uktjbB1U524JA
	4n0mPYXHRtaqWLN8eYJmNLNtNBH1/tLDZYx/K30VyvWCCKPkRdEaRPFwYqSVwfuE
	9uQaHZq9fgLZS7r7m27RjNSkwbFydk53+qBD/zNNhz0WYeat6JT5mdOIKWhF5kfq
	Mg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4d596n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:20:05 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e7de22fddso89714496d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788830404; x=1789435204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07feMxoum7S5Ym2PiVCScGldmIwxg5T94sGONJXUkrc=;
        b=kY33UHcRBm1ykn178KuDXCDKkXr5KjOg5tWPRcPKJ+0zKktbA7CeDolK4USHDkkzUc
         2Q8hzSt/9yTB5NpN+aKWfgvk+3zs9Nkgp+Nl43TeCxHvSyEgh08BomCko4Em6RemZ2cB
         9bK5tQGVWZ1Q4mgyM1MfvIIiqNY6ixtB39veLQQ7Ly+WwCsPbB6rsvES5+4VJaGrKTwy
         IGlsCakqJKDC/d2qjdFOuF6VbaHqro6kVqHA/3Gh4pU1el06ARB5SxKT6wpApbbVwhkY
         Xj3A/MHT0Ta4MtW+jQk8gUIeRxSHDTAs9wnMWkHFMD7/9g3OeHPCv3IZft0H6FEcsIGg
         /XpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830404; x=1789435204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07feMxoum7S5Ym2PiVCScGldmIwxg5T94sGONJXUkrc=;
        b=FT6h0iPoDKujj1o86bT413iUDx3ZRrCNZj4d751ysfU6Oy89lcFS+Xv0iGcaGy+XNF
         TdkrRRV1kh5UMFRVkXxEV54Tsuke3cDm62iam2M7ZM0vkDp9dk7NjQnXOpzIcOX9nu2C
         mRR14STUdlki6+/ob+UVf/ixIAfWefQxGOeTVJ3/Rap/2Azk94gwt+ygmPzYvYjkhzYM
         /4tdUpgP7gl1OIvc/K26vKkaX4ZQpE5cSuoB8i9dhfj3DV5o+wTSJ/vZgjiAy2WfZg5j
         iFfUReiHtOo7UeocBb/T2253fMxBonijiwSk/eU2cE7/UOwItIR0OdPKIVP4SoI9xLo8
         66Ng==
X-Forwarded-Encrypted: i=1; AKwUvByRo4GqHAqEBHniwCxpEtEmDqZNcIY1Lnq5VpS/f9m4rfoFOoUVxJj8BytF2DsFwcSMDzXqB74IxaufrqI=@vger.kernel.org
X-Gm-Message-State: AFuF++kJoYD6r/bxwk8UpWi4+F8ynV3Sq8e3wHEVvRm/en3AuYiT5UiM
	D2WD3l5+BGlCw3wpTV4C9F5dJx0hZ9+tgw4CroevEfMsp7PYzdeB0aXWJv0Eja/jOJLYfX36mYU
	pRd/cWv67+a7CO+FyP6Utc2BwiQU5X4Z6jhS/doo+5VmwySy8IJBl/UWJzpTqlQ==
X-Gm-Gg: AYBFou22rqAqMrsXpPeicIj7kUPczAnILUo3FjOMIrqfNUCUgBKLeAhpWCq/MopN0BB
	FK9CCUtrnvYGIEuju2nREBA9KGMrp8hwQfcJDQ4A8X/UTMMJ4F79VmylwPGqB2PjhRa+AnmvzXl
	mPzmrIkayZPJqgmoyThcDdiqxOESAIgt+wJ3dAKOxFxh3hy/4sbvy/2h3YeprLG0IKepF9YxeIO
	iX1jSFH8LeGFJISLO4L4f5SkMGtsiO8h/2dpQaqWuVAivk/o+0pK+xMWs/1gfdTEjZCpdXynMnR
	oouVt0awL6vdfqAZqpdNIbrypHmy5V2g12pw2uiV6aM3zK7bksX5fWzoSCd1C/EywwtK9vZh6em
	uqiQCe2IWfHGPJXrJH+jQUhKkjYjdzs8vmrkF2sXr2Tuun6o+emY=
X-Received: by 2002:a05:6214:6005:b0:907:dd19:fcb3 with SMTP id 6a1803df08f44-9103ef703d2mr286489716d6.24.1788830404422;
        Mon, 07 Sep 2026 18:20:04 -0700 (PDT)
X-Received: by 2002:a05:6214:6005:b0:907:dd19:fcb3 with SMTP id 6a1803df08f44-9103ef703d2mr286489416d6.24.1788830404052;
        Mon, 07 Sep 2026 18:20:04 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040694543sm104322656d6.33.2026.09.07.18.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:20:03 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 21:19:30 -0400
Subject: [PATCH 15/15] btrfs: stop reading free space inodes from the
 commit root
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-remove-v1-space-cache-v1-15-5f9a5ba352a7@columbia.edu>
References: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
In-Reply-To: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788830387; l=1999;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=zFxwTdYCThz/pj4rRJQzgRssc/yjoLDS6oQG1BqOgds=;
 b=wPWNzByVne0lc0sbeWWmpxkE22+H9rq3HTAyhtftQA1WXlPMbQcO5iaLkEunryOkJQwXyOB2S
 tflMgvDGgPVA0XtFuyc3HEVthT3tT5XpcAjxH9vsGUFk+HqQ2IbhTMk
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMiBTYWx0ZWRfX6GkmbTL+Rlsb
 rmGTZB10eLQNaH1XwuUE6OcZU7YqJQVO54SK62cppnSsw4tkFU0B4JLx8ZyVTpqTvHni248DYlG
 vhv1MNb8ju9EoJq32/JW7ANbUOExlmpruy5E96gmnkP7nWf3ohDy/r9drtbhXUkGSJA3a1TnCri
 fWnHrfIJKBmO49uWAiUExHPBWHhTe6PxuNF9QtP6FgwGsiSFQqneFZAXVI6IcBy7AROGQ6PUUEi
 aBFvHMXv5zoryg5o/z0yAEX+m3jEq6Y8vkEN56CtVAAPmCKowO/U2bfpB1ll+bMjD+6v3xOy6Zq
 nRnymZMvudamMwAB2+Jnf4F+XZ5BMX1OCnUs1cJINRI/AFM01zMwc0h8l23VbvEc199xJ0iWbcV
 1qR2cVxR0kIH8pn8jNktSnlpJSAM+0lQJbAgYqy5nkFV3XeKZ7DmB1s2anZOn2vgadcNONV131u
 6/0mYulkBkmde+0qixQ==
X-Proofpoint-ORIG-GUID: Sxc2fn34nsht297qIhfKUN0FdkIF6ro_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMiBTYWx0ZWRfX79Ldu0Pguhf7
 QRRKDQGMQ7R03iV0qoGp8ivQY5diiRkex7wA6KmeegXVO82R72o0LLPTIRjpXiPSD7aN9Jeo9mB
 SxXAV2xV/KFxkpqdSG8RItLof3h9kRg5lhKQDXLfubfxC9atXZXh
X-Proofpoint-GUID: Sxc2fn34nsht297qIhfKUN0FdkIF6ro_
X-Authority-Analysis: v=2.4 cv=BqCtB4X5 c=1 sm=1 tr=0 ts=6a9f62c5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=F-rX_8kjA07mH5tGMmcA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 impostorscore=10
 lowpriorityscore=10 priorityscore=1501 clxscore=1015 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080012

Free space inode data was only read when loading the v1 cache, which is
gone, so btrfs_get_extent() and btrfs_lookup_bio_sums() no longer need
to search the commit root for them.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/file-item.c | 11 -----------
 fs/btrfs/inode.c     | 10 ----------
 2 files changed, 21 deletions(-)

diff --git a/fs/btrfs/file-item.c b/fs/btrfs/file-item.c
index ae1fd4da38d3..ff8f8cad00fc 100644
--- a/fs/btrfs/file-item.c
+++ b/fs/btrfs/file-item.c
@@ -396,17 +396,6 @@ int btrfs_lookup_bio_sums(struct btrfs_bio *bbio)
 	if (nblocks > fs_info->csums_per_leaf)
 		path->reada = READA_FORWARD;
 
-	/*
-	 * the free space stuff is only read when it hasn't been
-	 * updated in the current transaction.  So, we can safely
-	 * read from the commit root and sidestep a nasty deadlock
-	 * between reading the free space cache and updating the csum tree.
-	 */
-	if (btrfs_is_free_space_inode(inode)) {
-		path->search_commit_root = true;
-		path->skip_locking = true;
-	}
-
 	/*
 	 * If we are searching for a csum of an extent from a past
 	 * transaction, we can search in the commit root and reduce
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 3a1230b777e9..cdac30f574d3 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -7215,16 +7215,6 @@ struct extent_map *btrfs_get_extent(struct btrfs_inode *inode,
 	/* Chances are we'll be called again, so go ahead and do readahead */
 	path->reada = READA_FORWARD;
 
-	/*
-	 * The same explanation in load_free_space_cache applies here as well,
-	 * we only read when we're loading the free space cache, and at that
-	 * point the commit_root has everything we need.
-	 */
-	if (btrfs_is_free_space_inode(inode)) {
-		path->search_commit_root = true;
-		path->skip_locking = true;
-	}
-
 	ret = btrfs_lookup_file_extent(NULL, root, path, objectid, start, 0);
 	if (ret < 0) {
 		goto out;

-- 
2.39.5

