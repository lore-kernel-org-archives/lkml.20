Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C2035F5E5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075423; cv=none; b=gYFShgtuPkxHjVFSdH5peMuTjKKoxoxspYe3jqxvdVGV6E1KL/Bh6VX7WAXtKPNqKjYJxS8bDdpfQbmw5knWtVHWTD/phsrej9qy6sGyBHWWwL+H1OJmCECFdNgbbu/vxKd7EeOP3ZUx25Pc3DX5Fmx2j3gXWUQ2DSG17LYvpkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075423; c=relaxed/simple;
	bh=FNL3pqb5oRavQZB5jolcB6p6ETy9y4EQsUqUJBYrM24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+5xrQ4Jrh42rF/OjtOpcogTnLJY9r92YkI8Cw62EHKW0cTt20pr4tT7VujSzx6bRbFqOYTIm1B5lWAy6L9OYi2qYkRSZTW2AqXglgJZ6+J8v4tL4UwL1C+Qjeg4gLoy0aJM+48ICk6+2Vypb09DPrwJXhnr/dCgAaIn8zeof24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=oCWIbQmS; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=3tUbb83A; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="oCWIbQmS";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="3tUbb83A"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEY8mn854702
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=+w/4
	3zQJVGFpJlES+uyIlRWVtjSFTbm88i4qyzkgrz0=; b=oCWIbQmSPN0cNh5Z7ctl
	EH1bNKxoL2ZguiPLLJS30DT3tL/KcOrKppETZ9ov/fKz6rs2M2LiGXbqJR8HLZhV
	jj2seMotHjjt2SRgD07rD8mlob6FDcrvjYJK0fIlG6e/6QNr8Z1uqXqeEMuEc+Xh
	MGe6Z6xW1Oax8eLQe+Lzsb/by95GKNJAM47IV7qyC02Astz/JMtVciKt4Tz3j+37
	ZhCBGOVBHPclzWhp6Vdod6CoBDHSDfHNY3WAyLlO94Hj+2fA27ZU5hglgPdEhWUv
	9Gd+wbKFy6+YvE5OuxdoVtlkDyX2lsmV/f3jAXm8V+1l9ZSPrrhmH8gzxresekny
	XQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hatthjcb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:40 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso13099885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792075420; x=1792680220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+w/43zQJVGFpJlES+uyIlRWVtjSFTbm88i4qyzkgrz0=;
        b=3tUbb83AbfvhoIirXtgG/TZDsynoWFTTJkbajSg6jZ01g1wHtLsYCZ2BB1v726sFbd
         73iWjHYNlNrJTgt95pFZNPvMBRJqMgoWWJIXsz/M8mZsuhhukyyOVWTnrV7TryY5P7yI
         V1ZHdkZgfEzNjeUqXiBbGYMrOZaL0B8SkKuCdYC3o/HjywpkcA7144jMtiHZwvJGGPWv
         Qf3+kC4XXObjy/97733b703BC6ueBZLMftoyFCPg5gAorjhGZTnGoE+wfpMsA/InMBpI
         MwGpkobbTQ6lVOrwOzWSIV3zikJnDr2vWHPU58A6bryUjAkXY68q4Z31NeoWBCKsnwnJ
         VOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075420; x=1792680220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w/43zQJVGFpJlES+uyIlRWVtjSFTbm88i4qyzkgrz0=;
        b=zEpMexfXv4r2C4i/XdAApPuh51UrCv2Wj2Vx3WmDxvQ2t165ZB6jWdYYpaFXtQzrhV
         ZdNb3k+0Ea2hdkDvRvSsuD+L0U9Ridkis61rmM70f0emB2m2KUW/4z99hKdLBS2Vse6C
         gv6mSo+i8PzW82zHry3Oqw2JNrO9+hKqD3nynCL4Ei3XyiyQkHQ5gxDb2ZFGCai6m55W
         8T08mXWoGQ7scU+0qcT+dN7ag7bJ1+u5K25bfir0hzp5EDRomQcuOnqpaziZ+OMHSj64
         zJ3lxt3xgAQXopBIL6RCWUBhvQt7ihrAHdN//QvvqnOMK3TKcTF7RvgigPPgYv1Jvb0q
         cuvg==
X-Forwarded-Encrypted: i=1; AKwUvBwXw9gjN7JYfW+K/tn2um9D5ipDZUSrTOIPo46Xl9E5bS4GnUSWAzZ4RcOKkaKiGf8jwwYMiJ+eAvSH+sY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJm4Fsy8CPaf1ZVoTgRdj3g6tWAekoZenWQC0+71BBKWiwNiLLj
	f7xtsO8qoHAkwGcxi4LGYaDRPSPuxt7FIQrTNVh+ZuOFKXBxGpW7faQjF6OGe6WWrrP6py5XTbb
	cwfU3j2PxzRiQ0t90DCtTOnXxxkgC3VH/QxFrDifffTWmxJTGklA+hcyoRWcs/A==
X-Gm-Gg: AYBFou3J4M3E80RUyAaXJQ7B+Ez4vvkLpsJeCSCWnlEuXdfYaOj1BkMuVZHhOGzobD1
	ssVCgTnCuduf7aLvDlcu15FWZAt7BqHTOqMNZcf5Dl8VwqGHW/yBDAtVySxT/S6QEUiUQen4RTE
	nyQZ1J+X5dGmuil5ODeQra6YbROVeDe/3rTLmsXpbgGf69NmaLk1onywGVvT9MwctZj3opAI3tR
	iIQWxjdsgRfjLWXDELbwSKkzqXzZ6d089FgPsZ+IKpwIOsydHwY55vo+WYj90Clz2GAa6j891Xn
	lE9aIOHty+JJ4ibmy4Tvsypx8xxQuDVzcJWfltMmIpMRnB3NxwX7UkVThfiqBShz4J5vumRzdlZ
	MWLoeyGyU8spyMGfJPSLEGrQhc0uXRyWhHvt2hMyYdJ6R
X-Received: by 2002:a05:620a:439f:b0:93c:b895:6109 with SMTP id af79cd13be357-93f17ec6971mr44588385a.9.1792075419690;
        Thu, 15 Oct 2026 07:43:39 -0700 (PDT)
X-Received: by 2002:a05:620a:439f:b0:93c:b895:6109 with SMTP id af79cd13be357-93f17ec6971mr44582785a.9.1792075419175;
        Thu, 15 Oct 2026 07:43:39 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b5f323sm83026476d6.20.2026.10.15.07.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:43:38 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 15 Oct 2026 10:43:21 -0400
Subject: [PATCH v5 08/19] btrfs: drop the transaction handle from the
 prealloc helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-btrfs-remove-v1-space-cache-v5-8-6b31347d9998@columbia.edu>
References: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
In-Reply-To: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075404; l=4684;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=FNL3pqb5oRavQZB5jolcB6p6ETy9y4EQsUqUJBYrM24=;
 b=o2VbuweaWK3dGwL8LyJvHBx6AVQ8cELv+KB6nBCGrqwLaIeZvaUlahDxH/NUvZ3XPaJjuuXoA
 SeMk0J5s0SbCIr8FD51zcVt3F1l1iQU3i+1Nwj9CM0/T9FlCqPt/Ewz
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: lWjhg32lDz6Vq2JYuulV6rQUrxQL8zzb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX+ot2WAdtXMJj
 uyH0h0MipSQSA4JGF0onZDXTQjsXTpiiuYsnIA5qIOuUWPiN3050r4zjA5aje2QSZOI/WkAHM6g
 yONYPrxqd0F5x2loEVlZKaJx2uttRE2Bx5RAer/je419t6xlkDjj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX9RWi4qimws6z
 rxvY45WjeWaT6SH41Df0VLhJ9ERMaMTrwlB78FrL4ud6Hp34tZJTgD9GyW4Kfkzr+rMXKhoz+xl
 gBnzkTJQcMqh0MCv+cRangzY70B4iOVGw4xrLJwaPMXKCwlZq96Z6TVWNVmAmYZyLcz3//Bn3N1
 MOTEvgVCMycyupTwFeMw8JutAamFuj49jxIWADPP6lNxPCJlzedJ7CiN2Kqb9RnhAfvdwnsrlW1
 NCmOCiphfSBWZxWuETfJIPsiTXukVbgQWQH+0RHMK8ruCcD15W77msCdQHIbJA92H8E7l5J21bx
 8GwUsqhsG9OI/AFQg+3BsAjLmWi7+BXxidSQ4Bn3T72eAs4vgz0QeyPeBv1l2stMk8F0g2oNDPL
 QjlO9T48HF1Pwr3T6Evch4zQq4usPZW9IDC0D1TOSVIDouRyjHuUl5gHP+ixL9eOPvLpyFw6GUu
 mB2qwldRiH7orNWW3dg==
X-Authority-Analysis: v=2.4 cv=WJvqzXsR c=1 sm=1 tr=0 ts=6ad0e69c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=u1qPvHribVpbYRjuRIMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: lWjhg32lDz6Vq2JYuulV6rQUrxQL8zzb
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=10 lowpriorityscore=10
 bulkscore=10 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150057

The v1 space cache created its inode during the transaction commit, and
btrfs_prealloc_file_range_trans() existed so that preallocation could
reuse the open handle. It was the only caller passing a transaction, so
__btrfs_prealloc_file_range() and insert_prealloc_file_extent() now
always start their own. Fold the wrapper into
btrfs_prealloc_file_range() and drop the parameter.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/inode.c | 47 ++++++++++-------------------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 4ffbf2a9dfbc..95ec6026f08b 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -9158,14 +9158,13 @@ static int btrfs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 }
 
 static struct btrfs_trans_handle *insert_prealloc_file_extent(
-				       struct btrfs_trans_handle *trans_in,
 				       struct btrfs_inode *inode,
 				       struct btrfs_key *ins,
 				       u64 file_offset)
 {
 	struct btrfs_file_extent_item stack_fi;
 	struct btrfs_replace_extent_info extent_info;
-	struct btrfs_trans_handle *trans = trans_in;
+	struct btrfs_trans_handle *trans;
 	struct btrfs_path *path;
 	u64 start = ins->objectid;
 	u64 len = ins->offset;
@@ -9186,15 +9185,6 @@ static struct btrfs_trans_handle *insert_prealloc_file_extent(
 	if (ret < 0)
 		return ERR_PTR(ret);
 
-	if (trans) {
-		ret = insert_reserved_file_extent(trans, inode,
-						  file_offset, &stack_fi,
-						  true, qgroup_released);
-		if (ret)
-			goto free_qgroup;
-		return trans;
-	}
-
 	extent_info.disk_offset = start;
 	extent_info.disk_len = len;
 	extent_info.data_offset = 0;
@@ -9234,12 +9224,12 @@ static struct btrfs_trans_handle *insert_prealloc_file_extent(
 	return ERR_PTR(ret);
 }
 
-static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
-				       u64 start, u64 num_bytes, u64 min_size,
-				       loff_t actual_len, u64 *alloc_hint,
-				       struct btrfs_trans_handle *trans)
+int btrfs_prealloc_file_range(struct inode *inode, int mode,
+			      u64 start, u64 num_bytes, u64 min_size,
+			      loff_t actual_len, u64 *alloc_hint)
 {
 	struct btrfs_fs_info *fs_info = inode_to_fs_info(inode);
+	struct btrfs_trans_handle *trans;
 	struct extent_map *em;
 	struct btrfs_root *root = BTRFS_I(inode)->root;
 	struct btrfs_key ins;
@@ -9249,11 +9239,8 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 	u64 cur_bytes;
 	u64 last_alloc = (u64)-1;
 	int ret = 0;
-	bool own_trans = true;
 	u64 end = start + num_bytes - 1;
 
-	if (trans)
-		own_trans = false;
 	while (num_bytes > 0) {
 		cur_bytes = min_t(u64, num_bytes, SZ_256M);
 		cur_bytes = max(cur_bytes, min_size);
@@ -9279,8 +9266,8 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 		clear_offset += ins.offset;
 
 		last_alloc = ins.offset;
-		trans = insert_prealloc_file_extent(trans, BTRFS_I(inode),
-						    &ins, cur_offset);
+		trans = insert_prealloc_file_extent(BTRFS_I(inode), &ins,
+						    cur_offset);
 		/*
 		 * Now that we inserted the prealloc extent we can finally
 		 * decrement the number of reservations in the block group.
@@ -9352,8 +9339,7 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 					range_start, range_end - range_start);
 			if (ret) {
 				btrfs_abort_transaction(trans, ret);
-				if (own_trans)
-					btrfs_end_transaction(trans);
+				btrfs_end_transaction(trans);
 				break;
 			}
 
@@ -9365,15 +9351,11 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 
 		if (unlikely(ret)) {
 			btrfs_abort_transaction(trans, ret);
-			if (own_trans)
-				btrfs_end_transaction(trans);
+			btrfs_end_transaction(trans);
 			break;
 		}
 
-		if (own_trans) {
-			btrfs_end_transaction(trans);
-			trans = NULL;
-		}
+		btrfs_end_transaction(trans);
 	}
 	if (clear_offset < end)
 		btrfs_free_reserved_data_space(BTRFS_I(inode), NULL, clear_offset,
@@ -9381,15 +9363,6 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 	return ret;
 }
 
-int btrfs_prealloc_file_range(struct inode *inode, int mode,
-			      u64 start, u64 num_bytes, u64 min_size,
-			      loff_t actual_len, u64 *alloc_hint)
-{
-	return __btrfs_prealloc_file_range(inode, mode, start, num_bytes,
-					   min_size, actual_len, alloc_hint,
-					   NULL);
-}
-
 /*
  * NOTE: in case you are adding MAY_EXEC check for directories:
  * we are marking them with IOP_FASTPERM_MAY_EXEC, allowing path lookup to

-- 
2.39.5

