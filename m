Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285103;
	b=QIk2AEd+8/1U2qoxIeZy69uLQVduzjnRDeo6Yin36zhsJd+IAJ6pduqvtUq5ammQFkut
	 1tTKvZShhWaJ0K5xRvxoFcCvQPEUgyDGNNhetGPXVIDP6mL1WPBoD7qhya51wLuLTW4L1
	 SuIRu+HzuTBtobMtth0I9c5cV/uS0SWIUv2qMFpHhp6OepsyjsGbxynV9087j/keoe8yi
	 avLp/miEl8apgfzLt7pe4PF7ltxtdBWiSZsjYIBGRLkalT/ShoU6tn3rclY2wrlpE7Dbx
	 MsBi4eq8/QFkDwm1SgJeaHC4Ns4HZhTCdsanad10kJcCp/jKJJL5u3w3HhQyM335bZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RwxD/kp0MCQ652BLhqihyWShn3kE3wujbUgCK3EzeE4=;
	b=Xj9hrRMKFerxEzjeFfAgLfa3Itzg45De5zfARcLwm+HfEgqXwvR44OVzeWawJHSt0Kou
	 JfXD172QgayNum1iaWvMjb0h2Lz+JlNSGP5j8DHNAmrac6PAzwfwSFHVDO2ExaM9rddta
	 S7LZsXrOTdcZZhvXlm6z6xcB71YKAwAz6l/m7CGAMiTCqwtt34kZ6ngNFjzaWIcGrPhPt
	 LoYmYSFs1CzHHdSr0K0NVfFGexK23QHsjh1u36ibRRUXXlUkPBHncgsfFVJYYlz7cvfch
	 ciY5FtVVTiV7tOB8Kllik5dxZszSCmEI7d5fcg8lkuF9fzGOl3K5uB+GgMXZm7UfE7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jBDLkMGE;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD58D60A2614
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD58D60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jBDLkMGE
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37000e7234bso2523616eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285102; x=1794889902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RwxD/kp0MCQ652BLhqihyWShn3kE3wujbUgCK3EzeE4=;
        b=jBDLkMGEiDBhFC1CIgcwJTC7ITQrTgcQC8+F6btEqq9jzX4wL++sytXmcrTwqjF7rw
         G5KsbbSO2RB39VxpEb8ngouHVGGpf1BFFhdAhokCKKoQHCBVEnuNQnrecpPpWLlEcA+1
         hkKMkB1dTRwlgNNa+oq+C7nxqP6HJOd6zryzBNdh4SHVF95S09ZDDqQx4AqRicHOAAZV
         XwIGhwYHedxFaeAaKeOJoULgbdTUcaHP2NibCWg7U0yhuXoi9UwCCs1TF0ifz0VGT2KX
         uPgrrHObBfnZggK2S3vbmu4Mgr4PEmvj4vCFaeRuXIAzdG+WBLW/EUVdmyDC6ZZIBf6S
         iJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285102; x=1794889902;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwxD/kp0MCQ652BLhqihyWShn3kE3wujbUgCK3EzeE4=;
        b=m0Ei3oGmyxDiGh//ao/dNFdmJYG/uItgLMDbzdtCDCw8kcmaHg9zgyWA6DerAqiZNT
         RIywx4xVkURBHx4FVX7jfxYYxfJlkpqSpe5nlGM9JRt8NkLhGP9EUd5cN84OcdF4tKNp
         Kvsj66Xa7DxSjm73QqIuqqkXtGkNR7kK1Elc8/5hb22iB2nXc2STOUrJanqk+n7TBE+O
         tPvtJwFhhh34vdMrnyurwR53KSPYysecr+IOL7ae4t/B1Lbg1bgc1S4kPV7tUi0IRtuk
         t/iXJXFVPFul8Fu3namiyhKazNF+zEfFl+KNL/pgzgo0trajFAUgtXSKcOb/MsVhL3hZ
         a39Q==
X-Forwarded-Encrypted: i=1; AL+hErHfYXWRz8lEaGvjlmDBKM4JKQwI7U9FFCP7jH88T7J9RrtxsKPiFok+KQIV6hbB7Vr1N8RNf626NNUPQy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OQOnbUWB++wJagAajOsxY48wnYeYXE9icVfAKyjFXs2HYn5Qv
	qtUL5JDQlYdSc0lq8zlTLKz2FjLlahYfLGQpN8c+ToVAMo7LwR5D59Lq
X-Gm-Gg: AYBFou2OcTQditVHAHUakgmob5D+G5XPOZ89wn6pRGGd+iWoR0RXWeYY3sy4Ackzz8e
	JEUMDhNYnqQJo88+en1pmTzI1XQWPIt+i57GXnX2MCRdorMEV6hL7QJcV8Uuo9KvDeV21nPUzKz
	HN1qOpHYQD0pOJv0Gv0UKk99oZzEJVA6diCT9/b2bbkhxk7Gedrqe2G66DKh3f5XUusxSR3sVNY
	Iv5DUEKSNrx+zRl4mh85Afgvi3DXf0BzoPRi019I4NFFz4IHi1eeYDja+IFkfLOhvAn+9wwiOoQ
	bz7wR3XDy5f15quJkOc9aDPJ74W5Ul/9ZPnlHsVB8vGS6OMGFE35MtBqDJcdcCdYi3HGRL5a7xv
	rOjlik4RZDc3kANfdnf6Ln0wBSwxxSXp1Q5DcXeqXH3C6h/Lkb4aM8KnMi3Gv7k76RS9ZMgTqYf
	xSX41cGoSrfPb03KeeRaeg4nc+eic+3VeiI3tXzElVcPKs2w+TP6euQbT9T2kBscBMIqqd+VQf+
	BeqSXmo41Wb/esmhc71xIGAxhgLO3tIw11wIwY6x5Q7UXAtNGyHskToakJfEEzXWQBPJpmpZ5jy
	PZuOBOZDhQ==
X-Received: by 2002:a05:7300:8815:b0:351:207d:bff4 with SMTP id 5a478bee46e88-3751c53685amr2202305eec.4.1794285101599;
        Mon, 09 Nov 2026 20:31:41 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm3340996eec.25.2026.11.09.20.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:31:40 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v2 3/3] MIPS: CI20: Enable SMP with two CPUs
Date: Mon,  9 Nov 2026 20:31:31 -0800
Message-ID: <20261110043131.1985993-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110043131.1985993-1-f.fainelli@gmail.com>
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
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
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
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
-- 
2.53.0

