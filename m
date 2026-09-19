Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9618C3B71A5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789805333; cv=none; b=b8jsk9DnDNiaS/G+xHSHbGGJ+y9d59/3keCnuzXWa9U+y+mmbGjvTIbd5E362poGV1oAFpw+WGKZyzvgNvTNQX2lmbUM1aXphYga1FKM8c+7t1EN6DJIFhL0wRLET7XFWf5ODoWnFLNIIY0gsT4cE5TMFwIRmje1BN8SFjgdC7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789805333; c=relaxed/simple;
	bh=dTNAEuPJ8Cfj4AVL82cdwPejSDCCghSuTtIgvnu09B0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=myjesu/MAFrWmWAivpXXVketvPoo1LjLoNBL4T4fjw/33r4kV0SAeB64U8MnKUQ57pET0A+ZlEfTxcJB+01sdBjtgffE7I4blZqBpp1aKjDY+FHvX1wQgKd/tIvtBvmJaAyk33ttbKNEdvop6NNihIzcdMbkUIPhCk528UvpEFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHI9roA9; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHI9roA9"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so1228350a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789805331; x=1790410131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PggIYArUeIeB9ay9PFvKCxhV1IQ6cldWN/lD2KST7g=;
        b=jHI9roA9vmGrKXi/m/Ieu4XQox0uAVKgsiHvFnDdpkCXcDDBasH2GIsMQaOuzytmfR
         97TuMpNClN+q7ZcJ563lLb5hc5ucdGw4Er/n47olKJY7xwqg7xbL3N7dJwJpaxZiSkon
         hCP2SpSduFkKrNHJbBLvI0ZzBKIlPjTjhqVu7TEu09cG25ojWaApzYJrO4JYe2hRqz3G
         L0cH21qUKv9nR/Vr9tTE8CQk9YpNT+oTDoAvw9gX5e5C+EeAMJMkCyAMuyAb03ad0qOk
         0vqk57Q91qJ/DAXsX4+sk7OLgSjdvM0c9O5MH/plVxjkRWaFQLZit7wF7fjrtksszrxM
         7MVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789805331; x=1790410131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PggIYArUeIeB9ay9PFvKCxhV1IQ6cldWN/lD2KST7g=;
        b=UOR00fZCI3zIQjGsyxGFSzey6tjqYRPnSnLtlFJV0qXi099GowAn1a/x1ziTeG13I4
         XtR4T0z8xMQvUGisEc4cvE4sUxivQ0fzryJFtVtKlqG2fhXKzsJB/fGfGwr84ekiM0Nr
         UvmWiydnzcLoovLB/at4nBwGuih5cPd9csgsCKv3SV+scUhEOsjn54Zz7t/TAoPOJjP9
         PPCEv643bvoo3q9pyL8LhjC8bY+u99tte4MwXqoAwj/nMi/5Aupjki2AVjFUOaM3yICq
         h/kIVzX+NUaH7vZyhynUQOBknI2amkEEO61IKUhAOcplJWk7UMnH11hsVM5sFEqSUaoM
         qIUA==
X-Forwarded-Encrypted: i=1; AKwUvBy2Vw4gM/0P9jpKT5KQokLU5cpn8WoLbswoBLC/bxXNxW2Gg77dfveEtRCATaA81hQVVMDh6NDI3K3kQi4=@vger.kernel.org
X-Gm-Message-State: AFuF++nEP0es/eRJwne/l6mBq28FRdFypCttzEz01qX3sdX8gEMNhQqA
	gt+WJYEFJwAZPTxhEvrtflPQrUbpXmfOPD7UQFBw96QiGLCbw0wUaG0B
X-Gm-Gg: AYBFou2iPODRqoZ/ZouaVba5PP8E7o+trSgQRdHvF4uOz1u4vu92PhQLWo9NEzorq38
	JQC9d7PbgeYee+TOY7g89jce01glWRZAplmJpAYzhcWzUQYe+jF5FYjrglYY1BwqggG7r3ZC1Ny
	pL9QbBUGBLQxYS+TXbb0gXzbI5kSuVCUfNcxc9xsERM+VFo/UqDSBkl0C75lm0frQPqxcyK3DTu
	09WOdXuq2qquv1P+hcOtcLEdwqGxCdGlwzEz+U7WRCyrB1uVfQsg70/Q0rJEpxP6qq9KDr5l2kl
	UoibKh4MycNTjAINgELv8ozEMrfUgOboaOwzEE7W3ksF4nBzYh5+zi8nVXG5X39EuxxXAjRF8Zf
	n6fu5rsXvFOtw/7TvPGPaU9n2+bdVhe/qLWMs4xAaIvMt/Gqtopg0kFzqhQo/jKquSvwpWPUJI+
	fvESzuPPAVlPMIKPoU4RoCsyfh9YoMz8EWUThcC8+XyBsmhSW/ewCL+l9FYle3XrEMi6eTDg7lO
	nKbU2Gegb66tbRR9KkfRcK0+f3d3jFExxUtl75A2TztsE6YIz+1//wS2AbXpUnQfzTkLHnMGDfA
	655/1bJlww==
X-Received: by 2002:a17:90a:149:b0:3a0:27ce:38ae with SMTP id 98e67ed59e1d1-3a027ce61damr424099a91.32.1789805330935;
        Sat, 19 Sep 2026 01:08:50 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6f1835adsm2998296a91.6.2026.09.19.01.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:08:50 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH 1/2] nsfs: fix u32-vs-bytes unit mismatch in nsfs_fh_to_dentry()
Date: Sat, 19 Sep 2026 08:08:49 +0000
Message-ID: <20260919080850.3005810-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nsfs_fh_to_dentry(), both fh_len and NSFS_FID_SIZE_U32_LATEST (4) are
expressed in units of 4-byte u32 words rather than bytes, whereas
pointer arithmetic on (void *)fid and the byte count passed to
memchr_inv() are in bytes (NSFS_FILE_HANDLE_SIZE_LATEST = 16).

Passing (void *)fid + NSFS_FID_SIZE_U32_LATEST and
fh_len - NSFS_FID_SIZE_U32_LATEST to memchr_inv() inspects bytes
[4 .. fh_len) inside struct nsfs_file_handle (fid->ns_id and
fid->ns_type) instead of the trailing bytes [16 .. fh_len * 4) after
struct nsfs_file_handle. Consequently:
1. Valid zero-padded handles with handle_bytes >= 36 (fh_len >= 9) where
   fid->ns_type != 0 (at byte offset 8) are falsely rejected with
   -ESTALE.
2. Non-zero trailing garbage in bytes [16 .. fh_len * 4) is ignored when
   the upper 32 bits of fid->ns_id (bytes [4..7]) are zero.

Fix this by offsetting (void *)fid by NSFS_FILE_HANDLE_SIZE_LATEST (16)
and multiplying (fh_len - NSFS_FID_SIZE_U32_LATEST) by sizeof(u32).

Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 fs/nsfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nsfs.c b/fs/nsfs.c
index c3b6ae765..a1842e12f 100644
--- a/fs/nsfs.c
+++ b/fs/nsfs.c
@@ -529,8 +529,8 @@
 
 	/* Check that any trailing bytes are zero. */
 	if ((fh_len > NSFS_FID_SIZE_U32_LATEST) &&
-	    memchr_inv((void *)fid + NSFS_FID_SIZE_U32_LATEST, 0,
-		       fh_len - NSFS_FID_SIZE_U32_LATEST))
+	    memchr_inv((void *)fid + NSFS_FILE_HANDLE_SIZE_LATEST, 0,
+		       (fh_len - NSFS_FID_SIZE_U32_LATEST) * sizeof(u32)))
 		return NULL;
 
 	switch (fh_type) {
-- 
2.43.0
