Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F634D37AC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350977; cv=pass; b=mCkG6MZ5xHWVoclU5kyDvG2tpb2bceKeficKIVcqw8ZU+uWaS0x8M1fGt9kodltBUSY0d0TwLrMS6YBGJXyxczvJKrR4AIvsyQpJQhh4wZnZ9YRp2KXEIoy/xUKXKumyQV1aUBJXWBVzKj8sNjuVMkj+LTOM9ddBQgQnpCOA9ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350977; c=relaxed/simple;
	bh=YdJbeVGqh9AgSmmj5nG5sf7cECD5ZVbeKNl4YktWcOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egXAZrPqKAsLAgYgMdEJI0483VlJo926rGJ2LlbZg/rRZLYoOmKSpnznD5pSwBH+szkzUpj+L0c2gE0D9xG7tNEQgpsgoCPXtC/lXms6V9EAvplIlyvwUHzWSC/MlRDk9EPwDX3ZR6L0Zu5VNjla1wairRvN8KJ8wDEuSiXos74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=Ghur7AVG; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="Ghur7AVG"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaea178c96so989913a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350967; cv=none;
        d=google.com; s=arc-20260327;
        b=Nltw+iDRbX2nUixwHCyAcZJAQesgYEa8b6OQTzYoNnymolg9S7JTrnlqSjEz/W/IPL
         kTknJ+Tv5cVJXp5Y0EgrlsOrMfhTOtIiaCMEEkkci+haGgvkcRg1YBTQ7gTQ/tlPUgCg
         wGx+0Tj5STTFktmsJ/WVolIkrV2dC4YgeporkhtMq22udb3mz394bxgRle/IFlIZfFD+
         ojhIHLzJs51U2NXMgr31ap05xoNUBKMlIrgMIPdkh1sV2eGikM62jJBG42wlP19v/Jng
         uatHQkn8sxfj+yB2am+D96LIfEmXoSqUtSzazQ0HZNibRAzHWU+H/TXBO4sIALEzN64t
         JEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YdJbeVGqh9AgSmmj5nG5sf7cECD5ZVbeKNl4YktWcOI=;
        fh=K7PtX8W5rqxCCyB1D0akrrG0U47fpk34AaUxz8LwQU8=;
        b=SiN4QsZEu6zZwkZNChtya2MrUj9KgBQA/fllDbWRjhRfpV88IGPyYbkQjy6AUsqULv
         EIsW8D3X0EVNceSPUQ/PQfdLgiSfyDNOb1sSGG6x5TWgfEnkHjFoyAMSdhoi94+Kx4aL
         jCEECHUz7VK3j0o6MELLgeSvb3lFy+o+DwY5m8a/rilmaZm5hO5dJIWpT+X6H6SXWxF5
         vIrTVq59hBC0FgTdp2/slrjGHNK8m9PW6MRMHrC/HDEBA2uP1LCpu35FB1iuGcKDi9jI
         JufX/EeZAaFbZn/ZNNpI47AndXdRRapCFKOXw147Imrx3rNk74urgXKB6mGQLDel+Pkn
         22eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790350967; x=1790955767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YdJbeVGqh9AgSmmj5nG5sf7cECD5ZVbeKNl4YktWcOI=;
        b=Ghur7AVGaAGv7aj1VLmHVIHmdZRjM0EHqIdBNStVlKO3HzXNYvsPD+dOHhSnFwood5
         rbGpiQS0KygzjJs6oXCI2MAOF217jSTgrb9k7LxrvFRM0d32hG91+Nao9j9XLG9Bzq8J
         rLT/nQ/kAa/J2M3wVoIaAFdeb/UxZwXYhfAQRfQyH3DZ4vSG/suY2uHfjQ/cQvEt6eIR
         qDgXzUN8rBdyn46kzu8UceLnEAF5KROE0h7Xp3e+oW379j37gXwu1Zp8FAvgXTeV+WwR
         gqGAjVjrSs7gcNbD+iXNQLA8YoacfZDv6aCFhPo8qhF1k+QqM9NvvncaAACEKMDcf4JP
         NfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350967; x=1790955767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdJbeVGqh9AgSmmj5nG5sf7cECD5ZVbeKNl4YktWcOI=;
        b=WFmnUQrYJFjk5y9RAoMLt/1SWaR1rpe0AiILS73bwsSq4uo0Gai8qDSEAP/Sz/+IzH
         GeY0GVmxLlATeMFiSXai/yp/Oe5+9fkKMz2MZzrxlfDu3/hutAWB7jGTF4gq5ll3ipIQ
         ducgVwRPFUQXrxCp7NZE4rgKVK17jrQTAN2mtyI2ulB79ElkSoXyZ52cqgIk0bTEiOK1
         6B8IEmantL6f+UAnz8KE0JEmq/gnWpj4KhFIiV38KnzQkjRRd9P5tI9onsN/cTNnH5lv
         FlLhmFKO0U0LhPrkOMDJ+A68/OrMafdMaWp7ERQmZEtqcZlCFFXjq+ief6GQ7eIO50KN
         9gAQ==
X-Forwarded-Encrypted: i=1; AKwUvByvuPXzTgjSGGdv1ALlWr6vI13yvJAfjjuIhy0ZTD5+7ncVYGbXgUK/RwQ8UAkPJt+XdaJjw3k4laOgZr0=@vger.kernel.org
X-Gm-Message-State: AFuF++nT6rMxO8htKDnSm9+W4dMsz4ZIJanQKdjCyp8d1wUwUMQcGPbg
	2wq8pBoBttaZgSijReLLP4ARW0AC662OonRzB/wJZPGgKzjkfTxn+fF1LBO/kj5pc2s1yLWKVV3
	x656HcCxHKIyNK1CJEpM3ZLQRnszYXb1C3ckv3QlAJQ==
X-Gm-Gg: AYBFou3FQBVWbFbTd1t2N6Ckis6rGcjSt3xohNV/VGjJvPtTRPwnGpcDQxnqn+/4cb+
	OCi+ljBpPI5c9Brv9tf3gN3ZqggwgBpphfr5VQXSC06DtQQLExnNJw19LydH9W6LicMzMdp/ooG
	GN7so1qPB+tgCX2nS2ofhKb14cl/VTLp/zDSGD49uhQ5PuNibJRWm6PIPJW7uv4XF792FY8cGiO
	Ozm7BNw7RI847/hWDvwJMp0IKqtwUQ6rur5PdFDlE4w5elmAOQKV3EW+f5mbhOg+GqTeDfQmYbK
	6XHzR71Y5Afj6VrKA5cF9misBSwI0XAmR2j3lpQRPtgyLfotLAvUdJPq
X-Received: by 2002:a17:907:c308:b0:c28:ec7c:27ae with SMTP id
 a640c23a62f3a-c2ac5396f65mr492269466b.25.1790350967019; Fri, 25 Sep 2026
 08:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924071445.441822-1-adam@wermuth.pl> <20260924071445.441822-2-adam@wermuth.pl>
 <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se> <CABkrwJ6uvjS8bez6j0MZbp2Y+O9RhyU09YOLrUzHaeUEVC=Qkg@mail.gmail.com>
 <arZ0nqBvHDzSbZOE@venus> <CABkrwJ5xdMcRJsjubSJcfMkTs5CzKdAvQK83Xar3gZPvO_wa0w@mail.gmail.com>
In-Reply-To: <CABkrwJ5xdMcRJsjubSJcfMkTs5CzKdAvQK83Xar3gZPvO_wa0w@mail.gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 25 Sep 2026 19:42:33 +0400
X-Gm-Features: AclHuK-2aRN6dX_Oa2Kxhd9aYgpoKvv0HzTIcerNNDpaAcjfSDE1KhpeMcsyZ5E
Message-ID: <CAKTNdwG8YB7j-TrfJUr3f=7OBYC1Qx55Yu7ax=_C2NOtgNVrvQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
To: Adam Wermuth <adam@wermuth.pl>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 5:56=E2=80=AFPM Adam Wermuth <adam@wermuth.pl> wrot=
e:
>
> Hi,
>
> On Thu, 25 Sep 2026 3:26 PM, Sebastian Reichel wrote:
> > Why would this be better suited as an Overlay? Nothing describes the
> > specific card plugged in as it is auto-discovered via USB. The
> > overlays are mostly required for things that cannot easily be
> > auto-detected. FWIW we don't have M.2 Key M as a DT overlay either.
>
> The overlay was Jonas' suggestion, so I'll let him explain his
> reasoning. My own understanding was that it would avoid powering the
> slot (always-on supply plus RESET#/W_DISABLE1# hogs) on boards where
> nothing is plugged in.
>
> That said, I agree that the module itself is auto-discovered via USB,
> and the Key M slot on this board is described in the base DT as well,
> so I'm fine with keeping the B-key slot there, as in v1.
>
> > Something to consider is, that for Key E and Key M there is a proper
> > DT binding now: Documentation/devicetree/bindings/connector/pcie-m2-*.y=
aml
> >
> > We probably want the same for Key B.
>
> Thanks for the pointer. As far as I can see, a Key B binding would
> also need driver support to handle the supply, RESET# and W_DISABLE1#,
> so it is a larger piece of work. Would it be acceptable to describe
> the slot in the base DT for now and move to a connector binding once
> one exists for Key B?

Key B binding would be somewhat more involved than key E or key M. The
spec defines 16 distinct interface mux configurations selected by the
four CONFIG_X pins, which neither key M nor key E have (PCIe vs. SATA,
USB3 vs. SSIC, different audio configs, different I2C configs, etc.).
So it's a bit more than the supply, RESET# and W_DISABLE1#.

See for example [1] where just the PCIe vs. SATA selection is defined.
A proper binding will be needed sooner or later, though.

[1] https://github.com/flipperdevices/u-boot/blob/rk3576/board/flipper/flip=
per-one/flipper-one-rk3576.c#L41-L172

Best regards,
Alexey
