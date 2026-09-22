Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D642456B872
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098920; cv=none; b=XlmXtyN47h7xB4UfpY5QBytsmB1XsxDDMS9DtU5xEUXHRUO8BQBYkdzGgJXWVU0vg1wWC9bELaIFOGmMd9n4mAz6lKY1Fhvg6Q49enB6V6EG8EdAyIBIoHNNCwbYROZdMSdHF3Px5DbV//2BNpQ+QETb3omMTxnw90BBM2VAebo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098920; c=relaxed/simple;
	bh=YbQWCoLbJ2TBrHcsvoDcg8EEVw/4pDqVEBIsrTk1cBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u9IDouFVer9RnUjg+awZNGa5GiEviR0BRTj2ggXiFLGQAETk5aXJBpE8S5x3Uho8WurkoT9KhyXWgaPBBtVksgBYClTaXsPvucOx3nUZwnnHpUThgCpv/+lsVoIScPOVYonEzd0ueMIQACXiBm8hUykU2n9NVtKMtJRnzKNOssE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrUvrx3m; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrUvrx3m"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144df39b6cfso75238c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790098918; x=1790703718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KpXDs9omfosdMoHljEwPZp4DRs9tPWpEJWp4t5OaeUo=;
        b=KrUvrx3mS1t0oBKVtGl64s3X1+iAfRpO3LCWQRrQFc4X+Bi3kaHAsKBDPt55UGQ+oL
         cw+B9+OK22Tzy7U1CHVToemknfM9l+PhNfohtBcWFy2q/vGCB1a01jNLWB1Vru/AMvyM
         ZZ1KWgJw4tt07YCyBoVIneSEem7E+DJxGPjPwId69pXZzBA/S1YLRiSv4kwYwjlqYPzo
         oG1+Wqto6gvEZNf8cdj5pyrGuMApMawrioYpweEEa+eCENFJz4hwyrM6BnXgHiCdKs9S
         xslRKD8QXeos0G2IjD5d1DdEkQ9VAqtRy6w9Uaw8dLHBXTfK2mwlQAbkFxkx9L45QoLy
         i5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098918; x=1790703718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpXDs9omfosdMoHljEwPZp4DRs9tPWpEJWp4t5OaeUo=;
        b=NwkJTNmEvtPrNAMXcr3jldzjfxgg2kEVN6s1jnD0Jiju1VmA10MlHJr84Q56O85Ke7
         aSFDxcKMCb5RrbtYcR6U3I07f68368PduZyIGB/SubOpVhDeC7h2BjuQd491LNMDzyCX
         fVEjk+fWuxY7BCR8THYxANhAjBDXo/DJ8f2WA4Lasx5vYyq0dybrSh5Bi+i8t6zyAa05
         /x8V30P2GIasLd2osqg58O7qDlB/2NsqY87OkI3rNxSabgV6hlM53Ki0xXVTnTrGxRYd
         bbI3n6tZas8mvn9bW0YZ4HwYoMF8TNecZgtDPr3eZKAUV/wv4mwrTViEK2QQM79PrHh4
         j/eA==
X-Forwarded-Encrypted: i=1; AKwUvBxVXFVTy4yTqOrV9t1TewVaquazEBqGWaLTx3gjoL5Xw/B6O2GSMUBbeYOkn3GzL/gYG6RrNsmtXc2HnuU=@vger.kernel.org
X-Gm-Message-State: AFuF++kae2ket4YtQD2Lg2J2Gpz1VzrscbBIZRmEDwSWfS087lffAtal
	OmqWRJmdfddzHrPUM0zAao0dytPginZcZ1zeNVUgE1JRR8LNHAl5QuT0AFYkgBr5
X-Gm-Gg: AYBFou1jytm4nhEGbRQObLCUiCPb7huZf4RIMuTl8XpwiKPHaoWDptvQCEpKnUu3Yxf
	KmD4q88KRz10+MKFtE5H2N4Ayj4kt0R9MFQAX8FQnP6tAF3RgylnEj7orH8QboewcVKtVXW8ZAP
	JvPbJ4FcKOAI2pzkh3cUMO0Z4X3YYBwAZW9texOd2fVqeCmDUCOLxIhEvTnLO/eJaB/YsSFLaRR
	SBbftydEueuxm/3B4DcgE7xRxjJ7xBFB3plpnauwF1CCK6BZGcf722D2BEH2M+Ry1SYymEKJ+fS
	AyapNrlj9Ra5mNA6QsLNkfvDKkwGMdgQm+rTLS6oAg+TV83bIeXYHxO3LKY9H0vo6WRwnXbIY2z
	Ene5cs7ttcCLE8WGUvyFkmxX01c2VCb1GT0Y+1XkRtmCS0NjzkJ6Nbnquby1yM7fFGDf7mUA78h
	bFdcTlcQTbDbNruRlEODke6ozBOJX/nm8673VVIu2eqgueCU4Vp1FnJBtc1SZ4/L4p4Iw4TJh7J
	Do24qtT8CELyubvydnsFA==
X-Received: by 2002:a05:7022:29c:10b0:143:26ee:4203 with SMTP id a92af1059eb24-144f91547bamr91844c88.30.1790098917567;
        Tue, 22 Sep 2026 10:41:57 -0700 (PDT)
Received: from FredPC ([2600:382:8d06:9b8b:d94d:e185:fcc4:f1c4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9040420sm110074c88.15.2026.09.22.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:41:57 -0700 (PDT)
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fredric Cover <fredric.cover.lkernel@gmail.com>
Subject: [PATCH] smb: client: use GFP_KERNEL in get_targets()
Date: Tue, 22 Sep 2026 10:37:59 -0700
Message-ID: <20260922173759.67445-1-fredric.cover.lkernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, get_targets() uses GFP_ATOMIC to allocate the cache target
iterator and to duplicate t->name. The callers of get_targets() are
in a sleepable context; therefore, switch to GFP_KERNEL to reduce
risk of failure and reduce pressure on emergency pools in low-memory
scenarios.

Signed-off-by: Fredric Cover <fredric.cover.lkernel@gmail.com>
---
 fs/smb/client/dfs_cache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/dfs_cache.c b/fs/smb/client/dfs_cache.c
index f6c4259479c5..f727fb261331 100644
--- a/fs/smb/client/dfs_cache.c
+++ b/fs/smb/client/dfs_cache.c
@@ -798,13 +798,13 @@ static int get_targets(struct cache_entry *ce, struct dfs_cache_tgt_list *tl)
 	INIT_LIST_HEAD(head);
 
 	list_for_each_entry(t, &ce->tlist, list) {
-		it = kzalloc_obj(*it, GFP_ATOMIC);
+		it = kzalloc_obj(*it, GFP_KERNEL);
 		if (!it) {
 			rc = -ENOMEM;
 			goto err_free_it;
 		}
 
-		it->it_name = kstrdup(t->name, GFP_ATOMIC);
+		it->it_name = kstrdup(t->name, GFP_KERNEL);
 		if (!it->it_name) {
 			kfree(it);
 			rc = -ENOMEM;
-- 
2.53.0

