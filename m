Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631816;
	b=wY+/1/xB6P2/9fyX0L/XnXgOESA4pbXBNqso8yaJ8hAq/m/QjCjluxIAMkNwS0maDVq3
	 7FCzQqh5yuQ+sWNl4iSf3w6KMnV4jCERzJEJHrkcifsWPjIfsH7ric9vDXGQHDA71MMAd
	 9++1faiZkcpy0rpQ76xBWNfYoCMwB7O7F+y8sGC1IRi+25z8Nc30sTB3Zar0j4eVMFfIw
	 JgRBeDUrOCRbX6b7KYF10GR48qKTk+zikAZJ/TQhXtfKosbz3nTrgoLUJNAcA/1F+Xgg2
	 T4UUKyvYZxQetgXj4MqVdQ3DzdFoIOA92G2EfK+isI6Z0r1zreizXGJ55E0rAk8VuRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=fl1s83XUSSgJEmjMrzHDXuBkyCkMWW9Bq4zRv3Gu3C8=;
	b=2aUSlkazWnCehnhnxY0V5DRs9RfmaWZonwG5d81zQuE/osl7Yfe/YVhHtcXC5piwFVai
	 l8fOXBwSkg3gqgTCqU93SKTCTvBfd4tGkKOFeyylDEoQ+oFCuT4NZzrO91lJQqUNa8p3a
	 P98OQkAdo/QsKE5ghPQgyZLSHixtHkjFF0CbOxAQiGyLgS/iorO6eVGLISlLQxJFtBtjA
	 bXGFA9AEj3W2aOrZSf7FIbjMK9wcZ6mUtPpT4bylklA/L4wt3Uq5749cs6eAVe3kZ8lhB
	 /aROprTNqk+Yiq+7WguGXdltx9M7yYnMb6urwAPWv7aGZIp1GH9LP0O9z/jelcbkR5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JphtRj7f;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF10606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF10606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JphtRj7f
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2eac4936dfdso3169085ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631816; x=1795236616; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fl1s83XUSSgJEmjMrzHDXuBkyCkMWW9Bq4zRv3Gu3C8=;
        b=JphtRj7f3HVMIULAQ8ELkcLLXpYn5oqFJ116GY0ZMR1bKvBPTecqskk4D2jpXcG92T
         EDGrbgMotD340kI6uOr3eO3CWZfJZuE7VAzeEl7/KG5zkNAPJ9HAhNPoh86EoyhhrEXi
         5ZpL2TRGUh98wONaOenjy/2VWbx4uj/v8PlsCVnW4lnZv6dI8c/6qSyqFUmg+mjhwish
         /oIF4xvvSwFMYzydbwEFZ6FW5ADFR1zP1D9aGIltptILATSilRyxWSajaic7xMf0fB5k
         rXDhak7HgctYDlLHw5iuMT1I6VLV0kXDmn3ihKkFC8K1ZneDwr9k26bBsR9wJ08+n19J
         H4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631816; x=1795236616;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fl1s83XUSSgJEmjMrzHDXuBkyCkMWW9Bq4zRv3Gu3C8=;
        b=VCaJ1b/1Jid3qfhIzqZfpWt0L2loPxoWHOuaL/8PkKoOZSHJRkcweE1SDGZwopURTx
         8bhWVnib9XkB3BWz6axZwDz+QKWkwPEUYwwxHKCEE2AnO54fMAAaCDo9Be0x9dF+vi/A
         ex2sYGgdzWTNGFJ1OKD1hbnEtvOItGL4UvR8crYs4jcERoXC9/CPHIiyTfNBLq9MNKYj
         tBCZQ7MiiJwC8n1RXSvxjSoA5kGhhAd+5KsfQZ+/uOkIRtpLlN+7kf3gW1mGfiX7n92b
         CnoJ2jCs6JIIwFy1Ocwp6jyNjTlBMlzbcxDWEwUQQaSNg+QWdRL1y2T8U++ssw+kTS9g
         skHw==
X-Forwarded-Encrypted: i=1; AL+hErEg8CoQFAioHpxr0CC1YyJn8wLlDiZRkIYvijglvKW1vhgsUjbEWuLdvGJfs8F1WBc+07Qiw7Kv9MtNdY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IqwxrGIk5njt9qqrX9YqOwp0abLJLj7TzQD725W0WZ1+IPMOM
	+WeAObpaibnWNnOlzWAEdb6GlqWwuf3ttMKLHxH8t4m/5hn3DOqG9lpO
X-Gm-Gg: AYBFou2d3wB9ly1nYTKQN7jTFRqS39dSM40hHZ15nRZUSZjGdQBKICJ/tdMNBYmXyLf
	7t0Rm5JhocrpwpU4j76rXJ/cvfFHCb4n2lNOgzYKezFq6x3NunS37fCGbqMPHuLj0Btb5QUiTCY
	LyaZigA62Bta/d1Veej7XNnE3/EII98WXPXSlXnIXOUlTmT5eI6oe++hhyuz0IPZpX/0kIHsMT7
	pFi3JavGfbwN1VkBFj0dSNAFBdVPCAKyGFTVIvv+PVClsL/SlG8JrqcENPQs6Fml6ZdPZfccZ4M
	RwZuHo9VOnAb8VgJR3uD4EB/aibzkrp8Kk62GZuVYSYen3OGEDuKBKozTbRkjmnfVoQ6tQFQbh/
	B+e3IFi4QTGWwNOurDarvcxLsIy53cbEVD18xJklzq6sozUz4OLVOx2Gk/rRzUqKSpOkS2/NlIH
	KswA3qohP6xsFyKtLvrWxbUBwc+VAGCFYJc3PrGdBcjxy5Z0E3eN1rbMHsAp+/+RDTu1kyx6YVv
	Am7atZdyAFLDXAB3i3MEx9JuIEQ8TKEjiz1b2nYTLRxqKAxEae5HHGjsJecG/DMCIeizEkgsE5J
	BfcYRkfxLsQlq6HjKpiVuTOoyN7fNKyjqTd7jD3Z9ojrZ80QLQwLG/N4CRpgJxNWkKU8NQ/dyw4
	NrkgbVA==
X-Received: by 2002:a17:90b:1d47:b0:3ac:9e76:aa96 with SMTP id 98e67ed59e1d1-3b1b09f966bmr6902083a91.3.1794631815820;
        Fri, 13 Nov 2026 20:50:15 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm12649072a91.7.2026.11.13.20.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:50:15 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, lgs201920130244@gmail.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v2 00/17] media: rockchip: rga: Add multi-core support
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
Date: Sat, 14 Nov 2026 04:50:12 -0000
Message-ID: <179463181227.3521962.17897555296763209132@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Sven,

Tested on an Orange Pi 5 (RK3588S), v7.3 with rga/ and rkvdec/ synced
to the 7.4 merge window, all 17 patches, together with Detlev's rkvdec
multi-core v2 on top of your two v4l2-mem2mem patches. Both RGA3 cores
bind into one video node, and 4 parallel NV12 to BGRx jobs complete
with interrupts on both cores. rkvdec runs parallel jobs on both
cores through 06 and 07 (2 parallel 4K HEVC streams: 202 fps against
111 on one core, bit-exact). No IOMMU faults or timeouts.

One cosmetic thing: the core bound first prints "HW Version: 0x00.00",
probably because the version is read before that core is powered.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>

Arun
