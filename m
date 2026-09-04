Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B504949E0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534992; cv=none; b=SOIZm/n6ZlCuIT8kGdNBdm5U9Zk+FQPHlba0djb0Gzzz9ZpiB7FaiUSnbF/8OgTD3jNSnZ8hmhBrQRcbJ9GcPRjyyKbaHEZcs7sH7llA4c5aEoTbRgkW/1PWUTrgRRFeHRubZt9vPhbVzila3qIOApv8RWHnmkEJOhH9D0i6gVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534992; c=relaxed/simple;
	bh=3zmx8Z2M3ZeRzOKqpOgR2P10M5x7/5/EKeh+dHIiZJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMBC14cJCeu3GAKYljemqWaXrSgyNJzmaCXlrweU5kPnxHLMk2Mk8J6qhZOToHu1jvaoj6hCOXgz+Bi1/ulsqaGxqvYbYdQ7kPl4XaM0BWCvJbrornlSmegx9Jw0tZR8e4L/+IjxUHnqL6SiQzAtlusxewGQ6qiCmXxpIZnwd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c7c25d9f6fso1068093e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534990; x=1789139790;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VtnOZM9WfbSwC1inxRe0geJOr1JfkMHDy+62es74nYc=;
        b=YS2hRFHdllQnTQBr5moNVdCF0sA6Qpo+8YIKsbvdnBETp4SenPbyT5CMThHQgnAAc3
         b9UObR7cJeGYKvQxGGYKd2bGlroxAg4cSZPq5fSjKKKWOw0lLGb1zGfixJHzGgL2TvCK
         8fWjpaP203CxXx3PFk+aICeMhOo2w4upY5isBvRhyp4/LsS1uULAaI0VG3Zi5WxgO68V
         0vsnxUlxCT4ZBnYlDQYswtHetZYsuuOwFYJ5qdLaWJNs054Qt3x+4z8zLVIv87pNvO1z
         siobdUblu2BfGifITJM4XfQFztWSzR7WuPPVNqxiyClgNvTh/NOPQYhzw+yfT4150Z/J
         yQCw==
X-Forwarded-Encrypted: i=1; AKwUvByGWCLufdZLQvrsc28fJsU5OoT7lEZZIQda2/qe5lIRoLvacYS6TOeXZySkWtfTuHmq8hi43rTldZSgNaA=@vger.kernel.org
X-Gm-Message-State: AFuF++l+f69LnufyA3Y/CoJiGIw/w/GT1BzLVcFpCujg1sXvSlNJA+N7
	iJu1ieogTyrCVxSg4qFRfaoxKbZkRhQ4LxEcylLMIAOFXI/yjkZbXXJmhGgt6iFy
X-Gm-Gg: AYBFou14CgJak3eAT7q2/ehLSRJUSevxklgK3IImFk3lRAU6bcosjXy6ObEOBAXCTwb
	wAIxmORKRbivY++83fhyksOaRMTqhNFpVYqmfZwjBQlEtUQZ1U7/gMYW3Ki6yc3mZfyQ84HZZi/
	4Vj0jN4M/6SBnuqg0AI2dVgyMgFRjKPDZKUK4CxMVWb+/HZVPWVYYrsjmorqab0CmApZal4qjxw
	Hl3BvxBNdFhHn12wZ8EhpMs9ssbp8YQvyPMeZWG7Xe57IhKTqfKO/l1gFJQH323b0MKFJOyDDaP
	gqyj2EDUGajO9/F4VTY5lRmPoNDB1Ojpm6f5lEoJtQHuO+YpUfjTQEppsjVCMWWmW6AhdzZzx67
	VfFXgOKzygT0YbwEuPF6oPGsWe1uM5wYcQj0XaCMWwQA6pK6aOU3F1zXL+xqCr2O8BH6tjsDpAV
	lPCt7ac1ryTKAS1PZowFs0/zQTAkkI1Sn7gUrinLTIA18MOPOP/Q7G9j4ZHZ+r0aG+3MYKux8pR
	A9KNy+7fnJln5a9YbO+opKKG8Mxxw==
X-Received: by 2002:a05:6122:c11c:b0:5c6:64ac:d6f3 with SMTP id 71dfb90a1353d-5c7ed612e57mr3033761e0c.3.1788534989814;
        Fri, 04 Sep 2026 08:16:29 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1f14asm1784759241.3.2026.09.04.08.16.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:16:29 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c7c25d9f6fso1068066e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:16:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxmQOA+6DcB/JA8J7FA50kYOjwIukYJXEsIpn/yPrm4BJ+CQ828slEeH/adHsXWxbBVe8VRVu6dqT+o3YA=@vger.kernel.org
X-Received: by 2002:a05:6122:e189:b0:5bb:eebe:7ffd with SMTP id
 71dfb90a1353d-5c7ed846723mr3533958e0c.8.1788534988918; Fri, 04 Sep 2026
 08:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-8-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-8-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:16:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6GACqU4VTEk0hUO2A74RDmO3twMhEvkFAp2xiP=PN8g@mail.gmail.com>
X-Gm-Features: AcwNN1XsJHROGLoqiw2JCifUELiKV7YahAKrRzR2A5vM8Z-pkJl7ddzQiPC7x18
Message-ID: <CAMuHMdX6GACqU4VTEk0hUO2A74RDmO3twMhEvkFAp2xiP=PN8g@mail.gmail.com>
Subject: Re: [PATCH 07/10] clk: renesas: Add support for RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC,
> including basic core clocks, and SCIF2 (serial console) and INTC-AP
> (GIC) module clocks. The RZ/G2M v3.0 CPG is similar to the RZ/G2M v1.3,
> however it lacks some modules such as the FCPCI.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
