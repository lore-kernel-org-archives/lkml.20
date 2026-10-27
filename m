Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793137713;
	b=5Dyf38TjiXmgch1DMrwhO9nCMWnxTiOO4GKaYo89FBsCttoIWjKr8oIpGR9bKEUEovvq
	 EQb5NR6ROEyVcR31PcLLZf9ay8VFmXi6su1Uc3ZHETc6vVMYLw3EUUmaRhxnpo37W3rHI
	 7BvCUSZOkGNKFS8Qc1Yyyl5lv4PEqxHKaLsCuoLj1Mfw6p+Qpfr4Ful3yoIM8V0HFzyMT
	 0Dxa+iRRQOCtkSo/RU6s3WmbBaMdKmNTA5w+Z1PlKPp41H7+jQxYgwWLlydwXRXEgHRWn
	 R7+iapmlM/cL82injTVcGXGiKpSc68TLSuGtextLHdRdn1udqwNqkjHfLfqmNjvTb3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R5y3TC+OxgWb2k2zCyoTeuDSWBjSf0l8Xg0k9asjKQ8=;
	b=0WpfHMrtERtiPDpI0Xrzzv399f36qR5l9l2FLVoliXaebe6l0bPTCoiHB9lO/PFGTBje
	 o5sibhNa8CklNeZ1tixnL9/8fODd7++NNQsB09o2mUNynZ3WGCkI/S5I+HbwACL3S57qG
	 WcoMehiEyt3LhxrvgzG6/hjPHnNZhGNRWQ7A7Qm1lYHagIfB852KNLgXujmtW2JGVKUmX
	 U3xV4oN2PH6ddR5GzfuYvlu2oLV1NmmI40WIQyFF1iu1XWW4gRgxYe2FHE/zKOMxg7IbT
	 2PjIUFc3ydqWbMWuwQTh+YyemKDGQp/tVCQLbcgmYWFwpK9GdASt4eX+uaQLCS9DxmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=NsnIF6s2;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A39606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A39606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=NsnIF6s2
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 173963FEB0
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793137710;
	bh=R5y3TC+OxgWb2k2zCyoTeuDSWBjSf0l8Xg0k9asjKQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=NsnIF6s23mLz8NdigrB4LFVWsHXrAI2gv8c/0r4DaBDgi1/szzsT3mv4J1WQvsX7U
	 zdzd/DmaabVx0WgdHBRtYbsUUXQfLEmyIpuGgKO5QETxu3kW2fIUwM5U7EAKh+CzyL
	 Pp9eBfvo7+XiQGcCKx0ts23DJkfEFlO/G03UBIhkJasSzYcHH7IHNp5njCNmk+G+fX
	 8D5ybftMkhFpOTqrB031ZTfloLSY5zbGBxPF3Pi4FrN6DTWkxAj/qZzzsg59AoaEST
	 9SQcPFdyqRxu7i3MP42POw4BgRS9tkm1/JJA95eprKGqLI9+SH3EgE2aJ+83zzBQsH
	 0BK2u573yl1ivql/6a50YiauLCYuvqU9yJpCciUGP6JfULI4OnQFcAEoLF8LQkShTJ
	 C8pkCrsnxG0Ls3PJ67TagKG7PvFo6IabWsfM8+YMZ2fKbwt8i9URBHx+cOA+J+9wIB
	 wjNDKJ+hHkZKc3fQAhVSzXiNzs1EkPR6BwsF+9hJgbaT19J/EoO76NQTPsQftvBV1S
	 fue1T1CPnh3FP1giDmLPTaBIcypc/pNfudv+N/2IhOW/d7T1F9SgW+oVhU44HidGMJ
	 +gSp4ue3iAgi/OMUiyJX881ZsA2MKWyhDgMtdfG/H//GT7I9gqPXcQFi3DcV1xLLUR
	 +OW5JYCOTL41oZtLE0vGfUp4=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad94b96698so75844a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793137708; x=1793742508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5y3TC+OxgWb2k2zCyoTeuDSWBjSf0l8Xg0k9asjKQ8=;
        b=ULjz0fMnGZvajX5eQGaMD+l7pwqoBTR35sCKkopowZCw7FVddjbEnbBzizXDEoZdB9
         2+X9DvfdSiNPRYdK5Nyrtr6eju5trgtYTO3Mm3XT6ZUtMTSmkiWW7rwxNQkEeHoxBSoy
         o/rL+jG2g1jiPKABIWJ3h2UOrY17rQI0m8qQiZ5KMd0VeWZDVpf+eh35ABa/2W3nFaI3
         c9kWYRplLbyeyGpPBkfc2rKRRe3NXD+ppnimnJMhz4ZRofhRdgRosk1r+Z/0YrUtPsEv
         +keigiNXp5CQk0bkGsXz/XXjZxUyMu4CXMPPKyU5NY+hiQ05l6kX/yJ/TxhG0taX0JfO
         gzdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9+sk8Hy57/KwvHjSjT66lNADoQ/gxWGQJNIpA3k2mQsfFXW8ES0GPMkk5e6dR7lsejL4L8BRHP573da4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwkWEQYKmnqN2q4nWv3TXJ9Druxc7JoI6h5FQaC9GIx5urFaiB
	KYgI+S7/xrmtb1DKzLQH5zsKVk3wiXOejp7UJSmn30ath84HRGtVPE5yWe2Hzh7wcKVhy4IGwUq
	oH4Qjii4SYcuiq5oX5JAYfTPgMqB6TH/LNebAisD9t+g3J81wwkLP6b6XiKzuulIAE8TobcDzIc
	IhFn2qGg==
X-Gm-Gg: AYBFou3UB/opNc6nVKqIHVTi+Uiz4dL4zYDg/hJpsULlaCmsCA8XhtXXNDVt4lUASXx
	VL/nwq2sU6D4nG6LZ9pRAgBVv2SXiMl3GZeR8xAJ/Bej+YzTYwTYLDoP7RicfTI7EG0t7ffjGSf
	VwGktOa2rht+ZxJxzgutyacXYD36eDk/XSlrs3FpHeixIUkk/D1h2C/NoEpHi0DK1G4KaWJgLi0
	SnrJ21Hgh6A7r6Iia2z5x8gUhkm8pRWv/vueDj8aaUGy3BMxHTUi+VZM5ulIwhnD1KwnWUNMKzi
	WvbuLvnZVNNDd92SWA7GVZBfRv9DIVG87Pa6ha7Z8P+GAb1qhHs2fV8gTnsXB6EszX6Pkgv5tcd
	BpLSieoAq11UNkpEVxAgl2w5E/PAq0lKq8dfrJ08coOJLp0dmpoNTi8ZQL9b+2nQ6cVkI1uvv91
	RYMNh1IcAL9Yod+a4EOjNqP+ZXAdG9Q9wYDmDzHMZJSZ3A16S89hAIIVIj/qjY2WsI1PYGY84Ql
	g4qPsANrrpPiV+o8iOisr94gsDEyh3k5dQE7Lq4Pw==
X-Received: by 2002:a17:90b:6d0:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3ae581402edmr428979a91.4.1793137708598;
        Tue, 27 Oct 2026 14:48:28 -0700 (PDT)
X-Received: by 2002:a17:90b:6d0:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3ae581402edmr428960a91.4.1793137708192;
        Tue, 27 Oct 2026 14:48:28 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-fcc4-d427-0dad-9764.dynamic-ip6.hinet.net. [2001:b011:2008:445c:fcc4:d427:dad:9764])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a5e73sm37741a91.10.2026.10.27.14.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:48:27 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	cocci@inria.fr,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6 1/3] serdev: handle devices without an ACPI or device tree node
Date: Wed, 28 Oct 2026 05:47:42 +0800
Message-Id: <20261027214742.3624605-1-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <75e6d86340073638d966acb85465c28e6a08ceda.camel@posteo.de>
References: <cover.1792856688.git.an.wu@canonical.com> <263a607c3602f31a3f6fdd245e3c2008cdf97abd.1792856688.git.an.wu@canonical.com> <75e6d86340073638d966acb85465c28e6a08ceda.camel@posteo.de>
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

On Mon, 2026-10-26 at 13:59 +0000, Markus Probst wrote:
> Reviewed-by: Markus Probst <markus.probst@posteo.de>
>
> You should add the maintainers for the modpost scripts to To/Cc.
>
> $ ./scripts/get_maintainer.pl scripts/coccinelle/misc/of_table.cocci
> scripts/mod/file2alias.c scripts/mod/devicetable-offsets.c
> include/linux/mod_devicetable.h

Hi Markus,

Thank you for the reminder. Adding the Coccinelle and modpost
maintainers to Cc now.

BR
    An
