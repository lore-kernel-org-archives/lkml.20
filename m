Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077813;
	b=Vwd1Z+IZx/P1qZ1FggP1Toh3/GrytXvqYK+xOhZ8a/+8UQpy94bGHwNmEayXmB8cqFrY
	 giaBgfQO+g1ugERKBhoqUMs673bCZxNmVHEs98eBOiNeW+qVPDpcnP63tJgH46DSuhXN+
	 bTx3eRbBl1Ni062FeAZ0xtdUOv8dwAvWATbR7cFBTbTxpw5wbB7dvULe1K9cMXI1OTX5h
	 9MouA74eBsAIVfppviul8gTWdHOMj5cW7DGzQKynunrvVBiyiLXPV7mmYByZlHHdV7cCu
	 3cAUWijyvcZYt0T/Pa/3C+43WqnEi1hX3KHQH8BX3PfKG1pypr75LQbeCT/95zndVKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EhQnVDe9USo4MEDAt10lIRyoDXqtd5qy3HB/D8OuXxY=;
	b=4VSQdpc4oHsMKk4mVaPkSyfhq81KfCpRATW0zT+nfDXmGkSPEr1fUHcpIEY+6Spn58sT
	 rG1Z93u1WMq4LRhj8iZOTtBKj0hGJx4WyNc9X1tqCD8gmnoVRzdJd08cMxpPu2DYybote
	 U2T0iDLi9TeV9p5RmCMeoEmv/JectTwKEVtdRrsyRTFVX0ALeNFgNUYaf+N4969BafbjD
	 nj3ajFxDAJTuyJUe1c6BVID8esVyas5dgNQYUgpKNfNDYmBou7TflyL/ohvzYbsBbvmGA
	 RwGXdoPa6oagDeusC5LVveTuzH4ZF6XOS+X/Vw9hfyQWV3O1wYbcantFl2f6D5VrZvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bvhShgG7;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A310F606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A310F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bvhShgG7
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1232683a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793077812; x=1793682612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhQnVDe9USo4MEDAt10lIRyoDXqtd5qy3HB/D8OuXxY=;
        b=bvhShgG7D7zcmztInFea9OSn7D5JSB0D4i6yf2n+crTq7yi8sQ9L3LLKQSM8xXnhkp
         AqbuI5FqtrdowocluYV2ukrP3D2+6rsKCdi1Z41pOP7b0xldyB01FWsU87xcrM1ltKwt
         kcr3vYsZ4f88sTfTaGS/12FRaQs3mo6OTf+MfJiFNZx7PdYwgY7Y/5XkHklFZ3etM9nJ
         RgVAgbYVxMhelPq7iSNSZhjFSWLaT1v5Vhtg/pvm67NtxQsd+f5YoS+gOBVzn176vHZz
         MPR2DrAz13Zck1vA7Ep9FKsc3GjKSyDQCbtFP8lGYIvNws58FuwvoNcq4dC31tEtn1pQ
         v3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793077812; x=1793682612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhQnVDe9USo4MEDAt10lIRyoDXqtd5qy3HB/D8OuXxY=;
        b=sjYLHvI5Mpf2GNFxyr0xceAVfY/cMHgvhYYUHY6W/iqkPZEajJwgEpxQZFuHp8Xal/
         CXYUsDrOv0imCiSkkmgezyIGNps/NCZ+AQqFAjtDqT2+UE7VOFb0UyrGfb5KLtvkctiJ
         4YLq7ODW5yfQ0oAGAgRSdtI6BdIrAo5uf+rJtSTtvbjaoInnTnHDBHlkpk0XzSu5hPi+
         rBogMIrIlBk8BXrAtzaDBfQX706OxzsRvvlHsZKLQMPlDqJWA1RAl5Rho69Zi27CMElP
         f7SAvzmtqFtfdA/bjLJpm40mplcwj8ryEoMDBuKuyyv+OwHdczcPcWD3vDQnyEnkHj/a
         m/0g==
X-Forwarded-Encrypted: i=1; AKwUvByUmkqH4CX2t37XxaC/ELGBwlmc8sP7/F4nbbREgwPxFyFytlBfyVsadZQ+gQhBHxC9uFUChx7aecBXbro=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm8Gj+KNn+qS0MVT+yfNL3sF6s+0OJdNVvD0AvTR+35VEzlYoy
	zTantS5K4p2IkGlWaj7eseQwpdI3djtmRfd5r4vnFdnleM0oVJEhoxdw
X-Gm-Gg: AYBFou1gJdmTLieYfuFZRf8n9iVx99WGXr2XrOuc0shF5aNTers4xea9xcsb7dRkJ4S
	fiO7kHyxOo5yPRMwFwy35JExL3BDNlTtekPELTdLP0L3YyeDPTXc4jFaaW/FDURCw40AiUBkjtv
	ruCgDpB+UzKtDEcbLiyLiNn6WYkOAZhEc2JhaIiZJimc7LotsohOamHHdviO9t3onhAiY21Kj7q
	vXdSXeathup8cb7rLWGVmLhH2P9hkJDtVKz9ZDLapg9sar6uDdR2qz+QQ4/3VOAustQIYxjV2HL
	CfWKnveajJS4cYIDJ0Jv8+874Q19AYPK0C7bPOCg4e9BZ6IMm9Sm/uM/u/w7Q2JpeThynUoA6ag
	gAJ74qUMHOWJt7UvDg2AxBWMqAVSTDa5Hg4EmjnKg4gBJeTdspdGKBlwySFIlzAMFMKfzR/MYPo
	87tp/O+RetzdkO9UEZpfL604NGxbDDXMptN32qhSUJJTeEouCYqsWFaevK7CF6WGdycXeCfPg3j
	yKsq5u8CGjh/THfQEQDVQGSvz/9IJEN2mqFKA==
X-Received: by 2002:a17:90b:3b45:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3ade9b2cff5mr8125294a91.1.1793077812053;
        Mon, 26 Oct 2026 22:10:12 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200::7be])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404556fbsm1893858a91.11.2026.10.26.22.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:10:11 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: lorenzo@kernel.org
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com
Subject: Re: [RFC net-next 2/3] net: airoha: npu: attach a coherent pool in the NPU window
Date: Tue, 27 Oct 2026 15:10:02 +1000
Message-ID: <20261027051002.3360392-1-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <at8FyOLeaMlpS7mR@lore-desk>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com> <20261024154150.45733-3-gilroyscott1970@gmail.com> <at8FyOLeaMlpS7mR@lore-desk>
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

On Mon, Oct 26, 2026, Lorenzo Bianconi wrote:
> nit: what about creating a dedicated routine for both firmware and dma
> memory regions. Something like:
>
> +static int airoha_npu_reserve_mem_region(struct device *dev,
> +					 struct resource *res)
[...]

Hi Lorenzo,

Thanks for the review. Sure, I will move both into
airoha_npu_reserve_mem_region() in v1. The pool attach then moves
ahead of dma_set_mask_and_coherent(), which is fine since nothing
allocates coherent memory in between.

v1 will follow once net-next reopens, together with a binding fix
from the Sashiko review of 1/3.

Regards,
Chris
