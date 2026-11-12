Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474989;
	b=KcR8vEsmwIQKLWn1/Ndpm6n7Zk6O3h6eLYfXVj52aGTDM1Mhb55P7JlGW1A+dQAhXL8A
	 uJKVfb3npmUn9QmHmMUJjavBje33hwwZTvbDQFwYE0qgNr865QauOntWDHh6h/MfUxxpw
	 roy2Xsr3oRBjBA3eLlpX9URAlz1ARG0z+1F6PK3ZsCuX7xOW2ZyvpdF50D3RxEMm3ZYk1
	 XnZnMIMtCI9cYoLn5ApumMGQQQruwOVZ9PzjL1NOI72Hgd5pSMsFwhPwhYnyN28PSxoJq
	 vYYA3nCd2TP8PzVCza+a4CXdHDHRf02k2HJ+zjIfSkp/5d3tJpDS6H6vGXI+X22seJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iwKcXB+nL/O1Q+K5YbvqbNCC85Ls2keqIxGcIWCoh4o=;
	b=qtVFQqHXb1w7CAww5OqE+RdzfkzcOCJLv/GIh/KPoPbbKGIMzdFj/xwTTqi1ZhbOxcMW
	 5EYp1O6E3Tqh6DGvUCS+XcG4iaME+mcDq+FtEwdntBlU+vMGho6BmwkAqI+hqVCY0ycUE
	 jV2OhxTtD0BrTpO3jfcboAImHqrJleeZ50m3spl7S1tp+e7730JCAAqGYz1OD0Xa+UV9d
	 0USnbKx2Ye5PPY2VIYYICG9TESuXIb1gNF1QgXwkgKQclhmK3rsD70sI6imAKX8btYF+w
	 tUd2JybSHWIuq1MCzxgpBy4lFQFvWUdcA3dRKtxEk8E4eKKMGMcjo9LQgcMV0hBpn9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=docker.com;
	spf=pass smtp.mailfrom=docker.com;
	dkim=pass header.d=docker.com header.i=@docker.com header.a=rsa-sha256 header.s=google header.b=S4ASUNwQ;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE2B606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE2B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=docker.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=docker.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=docker.com header.i=@docker.com header.a=rsa-sha256 header.s=google header.b=S4ASUNwQ
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso2152004f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=docker.com; s=google; t=1794474987; x=1795079787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwKcXB+nL/O1Q+K5YbvqbNCC85Ls2keqIxGcIWCoh4o=;
        b=S4ASUNwQ//w+cYicJHFQt8K8vJwdbxA5rXJh3AaAUhKCdj0bZt67F5ATV4Qn6cTNaO
         FsVbpdIHMwOPrhn8EHdAn3mp8EAFa9YQOimCvO/PWCS4MkrKR6rOjGFoaneiLMQB/g0k
         W3OUoUSOr0tHAEeFOv+DdkGujGVjyAixiKJthsxhy8Q4e4H8/ulNXJ5Y6sLYbBmSLD5A
         jm+S1sag9eXzhmgrYABsQdnlZXUgt/THqbqoobeoDhj9gTbyKISZCjhMjL+mQd3IlJy5
         miu9rvjv3uub8TFBbyZ48bosOS/9w2Sh/7gzIpR3j4+xGGamIiSBIZU1kgJM8zwAoy3V
         vVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474987; x=1795079787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iwKcXB+nL/O1Q+K5YbvqbNCC85Ls2keqIxGcIWCoh4o=;
        b=0YCT1NpTsIci6/5UeKm0TZEnUUOBa3DQGuSNVc8Ydny7VPyDmbndLeP06ybDDpZcZV
         AW4oD5nnMUuf1oxoYtj5/tCVB6+m1LqlFhs+gT/Y/q+cJTDvM0aLewMUS++wVYn2lGJg
         SUqwvmys7iTlXIFvDLws0e+1wKvfpErJXu6Sggqw4pnsNIigLUWvKiLa1olpnMc2NcaC
         5P5/sbMszeB4pnhBbDVM4ItdIDy3MOEu4sIcLuEgrI3Mld194M9Z6w0SlKZ1nxlML1Sc
         DOvJlUpaXuOXY8jKigxqfI3iMe9/sOLXQgaERlFtvXhgX/AevkBCNiRgdqgCdNyfz4rr
         qMxQ==
X-Gm-Message-State: APuU4Z9Sqz0wTvrbsaQfRmUjcvgTRnhKevGeQGZLIUaH7kndyqwCZ0Rc
	dntJi0kJOnXsocz6xWRy+FVOlDeHg2MblI3bWCc/U+O5PEM9wz04RzjC4VL4BZ+CVYj7yAbRu+W
	SKblF0Ao=
X-Gm-Gg: AYBFou35TgFYTfJNV9EtHfO/Gqhmkz1DHutHqJyEG5VI23DVFPlhZBzVePMzbCRJtm/
	j8PGL9kjTZIja342PYLNMJ+NMnNerjmN/N7miNBItPjrqhPX4q9TwY8bExCo9dX7yMPgzaLcjPg
	X3c4h+jEZlJJWE3KWFz5JvJt7D/N5CzebIGaJwrd2/TlQTouzBrmzX4GLNPwwEyCYg4vo9BGr74
	KYZ4FeRbQ+7ChoMFSqAzulbf+Gk2BBZeluDvmawekAnOgopmA4OS8DBFLlxJPv5rgaLTYmj5JJx
	IOvFDCb/VLI2mn/Q+EEksL0smTMfBxIwwUB/r/m9JVNAOdItHp5UMGI4m89U4LSMvbvz6sWfPPn
	fLKv7QVMMKBmgi1WUf7SjLxl1l5TTEjg3wNjVNBMUbSNGMDDu0dGwUOTC0IhU0UbGQ05WO+QMhi
	gsCDIrgqeuXPuPBfY8HqO6mOBLQ7MRowB8rYIrzqMiscty/EGxrKvUK3Zw953oXzPVeFqxJEs9o
	fdh6zCOY8jNp3ytOQEY6cgGh3gg9KZD7D3jmk3DlrRGZ+o9yRI1yueXEUxlujMEsAzgVVtw9Z6d
	nT7r6kZJSmYstXvE8uTTHvVwc5NjOBrTRD1qqlchVy8pV4UUSZtIGsL2dngg/1Wkxe06
X-Received: by 2002:a05:6000:40dc:b0:48d:f470:6b3e with SMTP id ffacd0b85a97d-499c727123amr9304374f8f.13.1794474986711;
        Thu, 12 Nov 2026 01:16:26 -0800 (PST)
Received: from F7R9GP321C.fritz.box ([2a02:8108:8388:6600:b047:dbcd:74c9:840f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm15960039f8f.28.2026.11.12.01.16.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 01:16:26 -0800 (PST)
From: Gao Xiang <xiang.gao@docker.com>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gao Xiang <xiang.gao@docker.com>
Subject: [PATCH v2] docs: erofs: refine the on-disk overview
Date: Thu, 12 Nov 2026 10:16:15 +0100
Message-ID: <20261112091615.40264-1-xiang.gao@docker.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112021905.36269-1-xiang.gao@docker.com>
References: <20261112021905.36269-1-xiang.gao@docker.com>
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
changes since v1:
 - address Chengyu's comment to describe more about the metabox.

 Documentation/filesystems/erofs.rst | 119 +++++++++++++++++++++-------
 1 file changed, 90 insertions(+), 29 deletions(-)

diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
index 02caf3b061fe..cea781b3cb16 100644
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
@@ -185,16 +199,50 @@ to be as simple as possible::
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
 
- 1. Inode metadata space
+EROFS core metadata consists only of the superblock, inodes, and directory
+entries stored in directory inode data.  The physical locations of inode
+data are recorded as block numbers to avoid block-alignment checks.
 
-    Each valid inode should be aligned with an inode slot, which is a fixed
-    value (32 bytes) and designed to be kept in line with compact inode size.
+Only a few superblock fields, including the root nid (see below), are needed
+to parse the filesystem tree.  Most of the remaining fields provide filesystem
+statistics reported to userspace and should not affect the core filesystem
+logic.
 
-    Each inode can be directly found with the following formula:
-         inode offset = meta_blkaddr * block_size + 32 * nid
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
+
+ 1. Inode metadata view
+
+    Each valid inode is aligned to a 32-byte inode slot, matching the
+    size of a compact inode.  Inodes can be stored either inside or outside
+    the metabox inode, with a flag in the nid indicating whether they are
+    stored inside.
+
+    For inodes not in the metabox, each inode can be located directly
+    using the following formula::
+
+         inode physical position = meta_blkaddr * block_size + 32 * nid
 
     ::
 
@@ -224,8 +272,8 @@ may not. All metadata can be now observed in two different spaces (views):
                                             |-> aligned with 4B
                                                         |-> aligned with 4B
 
-    Inode could be 32 or 64 bytes, which can be distinguished from a common
-    field which all inode versions have -- i_format::
+    Inodes can be 32 or 64 bytes, distinguished by the i_format field common
+    to both formats::
 
         __________________               __________________
        |     i_format     |             |     i_format     |
@@ -236,31 +284,44 @@ may not. All metadata can be now observed in two different spaces (views):
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
+
+    For inodes in the metabox, the remaining nid bits identify the inode slot
+    within the metabox's inode address space.  This data is read through the
+    metabox inode, with decompression as needed.  The metabox inode itself is
+    located outside the metabox and is identified by metabox_nid in the
+    superblock.
 
- 2. Shared xattrs metadata space
+ 2. Shared xattrs metadata view
 
-    Shared xattrs space is similar to the above inode space, started with
-    a specific block indicated by xattr_blkaddr, organized one by one with
-    proper align.
+    The shared xattr metadata view is similar to the inode metadata view.
+    It starts at the block indicated by xattr_blkaddr, with entries stored
+    sequentially on 4-byte boundaries.  Shared xattrs are stored either all
+    inside or all outside the metabox; this metadata view cannot be selected
+    individually for each entry.
+
+    Each shared xattr can be located using the following formula::
 
-    Each share xattr can also be directly found by the following formula:
          xattr offset = xattr_blkaddr * block_size + 4 * xattr_id
 
+    When COMPAT_SHARED_EA_IN_METABOX feature is enabled, this offset is within
+    the metabox inode's address space.  Otherwise, it is a physical position
+    in the filesystem image.
+
 ::
 
                            |-> aligned by  4 bytes
-- 
2.54.0 (Apple Git-157)

