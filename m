Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596928;
	b=gXjV0hxplbBrS7BAAeiRkQOvXFOmfQvKqx3NwOYwQmW6sk9hcVurUJm5iVlGFcVmTk9m
	 KImWYJWOakPR38FLhUy1ycBdzijmXZoblVf6l3vTJnFK4GWj+DmgtR5bAFE2VoXJlQPUw
	 EFj6hDC1/MW0WaQui2TXct3YYGaGRAgGs8K5o9HDLXyImUNEI85U9/mBvjkK3xxCGOdKu
	 oqDsfXb3Wfp8g9pcHug8BqeoQ1pLATGlToeaQN7D1izgEQyjSOKS0V7OiW9aFiW7oYsvi
	 t+5ewrsdoE4IFJSjqgb1Jw/TYKl22enbjhhKZJ6bvb2Qu72YJnn61j6cI+vlf9R1cNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=w9+uS//+4af4PzBkDEhgycJpPiPnu+xIQt8Ostr/eb8=;
	b=lIwBfiSzFBgI01YXr2i33fVxD2NfGi/AnMWvvZBGlJmXrg7HfUIYZd1kISqdjO1oTeCc
	 2+pMzLSGhh4EEBpzcuFH4ZU6lMQGMPcBhvqjXFu0FWwwjS9NdYF8AF1TaAQBnOinibQPr
	 G0DF7XTC2ocjmhtAMuIb5nZwAVVEKQaFGI0zfvwb0M003QmxTDit5rIf6+WOQFgAHxiR6
	 X6NtrRPzuFrmB6LV7WgEQliObiaJfalpwmKeE+Snc+n0mkpcQaksNJLd908nJggyBxm77
	 ponldSqJHnAtN4mVXkmyEy/BLRZapJjyN9ukl3bLR/7JoK7+b/jGupnsj9ywB17UfYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDooZqaB;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DA660A3822
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6DA660A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDooZqaB
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3712b6d9843so1264100eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596927; x=1795201727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9+uS//+4af4PzBkDEhgycJpPiPnu+xIQt8Ostr/eb8=;
        b=MDooZqaBODVtmrAEROIhZ+YR/IZ2G7Dej7dChwE5k7mdUoSo73eh84tWWl3tlb3wZP
         XOhFph/aNh8LZ/qM1y8R9CJapK4naTGGNmSKML51tgeDwvNvYSXUsoaiMBx4Wo2eQ5Pt
         J41+8XP+rka+5f88vrNiIG4mp5/vmwS5Qo9eMgJ2jrocKgufYauwDC79Mt1J61WgfRXL
         KAkVdNIwP0OJAvoFFFHqMU4JOjEOEOFIwTKOlpycSTlhIxfIC+GOIArlK73I+caDlE/R
         k728aO6xXpyFmqdJQG19lJxd5E+RjB/EvOCJVQOoSzwngLVNIbb8Ki16Ul7RtKxPpqXC
         4MqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596927; x=1795201727;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9+uS//+4af4PzBkDEhgycJpPiPnu+xIQt8Ostr/eb8=;
        b=afIF82+irhKTUqxXs3aFA1/D52C8c3tGs7ZRNnkNVZAyC9GD4qnZ6d/4gVwdGDlo0U
         TlnDty5srQEkdOUoPIbFJAHC8r04DljawNSddlo43Irp36gYoNBB+fdpZ+O7U4KfutzN
         9GAfAuSncJD83WyhPamuxU3TwmOWnsdeIAt5VgepigwvdnCd86oLDU0KVpzNA3U98Eqs
         J3t/Kzw1TyprF14NJuODubzCstkgT+luDz5ZTn8lvUc6ooNW5GiXh9pzT3xRdvKwnFHf
         CorwXrQ9rFLdkrOwRc4oNTjPG67x39QDsaMVpG/WRKTydpPjS3DkcxBHeHiyoBvP22nV
         oBAg==
X-Forwarded-Encrypted: i=1; AL+hErGlLSERF5cIxrTz1JsrwAIEmr87ZgLbcMNwBJKeg7DMlsDQNWfSKlct0+E7LB+MsJjCkhsj/LYreRB7LnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OpNcEB2Mlxm1d+KDd0ox5E7COmga/R2AH+/k6lh/rcZBBie9q
	a6c6cu8KIQ0Aya88/ignNk2/KI8QOtgvtV6HC1o3uYB4i/sErquwb3MQ
X-Gm-Gg: AYBFou1Jh1E1uH2DBpXV78Gj0nCEYkwEmGP4C6zUVfucWylG+O6PpwWjXH9iMCGV4vZ
	ysjGucfPSFOrW1kIJA8elFJqHaY1s4vyjWv6ZFfsZFYwz5aeOpDaKQ08FbiKD3UY0xW2CmF15YF
	GUOWE0fm654hE4L/N7CDmTxRPxVMJbm06nKqbRr+oTlBIg1hSYNiP6uCtqufijLrb6rwwd8krMy
	eTfE7jcd36+9hulC+Pi4IUyqk5LbqadRCm7H1WN7q7zkqYjUV98ZHyQLCjaZS7c6XUhPekhw8NF
	c+yhlJBl4a071qR94/TLQhiNrE5wsGTfi1NhylJpvOVOqGA74SUuzfzg1yX2NNM/h7GEjzG2k5d
	b0gfV/ACwoXyhqq6xzZG7++lllhbtTvxqnHryP2X/P5lR2e1O5VPYHYC13+Dh1TZCcq3DOvUV06
	6mWAegnK1OKbrDKycSRStrODKgbl5oGODbIuhy3s68UgLBg44obGBf1RHtFVyAF/zRUQfU8Uxug
	k7xbVI2ZRtmy5rigcyPuX1QSn0Om12WNVVWR2U8cobiI4c66z8xV1ihhyqSUhI5+u5BEhkfmQmE
	KAaqxehT
X-Received: by 2002:a05:7300:6148:b0:36a:270:ce76 with SMTP id 5a478bee46e88-379681c69afmr4380882eec.33.1794596927130;
        Fri, 13 Nov 2026 11:08:47 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:46 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v6 4/4] MIPS: CI20: Enable SMP with two CPUs
Date: Fri, 13 Nov 2026 11:08:36 -0800
Message-ID: <20261113190836.470937-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113190836.470937-1-f.fainelli@gmail.com>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
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

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Enable both JZ4780 cores now that the generic Ingenic platform provides
secondary CPU reset and mailbox support. The existing device tree
already reserves TCU channels for both per-CPU clock events.

Link: https://lists.openwall.net/linux-kernel/2020/05/19/739
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
No changes in v6

Changes since previous posting:
- No changes to this patch; renumbered after the IPI prerequisite split.

 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 90536cab417e..09d65094b1bd 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -22,6 +22,8 @@ CONFIG_EXPERT=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 CONFIG_HZ_100=y
 # CONFIG_SUSPEND is not set
 # CONFIG_SECCOMP is not set
