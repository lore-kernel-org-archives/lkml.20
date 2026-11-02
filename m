Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638488;
	b=OBvrChWGZwnDJI5QXe1rQSKV9kryNLQctYkYQrdVmML2/UwHqkcOFkjrhSvTgJG1LAFN
	 ZeszCyTmwWmSUFuIHzE7MGA0R827xHP7d+XvAOV0W6UhabCnbCbAs1taqpWCbCmhGe1aM
	 x2qqep/FB1nbNThw827oDkEBjSTnDoAMMvTN8pmgD0jhUuPcsipdd9inOpABjbxdSQDbA
	 Bo0lbWp0fk7cKieAUEknY1BhVl4d4KYDL2ymYgwm/hnvhWG+FdZxbFz7RHLcuTrw94L/z
	 mqfX4m55khRQ88F4sKNH1Hlea8tjLfzJgQRVcF9maZ9iXggrqT2psXmVgenzARQt6uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AMToe4M6xj+oOLMHUEEuNxq8X9/DeFihUNzOBRE+7x4=;
	b=PRDOObB3geHHv3hOehuoH2uZFEXO186ccKdCDCrDkSB7CU6pp10j9N7288SUKr47Ca3o
	 2Pf88mQ636IsKP1iVWPX3bmwDk5VCJfRkN2auHXZGndD4QKPDuuYUN3qeLtIRBnpd0527
	 +EewV3DyXrEAGPIxjT0B09phFptLuE/NdeseuF3jeRY3WyHbX1bsHAAeXOVtsS9w0D5LR
	 hnVekAktOLYha4XP+H3RlODG3eZ2kcwNwrzFiaBdkUdkuaT0eaJJbs21VAKqxoYUokquK
	 Zc6d4Pk27Zn3/JtRb7bXTaph79VPLtZizoYjlosMTL+aSAaunwSIrtoJCO4bLhqR3DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nVmccpj4;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED146093D4C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED146093D4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nVmccpj4
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1824573f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793638486; x=1794243286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMToe4M6xj+oOLMHUEEuNxq8X9/DeFihUNzOBRE+7x4=;
        b=nVmccpj4SwWww+LpY5359yLY9fmG3UMUL1aDjZ7l+sMqOlexCINdRebqtPRlncEcL6
         G+EvsbHi3LgOiOVesgAX3DU++JwnvKaAl+muzPTu5AyWEVx5EcAbhNXesXzOKdbaXE0d
         pFAGL6n3ZGXvOQcwQxoa2BpyEaUrI4ovhaQc/aIyXBm/Sebi+jsJEjVkA6a1zNovbpun
         soK9bTUc6QRBeqcNY0YQ4TxD5YoYVhsGREjd6FEDTydoeyRGPbJgJBkvwd2P9PcUrXGI
         rPXVXBfXP63SRxX/VXEO6x04qZ54+dNOJ04Cr1HMDVs8bVwIm9ZsfsNu9n6nhhX8EJnk
         nTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638486; x=1794243286;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMToe4M6xj+oOLMHUEEuNxq8X9/DeFihUNzOBRE+7x4=;
        b=Fdm+d+r/sDuf07l6E0DbyipOnlYNd6J203GUmIZaaZrdoC9LRYpMN2dypiIROCKBQH
         kdQCivNiJ7YcTtmlI57yzBGulIVhoTnS3lemghzPjObGdas9bCrNKY52B2IWEca4fP0p
         2wmsWEk7OfpNATzr1xIZ0cYZDVLAtwPxLj0UFFJdCQj4Sb2tie6aZp99/tAzbSkuL1zA
         93Tzdfe0V1UqeEuqlZZzKeAE6c0RAASjkEP/eFhF6AvUiPNhwu23RHHhA3dOJGt08gKb
         h9+gt/seimdpm6SIxlmT+Fl0/V8zF9vbPm6bquNgIOp/ThXNAdVEgp1hXxJgBRvcCgXP
         nCrA==
X-Forwarded-Encrypted: i=1; AKwUvBy7wWZ/EHeoKgfldnVhFJXZfmiGwpY/kXFY10PUjMsxrC8ugJr5vW5uGAsU1sCFEi/pin2iPrtBTdl2EeI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PDn79zScG3kgp1MIdJQkex3jSGf2pwPxDa9bMANRAJiNr5XLJ
	3fNJKI2kGSwOwWJKFhSaGBUD6GE/z9g5ANhYrrIlYSyyTKbSHMDgFw0j0fnC1hufV/syWI6bGsi
	jwtoD
X-Gm-Gg: AYBFou0/YohG+fiWe1+Ovjv7HdCIZRTp263B0xKIPEC56srfjNgxUtky6LkZX4WyZXT
	rLsFmHCQ6KhOiFOC4dJKCBP4qd0C83NQh15sMl7YF5dyJm2y1hEcCM7WeBkGCx2X7/rBkxQEhXC
	/BxkzYTjzcXn77CrKZr6H5xzq/BkNiF6TKMM7oU27lUrom6qZ2rFl+YuYrrqS+6EZo71cqOs64J
	q1a02WB2TYBiWc/tUvXZBG2z7f1E0Lx6eNWDc+pKFhM40nVTE4Z9+FCsVgFDI4zks7rNRrG6ZIv
	KepptNwdf95Xp0Ib8RZYzDI/GXNzTYlpIfNwJwcWQiKh5nfBBHTRVhC73pnCG8iP/bAnaMGjWp4
	xd4F+CBbXhjp12SSXXLCV9N8l1AvaYEEeAir1cQaECwWPsLHAOl6XxlATwFaLd9KFbb0ghJoeMw
	qgu2wHSDLtLUanB4daFOQfxXJbtOSHY1Ea6kcDKieH3UUTW5BIvrERWcUr5UHVkFiVY46ZHPXpG
	UQoUwzMZpoZNaWZkX4gBNQFBZKt1focFZA+yoUK4iuBgDCaZQQ+ALuQo6ogL4ZqoJ9X9yBM6j//
	HKgyZMAQ5Z01JDMwzVMS9LKzS0eE02PHoVWvDsh7BtUnLdTENj9n
X-Received: by 2002:adf:e00b:0:10b0:48e:48de:ab3f with SMTP id ffacd0b85a97d-48e6e503730mr16502593f8f.52.1793638485953;
        Mon, 02 Nov 2026 08:54:45 -0800 (PST)
Received: from jarvis.. (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm21550275f8f.12.2026.11.02.08.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:54:45 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
To: rtx4060@gmail.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] regulator: mt6363: Fix the registers of the VSRAM CPU and APU LDOs
Date: Mon,  2 Nov 2026 16:54:44 +0000
Message-ID: <20261102165444.588240-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101164405.1743177-3-rtx4060@gmail.com>
References: <20261101164405.1743177-3-rtx4060@gmail.com>
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

On Mon, Nov 02, 2026 at 01:44:04AM +0900, GIBEOM LEE (이기범) wrote:
> VSRAM_CPUB, VSRAM_CPUM, VSRAM_CPUL and VSRAM_APU have a register of their
> own for the enable (bit 0) and low power (bit 1) bits, which the header
> defines as MT6363_RG_LDO_VSRAM_*_ADDR.

I tested this patch on a board with an MT6363. Without it, vsram-cpum
reads as enabled while its own enable bit is clear, because the driver
reads the VS1 bit. With it, the four LDOs report their own enable bit,
and vsram-cpum, which the board DT keeps always on, is now enabled at
boot. With always-on dropped for a test, enabling and disabling
vsram-cpum from a test consumer only changes its own enable bit, and VS1
stays on. I did not test the low power mode, nor disabling the other
three LDOs: on my board they supply SoC I/O and analog rails.

Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
