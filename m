Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528FF4EF135
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663922; cv=pass; b=AKLdo0wYIRnLd5GbYjuRxc4MbjUabDzYRynncYc+asMRNjrhWuio7bVqIlHlPVIeK3iYfdFL21ZUbq8uK8AqjGWJjYwDDE8lgs5sTcNvMODGoIZkidfKuAof7il7c23PLkR+nZ6ObpMAn3jM0UYuhbHRc8i0zfoDWfd6hZtPEQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663922; c=relaxed/simple;
	bh=hEHMAKUllCDwfWN1D2DXADtsf72BtNJRtUxT6u8f6tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXcW8snae5ryHN35gZdcumXpET4GO8KSqG2+LZYU8fQ3XHMyAmR/amtwRMOwLJlKT6BmFil4rZvzrJfGF0KgOJs6JiCKHIrCF02woznTvxrigZdlCMQ852H324xokx3IQ0NSWCiPX0sByChe84a9XYk7UAZUoeGgTbw0CbdMo/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Umdir/c6; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Umdir/c6"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so1900832a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663918; cv=none;
        d=google.com; s=arc-20260327;
        b=M+dggjr3dN6CXXOQeWN8oJS002HuhrPjMK9eviHHu0HP6iBUc1u+qOZgLimjvkBu7B
         xGkcx25kKdwzQTYSfBDZ5eXWVk+a2LsxoxoGbSzJwII1fsCN+QwkGL+b0raqnFAGzfYU
         VyhQYdV77HpGjPJiZG+1pkT/IHeEpojgVv55p1IiG5cLHoVQIZnzRjZG4i/nQrmldG27
         YKlijppxKvNPitQtWRj2LixZvqQwyI0hA+G+jiIw6cs0cspRyGX2Znen/Vk4jeDHYcH/
         OgzW5fANgmcLM3W5FY3nsDVFgDeKe2mwrMwclkEYpy4NE9rVqnJ93wbYI0O40vNSpAbs
         CcFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        fh=20nop9ZFW6f3OHQ8WgZyaoZfuGrgPK6y39yfm/yKkVo=;
        b=NYRhdaqqxFIl2k/qjH0FSHrAIAjaNf3t92Zu8z5z9Y0C0QLDTc0avaL/GsBwGoBfLo
         Ub1ka0zb3ytFqKtE8saxqAYV30hbtXMHnnFvRa/4tcnD/wS0kok0fgvAd5E+ViQ1iyIv
         JlpMxnZ7yfVsucUHcPJAgG7PPUhT09ffxwVSBVBY45daOABskZo4TUJ/VeBL9E4jeZYG
         1J/1EChahkh60x7QqwQ+b82VCYlI1OybKA5bzx1Y922s9mYpSf34XOSW9o7E8hvGs7Ks
         l/WjvvtGctgWHt5A8zsdF5sj8l6n2zWvYMjZcNpHhw3I35C6B+pG4spPc82i1MwMmabp
         2k1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789663918; x=1790268718; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        b=Umdir/c6HrNFBOOQJduM6SqCOAdwSy6ZyL+u63FbbjqPSkqXRet/5s+yDMp4YNjYN3
         Ita+VQyRcFzmRG9DQvzdjIErpzAlOQM3yfnWdmoT+BI0uhEAmm7CNQ9zBBHIE4PTBJsT
         u4O29zn1XHk7lfqMIu/0IJrlYch/5fZv5NcCYTQPSHGed7rsq3bxmci86KIG4CKRPazG
         26n1ETA8jIThSMYV/LUhzaPBsjUpNVu5R2qhDe/PX2P05Y0mkxSf6WmsJfcI50NxbVuT
         zhHAtNqzxvTxNG7xhPfFeuQyvKu3USpvLpjVAoPyXm6bF5jAtEYIiIfgReVDGHskLX5T
         ecuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663918; x=1790268718;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        b=xLA3bKQQpkHRlhSdoPt+w3Aps41a7lKVi0ePn2hM3dkF1l5RQKBjJUV8n+qSX0jdE8
         svlaEc9uoyYkQp6DnW06S/YOJ7VX3Ta72r81nrelnGhgtSa1D8QyQgc5/pEud5VATBCq
         uSBqT/UIY+LYxtTpKW16i5Zk0w4ihHlmdT0mxDT/jwQJute89LRQLrLEkf6VQnVpxNYf
         TKUxy7MYADdFlpTsZzF6yxUX8R9fJumFA5iHQzc2bpvpv4/80X9EbvWTYfZ5WXxGLeXn
         g4u61pxmUb/Z7Rjd7n3nvkaM2PBP1KYjQLbhi7kJzoU0ztcuHLJ4+b2eELACtBT/zsIY
         TkXg==
X-Forwarded-Encrypted: i=1; AKwUvBzQrytv472L0iUJqomopaaW3rq5v0NMCk/3bSEXry8nD61cc6YvdT48zbApxoWnfi+FTBiAuCFaL03+m7M=@vger.kernel.org
X-Gm-Message-State: AFuF++kde/tVxMYUALtWAVCwurk8w0+TJTJzBMA4ttM4LPcy8J89014r
	Wg1fjWvYtuyEL5o8XFP2tUqkdJZamdl0MteyH07AO0WnIvx9mKx7CiA6VHkYIRLx3FWeXJIK8NL
	6xXj6ltGH2h8jBPosgPfYzPNOkkKPa9w=
X-Gm-Gg: AYBFou3m/6ufqSJUZYM06UAEKfa9xTTt5Tr9tBNnsohVyw8WDLp7fK/2iezg/JIaRHn
	93o/Yb3Cg1GBrvf7Vn8FP/5z6Yt1hfleQWZS6BlnV9eENen1Ia2+BTnTNq1LzZcjWFHTGAGstJC
	4NI1u9QB9bhxQjtijpvj2s+V6iEfaTge3Doz4xxONq8iE+gMHawsX+ycNkyyoeaiviJPe8ffaUx
	FVS2N9IDMvtFAQ3LjEHjhPjigfDDVgiRjmnWr5i7faKtY+gRJNkp1/opb4v3H2346fmRSzFYvui
	vOOZM0pwqq/5maTOKgjRB5E5ahadRvPb1/wAjbbEbaA6g92u6BqvQw4=
X-Received: by 2002:a05:6402:3789:b0:6a9:98de:6d8d with SMTP id
 4fb4d7f45d1cf-6aa2245fd0fmr5568315a12.45.1789663918221; Thu, 17 Sep 2026
 09:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902193351.185771-1-l.scorcia@gmail.com> <20260917143459.GA2348773@google.com>
In-Reply-To: <20260917143459.GA2348773@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 17 Sep 2026 18:51:47 +0200
X-Gm-Features: AcwNN1UCLyUlHms-nbsVMpe5KcLakQ0vi0ozu7P9tcFuOM-WKvxcQ6ubbojqdxA
Message-ID: <CAORyz2+rT-oNJtWc5BRDrpUjBPVbO6A=qrX_K+J7fAR5Ebm_3Q@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Julien Massot <julien.massot@collabora.com>, 
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Still waiting on Acks by the looks of things?

Unfortunately yes. Patch 4/9 [1] was suggested by you in [2] and it's
independent from the rest of the series; it could be merged without
introducing functional changes, but I don't know if you can provide
the Ack for it or if a specific maintainer has to provide that.

[1] https://lore.kernel.org/linux-mediatek/20260902193351.185771-5-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260520150014.GF2767592@google.com/

Thank you
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
