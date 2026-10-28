Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222533;
	b=y5uk+f2iXB0ecfDKZ4HRTzWvOIF1XxOxGIPFYfAj1hInRRl0/deaBGMRov04AuNzevfy
	 qg7MPkbdfygMf5pLuv7o0OHjvA0tgcXQDvQp78ATV0u+B0RRpwfm6q+R+m1kwWo3JnDRi
	 5mjnroD1ddGqjMyh1BbUF6+cYFYuoaj8G5VwC5xatvt3wNSRcsoWlZTAFWJIvhcWhJCdZ
	 LDc5QyKLCEL88suGDZozR80wkFJEUoxfCEmDKtVppW+mEScUiivyvxYA6/auZJZIoN+RS
	 cejE6OjVMuRY9qE0Pz2/hbJdOGleARfa1RT3qTVfTPILerfcnykd7smmf0Z0SJE/lxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pDKBmS6WYnfb6Q8TXF/5+aSfNtslksEYbf4eTsPewHM=;
	b=0iEEyOBwAFGOe7vx25uB1FZJYBKmekOXi8+Ucf23QwSmahtOEC22HPF+L7kFOA2AN3gm
	 816HCLEw8p1EVYHsBnhxTaMc+fonYjdBGsHcvHuo4CadrmOlrLGU2BW3j0R1prGK9lHDG
	 biTHNPnJz+LWtwu3bo9hlkS/UT+IQ1YG9QEEVcTtNBO1uV8PHEIUrbgNz1c+PZvk0HBtW
	 skI60w4JevCnB0ylbiaGkfhsCpxthkzHuuPQTmviW5JhP4zwJHXt8G/SCTb+vjWYOfGbC
	 K8dpu+qDcyLsrjvRS2VERSXFLDlmO/c4rSNRoGzac7CGrJgxXSEdQlhjnq8Ygs8qt3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hr0QV9XD;
	arc=none smtp.remote-ip=74.125.229.132
Received: from mail-dl2-f4.google.com (mail-dl2-f4.google.com [74.125.229.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06C1606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hr0QV9XD
Received: by mail-dl2-f4.google.com with SMTP id a92af1059eb24-1922a6f0d23so303595c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793222532; x=1793827332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDKBmS6WYnfb6Q8TXF/5+aSfNtslksEYbf4eTsPewHM=;
        b=hr0QV9XD1SS73k8nOo/XPZODLSu9M1wD+obtp/bS8eiJLGS3MqmodtWAxb3X8eVpzX
         CoEcuZI4AZm4vfAUxoro2OPAVScaXOEE9gmNSIYjTAsAuxydgW8yYvT9x66r0Zni+eCL
         8xwBV2nTyItvK7oJCwZzgpuvjsE1ntUxa5So1LzhbEchVj0SKzdouo2Khycp3HLwTgBK
         0dafDTQFWwqgPBwBIHCdZCoRDk/TNYYjdZy1Tuj1CTgIwAQfANz67wIzuL8ErsFhPVgk
         xnzjqk/vbOaFiGtCYlNaYA5H0le1eoFd+lFw2vKGhQJ3GZWsEp8sMKLMXU0VWP1xVfPP
         odRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222532; x=1793827332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDKBmS6WYnfb6Q8TXF/5+aSfNtslksEYbf4eTsPewHM=;
        b=dmnHngHGW/RWwtzNDVFCyMsztp9POAJ/oqOBmUOKm5zYTuk7sNEeR9jsBPca/N6b21
         qwCiFofR7giLxrLMDVkGzJynU3HHJBUBAoSkmMBhyxbL23qNNzt7dvoKgmuYOvxsplkb
         HtMMDuoIQvuh7uzYgA322AunVuaWM8FtpYLa8eKAjYUk4mcYx5fbhl6+OiB2hp/1hdrx
         8H8XTMs4dRz/AV2J0B4cHDRNbSG4d0v3Rw5LCfVEaWwtf5mWu9upEtsoUoIp2LMSHull
         IR3TivW3qbtfuL7W52Yr2FlsGfFVv1R3sx5U65qnguqE6ZMPaxIliJuWYlAJqWah6yKl
         BTGg==
X-Forwarded-Encrypted: i=1; AKwUvBwlBSZGjY6IvI+HqVgsdMfZf7Bxqkle2yllItBkINzbu1cm4EqhMNJz9bk+qan3LQcvWbc1HpsHysORm9I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwNjGRv5aTFLUtM9/jBqNetLY2ew6hNijJ/+WC8Sv5/Vv1EYHn
	N93nz3J609AzvEIpoYFbLZskYd8D6oIjLXL7pAt8bufujY0emsF6CKvJIDqG8Ipe
X-Gm-Gg: AYBFou3KwTi3y8xnFGXezRUcIipbNeE3GczUyP/W49R5Sr1OcGxhTjplpaS8W2Q8Ni7
	t/9rX+EqQQYXVAp90x4RarC5EBLZ0yey5NVC6UwCD/uh9UAZWE6gw+UQi4UOP/xQYUzNKxQjO5J
	rbEj8tkTUFddAA1uqFQSQfYMrngyKUTRM4N8jms014iCr2+6vfisBje5VkWcZeaZY6AaMfnwK97
	Hps64O9U3bV9l6xhKkPYkdNV7V0AV9LJqvWxp06V5lABDaCnBulYSwP0DrmYBY8oKezhOyDDWkS
	02RM3RSbUklL4eaUmLqePow+xpsA6h79e8lpnMz8uQIAjUEqgmjs8b7GWA9H2VznBUEK14dM91i
	NcMtOGa4RK6YK0FYlwydmGJKENuNp31Otdi00/ub2ZNA3TpNV1xG1kVMYr4+Ab7oTWhIeu2PctS
	/AADp6qBAL+N+aw0LAoiX6IWlhED4kptzv4mPDc0wpwsxkxp3HuLGTjQLOf2D78bRKeNVdft1Vj
	4Ga4+TOCD9wBihKoUYj2wqjVo85wLDkY/dSCFul89iOZSN6X3LLRCJzY3oy496TlftUqBMEUEZo
	YyOhC0gcelLSy0MTzvuPpGuLB9WCoWRjX018LcIIdgt2TxzDFNp4vod1
X-Received: by 2002:a05:7022:5f0b:b0:14a:a6dc:9ca6 with SMTP id a92af1059eb24-1a6c7c35fdamr4297952c88.3.1793222531698;
        Wed, 28 Oct 2026 14:22:11 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a37093esm7147776c88.3.2026.10.28.14.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:22:09 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: hirofumi@mail.parknet.co.jp
Cc: brauner@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] fat: fix parent link count when replacing a sibling directory
Date: Wed, 28 Oct 2026 21:16:25 +0000
Message-ID: <20261028211626.26103-1-dennylin0707@gmail.com>
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

vfat_rename() and do_msdos_rename() adjust parent link counts only when
updating the dotdot entry for a move between different parents. Replacing
an existing empty directory in the same parent also removes a
subdirectory, but leaves the parent's link count unchanged.

For example, renaming one of two sibling directories over the other
leaves the parent with four links instead of three. stat and ls report
the stale count, and find -links 3 does not match the parent.

Drop the parent's link count for this case after the source entry has
been removed successfully. Leave cross-parent renames, regular files
and the existing error paths unchanged.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/fat/namei_msdos.c | 2 ++
 fs/fat/namei_vfat.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
index c7500c2859e0..570dd75dd275 100644
--- a/fs/fat/namei_msdos.c
+++ b/fs/fat/namei_msdos.c
@@ -565,6 +565,8 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 		(void)sync_inode_metadata(old_dir, 1);
 
 	if (new_inode) {
+		if (is_dir && old_dir == new_dir)
+			drop_nlink(old_dir);
 		drop_nlink(new_inode);
 		if (is_dir)
 			drop_nlink(new_inode);
diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
index ff7652bf0410..d7e2df5bf7e5 100644
--- a/fs/fat/namei_vfat.c
+++ b/fs/fat/namei_vfat.c
@@ -1011,6 +1011,8 @@ static int vfat_rename(struct inode *old_dir, struct dentry *old_dentry,
 	vfat_update_dir_metadata(old_dir, &ts);
 
 	if (new_inode) {
+		if (is_dir && old_dir == new_dir)
+			drop_nlink(old_dir);
 		drop_nlink(new_inode);
 		if (is_dir)
 			drop_nlink(new_inode);
-- 
2.43.0

