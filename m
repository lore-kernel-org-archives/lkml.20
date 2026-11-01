Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793498246;
	b=T6FDI3Je7Ndkgm6r8I9OvpaNvEk4le5IguNn0mdeAwBLBVUDtgZJNnsbW6tUH1ss2sdy
	 PbXbNXpS908IhRuCa59UHPT3XFyOnBVdZDJ1MdBt6Qv78wDfr3LDek+SXmvR5/cljSFH4
	 4I0PP8Vqc5J82jzABEiPzQ/FHjmJFdGz7waGW6tbRV+oAbGgnCVBB/wnW5DhRUVsZ2f7e
	 C6MUhm0HKGUhp3dkc0d2nZTbiufkGa6ca6jgxqjvuLrrO9s5npxdnEQhRsEM6ylQsjdgn
	 e/9s9H4OKAnBHzSdfVWkwUAzc2JIfe+3queY8lyhTNYk7yE3w3Jlp4XeW2TnaPKbhuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793498246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9AHT+4uPvWe1t1h3zSSbp4rofXCcWo8UcjGq3mTB8UM=;
	b=VItkk1AaSRrUjew1CABzM8gx8VOO0s4tSPQBwgFCMQJBdZkIoUxkZ2lu2ht4F5l7UVH5
	 vfyZkg4Bd/aZ5aWpwvi9h7y2NxIg+Mt84DkZWxORGGrkgNJUia1YAGVKcDOvDo/W30YIl
	 I8nrwO3ncYZ6rMF90MCy1Hz42Xvl/Yo8ZuvL1Vd+9Yv2YQOogkmbGtONMxpxBa1p9kO7J
	 hKJBy2dPR1tDpSEJ7U+hZiQ6FS+8P18y1XYZNfR/4muFSvBNR6o6RyEQL04sXhyh7y7ls
	 c4y46K5MDZS7vuB1Wwl1tjOcH/xH9bNVK6r40JE29dt3XThNLkgLUNrMNte7NlleCpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6E9zXny;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBB460A2625
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 01:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DBB460A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6E9zXny
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so14565865e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793498245; x=1794103045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AHT+4uPvWe1t1h3zSSbp4rofXCcWo8UcjGq3mTB8UM=;
        b=c6E9zXnyBd1dxj3QVODEevFQOkW9llb0HZ5WHJHiNOiNB9qd6qEdsxAiD88lBYRUhy
         RTD8dwAyeeMQ/P6e4XpBTyYr9CdHq1Z5ZoSjnOcQ43l0sSRRE2SU2bVaKSbP7OFiU5am
         +YnZ3xy+tatzzdG5jV5qTqox0i5Za2dg053/k5zKoz9m5X4KZjO30QPe4vk/Rih8omDj
         kkesHih7L7GwtKXoIlBExVUv6BuqM4MvhmN4pXiSiKn33VEAT1eS/KXlb8GZySTFSi63
         R6NVPFry/yoaz8fuwwf1PLpHwOl3hFTsQpXDci8LWS15HRCyP5IWZVyH9IoPaEqPzTYF
         IT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793498245; x=1794103045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9AHT+4uPvWe1t1h3zSSbp4rofXCcWo8UcjGq3mTB8UM=;
        b=kYePMWm8vm8eV3Nn9RBXKjw0ti4GPWu9XtTAc0hFsXmmqsliLqQ6vcYouXuSewieKU
         sAuhxCte4i6BgzqSWAxYEuCe44en9PiGDAisDIGYnUtsdZYpIxoq/crkuceGCaXscRbR
         xF/DOYS8jhl2ucoc36NE7fIqIBDsxQ18Dlagl1PfV655p7ChQ+Dv5pfO62tE8w/vCkPc
         NzepVvrGqaAbqG/OVHu+ZPoMgjHRAlr2uSFpaHqNOmd2yU+ypc2OWE8Rzi8SioxiT+Dk
         0ANIMGNfKuY5v7Oh7cYEU/h5OCObNmX6GSmGnlcdffJ4tEeTJuipK61onr5cossPxabr
         Kv5w==
X-Forwarded-Encrypted: i=1; AKwUvBws7Sc1p6wGWGtElYZvxVnv2nq5Sh7kzjRHc7lGiw/UfcybduVwR+uP1y/rNB45fNp/a8sgVLa0UnK5/wc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI08lXmMLLF/ArMKZzxOqpzqNzNtaYq7Z+un8Sgm+wqfccqd+l9
	hzQ6Y6uVQ9Oq3q4nqS1hY4QK465kfmn73QMLRjLk7j7/pADsYuK5VNEv
X-Gm-Gg: AYBFou1zr4CjK1dfj24QIa3e0FqQl8FVaHJgHM4AJ4K447S4OASxUfiMv10nps9MXQ8
	X+BxnedEEYuXX8g+iHR4nEnHMfgA3UBgO0ps+SvAo8hsehBnTqSz9DxRvQP6VtYOqT9aopEAE5b
	uYK+oGn2S3AtIOn+a+eQVBYtpmAzVyDsRQJCoSLfzGWxm5lFZ5wFw32//z48QnUTjkKj/DJh7OQ
	/luha7yrXSSov7JW+2FjZOlQb/Qw6LJgVjLDuUr/9pbAXDAkpWzdP8qFRn/KUNK1f+g0hh91uT+
	uImFXR2mmOPxmURaXwAe0Mv1SI3YLjQvKn8v0MPRgv9pG94IlY0zA8j1CAgwqSxPXYAKJaH/uuX
	P30GW99f1P/Khw8HJA7xlRh2kyrzXM4hN1BEFctq9YTv9ModI6UVmr3nj9jbjrZimaHiGAeLABc
	w4vbOv2sV/kQkDGMzBD70lZNEsknj5uYXp4bre2n0v4Rc3pOFQtmqHjq7GoPGY9xqBtMoOnBeoF
	ybphFZwV3u7EsTOQlhnByaEd2cQKVhkZYq+IUrw/6HDdqueIft4UPlAVdTlkXl43gkDhF/Jcj7z
	PMf6hz+zc1Nv2xgNjj6KJs38
X-Received: by 2002:a05:600c:3ba0:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ac151a84f0mr142228025e9.3.1793498244682;
        Sat, 31 Oct 2026 18:57:24 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm273532835e9.11.2026.10.31.18.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 18:57:23 -0700 (PDT)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Chris Mason <mason@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chuck Lever <cel@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v3 2/5] vfs: add fileattr_has_fsx_mask()
Date: Sun,  1 Nov 2026 02:55:48 +0100
Message-ID: <20261101015551.786044-3-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101015551.786044-1-koray.fra@gmail.com>
References: <20261101015551.786044-1-koray.fra@gmail.com>
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

Add fileattr_has_fsx_mask() as a helper to let filesystems check for
unsupported xflags while allowing supported ones. Can be used in the
same way as fileattr_has_fsx().

Also make fileattr_has_fsx() a wrapper around fileattr_has_fsx_mask().

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 include/linux/fileattr.h | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 0b93f9609284..16acc61c9af1 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -64,6 +64,23 @@ int copy_fsxattr_to_user(const struct file_kattr *fa, struct fsxattr __user *ufa
 void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags);
 void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
 
+/**
+ * fileattr_has_fsx_mask - check for extended flags/attributes
+ * @fa:				fileattr pointer
+ * @allowed_xflags_mask:	additional xflags permitted
+ *
+ * Return: true if any attributes are present that are not represented in
+ * ->flags or @allowed_xflags_mask.
+ */
+static inline bool fileattr_has_fsx_mask(const struct file_kattr *fa,
+					 u32 allowed_xflags_mask)
+{
+	return fa->fsx_valid &&
+		((fa->fsx_xflags & ~(FS_XFLAG_COMMON | allowed_xflags_mask)) ||
+		 fa->fsx_extsize != 0 || fa->fsx_projid != 0 ||
+		 fa->fsx_cowextsize != 0);
+}
+
 /**
  * fileattr_has_fsx - check for extended flags/attributes
  * @fa:		fileattr pointer
@@ -73,9 +90,7 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
  */
 static inline bool fileattr_has_fsx(const struct file_kattr *fa)
 {
-	return fa->fsx_valid &&
-		((fa->fsx_xflags & ~FS_XFLAG_COMMON) || fa->fsx_extsize != 0 ||
-		 fa->fsx_projid != 0 ||	fa->fsx_cowextsize != 0);
+	return fileattr_has_fsx_mask(fa, 0);
 }
 
 int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
-- 
2.56.0

