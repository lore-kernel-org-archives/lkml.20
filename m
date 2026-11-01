Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793512855;
	b=eTnCnKYLBlOdkWd2LQ7DxiqDxHyzHoNzBpLKYam5EUXXKK2GTocPyaGFmdpjE2DztqfW
	 IBAL0Xf7viKf3fxhWWZ3Ebb2K1cUfMHTieJyklrZUh5uHJ3E7xWcfA/MpJee8s00P8aiZ
	 P5NSJ/Oq9y1Emd6eBT58zI3PtqKCzG91TRBdv/1DsQoHGpooLRxy8oUVpqXAN1INItKTi
	 gkkjf3l4HNYFVFx9smCOcb1mfv83+9XCK2wt0gkFg16NTkBLn1yCT/ey3KzT8AOVkEtoe
	 sarxD6nrEdcvIhC/sv1lapogybZCu6df5R0Y1dYNY79K/1wZARbuFW1Cpecj4Urlr8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793512855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9XbbjCkjt+jTYF1M8tFy6Kzjeu9f69j9G0roS6qzDt0=;
	b=1cR2Yz9Yy63TNY2ot+u7g9LNEWBtbUNMI9xYHtebUVjF/Y5gPma2OAZqX9OKhIHeNNiR
	 H+suSWy8ubk/9rN2LUSy+alDHB25IcUjFxN/CBtbMctXmI+D2DO4xAcFw3kMkxYFppDWl
	 IdweA9YRotifMv0+GJ5QwSYDUerFRkZ5F6vevGtZAwBiEdvvgk3AyEndbBPVjxPvv7OS6
	 D3uOzzMRutmIITHvUc7/kgYS9WnDLhXpP3b1m44+Bda+kVbbdKDdoBCA1qRC62pjzozDW
	 oFgaA0hzqU+ymRYQkmbAD+IIzKHxhy62a6PkZKl1Heuzu7r9rA4kLJ9jBbNaOpoTTWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HOVcFYu9;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AA5606A333
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28AA5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HOVcFYu9
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so834224a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793512854; x=1794117654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9XbbjCkjt+jTYF1M8tFy6Kzjeu9f69j9G0roS6qzDt0=;
        b=HOVcFYu9v9uQ0YlGCKM1UGTozAjfDMqMxgMIyLCeXQ/gug+Av53Jzjp9/+chnMcN4R
         tV4taWfSasLhA2kcoF55AbaInWKoH2bLpWN+G7vTfiTXt/esxzG+AFLLd5rRjf123Yu5
         yUZ53ZRAUp/3Ln819368ELxlnocxiXpX1wPgLaPk3pAP2uAupI9zaY1+QfePr9B62LUE
         0yNo3vxzaTBfYUfB+Puz/7wu+selqJN2vml7WO5iMMjJ64/S2HctjT6jUFIUbbnoxypV
         qDvvYgtowupBFVkQFqO/j5U00Y0286PBA+2sSeTmAr22MO513j/BHLkQgcEn77mtQId8
         ryOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793512854; x=1794117654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9XbbjCkjt+jTYF1M8tFy6Kzjeu9f69j9G0roS6qzDt0=;
        b=oNy/hKHK4XS/55ldpu3QT+sZrJyGIAeYHPdSFPMR5iEnkM7GyLqQpdhJrs28GBKwhD
         BbzjfQgaInVMFLL9r1GnrSOHpHwm0i3cU4wUyj6lPtOW3uelhVozbS632NRbAZKaz5bA
         OQMF/faYR4/4jKySo/hhLacE3Mwc+C8Rbi3W2BlAOT4K4/eH4PvcMEqxUXzR3kvNA5P3
         lE9GoiQikH+O4k21ZerSMjLQIka8LXnCo7wD6VFEFfychnNiLDG1n0ulsByot9fW3rd0
         wXLWq2a5B24VyywMS9kBwLDDn+IXPtIj5Sv7jGE0y3jdktnWX7OwO2R9qqr3PY+pPVsu
         4Jcg==
X-Forwarded-Encrypted: i=1; AKwUvBz7IEXxi4/w8WAmUelUS3ePij0A6ey7a/BMyHWw2ANHSOp84NCri01fyqcAltHaZpyK14SWgds1Bq/pjbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3T3sSYa6jdKsqN9PCj+VliembGm7gxQwdDf5UjEb39BZNU+d6
	1wHAXjQcWnMy3lOSDIVjClKpPFylw9RAeS36cIFUQnyz5cBJwTTekWSF
X-Gm-Gg: AYBFou0r0BF13v3R1zmQW8zrkoQ28mlPzy9XitiAiR0Lw2Olv+AKyIXUtQ2MUvMLgys
	7/91zqf0Ioi14bAQImZGnS7sA9QiyzHa/O+6oOjTA2aW7gauq3Gz/Kg3aLIuHA1Rfreh3OUoyXS
	q0ACBzQsrjk8DlVofzauWYTb/DOQs626Qt2iGlqY4+ymdXLW+c9uIQSokZdomNxkBAfj/Flnlet
	LlwwZQ1m91KwSBNDeCj26VU21AIFmDLWVeY+857qciAOyiN4FLmkbA9DNTznUULADJ+d0Dh4QST
	ipLBiC5kpLM/qc/EtgZNIKvTe+OwQzhWfHmuJ4W/h9DW71ZGk8/Y8UpRHh3huj/f2ASYg6bj19H
	drcKynd6/thi/mgJszWk33NSWMNz0O+MsaM3FmbKEJpoggLumFya80TvNe/h/0pGA6zO4AMDC2q
	m/TxLHQKe+EI15r8X4rnbASU0ndCopL6Cv2XwoCxlF64mp1osDP5ZyijwYwUi8KDCT9Fhp2TSZ1
	YULtT8q007DvbXyKXyArhTLX+kPcjLGiHhYquazNpMFj98mlH8MDVaBPaQEGQsA40ibjZn+sPF9
	entu6F96o5+mVAfReC6m9qrtx8VtKxFsZsMucED4hXQWUY1sdmwYW4/uOq2AxtEOmQp4sI96W7J
	lwQGwveJPPdQGmcLd+j7ZtJrDfNd9dCEuFYEsH7+C+/pGuy6xMUB1iPbEgi3lrX7aloLexes1qA
	Z3fIkOFtwPJQ==
X-Received: by 2002:a05:6a20:88aa:b0:3eb:3b69:77b1 with SMTP id adf61e73a8af0-3eb3b699998mr1689140637.46.1793512854396;
        Sat, 31 Oct 2026 23:00:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:600:9201:5fb0:4dc4:c510:e576:213e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d067cesm1062706b3a.29.2026.10.31.23.00.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 23:00:53 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v1 1/2] fs: reject negative offsets for SEEK_DATA and SEEK_HOLE in default_llseek()
Date: Sat, 31 Oct 2026 23:00:48 -0700
Message-ID: <20261101060049.81441-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261101060049.81441-1-sidchintamaneni@gmail.com>
References: <20261101060049.81441-1-sidchintamaneni@gmail.com>
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

In default_llseek(), the range checks for SEEK_DATA and SEEK_HOLE compare
the signed loff_t offset directly against inode->i_size:

	if (offset >= inode->i_size) {
		retval = -ENXIO;
		goto out;
	}

When a negative offset is supplied to SEEK_HOLE (e.g. lseek(fd, -10,
SEEK_HOLE) on a sysctl file in /proc/sys), the signed comparison evaluates
to false and execution proceeds to:

	offset = inode->i_size;

This overwrites the negative offset with a non-negative value before the
final `if (offset >= 0 || unsigned_offsets(file))` check, causing
default_llseek() to update file->f_pos and return inode->i_size instead of
failing with -ENXIO. Similarly, for SEEK_DATA on a file with
FOP_UNSIGNED_OFFSET, a negative offset bypasses the range check and
succeeds via unsigned_offsets(file).

Read the inode size once via i_size_read(inode) after acquiring the inode
lock and compare (unsigned long long)offset >= eof for both SEEK_DATA and
SEEK_HOLE, matching must_set_pos().

Fixes: 982d816581ee ("fs: add SEEK_HOLE and SEEK_DATA flags")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 fs/read_write.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index 676728310899..86ce8cea10d7 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -333,13 +333,15 @@ loff_t default_llseek(struct file *file, loff_t offset, int whence)
 {
 	struct inode *inode = file_inode(file);
 	loff_t retval;
+	loff_t eof;
 
 	retval = inode_lock_killable(inode);
 	if (retval)
 		return retval;
+	eof = i_size_read(inode);
 	switch (whence) {
 		case SEEK_END:
-			offset += i_size_read(inode);
+			offset += eof;
 			break;
 		case SEEK_CUR:
 			if (offset == 0) {
@@ -354,7 +356,7 @@ loff_t default_llseek(struct file *file, loff_t offset, int whence)
 			 * long as offset isn't at the end of the file then the
 			 * offset is data.
 			 */
-			if (offset >= inode->i_size) {
+			if ((unsigned long long)offset >= eof) {
 				retval = -ENXIO;
 				goto out;
 			}
@@ -365,11 +367,11 @@ loff_t default_llseek(struct file *file, loff_t offset, int whence)
 			 * as long as offset isn't i_size or larger, return
 			 * i_size.
 			 */
-			if (offset >= inode->i_size) {
+			if ((unsigned long long)offset >= eof) {
 				retval = -ENXIO;
 				goto out;
 			}
-			offset = inode->i_size;
+			offset = eof;
 			break;
 	}
 	retval = -EINVAL;
-- 
2.50.1 (Apple Git-155)

