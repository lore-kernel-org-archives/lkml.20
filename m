Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091104;
	b=AStJHC945syP5UQHI6UsqVE9dzeZ658DNQzn9SpRbtMtXWF0wuJgtRDZnW5knP9Wpmx0
	 4FT1CMwW7kYJAuEszZyhxSHdHz+ptteFaXP05EHUfjjOsXfMd65FABOZ3Rmb9wzr3Uywz
	 1QOeglTL/ZXA5G/Mz3EtFRP4fxrSll0lyCjVCy/qNv/VzRAySy2h4uD/kTY/7uvO4HVYp
	 UN9xZm6nDfXYW6/1Z2fSVWpnhq+8Lw107O97Fb1KZ3hnvehtT097J131Kmm+UI8kStFfF
	 +SQCLUPty71uy/RzCuQPxdBuNlvX3mUjXCabMUQQe7N5CYDigqhy8dcGznwIT12JO8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QHhOVuc8SPWEac70B9W5j5+x2XV5aSw2etuC6aoVzBw=;
	b=f1rKeHfq2QjFjgIFCFH78QT4WEnF0P57RMBse4wqmr//5RVN+Drr2TR1w3uMAaagIp0q
	 rKmY8SOAEn/bid/IFri7GzOx1hSIe4TZJftV9Accy0PD80vw+iSuJJXsDhH244+bpWA6D
	 Ap1K9oPeUJSpklwo8isobVxrPjE6xQINeAr+lRiT/XvT6uCRHZNZYVmdcnWLiEr98Pm+b
	 2GmA3ZN3Kb/Sf2BExt1D/+scWCRBUgA9MYAJDdbwXlpXXYUESPeWOr/ZVNXPUkcetKd7z
	 l+1tBB8NbVHyiu6YXj2YmLyZvUmPB53kDxOpTbhvM/4HRI6NFq/+CFeIziTxeoNTGvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KtDHsPxr;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07665606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07665606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KtDHsPxr
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26202755e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091102; x=1793695902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHhOVuc8SPWEac70B9W5j5+x2XV5aSw2etuC6aoVzBw=;
        b=KtDHsPxrGgc+j7glKwphtDQsr/vlZOc1AIKx7Mws68HDZXv1sxqspkNym3VZ/sjtif
         SR9b5CX455vkNZouBan0CmiHmeYdy1juaNvZ+C/23Us/OV87ytFhXyiJGtp7jwbDk5xh
         lI71oiCvodB/gbR+XBIx8Dd7smbQ48zfp2tUiBSZWLQeeUj/ficey5kGyBbG6LOeR5qU
         bUm5R1pJ4j6S2PbSspGUNmIoylmR7P3YfQeeW5Kxzj//L3AMyi9dHFDxf3jBHY04buwm
         BSiZRblETwW+BmM7/+P34wTZ02fHbotwTiQcM00V+KMCewGwt0WN3mSnEjXHC6IprceL
         SXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091102; x=1793695902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHhOVuc8SPWEac70B9W5j5+x2XV5aSw2etuC6aoVzBw=;
        b=N66jh6sJzqdQL4a8ofed2viZokaHARx9gV5k87bQ7tNZnZ6RATLlUxRIpcPHI6LJcD
         w5Xm1OnksBVFqbljClyxp+UE0Lz2PT8t1uRjSMlsn17tGTkd5x2TcuR+mpdfYUoBsy6P
         lcLAc8N/eNVeSmv1BDeqxpwsc7kKiHO6GU/5eF/tcJ9IgSgxw6Hb+cT/qmYeL7Y31kS8
         m+jqQYCBatDYHbdV9VHNmrZ6DbFWDJ/jRsGG/Zl3TY+9X4D+GhAoY2OaemWFlvbSAi8j
         Y991jnHyMT+pMU2D9OuO2logtJSPcJK3l00lgAU0+/hwbrAcmDYYbY2sEGBVafO/63xF
         8W6g==
X-Forwarded-Encrypted: i=1; AKwUvBy+Ovp3QrhQrSWF7g+QswALSNKzkkxYgXHn4s6E4dlSBJbYD05kBzS24J2sZZqHXv27vS2OtRmBoTPYeag=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX1FnlHRobSNLjciVFu+ljTcUfiSCFD3nyU/MJGDcbjf9B3mc/
	5jrj4Xwr6AXHoawW0HjPcIkYG2lMk99O9a/JY6EeWFP3/XWWUbOEecVz
X-Gm-Gg: AYBFou1GSW5SJ7RP7ZSW6cj62pBmGZYKNNlYMhTUrmVW//9MbFBS/9X9MzTbyVLwane
	g3rAmuorqHKcSIj41wmqV6r4+7AxRQucl7lh12fNgizKeqpG2qlyPBr2Qkj/Yr1AoMqQ+lt+aFl
	Wh3I8MY4Vvb6V6zJO9MxMAyVpD163Ekd45qAK0yg0kabTe+erhhP+z5cAr31QbFD0sB/mHqb16c
	1nSmnFwtjcf/uCtvid7I0HGqMdFQp/gJR5Q79DTuTkO/iwqSdlj3IUJIApR/UwSvOTNd0yT/n18
	S0NfDwHw0hZPY4ukfgGVw8ctkdYotfkQmC5+IJU1J8avMytwwWpD2l1CYV3Dw9g4mNTeA6zsj/r
	q2jCkA6qaL4Q+Qq49AJ29wXZBtOLPERhjV/21zdSnxx4x3bYnmkpl04LQunQRO7Qank3Xt5LpQT
	teUTwM6xtGH9eIAnjfJz4mfTD+OuNbcY4rGHICfncEEZ/7zrQ3A7Vxdotm9280+6smI451H1PA4
	0r+ohSX1fwPhwOXwWjDtQmk1Y7xwkJfBeRXawY1XH/artIvR4Tsi/YEP7oFkSmzfe1mux9KTQ==
X-Received: by 2002:a05:600c:c0c9:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4a587b3e000mr90772595e9.13.1793091102146;
        Tue, 27 Oct 2026 01:51:42 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:5658:786c:2fea:4768])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm310495765e9.7.2026.10.27.01.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:51:41 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	David Disseldorp <ddiss@suse.de>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] initramfs_test: exercise the oversized CPIO namesize guard
Date: Tue, 27 Oct 2026 10:51:39 +0200
Message-ID: <20261027085138.4107590-2-thnkslprpt@gmail.com>
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

initramfs_test_fname_path_max() uses a directory with a nonzero body.
Such entries are skipped even without the namesize > PATH_MAX check,
so the test does not detect removal of that check.

Use a regular file and terminate the archived pathname early after
fill_cpio() has encoded the oversized namesize. This allows the test
to detect a missing parser check without relying on VFS pathname
length limits.

Fixes: aaf76839616a ("initramfs_test: kunit test for cpio.filesize > PATH_MAX")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 init/initramfs_test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/init/initramfs_test.c b/init/initramfs_test.c
index 1154547721ea..32d4d3e4e6c7 100644
--- a/init/initramfs_test.c
+++ b/init/initramfs_test.c
@@ -474,7 +474,7 @@ static void __init initramfs_test_fname_path_max(struct kunit *test)
 	struct initramfs_test_cpio c[] = { {
 		.magic = "070701",
 		.ino = 1,
-		.mode = S_IFDIR | 0777,
+		.mode = S_IFREG | 0777,
 		.nlink = 1,
 		.namesize = sizeof(tbufs->fname_oversize),
 		.fname = tbufs->fname_oversize,
@@ -495,6 +495,8 @@ static void __init initramfs_test_fname_path_max(struct kunit *test)
 	       sizeof("fname_oversize") - 1);
 	memcpy(tbufs->fname_ok, "fname_ok", sizeof("fname_ok") - 1);
 	len = fill_cpio(c, ARRAY_SIZE(c), false, tbufs->cpio_src);
+	/* keep namesize oversized, but give VFS a short pathname */
+	tbufs->cpio_src[CPIO_HDRLEN + sizeof("fname_oversize") - 1] = '\0';
 
 	/* unpack skips over fname_oversize instead of returning an error */
 	err = unpack_to_rootfs(tbufs->cpio_src, len);

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.43.0

