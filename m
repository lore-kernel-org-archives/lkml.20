Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703324BD793
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822541; cv=none; b=KK5n9CGQRmgJbsUepI0CPCifm58a4jMuyuXwkXtMmIq+Y0qKYqeNg7s0QX37qC4Fl1wZOQqbx6JfwCU5yBw4mMydf0pgcO71H4tHVzbsHeWNNN7blGKEcX4vs20TMPBBaDQ0r6vmnQDTTEoK4Atm2stmN5egWGfhnlQILv7asAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822541; c=relaxed/simple;
	bh=rNSnaClTLXC84bceWmGxm4/sCU3gLiaNxuPCtIlu03c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HgNMJY35tnJY5/401HMzWT+yUnh1KSIZ3YUxhbZu2efqpV59u7U1AIJxdm4sDeSXPlpAcTZS2Gs7dS4dnD1z3DAZX6ffApBplcFrITWDr6SNpIUWSmJW6n4ZkEJZLJpKDgSfhASW87qKl0SwjbkQRTdAwuvS0YVkPAqQzP2Xd6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=OV/Cn2ST; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=JYs3gLdZ; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="OV/Cn2ST";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="JYs3gLdZ"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CF8I6M572967
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=QdPA
	IjpBqYLU00NM6mxpol3m84+3CsnU+LPG1JSnV48=; b=OV/Cn2STaQbmhbB70pXs
	J4ixxxbWE1DSC7JolnVHa5kgozdF1Xwd4kIoma3KeLQxNdkrWHROqFbRaHHRPrcx
	oE1t+sStpWp3QtLF/0huzAQ2/XyaPvQRws8B0Z6Y+pux5V7hs1h0yzQRTKvAYQbc
	Q17XEpkcZTI5Q9vM13fMgoZtJczL20U+tC9pOSMk4Pcb5dAp8NcC7pXabao4VNiY
	ujuwBTwX2td9XrCbOpEUVM4lRomz+eIMTiJkc8cIi2MM+/DAX0VWqC44GR7eV5uy
	cLSexFT71tl/oErq6knO5X4XXrzerH5+0809beKYljFtrjArLWLxtwhR9vu6D/kp
	CA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h91x6rwef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:57 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179a556c43so47385816d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791822536; x=1792427336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdPAIjpBqYLU00NM6mxpol3m84+3CsnU+LPG1JSnV48=;
        b=JYs3gLdZgnuG/ermJ4tKgvLmBMxyue3UfkOkzZ37P0RKu/DnhTu4ygS2DeWKpaLW/C
         2RxbkXZb2cvZzBmtKsJekTA6Ma12cjEp+wFXH/YhUcS+UXD8IIW15+jGf90tnC+79Af2
         YR0FoLiD2QfOLDyMAzAcRydVtRAAEaIpyKju3YUjrFfTkseCIvfo4LKDizKJzaUyDAyS
         sF001RiihfkPIcmxqe8eKm9OEUO9IgylGGrQ4TNK0/Bu3xGaiCKiR+OgtuYKvYthn2Nq
         GUzicJ807F6sPTYjEdPft7xku9G0KvvIwk9ksuaU5mCZfFPpkCgMnXm4n+GgKpUmnmFV
         adZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822536; x=1792427336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QdPAIjpBqYLU00NM6mxpol3m84+3CsnU+LPG1JSnV48=;
        b=zmY9TA3JfLrf51IdkhJnReeQSlmwk4KZd0fN0ZYSooK1h3+KoHWIAk/Yjfr9uDQcxH
         rZMBvmPyLyGXQinZpg1xiXODVWOexdvyWO1kLE/LHNsArXOCXXPAhjjWjis+UVra4e/I
         ePaGEJO5CD0/5ie6XBGagVcT8P2W+8jKnBBil42p2PkjewGBy5Y9wR3lYKu6JJAYgqlq
         1ZNG/foqT1z0ADWZlFOUFojtypi+h1suEXPasExqggpWBs/pz89jOxAvntfwb/gUwvZP
         pqas0yiZF+vuNr4Rbr80kpyShZQSf58jcVIqI1q+9td5Ts8/UgpIU/2S+wqzmAqDboOz
         O74A==
X-Forwarded-Encrypted: i=1; AKwUvByvCOV5cM3MaorHJxFRC/vxME4Qmri0Ryti67XFKi1bn4OAOEi9deq2K86rfMLJT3e/JqCo1Tjz3MLsKSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpwaS+XSTwE4MkOcMm9JP3yYcaM9a+dE02moW7akQd4O+bkyAf
	R9hcJXX3TK8d21sTIIF0B2MD3Gy5oLe3OJg6I0nUiHjEpJgYPxruzqGGMcyYa9gZoMHDlUXYiE+
	HLNFe4t1xBXHU5qgkUqBa4ipKJ4WGr6o6OWPJ43rkyM9teJgQWlZy7ne9Jr9Qgg==
X-Gm-Gg: AYBFou0901xath2FPZ3t9ZXvJbakkp2qvjl2nAkWDIGtWE7eq7/3isZkDnoGwcwP5tg
	kHmS1PSrCGiik8FDj682wi8u12v6ka2nJRLwTSqkKuN3R33UPOw9sEs0JAWD4Unz7BfBUw8ic3m
	qAZCAQb+BcBmaazRuT8sQQyHHOTe+luPE8KiJRFs2MzA1T+iorsdXbUqFvqsdTz+qoVa7qbSQ7M
	iPjZZHpG5uYsWcZu9oqS1kSFfWv8s5k3XLQfkERFcz6r1VEp//8wG4za00/uBCVE0TAAP0bpWeb
	1dT3VicR6Go7oQcWWy2WZUU0IKSfELtUosuThpH2DRw1wAGVC2eYQ9FBoLd/7C+Qc+LVd61t3Lm
	ZgNwY1l6YBmXBTYt/VlxXRPnUorUqeATCwY34teyns+yDTVM=
X-Received: by 2002:a05:620a:63c7:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93ebd274840mr1499614485a.56.1791822536653;
        Mon, 12 Oct 2026 09:28:56 -0700 (PDT)
X-Received: by 2002:a05:620a:63c7:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93ebd274840mr1499611185a.56.1791822536204;
        Mon, 12 Oct 2026 09:28:56 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c27146sm1411796d6.29.2026.10.12.09.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:28:55 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 12:28:30 -0400
Subject: [PATCH v4 18/18] btrfs: remove TRANS_JOIN_NOLOCK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-btrfs-remove-v1-space-cache-v4-18-f125bd8c07f9@columbia.edu>
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
In-Reply-To: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791822515; l=2612;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=rNSnaClTLXC84bceWmGxm4/sCU3gLiaNxuPCtIlu03c=;
 b=4cTdw4HBVw7J9+L5thY6Z9uDNbNrBmxqd0ZBRsbQSLC54r3FExkO43OpL6XV4JlW5A85Pi6Bn
 N8eO76WvcNjDyoThza8vYf38g5XnuUGMFO9LD0YKxzOOxurV+jtkizu
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: EJvQX3sknzKIzJNNtQIQsSEAjRREXRx8
X-Proofpoint-ORIG-GUID: EJvQX3sknzKIzJNNtQIQsSEAjRREXRx8
X-Authority-Analysis: v=2.4 cv=DrDDa2/+ c=1 sm=1 tr=0 ts=6acd0ac9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=mqiJWszMQxKhrdviAegA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX0sl+oWRvIy44
 moAv2NJ83lC3KK+IUO5bZZKKZ6d3GaCvJKAMX37sFVXy5GXPos9RKZ2WFkZRKbgOjLwrOlZNzCU
 7j4odvaCknkgJMPRDnd1N170JZAAbylKK8r2iHfmA8RPIgvzd/DyTKsXobdq5pOdHOde7tD7ouT
 hXXIMsEpfqPf/FFp4peGSebGeuNlsbL1hr6Bz3cIILJWSWKHx9ZcpldIjI3Db1uy1wV0Ec8JuHC
 VIRhhyydlecIHVZoN4LVWs3Pwq9HdMgX9KOG1AAT4p80hz5bE9yKcePe54/8OQeXfw0kWvUvQD3
 htM8fb4muRqxFnwPwRjUJgBZa73phvJlWKQKS2e+rxAs80pvVEO+g+UdDtSVDcMdXzXUxh2B2lr
 IY/JA5yP0R7yZQA7ttgQsW7gT4AbTtUF/zh7Tq+2pE/B4HlO0v6YU73uGJJRAfZhNK2/Xnwea4q
 d7seC7gtz3MbqDf40YA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX+gqiSYV57cZo
 07ft/A31oewMI5+Itx8UMLoUXF0Kn0oOby78yBz0VbRckQQ2l9bRZ1vPA3c9dOd8QujNZgBTeHP
 6CAGwwOUHgTfPdJtnxuX6NR4x7Y2s1wB6gJ/tvzfW0dwI/wbHSIx
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=10 phishscore=0 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120065

btrfs_join_transaction_spacecache() was the only user of
TRANS_JOIN_NOLOCK and is gone, so remove the join type, its entries in
the blocked types table, and the special cases in join_transaction() and
start_transaction().

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/transaction.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/fs/btrfs/transaction.c b/fs/btrfs/transaction.c
index 7431a06f168d..d265fac023e5 100644
--- a/fs/btrfs/transaction.c
+++ b/fs/btrfs/transaction.c
@@ -42,7 +42,6 @@ enum {
 	ENUM_BIT(TRANS_START),
 	ENUM_BIT(TRANS_ATTACH),
 	ENUM_BIT(TRANS_JOIN),
-	ENUM_BIT(TRANS_JOIN_NOLOCK),
 #ifdef CONFIG_BTRFS_FS_RUN_SANITY_TESTS
 	ENUM_BIT(TRANS_DUMMY),
 #endif
@@ -141,17 +140,14 @@ static const unsigned int btrfs_blocked_trans_types[TRANS_STATE_MAX] = {
 	[TRANS_STATE_UNBLOCKED]		= (TRANS_START |
 					   TRANS_ATTACH |
 					   TRANS_JOIN |
-					   TRANS_JOIN_NOLOCK |
 					   TRANS_JOIN_NOSTART),
 	[TRANS_STATE_SUPER_COMMITTED]	= (TRANS_START |
 					   TRANS_ATTACH |
 					   TRANS_JOIN |
-					   TRANS_JOIN_NOLOCK |
 					   TRANS_JOIN_NOSTART),
 	[TRANS_STATE_COMPLETED]		= (TRANS_START |
 					   TRANS_ATTACH |
 					   TRANS_JOIN |
-					   TRANS_JOIN_NOLOCK |
 					   TRANS_JOIN_NOSTART),
 };
 
@@ -342,12 +338,6 @@ static noinline int join_transaction(struct btrfs_fs_info *fs_info,
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
@@ -750,14 +740,8 @@ start_transaction(struct btrfs_root *root, unsigned int num_items,
 	/*
 	 * Only TRANS_START and TRANS_JOIN require sb intwrite lock.
 	 *
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
 	if (type & TRANS_SB_INTWRITER_MASK)
 		sb_start_intwrite(fs_info->sb);

-- 
2.39.5

