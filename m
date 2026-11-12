Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449952;
	b=TtYRLLWQxBYgXTEeIbZuw10D8m9oegKVwCyBawS4zioY/+UZ0w2leFVBVPCH0Bg0rRml
	 1MGY7BKcvc5l8j3Oqrrky3X1KkUYvYntSxcbJ5CYIUmfk1wzkPbyxAC4THyZuGoDgy0pY
	 eW+iu3IOF4QDt61PmHYG91vomMJAkiD9f2QYzmdv07QX4yt8nb0njCB8qbV32YsLsuFVG
	 tKP8spog/48Cnik0AdrG87SejL9PiJK08SNvfMCo5Awbx/zXrbubWr5rkYBGlNTcJUyG9
	 VmlY/UmeAiPVwHh2PRoiL7D6+luv70JV47Q5k9lHjHSVKweMWob15DJmbitcFUZX+RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wtyuAeh2OycyURWuZUtug5qWxrkAw9jwsi6eWss0uMA=;
	b=QTu/98SYyHJfy46mhWsm3kiWOqgCl7Sm/RT16DFWnJ9G3JMdgwWs+7aTthX1gy7GJb9d
	 6nVonpWzU92Jn30LosEPI/HrWsxp3rUBokhCoDq+ZihOMM0VaNxSSIcxoy+g2ZD6yOirS
	 lbrXOy1HnSV9TggypJWrtc/5qw6Iaa49jTGYzeuQgY1KasLpGElMsIwqD1zW+UvgNhmg/
	 T2EgeQoE9jIqEp7ntr6PqXF8EsMZ9jcMczVFNpgbPXC8MajwRdd4T13+OUwInpQyxvCKk
	 hAGw+iHvo6Uks4tKbBYVi5p2m7lLAIkR4MVRrIZGHCUEf98gjZkId9w1LDPoGETwb7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=docker.com;
	spf=pass smtp.mailfrom=docker.com;
	dkim=pass header.d=docker.com header.i=@docker.com header.a=rsa-sha256 header.s=google header.b=I3U7Fuqr;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE4B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=docker.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=docker.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=docker.com header.i=@docker.com header.a=rsa-sha256 header.s=google header.b=I3U7Fuqr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so32736585e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=docker.com; s=google; t=1794449950; x=1795054750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtyuAeh2OycyURWuZUtug5qWxrkAw9jwsi6eWss0uMA=;
        b=I3U7Fuqrszzdn29peKiIa1uJFV7OG894cPYDLnE81xaJ3wSPWJRkv6ImWCQvtRNahu
         yjyCg20VI+TRpcGlHDNBGti+A406pAmYsozHDe19ug3FDsjH20WJVxtulJcKPm4vuJUG
         3lco7M0abODtCejYb8iWSOLzuTra3vCqlMRa9TPuYUilgouR0nQrbwJUAMQ/kIloBCHF
         XsbKOXIQE0CV5d2gIKRjv/jl1onUZMI9essfCatq5OT3SYF0Pb19zRo0JvibG577samw
         EAMqAoDWwFin17jAkx86N+V8rc73b4apP2OA0xJ/jOvyYyLPmrVV41EFeycgSCMoi4XT
         8qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794449950; x=1795054750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtyuAeh2OycyURWuZUtug5qWxrkAw9jwsi6eWss0uMA=;
        b=SQx4NtlOywQXjoIVv3nCwUChvQWinmwoB57ni11pebblXjo/wP8CcU7m9zUekBvQGm
         hw1uwbRU/X5CDLiMBfBinL70z8ID9Qu0XwSqjA2kEgIrUdDs+W1QpAOeqfbjP7LJfeZ8
         Vb4TPbIROlnX10aDALmWusqYBj7ql5gBQIBQYFczGuZjq9ZBc+c9VJzY3mb1DPWoCZCi
         rPNGyjldJdH2GdG5khNHjay9+V273VMAZHyU57XyIx7b+X2X+kj1EMQeLLixlWo4aP9l
         nGteeeEdAzuB/e+SiY+/TyFRBDRCniYS91+HOjn9DQvIHovA8ovG7SdXal6/vLf31Tn2
         bcfw==
X-Gm-Message-State: APuU4Z94Lg3VANcS/UNpHoIvgjBI/8CdMrEA1k1RgCIy5Up9fsrKedG3
	lAVM2+T4OSdC0LciOkyzhf+UipvVrw4mapDxvztduAigcThlDvozeTTu2rh0VHLP8WA=
X-Gm-Gg: AYBFou34+nYK33j/lZ99gspBr2cl+41Vw77p7iE/TFbMVKqUY3Gy8nscaZmRPifgcF3
	l+JxFt3Yy1cu/prjbk3hzWDE0J4DLAe2GlSBILeGPplxZZWVn8bZiwQO4vkXrBDg62woDRifF3c
	TacytUu9h4s2JvMP9E3H0OY/gjhYCjMY5U6eLUctbx5GtGMX0aWjLD56GnrjWNdy7zCgNH3Xfq3
	jB/oltS3rDI4gBUlybgtKBtNh8lQySnllgrkbrFyZmpKK32ltMZ9Lnh2Pkn0r/tYt9GzyxhIL5I
	YoOK+sWGqSiH8JaDn3L/Rk+Jl7MWEHM8qYnOJOy7xkmGpl1/f/1+ugjvPmIflBUoPr0Ywpm4c90
	u3JBEyAlXNu0u4PQyNH5CxXNdn9gDMFCzzRvVnlUzLmIsF3EisFcJHTFIvoasZ9CcHxmVApq2KI
	mAyJPaOznKWy/nsBS0qOM5dztB0QDVMcEuNn1iKu3gAugMs0v0wLxuxF1FdFBYdHgGqPo0+IFez
	Gx2mtp+GHNBYCuu8l9ozIUT2E7qf1mvrJR3KA6DoHIiaY6kssFHfFRRc4flApkqw9ddS2XVF43M
	usNFS+cxOkVBby//kBA0XAd1AUFTClBqlZj8jwBgAwzEZu1NuviDjc2A93OewQvG0uFa
X-Received: by 2002:a05:600c:b86:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4ba093583e2mr78863875e9.6.1794449950314;
        Wed, 11 Nov 2026 18:19:10 -0800 (PST)
Received: from F7R9GP321C.fritz.box ([2a02:8108:8388:6600:b047:dbcd:74c9:840f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm24209905e9.7.2026.11.11.18.19.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 18:19:09 -0800 (PST)
From: Gao Xiang <xiang.gao@docker.com>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gao Xiang <xiang.gao@docker.com>
Subject: [PATCH] docs: erofs: refine the on-disk overview
Date: Thu, 12 Nov 2026 03:19:05 +0100
Message-ID: <20261112021905.36269-1-xiang.gao@docker.com>
X-Mailer: git-send-email 2.54.0
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

The existing on-disk summary mainly describes inode and shared xattr
metadata views, leaving the overall layout and design rationale unclear.

Expand the summary and refine the terminology and wording while keeping
the section a high-level overview.

Assisted-by: chatgpt:gpt-6.1-sol
Signed-off-by: Gao Xiang <xiang.gao@docker.com>
---
 Documentation/filesystems/erofs.rst | 100 ++++++++++++++++++++--------
 1 file changed, 72 insertions(+), 28 deletions(-)

diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
index 02caf3b061fe..0633e69aa71e 100644
--- a/Documentation/filesystems/erofs.rst
+++ b/Documentation/filesystems/erofs.rst
@@ -171,13 +171,27 @@ Each mounted filesystem will have a directory in /sys/fs/erofs based on its
 device name (i.e., /sys/fs/erofs/sda).
 (see also Documentation/ABI/testing/sysfs-fs-erofs)
 
-On-disk details
-===============
+On-disk format
+==============
+
+This section provides a high-level overview.  For the latest complete on-disk
+format specification, see:
+
+- https://erofs.docs.kernel.org/en/latest/ondisk/
 
 Summary
 -------
-Different from other read-only file systems, an EROFS volume is designed
-to be as simple as possible::
+
+EROFS keeps its on-disk format as simple as possible to minimize the need
+for metadata consistency checks.
+
+The guiding principle is that malformed or deliberately crafted metadata
+may describe a corrupt filesystem, but its effects should remain confined
+to the data and metadata exposed to userspace: garbage filesystems return
+garbage (meta)data to users, and nothing more.  Violating this rule is
+unsafe and must be prevented by our on-disk design.
+
+::
 
                                 |-> aligned with the block size
    ____________________________________________________________
@@ -185,15 +199,45 @@ to be as simple as possible::
   |_|__|_|_____|__________|_____|______|__________|_____|______|
   0 +1K
 
-All data areas should be aligned with the block size, but metadata areas
-may not. All metadata can be now observed in two different spaces (views):
+Apart from the EROFS superblock, which starts at byte offset 1024, metadata
+and data regions have no fixed locations or boundaries and may be interleaved
+throughout the image.  As a result, inodes do not need to reside in a fixed
+central table, allowing incremental builds, although the image creator may
+still choose to group all inodes together.
+
+All data except inline data must be aligned to the filesystem block size
+[#unencoded_data]_ to enable efficient block I/O, support memory mapping,
+and avoid unnecessary data copies.  Metadata does not require block alignment.
+
+.. [#unencoded_data] Strictly speaking, data refers to unencoded data;
+   encoded inodes are outside the scope of EROFS core metadata.
+
+EROFS core metadata consists only of the superblock, inodes, and directory
+entries stored in directory inode data.  The physical locations of inode
+data are recorded as block numbers to avoid block-alignment checks.
+
+Only a few superblock fields, including the root nid (see below), are needed
+to parse the filesystem tree.  Most of the remaining fields provide filesystem
+statistics reported to userspace and should not affect the core filesystem
+logic.
+
+Encoded inodes, which contain encoded data such as compressed data (including
+compressed directories), use a distinct inode "datalayout" number that allows
+them to be identified or rejected when reading the inode metadata.  Support for
+encoded layouts is optional and can be explicitly disabled at runtime if there
+are security concerns about parsing compressed data in the kernel.
+
+There are two metadata views: one for inode metadata and one for shared
+extended attributes.  Both can also be located in a special hidden inode
+called "metabox", which provides a unified way to compress inode and xattr
+metadata:
 
- 1. Inode metadata space
+ 1. Inode metadata view
 
-    Each valid inode should be aligned with an inode slot, which is a fixed
-    value (32 bytes) and designed to be kept in line with compact inode size.
+    Each valid inode is aligned to a 32-byte inode slot, matching the
+    size of a compact inode.
 
-    Each inode can be directly found with the following formula:
+    Each inode can be located directly using the following formula:
          inode offset = meta_blkaddr * block_size + 32 * nid
 
     ::
@@ -224,8 +268,8 @@ may not. All metadata can be now observed in two different spaces (views):
                                             |-> aligned with 4B
                                                         |-> aligned with 4B
 
-    Inode could be 32 or 64 bytes, which can be distinguished from a common
-    field which all inode versions have -- i_format::
+    Inodes can be 32 or 64 bytes, distinguished by the i_format field common
+    to both formats::
 
         __________________               __________________
        |     i_format     |             |     i_format     |
@@ -236,29 +280,29 @@ may not. All metadata can be now observed in two different spaces (views):
                                         |                  |
                                         |__________________| 64 bytes
 
-    Xattrs, extents, data inline are placed after the corresponding inode with
-    proper alignment, and they could be optional for different data mappings.
-    _currently_ total 5 data layouts are supported:
+    Xattrs, extents, and inline data follow the corresponding inode with
+    proper alignment.  Their presence depends on the inode's datalayout.
+    Five data layouts are currently supported:
 
     ==  ====================================================================
-     0  flat file data without data inline (no extent);
-     1  fixed-sized output data compression (with non-compacted indexes);
-     2  flat file data with tail packing data inline (no extent);
-     3  fixed-sized output data compression (with compacted indexes, v5.3+);
-     4  chunk-based file (v5.15+).
+     0  Flat inode data without inline data (no extents);
+     1  Encoded inode
+     2  Flat inode data with inline tail data (no extents);
+     3  Encoded inode (compact indexes)
+     4  Chunk-based file (v5.15+).
     ==  ====================================================================
 
-    The size of the optional xattrs is indicated by i_xattr_count in inode
-    header. Large xattrs or xattrs shared by many different files can be
-    stored in shared xattrs metadata rather than inlined right after inode.
+    The size of the optional xattrs is indicated by i_xattr_count in the inode
+    header.  Large xattrs or xattrs shared by many files can be stored in
+    shared xattr metadata rather than inlined immediately after the inode.
 
- 2. Shared xattrs metadata space
+ 2. Shared xattrs metadata view
 
-    Shared xattrs space is similar to the above inode space, started with
-    a specific block indicated by xattr_blkaddr, organized one by one with
-    proper align.
+    The shared xattr metadata view is similar to the inode metadata view.
+    It starts at the block indicated by xattr_blkaddr, with entries stored
+    sequentially with proper alignment.
 
-    Each share xattr can also be directly found by the following formula:
+    Each shared xattr can be located directly using the following formula:
          xattr offset = xattr_blkaddr * block_size + 4 * xattr_id
 
 ::
-- 
2.54.0 (Apple Git-157)

