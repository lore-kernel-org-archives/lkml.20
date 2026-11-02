Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609381;
	b=GH7NOLlYmdunXLGbSJTdwsgKPvJtxkgLGUng06k1ufT6h5XAOi2elTY7qQXAu3ONvWmL
	 UYMUWIvbrx2Il3pgJDlDFkS5M1knPsU7oYX0Tlm6NduIDn0Xa/gWQg+k/zmbOEbRPWiu+
	 eG+1n1Zq4uKsGBytNBmFdYaDG30QDsICQeSy8HWGxT3bWgRy+XQFlWb8iXbeolT8lfl7Y
	 +g3lOwXdamMbhypuKG3ISacHrJyVI+DL7wddK+Zfr0c3UsTEXFDK4XtycBkJYNYKyBoJn
	 sfOqtqyy92mR0vnqWnNpQYdBXB7MAqT0zD1OvKi9J+W4/vItqJJaamkXKRczv1lI7Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609381;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+YEAseZvXPy4rzi3ilmBCswmMdSrruj82r2UTnccKOw=;
	b=MNeMzx2p4lP9W7IHviQTNYWJ0QQluIjzetG8Ufy4bIZvFhNjKE45knoz9b8uWwHg+Y/z
	 hbz71nbZPpO8R4AoWzkurREzouTV4+M1lgZBstfF9BRkaYu4344wn3+PRHcfymd70FKk3
	 UkZNfkoplh2YfvYFpV/49vgjDXbgmnMiXnjpaDK5UithruOBe8FysBXElfF9Cyd0a2mM3
	 GtEtyocLX2C6voRHbuVa/KZuReTXHfOcNrBBk9/WSFdL73Z38xXKmYyySImETQ4o/Iojv
	 5H7+l0uV+E8aTtKahWyfOhHbJeWkeJrLu9LgjStlj+JPd9mIihlm/H9TjUD/CSYU+Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A0E606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A0E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ec690faf85so748871e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:49:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609380; x=1794214180;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+YEAseZvXPy4rzi3ilmBCswmMdSrruj82r2UTnccKOw=;
        b=frCHogwCeRAF3BttSKpJ0T/jVlZsLkym7tQR2DhmBMwGO5uVZWNBJTX5+kT+wHKJuW
         YuXlX+Edsj8RmBMQUUG9gADyQkCyFutB8wdswSmqdu5ba0VKNKJ5Mc/uJIeBzatbt1Ts
         ZFHJHxnhY8vFi1d3NWYneqI3YaU8fkDhtrJkpSHsLLyq0/61RBfoZ3pkfQ/B10a4ZxlK
         LidfL3Htm1WjS/XzwSU1PTIqJAovi1e4RedMqCghOWGpABF6HdB5pdjvOmTab2D0TnGS
         j0n7WZRh+wJPOXq2gbvr035Re6cPZYd8QOzse/O7SVqo1F+r3H4hRczsrahOkjQdLdx5
         YsSQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9rYcT1SsYklhKGmAsfBLkyu614tS7g+kAOzBTFgiRU7VakHpBIJYWJfvs70XnAQ26vz4sMY3rb4gRkJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z81OWa5JE2QtZ4iG5SBylopn+fAKWYW8TkNT54tYTTahVpxB5sg
	O4LfVMjQgYBDcTPCE1s1hec6MPKGJn5gChkeeCIvZ0QH7/WC2NvQqeQ01H7m5SCO
X-Gm-Gg: AYBFou1BfCxdExxZAhCDLoz+W0YxFFZDg8sO3+3OnuFJu/1oi1gXKwv3AWsktnIhkEO
	uCwoa+eECRbHr82qJkY0zRDm/ND4pDK92fr3+oQVtG5rxEZL0Rq1mQA4bcwNePBszIZ6wE3gSpw
	jg5n0Ejy9R5+b8dgAyrCX56TFZVQIOi7B/It9BGT04yry7QbrMUYbPLEKeGgqRJJr+W3erUMo+u
	DdyEl8O9+buDxudpwcpDzyXAbzB4OCcyR6pk4onlvZo8PLsPGyaLeOuM0oYZknvHQCJAUjS3zyI
	mPVDy/JRDV+vD9w5G5S8EvqyYFADeE5Wzg8II4/ZqcWSMsK85mmGhyxzdccoyF+UO8zIvX57cIN
	Mlp1257GAL30N/P1lJks9fhThqfsLB1b/0BJ339BcWuiCABLh3ULDi6ao8Ru1T85wNORjvwmXZB
	vqBGfhP2iNzYXOG4Zk7wXn6uz5Ij6y/ef0SwDauk4fyUDIfuvEfXRrkD0MXt5KJMcOEit1Goyzh
	qLe4sAGvB72eB874W+7p5n4tgPyYM9YFdj1W+Taz83YwB/XN+JlBlJ88kMEbQ7S6b8zWlJNzzJN
	Fi/qAJf2WnG9f8h8CfMbG+9a/i2tF2N6qZ2O/LL0xV7BBILSFXrjqMQbcalrKZzYgg==
X-Received: by 2002:a05:6122:210a:b0:5ea:f399:7820 with SMTP id 71dfb90a1353d-5ec6883a5a5mr3708839e0c.10.1793609380288;
        Mon, 02 Nov 2026 00:49:40 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bf54casm9726255e0c.9.2026.11.02.00.49.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:49:39 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc0ccc2fddso668922137.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:49:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByg0UWksgg7cqj6G/QwdhBh/ZABW/5T4cxJOeEdcKmjMzZB+2StwdESHBOop8Ch1QP7c10DY0WX85xyLI4=@vger.kernel.org
X-Received: by 2002:a67:e10d:0:b0:7b2:b159:98c3 with SMTP id
 ada2fe7eead31-7d072640147mr3163529137.28.1793609379443; Mon, 02 Nov 2026
 00:49:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030230646.709687-1-artem122novak@gmail.com>
In-Reply-To: <20261030230646.709687-1-artem122novak@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 09:49:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUacwihjpfJiGY486PT=tu2-jrSQX+ZTGAqk-iaLUzffw@mail.gmail.com>
X-Gm-Features: AclHuK_7cktGh1g2g1V-jYGT89r8njgV4UvXrWAUVy37X6WOtxJHbkDtb7srpgY
Message-ID: <CAMuHMdUacwihjpfJiGY486PT=tu2-jrSQX+ZTGAqk-iaLUzffw@mail.gmail.com>
Subject: Re: [PATCH v2] sh: sh7305: add TMU0 clock support
To: Artem Novak <artem122novak@gmail.com>
Cc: glaubitz@physik.fu-berlin.de, dalias@libc.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-sh@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Sat, 31 Oct 2026 at 00:07, Artem Novak <artem122novak@gmail.com> wrote:
> Register the SH7305 master, peripheral, bus and CPU clocks using
> the SuperH clock framework. Add the TMU0 module clock gate using
> MSTPCR0 bit 15.
>
> Keeping SH7305 clock initialization independent of the legacy CPG
> initialization framework, which relies on arch_init_clk_ops().
> Disable SH_CLK_CPG_LEGACY for SH7305.

Thanks for your patch!

> update: SH7305 TMU device tree node will use the
> renesas,tmu-sh7305 compatible.

I don't think this correction should be part of this patch?

> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
>  arch/sh/Kconfig                        |  2 +-
>  arch/sh/boot/dts/sh7305.dtsi           |  2 +-
>  arch/sh/kernel/cpu/sh4a/clock-sh7305.c | 78 +++++++++++++++++++-------
>  3 files changed, 60 insertions(+), 22 deletions(-)
>
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 5ce7df11c3ec..315a1d6ee452 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -532,7 +532,7 @@ config SH_CLK_CPG
>         def_bool y
>
>  config SH_CLK_CPG_LEGACY
> -       depends on SH_CLK_CPG
> +       depends on SH_CLK_CPG && !CPU_SUBTYPE_SH7305

Why not add !CPU_SUBTYPE_SH7305 to the existing list below?

>         def_bool y if !CPU_SUBTYPE_SH7785 && !ARCH_SHMOBILE && \
>                       !CPU_SHX3 && !CPU_SUBTYPE_SH7757 && \
>                       !CPU_SUBTYPE_SH7734 && !CPU_SUBTYPE_SH7264 && \

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
