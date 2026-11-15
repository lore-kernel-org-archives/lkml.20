Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777009;
	b=oEQ4C7huURybJgbwPG/0UR4s3G5mLio3zhU8Pbf2oj9wIQ4M5GdkqniFU+ZR7EYS6IP3
	 WOO544FCwJsDZb+lD3wIF25rVJXqbaLEYlgv+KHrA6Q0WjkgllFP6MpRDzQNtFW9AZksu
	 LCRISzrEVvMeeMOrjEnAowqSCCMztMRQwTrq+qJ9nW319f9zn1qidL70ydcnUi7Qa/owy
	 H6q6d30C1iVjt549lV8GW4PN4ek7L9mZE8g0uBD8ZawIwkWO0IGm2fD0KvuWbbu36GOqL
	 9c3AmAwlV9eF3YhrqF8JDgzMQTQ80q782V3q6Q0Mvg2BqavqXt8iwJajtsTUY8rIMtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vlAOOqvdVdKcDhX1498cVDfr4IVfu30LnqK+9Pi/SVM=;
	b=dcngz7yn7EEmLzs1TFht0bT3W4erYPc8ycy5iiP8xeg6yGLD030URHfaTBmM2UHD9SIE
	 lOMU3VwoBI7MG0jjL5GWRqJG50+7cAzhIntOPGWdUMdOwlOGv1WTtLtqqwcDk6Uf8Pks2
	 dPe3VgFAaKyN17bTyU/WLW2aDtY4vFLgCsfNPnDUvHM1CEd9jRGNiYEXfV2X7dkm7yfos
	 nJ8XtST4e0ujUsrurb0gEN/M5cWZ1LZ44O7/NHChCxyGkscl3/tEZgrifwwd/AbhEgQh0
	 QYdDZIdH74Log35Mg2O7tJMmWH6OhQ6w+gqaL43fhVB3Zu9rTKtv3KuwuPhOZpaZy8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=guaYaNZk;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC07E606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC07E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=guaYaNZk
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so1273791b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777008; x=1795381808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlAOOqvdVdKcDhX1498cVDfr4IVfu30LnqK+9Pi/SVM=;
        b=guaYaNZk/CmHtjGyoHywjpKtBpLnajf+xotGjJMBqKnv9tJF/WAP/XxAh2lIXjql12
         v5eZ0DcJH5Vo12/N1BcnGUd4HeA1hV+JHp+X8mUYNawbcYJLEEsA21POdvcRKGYTmUfO
         vo4nRJgc9USgqxoflly8wARJdpLkqVgfZatztMQNDojWjG/c8wEitj2smbnshnN5P9mL
         k/zIvzjdRSO84V5F26gltuIoQxZfdGvPn20gPynkxO/RWCH5I3vEUKie2A8qj9jKZYQF
         ehaMi/hZTeXyKJ2eGgY29MF4JyF/AjTSgNVVIk99n6w5epG6FAe3nWuLsSFXt3Ty/FA/
         QA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777008; x=1795381808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlAOOqvdVdKcDhX1498cVDfr4IVfu30LnqK+9Pi/SVM=;
        b=TAjJTYavRm3eDRuHX7TX2pONqgGe+0zrCO5PGyBMc8uNyN6vYKze7SNFxHJRx/6qVJ
         bVQUAnkrcr+UI5j4xJE+m9hrk2D1AkcicQY3+eetSOH/UUyqlnBCdszEQqaLXX54qm1D
         JYt14XXk/eO7HWtPk3abwK79ymbPRAt9A2cMNekr8OzVGuL0LZGeA74IqsUNU5OJcgow
         ljf3Mtehs8fBLPGLgfJUe9EWzXd2yP3wjPKfzMvmrtCm8pk96Rk5foZO5HFyJdg3/yZA
         wFjyrr9F/W9tSy/9XKyFRl1mPoY4CJQtq6h1N/g1BIx5lEU6QGpYenfude1tPAtWLK91
         tohQ==
X-Forwarded-Encrypted: i=1; AL+hErFKTGej3ckf/ns/TNkLu0Hs12Gh6TJmu8rMeh2c4k0giH7c8kZKy1V6AdvvHhdeuQZhZe/uNd5ciSTxfjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GVVSvgq6ZLWIdjBmZn555Eyyz7CNbf07M74BmzkEqyoNFUxvO
	NFuxrZ3fQrqfJv5JSGLP9dKyBxVdSSE8NCg6YgTRfdBM7nsULtiBFOQJ
X-Gm-Gg: AYBFou0QqU6gb49HwTIdKWtQRL7fudzAd7ipfovMFvgICw2g3FSN9lLbNjJm/tlNpJk
	h4p2Eo+pBMAx/S0acUMYu0pyZUNn7m7LV4VICfBS/h724rbtkOB3eFgbHn0GzNVB6BP5myU54Tv
	/Hk3LjjlUYGzsMTFNMPRuUg8jAEOI9sefCRkhRLKwczKYZifCeh7+tjVSQYFKEYENJj+35eCXvv
	HHaWimYkAYFjYw73OJZbHfh/AVJvIIoobmOQQpku5A52UypUBPlCE1lGnFwjrd8vayAIbEMAdjV
	aLo0B4V1y3PCmtSB5GAuEDBXvB0Hj4wJjvewi2428zG33X5B9bzmdeAPlVW11hfQ8FomingniEj
	wfzfMAPP6Q903hndQZXVwuTbanf4qhy4rq4bQC89VLg92+R4TzzoRQcpS0AkVdKKzyURAsY6k3U
	uEyZza+D7+qlcgvVDlU0KUkUAJN+yS8HWjnX+y9bgxthB782OmWHo3EPxcjOmMMjOHcl6LjHNTo
	zcfN15szbs4wSHrXruR0mdgWlyvkjOqStw8d5S5Wheo1BBJjf8LjRl2YPddWvFWKmST4IV8x1mU
	XfOXLwOKAY4nDtF4wPMel146NAn0pWB/0dk9iLUX+GKfgXXL3Q==
X-Received: by 2002:a05:6a00:369a:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-8beb7d18ac8mr8266410b3a.52.1794777008100;
        Sun, 15 Nov 2026 13:10:08 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6e7f5sm2892615b3a.25.2026.11.15.13.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:10:07 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jan Kara <jack@suse.cz>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Matt Bobrowski <matt@bobrowski.net>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] fuse: reject embedded NULs in readdir entry names
Date: Mon, 16 Nov 2026 06:09:48 +0900
Message-ID: <20261115210952.2140036-2-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
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

parse_dirfile() and parse_dirplusfile() reject '/' in dirent->name, but
do not check for embedded NUL bytes.

Unlike plain getdents() buffers covered by verify_dirent_name() in
fs/readdir.c, FUSE READDIRPLUS passes dirent->namelen directly to
QSTR_INIT() in fuse_direntplus_link() and instantiates or aliases live
dentries via d_splice_alias(). A dirent name containing an embedded NUL
produces a dentry whose d_name.len extends past the NUL terminator,
which allows callers such as inotify to copy uninitialized kernel slab
memory past the NUL byte to userspace.

Reject dirent names containing NUL alongside '/' in the FUSE readdir
parsers.

Fixes: 0b05b18381ee ("fuse: implement NFS-like readdirplus support")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 fs/fuse/readdir.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index 1f6cf565477f..e8b47c2a9103 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -126,6 +126,12 @@ static bool fuse_emit(struct file *file, struct dir_context *ctx,
 			dirent->type | FILLDIR_FLAG_NOINTR);
 }
 
+static bool fuse_invalid_dirent_name(const struct fuse_dirent *dirent)
+{
+	return memchr(dirent->name, '/', dirent->namelen) ||
+	       memchr(dirent->name, '\0', dirent->namelen);
+}
+
 static int parse_dirfile(char *buf, size_t nbytes, struct file *file,
 			 struct dir_context *ctx)
 {
@@ -136,7 +142,7 @@ static int parse_dirfile(char *buf, size_t nbytes, struct file *file,
 			return -EIO;
 		if (reclen > nbytes)
 			break;
-		if (memchr(dirent->name, '/', dirent->namelen) != NULL)
+		if (fuse_invalid_dirent_name(dirent))
 			return -EIO;
 
 		if (!fuse_emit(file, ctx, dirent))
@@ -307,7 +313,7 @@ static int parse_dirplusfile(char *buf, size_t nbytes, struct file *file,
 			return -EIO;
 		if (reclen > nbytes)
 			break;
-		if (memchr(dirent->name, '/', dirent->namelen) != NULL)
+		if (fuse_invalid_dirent_name(dirent))
 			return -EIO;
 
 		if (!over) {
@@ -461,7 +467,7 @@ static enum fuse_parse_result fuse_parse_cache(struct fuse_file *ff,
 			return FOUND_ERR;
 		if (WARN_ON(reclen > nbytes))
 			return FOUND_ERR;
-		if (WARN_ON(memchr(dirent->name, '/', dirent->namelen) != NULL))
+		if (WARN_ON(fuse_invalid_dirent_name(dirent)))
 			return FOUND_ERR;
 
 		if (ff->readdir.pos == ctx->pos) {
-- 
2.43.0
