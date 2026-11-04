Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825122;
	b=pJrYmjG9S+AbTQJufrctyuOGJ2WJ56WEwdlm7KrBTzElKa4nsZV2OOg4jRA02HiZP6pa
	 xDHACaeGF2gVu8Xdqh8EpJYzxNb6Q4x73p38PqlJpUx8njHY7zA98NLEba6nXiEd4mN37
	 ZXPJDK+7niyTCZ8L01gbnXRDosMi31G8kQQdyiC7bxgqBPNMfQ/h8zzf/UjR78W5kPvzW
	 Qdtt/3OXlV4z098L+XBOmdZmP/sSnReDJZ9ETD43C8ugewj+iO6IjfsJAUlE1+ZYf3Tek
	 h34r0AQvdac38HFleAp3Y/X5x97BxnI0N9rJF2xirbB9yYeMG3leh43v/JlweWc3ERQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FFyElV0JGp89hQTPXMOgAiCtnc9VkWZMulp2A1EvBCw=;
	b=ImY5puZANy+TM6vP4ro7DtbHXuECrsGmurvMrrevyExyd4zHVtZRy03NiB4D4tahg1y1
	 kD5FO4iHWaZFwsW8mHP5816EjtNxCPhpmDv7JYBGFskG5wjY2qjydv3fdFJia+hIYGmL3
	 dzvEiqWkj9fBZNgPo6WlYvLBQy0km+mo6gI80JiJ1MbdNXXYKe525GeItDstQnbb3IJK/
	 Mx7O0Qo3oKFua2sNGpuhTVSB4zPBNGLrzE82cI/ZAmwQ+0LHe9Nom3cjocTwYXoMZgQ8P
	 l8/JkGwE/gtrrLzn327hgHNxcun0V3ZlOW1Mk65nZvInbNOlxBOcqqoXgTpS4Twck6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=fQ4rD7Ol;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0166077B54
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD0166077B54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=fQ4rD7Ol
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-54465f79af8so9958621cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793825121; x=1794429921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFyElV0JGp89hQTPXMOgAiCtnc9VkWZMulp2A1EvBCw=;
        b=fQ4rD7OlgZ1AHHMJIiqoY7rklz7cTMHvKZOCzhhFEN+Y4cBrK4y+ymWwQpmMR/v57q
         qzNB3cnm9BTN0I2DWpswNhTw+8lHIgS63B94aURnhDjmVHb3MDYbAc1KdxaoI4y6Ztai
         +ivorZNFvpAgZpDQq0S2xDYk4Pc54ttUwDTzHxsTrxsVNI6qFRAQfBkMP0fewHHDz3Sb
         qjKhrkVX/ioqmYQfn5hLa5niWTuOwalq8Bt/dtctMbNArNrOi9kA+dwwU2EDzpRbwq5/
         WHRnW9Kf3SV9VlIAl1VRtgmYe9be2K9RJf9mN0fyQDT18w2h3K5FDS23qJjXG4z1rfkm
         hugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825121; x=1794429921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFyElV0JGp89hQTPXMOgAiCtnc9VkWZMulp2A1EvBCw=;
        b=u8lhRw+4v8KS7am0MExxT4Buiz3aBFoYNgyQ1uCRKeqoj79oaOazroIOqOd89C8NEn
         FKrK26ujeZNfGY+L/EcfvI436VswN7XIiYpdW35fK2nbNf/eOYvAclHei7Sa+IJxTS56
         M/nWc9/3Wd98IozVOnO+8C2TEoxEbI4PBU0J+FCXIrM7198YFL1bK1Tk3r4EfVxfRNKQ
         2cx4akhIP2PHNvRsWGhpQ3jE1ywhmA1nOgcDO2U8GTRMt428TlPcFE9u4q++Ps6MR/h/
         H2EKBV+ICMyc4aCziEduko9HsfYUmiUpqnloujRZ9cmIoQtlxbkt3ztjNJm4rnDHb3kH
         uCtA==
X-Forwarded-Encrypted: i=1; AKwUvBxcmKFIghyfhod5X7wqfDA7Z5EMNYGwDgNw+2I0qasHmWan5ennO2GrVv8Nghr0ILgW8lPIQ0tPZUITYhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wTiUSrt3Wm9qzqW5UnZztqu0XNspZMGBUQChj5/e/LBsgh+Y7
	XgiJ92F49cppinXfFJmzkSirUNTpcEOxMvQ5PurMdgXJDNbezhxt26Zlls/P5x8kx2U=
X-Gm-Gg: AYBFou2t6dLfx7ZhSVdsTGr1FO6s+HmGDjB7Mi8zCAN4vOxvhCEZSOuwdihPkDf66Hf
	7j24sgxsUGtReq2pY++kbw9cHtoyhXYtoYi0otbKopLVYdSvCFeQtIFpfzp4gQvJo/l0aZNCWzM
	llzx5j0dUvTqGCYWlIAUwBSHPgvVR/jnXKDr+P/+fyWnhCJ/7cj4R8iiCSI8gX/YKmKJCq959XX
	yUPw/KLRmfWDlTMuUauAE0BYUrUjyKLjpPOE+6O9ymlVlwxm1mpu3JhrtpiCnOzBQY4XK3+kK+Y
	sEBMfe2Jxz8xSCtRLlF5o3ijlAuxLa7YQfjjGw+DV96KAxa2U1iOKF79Ef4O8oV38JTCGqg0piE
	MeQIJMdmO/RKPxG2lUv/za+XJZS3y5GwZc8n4ihEWPVAlO3PtziRWXvbGp34SFWpZYb0aZDfcLg
	ySDpubuX5jhYKkPR0o1EzOCW6FmCWvseLrl5ZvoLwdR04XQUCkZ57JFXtsY7hWkcwdQ8u4ZTvRQ
	CoObmnl9HjC/PSv0MInubvrz7y5qB3EvW5xgpHv04RMe0anw4dnfWof4FII6mObaI0ioX0w/a8U
	auBsbwv8zE1xoleWvZKfbv6pA8WmYZuR6eF40bW9m3FWBA==
X-Received: by 2002:a05:622a:38e:b0:536:3760:e6cb with SMTP id d75a77b69052e-542b6781aa8mr290505121cf.14.1793825120793;
        Wed, 04 Nov 2026 12:45:20 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b100ab8e4sm33768751cf.7.2026.11.04.12.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:45:19 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:45:00 +0000
Subject: [PATCH v3 3/8] ovl: make the root inode appear hashed
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
Message-Id: <20261104-b4-ovl-containerized-sync-v3-3-8daa20144f53@toxicpanda.com>
References: <20261104-b4-ovl-containerized-sync-v3-0-8daa20144f53@toxicpanda.com>
In-Reply-To: <20261104-b4-ovl-containerized-sync-v3-0-8daa20144f53@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825112; l=1088;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ezVCiVHlXduEGN/JKqN233jz7I4B7cGFx2BULYbRDoA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QORkF2pQNIHUPSjD2pa1aC3HFV9lTWplFwhF2J5CN4s3vwCfVwe1XEffjfEYONUnvhSeIGOq7Kb
 LRgXuWs/4SgI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

__mark_inode_dirty() does not put an unhashed inode on a dirty list, and
the root inode of an overlay is never hashed.  Use inode_fake_hash() on it,
so that the following patches can track it like any other overlay inode.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index efa4d862039c..55635648b3de 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1372,6 +1372,11 @@ static struct dentry *ovl_get_root(struct super_block *sb,
 	ovl_set_flag(OVL_WHITEOUTS, d_inode(root));
 	ovl_dentry_set_flag(OVL_E_CONNECTED, root);
 	ovl_set_upperdata(d_inode(root));
+	/*
+	 * Nobody looks the root up by its hash, but __mark_inode_dirty() only
+	 * puts hashed inodes on a dirty list.
+	 */
+	inode_fake_hash(d_inode(root));
 	ovl_inode_init(d_inode(root), &oip, ino, fsid);
 	WARN_ON(!!IS_CASEFOLDED(d_inode(root)) != ofs->casefold);
 	ovl_dentry_init_flags(root, upperdentry, oe, DCACHE_OP_WEAK_REVALIDATE);

-- 
2.55.0

