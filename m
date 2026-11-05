Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836895;
	b=rl/c/5agAxopbpTapBwwyBohuQVxxjR1xzW9KYEvAISwJ+6gdAPKLGC27ts9Udp4Y3b1
	 QL+sGChqocSrDWs4iJ2GRqUX35pJJcdSs1obTuOKmi2FCQVWqMYMbQI10fAwtS+PRc7NG
	 6OhVVbk/0prOf+iG+vZmbSCNqWxgtQS3A7hV/2zOpQrYc62048MuyLtVCJt6A9qMcBv11
	 qyD/b5TGeWOnfGdqX77C7ipKX+CJVH+ITTSv//KiGnU+F3GnEaLLG6lSy022THUoYeuIK
	 wqGDudiPVlPhzisRCGtLUbi+sBvWBXOZSwaJo7VWVKnSZaCpxqAkox03nf84d9lb+hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gm/vDnlTuFKVMqL/TZnaqXKn5wezgntxiqdLKGHEK7Q=;
	b=fhOmxzc94+933kMtE93RvHLIE1RHPpsFONx5kAet6gNlvPn4I7NYhq/3B7QUUM2FBoRv
	 4Y5YMLUz7KyuhdA8eT81b/n4/SnzxwoAc5e7m9rdpkgkPdRAzAWn1rxPcORpigrLRQhWo
	 NlRwfdiyFLg2HEDR2opC3npoCriXwK67hEIp2NTvNhsO7EVCmgk8t80UBZNtzpxKGWHHW
	 v3N4lrrhw2x1M/8f5gnVTRpLZTf4UcNHnOLCTrGXRVZlyPBSTChD7TLCNLDxtsSfY6yl0
	 XpFlLNN7jXoAwbP9dDOkZQSkFoc3uOEADTR1fODIbIiR1KCwWqs/53rshlcV5wEoVhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=everpuredata.com;
	arc=none smtp.remote-ip=209.85.208.99
Received: from mail-ed1-f99.google.com (mail-ed1-f99.google.com [209.85.208.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1E4606D820
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE1E4606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Received: by mail-ed1-f99.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso519395a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1793836893; x=1794441693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gm/vDnlTuFKVMqL/TZnaqXKn5wezgntxiqdLKGHEK7Q=;
        b=VEOkF4inkPh8PvmCzWkhTF6gsH5LTk6ABZ3caXemnHl/vTA7F+i+F/gPLE1EkH9gZq
         gfXpSTEP5SvZesmtMEPiNvrHCinzSzd6e+Q6aspzUyH0RJ8wgJMmeEgdg+4zsO5qgUpr
         NfggPGOqFFnSLj8YdC6iHWrOxd+o92VbaKr+XyjNJAOv9ii7w3DkLu4z1LQ3SeSC0ixM
         GaaB+WYh48Y7Ft3W/y4HpASfe0kiLkFIrCTW91IzMjt6sBNp3Ik5JpNMWDeaGGLPrDU8
         by40Qyxl6xeJqIEBqjq1farP+Qn9YkhxJ+fTKneYFh7erYcIkN02lsA51wLS7djIVgKD
         Pgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836893; x=1794441693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gm/vDnlTuFKVMqL/TZnaqXKn5wezgntxiqdLKGHEK7Q=;
        b=yDpOFU+88HM6Gn1Xf00DbC2fAoj86SYIhUMl83svFLNB/3hF4ALzD0dVfFAqoPHIKz
         gCSqD4zfWYe3xd7G2KBB7ysB95OG5GiVEKVWPdy+oniqzPPeZafyQX278m5yB1edvacB
         BbvRfPVrn8SHKVn0RudkLpHCe9os08J9iwO+7Rm3lt3fgH4Lw+ivfn7RzUmWSEMmSlqZ
         bYiEdgZw/risOBZV3nZJbB8oL8RrI3JFUtX4nlc7rihWRxdvqL6uBD7FcwdLCtmDSJZh
         DXoufcEz1FAbOsRR6UZzg2qiVqW9BDOoDZxhiNW5MWCByaQPVnwtpwa6mGFhriOA7nQ0
         +E1w==
X-Forwarded-Encrypted: i=1; AKwUvBzGZ+Vpz74EzRUfMyWapIlWOxD+vvmgIjMj4Yce64KJJKkQZuEx1Ao2+D+vsD9i+sekckfB76xreouvO9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gk0kMpApt9cT5gVa6i0dAiUezwChV28bgcO4PwxlOMUrFwyIB
	puAJD5jkmrDFqBpq+VJlxLXXXeQDaxwefyYB5V6z1erdDUPHtSlaKru4wbRzmghSxdMOeQL8n27
	0mmpwTc6NSFRbGz1FVr1tUeCtFMSd7TxO6cn4
X-Gm-Gg: AYBFou3UMJDmUIEBDmTfMvieZ6KGomXe5XdRRuwe5CXfxXms8HIK4Nu2TB+PqgynZ3f
	P4ES6gS8L6Wf450f/az46w1yHbDMzzdpawW4jmCBxyzVw9tcKebaewM9/F/tmVL3QMi1IJrM/Lh
	3ofGLZJVzi2RvOzXmrydLnorq/kqboaPm/mokrzzaHcOoZlkwaPjHWVT41ACRHd8/AdQqnSNOIM
	QlokHJwSxuqajAPcpwh6mnGNH/r2ZPV6DjOzQ67yFc+XQD5At/R9Wr5mlnBDde4+XDbF1epHyF/
	s9EyMep9voJnTWhVRaYc2ur9VkPsW5znxkhMbi3LpNpiIwckegGTfy+Bm9sn3Ew6C2fkwD3kKEf
	Ek4Y80PtQNfh408OqB5ctB2maBHOnDkipjomeQWg=
X-Received: by 2002:a05:6402:223c:b0:6b4:2806:b057 with SMTP id 4fb4d7f45d1cf-6b4d4d80570mr8548816a12.35.1793836893130;
        Wed, 04 Nov 2026 16:01:33 -0800 (PST)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-6b55acdf034sm713224a12.16.2026.11.04.16.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:01:33 -0800 (PST)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 5FAA8341883;
	Wed,  4 Nov 2026 16:01:31 -0800 (PST)
From: Tim Menninger <tmenninger@everpuredata.com>
To: trondmy@kernel.org,
	anna@kernel.org
Cc: bcodding@hammerspace.com,
	Eric Badger <ebadger@everpuredata.com>,
	Jon Curley <jcurley@everpuredata.com>,
	Prabhakar Pujeri <prabhakar.pujeri@dell.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] pNFS: avoid repeatedly cancelling I/O for the same lseg
Date: Thu,  5 Nov 2026 00:01:31 +0000
Message-ID: <20261105000131.2512336-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.53.0
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

Commit b739a5bd9d9f ("NFSv4/flexfiles: Cancel I/O if the layout is
recalled or revoked") added I/O cancellation when a layout segment is
invalidated while outstanding references remain.

The invalid segment stays on the layout's segment list until those
references drain. Subsequent scans can find it again and repeatedly
invoke the layout driver's cancel_io() callback. For flexfiles, this
cancels matching RPC tasks and disconnects data server RPC clients.
During RPC/RDMA data server recovery, repeated cancellation can cause a
reconnect loop that consumes essentially all client CPU and prevents
forward progress.

Record cancellation requests per mirror stripe in the flexfiles layout
segment. Each stripe is cancelled at most once, regardless of how many
times the invalid segment is encountered. A per-stripe bitmap rather
than a single per-segment bit preserves the ability to cancel I/O to a
different device after an earlier device-specific cancellation.

Cancellation is best-effort. An RPC that has already passed the
layout-validity check may not yet be visible to the cancellation
scan. Such I/O retains its lseg reference and remains subject to
the normal RPC completion and recovery paths. Suppress repeated
cancellation and disconnect requests without changing the existing
lseg lifetime and deferred layout-return accounting.

This reproduced on 6.8.0, 7.0.0, and 7.4.0-rc1. It was tested on
7.4.0-rc1 with sustained pNFS/flexfiles I/O over RPC/RDMA while
restarting the NFS service on a data server. Without it, repeated
cancellation led to a reconnect loop and no workload recovery. With it,
the client recovered after the data server returned.

Fixes: b739a5bd9d9f ("NFSv4/flexfiles: Cancel I/O if the layout is recalled or revoked")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Menninger <tmenninger@everpuredata.com>
---
Changes in v2:
- Rework cancellation tracking to accommodate per-device cancellation.
- Track cancellation per stripe rather than per layout segment.
- Clarify that cancellation is best-effort.
- Document the data-server restart reproducer.
- Drop Reviewed-by tag due to substantial implementation changes.

v1: https://lore.kernel.org/all/20260916232906.4101987-1-tmenninger@everpuredata.com/

 fs/nfs/flexfilelayout/flexfilelayout.c | 12 ++++++++++++
 fs/nfs/flexfilelayout/flexfilelayout.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/fs/nfs/flexfilelayout/flexfilelayout.c b/fs/nfs/flexfilelayout/flexfilelayout.c
index 9492d6bc1d1a7..4419ded8fe586 100644
--- a/fs/nfs/flexfilelayout/flexfilelayout.c
+++ b/fs/nfs/flexfilelayout/flexfilelayout.c
@@ -11,6 +11,7 @@
 #include <linux/nfs_mount.h>
 #include <linux/nfs_page.h>
 #include <linux/module.h>
+#include <linux/bitmap.h>
 #include <linux/file.h>
 #include <linux/sched/mm.h>
 
@@ -340,6 +341,7 @@ static void _ff_layout_free_lseg(struct nfs4_ff_layout_segment *fls)
 {
 	if (fls) {
 		ff_layout_free_mirror_array(fls);
+		bitmap_free(fls->cancelled_stripes);
 		kfree(fls);
 	}
 }
@@ -653,6 +655,12 @@ ff_layout_alloc_lseg(struct pnfs_layout_hdr *lh,
 		fls->mirror_array[i]->report_interval = be32_to_cpup(p);
 
 out_sort_mirrors:
+	fls->cancelled_stripes = bitmap_zalloc(
+		fls->mirror_array_cnt * dss_count, gfp_flags);
+	if (!fls->cancelled_stripes) {
+		rc = -ENOMEM;
+		goto out_err_free;
+	}
 	ff_layout_sort_mirrors(fls);
 	ret = &fls->generic_hdr;
 	dprintk("<-- %s (success)\n", __func__);
@@ -2582,6 +2590,10 @@ static void ff_layout_cancel_io(struct pnfs_layout_segment *lseg,
 			if (devid && memcmp(&mirror->dss[dss_id].devid, devid,
 					    sizeof(*devid)) != 0)
 				continue;
+			/* Do not cancel a stripe again while this lseg drains. */
+			if (test_and_set_bit(idx * mirror->dss_count + dss_id,
+					     flseg->cancelled_stripes))
+				continue;
 			rcu_read_lock();
 			mirror_ds = rcu_dereference(mirror->dss[dss_id].mirror_ds);
 			if (IS_ERR_OR_NULL(mirror_ds) ||
diff --git a/fs/nfs/flexfilelayout/flexfilelayout.h b/fs/nfs/flexfilelayout/flexfilelayout.h
index 09c3cd6964fd6..5d5587fded76f 100644
--- a/fs/nfs/flexfilelayout/flexfilelayout.h
+++ b/fs/nfs/flexfilelayout/flexfilelayout.h
@@ -109,6 +109,7 @@ struct nfs4_ff_layout_segment {
 	u64				stripe_unit;
 	u32				flags;
 	u32				mirror_array_cnt;
+	unsigned long			*cancelled_stripes;
 	struct nfs4_ff_layout_mirror	*mirror_array[] __counted_by(mirror_array_cnt);
 };
 
-- 
2.53.0

