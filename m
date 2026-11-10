Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328022;
	b=ZZRYA9G9MWDPjo9roe0pHb5q8H49tPYIVcgfIFfRrTAqcz26tVwK9/aOcxAxT2x+5202
	 KLK1LD14sfFVcpMm22rN42bntKinWQ2X0c498B8dAfJqe1z4FRO+ynKkJyn6rNIP5Lept
	 qnldjhpL+vS/RgKFzmi5rLvxJOEhzxJMqbLgHbOjlc4AhNWsKKgSYShc/I3pUZmzojP2S
	 qDw+9roZN+tQ6HhkpyPoaQxjv3J3EWC1yENIGRTisrkSLw+CX2yhJIDiGR4DtCxZuwtGC
	 tnFkdGDpIRxpBbwAFduPAvpP3Bu5Gqt9UmRArNwcd05ItOcTt8phLrSpk02xwyf9bQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DL3SGkmXNuX/inqHhwZXtYBUYPDB00j/1t9SWY3OyLk=;
	b=g6fcBaHXlbSKxhrp+o5UlTVXYN0xFx9g0SwmAQoseZgTEwnACIIatoKPAEPeRa2vqaV3
	 5ofmO26RMkMvE1OycnwxrSSp6BByTKTruRyooZB69HZADvoZv5n5PhOPSyA8ExdeKSSjL
	 FzqosBFC8w+4krLo3dt/vrK2ZrbTUZGtZfpKyL/5vdxlvLeLGDs5NzCqEH49NQVL0f0//
	 iqXPecCurARkb7Sine0k7t4Wi7HHUfm+9bW5arR7bZ5ObSOSb9VzwRGPeRku+7avBBA8Z
	 5xirU8BbTVLRvP/FAah9Mwyz5uqN6dbt8vprEIGewhpHEPPpn7jg9ybf1QIq0589VLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b="Y/XKMFZx";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEC7606D7E2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCEC7606D7E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=Y/XKMFZx
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso17518025e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1794328020; x=1794932820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DL3SGkmXNuX/inqHhwZXtYBUYPDB00j/1t9SWY3OyLk=;
        b=Y/XKMFZxqsGScS2hc4M3SVkWmL06+cQABu7mtHP8tAfOjoSqPy8FM3yd53wh3llS6R
         jqXTtOwi5BqvbBDcODXk6lZns99x5v5fRRf9nMSlkuknRSdUd54FNuHk/FJwT8aMPCW3
         3tAkn/jmdrJ0FH8YbD7rnQUXXPlDOV/e5QfXuLvud3lnOY9kCS8rYEExMGxFCIAtetDl
         pDNjF4imJS2IdPr2Ana2Hrh+OyocMjUNqm1UAxJe/e0mu58dgIQoUgXKJN13Dz6wBZIp
         O6qoR0RR6llLRtCtIWuTyfJXLL/ePPyvtkSa0NKudmpUI/9JphjHrKpFoibtVBDNJvZx
         7qKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328020; x=1794932820;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DL3SGkmXNuX/inqHhwZXtYBUYPDB00j/1t9SWY3OyLk=;
        b=0PAnt0Z5uQq7CfvkiSwGFRknh2ofzdJtbm1ElcIW2aukTTC7eXKuFlS9uYKOds+yRZ
         9bAbzQ5Baqk9Bxbvo5pSrAVydgqKRI6ItR1yeTlnQOL5PFgsg3wDizCc8gMDE+okPUqC
         byKmXH9sIq+9l/Xz52UEPXnLUJuvE3dbNfNSZ7j5iSiJDIv08rqnsg21y3mikS+OyzhA
         PdgtHsj18dKNZ4b33dO024Zff3kguya8AoEM2diNF8YM/irr68t0dmgIJjRbPpIaKzmC
         lRGGDnYa2erv2FOP7eQfS6No20QSMjtdjoa9LgmZiD3yekWYVMeH1vIuDLv5L5pimhn7
         4yfw==
X-Forwarded-Encrypted: i=1; AL+hErHsyCFKRS1O86lredAywlH5JbUxiePmitVAwLgslwYAoTldcg+WSxTIkMwVvbVOjp9/9XsIZsu5g1Jv2jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qo2ikyf2CAuJNjaYvQvD8ebbDedJCwMCtipXkuuAuZLpRaYwl
	jXCeQRGLIiIlANUo4Ikn68ZmTY5so8NpusCNm90VdSOj2QvD7WNGNTh3f95VM1gSGSo=
X-Gm-Gg: AYBFou30PcbdkQPMf17Cby909+Yg5rjzUekTn3gWC89D87gK26OJlOpk+ne2wE46uYT
	eEbVpnj+0q2enLAnaPEMdubdJnqd6Umjqlf6MkfH1+2mRrtP4ulxXDpvQwEnMUNsceH6ITF1oSe
	vKQTZ3LWlnH0AkC87zfytb56V+1LLUTDIUG3opO2kR4xn9WyPXOAvYHL2eITh6D6ZkzgDA543cj
	ec/SXYPuW7YV4RvnRQH0S97zLwBFEpLP3Xz3QnT8lnpsfUI8d3/eSPdb7m8CFGQAtUoSiXU/r40
	s8xGmFgd0vVLQdg2gPej/F95PA/ZGNhSZYBE0pQLcTU9BXB7YIPTRQEPtrwG70QSHij26NHkFvZ
	89JGx+bntEWpD6pZPMZMhlu7apoUxbDfGTgoqH+ndUnlGiKAkSsfxquQRLUrtodGWreA+LFQLmW
	Lke5BdYf+PnDf27eK6RuHBfbcUjQlxB5mMI2mEilHsUkoletFsTqKumd9F8ThPF0qbJGak2Twff
	esNrkefcZDqOecmay5fCQ+wLO6RJjhXodpYq/mBZ9Ug047d3vnSD4KdSBARC6099frc/vK+1wV2
	ONgrp21VoOrNgU9YABySRe4FPGErBGVghlOzZOh+6gwP5rAI+k8fv9XVOpLmHcZd4JfEN81f3Q=
	=
X-Received: by 2002:a05:600c:350c:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4ba0233ea4fmr53015075e9.9.1794328020191;
        Tue, 10 Nov 2026 08:27:00 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02345d22sm85050695e9.1.2026.11.10.08.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:26:59 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH v3 03/20] drbd: introduce DRBD 9 on-disk metadata format
Date: Tue, 10 Nov 2026 17:26:28 +0100
Message-ID: <20261110162646.3028472-4-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110162646.3028472-1-christoph.boehmwalder@linbit.com>
References: <20261110162646.3028472-1-christoph.boehmwalder@linbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new header that captures the DRBD 9 on-disk metadata layout,
enabling state tracking for multiple peers.
It includes the per-device superblock and per-peer slot structures
needed to track bitmap UUIDs and sync state for each peer.

Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_meta_data.h | 170 ++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 drivers/block/drbd/drbd_meta_data.h

diff --git a/drivers/block/drbd/drbd_meta_data.h b/drivers/block/drbd/drbd_meta_data.h
new file mode 100644
index 000000000000..400803267c83
--- /dev/null
+++ b/drivers/block/drbd/drbd_meta_data.h
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef DRBD_META_DATA_H
+#define DRBD_META_DATA_H
+
+#ifdef __KERNEL__
+#define be_u64 __be64
+#define be_s64 __be64
+#define be_u32 __be32
+#define be_s32 __be32
+#define be_u16 __be16
+#else
+#define be_u64 struct { uint64_t be; }
+#define be_s64 struct { int64_t be; }
+#define be_u32 struct { uint32_t be; }
+#define be_s32 struct { int32_t be; }
+#define be_u16 struct { uint16_t be; }
+#endif
+
+/* how I came up with this magic?
+ * base64 decode "actlog==" ;)
+ */
+#define DRBD_AL_MAGIC 0x69cb65a2
+
+#define BM_BLOCK_SHIFT_4k	12			 /* 4k per bit */
+#define BM_BLOCK_SHIFT_MIN	BM_BLOCK_SHIFT_4k
+#define BM_BLOCK_SHIFT_MAX	20
+#define BM_BLOCK_SIZE_4k	4096
+#define BM_BLOCK_SIZE_MIN	(1<<BM_BLOCK_SHIFT_MIN)
+#define BM_BLOCK_SIZE_MAX	(1<<BM_BLOCK_SHIFT_MAX)
+
+struct peer_dev_md_on_disk_9 {
+	be_u64 bitmap_uuid;
+	be_u64 bitmap_dagtag;
+	be_u32 flags;
+	be_s32 bitmap_index;
+	be_u32 reserved_u32[2];
+} __packed;
+
+/* Changed block tracking: one bitmap slot, not owned by a peer, records every
+ * write to the backing device since the bookmark "id". Valid only with
+ * DRBD_MDFF_CBT in the features.
+ */
+struct cbt_bookmark_on_disk_9 {
+	be_u64 id;		/* the slot records changes since this bookmark */
+	be_u64 bitmap_uuid;	/* current UUID at cbt-start */
+	be_u64 bitmap_dagtag;	/* the Primary's dagtag at cbt-start */
+	be_s64 since;		/* time of cbt-start, seconds since the epoch */
+	be_u32 flags;		/* CBT_BOOKMARK_* */
+	be_s32 bitmap_index;
+} __packed;
+
+struct meta_data_on_disk_9 {
+	be_u64 effective_size;    /* last agreed size */
+	be_u64 current_uuid;
+	be_u64 members;		/* only if MDF_HAVE_MEMBERS_MASK is in the flags */
+	/* Feature flags. Values prefixed with "DRBD_MDFF".
+	 * Separate from "flags": Unknown features bits are cleared; unknown flags bits are kept.
+	 */
+	be_u64 features;
+	be_u64 reserved_u64[2];   /* to have the magic at the same position as in v07, and v08 */
+	be_u64 device_uuid;
+	be_u32 flags;             /* MDF */
+	be_u32 magic;
+	be_u32 md_size_sect;
+	be_u32 al_offset;         /* offset to this block */
+	be_u32 al_nr_extents;     /* important for restoring the AL */
+	be_u32 bm_offset;         /* offset to the bitmap, from here */
+	be_u32 bm_bytes_per_bit;  /* BM_BLOCK_SIZE */
+	be_u32 la_peer_max_bio_size;   /* last peer max_bio_size */
+	be_u32 bm_max_peers;
+	be_s32 node_id;
+
+	/* see al_tr_number_to_on_disk_sector() */
+	be_u32 al_stripes;
+	be_u32 al_stripe_size_4k;
+
+	be_u32 reserved_u32[2];
+
+	struct peer_dev_md_on_disk_9 peers[DRBD_PEERS_MAX];
+	be_u64 history_uuids[HISTORY_UUIDS];
+	struct cbt_bookmark_on_disk_9 cbt_bookmark;
+
+	unsigned char padding_start[0];
+	unsigned char padding_end[0] __attribute__((aligned(4096)));
+} __packed;
+
+/* Attention, these two are defined in drbd_int.h as well! */
+#define AL_UPDATES_PER_TRANSACTION 64
+#define AL_CONTEXT_PER_TRANSACTION 919
+
+enum al_transaction_types {
+	AL_TR_UPDATE = 0,
+	AL_TR_INITIALIZED = 0xffff
+};
+/* all fields on disc in big endian */
+struct __packed al_transaction_on_disk {
+	/* don't we all like magic */
+	be_u32	magic;
+
+	/* to identify the most recent transaction block
+	 * in the on disk ring buffer
+	 */
+	be_u32	tr_number;
+
+	/* checksum on the full 4k block, with this field set to 0. */
+	be_u32	crc32c;
+
+	/* type of transaction, special transaction types like:
+	 * purge-all, set-all-idle, set-all-active, ... to-be-defined
+	 * see also enum al_transaction_types
+	 */
+	be_u16	transaction_type;
+
+	/* we currently allow only a few thousand extents,
+	 * so 16bit will be enough for the slot number.
+	 */
+
+	/* how many updates in this transaction */
+	be_u16	n_updates;
+
+	/* maximum slot number, "al-extents" in drbd.conf speak.
+	 * Having this in each transaction should make reconfiguration
+	 * of that parameter easier.
+	 */
+	be_u16	context_size;
+
+	/* slot number the context starts with */
+	be_u16	context_start_slot_nr;
+
+	/* Some reserved bytes.  Expected usage is a 64bit counter of
+	 * sectors-written since device creation, and other data generation tag
+	 * supporting usage
+	 */
+	be_u32	__reserved[4];
+
+	/* --- 36 byte used --- */
+
+	/* Reserve space for up to AL_UPDATES_PER_TRANSACTION changes
+	 * in one transaction, then use the remaining byte in the 4k block for
+	 * context information.  "Flexible" number of updates per transaction
+	 * does not help, as we have to account for the case when all update
+	 * slots are used anyways, so it would only complicate code without
+	 * additional benefit.
+	 */
+	be_u16	update_slot_nr[AL_UPDATES_PER_TRANSACTION];
+
+	/* but the extent number is 32bit, which at an extent size of 4 MiB
+	 * allows to cover device sizes of up to 2**54 Byte (16 PiB)
+	 */
+	be_u32	update_extent_nr[AL_UPDATES_PER_TRANSACTION];
+
+	/* --- 420 bytes used (36 + 64*6) --- */
+
+	/* 4096 - 420 = 3676 = 919 * 4 */
+	be_u32	context[AL_CONTEXT_PER_TRANSACTION];
+};
+
+#define DRBD_AL_PMEM_MAGIC 0x6aa667a6 /* "al==pmem" */
+
+struct __packed al_on_pmem {
+	be_u32 magic;
+	be_u32 slots[];
+};
+
+#undef be_u64
+#undef be_u32
+#undef be_s32
+#undef be_u16
+
+#endif
-- 
2.56.0

