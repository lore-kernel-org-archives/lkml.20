Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972224;
	b=s1BGvSPKXtTE+Dmq1zauP8UhfFR4oPCuW+doOY7TaFb76B8T+A5GFPv8iqKy1u2qNsL0
	 oH1sYm0ph99PZo88f9AO17MZD2CTzkt+X+Fm58F3oI89Abix/Jlg1j1EaG4O22p0quHp0
	 HBtGDWQ0+ss5KxwOrw8cocl1ywAHZpW8hZHqsRCdMCGLy5GFeEQNN1QtaNZc/38z/d1RI
	 s6BcMbzjkYYSw9yTiQClyiVQgF0K6CoK72H9bxOEKBV2FDt2ihidQawemPwGuUi2wShIX
	 snUaT3sGhC7mJMsHRc7lMao8fAeAVHO+vD/4E11ML1/TJ1KMnfNROjlkzEMKsN/3mRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fsgc145zwHET8lvApLf2hA0PKAQBWP1kvOH0cyQnSe8=;
	b=XsZaLhnlKlmAUdgcE8mV+kVa9WxcQ6x5JHrIguec0M9hbYZcohEq3I5FQhusYC+aqeEt
	 0KTaC9fW5bfCECrx1Bgxmveb3RwoAdkLGaEWCvwdIrRhn6ivyV+7XqoR89eNZrpApxD8P
	 pA2kaoj3A0AsZUm5Q0lWHS+t4yzVcRscZ/hE20h4qB+gS3ZND0uEhSFemmrC/pk8hDc9k
	 CJw68Ab9ig4JJUDNIjqXBMUHJxSa5YUigh1pSLKZODjJn2mWBxZ+kYLiORqXZbXmaUmN7
	 jZlVRkWeQpPjboqLrjSqnP8MNc2ji9IcqMR770Ix3ws6B5cDiTC+ZGz0xi4p0abKTpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=aqvwX80A;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC8F606D802
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC8F606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=aqvwX80A
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5366463571cso6839251cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793972223; x=1794577023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsgc145zwHET8lvApLf2hA0PKAQBWP1kvOH0cyQnSe8=;
        b=aqvwX80AjGRwxCjKMWgVXyvpVydMW0JPni4tQ1PkFnI19f65ijPwfSv4NDB/dmBLAZ
         sgkHMN75auCP6VUaaFF5xHO57tobC1BYLRCPYW443LRub/mtjmO7r6bSY0rrKVrQSjVA
         6BO0QajzfAHQeqYeSSh8oSaXRKi/qtKCk/3lsy31j2LdB12LgTHUGtj495OjmW6gDnNz
         SutGKU6FQtSDNsEMD243pp3zqskoVz/TO+aHkTsjCNMV8F7WTubCfQZxeYuf5Or67sEj
         NBFHxZs/R0O1jsRtTGMDD2LSo96v+AfmxnOZeJfklC7L0ydlA3DqXXam3GjdYzcx5YAE
         +IFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972223; x=1794577023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsgc145zwHET8lvApLf2hA0PKAQBWP1kvOH0cyQnSe8=;
        b=yf903j3GsYVyzPqZRrzXoSgY3NuHI7zEktyjx2ljOuX1+nwk5N0W9LMwzJ1eoDbL/4
         5Tz0MAKYSGIeQYQ9nhabeFekrwo2NqoAwBzwUg928DVbl5fABuOTbE4xNl8XNhjB5wMB
         IomwNKWIgX0Y7HTNKgwjL7cMp/9TTnibt0jzpzteTByNzAvYWwOfWT/rbcaH1kShVOnB
         G+gEi5yjPxIfDmR2sNHHvSxIRrpqrm3VE3Lk1DQfB7cmLJjSdwHJMuANpsu9V+z+ghJR
         ypCenzh9zzUsWUQsKyKSDxCXu6jdehL6+90e188TWUlBwCLsmPNBMLWjYB3yDKGplRPg
         fMuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCdM1RDx5wExXSZ/LmF8iNbWQ0n/3R0RKKXv3K1HkWOao/W5EHl0XL5WqG9wLLn/z4u7k5DcZ1aDlQd+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a85/qycGJ4AG+TB8APQblCs2LgR5iLdT6T9ri15FDViu/5POe
	2yVC6e78N4wB9q20TcAo5SLZnlmHq1IKZZTWv9xUorPAWslICKpLZLAjjHBfcOaxJKA=
X-Gm-Gg: AYBFou3jDF6sXe2tPbpQ2JCnjRlCfhMr2C5I/PtG9ykcNLgB1+aWByq6JLzfJ/9j3IP
	oQUbW0aYq3caJbMbO8mwWXbphLiePVqujMxFVqy5RdM4E05DQoiU2wwWsrxKQg67Zpx9DeMfUGT
	PsKSa8EnatuzG6bbjxM9DuzbcJWs+BkstQLhz6sUZWEPrMiLSOhk/lu3cZJg3gkRm8RtSce0MlJ
	TTVNMarHIK4K5zHyOOSwrn1L9Um7AAy6J9TKquVXxGc3SHkFEmg+nr/GXtuPoGFJI4QLRiiodFC
	vJQvprxjfip7UbdEGhAmftf70mR4NCcDhuustUyIK66t0NMxVBVD8rhVrMv5ZfKTmh29Mbzp+O9
	RqtKt/y2dMbcLgp3qJxe23q2yVajJEzKCGjjLrxbcgi33fkrmH8p93fGUDNqWi/4SPyuZpGot4f
	RNdzihs5YQYrbBz/QZh9W58jXYhPSlQ/sMQuIAwq3XzCUnS7H49YMuxUg8IH4GdfTX003jHqEbL
	KGurCFAWwPd+SqiuEzsllU+BZH9ASNH2EkP4GKxjeEQgKBwJ/lHnHCz9+9m09AOVZz3RdsD+Wr7
	3gOwYj0qsNuxRL6ivuIcAt3TMsIn+acsH0PqMkf4TT6sxw==
X-Received: by 2002:a05:622b:1c6:10b0:535:a5fc:3b58 with SMTP id d75a77b69052e-54e15d687f9mr29797641cf.68.1793972222579;
        Fri, 06 Nov 2026 05:37:02 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c110sm20707636d6.7.2026.11.06.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:37:02 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 06 Nov 2026 13:36:44 +0000
Subject: [PATCH v4 2/8] ovl: setup overlayfs' private bdi
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-b4-ovl-containerized-sync-v4-2-6ddde0b7dd8a@toxicpanda.com>
References: <20261106-b4-ovl-containerized-sync-v4-0-6ddde0b7dd8a@toxicpanda.com>
In-Reply-To: <20261106-b4-ovl-containerized-sync-v4-0-6ddde0b7dd8a@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chengguang Xu <charliecgxu@tencent.com>, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793972217; l=1000;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=oigsy1vUIPeqGe01IWwnaOrpAKAk76udNuQNtC58Mj4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH2MMGJo3VtO/g4mpjtSeMtfHkOvY5p3MTJJt5D34LL2yuZaYjI4lVmv6voneKKUnxmg7ImbaT6
 mUv/1qHSlZgo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <charliecgxu@tencent.com>

Setup overlayfs' private bdi so that we can collect
overlayfs' own dirty inodes.

Signed-off-by: Chengguang Xu <charliecgxu@tencent.com>
[josef: only for an overlay that tracks dirty inodes]
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/super.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 81da70fd53a6..22a8d4eb3b7c 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1490,6 +1490,16 @@ static int ovl_fill_super_creds(struct fs_context *fc, struct super_block *sb)
 		if (!ofs->workdir)
 			sb->s_flags |= SB_RDONLY;
 
+		/*
+		 * Dirty overlay inodes go on the lists of this bdi.  fsync_mode
+		 * is final once ovl_get_workdir() has returned.
+		 */
+		if (ovl_tracks_dirty(ofs)) {
+			err = super_setup_bdi(sb);
+			if (err)
+				return err;
+		}
+
 		sb->s_stack_depth = upper_sb->s_stack_depth;
 		sb->s_time_gran = upper_sb->s_time_gran;
 	}

-- 
2.55.0

