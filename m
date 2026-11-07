Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079196;
	b=vr4uPuvsKiAXHrclmBDr/ajliS87GzS0JV6Js7eDm2WpXzfytiPWWbKLOThgnfoZHG1E
	 z8FQuBTcS57BgQPwMVJRiTKHpnDjrEEBllC0GLFnK04wWGb4+PJC7qyd2mlVbPHGgRkkT
	 M6CJel5DxRenIQ0K4v/7tlXfv/vMyPTiPWyWG1ETCSJ7dB10ItZUdAGvGFGfn9O7h1Bfs
	 qeiF6+Zn1nqqL12dz7rvismCt+eK8fEmUCnXPB4qJupiLKmmOPwcTa0bga1FfJ9eD/3Ha
	 TYE4LR2jc86eNowXU32AmddKZX/CIBRSY2DJyDV4VUTWHfa8fVCY46OmwtqzQb4RhMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8zerBigyv9mmzg2Gjo9e2dqqPP6k5FgIy3HAg56oVSI=;
	b=V8r1dhLm+72z1kNUlSCCQU1TFUC22cmUFboYjRo4W1tpUIA3lc8x1//RtXehDJbM5aL0
	 tY5eXEsC2NgEqkAHaCZz1txGSI6R61KM1odMnKRfTmSP8cVSUQVE52uNeQud77D9z2v5d
	 EfWhg45g3M9DiUbqWkk7LAgff6ZTOQPyxGfWY4EBGiLSlvA8zN1xoAlmWri663eUsI41d
	 CyFkcE/6KZM9wowg5VQcvAtXpObxfJCYHFfqRjLUv964VIahyaFAKIiG2vpNA0GWBhHZc
	 vrneBJtptsfOuU5GEQmJKERAifzjUurso7RJW+vS7lr7CPdzhAtKZo4wMhBBP0jIhqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=AURhGvnE;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D56606EE83
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D56606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=AURhGvnE
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91ea43af0caso17410316d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794079195; x=1794683995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8zerBigyv9mmzg2Gjo9e2dqqPP6k5FgIy3HAg56oVSI=;
        b=AURhGvnE8sFETK7RokAwv3quzHjXhBE30qWbkAq+wP6miAD+x6MkOmA/0kHToZBUu8
         t966u6k40pDVh4nfY1dgbvniGj6ktX2zMmyu2cUHwy+bbzhwAEO634XFVTbTDnh8veJA
         svlbhvYRnZV0CqMUUrz1L0BfALKnz2pvzb0Cv9h4JtE2oaDpDoLKDJRbUAtyUNS7hekM
         Tbq4tXg6VgIqtZKQl/pMUDFIlOHaVLtPvIhqTY0dUN8g/VKImdT/uBYTVDN6gQ1lhRS5
         LLBW/z/ZWQUg2seVaav7scOozI29kdsSye4+Lsoipeh5eaEuADj1kZQ0ngn8+gYXxYDZ
         Jq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079195; x=1794683995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zerBigyv9mmzg2Gjo9e2dqqPP6k5FgIy3HAg56oVSI=;
        b=Wg34uFPJn3W+kArvwqsR2Pai+kwow5AU5g/QlRtob3pu5qMUz3DakKMwUR87yVsn3V
         hqZ9TR6i5Hl/MYwgLunV+Ft5dDWOoRvAT14mYPcPxr5zv7i9UDdaEzNFuEXbJs9iMVAk
         nkbjXaPBVZ1hUyxajjidmOuSgPQyDBJgTlI40qvZ/NhvAtVXAZxhD6ZhguULGQKLJuiD
         +tMhdHFMnVCgoUK8OdhMi3gHfxxJ3UCGxE/AQ9BGRGDyVx2/ABtqWZ9GX7Cp1+lxcMll
         6japkuG3hz06/HLBeTzFvkoOQf8fMpqXODzfQiTHThqbt4RW5SoQMGRNheuNCg2qIKwL
         kmnA==
X-Forwarded-Encrypted: i=1; AL+hErFvbJinCt+VspIsjwC7Ab9BFjhA28FRdf+9vnR3WZv5WW6gs2PQf/FZXd3P+w6dTRAshjFn2fhRdmqztJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AYqGPHf4eYXWbuP6xrWX+JXBnGhAEFtncTa1pb0V/RQbRqTb3
	lNrisLu40pUB2p7rMvFDXvyq8nJ8+Jjpg8A8jfvnd8J6iaFFpMsuFiwq1zuNq0yfjmg=
X-Gm-Gg: AYBFou3rAg5sO1HnM/JYDuKiDcWcoeTSniOTK/G4sJUNCTPjVy0wvEQsD52pKqmn3NI
	5FWp7RsE2MdKlutDOn5LtXSxpGXMXjb42WsUlui6Myq1UkjZdDOim5hoyXChfQEtJ5K1hjS8Smo
	yrChkuPXk9MaO519+CrRuWkxWz+fFontPLaU2UM861+sM2yF9b/qCSBVMumfaBh8gWLngNghrBt
	IbMRto3edxfpRvZAde9fYMf1o43UyP2MhPZa1Du5XJD6k5BymyHbu5rIKSXvDVbD9qd/kWSrxGr
	dwb30Yqb86aBI3wyk7y5BVL62NtnxXI6wr2VO+YFq3secdnlmGbE9EMv+eR389GM6yAh3NRKMTy
	V09rUqH/7qYvbcTqONV/AB5EbF63sJw9hiQMsCOViK7FiArxR96FeDIl1Z+136OhzAOwXJrT93X
	sELZDzrB6CtwsODon7/sf23mhGFnDDJGv4KxDm77yBn60N5IjjwzE8ZqyeuAS22jU9lGAQqLQCN
	LlnY8J6bxUfDiF/6th9jF4T2FmSXhgxGxvEdYJ/X4xfI5+MRWyJqebVpXvpZgQGiOvPQYRsDRWw
	JYgQ1xKKZd4Q6jITfM+Oi3i9xf1NB/ln8BCYFlsfV6qDKw==
X-Received: by 2002:a05:6214:3308:b0:91e:b100:1523 with SMTP id 6a1803df08f44-91eb1001f9emr68146156d6.57.1794079195112;
        Sat, 07 Nov 2026 11:19:55 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91eceb56c90sm702666d6.3.2026.11.07.11.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:19:54 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Sat, 07 Nov 2026 19:19:35 +0000
Subject: [PATCH v5 6/8] ovl: cache dirty overlayfs' inode
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
Message-Id: <20261107-b4-ovl-containerized-sync-v5-6-d34b4ae57fdf@toxicpanda.com>
References: <20261107-b4-ovl-containerized-sync-v5-0-d34b4ae57fdf@toxicpanda.com>
In-Reply-To: <20261107-b4-ovl-containerized-sync-v5-0-d34b4ae57fdf@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794079181; l=1773;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=4vtTge6/ThBXumR/B3MN7k2/gMZpZtKv00zfzARf7Uc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QE7kYqImzZByR9bEHLrMuC21KuaTdkAwi3r37N9KScAxvVGsqEgOJtwlmPwM2opRWHNScz0i8WU
 A7kMv3mM9zwU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <cgxu519@mykernel.net>

Now drop overlayfs' inode will sync dirty data,
so we change to only drop clean inode.

The purpose of doing this is to keep compatible
behavior with before because without this change
dropping overlayfs inode will not trigger syncing
of underlying dirty inode.

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
[josef: also keep an inode that is under writeback, rebase]
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/super.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 41d0d37accda..ccfbaf9d8797 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -388,11 +388,27 @@ static int ovl_write_inode(struct inode *inode, struct writeback_control *wbc)
 	return ret;
 }
 
+/*
+ * In iput_final(), clean inode will drop directly and dirty inode will
+ * keep in the cache until write back to sync dirty data then add to lru
+ * list to wait reclaim.
+ *
+ * An inode under writeback has had its dirty flags cleared, and only I_SYNC
+ * pins it.  Such an inode is not clean.  ovl_write_inode() may be about to mark
+ * it dirty again, and marking an inode dirty that is being freed has no effect.
+ */
+static int ovl_drop_inode(struct inode *inode)
+{
+	if (!(inode_state_read(inode) & (I_DIRTY_ALL | I_SYNC)))
+		return 1;
+	return inode_generic_drop(inode);
+}
+
 static const struct super_operations ovl_super_operations = {
 	.alloc_inode	= ovl_alloc_inode,
 	.free_inode	= ovl_free_inode,
 	.destroy_inode	= ovl_destroy_inode,
-	.drop_inode	= inode_just_drop,
+	.drop_inode	= ovl_drop_inode,
 	.put_super	= ovl_put_super,
 	.write_inode	= ovl_write_inode,
 	.sync_fs	= ovl_sync_fs,

-- 
2.55.0

