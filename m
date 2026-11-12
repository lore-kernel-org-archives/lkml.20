Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523509;
	b=Pkmq+Bol6cqsfxurrvrtjM+yZMzhze7y5yq0AVoGGsNQgH5DkcjfH3Cw0MNk5e6M218v
	 Kn1FSMAJbEk0Dr2m7WLvEfElYDhB1LCrr0p6AQMa3qBvStLAA10lgxqgwiOM7whngMBE8
	 kWQCWVOFLz+4jqTe3pU8ptOmdqb6Wnhb3oOqz2lXZLACzEtJbxC7wVBwxizJRvkyV4oUu
	 gduLRT6xP3hQDxXCFy5v6vsZLaW2Jaq9abI5w97h7+LO0Qu6xCBGdF1BV7yvK+lz46R3F
	 Q71NhiXLFkKxmU/uPgCniZ6tBEu7gXtj393CcK2jd/Z+T9gnijNpz181ErVFBBd/Vaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8tqnSgVZpqPW8BsWNmooETTnIE7/WkUkogSOJRF5jZI=;
	b=4Zd4Adz/y4APwJ1alHPJkW4V47ra7wfnHYmYnnKsMg/UU4ZS7yf4px87ttA/47qxzxht
	 7x6sSYSOXIAagDXQoJqKTRe8/KOWKMcokzL4dJ4R2yYf/V7Bfoyp0XnJyjSFa/sbG+5gg
	 6eaZ/fQv0pQNBeRbTdJ9NI9Do80gaewlV1KLX62kdgUiL2L5YD3qUsUA0YzQQcp+tNlk8
	 BzHHs5EflJWRrPFsFYKwbeY8w1UDdomtv+OxWL23KCSSiYeTY6m0AKSGNJmWvmitSmlC+
	 /V/S7q7ro2+i3i5//yjNzv5N5FcdUoMQsK4LO+nfjQRoHZM2YG+Y1CZn7xeufPXnEbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaYyOYy3;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F613606A337
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F613606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaYyOYy3
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso130060a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794523507; x=1795128307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8tqnSgVZpqPW8BsWNmooETTnIE7/WkUkogSOJRF5jZI=;
        b=gaYyOYy3ceE2MsM1X6p0A1KQqpuy4aosm6kLHi2JCVy3IPVy2YUDQERQJomEdX/fZ5
         cNngAAfWiPPBjiJY+EI9u5bESaDUZYR/3ga3veG8oY0/UQ0e6kLX2OHmEg2le9L7lb5B
         BRXfdgA8Gc9acr5gP7GEWG6GTKVTZ79cKiml6J+9ED7q2wCh6xt0e6/zdBvF1vlpr5Ub
         RYjOMGaKCC1Rb6CEj9yYM5fp5PjUAVm+S1IsrOui2OHj57dJAYy+j/L2cCKcfYw6eMva
         tJw8IjGHzbiviLK+FgfbTRYD+64okgN1hsDM6UN4w6r/U6qiD6V/5SMQs41FkWpfz1o2
         udew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523507; x=1795128307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tqnSgVZpqPW8BsWNmooETTnIE7/WkUkogSOJRF5jZI=;
        b=pejIjrI04e1/pjP2yKbRLar0TbdVAJhi7rw/gZTPp3pvubDlgFmTM54nuxdEup4iUf
         cgFSVYvsTv5Az7HoO80MrlwaA1QfwWiy7hTf+zNgyrUD/zB8Ej/lqgXfUXG5r6AKi4HG
         r9Po6/hNLW37MNJMFqDJufnCNlwFukIqiZSsmuEFULZMvoem3JkSNy/UH5KqOmCX/VNq
         3Fqa5AcjsgOd83IfpJ+L2PPDpD6Z549Nc6T0+9DC69QvNx9bxU2qUudupMZSM9FhMbSS
         Fc5mjrtFBAhQ3v20OzBJhzm3x+pypwdjzC42HFw/VCBEDRfrfC+C0+fI7MWxuHayDTai
         2uEg==
X-Forwarded-Encrypted: i=1; AL+hErESZwoDb+uFry/E9D3csN4fPrQZeBkYACKYFP9FHYa5/1euLUUjv18E9RPG9AxDFwCLTDNKuyfNqkahH5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VSMpw+SpufbUp+HifZrqi0vc/y5oy4m/Dr9vpbRB4vU0ov0/M
	Rl3M2FKb4opd30f7SE10uvcPrq8VyIqxw45sd3gIj+Cbwdcu83ZkVaNu
X-Gm-Gg: AYBFou3pPTM6p3amL6jj5Ys7FE3MGU/sEw4zQA6/w4EtxgEhjuASjS0sxo7VG+6+wIJ
	bq289yw3mh0W/K+Ow3OjUeSsSdjxhHtyVyOi6lAAZebUKwonw1IMGrcKRI7LyZK5zLBtYTb8nDG
	rZ+CUgj/d1ydBorXt/bCIIx18oFBYa4CKVfIW5PdEjS1t/9tMG8EcmuJJkMz5gpRF7fvN+1Kbh1
	YSFcKnMGz3EVliDDwONrFrpZNIHty5r+seNAlVweZ6nkz+1r1VFPnja0SeyXA7hJnzVrHaDUzkF
	xLdaZ3osehjhTRef+4ex93BgwJsJeruwrVDrBLYE6OIZwhoFAmCt7EmiwQWn3VNOihlHl8NKA+D
	vLAjjqQ+obTiNAQKuJsBmXgaxp/0SVN04nZkKsr/u4qFcgOpMCc9tHtCyqLw1/EboWtT7YOsymq
	VlHdZAN8E7Y7+pl4AHAqQWb80ult9VS7AZ3TE4p/sANq2XqKbJtFS8MIqvWeeq8MceAHaOsgUs2
	ANFTJt4cEn5QRxoX9i2Aot36msG5GdzWUGMEzgwoAzwf4GWTY1DWOQfvxE+hP70z/0aYgBLiqjH
	o4d3MA9x727z0GYA37hgADI4LkSMOLn3vU2Dubc0dImypm58ZdbHM/pOVW00aysYpKIp0IY4lng
	/l5n1xCSkSHO0ikil+SUlgEWGvBH9MPjm5vvbC/MN/KEsiFKW8R5ybzmTd5VHthOvCyxXVf8dm4
	Bylg==
X-Received: by 2002:a17:90b:4c49:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b1b0a3a7fbmr402428a91.31.1794523507457;
        Thu, 12 Nov 2026 14:45:07 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm37073a91.4.2026.11.12.14.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:45:06 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Radu Rendec <radu@rendec.net>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 0/4] irqchip/ath79-misc: probe as a platform driver
Date: Thu, 12 Nov 2026 14:44:41 -0800
Message-ID: <20261112224445.213324-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The MISC interrupt controller of the Atheros/Qualcomm ath79 SoCs is
cascaded from a CPU interrupt, and all of its users are platform
devices. It is still initialized from IRQCHIP_DECLARE, before the early
initcalls, only because the MIPS perf code asks for the performance
counter overflow interrupt, which goes through it, from an
early_initcall.

Patch 1 makes the MIPS perf code look up that interrupt when the first
event is created, which is when it is requested. Patch 2 makes the ath79
MISC driver create the mapping at that point. Patch 3 then converts the
driver to IRQCHIP_PLATFORM_DRIVER with device-managed resources, which
also fixes the leak of the register mapping on its error path. Patch 4
adds COMPILE_TEST coverage, which a platform driver makes possible.

Patch 3 depends on patch 1: without it, perf would ask for the interrupt
before the controller has probed and would lose its overflow interrupt.
Patch 1 touches only arch/mips, so the series could go through the MIPS
tree with an ack for the irqchip patches, or through irqchip with an ack
for patch 1.

The other users of get_c0_perfcount_int() (generic/GIC, Malta, Lantiq,
Ralink) return an interrupt that is set up at boot, so calling it later
does not change anything for them. The perf boot message no longer
prints the interrupt, which is not known at that point.

Tested on a TP-Link Archer C7 v2 (QCA9558), with the device tree from
the pending series that adds it: the MISC controller probes as a
platform device, its users (UART, GPIO, watchdog) probe with nothing
left deferred, and perf record gets its samples from the overflow
interrupt on MISC 5. Each patch builds with W=1 (mips, clang), and
with patch 4 the driver also builds with W=1 for arm64, x86_64 and a
non-ath79 MIPS kernel (Lantiq).

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to write
the patches, test them on the router over its serial console, and draft
the commit messages and this cover letter.

Rosen Penev (4):
  MIPS: perf: look up the PMU interrupt when it is requested
  irqchip/ath79-misc: map the performance counter interrupt on demand
  irqchip/ath79-misc: convert to a platform driver
  irqchip/ath79-misc: allow COMPILE_TEST builds

 arch/mips/kernel/perf_event_mipsxx.c |  30 +++++---
 drivers/irqchip/Kconfig              |  14 ++++
 drivers/irqchip/Makefile             |   2 +-
 drivers/irqchip/irq-ath79-misc.c     | 108 ++++++++++++++-------------
 4 files changed, 88 insertions(+), 66 deletions(-)


base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
-- 
2.56.1

