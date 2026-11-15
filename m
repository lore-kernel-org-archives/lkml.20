Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765845;
	b=FLMAzgZbf28puB3wcu7d834jkhfPkovsi1kYVtkOo+4RryGpz7VZwn0h1dMO1eHyijsm
	 NGDJKmVbo1Ac+7F+fAF8eulkrOaUKwBvi30cTlmHaWmHNq4eoSX7oqC8p8XCgvrzOcARv
	 kgVNVSY7r/b2xMdzqs7yJZ2n+meaj0T4kpmznY79o6jZJBmogRgsMFjLkd8+xdE5IZ7Ul
	 MfURQZ3GLuHY2J86FowFI2M3ozZa0sZUsircG3dmue9fH7ftYNqbmp6PAEzqyp5pz7LML
	 qvOS1gUPrzXeYCW6tKORmQO5fzGcWiFf777k+LkXv/lfL9TTcCgrjtMwxgfAzbP5L3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jCob8yxVUbZMrzUJynGorNZ6cDsRus7pIoTivcXFIek=;
	b=TbM4iikFDV2d61nQlHAFJqZ+UwXiO9T0S7IoNK4cjAPwIjPHtz+NhAFFb+PoxC9Xf/hy
	 FLWNO79a0Aty5w2ZxC1HrUv7m9lsYXT8+9Vpdrhdl8eI9ZIt15tswrniFlPiH9KaxA+Vu
	 JSpHddOO5ppLG7L9GVkclAKNyV4Z7yl3INw0tNRSogRsSzCG/5X/xwYUpKmb83Xi66JFi
	 h6KG43lxYJ/8FmchOLcX1HrUNIBJKU0dO5mjFXY3dHOU1uWakyvtyll867b1sXbwILu7Y
	 kT4w8pGHJLkrzY7yLcPPVGdZE6g6qvJ4Hlt8V8mfNmjxiANOWwQ9sceeQSn8FN4g6NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IBD9fQPZ;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5448A606A8AF
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5448A606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IBD9fQPZ
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1063219f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765844; x=1795370644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCob8yxVUbZMrzUJynGorNZ6cDsRus7pIoTivcXFIek=;
        b=IBD9fQPZzDEKg2bdACsPtBrqMrB7RpYNzqy1KmrygLKNqfGgfMBRaPWVmtSMny9Uyo
         zZZXZUcxGun91msLJSPue4OSf8KXgtednCc0ci+LHlwiRCT7BYfwj6SD9fUlUIoUNNdM
         HjfCIWv0XLZodUGxpASoDy920nowWC6vgr7iHYUYL+7eC7K2ekWYt+yxN8xnL5lTbX+/
         iPXMXBJgcRIoFjYblNIEP9XDiGpFeZaYRykIxOLk9q0/b6fE1AF+H2k0K17e9FL8HjA/
         bPcXWcQ7jEc4YWkcaZbecSnNezqq4f/KgXnLXzb11BA99Sp4jVEommfOUsdvdRwp16i1
         ptAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765844; x=1795370644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jCob8yxVUbZMrzUJynGorNZ6cDsRus7pIoTivcXFIek=;
        b=ZmlQk8qZQ58NZY8ssk6PreilXUYtioWEgNfwuDOZQUBWxahserbhhGTp465DOF4Uj+
         pLx6VOC8WyWRbAC57S0MGLwBgZZMnv3Zz7WcChL/q3Jz79R+mxf3gs4KvW3Y+vzwA6GU
         TMuBE8s1mLWHJZhetW4Ke2edzU9HY3ior/Su4arM7jN3KI1Z5JZUbxIT4E9TRQv1ys6g
         IlTlzul1+bDXRqQQ/3JpK+7hBeU3e2pqREkzxYqOwmNY4k+PM7n55JecZiTSBTM7pWxf
         omgw4/Vbey9U4CDDj1ATiQd07dDu3ojhWAdhL7GHsZjOpSmfN6wVZvxDR3l8D3FH5H+V
         G7Zw==
X-Forwarded-Encrypted: i=1; AL+hErFYimlf9P18J1gYZGDOk/Qf23D8GAhA4jbAT3zn8+02XPyJJMx4hcGIjA2HIXywmTeIy7GtOGuBOD+rCHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GbNmdmDoZtw09oB35mb5tbPqbpawib3Rqjx3zbR60SvY1Rn9V
	AGYEjglF1pSXIKeEjVLm6jgFzo1l6VEW5j0gH8jrAkONhARUM9S5Aali
X-Gm-Gg: AYBFou2LIqTYQ5SEwRORu/xmr52SHTkKDbsRRHClg9ITNP/1a3I4sZ28g3U+PnR79lp
	ai+bVse71CBpdgiUUXMIBJVXzvG6lBCgernoE/h7k0pExjhNNdGWKe36r6HzJ6iOzgL9cw2MmLm
	jm0a0L6LJSpR8otBogQFm+AWeFdXdy435u3CBuicVD6PD4cKBPkALtNLPw3YXElnXifdcW4P0NB
	dZPiR2Nl4eiCA6qGk6EAaJy6ntQfBPA/NTy3v8CITjEJpIOXed5ni1dP6vKo66fos01KDWY8pJj
	mfayAGr4MsgghRR2gk+GQApT8P7XQCdl80L9swHLGufVH2UpS/LyU/xAC8B6Gd7+hUnowK2MDIQ
	J1yhjZeimTzZloHjOcFMgI0ad8G8Jvc00XQqXcSt+WiGxybTUcjJQP71bzQXYXsuqSx1opERZYW
	uuGQinZFFLdUtzyPjo/d/0Xusl2knKaXNq2jKauJ4apGkMM41oGxID8Y+bmJHcp1CbSD0wralNq
	cnhpe0JiodB3FJF1s/7Ihxp4D0cYL41H0LgoVjZYa1iOxhw7dRtnPtF84MKZON3r3fa0nVoKdio
	UHOB46i6m0trxJC6qACz1pi8
X-Received: by 2002:a05:6000:1841:b0:48f:d7cd:a5ac with SMTP id ffacd0b85a97d-49c6b97336emr21325466f8f.0.1794765843381;
        Sun, 15 Nov 2026 10:04:03 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm17980448f8f.58.2026.11.15.10.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:04:02 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Paulo Alcantara <pc@manguebit.org>
Cc: Chris Mason <mason@kernel.org>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v4 02/10] vfs: add fileattr_has_fsx_mask()
Date: Sun, 15 Nov 2026 19:03:35 +0100
Message-ID: <20261115180343.576773-3-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115180343.576773-1-koray.fra@gmail.com>
References: <20261115180343.576773-1-koray.fra@gmail.com>
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
index 42b92ccdc583..ba7ed3b387d8 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -65,6 +65,23 @@ int copy_fsxattr_to_user(const struct file_kattr *fa, struct fsxattr __user *ufa
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
@@ -74,9 +91,7 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
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

