Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320242;
	b=BTajgYfWZGUz3rUqBWXkhMOqyirBVKNBLdDW+c2/dEgQvSYl4H8pxnAGJ7DO5WgthklX
	 vR6Om5yA+oUMGwzyF+AoKSAfeLkCi0N5Qx9xxuTgyaF7haBU75Y1lPTQPWLz7UCCD2esk
	 ykFsHz1Ey1Wak6Bx4ACI1ftZj5DsuVXnrCBT278y6dV9eK2HDPVUTHqX2pCVTytGdS+ak
	 goLuBzSDUVTS1Jtm5cpst/qcIsIvdsK/YQKyyBtLZQp0UoznFc5ot0n6k6Ld0fVxMW8B8
	 ouckQLxz5z/S/xAcASvsPBo2P020aIqkyqPyF/jseH6DWbAgJeE+YLBQyldnxJ3vleg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320242;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=1sO8TShiJNFb0KYXxNfr4n78remHhHZjTgn2fa5N6SM=;
	b=PXFVYcw4rpkxZDzgmarOSgJ6BHieMY1VJlUdIovE8NwOIEz16h6WwdzvXS5H1Jmw2mte
	 GuIjCt0ILbZxMZP5Pu0KGSg+SHE5cOwUqQ1suaRCO8qVef1+l/CIUsxQHk642y4+kB0H4
	 XrayiJBIqCDYm4qQsG27hff0+k/JSdWgpd3/2t6kgUgEaH0WB9C4a1j+m17Zl4r1M8QrB
	 Jv+tPZJCGKUqVq2Pvq++QI6vwk/Wz+YjyahelaYTC6vJ2Nj3f6yK8nURikV0M/OVbtrcb
	 DKXMbw6kaSiH9WVtx91ZjqKN09jKwhjqo6OCo0YMJUVSP3glcjM64LONgLupLS/lv0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26940606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26940606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so59186066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:17:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320240; x=1794925040;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1sO8TShiJNFb0KYXxNfr4n78remHhHZjTgn2fa5N6SM=;
        b=Hgwa2oFBSQKzsk8m8D3Akw3CzGcWw1QiiMlTV+fG3ErHH0VrbC3xdxPVr9CGugEB5B
         8XBJKnx3KND++yWV8o5p1c/MwLdIMiLAeKu0O1cuXD2/Yq4gABYMmiU/f4aqGK1koiAe
         Ue1AfBy0UL95c/y0f2Brq+C+Ku0M7pNwUN5QHR1whCpZX1mfLGavc978zapeH91eanZ5
         dXZbo03IQWu2XlwExCN705XYTCsWdeijmBlFEZETs1ENFEpGUy3DKzMLtmBEIMwtWBWy
         XEGFt8iAroeph9LxON47utgr7YUlxtuARvSeNrVJsltBjj3rdHhy9oguI4MAgRZt48qs
         DcYw==
X-Forwarded-Encrypted: i=1; AL+hErHrIx7arMFv/CrO3RifXeD7TH9XJt0B34pvYPayq4KyJ9HPNYQHxved5GJXVdSkdD1/3oyBjoKgXZsIq/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Aw9SJw9382k+n7oGC+nY1SwdKosAU5XqEx9CoyrvrGGZKn/XZ
	SMQowGeDp9iQFE6SXnyPWafjNljSji7GIPjP+8e/0LGebDb5ETWiiwH9KNvucsh/U/U=
X-Gm-Gg: AYBFou18EpOqPfUu9rt/L7RE4sIEBV+XH6kcotnvSUMB9qdg664mEvXuPrwCxLrHXgI
	bWrbSOh45BKtv5zXeiIwZA3CpBNvMhyCbtbIG8OlU0/upZMzokDXzcnwdj1141mWdF1rogfd873
	+8TrLMRnxWnZCVlpCqN9cXV2sFR5ZzFTECpZ8195z5vWxPGquaqql5Npz7E8O8l7a5jYzdjEtJK
	e9trqRPfE6eQqu4OExQSt0igHK2sSo+1xHzZwkenJCosbBAtvWIzExSe/Ealrw5GA4owWik7p+i
	sYTxvG6mlET7WJ41zyj05N63QIRppWJiuONu361IXW3VVRPfArRpMQV50yUYCcCFBYTjo9/XAXv
	7SwCUqBX6GOoScDVqjDJ5Myc3D/H7RidfzP+1/53nWeOqi4gfmKf62wnkg2dfblLOlCMg0cTsAN
	UW9xQpPl4nycK1aWr7psCOn/PTiuuiR6CDcYGKpIngC9CAml1dLAyLVQyxZ7FYRxzhUJ3AyoY3m
	TNAq6b6OVE40cPoXjFXYqN3s6nrpoztI9tIh1ztrN9BZWHoUWrV+Ob0xhtPcBmqi5AerMo+fbZl
	CRj8Tl40zTnUEAnlsiDmVLpd3D2jOamMDEa9ZFID8/KcSHU3D9TPoFqdhQSSz+TlUQjZ
X-Received: by 2002:a17:906:7b81:b0:c3f:7270:10ab with SMTP id a640c23a62f3a-c504952c5c0mr176758166b.14.1794320240342;
        Tue, 10 Nov 2026 06:17:20 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6916sm113841266b.7.2026.11.10.06.17.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:17:19 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so2424665a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:17:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGvrDYKY6CwPVNsrIuPPyGf9d1KmfMGVN63WfEk1Tta2njrZ7tXjKmmh4D0m8izUgyrlNtfmmS5r+dOxwY=@vger.kernel.org
X-Received: by 2002:a05:6402:43cd:b0:6b5:7140:e2f9 with SMTP id
 4fb4d7f45d1cf-6b756af3757mr2247392a12.33.1794320239029; Tue, 10 Nov 2026
 06:17:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026063942.3173469-1-den@valinux.co.jp>
In-Reply-To: <20261026063942.3173469-1-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 15:17:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXoxM-e0i=WTz3pgugmrxWb=BHfkCvsbWORvNO6eQTVzg@mail.gmail.com>
X-Gm-Features: AclHuK-Nj7_0nF4taJQudffw83bvsSL8D-xjCW71vcQzgkfQMu5qEkMjXoji9MU
Message-ID: <CAMuHMdXoxM-e0i=WTz3pgugmrxWb=BHfkCvsbWORvNO6eQTVzg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: spider: Add overlay for PCIe ch0
 endpoint mode
To: Koichiro Den <den@valinux.co.jp>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 07:39, Koichiro Den <den@valinux.co.jp> wrote:
> PCIe channel 0 on the R-Car S4-8 Spider board can work either as a Root
> Complex (the default) or as an Endpoint. Add an overlay that disables
> the RC node and enables the EP node, to let it work in EP mode.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v2:
>   - Polish the header (Marek)
>   - Link to v1: https://lore.kernel.org/r/20261022082113.3163666-1-den@valinux.co.jp/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
