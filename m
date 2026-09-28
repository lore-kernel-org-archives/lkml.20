Received: from mail-vs2-f17.google.com (mail-vs2-f17.google.com [74.125.227.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128172236FA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600519; cv=none; b=s3wLAJ7MSfnooZcjzCIB4P0AZOz3fyDG7er9y1MS8AXIiDh5fZvs12dtXPUYiSCCaxpiazx++W5E4ocs6SJYrL482g9BB7eLPwJcF7p9zrCT/gkGjkkM4f4nUqAwbUn7jfh6RnfFP1TDkWmQK/iGQlpJf9tbLv5x2mfD/E4Il10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600519; c=relaxed/simple;
	bh=xuYApr2qWZXqJ7pnlIxx/vPxMRV2f9KFjGcz6WImdvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNgqCXQ9wa0NAsm0XIkAiQ/77IzA8uWXq3IbZ8HhkwNQ0yDadIE8PQyNo2bqXAsB1OFSluEfDAJM9JsphAwLX8/FVptFH1zmwW1idR7EWPikkDRKEhNtbzPjol0becHq4xaNLH/KlYM5Q/Cv/+as6cQptUBJ3S2X7UoHDjvxO8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f17.google.com with SMTP id 71dfb90a1353d-5cd13e9ec34so1143529e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600517; x=1791205317;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BaSNmHda6KzqKPwX7Da3e/YKu7hL/7ztMKV1umyjMjo=;
        b=ZWArf1n8WvMbbKYnV0hZELR8AQ6GxmKExIJBJ7njABmUmrNY05tj82oAaXpSuTfBVt
         darcxvGTBV/ZK3G53XwJeNvdxvuOqai6TK/asTtlWNUdnLYxMSJpiWghceBd6r94SkEj
         MoDT+YcSkF9tlcKfnX1aj0zoBXRjAqNeRczBn5dgxubpL/1VVfaDjIUTMPC7je720DAu
         2GZE4Fbt8hTNjZWK9HW27Nce24BBPE23/OFbeK60UEbMltmcUuVxannjpS57zBhDufEI
         X0Bk+GLOQHklPTVdjqfmrrTq1I2vt2PB+lzx8X2ORGIT34ak32KRiwFRWZotXAsa1wrt
         P/VQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOWCpjIJzjobzuy/6Dv9ZHbnw06ZEDprsseOC2ios0TQ70apxrnuhy4VfZZ/8sPjgRo100d++KPgHEfMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpcJJN5H6rUGNyaMMk3dDnz9rDNTRE19tegfqPZkeMA7sgXl6G
	Xe1HrTOXRLsAbzvS8+47zDM3LPJpHDICd9C29+UAWljMgFWWd71TsZNL77mviIHt
X-Gm-Gg: AYBFou3QRdyUfGnB1zaNo1G/8oK1oHTOJRMPUqfZbzoibtHNrnOk5ma3/GY5t/iVII/
	JVXCbiWSsQBUCpK9riyfHkP5zgxyRIqniOoj+wJROSLeWo81awFlkCviVWvWDLEzOHI3aqjnJMY
	dJCh196dj93+W6SD0ABXOsYg7A0p8eE+QUIKlp9uHXqrkKIoaR8r+BMrgA0ImyOHnzwDBk9z8lR
	fQ5XiGrq+dB77kUbvOyYeHOOf/p9D6iGsglPXnGZ1FA6w+i+gNP98/Is+K1VloCKZnEf+Dk0sqJ
	59uXLBzinWfDwQyx57KPBbEfC/Skpni8AMIimuK68REgQS2pK0wzC3Dvg+gxQvbauo+jPyiIT2L
	nBFwCHiA5CniPSFkmRSUy+XIV/qiL5oNk7QBChrae9MLjYo8l+bJKRGe0gbubRU/7MXB35Op3cm
	Wyal9UCkBe+K/IqBpmc9yPYJYIZTggQakQy/MpKR4RhNi2vYO8R1Ivte2bS/8WkmGL06/l7YrfV
	71jHwOVreyaW3tjc1CAId3HgOv7VJA95x6A
X-Received: by 2002:a05:6122:17a6:b0:5ce:c27d:f4e9 with SMTP id 71dfb90a1353d-5cec27e03b1mr1386137e0c.3.1790600516656;
        Mon, 28 Sep 2026 06:01:56 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b0b8e62sm6889539241.8.2026.09.28.06.01.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:01:53 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5ce08b5bd3dso287084e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:01:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfCtP1moz/J11UYKfjpH9myuAvsZl6Cht3l44atCGOVVBkuZbaLp1rj85TkscoG7vS11eD8wOosburSZE=@vger.kernel.org
X-Received: by 2002:a05:6122:1da7:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5cb090282e5mr5364701e0c.5.1790600512952; Mon, 28 Sep 2026
 06:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903205153.283553-1-marek.vasut+renesas@mailbox.org> <20260903205153.283553-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260903205153.283553-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:01:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdALBm4qBpobaSN-O99Sqzf373tyMVOix252E7Mqjt6Q@mail.gmail.com>
X-Gm-Features: AclHuK8yjcBPkmYx_9D-prY3k3lNAhlUTr3iLBx-i-uhHIvrir2OFt7Ni-g4t9c
Message-ID: <CAMuHMdUdALBm4qBpobaSN-O99Sqzf373tyMVOix252E7Mqjt6Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a779g0: Add PCIe
 Application/Local register reset
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 22:52, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car V4H documentation R19UH0186EJ0140 Rev.1.40 , Aug. 7, 2026
> attachment R-CarV4H_UM_009_SRCRn_FSRCHKRAn_FSRCHKRBn_r1p40.xlsx rows 410
> and 411 describe PCIEC ch1/ch0 Application/Local register reset. Add the
> matching reset into both RC and EP DT nodes of both PCIe controllers.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
