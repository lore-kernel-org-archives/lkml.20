Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456986;
	b=DkgITNTa7jfxzfQLrBV+AiPEx04vkx5rgKv5NAa2NRMztrUAj5xJ4qjjfU/QZ17OlOut
	 ZpyL+H3IPE5NUv5tmTxU09tataMhVEWfVXn/dI0+dmvThl1ei547FarN/2f4KFeXjbZE9
	 a1OGvaHMu6SEeJE0h6y6+70wMTiubIHGUnkjkJ3W/0tbyOWE1ZKJ/t0gn3XxAgJhoBkAD
	 s7DsHjS6oXOCojR4AaSXpoHSkaMzXOWaJ3F8DBJfLj/QCRxl4BX6I9DJeLWRa62SrFAE9
	 P0tm/VFOnqAquGYg5ypAEBvm0M1ZFP3Q2zWK3GrXOGYHf0bomVvrpXylys1ptCbCWtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
	b=QDc3Solrpkd6JjbZTCVgVdTVdN7opjQbnUpNWtsf4NRegIMaqVt7Vogi2kIBsf1OCcaY
	 mp8BCg25Ng8O6qVAo/E46qcJcplUb4iNE2LqLT6DUj0JhDcOzsiVYawf+36wg0/rVwUO8
	 eeX6ZDjCIeLlFqdIF3kVWYnAX6dhENYJuprgIMW/rQursNSxTZWMJH2jRVjXQHrFD4ZL+
	 hRoiuS0iXcfhejFMKDGLcx4ztBVrInZLt8S/YIHtUlUzFrpTRdS/UCUKidUKU/dHeRvO+
	 zaiTSOvMKEY6dNhOHxA+qu+FSi061QilRVBH61Z4b4+CGOzIkNbITJR0OrkgYwXx21w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsRLzKHA;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6CF606A88F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D6CF606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsRLzKHA
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15dd124bbe7so5978498c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794456985; x=1795061785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
        b=DsRLzKHAwiCRqiKX8u5aP4CaTd39d9ywi0CRFk4wiv9LG3fx87WtfWVgpEif6uFyl6
         tEn5pH0xujfK9oKD0gc31SJiU7moP+QUlV0NweGe7+e7puW/kt0KV0+G2uUvEOmnPqiC
         47pvKaCDRHnYJ/mfmv8ra5eu6RyS656R+zkdrfkc79FoOgS2nYNWyBjW321i49jEY+j+
         paBe0p0Fvkep04H4ACT1ZQwyo7NLKsIDxQni2yvXwDq2yj64D2IWN/LRRRELtawjHika
         GBxFno3Tf71hWH/OzogTZbY5TdX3DBrLAazM5gJOuWOvfQsfEj2kMnLzwC0RQnheO+oZ
         7CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456985; x=1795061785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
        b=hXhXH7qYGm4EJ1mMzi+mtqfAGiRTfNKc7emD4MANSCsNJ9TeLWhErtHCf33AYhbVq6
         /eW+4FJtu7VaAuZqnlL3xl7VxHIMRE8kx2hMbYVoTachi6fzrXzlxt049/FCbVz9V7IH
         GGC+QU1IfDuqdcuQVx7SS8yOIZLkX49kC0vAV+TXrZlpikHj+w87Mlo2sjrC5Mnzk2c4
         B2iQNORj+8v3dJH0zo9y2FpSbOH/XIbODvDv1NuiHnW5d3cqcTSw6i9YTEB3kTU48rl1
         Lcup6D+Bm0LZHrIdFdTU8uEkm9G7E+VR9znkhTQSk4CUrXIDzYCuTH7gFfG2F5jOX/El
         VLAQ==
X-Forwarded-Encrypted: i=1; AL+hErF9tWqFYNRgW7Qz8nUZRFZs7D5zhEna5mWzaOyHuMZmbJM47EpfLK5G0D5BDYdvZk7zy+FM/hps6uCbBgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KBYjKXBR0Py6BoOqTL33y4lHFMm4+Y53cY1GiFZm8VaL5+G/L
	K9bx10/ZnUfaleS1x8MxByk1ISc+WuBZLTubUpsdbhVnC65ZFht6+9ze
X-Gm-Gg: AYBFou2wn3H1FsrbSm+8UVTTywmYCI8W3HE2vKHuCwP6lCO8LTvSueWllTNBL5je8mn
	OJIJc7WNauqH5E3ctB/D5tIPvuyWUDtYdMTC1F70D6xpEc+HTHu6SWIfJKcYjRfIR+TJO5rjny9
	mpGhA1K3a4kcSDvTuWgdGJJzknx6tJ/0I8rB1P6Yb0pRSREdXB2xnhVl1XWpGfngLFulQc74Opp
	j/c8189yI4cjKUHRnhfg7M6lM0LcMuvR8qwlGexCgP4cf2VkTP36JsNkqmXj681iFKgafqXICbX
	NWzYsOwgYZHBcFJqQLGEJEVNXW8FfXJ/aRBgCXIoNXN7hqWIBNF9hObc51fKVW6DahRUOb3NhUJ
	+SIkUBJRyLktVSBziB9Ku71IoDLqpJ2Md7XjjzHzhArhKGY89Aap1H5AnHN3zlilRW5n+D8QRSG
	RckdwIyJc3TCu0soMOoAVzNeTq3IWFtn7bSN6Qydi/L9rrZfKqBkh2YIiHUjK53ODpuZPepvgLR
	gKhiqa8NMds6lQsCtXBy9yheeCsq8GTlEFWtvdc4a35FpZb4gOGfT91yezd1UDNwbEG1g6JHtFm
	BlB5Knih
X-Received: by 2002:a05:7023:d0d:b0:1ae:e0f5:2cdd with SMTP id a92af1059eb24-1b3c0324aa4mr4176471c88.28.1794456984463;
        Wed, 11 Nov 2026 20:16:24 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21300801c88.1.2026.11.11.20.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:16:23 -0800 (PST)
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
Subject: [PATCH v3 3/3] MIPS: CI20: Enable SMP with two CPUs
Date: Wed, 11 Nov 2026 20:14:22 -0800
Message-ID: <20261112041422.2997275-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112041422.2997275-1-f.fainelli@gmail.com>
References: <20261112041422.2997275-1-f.fainelli@gmail.com>
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

