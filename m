Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794393922;
	b=30JLqzTJDrGbPc4HJAm/jrsi++p1N1E4pRvMnVV4jajwLBZBNXEcp3s78cEiIQtVMJAQ
	 Nf1lTFqwRMpQvcRyImIVDNXrsx4wurHQLMiiQK497owzq5211o00n2UID2RiHMQG//1k/
	 khnYIzGPoHhYXsFU9TObOv5+TwT41lh1k6DcH3/VUM/T6TAkXDPprhB9R37e8StQ+RsHZ
	 XkGdgCb/557Ku2mxpnfsMta2aXuyPBb5BDrzb/Vf+s8+0nUSkTp7fC6fExGQRGf/DDGm4
	 dfXqcpImlmj70SaBGCQlMSkB6TGjCULgmQ7oI7iYyapCJJhC2cGNzPN7kYIoynQePpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VcKJabFzTVbjKEa9TZqeK9yN9ffYcu/rnFFvEOpyqps=;
	b=zTuw2izHyLrp43GpUaYVrk5lShT5GI8OoFSULm5yuvFceVkG+KD7Aqf10TRwyX2fwJog
	 BztUA8bDZXm5rMbQ5bUBJa1XS/zMQMOq2EIHAVFvxfMRqctIViSqXYAraZmw+qBZy6JxP
	 8K+6x4PYxSEDLWmM8t8qO5c209mbmgNBjzUoI3zRbhIxzg1Ygrzj1jPS4Bni31Exp4Mqr
	 Q9Nqig5GPbzKEjKn1t8axxIMCcPpeSTDlisAXos00hMn589b1/NajntZlYp7YhYFHnP+U
	 E0vZOH8/s7wLg5DPIB99oY9njik3j6R1uTKvMQFEuErG0ZgrMzYvPIsqq6St1Dm7NIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=VlvEedBE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFC7606A88F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFC7606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=VlvEedBE
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4c9abc1824so427028866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794393920; cv=none;
        d=google.com; s=arc-20260327;
        b=IOQtzCndhdogrdlWmsN+KQAhtKk3G7QT4zTfwLP8WQFqq9CjSU5A6lRg2Ea8rIQ02g
         5SYI33UBBPPqQOxnUYLxuIXwT1bFiMaDyAITgZO5LV0xO3fXtP6KjTeI5AgRuKbiqDFf
         M0k7+XFlmXEac2HdPc8juEI5rDlaO5QA2OCR6QAAtzcB7/nLR4Y0Afynoxs9vlGEwNQY
         v3DpXm9HbvyhPTqVOzlpXES9CDBu97gi/N8KITG4DdFsa0FEf6IMHj7auzPJ80jh9M8e
         dq19rMQqFezSL6UNH7qyjRUm8W4AYvj4je7JrGh8H/p5zE/pmOinyHbuAJPagKcBvmmC
         FCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VcKJabFzTVbjKEa9TZqeK9yN9ffYcu/rnFFvEOpyqps=;
        fh=rRILeIWkCYNg6dd4RorYRC+eGO/kcwi8z/xjblzmWeo=;
        b=C1dv7NT7AAXjE1o8gdA+2YaC3UgLt4xclQ4BsxWjOcvMQIVTtBoxaYujnR8yI1rLHa
         iPURoaRwk1wfa0HygZ+4aINKLhBE5K3Tkx/c7LjMxk1ede+Ve5YMvVB9SJpAmj+5mkoE
         HQqzpNa82F+HSVQdcUGMML8VXXYdVkYyfrILgUTb4yPGR4pSwHlKnLknLB3z3cTgCFQD
         RhvwV9Cz5U1ISPS2kvDJDUHPKrb7I6wRq5w6DlqKrxEebHgtrZlhvj7stZw49tqSji0o
         83Mxz5OMy4BiCRFklNkkjgL/Jupeh13G8qOTqTjXn9lZtjHaOKDq6AWJPPpEa8/vyFCD
         Bcwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794393920; x=1794998720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VcKJabFzTVbjKEa9TZqeK9yN9ffYcu/rnFFvEOpyqps=;
        b=VlvEedBEndSP0TfzLQwadr9DYG4XV2qpa1/adLm5CgAQfpPpS1gWKgZg4ciQBhusPi
         Y4lETkhrOsqZOnRxRCyugHaATdsjUGIusqJXuMvJGIBe8CvWzfxPPRbsMnDjqGWCt2hX
         CCesXOaVjudJ8ToiFFNhbueCH1F1JS2R5RbQaxoNorpy5L8xmcp+dCuy1e3XNIeE/YJ0
         4e9CqD6yK5EFBjbSc8N5VpMD++naFoVFSuGDz8Yw1p3w0aDVEhepNyMC37nR4RiYBN+o
         bZhYsMQCab8Z6x/05PMnQLXRthWIee4kLWUv+9vVtMscGpweM4Vwj3O+8IVn/pd0zoWB
         vVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393920; x=1794998720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcKJabFzTVbjKEa9TZqeK9yN9ffYcu/rnFFvEOpyqps=;
        b=RH9XWlJGNfHGnHCt+FvteqBV0m7W5EdT7h84tDf9gAlJP+s+4lqpR2Qi7E2OEqo02a
         3i0UUSzA34iO8nv17Jf4FuhrwUMoynucTn/A+86DpMpSuuTCkEBZxgFHrwyp5TEADqoA
         MiYBfb8oo0JUswkuwRjrYDOQfhomPZeQuSZ0Dcqiyh4sYHgh9hXEjRBIBAuRw0DZ2YAJ
         8l9LygtCSAtN534jvHANER7vCFPawEOPJPwgtvSFUzDhyftfwlB+lpNLO5sG1FuwiIUM
         ZzcRC3fA1glLH5JCZ6GmG5qN0Yz5gjKesprW0ar7owIQEP46gSLIU3usucrWhsEVTDey
         Zl7g==
X-Forwarded-Encrypted: i=1; AL+hErHPc80wAb4s+5ANRp+tmXcY/PGxF8ArHs/JJnOJ1zlwIMVJd6ryLQ66EEwTVUQHNBlR9QrUUB41TOfSsyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H53t1vX05R6TSW+S7hF94HtLFTbfWcK/HCYa9xYw4COxKOo2F
	s0d1ql1EWbWR/cvTfKF+6zQUuaRmTEoTebbelB1sj+lpYz5Lom/OIJA3ML0wYN+fgFw0LuDvQ7M
	761rgheAa3f+i8X7cUPbMkFOw2Ye4TF0B1cISFi0eDQ==
X-Gm-Gg: AYBFou0rKLqCQ+D4YXPOgXNj6nWzcomto5eRX5dPkIhfdld/uyNhsQ1cc7iXC7Fz07q
	Y4A+97gvLDTHA45DF4+7pWFRFWakgdihBCeGsBob7CXs+dkyqbAq9K0R6LmY9m6v0myI6yXxoVp
	rbaHBM/hY9gwUZs5iowqJGhrNeVSvJnjKrzslYGSfv3iuUzppnGRtSiDZN+rXxwjfhernOAmt+Z
	wUNXdAkDhua2zp7Avca2zOuQTcRBB8K1c7csokYyeDEu4HiANJr6LkqGZgAoQWPvt5ys6RiJKF5
	QEFQlXtTK91Wo1QC/U3R3lQ6wTD6LoSQclHA1bugr8YnOvvk6dRgyJKcTXsAk0PlD+Ark9RAIU8
	8HAPAFdvOC9EgkrivFRYKItrTVKtpEKNe3qnVhQ6GwYXLqOpfEMXRQfbOcRU+36sZO7BBpQ==
X-Received: by 2002:a17:907:7292:b0:c2e:2252:6ddb with SMTP id
 a640c23a62f3a-c5066a84511mr152183666b.10.1794393919375; Wed, 11 Nov 2026
 02:45:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net> <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com>
In-Reply-To: <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Nov 2026 14:45:08 +0400
X-Gm-Features: AclHuK-JFFUWS_xdTW0P5OLa1DScA4kfALrbjXlHmDv-4WjET9Tuop7_ZcygSgc
Message-ID: <CAKTNdwHbxnknob9NdjqWUcGU2fURO5B7V4kTTK+fvEYjNDOLCA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576 EVB1
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chaoyi,

On Wed, Nov 11, 2026 at 1:31=E2=80=AFPM Chaoyi Chen <chaoyi.chen@rock-chips=
.com> wrote:
>
> Hi Alexey,
>
> On 11/7/2026 1:52 AM, Alexey Charkov wrote:
> > RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
> > controller and a fixed-voltage VBUS supply.
> >
> > Describe it in the device tree, including the wiring for both the USB a=
nd
> > the DP side.
> >
> > This makes the data roles follow the Type-C port's negotiation, so the
> > port stops being host only. It also leaves the VBUS regulator to be
> > managed by TCPM instead of being hardwired via the tangentially related
> > phy-supply on a USB controller. DP lanes are also muxed dynamically by
> > the USBDP PHY based on the Type-C port's negotiation, so the hacky fixe=
d
> > lane muxing also goes away.
> >
>
> Have you tested this? As far as I know, dw-dp driver does not support
> Type-C HPD yet.

I did - it works fine for me under Linux with Sebastian's patches. My
primary motivation, however, was U-Boot, where the current phy-supply
hack breaks USB data role switching, due to VBUS being forced
always-on. With this patch it works, and now the DT actually describes
the hardware, as it is supposed to.

Best regards,
Alexey
