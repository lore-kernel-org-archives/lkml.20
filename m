Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389705;
	b=C7yNI6veImETxQjIG1nVB2npKM9t+uYTd1uTraaKHniTj6h0uLy7tuFpWZkz13siAujw
	 J6Cv3Ro5n+uZSad5Gt+PHXwMZePh3PkEGYQlMTtyG4RizUSFxisByl7t0z5BEAFQ6rDA4
	 fSmPWNkPY4N1UClWKoMeYU+BBXkPAXQ8YxDNHYgts2Pc/2o/8B9GT7V7vIsv8ArvRLFpW
	 rSSiSvSW3WR1zwbVR5d+vqAg9ipNdL+Kw8HTejcQGU5uZ21Wj/B/Hy755SWXSiB0eO46g
	 31+m08bz5rVIAn/PhTA4czYjrrIqHmvsVJnxt1IgppsEn1+OfCGIPmfYfKjEsX4JSGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7/ak2wJxgQz/GEeeix3feX0c94ZhF3VpppiIw7196jw=;
	b=DweBu+3XgiQHo6dRmciKnenjW49ZbNxWA6dMoqRwmSgZw1O45RR9rAFk5/FFOpE8pw73
	 UhlzI+wISPrBxf9niWIGku7w1kWPFnNsFsyQW0ABgWxj2yixBEoPGFiPDWUdP9NHw6Q2y
	 2XxmgrAKgWE1INSzYTWogHSmuejBASHsfqb+OYhBpjtdvNxckGE5aauuLIM2umtHFgaI0
	 OgUCi2iY8aiC4rkEpDTUptQ3EZzb6IBlXCz4aeBsoEiekm7a01KdiKQQaNmjY011SlRi+
	 7OX1J3kIF8ha2mV7Q9S2sCRGChfEavmhnLutma8Ym0Jr+yn1HRJ/lxsLsZ/M8VkomYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l9FLmy1L;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A93606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A93606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l9FLmy1L
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so2755739eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794389704; x=1794994504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/ak2wJxgQz/GEeeix3feX0c94ZhF3VpppiIw7196jw=;
        b=l9FLmy1LIuNJsn6YZZr/Jt0hy7PbuSSPwBSnGzgLvX2eVGphu8bnFNGiEiMv8xiOVW
         oSZgjLYLDfua/V0qgvNHVoZUFdmH+4zaRSNUM3rlwP4tSLBgucoswNDIZ6RMpLYmvZgc
         +VH4aFwf2/z2V608s7MXRvqyUl77L/Ev+NLVzT3jwvwsj/glo087iVHd46CDT2siZyN8
         bJV9K6rZg8U52HPXIKYJUTt6bHmcq6JTnDElUmyoExgULd9HLYwr8LapaOkKOz3wAjHE
         scOV/j7tz5DyA/C96wX9ty3kSAs0qXg5IIg8bovl7ndGAXiq92mREETbj2IidFIlaEHh
         Me6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389704; x=1794994504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/ak2wJxgQz/GEeeix3feX0c94ZhF3VpppiIw7196jw=;
        b=1WVOM5h6iLFt2IkjUM63siMwqB0dHjm8FX7nwn3lDuR8iETbosUCqv8ITuGQ3IfXEj
         0WO7uA1ZCKdSE8oiXXOKbHUOWFUBoGd4CvM9QO+hrCTEQP5XczknAmyvLRMI93CdoHbL
         lAncuW2NJD2uWkzVvFjuHu0Ho2HQlgAFoPAVWcU9I8+yV17tghu6KeVHmDLF1SMr/tOq
         KU3hEG0KPJ6BCltTO9HIQltAxHY/bpRgamQeQbB1AcZvwrnUEVXqYtiWJQQBbVonqWX/
         yOfK0pIFsUd3HkO4I18pu5ondRB+i4ZpkL4jh6ukbmBTkfqcVMoJEOGfi9/PEOds2vrk
         tBBw==
X-Forwarded-Encrypted: i=1; AL+hErHtzq4HW4fu71v/w4hRRDsV+epfffM4FKwW46P/LBJA9FfBSpRAMwCNckuZ6ufNwcyqXavByuwg8X/oGtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6QjiZmnXgaQzsDE5qK7sizJs8eIvQFDfEC3WAIb2woBtn7jn7
	Jfo5ruqEx5sV/CwNf1ZuFllzHshJc4tLIdSo8e/aBJnWQMtq0B6S2XY9
X-Gm-Gg: AYBFou1iWBJ6TIXDTT+pycM0axP33xv4qm6Oii7dWDnWX1uUkjjBw5BSvN8ahqvqjVK
	PunBwbGWffLUerL6E1HaS8z+H4RxfrX17HeP3nXWzA1ZxhuaAw82gbd5Fq2PfDjlHslEpy/rLW2
	Ta9VD3KV4IhnIVj6FGvfBs14w56Pyi2jwHS+7Kt2jlMQTJwe6D1DGLFyteHKW8aFSYfnsVHkvMA
	qPuLPg3dBLMtHvoI/HRMtVZ+rSQZSlHSt9gGOJTq98eZpKOM0YQSA4vTiWpgff3zZ0pvA7je2/R
	wyAfBQj6VvlZjsaPG+6pf2Ps9SE2ls1BpNG9jwbmm0GycCBD2tBAP9NZD44+CXZHEBYbQhHO9bm
	nj6xRhAzH4jhYscaSKw3IGcwSuGNnbBLaw4AQlPIaIzWotmrNJbFP5YBGSO6/lcwA78oL2zuLlv
	AebBq9wDQhMOC35dlPc0Vb7VmCFaMeDt9WHOYG4AawsfqneM16xsg/vBbtUpwZNKlXAAw2a2Tx2
	IAmftYw0rY1DzVbfqY9veiwoHmA63xxUaGoK9XRsXgKk3bi37ladETFKvvt7jIEhLJger59yRSO
	uY2+JVAysSQ53Rf/Dt8sMDAgF3kF8/p/5U1dnP+hvvwbWw==
X-Received: by 2002:a05:7301:2424:b0:36a:21b8:b6c4 with SMTP id 5a478bee46e88-376851ce3acmr2539201eec.8.1794389703938;
        Wed, 11 Nov 2026 01:35:03 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe3261csm12625718eec.4.2026.11.11.01.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:35:03 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH] ntfs: trim the sizes after a short write
Date: Wed, 11 Nov 2026 17:34:59 +0800
Message-ID: <20261111093459.660484-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_file_write_iter() moves the data size and, for a non-resident
uncompressed file, the initialized size to pos + count before the copy.
__ntfs_extend_initialized_size() only zeroes [old initialized size, pos),
so the range [pos, pos + count) is initialized only by the copy itself.
When iomap_file_buffered_write() copies less than count, it returns a
positive short count and the error rollback at out: does not run.  The
file keeps the size pos + count, and [pos + ret, pos + count) reads back
whatever the freed clusters held before, also after a remount.  A local
user can read the old contents of freed clusters this way.

Run the existing rollback for a short write as well, and roll the two
sizes back to the end of what was written instead of to the old sizes.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
A reproducer is available on request.

Tested in a VM on mainline b3dfbde62cf1, with the free space filled
with a known pattern first.  Short append of 4M that stops after
1056768 bytes:

                     write()   size grows by   old data readable
  before             1056768   4194304         3137536 bytes
  after              1056768   1056768         0

A short write 1M past EOF gives the same results.  Full writes and
compressed files are unchanged.
---
 fs/ntfs/file.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3213a0c9f96b..98bb3d5d420e 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -928,10 +928,21 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ret = iomap_file_buffered_write(iocb, from, &ntfs_write_iomap_ops,
 				&ntfs_iomap_folio_ops, NULL);
 out:
-	if (ret < 0 && ret != -EIOCBQUEUED) {
+	/*
+	 * Both sizes were moved to end before the copy, so a short write,
+	 * like a failed one, must take back what it did not write.
+	 */
+	if (ret < count && ret != -EIOCBQUEUED) {
+		loff_t new_init_size = old_init_size;
+		loff_t new_data_size = old_data_size;
 		int init_err = 0;
 		int data_err = 0;
 
+		if (ret > 0) {
+			new_init_size = max(old_init_size, pos + ret);
+			new_data_size = max(old_data_size, pos + ret);
+		}
+
 		/*
 		 * Like ntfs_setattr_size(): __ntfs_attr_truncate_vfs()
 		 * expects the invalidate lock held across the size
@@ -940,13 +951,13 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		filemap_invalidate_lock(vi->i_mapping);
 
 		/* ntfs_attr_set_initialized_size() rejects a resident one. */
-		if (ni->initialized_size != old_init_size &&
+		if (ni->initialized_size != new_init_size &&
 		    NInoNonResident(ni)) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
 			mutex_lock(&mrec_ni->mrec_lock);
 			init_err = ntfs_attr_set_initialized_size(ni,
-					old_init_size);
+					new_init_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
 		/*
@@ -955,13 +966,13 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		 * the uninitialized tail, so skip it unless the rollback
 		 * above restored that size.
 		 */
-		if (ni->data_size != old_data_size && !init_err) {
+		if (ni->data_size != new_data_size && !init_err) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
-			truncate_setsize(vi, old_data_size);
+			truncate_setsize(vi, new_data_size);
 			mutex_lock(&mrec_ni->mrec_lock);
-			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
-					old_data_size);
+			data_err = __ntfs_attr_truncate_vfs(ni, new_data_size,
+					new_data_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 			/* Like ntfs_setattr_size(): stay on the durable size. */
 			if (data_err)

base-commit: b025f526c5d04929212c9d5fb7ffc96608f3eacc
-- 
2.43.0

