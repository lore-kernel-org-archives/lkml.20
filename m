Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9997349CF3A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163718; cv=none; b=dIkNv+ixmsvfL09TDPTh6s6Kp2idBCzHI8dV7mijNzmgorYrDjy1YQUkHBlw+fPp3kdQKQiWsyQND/LzSMn8UyiTEkqw595ML0uYx01gW7XwejqEDpLfFt1TjwcpErpDRgcrOv/lE2hV2+aaS/XBzKnDZQLgxu+ViB4E7gp4fkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163718; c=relaxed/simple;
	bh=88RWzbn/+jTvfVn0/HFOlPVPnVyg9BLcXVLlqTv8hP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IywRbWZo7emnNucZiaGX/CE3ZloeqFZkPjQmul4ItZQmpRjiD+1ZQLb/o4OIQY98m27AFmKaK62RqMO6JvX5vYHmxOIEVtZA6YUUpF6cjwR7gpDu6YzkaR0kexvjbB3n80+BOcUCIC42nXwDMG9cja3Sx+aai6ONJu8w406yKWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c82bb05ddaso662370e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163708; x=1790768508;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zh2KYVrSMhdvS8iHXuKJD1cdXsjz7/TJAFEy3igYvuU=;
        b=UnyOY0ZL78DGEff/oDiTw4vVHqbwPG8S6n7mIhhftgso7GFC2nkZHZvrONoNLl+pTU
         v+gcz2ALtg8/+UlVVy53fF39/5qHwR5nRJfyN68eyw9m3hjEDlFcA9uPQk8FMCGsO4Jw
         TPctM7RZiJvac/D+nJ7IubJ1DZ5uLOHzVDUnzESqk+gwJ5K22C5TSJzxnKQr3aNfdA/G
         BqBtg1WFHnxbYTxgJEcE8MDZ1JJNN48DhjdxzW809k0XTguQKFuy51HCnDcY37gqMwOA
         m5GidvIifhVdyeo/2fXnbdHXQ2F75MXYWh/kM7dEXznMaK5RDy5HGGxOpos3jrU2PbKE
         jV6A==
X-Forwarded-Encrypted: i=1; AKwUvByFUHFiHPhMtDetr/VbCF8vzwvHgKgTOVnFkNcKgoOZhafjSlNpHt98eEZmj62x0ylMPCjzJdOmMmGjoLk=@vger.kernel.org
X-Gm-Message-State: AFuF++kx1a4K6W5wSsmG0tcOwB7D1Uioo2Dg5o3kbeZcWgkZQKbtdjcB
	YisCmLjOWHho7bZC8bJkrsHwW7Zzc85kkITD+T7BPhZgtJOdy3Y30uIwUv8ooXrhcpI=
X-Gm-Gg: AYBFou07wdb/f9hm7kgdrVZQnNFhBKy6bf+uPeDhfwvvtMUN3UjjZtBkk8W8qp7mqwO
	C6Mrt5Qzss8QA27aNwIbOfwOK47Hpg9tXUSR++cm2zjnmLT1z6KpLTv2FYMXPQnaktt202ixRKE
	tYDs23kafoODqkawtHXwG2+yVWISABOcDWjItAP+tycqvgesEn+mfCYbdwzRNjuBefGp/zzTOis
	cWaEPCE4rCENwIxFdTNnCYTo8yIH5vp1pdxH8VgmC7iDycXjB9Ww9YAAewoMgGWWfk7LiI2pUVg
	qnT82LQ/JfiMLmLaLo5HBh0VqfgF2IlTUGQ09NkBqMGFp4rU4o2u7ypBXUGgQxysLwTHQ85YZOL
	G6I0ewrGvhZkoCLTAFSy/mjqPAvK1wvyjjdsrP36P2uFRVcgQxhJ3daFR41jRNQ/j9VzHLdNmiV
	aylJKB/wgjs0BbGxVdGkH64rVjS+IyHAlWAaT6MH1HDsaLWY6+Kl7K64P1oXFWnaLAfgPS92VSO
	5MBvruhIAALIbGH8BdH71H6p8OGrNqff3ZRw5sGoqoNnaAo
X-Received: by 2002:a05:6123:2eb:b0:5c9:c60e:5cf8 with SMTP id 71dfb90a1353d-5c9f16c4fbemr3039961e0c.22.1790163707752;
        Wed, 23 Sep 2026 04:41:47 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0582b6bsm2866487e0c.18.2026.09.23.04.41.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:41:47 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9832c759198so398695241.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:41:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzOg5gVRR9rF4MLQzzGwjLbMXjhx0yWPPSj0hjmJXoVuWxTIpAI2V6fjOKyOrvmrhLaI+IyR+93o7aRg9M=@vger.kernel.org
X-Received: by 2002:a05:6102:4b04:b0:7a8:46fb:eb3e with SMTP id
 ada2fe7eead31-7ac1e45b0aamr2120265137.36.1790163707075; Wed, 23 Sep 2026
 04:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-5-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-5-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:41:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJxPOraiFRSUTJ_9J5Ft5TwpBVJhMHOUa2Vs9BywdvWg@mail.gmail.com>
X-Gm-Features: AclHuK8SjZ9c_4ckHlrUMygRuUW85Xhsufq5Fr9074LRPmosifEbxSZ8cLmLsxE
Message-ID: <CAMuHMdVJxPOraiFRSUTJ_9J5Ft5TwpBVJhMHOUa2Vs9BywdvWg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] soc: renesas: Enable SYSC driver for r8a774a3
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Select SYSC_R8A774A3 config option if ARCH_R8A774A3 is enabled
> so that System Controller driver is enabled on Renesas RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
