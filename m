Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85DC38D41F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967125; cv=none; b=D5zn0as+i4lXsFNzdDZC0S7duYjoT0CgKLztRy7G9iqf40k9TmBPIWVVuir3hYVKDjqM2bwQsu8e9BC482BCFbPmD+pSpA/KGehe64f8ajKFKZG3pWRRBbe37DQAmMAPCwRCXTWDLcbc8X4nU3j/v4urSh4Kq7g6zgfzTEInObs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967125; c=relaxed/simple;
	bh=d+7Dzq3mPeyFPY32y86AvdtMGs9/cR+SwwsFl7j1jgU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=U32kAEJpcxuFTXHzYTqJ3LKUzM0gnEbXA8YKLu2ATJ55R53GMCRzWtgVAUadbQx4XvVOf2ka0tjKXLWuqki1Uu76p5QXNPU4CGa9vcnMp/6sbw5YFcjVbikTNLmrXQir0HjYlNVZ4YTxITNZKOyTFF2/zBTbbyerXH6NFnb3bT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cULvCt0c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mBI6+CaK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cULvCt0c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mBI6+CaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790967118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0MvWYWwsu7LG0V0ETPW58ud5t6tmXACPDGuesfQVDA=;
	b=cULvCt0cs8apdmrxu4txQhDo5LIDOvTG6ohkt8OChz18DsHuvG3AozkhuuRh/fAIihvQjy
	CkQ7yydJ13cwCI/TxJslZSRz9o82nvjSWRwjxKMOxOoT1yhwzs7kzJYy9JylWLax2WHySq
	+wDXwWweSEbEOAXEzwodwqmmpEZ1xrA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-4uHFEw47NbqILIiCH5q0CQ-1; Fri, 02 Oct 2026 14:51:57 -0400
X-MC-Unique: 4uHFEw47NbqILIiCH5q0CQ-1
X-Mimecast-MFC-AGG-ID: 4uHFEw47NbqILIiCH5q0CQ_1790967117
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a109c937so2045106d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790967117; x=1791571917; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r0MvWYWwsu7LG0V0ETPW58ud5t6tmXACPDGuesfQVDA=;
        b=mBI6+CaK0VPmeI3cVu1PU3PD7RbV1HuhM4Ec9Ey+94hWHhmQ/efAt93x0359oUESUh
         o84iWcn2UKdw5BxVdjoZgOTbHoSEJvER33KkdVG9NliIsdF/mye6DY69YecSZctayYiF
         NyGExUQuSOycgO6SjwC3BJ3YJD4c3EzNED8RC4kUbU+lmTrS2ATY1LmulOlxCB6nqVqZ
         NgJ+BQ2y7+q0X/8rX//TRIcox77mTBRYF/dEXkwuCXlv/b6Vt5PoGPffIJfnkiU3F7IR
         Y0zp2pYYeTJJ95af7Rf6GvehD/APSgbDgfh5KzK3R1662lO/lyIT9mzEAe/Ir70TKZC4
         mItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967117; x=1791571917;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0MvWYWwsu7LG0V0ETPW58ud5t6tmXACPDGuesfQVDA=;
        b=gzMCk2YVk/RDPDSZtL9pX9BLuu4YSyNX8XTZ5DODR1CxyJlp5I4uP7Tt73Ia3xqJdK
         BfcI/3DwJj6xaosUyZj8EDMnXym5ohrT7Qlu+8ZyumgqmqepKXT3NiRg+wqdjlAoD7IM
         k8z0MRbrvluQNgExbmPrkPvRC8Fi5ni1SdVLzEH9ofBwIxYW1C/5bBfcpEtrUCm5zL6k
         W0CDPnUkyeh7Ta3f6QrS13fVy7LBuXggcW2+msSqR4abB/sM6qPrVxJnorsgM6ajNWDD
         gNo+cQ09O7bKT4irn92Zu+4WTFmdAr0SEes51ip4g6hgCRDbYUM+K7QvbEjE21lPrrq2
         f2pw==
X-Forwarded-Encrypted: i=1; AKwUvBwuq2sgbt7uXfPQeCL4LWCIn7RoYOC69v6Gbf4JYmWXud9SSuODIbik2yzh/H451x/ioONJaHTpl5YY4BA=@vger.kernel.org
X-Gm-Message-State: AFuF++k33h3ta2vOk8lmKSpBhyyMdCZvRJ6PTIGN2JcsBOG2TujQCTI/
	fF15ZDN/9K8QlAyUqKlmWM+7l3hkA47mcABstwskDGYFqi8GoVDxCLuDV6g6xTyiKBty4LHPSza
	nLejYVzXydwuAJ3eFOBtlWzawWWSDQ4aKhcDnPK0BsU10xYqplsUTBe1Jp2tINZ2uIQ==
X-Gm-Gg: AYBFou0ilqpxgh3+KGzuSYhN4s5/Xcv55dJ9xNeDfwqG6MRWIb3OhkbRTangERWpj1n
	3TkN7y3UzdcJeJ1oNu5oGoVii+FHANNluZ+29phVNfjkKFVdJTxjbzhgn/FhKAjNZbPoAkd4o76
	8SpoW8Q377F8M5oDdhS56unU7iIiAedBPJjMozReunoanKmSBQ+FpbUC8mLAq3Xin0hD35LoCHI
	7jeWH52JRaIBOcVpcd/92QqzpEq+kGJFrJctav+PG8K2QUbZBRpav8oiFRGcBxhh+GOHCYfa1ou
	0+uNk+BTBjpFRSnCJx+UHFMXFpSCBrvfN4Jzk0z8eXWi/GA1TLK6e7z5HG8eBW71GjajxM1U4+2
	HO70t2NJ/5VFqXA==
X-Received: by 2002:a05:620a:7105:b0:93a:824:ac8d with SMTP id af79cd13be357-93e5102406amr48501785a.27.1790967116811;
        Fri, 02 Oct 2026 11:51:56 -0700 (PDT)
X-Received: by 2002:a05:620a:7105:b0:93a:824:ac8d with SMTP id af79cd13be357-93e5102406amr48495985a.27.1790967116138;
        Fri, 02 Oct 2026 11:51:56 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca03a1bbsm290352485a.1.2026.10.02.11.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 11/23] dt-bindings: clock: Add StarFive JHB100
 Peripheral-0 clock and reset generator
From: Brian Masney <bmasney@redhat.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
 Kees Cook <kees@kernel.org>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20260930124317.5648-12-changhuang.liang@starfivetech.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-12-changhuang.liang@starfivetech.com>
Date: Fri, 02 Oct 2026 14:51:13 -0400
Message-Id: <179096707365.821688.14329539857628581125.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=d+7Dzq3mPeyFPY32y86AvdtMGs9/cR+SwwsFl7j1jgU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2/7Wx/KcQOOltnNfPrdMX3LuT/HC+0e60NpG6lD1rZ
 17q/rvbvKOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ/DvF8JvNMflnwRuHRRt/
 inec9nG6u3qLz7SmebNcL5042au9L+cTw28Wm8MCxyYbZ0apt67dn7TKUV08XMTt6JZbavvlIy/
 UbmYAAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Changhuang,

> Add bindings for the Peripheral-0 clock and reset generator (PER0CRG)
> on the JHB100 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml b/Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml
> new file mode 100644
> index 000000000000..db43e03fd60c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jhb100-per0crg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 Peripheral-0 Clock and Reset Generator
> +
> +maintainers:
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jhb100-per0crg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator (25 MHz)
> +      - description: PLL6
> +      - description: Configure 400MHz
> +      - description: Configure 800MHZ

There's a mismatch here in the casing of the units. One line has MHz and
the other has MHZ.

Brian

-- 
Brian Masney <bmasney@redhat.com>

