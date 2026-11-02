Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604958;
	b=gVEOPdksQYtJWB2WuiafLgqr6t5IRQcMeRO5QNiT9/umaiXV3P71wKCtZnHlw0GK8RF5
	 ZIHr5gbV75hDkocVxjsuAroMbF75Ly5lSGyCvmWlQg5KTDVC1d/Fy56KlTKEPoIBPVuGi
	 hOgz6m9xXmLOq+v+kFawYPOQKZ+QAa78nRNFlNeOSlOndxkBAIcAp+UTIFv1BGbIh75/C
	 0QIcQxkgSLoF0ur04ABa9lbVzyFiZmLHgZ5eCRuysXUJfndqdPwEprjd9ReHiXiayUXBi
	 qhaIERzT1Vj0fsSQKcJFQt2D/esxlbc/510/B4KcPYZGMluIV8efJb42oE0sKvWs1sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604958;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=dTAaKlPxU5WePE907iKvk3OXzhhcGecw4fUvyc2tOBs=;
	b=Sk13Lvrd4yu/sMgv8GGCw8YHbIhaJiuqStCPGHyq8qYfi+nhkK1rXpUCFdPvRUDZHY5v
	 vCQhC7OSrqHR+hRpj4wHH1Kax+omrIW79/ZxGtqjfEPKPElbGd0STMkQwybNpCWC9s9yQ
	 kkNvj3Qnw0ageWGO+5j45Ec/aZDhSGRtwEOPniDsREkF1ss/4tjw0TkhB+dbP1+umQ6J5
	 0PQyT0cnKQCymJUaEi4rp4qYUbpmyBaG2zSO5n34UdtiLQ/pUg0EKv88iu5N2E5F7j4tl
	 anECvii+MUXiJhCpmvEMeQ+HOIrTRtXtDOhRM/LBTIZmobATOUr+zGnbg51y9NoOT/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SxT96+27;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A0C60A260E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A0C60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SxT96+27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=dT
	AaKlPxU5WePE907iKvk3OXzhhcGecw4fUvyc2tOBs=; b=SxT96+27XfnI3Stsfe
	V/9qzgsP3DBVNFyxRpShvAEwX2fPUIBkhJKOqdFL8ernh077xeJauUoUPl/UN9G1
	qaM1zn5boKjJKuKYPoU4EIU+8CAT1J8au7FHlENX/P2yqPI+i1kyLSSO+/drhQKk
	KlzjmM+/qfzZKIWir5SyYAesg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3f5hGPehqi52fEw--.9836S3;
	Mon, 02 Nov 2026 15:35:36 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v5 01/31] ntfs: propagate mapping-pairs update errors from inode writeback
Date: Mon,  2 Nov 2026 15:35:02 +0800
Message-Id: <20261102073532.98873-2-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102073532.98873-1-wangxuewen_ky@163.com>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3f5hGPehqi52fEw--.9836S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3Aw4ruF48GFW3uF15Arb_yoWfuFc_Ka
	4fJw4kKw1UXwn5Kan7uF95AF4jva1vgr1UJr48tF1UJ34DAws8CrZFyr43Xa17WFWUXF98
	Ar1fKF1fJr43ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb-zVUUUUUU==
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQg2H2roPUj5qwAA3J

From: Xuewen Wang <wangxuewen@kylinos.cn>

__ntfs_write_inode() overwrites a failed mapping-pairs update with the
result of syncing standard information. fsync() can then report success
while the mapping pairs remain dirty.

Check the update result after releasing the runlist lock and take the
existing error path. Preserve the errno and retry handling for ENOMEM.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 206db4e99ef1..52e22022b4e7 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2940,6 +2940,8 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 		if (!err)
 			NInoClearRunlistDirty(ni);
 		up_write(&ni->runlist.lock);
+		if (err)
+			goto unm_err_out;
 	}
 
 	err = ntfs_inode_sync_standard_information(vi, m);

