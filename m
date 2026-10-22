Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693316;
	b=GA7/TlI3SueC1zam2jlDa2wSd/TSYVncfVS7gk2viyiw7wID9SX3BXuDd1s2Hp9YIAIG
	 zdkpSm8JNRsujvZRA83pVk3xJELD269q82Q/37py132TmeD2qWcq99e37yAM28bwk9ewe
	 1AuJPJUEf9JBzOA4/auXDUjwIWCRocHFm/OZzdY6bp7GnHMZSO8j8ofuqLl2Xy2xG8DyO
	 YBGwheDByx7RVHgbKEr+P+pM3qH465XsfT6CTaCvUYqVSXMYgAOJKxxE9qPuX4/rU/FFm
	 ZkcehmDk/zhVeVRGZrzP1HTs/cdFmD08mNdWClFfaZNmHKQR4aYJBr4obqGQLhne92g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bQE0lagaKaRPxOL0ymbiA3jEEX5u6DV2i4c9cRwYEcE=;
	b=xcq4RlL0aHM/AF6p0E0BIOesDTlHN+MJO2nxw2VeBbz5sCw+eh4unPerBtVc2plxr56P
	 M2PTe2jFMKUwuzMtDcVx69AhWaTJOfAMCq2+iTK4QUanEJ0TFLqKBaasFUAl2ztvwoFuE
	 K6baGrMvA7aPYubpfPEobOQaB0r82x7fUNApOgsEYw7WiTKxR4A4R1HMhvPCQz12TfDSW
	 0bfniDBz6GJlUafQbeOkFjGtCmTgHu4KOHgHoJCAh6VWcsYnIqB20ypOTBgTcQ2s+eFnm
	 e2ngq7b9Xw5fZPS1v+AjA8iZqgQiT58yTiO0kJxD7wcXnunuKERTQKWaZ4D3x24W9Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=neKW2akp;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A423B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A423B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=neKW2akp
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b001cd92bso51224f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693314; x=1793298114; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bQE0lagaKaRPxOL0ymbiA3jEEX5u6DV2i4c9cRwYEcE=;
        b=neKW2akp4bDqZqrooArGXRxYDR5szIWCWU2hQc7KQK5dNxh4Onj9VjkPBRMiVog/ND
         pqT50n+G9pucH0Wh1LNZR4qBIgeiyZWQQLDtlDytUM4+3tHW5qqqW2jb8baAYQn6SnvQ
         7gZVjnUrsn+AhZap06o8cebi3L62pZw2CF4zTL9OZIpTISbsLsgPTPzhcsodXNJWHEQ1
         lghlIreZw/DAToLPLg3GoB0YJJBaqOzZj9WDiC60O9ZiXVGErzjZ1CCFUQWiUL3Oo2JX
         T9KBpbxFf9pxRRcFoEx9vxJ+26cH9c7IE7d7pBtDo0QYP0r7CYeZXUQfRa8RJuSIybFH
         QW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693314; x=1793298114;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQE0lagaKaRPxOL0ymbiA3jEEX5u6DV2i4c9cRwYEcE=;
        b=LWqdZk7RDu8raJaiXTpXfkTlSctgJv1axah2Uu+xh2RS0C6h/xz5WtHFFG1uTfIOI6
         gBFdC6/Yx+cWtvRJePBS5jXic6H9HQ4F4iKJTfqO6s+rEUnA6Qhi4Uy8bis/EV2glhvW
         YKhJlovkA+I9xTJUZY66sSO1QQ+aEeZbw0AVfI04RFAJBGmbtMKTzq2KU5ldpaQF3u7F
         g7rKAY+4LLvIN0D0Th1Zg/8WEle6NaiSRfvNJdCzmHLNrmdgS13RFdGwgEZi8IOxFNGG
         iFA9HXJ4f/4B+pUHl2Sg/4UPBmUfPJBm9B72zKbLMWykQbOTXzymXx31H0h1SizGG+PV
         r1Fg==
X-Forwarded-Encrypted: i=1; AKwUvBylmGy1Fl1bKjk8SK4YjIL073bK68VGzYmJHvFWi2YC0HVTol/lbower9OylS+M/b8vYfH4cckbmoFHdwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeStFMHain+SPXkmw/Z8Z9OyRUtRaYuqaQFZpAO4UT7Dhfpmvg
	Aisx2gv31vbGX1M62snnmxmnQL/llwV+ouq4hOfewDThtXlG5ZJgGkNyaFXC2f5rpCc=
X-Gm-Gg: AYBFou03ZK72nDXSJZ7cWjNiU5SexbYbDVJL8yFWqXb5XJr/FMO9Nx0cQVfxrzStjGH
	UxCi2qUVjnfXGhUhkLgGAsLE7CTdS4DhQG9rZDfMCG5nNZ+vP5F8HBjbfZGoIBcTB5dwzqpazsE
	5ZHHr2W8CdHTVzGs7CfmB3FY4/HN73l3KsRPqo+GimQt7cwxrrcUGnBaVBMueC5YZMseuDUTMcm
	k+JyTyeZwLjbOgWqeFTFFFl+g1UvKKdKDg21OFfXw2qN4LqYBle6d6twzvJi7hbuB76EDHFZklZ
	E4ouss0aYcf78pmjkf14mztev8vdugHFyV1E5K3202I+pyjSN/9syExeHlSloh9ZLJRmYDYgv2f
	SJeluyrlrvNGlCFVEmv/VnbLRQZv9eDoUwlrLTgc0LuWw6i0+Te/07Xd//An0c6RAoweSP4nHuk
	RL5y43TREZsn9Ap/eBBygUY7rCa0lqerS772JTjuHZsMMpotIL3LLBZIrUSzdb+UBzE5r9ysDeW
	LJjJ81ufDD/n1fv4IBuQDP5bVWrqncf2D//ZTxvc041aaJT7kwZzYuLifOn24UZa3AmIFlZKfk=
X-Received: by 2002:a05:6000:401f:b0:48b:68:594a with SMTP id ffacd0b85a97d-48e264a328dmr12950455f8f.12.1792693313834;
        Thu, 22 Oct 2026 11:21:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e379cf680sm10654f8f.20.2026.10.22.11.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:21:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] MAINTAINERS: cover all the headers in ARM/Amlogic
 Meson SoC CLOCK FRAMEWORK
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
References: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
Date: Thu, 22 Oct 2026 20:21:46 +0200
Message-Id: <179269330668.4070168.14282043797701140302.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=600; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=FHA0UZKs4ozL3194RgoWCh9aYKr2i6a1lCUCq4oBDkE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm3QhzWOBQZXriX7Ht+SVZ0w74cw10ndyeHsz2zKu5as
 fFW9O60jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkyx5GhgWGYu7+x3JF1PfO
 /nCPJ0JCaSGTRt3uzHnByRxfJx05fYnhf0xUcsuTE1qzk6PWPpon7p79Z+avy3UzZyx/+/djhVH
 0ESYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Thu, 22 Oct 2026 17:57:26 +0200, Carlo Caione <ccaione@baylibre.com> wrote:
> The ARM/Amlogic Meson SoC CLOCK FRAMEWORK section was written when the
> GXBB and Meson8 headers were the only clock headers, and only the A1
> ones were added to it since. The headers of the AXG, G12A, A9, C3, S4
> and T7 clock controllers in include/dt-bindings/clock/ are not covered,
> so ./scripts/get_maintainer.pl does not return this section for them.
> 
> Match every amlogic,* clock header, and the axg* and g12a* ones.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

