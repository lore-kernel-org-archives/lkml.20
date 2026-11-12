Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456976;
	b=Wo9IskiOsGM/3JucZjytCbcTHB1HxQVzzruVjbIZ8CsfnOi16kodK9j8HrZuhpIS6Hpx
	 vcfwgjcsBiTQeY9tXvF80eeB/8EVAbbOe75oHcTRrdxtr1Oq+e0xmfflMGVUUQJmxBjx6
	 QhhzofuBePcRNXpjFB3eR/f9tfPPQ53gZl4tvPS/BPyGPkjVl3ITGBI/ePWN4svyJ49Hd
	 b0Db6ExipTPo+Bblt8TujI9x/LUHCffhs4ADJwb0+MLWZ49ko1KUz0HaAE8+BIKXpdPIX
	 R+MSy6tfN77sU1AuYAqQAROb9/SehuZu8kcBV8PC2OVkmOV8bUX5LbUksGnQgqCoMdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ta4OcVdC52VTSti63ovhxU0ir4j7mfUIFix2+gqdIQU=;
	b=PcDDZqqHRPGupVRL1ATgVxGQiaiYwVAizmVPw3H1HdZyx8olHEdgcVGWETY4K/dzo2Fz
	 g50a0yRqay8A7DAj/QSiL56kLH+AjfVbsrP9hzD0U8EUD2bzZsV08cIUkYzMiysEdRooz
	 BakYRUIFLPa/Wa8Vf5X8y3y1Bs92oaWkH0MUDASN9SGNs2xZauVG5zni13IJ3MifHP6/V
	 xubJkbBEqJxJobT01ZMAxKucm7V6sE0ghYrpgBES1HcHKlSwUZ/OQgUdLa3IXY9zhQxgP
	 9AQuTZlYlkeGZgAHwoTEU6tRF5Vr7iyT+JFSkzP7q3XstvjkfAh8rnLj3pqkpSrZ0mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXuyiUa8;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316AA606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 316AA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXuyiUa8
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-170135e43c7so2128455c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794456975; x=1795061775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ta4OcVdC52VTSti63ovhxU0ir4j7mfUIFix2+gqdIQU=;
        b=qXuyiUa8TtGAE2ahyCjJ/Qgbrr2DmNEju5YPemZneiCeG/lmpricA0v5dkOskpD2vB
         2gq/8Uq+4dKO1q7bwSYzxpZb77nCyk2Org5mZ8JXStG/Zl+Qa1nMlCBaQBo+7DsqS+7I
         xXoY9KMSIqsYGLOZkdyiDzXPbhgXCiTOoSEBqobpiXYceIVcBx98Tu3oS/8pZ/BY2w3R
         G8ptGoNwoe0yUIQvjG2gVbvOGnloeVTnpafhYg5C/pCYQj7uzzaLPTSv3J00Hl5g5//i
         CHygp3VDDw+tQ/u/Exhtyfxo4dw8KcANVGf8P+KqQoIskqwvejBLap4JStPca3rkAQvk
         puJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456975; x=1795061775;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ta4OcVdC52VTSti63ovhxU0ir4j7mfUIFix2+gqdIQU=;
        b=mUbGzBWKc1CKmJo2ZDM0tfUa1kn5JulOYx4yyaeKL0CchkGi/JcXM7ZoGTAnimaB6M
         514DZQJnTSTKmXDKq8WDxwnVYA8cIBVjQ/iJiefiKd84vp90Ontrf1AVqsGdYtf3A4FV
         2d4bAMjPohwVc8rlNLjpt3DQ+bhAKMhulVDV+ee/Eb3pL5WF3WGCRxfg3dD6Y3iJRBxG
         Ov0gZh6ECH+gMXh/KPB7fOEHevRBrW7dqe2o4896iEWUr3wk4sRxbVWJ4dm5KNjPZSlQ
         xfmGezIv5qtOET/Oyt6GMpQWYMfFq8NDYSip8S+OYEBv8/5flSaRq6lhoix4yc6Ni44U
         cYTQ==
X-Forwarded-Encrypted: i=1; AL+hErGe5xlgcmWaSgCocgR0vSNF5X2rx96/AvNdsfVmnsMnIzDkAietBaYMXgGLYoCJs/64aZRNUUhKyE9iXjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jf+vpfVp7xmKvKqtC3Xgean/nF5/CErflxEi7WCvlMvZmQ3F5
	oEeVsMYQqYPgvrFz3x/BUEa4WuNipzpT07Do1EwPL077y1xTPOAlCm8z
X-Gm-Gg: AYBFou0d+w3M5iKtnIHIoBhjZ1Upwij/jf9J7UsGTYnu/9zdFndSZ5s2aQVKzlquXXP
	V6JZsHvkuXgZmIWLhToaOhoW9bf9rh/gWfMImweeQtOGZIFtuSAlE/iDBvVi/Zl7CShK2Y1TaY3
	JDFk3VWu36nGjTVXsBrInvGd0uOqkMs6V3YSC+NXC+3y/mz3ctJU7YBN4tbF+qu/+y/A1X4Soax
	I5/lIIEmFZBm39ZlR2wBHpJkKU7UGjZgHB/oD/vB4g2O0pKH0gePgX32IW0YCwYgWicaBiEiY74
	7gMHdd7NqpjEAlxWyfB3GxzROFGK1Mdr/AjRNzL8ur0eWiJ3duIPJyF/me8nlKVpb7trEEqGhQq
	1yBAGmPxSIU5cRUqPPNN00/ZoKI3eTLq2V0NtnFqd0RA5gAqHp7R/xa73kHqwj0ogGHQCPSIyJf
	v4iQUQp1WBoK9GiFpMoax1+m8dHO4WoX8PczXi1KO1EMLd/ddCoZvov2svlSiEgXQ4w0cniTc2U
	pfy4O9Hhsns3BsAgOUokBzfhHXDDuzssFIp1+/lNhKm86Gn377wdm2AbVvpeI6YfhOQuiHDZzTh
	MRHZcShq
X-Received: by 2002:a05:701b:4349:b0:1b3:af3a:e784 with SMTP id a92af1059eb24-1b3c03340f3mr3645269c88.32.1794456975057;
        Wed, 11 Nov 2026 20:16:15 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21300801c88.1.2026.11.11.20.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:16:13 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v3 0/3] MIPS: CI20: Enable SMP with two CPUs
Date: Wed, 11 Nov 2026 20:14:19 -0800
Message-ID: <20261112041422.2997275-1-f.fainelli@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series resurrects SMP support for the CI20 board. This was
submitted back in 2020 by Zhou Yanjie.

Changes in v3:

• Align the second line of the readl_poll_timeout_atomic() per Brian's
  feedback
• Collected Paul's R-b and T-b tags

Changes in v2:

• Moved SMP sources to arch/mips/ingenic/ and the header to arch/mips/include/asm/
• Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and CONFIG_SMP directly
• Renamed JZ4780-specific SMP symbols to XBurst names
• Changed CPU enumeration to assign consecutive logical IDs and removed the explicit two-core limit
• Changed mailbox IRQ allocation failure from panic to logging and returning
• Shortened commit descriptions, removed Codex attribution, and adjusted source credits and sign-offs
• Kept the clock polling patch and CI20 defconfig changes unchanged,
  added Paul's R-b for patch #1
• Updated the kernel baseline to include additional upstream fixes

Florian Fainelli (1):
  clk: ingenic: Poll JZ4780 CPU1 power status atomically

周琰杰 (Zhou Yanjie) (2):
  MIPS: Ingenic: Add XBurst SMP support
  MIPS: CI20: Enable SMP with two CPUs

 MAINTAINERS                           |   3 +-
 arch/mips/Kbuild                      |   1 +
 arch/mips/configs/ci20_defconfig      |   2 +
 arch/mips/generic/init.c              |   3 +
 arch/mips/include/asm/ingenic-smp.h   |  20 +++
 arch/mips/ingenic/Kconfig             |   2 +
 arch/mips/ingenic/Makefile            |   5 +
 arch/mips/ingenic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/ingenic/ingenic-smp.c       | 247 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  26 ++-
 drivers/clk/ingenic/jz4780-cgu.c      |   4 +-
 11 files changed, 363 insertions(+), 4 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

-- 
2.53.0

