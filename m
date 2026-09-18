Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CE73E9C37
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727873; cv=none; b=W/FDQbUEW6XtBuJ97BXscftQm5q60u6M1MLDgSPmCbaGNZzDQ30oMCynQuQmp9nyKBsutc0HD1hxukXhDEn1xFpzERZiMFOzON2RIWwySxbJ0UzwgB+6iCdn6gWFYmWmWE64IyLAH7J0PlewYTXfooXJ9s07I4Rw005wl+tG7oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727873; c=relaxed/simple;
	bh=yOS3d4wTGcZPRtNJ9LMKVyw9RDQA99oAW5sFCDHVBEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+wnboYYv1EWGBMY+qqMUIYEcSDKkLLxfdeOMsmZEaHQ9yzVC1s4LBj19y4yfduRWb4oJXvQpbVxHK6IACX54wq+K4KIjhLq5Wyl6kQqauz3puVe4qSHHGNs2oWrizg2fU9IE8zcmEsxiKgUkfwOqmY31HT9EMwV+quhxZXSBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNrEe+yR; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNrEe+yR"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f7so3735645ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789727870; x=1790332670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVsKGSa3rHCzWBEjCEqt42KvrxZBP4vaoDmHjFdo8/I=;
        b=sNrEe+yRPjGKPHEDYH4rYeKSZ3+QwBo9kk3t07eQsXEUEdb9osY/Qg2TVHvcIV5NXS
         WioADyGuTp9l4jf/kGZdoFGH+R94ADW5s4ZB85IaQ1sr2wmsacE6Mlgb88EChy+KmBNf
         VyHLt9OOpVNjoLs8oRHYcd1NJl1W4FnnZAHFfPrT3miyBv01QBoddPS/GDK/PEXjsm6U
         +SEB+JKuPYmsbfEM+vWzKmE8shyyMYN48Bb7aM0MCKIlCXwr/W1T/nr02761wnOhz6RU
         3FXiBWP+jVvZlWbveq50Buxwm64y6D34ZkuaUKUEKRLUwT2L4s/Qc35AEuLhHLvhU8Cj
         kKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789727870; x=1790332670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVsKGSa3rHCzWBEjCEqt42KvrxZBP4vaoDmHjFdo8/I=;
        b=DAm+mZHuTjBbLx2KcTf7ECdJOfWhFdjhsWxt5aT/WZlbULhAavOmTcKvdr/rcrBdbB
         JUHOqmqJMo0ncU1ZWmRfnbSD7iMdMRcdwIDK+C68w2QYI4es/I1aFZc1IxdQ9RyajXvb
         S2rzdDjuZ5UTo/wHojGZg+Ugn7QbntwIwBFRaUPpisTBAFWOnXzfMsZaGJgVXHcsvonH
         1luSmnPO37hhGYcjbL3dGx+aKjpa3eueteX2omsHb5FG4/5LL0S2aQ3l/vM7Q9ZtpyGq
         OTwRZOXrENbMs3DwuDOSmH5IorwqyhG5oweuteGPkMpkAyLqnTJBbpTchNKxclQKi9j4
         aGxg==
X-Gm-Message-State: AFuF++mD3Pws1B2CeLv+/z/DX6mYSQKGsi5OX5tBmR74+JEakll4uu8e
	nh/9ZXatOxeWJ8JH7OepPHliSVnAlEPn7/jWgZ1331TS9NiNTnmdEmuS
X-Gm-Gg: AYBFou2FfDj4cgit1cEk87SqAh+2pVZKfzgVa59qCarMU9Dj5T3SSBPKqG2nevrmtcA
	C7mcgoOdva6J/+EK7QVFa7gTbyVPQR60xOxJPKekGm1sYcDZlCMtchTQDqBsS4lY2nq6VfJgosm
	/8iz1EGogiJogX149P2j7ydpTtPCA3+3JJenC+1t19V5JTnKpFOwV/M6+xV7/v0fjjlrpox2c8u
	YvmDFEfq12TMk5BVMi9F7kY/FJydK4r6FdtENG3jwhTgBpFVsXb+pIon+H/3am1omPZBwe+0kir
	KgZhRjSQxD3DCTaAcUbbjuaD1ka8lzpH7F1y1VJ/eGBlIWgxlJkCsH8IxmSucQx/5rQm0gy8Als
	RLSLQhZrNwfVphb024ke6OvCf7ZU+luUmSGvq182uSHCByIndkCyijm41KUPafTyW1dLU01q38H
	5jOomh+ztJI2X1J+TXf7nn23+R5aAwo3qKibD/p8AZK4S4gmYTVJO6kwiJsxeXAD96sCZTHpswm
	VmMyo3jd19277Y29qH1Iy7TZ9HjeEoj4LuSwlJ/sHsJJds1BD61gfHVIge5LrHBHohz4itX90iS
	xvGDNLPjtvPOK0+qMsvmUTRsTYMQ/AYutEDiTTOQSMfIS61J4kl9xbdwtMq5MBT+NY6I1/YK1Q=
	=
X-Received: by 2002:a17:903:2445:b0:2dd:ad73:c986 with SMTP id d9443c01a7336-2ddb1bbe32cmr40862315ad.30.1789727870172;
        Fri, 18 Sep 2026 03:37:50 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb760dd35sm5749815ad.80.2026.09.18.03.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:37:49 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: linux-kernel@vger.kernel.org,
	hch@infradead.org,
	djwong@kernel.org,
	david@fromorbit.com,
	amir73il@gmail.com,
	ansgar.loesser@kom.tu-darmstadt.de,
	Matthias Goergens <matthias.goergens@gmail.com>
Subject: [PATCH v4 2/2] vfs: add FILE_DEDUPE_RANGE_REPORT_PROGRESS flag to FIDEDUPERANGE
Date: Fri, 18 Sep 2026 18:37:38 +0800
Message-ID: <94348cc10b4f6f7f8e2a58ee385d5349560c0c9f.1789653814.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789653814.git.matthias.goergens@gmail.com>
References: <aoQcvGw4UmkMKmUz@infradead.org> <cover.1789653814.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deduplication tools such as duperemove, bees and rmlint find matching
ranges in two files, call FIDEDUPERANGE on each match and advance their
file offsets by the bytes_deduped the kernel returns. They rely on that
value to know where to continue.

The kernel does not give them a value they can act on.
vfs_dedupe_file_range() passes REMAP_FILE_CAN_SHORTEN, so
generic_remap_checks() rounds a request whose length is not block
aligned down to a block multiple unless it ends at both files' EOF, but
the ioctl then reports the length it asked for (the request, capped at 1
GiB per call) in bytes_deduped, not the shortened one. The caller cannot
tell that the tail of its request was left alone. Measured with rmlint
2.10.3 on btrfs with 4 KiB blocks: rmlint --dedupe on a 100000-byte file
against a 250000-byte file with the same prefix issues one call and is
told bytes_deduped=100000 with status SAME, while FIEMAP shows 24 shared
blocks, 98304 bytes. rmlint's loop ends because bytes_deduped equals the
file size, so it reports the pair fully deduplicated with 1696 bytes not
shared. duperemove (process_dedupes()) and bees advance the same way,
and jdupes advances by its own requested length without reading the
field, so all of them skip such a tail without noticing.

Add a flag that a caller sets to get a value it can act on. With
FILE_DEDUPE_RANGE_REPORT_PROGRESS set in file_dedupe_range.flags,
bytes_deduped in each destination's info is the length the filesystem
reports as deduplicated when status is FILE_DEDUPE_RANGE_SAME, and 0
when status is FILE_DEDUPE_RANGE_DIFFERS or an error. A caller advances
by it as it advances today, and must treat 0 as "stop or subdivide"
rather than retry unchanged. One cause of a SAME result of 0 is a
request shorter than a block that does not end at both files' EOF,
which the generic range preparation shortens to nothing before any
remapping. On DIFFERS the kernel has no usable progress or mismatch
offset to report, so it reports 0 and leaves subdividing the range to
the caller, as rmlint already does.

The default cannot change. Reporting the shortened length by default
was done once, in commit 4a57a8400075 ("vf/remap: return the amount of
bytes actually deduplicated"), and reverted the next day because
generic/517 expected the old value and the effect on deployed callers
was unknown. That effect is now known: duperemove re-queues a request
while its status is 0 and has no check for bytes_deduped == 0, so a 0
with status SAME on a sub-block request would make it re-issue the
same request forever.

Without the flag nothing changes. Unknown flag bits are rejected. The
flags field is an anonymous union with the old reserved2 name, so
existing source that spells .reserved2 keeps compiling and the layout
is unchanged. Kernels since 4.5, when the VFS took over the ioctl,
reject a non-zero field with -EINVAL, so a new caller cannot get the
old semantics by accident and can fall back to a call without the
flag.

Suggested-by: Darrick J. Wong <djwong@kernel.org>
Link: https://lore.kernel.org/linux-fsdevel/20260805071414.3414870-1-matthias.goergens@gmail.com/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
See the cover letter for the changes since v3. Note for C++ callers: a
positional initialiser of struct file_dedupe_range now needs braces
around the union member under -Wmissing-braces; designated initialisers
with either .reserved2 or .flags are unaffected.

 fs/remap_range.c        | 4 +++-
 include/uapi/linux/fs.h | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/remap_range.c b/fs/remap_range.c
index 26afbbbfb10c2..63f1b6f90c161 100644
--- a/fs/remap_range.c
+++ b/fs/remap_range.c
@@ -503,7 +503,7 @@ int vfs_dedupe_file_range(struct file *file, struct file_dedupe_range *same)
 	if (!(file->f_mode & FMODE_READ))
 		return -EINVAL;
 
-	if (same->reserved1 || same->reserved2)
+	if (same->reserved1 || (same->flags & ~FILE_DEDUPE_RANGE_REPORT_PROGRESS))
 		return -EINVAL;
 
 	off = same->src_offset;
@@ -555,6 +555,8 @@ int vfs_dedupe_file_range(struct file *file, struct file_dedupe_range *same)
 			info->status = FILE_DEDUPE_RANGE_DIFFERS;
 		else if (deduped < 0)
 			info->status = deduped;
+		else if (same->flags & FILE_DEDUPE_RANGE_REPORT_PROGRESS)
+			info->bytes_deduped = deduped;
 		else
 			info->bytes_deduped = len;
 
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 34c6f219462a5..4e40855e1ef8e 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -178,13 +178,19 @@ struct file_dedupe_range_info {
 	__u32 reserved;		/* must be zero */
 };
 
+/* flags for struct file_dedupe_range */
+#define FILE_DEDUPE_RANGE_REPORT_PROGRESS (1U << 0)
+
 /* from struct btrfs_ioctl_file_extent_same_args */
 struct file_dedupe_range {
 	__u64 src_offset;	/* in - start of extent in source */
 	__u64 src_length;	/* in - length of extent */
 	__u16 dest_count;	/* in - total elements in info array */
 	__u16 reserved1;	/* must be zero */
-	__u32 reserved2;	/* must be zero */
+	union {
+		__u32 reserved2;	/* must be zero (older callers) */
+		__u32 flags;		/* in - FILE_DEDUPE_RANGE_* flags */
+	};
 	struct file_dedupe_range_info info[];
 };
 
-- 
2.55.0

