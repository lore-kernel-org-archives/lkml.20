Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483810;
	b=YDc6WdtFb/vml+jHBVZHQ9zfAoC1tIP/Q+HdazhqnRNaLWyx0hUF79RjE0vZKwnDhCff
	 nhWh5ZHsJat5cbZXgpfAhW48Yfny1kgDWm1/3lvWWcoZGQHaqerCKANobL07GeBLMYNi9
	 bOcKJcG9EEjQV3Na0kpBLPsYeGLikXFjpr7AB6xQqwcJ7XOn5I1adNa+LCrsRKp1TtTPq
	 xIBRNR7LdD2uCON8SL7PMaCf43OjTamTofgkl18VxWzeIPkNsHibrzhl4MTTtWfn8q+RN
	 gjUNKaDosDO94kK54V1FrOAVNg2O8iRXenwljMQenHFPnNh8IbePtZHor3kUl8RaPxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483810;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=XtoIu8lT4HxFhQlGLc/Y+wRIrAeV43o+yENerewR5Dw=;
	b=WtF//1YWi3YGFbzlXng1wt4DH/e2/GP47oXknwpy6M0bMIxCycE65TKxAdb/+zzXRCE6
	 1UITe3FbNJoreMphO1qGqaEOwM4aqnsIsj2JL2kEjKTQsUYVH159gEXscBlbBiRWcDD90
	 cZ10jvmvCk9VRD9VZ6wOHEyZt7V0Dbns6kocK/jDITz4mg/5YmPhvdtrnQB5lfa7e0U3f
	 GzKIpysIHkyDXT6eYASQHf/bjOhyS7NgtftwFHrjf9ASrky2VwnePgBT+5B4p1NjecqKT
	 IFpHwxgcieJlqwwFl/GP4NTji2xh+A+DxuA2fyFy59HY3tj+XoIsq85lfxVhEF7/Vyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2AF606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E2AF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b8306b9f8so45570886d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483809; x=1793088609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XtoIu8lT4HxFhQlGLc/Y+wRIrAeV43o+yENerewR5Dw=;
        b=XTjW3fTDr15WtYuwITgZuBTMzcYHV99k2ZYnUxGt0+sRDFQxekfxZSO6c4gQu6fvkt
         ZxZEG8XCOpEyspL2Kdx1+gcKzFJuFtOEj1VE0C73jL9sQUlpO+VsT+TsP9UMu5Pevgsf
         07rF8UzEtZi8OBtOdPeh87eRjB9RFqaz1YimQrhU2FMIVxa/Ep9WbAnGI4TplkORluwA
         FeVW9ISs3Ouf5ntJUN4TYA0F6Kz01jkubJiA97QrY/9Nsngj3DABpPKFC3c/jTzIkfMe
         InRcTXn8MWmhhv1nmHpqCkOiQYQ+AiehUXNzmK4VoyjEI7v8FC9U/EYaPKnHmC8LD9so
         BN8g==
X-Forwarded-Encrypted: i=1; AKwUvByDGjW4LrbvPbIS7X0P7f+XfzGx/C8sQ2zpzvacb7ONI9tzZ4/2DcFKSFd3BzNrPq1G7vOIwAR+jSsQFqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo1EhHawu+bfuyPLMoaeIAoSUmV/uJgcvK5vBWnFUh1E/k+nNW
	eaeH9xZR0p76vikC8Kig+Ef0PSTKWOG3WDk/09CePyxOuS95nBLC8JRg34Y3UmGC/cw=
X-Gm-Gg: AYBFou2WxHbd7hBrAb9J/1nsgYkODlJPqOlFCuou2006tXUEj7ckrz7G8ywC9oFE5uu
	fW8pH3JfZMwAAd7vErFwDKkSwks/mIKtE0jP/QBCsYA6PdTPSYdr9/qf0ru2gZYewZyEjEk821/
	PHnmsJIcspqIQktxtbWSUPtAiGZ4gNnnlDb8uuSEyGLXFuAn8+D7TkXwG/wYSl4TFxglYnvThW4
	S+WkI08NuKwW2YfbAQiOmtsULzFq5svO/VW3yAw7U0MU2OQtQIGNgm3+XKvDE+CtkgucJq3IbTY
	lFYhj+hlaOYW7MBylNkJnmcsL7g6El180Zgb0LdpzVbhR+4Hsd9ySFzcjo7Ihn5xwdVW4rupq5B
	ZDTPGq6oArGQPzljPQyQXvjbZvaTV9GaBwLYZG774WR0GvSYqSeA3zpgsqvYd20nYMcj4tdDgCl
	XFvGAsRs6Vm+FhHmYbgLwaBnHNjvPIv2Dh6TQCds5rCBpcgYvM6o8OF55A8vs8FP1f02LDQO9BD
	BJXHJO4NrL/TaqER1HoldMCnaodLlYj5YEgE9AV3wSkWCg=
X-Received: by 2002:a05:6214:29c1:b0:91c:524:465d with SMTP id 6a1803df08f44-91c05244db1mr24965496d6.9.1792483809162;
        Tue, 20 Oct 2026 01:10:09 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c08b675fasm10651596d6.33.2026.10.20.01.10.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:10:08 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91b52ba422cso36409426d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:10:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxJmJQuX+MPE8jMJ1LK6Ro14aCIxvvAZdbkQwGx/dQu30kItxvefz/CIgxmxIsNQfa4BnmGyNQFNi4UI0k=@vger.kernel.org
X-Received: by 2002:a05:6102:419e:b0:7b3:4199:2dd7 with SMTP id
 ada2fe7eead31-7cc364a1700mr3331202137.0.1792483414556; Tue, 20 Oct 2026
 01:03:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-1-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 10:03:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=CEC8_Ta11oLmKWs9rkGsy20C_g9K+n9ej6qsNF6=zg@mail.gmail.com>
X-Gm-Features: AclHuK8DND9FbZy7IbKb735A7LxSnsy1udn9Z5wpI7Xg7SlqXYAKq5qlFx-pakA
Message-ID: <CAMuHMdW=CEC8_Ta11oLmKWs9rkGsy20C_g9K+n9ej6qsNF6=zg@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] PCI: rcar-gen4: Recover from link down and route
 Root Port interrupts
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

Thanks for your series!

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> Proposed merge plan
> -------------------
>
> With v5, this series seems to have almost converged, so I'd like to ask
> how maintainers would prefer to merge it. Any advice would be greatly
> appreciated. Here's what I have in mind:
>
> To Mani:
>
>   I'd expect patches 1-14 to go through the PCI tree.
>   One option would be a two-stage approach like:
>
>   1. Take patches 1/2/5/10 through controller/dwc ("PCI: dwc:" patches).
>   2. Once those patches are available in controller/dwc-rcar-gen4,
>      take the remaining patches 3/4/6-9/11-14 there
>      (the R-Car driver and binding patches).
>
> To Geert:
>
>   Once patch 4 is available in renesas-devel, I'd like to ask you to
>   take patches 15-17 together.

I don't think I have to wait that long, as there is no hard dependency?
As soon as the DT bindings (patch 4) are accepted in pci/next, I can
queue the DTS patches in renesas-devel?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
