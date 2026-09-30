Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56060371CF8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740134; cv=none; b=LGnxBntx6f1DO6x0IHNp2PxtWGiC+sDCokMpukFJz7Z43ZfRB7PgtournLZEShqzUDAMaZlKmzrloXGryjrDVnFBIF73KAlS5l+QJ//OvRJD5CwdhKEwn/a1HBNGXQOsMBOD8rhw9mDYAPt3stAiet3U4q62HTmnCTtl7HHIGN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740134; c=relaxed/simple;
	bh=WRPywmVYQO0VtIPWxm29CrmFWUlUwbhwwdpQgzpRPMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CzVEzfT3XZa2CrleSeUS0sVtqY/gXk2MuavQ18cgRhtwdBw79RTwLPP0hN4muHXlJIEhK9wBwiL8609CeTgomtXCPUt97TWcybzMoLgcg+eGS9Mn5LQjAJG2Rd4/7aWjeOkso8h88h/eh4jF5d/boN0g7AEQVNGcWUjlvT5zXVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+FHf5Ba; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+FHf5Ba"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so41254765ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790740129; x=1791344929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufLJ+ytiFqLa5W5DPoK5dh+B3PH/RjJJE+Ibm3U4zmw=;
        b=Y+FHf5BaUs1c6cQUa/rBxKi5NC4vDtE1+Rfju4XuKbcJhpZCWU9oCsA89ZJOzFqFAC
         Ah5yAxXakCuD1NVwFQ+9x12Obl1LTQT1e3xtEnFJUqxZeeyYDM1X/7UdJ5CNGTS2tSzS
         Ao36KlZZ25m3YDg00SuPEpXTUMx5mDt7tGkse1YKyj9aUb27eUgBOFfHBtW6JyWmDVoc
         9fsxJyCtL9g3B4XEGHcwkaBKg/h39tpXBzVC+h1ZdKROsyp+9+zSrDI01ahoPAyGBBk8
         MNBViI1l804eX2y8iwzypLM8uEXynEBTsaulnQCDBHlxL4VeTAXRLTcKxo2RVglXYLkZ
         Hg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790740129; x=1791344929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ufLJ+ytiFqLa5W5DPoK5dh+B3PH/RjJJE+Ibm3U4zmw=;
        b=TPaHnmlcRjyn+N7XExKmhISkCYWX1eCl2V97mABSqCmRM3mkOeHbcl7MhxG204kiSA
         jrQfwGwkXIUzZHDr1PBlz1GZl8TdNBtjf261xjzqUHAP0uDvmdzUYFEEBoTpdYnL48Zy
         vTN+lTAZQU+Xr3GYfMmJTlJAvnrzCHYB8CZetI2x7SjPZ18BXp+uYTIda8M4lXYzxdqL
         mvZygIOTmj4SaKQorjpnoto3JjTydUTjBTX9WLRX4Mxx4n7ToxgEn0/y3vMNXmyu9H2c
         OBjkaULb/7XHbfucA8jKmb0xgOJaDabCIyYSj4YxcM33OrkFuHB1jkVhfk1jIyGgCf6q
         C8XQ==
X-Forwarded-Encrypted: i=1; AKwUvBydFhcF1pPHFGjPJaaFKbvP3vopKDsvaMIkEQM5l7jL4Y/iOWiGUmTIz04WCwGE54cdcycjt5KZU2uHEag=@vger.kernel.org
X-Gm-Message-State: AFq9FYIufzFfcf90RGHGDaAroGGoliBmqxUPeTlleXOLXD8EfJHPknOD
	ZDrWQ6SOOsWMGeysEO8IDsUg1AKfilEXt4/Pa2mLJxe+BKrb3q/r0cxy
X-Gm-Gg: AYBFou3J6de1060F8Wkzusj8XZvT33F4wZuso45I75VvFfbpQsa+qsU5zExO1OLUDsf
	Reia4gWE605e6tktB6bpjMXcNQ94Td33jBhGkbGgNRVp924dujGhqGBZx42ZSHuGFUfCKvdQrx2
	zl0z//NanDJi2qCfPK3OZ7930wKLSknlm1ZXlDzx0jlpA1Q6m9yqemRZXOEA5VGiI4CjLOvdjnq
	/wS6CsemDKLtGu8dDMYX5cUcd/QLuerFb6/zxfvnIgKgDF9xGeiWluI0xmV6LYBKdZTisCuhSYk
	cD25qkyRfeKAiEOmGXXnMHqz9WVRdTGxH8OmT9NKb16O/RYNgQzNJl0zHlBuobPyM+KZTsQqcmN
	4unnDnBVh4ayRSVEEoLh/mwSpptSkL/6seQers5ura0Atr4m1YPQhoKV4mO0oZcf7r9zpYMptdV
	URvCxK4F/UfffPJY/hAig8lmmkekH8QUAJYsiL3NHV8OB/o0goCSDbwfcAxnwtgMpRiVMfGSNkQ
	8y/rGsRjQbD9TKMMPnCCnxRZWhCPPlY5kwOTqp7T+RJPWRVEC6mkwNNh+3Y7JZrEkNbk6llCjnF
	w5B7fJ/UQfohlwxu7LTxWNw10V2X/pceb0WouVjJFqfnw0S5ZyT8MXw08vE=
X-Received: by 2002:a17:902:c94e:b0:2df:991b:4368 with SMTP id d9443c01a7336-2e2e4a24f0amr1533905ad.53.1790740129442;
        Tue, 29 Sep 2026 20:48:49 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd86f3ddsm3760005ad.68.2026.09.29.20.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:48:48 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] ntfs: fail the mount when $MFT's data size exceeds its allocation
Date: Wed, 30 Sep 2026 11:48:34 +0800
Message-ID: <07983b377d36748124fd5b06012b67ea02a0f642.1790684177.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790684177.git.matthias.goergens@gmail.com>
References: <cover.1790684177.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_read_inode_mount() takes $MFT's i_size from data_size without
checking it against allocated_size, unlike the resident case in
ntfs_read_locked_inode().  mft records between the two are not on disk.

On a crafted volume with 512-byte clusters whose $MFT is cut to 4
clusters while data_size still says 27 records, reading the folio
holding records 0-3 finds the end of the runlist at vcn 4.  An unpatched
kernel hangs there on the folio lock, as in "ntfs: fail the mount when
$MFT needs its own extent records".  With the previous patch vcn 4-7 are
past the allocation and so read as a hole: records 2 and 3 come back as
zeros and the mount carries on until check_mft_mirror() finds the zeroed
record 2.

Refuse such a $MFT before anything is read through it.  The mount now
fails with:

  ntfs: (device vda): ntfs_read_inode_mount(): $MFT data size 27648
    exceeds its allocated size 2048. $MFT is corrupt. Run chkdsk.

fs/ntfs3 rejects any non-resident attribute whose data_size exceeds its
allocated size.  This patch checks only $MFT; the next one covers the
other non-resident attributes.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/inode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index a61f1519549cb..9c97fc3f9e5ff 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2136,6 +2136,16 @@ int ntfs_read_inode_mount(struct inode *vi)
 			vi->i_size = le64_to_cpu(a->data.non_resident.data_size);
 			ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 			ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
+			/*
+			 * Records between allocated_size and data_size are not
+			 * on disk, and would be read as zeros.
+			 */
+			if (vi->i_size > ni->allocated_size) {
+				ntfs_error(sb,
+					   "$MFT data size %lld exceeds its allocated size %lld. $MFT is corrupt. Run chkdsk.",
+					   vi->i_size, ni->allocated_size);
+				goto put_err_out;
+			}
 			/*
 			 * Verify the number of mft records does not exceed
 			 * 2^32 - 1.
-- 
2.55.0

