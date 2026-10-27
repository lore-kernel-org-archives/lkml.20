Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102642;
	b=MFd0/KuiE4A5FzjktDaHtRqGNAWCUP/A3Qi5lgrRC8F9uSfKvdvH9qWK1MxzgeykSFBJ
	 Fj8hJkwHd+KkX8J0B9ckSfqNzeQ+wUilDkVciFGtyRgyACCLf9DstNPKvhMVKODc5QIIJ
	 nHXZf/kvF8jWdYxXGRgSfSeawzZFaceVeq9wlx5+mJlRdMVTU+LRnpzrDIDsTPX+4ahTR
	 TEaolLWUUdr291GBmq53MOzHd6A0vmruBO5n4e5vG6rYd3R34Li8sbmlQjBRaI40YqcTa
	 MLEruMfe0u9gcxkie2a9K/4T++3CMjdSEJS20g256CuHx38BAY8hWdHFWYwGVMgDI2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NZRI7OXfrCuhmjB2P6fSSq6CZTi7xapgTlqibVa79fI=;
	b=b4L18TlP/qmGeOitl4Fr8UY3grmGTqxAfVZbdhhta2EMvxC8IFUOuo4syzjxQuK6dc0e
	 k/wDPZonRJrvorHKoa0dnCt6CsDr/g2YIh+8UlaLmuP47Z75Mq0YEWWCU1Ll8St8d7CrF
	 jsZFuIIAM8Q6+GrVaQNYegzTyVgrl/gCIsdjifB4/F5j2mNRuu7YOuEOodt7H+ICBI2u3
	 zV+Xs/5b3PngA7aZOefOypYTKeV7gXkd/gI6mAVwJDnqujSjKTpjOT/e4TXgQ5LofY3Tz
	 jkI/RIVUyYuSKfSVcugDGOaDZ2HbmH7CA5pwXdiw6452aJexy4ZamOvtPJoNe8HIcGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=moIq1vOE;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1FB606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB1FB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=moIq1vOE
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso5683068a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102640; x=1793707440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZRI7OXfrCuhmjB2P6fSSq6CZTi7xapgTlqibVa79fI=;
        b=moIq1vOEWswM1P/seFXL51p+XVLibcFHi3dRCGTx/U6m/GnxMhjRL/MqnktkDVOtyh
         P1K6XFA8W/sl4WAqhPuB0Ul2o69NxX6EZtngg8tg2WjtRdlM47a766WPuYidm5k7CCRL
         wiEcN9FghZtoH2Cv1Aobq1cBM+tVJuAfg2c5ff+MFlJwEIFIC+kwXIvUAT5OXa+svdGd
         tnXphJqtzPzI7xMm1vLHSefPwcYiA2UKYQkslXR9iIP3QOUKMC/L+helhZGtblRZV/wG
         zyk5D+L00en9nK8TOsp322IHaOyTN89FIgPME7OXiLbjBt3g9BVTrKdRTPGCyiIpKQYP
         9iGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102640; x=1793707440;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZRI7OXfrCuhmjB2P6fSSq6CZTi7xapgTlqibVa79fI=;
        b=vIlSZmoDtnuTlgixKFydZK/M46yrZoAX/JwFwmfnrM//+yIoMlcT8bwtxfA7dT3e5A
         Czsjq40FSLgp+DbW0bOacSXrQ2D/e4NAT329umpN7YKAe5Qoiug1xRXywuHK0LGXwVW7
         VhPjwG5oMLVQjEM4tsVElmIaH1sRhwszCIqSK5MOZZSWEfuNN0Gsc4HeL4lzodbD+GUM
         5FjMpwjY6zz2FpGiBaLqBAy50eX5fN+hQvbeg0CJv4TREIZdszM4KEykoM6VWfrUSbgw
         cpMjb7e0dTPb37ytWX7ytsMVZSsW/LotN168yPPbKJ7QAbqwjZTHUyTbQ1M2wsZ5TSXV
         8J7A==
X-Forwarded-Encrypted: i=1; AKwUvBwsppvZhu0j26/8EyC4rONWhzNF9HsJ+K38ykrkSHmntpUnMP74kAT0oglPSpDrAT4uRA06daTJRIITagk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGA+o8wc7Xn7aPR038CtbX61N4Yhk2KRTjEX+2NWCzVI2rtW1G
	+38TVsFICsrlDco49Q0PDj7O1w4Ca8yQwBSrRGwJv8IaYluIPdv3/6/N
X-Gm-Gg: AYBFou2FW0TlUqm8dA8qBDm1oU/uV3izhmxYJZkIZeebDbtQGHDYtF8dsd2jF4R7+k7
	RDex1D0SZS8S5NSrCnZ00ujpQs/w0yAFEgF5SLZA3YQdfUj8hrf3OX+spvMnz2EaFSuRxBKX5mM
	EXRPFlXD9jHx4ifRRdrPWJ1NGkuy/qgL1hlQ8l51tRJwqiwPV8fDu0iEIdC9+DDwq7ZdIF87bNe
	9LiooHys0v3b4KvRrN7Rhls8nO/ChKCW6Ga1YgOVcYh3nX2xnrVvZgkv3eda0yiIRM9cBNVBkGx
	Xe7qpSIjFZxwhVax2VIyHg4U8NBHE+XnOlzzH3ZN7U7y0bOWinkpbHkQNaAmRDDJpiaQst3Hit5
	86JKR1O7iza9/Z7HqhiPNDnIkEwHmZl/LS+tuhWuFj3TkJXVUw8kE/VECZYD6/wGn2mzIwp+DyY
	5YjoBY/bYcWW9hYQMnW7csqYFBkPmeSKLmOV3odK8aClIDdiztjgsCoY1af/ekZY4/5ovMU+04x
	S0GMLF0SWjy4mMenU6pJ756s+53GCEeTtsG78SnoL78XqcOxQPdN6QT//QthvX+9DPefEAS8yTT
	5fg+
X-Received: by 2002:a05:6402:3d9:b0:6b4:2b7:69aa with SMTP id 4fb4d7f45d1cf-6b442ff3197mr7230849a12.34.1793102638778;
        Tue, 27 Oct 2026 05:03:58 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm22977554f8f.46.2026.10.27.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:03:58 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH v3 0/5] media: atomisp: remove the circbuf library
Date: Tue, 27 Oct 2026 12:03:35 +0000
Message-ID: <20261027120341.2305533-1-vladurares@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks to Andy for suggesting, in review of my earlier typedef
patch [1], that I look at converting the custom circbuf code to
circ_buf or kfifo, and for reviewing the previous versions.

While looking into it, I found that the circbuf API is only used by
the local queue path, and ia_css_queue_local_init() has no callers,
so as far as I can tell that path is unused. The remote queues only
need the descriptor and element layout shared with the SP firmware
and a few small helpers.

So this series first moves the remote queue handling into helpers,
then removes the unused local path together with the queue type that
no longer seems to serve a purpose, moves the few remaining pieces
into ia_css_queue_comm.h and drops base/circbuf/. I may well be
missing something, so please let me know if a different approach
would be better and I will rework it.

checkpatch warns about new typedefs in patch 4 and about MAINTAINERS
in patch 5. The typedefs are only moved from ia_css_circbuf_comm.h,
which patch 5 deletes, and MAINTAINERS has no entries for the removed
files.

Compile-tested only.

This supersedes the typedef patch [1].

Changes in v3:
- New patch 2: move the remote branches into helpers first, so that
  patch 3 mostly removes code, as Andy suggested
- Generate the patches with --histogram, as Andy suggested
- Patch 1: add Andy's Reviewed-by, thanks!

Changes in v2 (patch numbers as in v2):
- Patch 1: keep the includes ordered by name, as Andy suggested
- Patch 2: also remove IA_CSS_QUEUE_TYPE_REMOTE, the type field and
  the type checks, as Andy suggested. I tried to describe in the
  commit message how the queue handles are initialized and why
  struct ia_css_queue looks host-only, so that its size change on
  64-bit should not matter. Corrections are very welcome.
- Patch 3: use u8/u32 and the usual function declaration style in
  the moved code, as Andy suggested
- Patch 4: add Andy's Reviewed-by, thanks!

v2: https://lore.kernel.org/all/20261014111213.1967452-1-vladurares@gmail.com/
v1: https://lore.kernel.org/all/20261012230754.1914517-1-vladurares@gmail.com/

[1] https://lore.kernel.org/all/20260918214132.1135549-1-vladurares@gmail.com/

Rareș-Mihai Vladu (5):
  media: atomisp: sh_css_mipi: include assert_support.h directly
  media: atomisp: queue: move remote queue handling into helpers
  media: atomisp: queue: remove unused local queue support
  media: atomisp: queue: move circbuf types and helpers to queue_comm.h
  media: atomisp: remove unused circbuf library

 drivers/staging/media/atomisp/Makefile        |   2 -
 .../base/circbuf/interface/ia_css_circbuf.h   | 363 -----------------
 .../circbuf/interface/ia_css_circbuf_comm.h   |  56 ---
 .../circbuf/interface/ia_css_circbuf_desc.h   | 160 --------
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 312 ---------------
 .../runtime/queue/interface/ia_css_queue.h    |  29 --
 .../queue/interface/ia_css_queue_comm.h       | 135 ++++++-
 .../atomisp/pci/runtime/queue/src/queue.c     | 369 ++++++------------
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   3 -
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   1 +
 12 files changed, 248 insertions(+), 1185 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c

-- 
2.43.0

