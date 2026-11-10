Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328019;
	b=QQ35KxRZdAwDwCTJnGLEPoqvdJLHP6/1xf7R8ajgM4wzu2a4FF9KmyNcZcRioCXnxaZn
	 477pk97MPyoiCev76pn0GjiUgHTREWvRABgw8dO8xYvSZcHFqxkzPWcOURyu1d1MZXzRX
	 oE5HBlqo2xubL25JtH50t0DvBMHD7+vZQO1yvmcdVsONiUTeoEOs2yzQeSwPKy0w4HdnE
	 8Gj8sMlplOA4DSW87Th8G0zhbPeteMobw1g5ISkeA2FwgUcO0aL9jc+eJIO6EUkaYKBGq
	 EOlHaTHUIgyjaizb6Ctay4LkrgMny6IxmTPts0RJXn53+et6NKe+LXoukxb1lwauigw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GMzvWX5SagEzJ935EqXTIXPmka1A6zL3HJbqIIx4Z/A=;
	b=op1VZkwYpcVfpzj4MrAxeFTceUPIEA6ObN4mHffAR+Ome6ZBZ+IfH2IaU5Y/TQ5c94XH
	 OSSBFXOSo4P33zCi/7psnrezi1kahw2pnDkG6lVOM//3qPrcxqPSuhOtd8Ibfn0FUH331
	 YnfQ6L7CfjsaLVJSCYGaDwBDlZxWxkHzaHP85KfG8Y+VFbdXGorlpbGWRedWqC1SRBSpX
	 itbxVyKMwSMGhb3gO0IX2h4O2khZJGlmCtBhREpJZmpJMpsFGwrxGdo7EvOZ882gOyW2n
	 Rln1oULDBLtaKlBE6ee2ccq+QS+FkFWD09Is8+2Z680qgCLpW/CZnqr9zKWZE7ny5dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=pqwpI6cg;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87539606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87539606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=pqwpI6cg
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4910b863b84so1412325f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1794328017; x=1794932817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMzvWX5SagEzJ935EqXTIXPmka1A6zL3HJbqIIx4Z/A=;
        b=pqwpI6cgLMcJ9jpLt7fG18c7wnnyGzk1XGtu/Q2QbCwgAh2JGHej+3DZoWo1jzmmyB
         jo+0yaVek7L9Y7l1N/R9jhYMVntK3WEYUGuu4w6103iVYBwMaj3IZ0JBma8Wlkv64hnH
         /klRWmrxfgyN1Y+fRiots9HSSjLTly/oTHzBQOHSXqmd5Fym96GUk42gVxo57c08trR0
         M/1k1UVKN6OavPTyzUnBxPm/YHLrp42fYSvlLLi1bqHBm4Pa+QXordKtgaJb5D7iXrac
         p0mTfpFU3w0vb25eIldDQcR+onEWyfReAp+RLljIanNWfmdrRD9Npi2QP/CPMx6tiRoX
         LmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328017; x=1794932817;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMzvWX5SagEzJ935EqXTIXPmka1A6zL3HJbqIIx4Z/A=;
        b=gZW3rV+B/t3/rRpHnHfBbk56V2r4J5xgEldJyxUCq3QyM+9qedvtP/hsVpu4pnR6on
         uxCKQ84AK81CIFmwaMrv1/bAU9MFZcpcI/gkTKM9u3jprJ8IbCmiCnp38nVG1XP/aFkk
         vCxcLD0GKrhgXJpTwA0RsYpb+Kv9sglIgs/KYCZQEOh+08pXagpJp9mxgBImXAQOLimc
         55uhILJZO3qMLOH4h/glH7jzhsR4MgSogy4a1PaGY0xf9BPA4Z5wfKyJ+2v5RmbX/qCf
         vYFI+afLqsjMikY/nfMh+cYMq9efG2+6441SqzkE7Z8PfKdVY8A8+6tf758LBck/odmA
         SWXA==
X-Forwarded-Encrypted: i=1; AL+hErFhocKoPXrgBlox6qF/Qb7g154yzutWZVfGE/Wuh3ceppOvO3fjvqwulhkjwQD3U2Bb3W++sCXVPviKA8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S6Mczfp3wAV9M4dgEtlfPmT1J/iqdeucEu35H9Hn1vPxr/Wrm
	QYFbf6GAdCHpfaQWWr3D+mUBWLAJFEgX8aRAgpUz4WAd8LHQj4tXBd0nGkmNCK1NnTQ=
X-Gm-Gg: AYBFou0I9VYU5H8SV4dyLK2smR1PVEVZnVdWVA/XloETzmJibA+6lCWmaP93Z5LQaGO
	xI35cwZIcrsuDXjZU0Ttqdb/nqftX4v1HJo2CysTOgCwQTLMHsMQDRT/t2mwe5uIA4PoK2VtDuk
	CfKQmGVYg+94n39CLZWYvXvwq/g2AxdPREUfspxp16nXACxuqhEOSciBUWJ5bEFqbY5Rgl6wEwj
	Do5OQRsojc6f90+j+ziFz2gXhydmx2TSVEoXqgM8PXku7M7bxnMG9ymAmwqNY53tZDz7n4D9uiQ
	i4LDJbru3S/mtBJfL12MsZCPO3NIOqz51qrwKC6ZEWQChhzEiA/PoKtJKXxdEY7OTaHFzjgRKZS
	RNAZUhhEt22NZU0P5/c20y/I9BdncDuyEtXTzTkEXnxk7Iw8AVTwYj9+Gx9nZDK5791d8SQNZW4
	ccUxFSZoUuv5Y4uCd3wZNe7mhxNRIT06rl3jMGyZVZTwLodxhkv7Rxzs/6kjMDVWGHEfvlyRlg2
	WZ2tdru5YqY8WZ2aLAkpqZuObdlzbO8ha3aCOhfSg09YGsZRgqv1TVHjox87gS/Rlo4gl//4kKu
	jcHrBudCpxUCrAotOUbR645+DiB15o+x8SHBxHj3o+fR2NjZdLvFz1lpzVjo0IZrgqtlWaW9JQ=
	=
X-Received: by 2002:a05:600c:348a:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4ba0234d97amr55868865e9.12.1794328016738;
        Tue, 10 Nov 2026 08:26:56 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02345d22sm85050695e9.1.2026.11.10.08.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:26:56 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v3 00/20] drbd: DRBD 9 rework
Date: Tue, 10 Nov 2026 17:26:25 +0100
Message-ID: <20261110162646.3028472-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
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

As discussed (context: [0]), here is our DRBD 9 rework series, intended
for linux-next via for-7.x/drbd.

This replays about 10-15 years of active out-of-tree development work
[1], depending on your way of counting. The out-of-tree module has
severely diverged from the in-tree version over the years, which is
what we are aiming to fix now.

Hopefully that somewhat excuses (or at least explains) the massive
diffs -- we've tried to come up with a way to group the changes by
topic, but I realize it's still not exactly trivial to review.

We've been polishing this series for a while now, and we have taken
great care to make it as "upstream-presentable" as possible. That said,
there are still probably imperfections. It's a start -- feedback
welcome!

The netlink interface has been reworked so that userspace is not
broken: the existing "drbd" generic netlink family keeps being served
at version 1, and this series does not touch its generated
serialization or its UAPI header.
Every shipped drbd-utils release therefore keeps working against this
driver. DRBD 9's own utilities speak a new family, "drbd2", written as
a YNL specification under Documentation/netlink/specs/ and following
current genetlink conventions; its generated code is checked in as
usual. The driver registers both families and translates each onto the
same wire-neutral core, so the multi-peer administration model is only
reachable through drbd2, while version-1 clients see the single-peer
semantics they expect.

The RDMA and load-balancing TCP (lb-tcp) transports are not part of
this series; they will be submitted separately once they have had the
same treatment. The rdma_ctrl_rcvbuf_size
and rdma_ctrl_sndbuf_size net options do remain in the UAPI: they are
generic transport options that are interpreted by whichever transport is
in use, so there is no reason to remove and later re-add them.

The base for these patches is for-7.5/block, which has the preparation
patches [2] this series builds on.

As discussed, the goal is to get this applied to a for-7.x/drbd branch
so it can land in linux-next via block-next. After letting it mature
in linux-next for a while, it should go in via the block tree.

Thanks,
Christoph

[0] https://lore.kernel.org/linux-next/899e0337-9642-4ca6-9050-aeab14fa22ef@kernel.dk/
[1] https://github.com/LINBIT/drbd
[2] https://lore.kernel.org/linux-block/20260923140608.1116713-1-christoph.boehmwalder@linbit.com/

v2: https://lore.kernel.org/linux-block/20261006154607.3936501-1-christoph.boehmwalder@linbit.com/

Changes since v2:
- Rebased onto for-7.5/block, now that the preparation patches are
  applied there; v2 no longer applied
- Kept the in-tree DRBD changes that went into v7.4: the explicit
  linux/umh.h include and the conversion to sk_set_nospace()
- Synced with the current out-of-tree state


Christoph Böhmwalder (20):
  drbd: mark as BROKEN during DRBD 9 rework
  drbd: extend wire protocol definitions for DRBD 9
  drbd: introduce DRBD 9 on-disk metadata format
  drbd: add transport layer abstraction
  drbd: add TCP transport implementation
  drbd: add DAX/PMEM support for metadata access
  drbd: add optional compatibility layer for DRBD 8.4
  drbd: add application/resync IO synchronization documentation
  drbd: rework sender for DRBD 9 multi-peer
  drbd: replace per-device state model with multi-peer data structures
  drbd: rewrite state machine for DRBD 9 multi-peer clusters
  drbd: rework activity log and bitmap for multi-peer replication
  drbd: rework request processing for DRBD 9 multi-peer IO
  drbd: rework module core for DRBD 9 transport and multi-peer
  drbd: rework receiver for DRBD 9 transport and multi-peer protocol
  drbd: rework the netlink core for DRBD 9
  drbd: serve the "drbd" genl family at version 1 for existing userspace
  drbd: add the "drbd2" genl family
  drbd: update monitoring interfaces for multi-peer topology
  drbd: remove BROKEN for DRBD

 .../application-resync-synchronization.rst    |   208 +
 .../admin-guide/blockdev/drbd/index.rst       |     1 +
 Documentation/netlink/specs/drbd2.yaml        |  2600 +++
 drivers/block/drbd/Kconfig                    |    43 +
 drivers/block/drbd/Makefile                   |     9 +-
 drivers/block/drbd/drbd2_nl_gen.c             |   810 +
 drivers/block/drbd/drbd2_nl_gen.h             |   113 +
 drivers/block/drbd/drbd_actlog.c              |  1373 +-
 drivers/block/drbd/drbd_bitmap.c              |  2075 +-
 drivers/block/drbd/drbd_config.h              |    45 +-
 drivers/block/drbd/drbd_dax_pmem.c            |   175 +
 drivers/block/drbd/drbd_dax_pmem.h            |    43 +
 drivers/block/drbd/drbd_debugfs.c             |  1758 +-
 drivers/block/drbd/drbd_debugfs.h             |     2 +
 drivers/block/drbd/drbd_int.h                 |  3930 ++--
 drivers/block/drbd/drbd_interval.c            |    37 +-
 drivers/block/drbd/drbd_interval.h            |   130 +-
 drivers/block/drbd/drbd_legacy_84.c           |   641 +
 drivers/block/drbd/drbd_legacy_84.h           |   116 +
 drivers/block/drbd/drbd_main.c                |  6812 ++++--
 drivers/block/drbd/drbd_meta_data.h           |   170 +
 drivers/block/drbd/drbd_nl.c                  | 10232 ++++++---
 drivers/block/drbd/drbd_nl.h                  |   400 +
 drivers/block/drbd/drbd_nl_84.c               |  3622 ++++
 drivers/block/drbd/drbd_nl_defaults.c         |   168 +
 drivers/block/drbd/drbd_nl_drbd2.c            |  2589 +++
 drivers/block/drbd/drbd_nl_types.h            |   402 +
 drivers/block/drbd/drbd_polymorph_printk.h    |    37 +-
 drivers/block/drbd/drbd_proc.c                |   327 +-
 drivers/block/drbd/drbd_protocol.h            |   614 +-
 drivers/block/drbd/drbd_receiver.c            | 17304 ++++++++++++----
 drivers/block/drbd/drbd_req.c                 |  3188 ++-
 drivers/block/drbd/drbd_req.h                 |   332 +-
 drivers/block/drbd/drbd_sender.c              |  4445 ++--
 drivers/block/drbd/drbd_state.c               |  9203 ++++++--
 drivers/block/drbd/drbd_state.h               |   334 +-
 drivers/block/drbd/drbd_state_change.h        |    80 +-
 drivers/block/drbd/drbd_strings.c             |   103 +-
 drivers/block/drbd/drbd_strings.h             |     4 +-
 drivers/block/drbd/drbd_transport.c           |   545 +
 drivers/block/drbd/drbd_transport.h           |   487 +
 drivers/block/drbd/drbd_transport_tcp.c       |  1805 ++
 drivers/block/drbd/drbd_transport_template.c  |   164 +
 include/uapi/linux/drbd.h                     |   305 +-
 include/uapi/linux/drbd2.h                    |  1038 +
 include/uapi/linux/drbd_limits.h              |   138 +-
 46 files changed, 61765 insertions(+), 17192 deletions(-)
 create mode 100644 Documentation/admin-guide/blockdev/drbd/application-resync-synchronization.rst
 create mode 100644 Documentation/netlink/specs/drbd2.yaml
 create mode 100644 drivers/block/drbd/drbd2_nl_gen.c
 create mode 100644 drivers/block/drbd/drbd2_nl_gen.h
 create mode 100644 drivers/block/drbd/drbd_dax_pmem.c
 create mode 100644 drivers/block/drbd/drbd_dax_pmem.h
 create mode 100644 drivers/block/drbd/drbd_legacy_84.c
 create mode 100644 drivers/block/drbd/drbd_legacy_84.h
 create mode 100644 drivers/block/drbd/drbd_meta_data.h
 create mode 100644 drivers/block/drbd/drbd_nl.h
 create mode 100644 drivers/block/drbd/drbd_nl_84.c
 create mode 100644 drivers/block/drbd/drbd_nl_defaults.c
 create mode 100644 drivers/block/drbd/drbd_nl_drbd2.c
 create mode 100644 drivers/block/drbd/drbd_nl_types.h
 create mode 100644 drivers/block/drbd/drbd_transport.c
 create mode 100644 drivers/block/drbd/drbd_transport.h
 create mode 100644 drivers/block/drbd/drbd_transport_tcp.c
 create mode 100644 drivers/block/drbd/drbd_transport_template.c
 create mode 100644 include/uapi/linux/drbd2.h


base-commit: aa7014f8d7565cfea117eac36a5de0a05eba65a4
-- 
2.56.0

