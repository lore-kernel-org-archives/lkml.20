Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224493;
	b=fZe68FTk4RR/oqvj/amNcVbL9LS8YlJmPuT8dDzIIAuAaoIMDUL8n0RnVOqXT28iPEHQ
	 aeFL4ZD89kAsP0NG5TCjzcDngAYJsK8EWFI0CWJbft4lyoNUsfF16CBJPYwzLrP90PTwg
	 hkd8vrP/LBbBEjiUclOjJLjJeie6G6vnN/Q3m6opiTpQOWUHK8J7QrxA/CR1UQ3fS/ORf
	 b2qLHoxa8vqz4vHil7QdEpZohsIrGZOlIbHcq3GL2TwTSY4gFz6ilUMRE1W0qVPmwy6Zs
	 +AIUEzGAe2zke2iQA6D5vq6RB5RIir+eLa24J5YjvlzEj0t3hirDEGzpbQQ35rll6jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rP/SigFgtAkrrT0B7fzqfq0edE8RSxQb2897NLp7Zeg=;
	b=xKcpgvPStD+db+KsIcHS6yCadYE6tgWF3TQsozYSTZSnqqYE0WxM5QSGMBVoVSuJUa3I
	 moABcy1y2tz/cqWCrg+XMAFRx93xM4SB5bKhu5mNN7nR3XOHUZ9i7uciVHQoiVjg98WFc
	 5sbUKklmM4iIpMGRRDEEMAMuAHcI6ZAdzIGycmeQHVyi6XZl9mJuIuio3UTErRMBlyhbM
	 XZJl0xW7yP+44x8/T1tVfdwsEQ0bmp9xTc8qB8ptiTQDdcyouSJTEMuWuyhjhsuYpuUht
	 MSsBynQtQgvCZmGlrWtpMYLSsqx8i8Dviv7ZRSzsr+WQyyZ2/Tjn8sBEfs7hoPWEmAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUEBbK25;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E31606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E31606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUEBbK25
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e47347279so481047f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794224491; x=1794829291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rP/SigFgtAkrrT0B7fzqfq0edE8RSxQb2897NLp7Zeg=;
        b=sUEBbK25IWD87H2Jagc9xT5zvdmVKXmCE5On3B6CiGg3+gBdCX3V68KdpSbT3qGfbS
         LggvWXJ7y82Jk0Vci0iSIXy9u4cXoGodgJ2CHJvHCrbzV++WPyiJ4Z0cY2AR/gvJUce7
         lVua9nw8S9/nlUnzRSKs+p6VgMhNiw3pwQgCg2vEReX9h9j6xuOebkZEfZELpQ6KL3JW
         SlmxaeIAQGhaNM2zMttGRytgYNbkvB1hEa8WWB58jqD/nTYPbWNhylfxLDmdg4YSdV91
         JFeO3713xLF6Vk1jQdEqkAJLsdjbF84LVkCJ92CsgDZwKBrR0BIya0fszXVHQKkIkeqi
         kLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224491; x=1794829291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rP/SigFgtAkrrT0B7fzqfq0edE8RSxQb2897NLp7Zeg=;
        b=zrVMlSB4aSlF07+9s5oKWe9P7/oHUqq8JS6Qp75C5cZ0BsbIfddABztHvYag/EMFBq
         thRR6Pb9zRbxPytWaxk/xQebf4u4rVNRnUl80KVD+nJlwkNQTJ+v7fRbeH1rNYMiWR1T
         h7pVAoJAe6rMiFaMiKzQw9uY+gzN1aDrFhrUOqjf2+Sidc8o45c7ESMu9GEOPi8oeTPt
         086cc6v/7fMifLZwrb/9kBdXXyq6NXdKNCNfj6KBHTg+EKxHoQcXgGGLP0nwYLZXPjj4
         nsFbLtqNS2pClU6qEtXa+hzAQH095vt90oATr6RQAsH35C7FNCATTgPfwKFwtNO5fajy
         GBAA==
X-Gm-Message-State: APuU4Z/Q6xSMus3cCgpd8PqLOfheYAPIKCXyyNAwUc9Qz8P24cd98gmf
	8dE1+xZOIZCoyBbdRoxR5GbGnzs9pgXF2Xs1d+UnBnRb8Wj/M3tZzlaM
X-Gm-Gg: AYBFou007EIa/WUDHQc/DDLHWvfBD1BRkTQPY4zsczjNjB7gHmx8XvrWWf4CPWnXJtQ
	K+Vh0sYX6+4mDvnpsPZg+YXXZt/YKRuzJQXmTm8lr+zTdd7GFIexZkfcQhN6SzmzORfplPA7uDn
	dxwCBeqLOuZYnEoBlUmglPWlMf0AWXXFyyuUpCSIr04fTBrLcBdIpnsuBwDPpS2fnUlcQ2eF/M4
	9TAsRgnM636Bzf3ewa8UJkQIWNIlSX1Y3ixGUgiD294b8Xw7herAh125fNsrH0phI13R4NC4yh2
	BDuTXVN3LrNZ+BfWvCQZVUSE9abEpbUoXvOcDKESDPPfb3B4Kbf7iEtwL9kn1uMlFU4YP8XKBsz
	XE+MhV1W9fTsWNaMPFA+d/a8HycZzc67gLvdXvfR54Mhd/wr3H3/OnAn1CWCckbLfZAgQNQtFrx
	p9r40EWXgwFlkoaCUWHNkRJfDrzgm8RHbvMZU96LrnDYTUvv6/xBE1t+wL13fhxFpU6TUluXtOm
	Xk5ueSiJhvZmJr51V70jxgtrL3bd5rFdJswMT7qsS3vvPqreR5oUZ7vsWaRlrIyxC9rhE9jKMvI
	mLV4rpSQQVm7uGK/PJo/x5x3kThAuzzb6LXzNRROd0k+eBjOKyYUbsHlykfx+xz3lDx0w+xVUJ/
	4kfuYSZ+g7OeY0YctXyXaLuths2ZfVgzwP8d0BF5xUIYuM+bsSKFbNT6hACWU0U2Lxkak5CLvgM
	KI8uuG8dz2yMa/ql3vW58=
X-Received: by 2002:a5d:6f0e:0:b0:48f:d3ba:7314 with SMTP id ffacd0b85a97d-495843aebc0mr6470230f8f.21.1794224491086;
        Mon, 09 Nov 2026 03:41:31 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c121:a50c:ebbf:3e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597d09e20sm9525626f8f.54.2026.11.09.03.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:41:30 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: defconfig: Enable the RZN1 RTC driver
Date: Mon,  9 Nov 2026 11:41:23 +0000
Message-ID: <20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the RZN1 RTC driver as a module. It is used by the Renesas
RZ/T2H and RZ/N2H SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..a5c4fe0ca5f9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1393,6 +1393,7 @@ CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
 CONFIG_RTC_DRV_MACSMC=m
 CONFIG_RTC_DRV_S32G=m
+CONFIG_RTC_DRV_RZN1=m
 CONFIG_DMADEVICES=y
 CONFIG_APPLE_ADMAC=m
 CONFIG_DMA_BCM2835=y
-- 
2.56.0

