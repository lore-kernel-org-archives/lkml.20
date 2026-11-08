Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175067;
	b=4c82WEtu2BzGtEr5pfHD7mis6QrhngStmMvS1JgJHguQdCn+olcbzaQXhCnxDa9N+Geu
	 9br+Uw05d+GjWeOnpuY4hlMSpIk5bRVrC6f7bURvGlRA1PjhiU2+H12MisMcNWRLMHrX4
	 FhJ37Zl+wi6Oo5+Ckls5FHoxJEAujcaaDXz+bIkWNVBC9tcQB1+HkQprceb/S5xLRYPBX
	 DCBJ3MQKvS4ENDsCQV/vOAfJkFmEVBjLYYCyA1u55rAVJiheU5a8W8oa30kAE7MfAtvfS
	 bf9K46pzB52rVct5+3ynBffAgjs/OVC2M7gI/Sl7SS/0NJSGBInQA4Agih2GJE0xuiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NEt1lF7lxMBZfEDAydvjStbcmv5IqrrXjrjqRLLY++8=;
	b=iLO2Qw5g32wODNk4BbusJCgYVBZPyAOYP9G6z/zQAbhhNdbTQyaraPvq6WlXm5wxUIii
	 lzN8vWTYWQS53Phq5+nPdA8zI1E4aUh3kcc60b9h2CpRthhcNmSTrAtWAXdYRsdYXsw+Q
	 M86NV27ozQ8ODXBAR//ON9abMWENrxCdS1NOJknI7fPk1b7CbMiAFv9Fpfn/GjNkifzDs
	 XI24ly2Y31xWS1LIHXxqv7pDVs20ZUxGn5aYuM1Y86uW3HSVhWGKbILgR35xny8HukKFw
	 wbrFkSpOz3vaZk/MtVDFxnuTX7DJ2HdCgsCRZBqTWoTDes3ocKXKCqJBJ9YNTyExZQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIWUbUKR;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35281606A334
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35281606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIWUbUKR
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb684859cbso157007a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175066; x=1794779866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEt1lF7lxMBZfEDAydvjStbcmv5IqrrXjrjqRLLY++8=;
        b=zIWUbUKR/SgteTooNkhndFRULR3qfUVIFJB39sHl4Bcp9kMrSa328FUtlTAFTWESfw
         vn7qL0obvVnpGHrGSnHYn9EwVVvu4sX/QD2favCLrxh3+ZzqzDYsuewcd2e7yimDk+IH
         2YT+Vir3pSmfGuMuxZVDN8/ueMYGuAiflE1AyY5saPVBplx2nzrRSNjEIuANTw20KNf0
         D7uQ4KkPEWd34Xu2PSyqHVQX1PB1MV8r2orhgsNjsGabSE9FG9tQLhW6EWw9CvSiJyNV
         t2PiIGrOgExvCyfjEAcqcxDol9pO/3ItFOuuCb27KyKNxx8dmd5XTPS7QSy22oqahk0d
         zvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175066; x=1794779866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NEt1lF7lxMBZfEDAydvjStbcmv5IqrrXjrjqRLLY++8=;
        b=RBGgv36THCLkxouYZX6gTqux87Bv95kGpyhIXlGcKkggcd90x8iQWWj6faMlOAqJ9g
         +LWXlRxKcs4Q6jQ/P2ZgXfe6UZsmxB/x/eMYZBCnY2LGvVVy42eI+3udtWcS8F/VDH+E
         J242aXiSxmRjHGvgDc8X0lmtADMAh4U3si0+cq1vety4Fmx28xfzK/eAZDPHky2KVgu0
         jhuT5tn183UfARSDghKqKbF3mYOjSRW29h3fPKYk0hPV68j5iIIAOd56yUIixWRykEjQ
         eMwHCuqgcsJqRdb4mSVv/8wphbR31GMrudW0NR+fkEhaFH8LxaKAR21Zv2nwbftH66lr
         b/PA==
X-Forwarded-Encrypted: i=1; AL+hErEQ1DrQQelqlzqPEjoLOctearVi50mLsOYxIOzj25uUnuTQixke0eXVdssrXJ4n5y5Imq1JpuUcGzqpErc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kmrzwt/fTwDp5dQL6k3HsYkgN75ZWaS6HqGAIq7kJHxkgIbfn
	TuxCKjKu2jtfzHsQ3DK+PqWP4j2JMoxh4oQyWfyhnLGti1T/79X8u+52yLh2Ww==
X-Gm-Gg: AYBFou3QfNEgXSX+rTTjYnyfkV9ucdVyMw1WNMp8WEAYabERYgRcGmrVjWIgKi/ENuM
	umoPVKrK6b2jPpmQ4yc6g1m/JTSO+gyMtGzpIMb6E/OQwFYRxPmL1uNsBLFFEzXSY4DYFUaV5DP
	cFw3lmp97+X9QdCDlNK3zziRrxWxGCmwiSO57+vL6Dla8D2nh6faHyZ5wg1JltGiVixfaOFYPZd
	I2I4VRwYI7NqWBRyxJjk2N8Y+Tlh/yy7Gfvk4NLtKjFeRn/u13qGhhFNmCwfLSmK2FHcnMOGLK+
	0fkdTbRk44p0VwL8IdnXin+QRzvwIobcdRraF0FO0VSLppnQylXM6LPcPVvTOqSIgL+MXhUFpR9
	1kyg/+9UDMqtRP/OQB6R/VoP9MRiEbCgFHNA8GX7FZf4VPG5/c2DtOjHVqBqaHUzC8id4daiUod
	y9Oybxc43ekCy06LFqNUx69C4oMpv4GgUth2aAlsXEPJcusCAiOePs3mqX4kOcQ1Idkvi30DsZV
	aDx5GmcJX08Q0DSq8b6NoAgxKuonnViCU4r3xchLv+qyNMugzG/C095YcYoSMjDvrqvW2FcwCYe
	sGjlWzzAEWCVQAHNaQ9gtZ7HnPE9BNOBYkzKDUsHkhVhuJkqAV48b+9qF6Tx+DaRDdizgawfxuP
	CrdBCyZISX8DIMJoLaRBNOM/Y3WtHT5znWkkOepdxWLcnRXq0kvEt/WQGpM+SBK7tV5EohRK0Gi
	BLHQ==
X-Received: by 2002:a17:90b:1a82:b0:3ac:9176:e83c with SMTP id 98e67ed59e1d1-3b12d31a3f0mr2278470a91.12.1794175066527;
        Sun, 08 Nov 2026 13:57:46 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm5692976a91.9.2026.11.08.13.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:57:45 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Alban Bedel <albeu@free.fr>
Cc: Radu Rendec <radu@rendec.net>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 0/3] ath79: flush every write buffer of a shared CPU interrupt
Date: Sun,  8 Nov 2026 13:57:35 -0800
Message-ID: <20261108215738.113582-1-rosenp@gmail.com>
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
Content-Transfer-Encoding: 8bit

On AR934x and QCA953x, the WMAC and the PCIe root complex share CPU
interrupt 2, but each writes to DDR through its own write buffer in the
DDR controller. The ath79 CPU interrupt controller flushes one write
buffer per interrupt before running its handlers, so only the buffer
listed last in the device tree gets flushed, and the other device can
read stale descriptors.

Patch 1 documents in the binding that a CPU interrupt may be listed
once per write buffer. Patch 2 keeps a mask of write buffers per CPU
interrupt and flushes all of them, and documents how the interrupt
lines, the write buffers and the flush fit together. Patch 3, suggested
by Thomas, starts the flushes of all the buffers of an interrupt before
waiting for any of them, so they drain in parallel, and replaces the
"It must be run twice" comment with what the AR7100 datasheet says
about it.

Patch 3 changes the signature of ath79_ddr_wb_flush() and its call site
in the irqchip driver, so patches 2 and 3 should go through the same
tree.

Changes since v1:
- Add dt-binding change.
- Add a comment describing the interrupt wiring and the write buffers
  (Thomas)
- New patch 3: flush the write buffers of an interrupt in parallel, and
  document the double flush from the AR7100 datasheet (Thomas)

Build tested with ath79_defconfig (LLVM, W=1).

Claude Code (Claude Opus 5.5) helped write the comments, patch 3 and
the commit messages, and searched the Atheros datasheets for the
double-flush requirement. I reviewed all the changes.

Rosen Penev (3):
  dt-bindings: interrupt-controller: qca,ar7100-cpu-intc: allow shared
    write buffer interrupts
  irqchip/ath79-cpu: flush every write buffer of a shared interrupt
  MIPS: ath79: flush the DDR write buffers of an interrupt in parallel

 .../qca,ar7100-cpu-intc.yaml                  |  5 +-
 arch/mips/ath79/common.c                      | 51 ++++++++++++++-----
 arch/mips/include/asm/mach-ath79/ath79.h      |  2 +-
 drivers/irqchip/irq-ath79-cpu.c               | 44 ++++++++++------
 4 files changed, 73 insertions(+), 29 deletions(-)

-- 
2.56.0

