Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CC04ACC78
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828297; cv=none; b=SfCHMxAIn77qnt1ZfqGNOmNGFiGUNaBZyo9MTaiOv4MLbB+Yg1FwiUjO1tmXw/1RcH4ZApEgLjGAOZOJLTklo426F4EfcDVnDHj+DuPUe09d9Ss7hlAD2MOdqqjLf2RpCOK2bMNd2sZrcNQ+AUeHc7f5VRJdwrwoG3lpp1jJG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828297; c=relaxed/simple;
	bh=yMAE+axqhHNPEO0r3w89DgnUjCm4JVbOCv0EiFEtye8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RvbO1hFHfm+QLbBJ9QqE+TwkddD6mbJ5bM+yzGKTdP7fHyfQUjyJlxTTiPAVdwJ4mjuhIM5LgyLVKIwJPbtC7dyMNo1EeVyqG1EXaWJZOdrGeoAzQs1FKrKYaFbhDs4oyg/UY//O6J/cPgdhlqVG/gaWgnmdDbAlyYez4gb/v2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=S6fIleg0; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Kb03W59D; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="S6fIleg0";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Kb03W59D"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHgl3H948710
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=AEvXv8hXTQ/+FloKei3WHiBVPc
	CGjN1A74Vjs2aWpmI=; b=S6fIleg0TZK9er2lnRL01OlLuScvEy5mgxHB2196KD
	jg2XUVNnPEhl5gmrpHPgKscpL3uX4iNuwblre5lvsDVEJ6CYWOaVrKjyvOZI1Oj/
	8+zpS4N6AOTjJ6QXijAELE5ouH1c1VHmyct4buOxOa4dO6Zh/OXB8i+P2wh9io57
	+cIPEDxijoK3gpL6I8E7+80JMsqsxE+oOhexyHU0maMygSvarCsr5HD1TNGX1CD/
	WA9cmSMnNPMJsi14bbvHk1mDAM+02oBtBw6QD8Kdph/lyWySkWbtH3RWnaJkuMwv
	fxUpM1AcLaVClcvlimHzvT6cJyjHr8mSpfxUI9diVstw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h91x6sq4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:04:53 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a7c17166so43320436d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791828293; x=1792433093; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AEvXv8hXTQ/+FloKei3WHiBVPcCGjN1A74Vjs2aWpmI=;
        b=Kb03W59DpxuBaa6DZMQ8suXvGhy9zNjyIy4+nvnd2mcbIgLkt4m/SvpVDby0Jp2LvC
         fU2XDK37QZf2tNar0nokoMmDpwlDsPG6TLqWqKtr7xJtP78JBYDMNSXmsKgnfDhsd/N/
         Y3PJlLJhjXCD39WLNkPE5v2advo4VJg2ST+XmyWV4T7EzjfaXRSBhHQDK4AYUWRfBQzS
         D7mrNF4Ciew7WwKrkfCnUe4KcJMz1jWflmM6xyygpl3yFiE04RyvcJfZswpBzbmAyMbA
         Tq10qvgew+T6bD1uE0M31IVthG3f+fWb6B+fmh9sZTbQxbikxVn4uO9iFjyh3zs7AkrW
         XuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828293; x=1792433093;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AEvXv8hXTQ/+FloKei3WHiBVPcCGjN1A74Vjs2aWpmI=;
        b=aFV9W+r64UJWCWwO0JAT1UlJzXx3ykLwNpnoXeJSDFqBOLKC51B52QBlSyH/4r8UlB
         3E1yvhwWL1FcTx86bxlMA7fWALqr575NildJs9IKrHIP8tjmmBJerOpDxFuZStYOEzfX
         Bvy27+zEFojSAsSeCiV1SLwWkSyt2wqextxnNUDcJgOVZQWknrmE8OYwnmxLxmKFwvWR
         gWSp3njq/LgozPJirt49dVAS+gCXrUG3mnugYsHpii31f0CSnNSmzxvXlLCFbfYcF7s4
         tDtvP4vvr9RYeZxwiQiLg8Cc87eyhVv5PTkd9Jq9AOho3R+eYWoRB0Gt/S8hB0kXbKIo
         DmeA==
X-Forwarded-Encrypted: i=1; AKwUvBzAx6Qqm5LopZL+s7q0WkkoKMfruM6bcze/13Ea2YU2n9lG4x/g24kPXZgZB4i/J38I3adtXaS3ZtVPgrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa/AZPgpuMlcn5qji0gMTolYETGaIZckC13svfRE1bBcdC5PHI
	ie4uyAIuxLE3PZyLR+8RJalND0oFz+bgd2CyR564j+Bo2xUbqwq7byfY3WkMC3ZQFPeD6l+8j7h
	R4o1BU+1Ofwvupc6X6k7kqeocXdRZiRBRIvta4QKXHJjNFZuwHtGNmLzts+FuBA==
X-Gm-Gg: AYBFou0kDPdl/2HQv4rbhGA3QU66f3G+llRJYteDENQTPfqtyI8F3Mpp2ocOdLn4z7c
	IDloZszc5RFxtZygFGpAHLHpDfI4VhJ/CDZoaZH9Tl75FV6jOAWnziPvVKkgWwpJFGhKOZXW3XG
	QuA6pY0iRtcE2LAGelHro25rm+Ore79Qok0+i9DX65BYih096meySRh074ZArQUT0+RYkFKyGSW
	Wz6ThAOq8aTaQTelZwEd8jt2Zf5tDiRuQwPqv8EOeviGOqeUUP7XK1P6keKKjuNtwrhNMaudI5Q
	dTipCxtRB0jQqZRV+LfOTcT9+Zu1MuiBb5JtlmN2iNPk1GX5+4Qi1ZVTUi86jh+HdZXSrHz7i/h
	8171Cl7FVfEu4QA6Binh920mgmfvdzL40Be/Z3rXyT+ukuzk=
X-Received: by 2002:ad4:5ce4:0:b0:919:75be:48d3 with SMTP id 6a1803df08f44-91b554d02d7mr189784066d6.22.1791828292635;
        Mon, 12 Oct 2026 11:04:52 -0700 (PDT)
X-Received: by 2002:ad4:5ce4:0:b0:919:75be:48d3 with SMTP id 6a1803df08f44-91b554d02d7mr189783596d6.22.1791828292207;
        Mon, 12 Oct 2026 11:04:52 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm3692516d6.8.2026.10.12.11.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:04:51 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 14:04:37 -0400
Subject: [PATCH] ext4: complete dropbehind writeback in task context
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-ext4-dontcache-complete-in-task-v1-1-6ac801557041@columbia.edu>
X-B4-Tracking: v=1; b=H4sIADQhzWoC/yXNywrCMBCF4Vcps3YgSaOgryIu4mRq4yUpmakUS
 t/dqMsPDv9ZQbgmFjh1K1R+J0klN9hdBzSGfGNMsRmccQdzdB55UY+xZKVAIyOV1/RkbbOMGuS
 BrveG437orfXQKlPlIS2/h/Plb5mvdyb9ZmHbPgOeD5aDAAAA
X-Change-ID: 20260924-ext4-dontcache-complete-in-task-2340ed5f3114
To: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
        Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>,
        Ojaswin Mujoo <ojaswin@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Zhang Yi <yi.zhang@huawei.com>,
        Taotao Chen <chentaotao@didiglobal.com>,
        Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791828290; l=2877;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=yMAE+axqhHNPEO0r3w89DgnUjCm4JVbOCv0EiFEtye8=;
 b=bSPBAdCA4pOYUnbb2s2+Pl3dJXOOEl2JBL0fOAF3bJjYAKXsfNyL9k52aP27evamE1F5FeWEb
 ucPomjMlHUqDUISMb0rMuckpSWkyRLDAgU31Qq52IJedOfg0Z/NVgM7
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: G5dJ3RXKoPHuTqBdKGXqoBCWdZTNeUqm
X-Proofpoint-ORIG-GUID: G5dJ3RXKoPHuTqBdKGXqoBCWdZTNeUqm
X-Authority-Analysis: v=2.4 cv=DrDDa2/+ c=1 sm=1 tr=0 ts=6acd2145 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=fU5PloRAk5hQnq9Bk-MA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MSBTYWx0ZWRfX1pnLF8NlNKJP
 XUmLwdDIZDtph/2KfYmSsOvpr362/GCXZMFuFyOyAejTFtw4hoHGy80i1BWQJRibqFFgQ+MCUf5
 gFT3MjFivbtboLeuN8RGx94nAyZbxaSoZOrhv7XvUcV7ffS93dzcMtiS8JsHVOK44oCoOR8UWOF
 cXcIVq8CBZR3EXtsooOGaDmbjHgfDWqFsxmIOwCWmhdWHyGb8dMm/jJD6hZvYgA8bBPTbVpPhf2
 1LurYm/LvnNoTF6YGSbBTjYV3IqZKckI4nJqaRtQdc6qZEj87GPU9p+o+UDncY7NSAFP+425x8P
 c3uNFXvjdsUSEgTw7c0qUscP0i5SLKbuFvqdlBByFziGY3/mFcpja3IacU+hRa6bcq47UtfLaTJ
 lsgGgPlxLfcQNUHvy0FJx2l2E9D4NZVEmje2ZcYWfSmcKbhzsvmPxXEHg75Jm62apjhsWrDRJDJ
 O1eqdqUQlX6XWZT8HYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MSBTYWx0ZWRfX0JSambSau4wr
 zef6ys61GKyYmoOBqUjpxntMmRGeu0tKzmxrh8m67Kn2g68o9o4mQv9Pn9OiL4u2J61DSdlyqtU
 PPjkbn0aWazlV5gw4JGeSc2dz5dZAWJt+gruEMeX68EQ5hZ5r2X7
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=10 phishscore=0 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120071

ext4_end_bio() ends writeback directly from bio completion, which
usually runs in interrupt context, unless the io_end has unwritten
extents to convert and is completed from ext4's workqueue.
folio_end_dropbehind() only invalidates the folios of an RWF_DONTCACHE
write when it runs in task context, and silently skips them otherwise.
So on ext4, dontcache writes that overwrite blocks that are already
written, or that allocate blocks without unwritten extents, leave their
folios in the page cache. Dropping them was best effort so far, as there
was no way to get task context from bio completion.

Use the task-context bio completion infrastructure instead: set
BIO_COMPLETE_IN_TASK on bios that carry dropbehind folios in
io_submit_add_bh(), so that bio_endio() runs their completion from a
worker. ext4's iomap buffered I/O path already gets this from iomap, so
only the buffer_head based writeback is affected. Skip the flag when the
io_end already has unwritten extents, as ext4 then defers the completion
itself. A later extent can still make the io_end unwritten after an
earlier bio was built. That bio's completion is then deferred twice,
which is not optimal, but harmless.

This changes behavior only for bios that carry dropbehind folios: their
completion now runs from a worker instead of in interrupt context.

On the unpatched kernel a dontcache overwrite of already-written blocks,
or a dontcache write into a new file on a dioread_lock mount, leaves
every folio in the page cache (16384/16384 for a 64M file). With the
patch, none remain in the page cache. A dontcache write into a new file
with unwritten extents already drops its folios on both kernels, as
expected, and a plain write keeps them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ext4/page-io.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 734d856a6d47..e556598ce9e1 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -458,6 +458,16 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
 		io_submit_init_bio(io, inode, folio, bh);
 	if (!bio_add_folio(io->io_bio, folio, bh->b_size, bh_offset(bh)))
 		goto submit_and_retry;
+
+	/*
+	 * Dropbehind folios can only be invalidated in task context. An
+	 * io_end with unwritten extents is completed from ext4's workqueue
+	 * anyway, so only ask the block layer to defer the others.
+	 */
+	if (folio_test_dropbehind(folio) &&
+	    !(io->io_end->flag & EXT4_IO_END_UNWRITTEN))
+		bio_set_flag(io->io_bio, BIO_COMPLETE_IN_TASK);
+
 	wbc_account_cgroup_owner(io->io_wbc, folio, bh->b_size);
 	io->io_next_block++;
 }

---
base-commit: 35aefefd7aba0801bab635b11943f932626be3b2
change-id: 20260924-ext4-dontcache-complete-in-task-2340ed5f3114

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

