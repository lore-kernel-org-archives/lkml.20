Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E57438945A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790397529; cv=none; b=pyeL6oWcosra/cDPe4brITXYhx5lJgJ3ugHmuYdA14d6AE5hS+twZJvRUeyCXs/SEReX71DsiUXU09F3Hx+uSPTbmL5TtzaR0PavbK46FNHMWV0ue+Y9tSOc3dOoWXdutCLGZq+MqV0tflF4CEMi0fsPAfgzuKbs0mzhAbnypdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790397529; c=relaxed/simple;
	bh=Zq8IxxkjKjfervZ78l9uhoy4EEYIrryxxee9IsYXQA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIVWeafmSBvSkRjh1TEvl7rXrQPxXyMVbw2+C3Y/HK5BybGoZ6FNDT35i3+eg/KTwpB7FOXOdj8MX1yE8jJ1YeqFRoHYSel+svViC4LmRi2cPfIhrdrm3NCmLr1bCDsPpAX0o3nCItUXSMloVdw1g6kRSe2DCJgER3ujguEBc3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAVyTf/+; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAVyTf/+"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341fe27b718so1294589eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790397527; x=1791002327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWlJ0S3KJSs0nwuT71G7XO3GdPoLirIi+1IQsjgKZ5w=;
        b=aAVyTf/+B5y/dwvlPFzQ36J6+SU6MDWpAYzK9RU/qLgH0DtL0+vjgQWprKYwXEozWC
         034fLi4h4egOrj7ajUF+I8zk2+oCFNG92M12PC26wH+YKsGJ88q0XLWOHS9qpat0XR3Q
         Vi1r4LirFJnggNe5P5k/EgiPKXeogm6iv3HiQNiB1qlI5Win48RF4e5cn7t2h2rq2HvV
         H1LgAmD2FVfv5tF8dn2xKV/E+f2BUW7/+eGIIXB7AkoW6KDMlpE6u+q2CPePbYIPjt1h
         42cGtTYyC/cNRnq//XC1RjbNrj156xvyW9WEGFeB7hHGPJ+xrDZ3CiRCqN9GQ0JlI/e2
         BQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790397527; x=1791002327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWlJ0S3KJSs0nwuT71G7XO3GdPoLirIi+1IQsjgKZ5w=;
        b=jBImAEXJVTp4W+CA2dmkRRh6rvnErjLmcRXNjDCQ9vkSGCKAeZ3rUwKToSjkc4flHR
         r4E3YVDvysAwzas3O5zNDgp0YbBF1P4Eiaj6SrRC7rf2xIMYGk6LFwXOw1x5EaEtVEGn
         71W2sgTCc8D+JVXi+obcIvXwUx0E4wyawDC0tjZIuqYOvl/0rIOmOv0QsNZwSEnKB9v8
         9qFqXCZFHTi6TZxoyyCRHqAjtu0xuRTLGLJKjmpQH8j88Xyhu6H/ZnleF9cnjgF1u+5Q
         rcLhN+F5rUJGiEcEl34ZRs/lzoxM6gXRFCI/jZk1M+SyH3zvUeh7c6OedVBVPRf9OJPN
         hoIQ==
X-Gm-Message-State: AFuF++koshY46Gf/GRRqBXfe3w4x+9gLB+CnmeG9tArNuqGJBZyCY9UA
	eE6buO96tYk3Bvgq9s6VatTCZFZ+dezF1GIE0q2DFQsb6dRs8Zt4szuc
X-Gm-Gg: AYBFou3fb9dnytzR2/AwlmrQecqMuO2qu4jsiOHUK7G7EtJyxWVuGctOzJ0CoBmxa4j
	IvI8FLwBW6qk97/+EV9j0vWEf1m3kJEa/XDbddYZhOhFfnkkrik+e3lEP07raOrs5KOvZ8YcDsS
	YkC6AhIB2y7DJ8PYtBZSEzmSs2gZelVZ/OS/2UyytUYXqrGCflFn+3gHjvcxuU7GN8H0wrpXqaZ
	5HcjZnMqOGntIytqgjaLvTWsCZaDAY1nIPzTk9nn28bWaoIY7USYz72eDwtJ+Dg98VFZ8N0gmoP
	totLTYCGOpGfuihqYFltoLd+8LeQPsKXiNUZAa5nCSjQ73to7wyUMJA5yoA34Y+SFyEENH1I1dB
	PAVY1g5sDWaCi38nUYPdjEfF2hTadkwrgVuQ1WP0ECH4cu3o29N9yGFtWs4uiUHQ69NeE7ZhUN+
	xGkJqaMZ+YPivLUiJsKObnIp5F9G/8z8Zpx8M/0CU6kTI15PAWYxR+tBcY0OJqNqrvsixb6Ssyh
	lbavk6E9KuliMC4a/V+/Qk9toB5rmMNrHOABVf4s463CaFuylJah6mdy34nnaV/mER+nKThld9Y
	okwr4JUckIt9yKjm1o7EhGoX1IC3/ZNU/mjuRiZgVYRRn3i8+D4hwkpdkWQ=
X-Received: by 2002:a05:7300:51eb:b0:343:437:62f7 with SMTP id 5a478bee46e88-343043764eemr722644eec.26.1790397527065;
        Fri, 25 Sep 2026 21:38:47 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343025a591csm2171406eec.12.2026.09.25.21.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:38:46 -0700 (PDT)
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
Subject: [PATCH v5 2/2] vfs: add FILE_DEDUPE_RANGE_REPORT_PROGRESS flag to FIDEDUPERANGE
Date: Sat, 26 Sep 2026 12:38:36 +0800
Message-ID: <20260926043836.3301898-3-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926043836.3301898-1-matthias.goergens@gmail.com>
References: <20260926043836.3301898-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deduplication tools such as duperemove, bees and rmlint advance their
file offsets by the bytes_deduped the kernel returns for each
FIDEDUPERANGE call.

vfs_dedupe_file_range() passes REMAP_FILE_CAN_SHORTEN, so
generic_remap_checks() may round the length down to a block multiple,
but the ioctl still reports the requested length in bytes_deduped. The
caller cannot tell that the tail of its request was left alone: rmlint
2.10.3 on btrfs (4 KiB blocks) deduping a 100000-byte file against a
250000-byte file with the same prefix is told bytes_deduped=100000
with status SAME while only 98304 bytes were actually shared; its loop
ends and it reports the pair fully deduplicated. duperemove and bees
advance the same way, and jdupes advances by its own requested length
without reading the field; all of them skip such a tail.

Add FILE_DEDUPE_RANGE_REPORT_PROGRESS for file_dedupe_range.flags:
with it, bytes_deduped is the length the filesystem actually
deduplicated when status is FILE_DEDUPE_RANGE_SAME, and 0 on
FILE_DEDUPE_RANGE_DIFFERS or error. Callers advance by it as today,
but must treat 0 as "stop or subdivide", not retry unchanged. One
cause of SAME with 0 is a sub-block request that does not end at both
files' EOF, which the generic range preparation shortens to nothing.
On DIFFERS there is no sound progress or mismatch offset to report, so
0 leaves subdividing to the caller, as rmlint already does.

The default cannot change: commit 4a57a8400075 ("vf/remap: return the
amount of bytes actually deduplicated") did exactly that and was
reverted the next day; among deployed callers, duperemove re-queues a
request while its status is 0 and would re-issue the same sub-block
request forever.

Without the flag nothing changes.

Suggested-by: Darrick J. Wong <djwong@kernel.org>
Link: https://lore.kernel.org/linux-fsdevel/20260805071414.3414870-1-matthias.goergens@gmail.com/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/remap_range.c        |  4 +++-
 include/uapi/linux/fs.h | 11 ++++++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/remap_range.c b/fs/remap_range.c
index 26afbbbfb10c..63f1b6f90c16 100644
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
index 34c6f219462a..c61bc98909cc 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -178,13 +178,22 @@ struct file_dedupe_range_info {
 	__u32 reserved;		/* must be zero */
 };
 
+/* flags for struct file_dedupe_range */
+/*
+ * Without this flag, bytes_deduped is the requested length on success,
+ * even if the filesystem deduplicated fewer bytes (e.g. after shortening
+ * the request to a block boundary).  With this flag, bytes_deduped is
+ * the number of bytes actually deduplicated.
+ */
+#define FILE_DEDUPE_RANGE_REPORT_PROGRESS (1U << 0)
+
 /* from struct btrfs_ioctl_file_extent_same_args */
 struct file_dedupe_range {
 	__u64 src_offset;	/* in - start of extent in source */
 	__u64 src_length;	/* in - length of extent */
 	__u16 dest_count;	/* in - total elements in info array */
 	__u16 reserved1;	/* must be zero */
-	__u32 reserved2;	/* must be zero */
+	__u32 flags;		/* in - FILE_DEDUPE_RANGE_* flags */
 	struct file_dedupe_range_info info[];
 };
 
-- 
2.55.0

