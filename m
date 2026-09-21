Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A043D4128
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790021182; cv=none; b=CqwFVd+6Z5rl7j9P5MJbtnPee1vaRXoRB+P9t8t3xYpiMqgF/zbMbFMPA6gLc4erWEBfB5M/bhbCfWDhwUe6vW/K4XeIG4sp+8QPFPD9GhX4EBpPKoxPhTB4unCcKwNSlh8F8H5gdu1f8nIDNcr/GFwjfGfUHc7pGeYlno/HuuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790021182; c=relaxed/simple;
	bh=HpKDDkYCd2Pwbo5rNqtxh4mKk7ebKSKtL7Zw/QAn2D0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJmekpT1OyaszMmJ3Oc+QEHI4Dl5MgVOVLJpp+B6jKAQxh0XLLk6Bl8BqFiOInWJJ78FUbhVQMFkJ5SNiTg7fl3345sLdenVJ14aa6hZHkQSWHrT+4+FlDKKglg5+pA+cCd7SP/IR9fLB+L1D9+5JltsG+M4HMJr4JlbTHeabQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qlg8g9Aw; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlg8g9Aw"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-469fdb78b1cso2357283fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790021180; x=1790625980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fv+RsZgscD5DVR4fjErqaR9WbVwonuHEK45e+ZT7GP4=;
        b=qlg8g9AwPL9acSpqzohJoa7/BmsAIx7Ivq44IKs4uHxgfMlHVZleHZT9msBetSBMVk
         a6LxI+/CYssMLO2otXlj2bZEV2qDs+wgUURpoaSdmBYUlqsJhlPlAdZVeQMkVZwnguZz
         fmXhnAWEkfq1gGEeqGTnj0S0j4TesyPOHLblzV13K5DcB5zme18hE8i5OqVFwh6C7of3
         rgvyLHicH4xYLEe3RJq4A59FzBbxOrpegnB7uYf3aKknQgyNjGjYZZGgzbUikuwexUHt
         tRpCIn7/enr+rmFRRYRC9Hg+jMNlbDoRCkJzrphj6buB2kwAMeU4b1sQglXPyKOPClHV
         nRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790021180; x=1790625980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fv+RsZgscD5DVR4fjErqaR9WbVwonuHEK45e+ZT7GP4=;
        b=hF6dGAZXtk8/nfCTgs5+bVW9sILSRb/hrHO1xUY9+49317UQRJZgsPqbhkB+5DJ9NY
         bfVFdg0a/4lRC+Cn5bK+a81XfOAa+CyCPff08VicWkdiLy0p6i8BP4c61RKmTu3FclCE
         o8eSZg+rMqXdXGwRuJImQb7A3UF6bDVpy+ofrCVsPY6waNWz4jViS9oQEK2I281v2rqS
         Ycw2l7+Gjq7Dp2l7uMLxy4yyBZSqqGrIoDorH48gGOzBlV7FXFfW/cg7PioH/Li3VUR3
         haVGcYXQxxxFzx/0fZPoRf5J8Q/8N+rCUR/oqNrW/2ySqf3tMYYFayK0j1yHmX08y5G6
         mJfw==
X-Forwarded-Encrypted: i=1; AKwUvBwTcFhGQpcjTlPoxJ+FCxnV7ofPTmO/TeAjDDXQGUNUIvjCVNUjM7xOUDgQEfvNba1opxv4LoCBKDAUocE=@vger.kernel.org
X-Gm-Message-State: AFuF++mUwNj223nOqaaSKGVOq+QEdvJbqNNDNAlYiHR3N3/mESuCRAUQ
	zxpEekzl/M8ntIzXVBUeA4BrHBFr4ZDb2uaS+LMCX/ShIlJrdo3IFbc5
X-Gm-Gg: AYBFou0Qxa/9mng3D8sJMfplljUJKb1TwD0Nm8gIStQZStNzDCUmZHkQ7AEBKMOe9nA
	t3qdTr7NUdAIvJfK8RGeDKRrdK8vS95PAErXS5wc2KoqMPCDuvaS7ydpSbQ4dDqw4xmTW6u4Yab
	+msWkJXJ/iRdlzasYdgzuf0IGeVTYSQw7wiiORZeE3z7TImHaxRBgRamLF5/lxCSRNhgdAZX3yQ
	MPykmxTRxeM0TB7geSG6Z612pzYVDfwkwXjMnuEB26rtNPrI6YZGTkBoaprG7c56oSoqEAd8kdn
	OIm4NN4i4Hmgc2iXNwdg2ueXj8f6ZXtuHZSGuIRLONrfT+9x6jfauXc1wm2DSQ2lEYQ5EvA2QKR
	/RuGMW8/mfp07bp9RB4+h4wxuYg5n+l6s4xLGske3Fdz/kg4g9Eu4nJ31QnZkP2eEbCIe2thei+
	b25C1Qc4osN9KBHP4HNK+6ZPh5kHsUST3vDA+K9/bDHu37ENRyJ1t3TXKzHfiqeyJZDo2Mr/zOr
	U0AzDFk4mtIqlAUq532Sxsxk2AQToxMramColZUFNe8nw==
X-Received: by 2002:a05:6870:5688:b0:488:5fb0:423c with SMTP id 586e51a60fabf-48f6c2071b8mr252272fac.29.1790021179689;
        Mon, 21 Sep 2026 13:06:19 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f6ce755e5sm170837fac.0.2026.09.21.13.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:06:18 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 0/2] clk: sunxi-ng: fix A523/T527 single-divider clocks
Date: Mon, 21 Sep 2026 16:06:17 -0400
Message-ID: <20260921200617.3180471-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
References: <20260723004856.55158e84@ryzen.lan> <20260812201502.264919-1-enzo.adriano.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This RFT series has been superseded by Junhui Liu's tested four-patch
series:

  https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech

That series implements the M-only and P-only clock conversions, was tested
on the Radxa Cubie A5E, and has been applied to sunxi/clk-for-7.4. Please
disregard this RFT series.

Thanks to Junhui for completing and testing the fix.

Assisted-by: Codex:gpt-5
I reviewed this reply and take responsibility for its contents.

Regards,
Enzo
