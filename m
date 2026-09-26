Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7583638F651
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396968; cv=none; b=jqtMROwfsNvBgNm4aZLAzmTOo91G91SDPyaQmIvw7UVo/FteFTQzsrh2KINLXi0IegvAm23YXUwQC9yHMKQFd0nuOi52Fbfzl5XWWprSNU5kdgE045HhXxp6mzL1/0HMuRvqUfh6a+4GUleRGfeh1O3v7HjOPMwfgcHimWphFKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396968; c=relaxed/simple;
	bh=X7V+Jn5Qq3Sog5oU+YzvPzTUvdvvbvIZvcwrOUk4nQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=flJ0DJNIxFBIz4QVBPZyiSJdFgsvOWljnF/s51AUhosJVask6NQg8k10FH8sZLc9fH5Xt5BbJ1yrXDkwiasNn1nUYV8RMZWG21gvjIh9JMwfRaFPhTxfa3uR2sJrvZ7byEVkLUd2zKkTX0XEKuKKbUfsbTvp+TaNiAfG12SL8zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWgn/uEB; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWgn/uEB"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32dec843c37so2281046eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790396966; x=1791001766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zF7ToF2Odw+9aOZdfGrI1tThap+ZGFopFEIX1DDCAew=;
        b=LWgn/uEBmAhhYINpinGboTdDAqNjzk7flvDs3/j4gdjXWHa3DXvCw/qpTyPSG3n+0I
         4/hlF1sfiKR9/iV4tCC0ccE255eMiHKFYDm0YJLF7+V+dkiDLJxYK0zo+7RQn7XnosM5
         OGKTxnKaf3hJjcUl61g7p7L4M5YX8llsR26CytnQybcRFyHYG85TNo+ikSznCCu3r42O
         QZAquASP3sZ/Vm+1X790BxHdfLnxk3gbTJ+Tb+hUaqzWfSqd/QNWjFgj1Ui/+lPxr2qO
         qs+HxdaW0BES1hnX2B4hqM/2zqeBCW1B+0x+c15VIAzvtTfggOOBDKc730Tf79EeTfCc
         8/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790396966; x=1791001766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zF7ToF2Odw+9aOZdfGrI1tThap+ZGFopFEIX1DDCAew=;
        b=ZPbsiWZdgqwqZTkfiNZpcgSfzjGiw1lTEr577js+jqVaFqKAW4JP++RnQQZftV6dUq
         EOcaiH/izKS97btMwzaGpXYXTuwIisNd1lqvgyiJQUyUglabyVJTIBLwR8JXHURWgvoQ
         YwqJYkIIDqnyhhAINgiYhFlQ4h9uwNLiIaI0EwuYhQyRLOzaH4hgzs7TOVJlgRtjiaFk
         qcCvcqUD7Oqi4rXe45dLQnFQ3dwT9C4VMepTZZndVA352+Ket/QRiEa1lqYroRTw7jHS
         cTO7KPXx5dkie+d1qY8gVQSfMe6GGBWQMYUxk/aCGOeNZ/kbEF/hNK95+vGlHgHNgzs7
         PuaQ==
X-Forwarded-Encrypted: i=1; AKwUvBx64kdVUyEBLbxX7xHHBsDKWsl9gndB3zXWBG92jn/QueVlPOJ0iAXmNZpVzpSjCEG4sqiQdl/SFAJ+4vo=@vger.kernel.org
X-Gm-Message-State: AFuF++ny7g/QDtFTSBi6vahDIIOfEJ7q5KeT8/ALOMdHUbyXap6lztht
	Ud9MC2znbe2294jPQIdxy6QbBmsLbbl8gyoO+zM1phUQDM08zv4Rxcc/
X-Gm-Gg: AYBFou1nnhI9T2HjN1JhCigzT0f3d2dotAXG/OdfGvwZgSl1WZ0zYwebBfGbrivJt7I
	LCXRkjPpuSqgZBNVnbEWNMTP9r6uLRcr6WqetAqFsf5MxuGiQZnVHJxO7KL0WqsJtk/jLBjaPNJ
	jRanfWUZEBD2NX1yWSEbBAvZkLc64KdzoE2t1tjB4Fr6CeT9Epa8BeUa8ArdA3FwJi0w1UETFXt
	48uiahOGkgGN4x/15h+EoJuuQrUodXa0+k+DVVCclnH+LlD2Nfy9tCm8yw98nF9qAREnsvkqhhZ
	bLTiMmOwFOuheo1KAKQqup3k7M3sbuAwlRcstKK247EmkvyHfoQJyys0FvjDpS/UbQcqPj8Gnb9
	cFGJO0pFaOjdHLzYZIPu6PVVIv201vZD20gN36ArMaVrnEGnwe+Kr9kwMpU8N/MhAY+8wTXb/EM
	Lir1qgAMnDTQZW3wh4vllYcdH0hFA1jfw2Unqql31vYDz36uJMko2Nej/XRw42NgGAfc9Wa3fLl
	gkI2i//f4/TsK5lptlm6MSeipoEWt2Lw6fO/GwwfSvEwFPQhv89CECTL37dxIKq4uwpoDm+4doV
	nObh4tiOzuJsQ/8lGzn46sofDZIjGOZO+BVcQsubmhzm7ctVLkdwUc8EwCU=
X-Received: by 2002:a05:7301:1a02:b0:33e:84c3:a056 with SMTP id 5a478bee46e88-342710ae7bamr1860743eec.17.1790396966424;
        Fri, 25 Sep 2026 21:29:26 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm6342963eec.10.2026.09.25.21.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:29:26 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] isofs: pass the name buffer size to get_rock_ridge_filename()
Date: Sat, 26 Sep 2026 12:29:15 +0800
Message-ID: <20260926042916.3277409-4-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926042916.3277409-1-matthias.goergens@gmail.com>
References: <20260926042916.3277409-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_rock_ridge_filename() assembles a name from one or more NM entries
into a buffer allocated by its caller.  It is not told how big that
buffer is, and instead stops adding NM entries once the name would
exceed NAME_MAX, relying on the callers' buffer being larger.

Pass the size in and check against it.  Both callers pass NAME_MAX + 1,
so the behaviour is unchanged: an NM entry that would take the name
past 255 bytes is dropped, together with any that follow, and the
entries before it are returned.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/isofs/dir.c   | 3 ++-
 fs/isofs/isofs.h | 3 ++-
 fs/isofs/namei.c | 3 ++-
 fs/isofs/rock.c  | 8 ++++++--
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/fs/isofs/dir.c b/fs/isofs/dir.c
index eebea133094d..dd8958617340 100644
--- a/fs/isofs/dir.c
+++ b/fs/isofs/dir.c
@@ -186,7 +186,8 @@ static int do_isofs_readdir(struct inode *inode, struct file *file,
 
 		map = 1;
 		if (sbi->s_rock) {
-			len = get_rock_ridge_filename(de, tmpname, inode);
+			len = get_rock_ridge_filename(de, tmpname, NAME_MAX + 1,
+						      inode);
 			if (len != 0) {		/* may be -1 */
 				p = tmpname;
 				map = 0;
diff --git a/fs/isofs/isofs.h b/fs/isofs/isofs.h
index 47c43a3c6a61..a2d28a23e892 100644
--- a/fs/isofs/isofs.h
+++ b/fs/isofs/isofs.h
@@ -115,7 +115,8 @@ struct timespec64 iso_date(u8 *p, int flags);
 struct inode;		/* To make gcc happy */
 
 extern int parse_rock_ridge_inode(struct iso_directory_record *, struct inode *, int relocated);
-extern int get_rock_ridge_filename(struct iso_directory_record *, char *, struct inode *);
+int get_rock_ridge_filename(struct iso_directory_record *de, char *retname,
+			    int retnamesize, struct inode *inode);
 extern int isofs_name_translate(struct iso_directory_record *, char *, struct inode *);
 bool isofs_dir_record_valid(struct iso_directory_record *de,
 			    unsigned long offset,
diff --git a/fs/isofs/namei.c b/fs/isofs/namei.c
index c65cc78583ba..9025ff74eb60 100644
--- a/fs/isofs/namei.c
+++ b/fs/isofs/namei.c
@@ -104,7 +104,8 @@ isofs_find_entry(struct inode *dir, struct dentry *dentry,
 		dpnt = de->name;
 
 		if (sbi->s_rock &&
-		    ((i = get_rock_ridge_filename(de, tmpname, dir)))) {
+		    ((i = get_rock_ridge_filename(de, tmpname, NAME_MAX + 1,
+						  dir)))) {
 			dlen = i;	/* possibly -1 */
 			dpnt = tmpname;
 #ifdef CONFIG_JOLIET
diff --git a/fs/isofs/rock.c b/fs/isofs/rock.c
index 84e0d764c210..5a5984b72224 100644
--- a/fs/isofs/rock.c
+++ b/fs/isofs/rock.c
@@ -209,10 +209,14 @@ static int rock_check_overflow(struct rock_state *rs, int sig)
 }
 
 /*
+ * Build the Rock Ridge name of @de in @retname, a buffer of @retnamesize
+ * bytes.  From the first NM entry that does not fit along with the
+ * terminator, the rest of the name is dropped.
+ *
  * return length of name field; 0: not found, -1: to be ignored
  */
 int get_rock_ridge_filename(struct iso_directory_record *de,
-			    char *retname, struct inode *inode)
+			    char *retname, int retnamesize, struct inode *inode)
 {
 	struct rock_state rs;
 	struct rock_ridge *rr;
@@ -287,7 +291,7 @@ int get_rock_ridge_filename(struct iso_directory_record *de,
 				break;
 			}
 			len = rr->len - 5;
-			if (retnamlen + len > NAME_MAX) {
+			if (retnamlen + len >= retnamesize) {
 				truncate = 1;
 				break;
 			}
-- 
2.55.0

