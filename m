Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972229;
	b=IFD5CBWnU+XWfLZPotRlxmVn+b/XxaUUfgxzzeGiLnaB8Kfqbi0+ioVa/GSnk4iMlBHb
	 WfrDg8dGNsGqXckVvrJoMyakl0JhjxzOdFlVi+NaaDVJNOArkqsIacNiuhzp81btcv/Mi
	 Jmz6Il0slflRqwOkVkh27fPx1gq9hXiqCBRJW/KxJ98lj7Hxg1aukEUPv9xTnVt2dIW8G
	 FxQykQK+0mEVV/sCyIHIoNZFkClOTwq5kDD6Zww/FrNOPBjaFRx3wiCxGeRPTUY++jICV
	 TvJMqhNP3rVS7IgTrAh+d4rdXxISD/Wp/v8vTU7BjpG73YMXQb2BjByFhWu3S1Hp+lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aoZSxD+M4Ix3Nzdinv/kkvM8PFIKv0qH9kj5OB/mLsY=;
	b=SXfilN6zlm8wRfJzD7To15w6P9tXsrSNwhR/qKhIumhfLAcS3XP9uY5/6iX/5UnsmiOS
	 AFj4OAz2QkqG/J19dm/DznmRpTtHSeETldViTwUY0wADQbcq1ZrAYUpnJ4YlqoN/MfKmK
	 3fh5k2gfJlcIZpsw78/k/IDcvKsRZwWyQcnsnViOMDk0XlhyJJm71yaFta4+CK5vgHBFu
	 Kaz0uuUnDR1PcPWpZNjEOGq55JY1krRJcgZmxxvfl8ObsK8daFiVQQdf/gGCiWdgVWFWP
	 I6SuIvHqdIyNZdSn466/2un/QaTYqSJSvJAOxIrth0RCxmNrzvB0QygYRFU7D5c+jcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=EOIY1qX1;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941A0606D801
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 941A0606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=EOIY1qX1
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53644b28706so8576901cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793972224; x=1794577024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aoZSxD+M4Ix3Nzdinv/kkvM8PFIKv0qH9kj5OB/mLsY=;
        b=EOIY1qX11hRw/xhofNwHlde2BW/gZLNG3g5NViKPdF1DRopQ3uBRzoHHVhKT3WajUH
         KVYMTVmFKwzIz6G61stuPke7PQoM5t1gNsJwSAXv5UTdbxfaG2AO0hP4P1h43giIqeAo
         g0VjMJkPgi81+pBH+ASezpiosfKAmjNE/CsMfCc8JqOBZas4To0n5f9YPlgWTv4O4JZT
         43xq86Zqz6sY+2ca/UaZLXFkFdAFBpKeM5xKTanQ7exkblvfSz9cIvty7ZQB4vZSUPKZ
         CZ/5+0dRSgwbKPJ5UG9kL6wEW4m289TokPmy3P6rXypzzOuNYEmKa3VxcPF8lhaeFB4W
         l+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972224; x=1794577024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoZSxD+M4Ix3Nzdinv/kkvM8PFIKv0qH9kj5OB/mLsY=;
        b=btrvko7RQDWlDwBkqLyTjE1i+pBP8ZWLaET0Aga61Kd4jC0bNGHGNn9Mu2ym3qNnGw
         5m52fc9Caoe9r2HTwXkaWN+WEIuCIu5qOsqhxAYc+EwulFB552MYwatWPRKNlvLVUODh
         3oXIYFQhu62w90vfc/3UVj2EMrZjkvYDBsnVtQaTPGN4eWW2mVpK9jOjQ8xbIo5msmS7
         PYT2XMKMcZQK6XiHOF3cfBVzo4jxNzv+MC2FGR/rmvuDB4jNSbPIXPRJf+1+ioGa1SD+
         yJYdu1N27QviHckxwDNxUX+DgXYG3SHALrXSMJSzrJ5o6dqSwb9Yc5UNLjrDdZkO5r+I
         aPig==
X-Forwarded-Encrypted: i=1; AKwUvBxMGj0UCfS3qdBq3zyFJ1VlTbYDTEw59HRY5D8x/zd5qvh+xt4Ct9Pk0O14P2LPhPz6KOVmX5fRk17JnnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+45QWXTBw++7EKfwvmvSriaai2gmzk7NHW3IKhkCq06Mxd19U0
	YdQyF8WzXTwzzm72III5j3RBRysLQWMKlYA3aAR9OxtB9mtdoQzokiYVCkiISP5EWm8=
X-Gm-Gg: AYBFou1FT9KKg8AAmhFSQ1oyAFUnHAoV63Sm/UQGW5Lj1JqFznvhnwZ1jT3vQHeKs6/
	4VLInuHFeO6YVpzHBDUSFRK+9/vOLRIbRWKUs2toqueukpP536f3/1dxX1b962sjSTAzWNTvStX
	Y915JHq0rmLAN7JThG0Wy2we5iJPh6oCJtvhcxtlhahnFwNvCffTOKGSjyOmDB8EB7A5YgUFwDi
	zmI3YsOn4fcXCQM+uHka6t3OXFfP+NF52dOpkaVQ7HYKvlQpJoCWIqVUFnVe399tsaidNAgsypK
	tmZ4c3VqhbWc6fqdnSyGJPYaZCx/tq1HQxXDXqmGj/NunDPnrPxNMgbi/0+6xsAWSlhtTHOpP/l
	duOqvLcNuTE8/lnoKcjc72B3AhjyrHPgch+5HGBZsJRMh9w58CFkztyrX3FD+qm6tukG+BEodW4
	C9DvtKxxb0PwmQ0N3vh7PYt2zrB+eY32VLyGlONc0HYoEdP70lEFcgH8f80d63wSFTNEjaRVT09
	MnktpUaKjz68Nb60C4HsrrTOOgb5DtchE0c4QAyGO407UAvGjsBaLFVCOCwucSBzCSwc+Cmw3N4
	M5dgSghutFuvu882oHR+qObwuyVNT+dYGSWsiLePcJNQ4A==
X-Received: by 2002:a05:622a:4117:b0:549:9438:8c47 with SMTP id d75a77b69052e-54e1309dec4mr38780521cf.23.1793972223702;
        Fri, 06 Nov 2026 05:37:03 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e270179f0sm20538911cf.26.2026.11.06.05.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:37:03 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 06 Nov 2026 13:36:45 +0000
Subject: [PATCH v4 3/8] ovl: make the root inode appear hashed
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
Message-Id: <20261106-b4-ovl-containerized-sync-v4-3-6ddde0b7dd8a@toxicpanda.com>
References: <20261106-b4-ovl-containerized-sync-v4-0-6ddde0b7dd8a@toxicpanda.com>
In-Reply-To: <20261106-b4-ovl-containerized-sync-v4-0-6ddde0b7dd8a@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793972217; l=1088;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=b2F4eGdbpOMxJXXK78nupdaZI/TuEjSLWoRn4Q7cKAw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHJ31XEy6WjwNNRqX2i98eblVslKDYOiu+4N9/wDk2vVO6TSNHfrhlaeuyrPUhIhqIPg1Ru4EWt
 FHgpEiohP2gA=
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
index 22a8d4eb3b7c..9eb6a5e485ee 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1371,6 +1371,11 @@ static struct dentry *ovl_get_root(struct super_block *sb,
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

