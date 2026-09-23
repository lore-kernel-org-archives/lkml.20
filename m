Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E3848822B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159420; cv=none; b=J9Zx7w5GNnNFKINgsSjNtnxaXzF8BLV30WSthDhypgFivbHxsmjc+Maon/9Zgf9rHFfHhV0U+DE8cE7bhWZO3N0TgL/uRweH6f6NN+DlBqruGE3inyUd/NyYpQ4AdWYSmbGQOR5ZsRNa983RvNLZJULYoCapH8NKfd4mZz8d6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159420; c=relaxed/simple;
	bh=4vSnFRyrnWw1NiPCPc0UvaiFDOqzvmfhZ4d+f3+l7pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8myx+4TG9EBEJj6vBXwQ7cy2obQ8PAZXi9c2NFW6hUPgs8Se4/Q98BySxbrmavr0T38sqBoj6PXZ2HbjfpHQq3TpxNAScNjYbhL+asqpGMdmgBKadIefa3IrBoLRCxr39GzOlmziufEaKe3XWgFajneVO9kQvmQmdfy26pB2/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c985f055b9so911125e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159404; x=1790764204;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4+0mGr2LVa/kdmweLtRn6u4eyOMGZ0oEuJRaGtsK3Ck=;
        b=drnfgIUkmr8LOmHfuejdyzpuomwGPJYpCMHse1kmrPYR9azzJxZSgPAsFH5ikq2e/e
         SyVVeKJ+EuWHZZn03Lsrv7YjIFcrYWPgxcAK0qb90G6XFQycwEJoIymyzOEwkUfUyw1O
         n5Hue/1oV4KKpHEvoz2n9gjC3eNsTUs2RI8ezOOOAUiJa6kCyyhNazgD9jHAL+pLTR5q
         BSBXxva+hg3HS6RwZ/2uNZaRpht/lOF7EN+vaJH68i/APnAt0fdpg4ySLUE2GRHMOUWn
         GwR9CI3ZCJeK8FpBdcB0Bg9qlR82c9jy790EVgf53Dwou4mcwiiaUpnlCMu5cIceqQNo
         BGYg==
X-Forwarded-Encrypted: i=1; AKwUvBzHf3pmfUQKipGfvIsrC1ssMipYChsXlJ0TXt9u3bnUf8m+SUBPd/vS/5qmmvX95AnGME2NZftCjJjeRfM=@vger.kernel.org
X-Gm-Message-State: AFuF++llqt6E4FAR5YYigRbZ/P9TYtS04DccDheiI7+JNPiuG85Vv4Nt
	EsDKu5zeypFVuVvlzXemqYwbHeqhwgs0C4PST4P9y1s64EF9xMTYWyR1YU1CF2PZX8k=
X-Gm-Gg: AYBFou2LSl5yyQ1bI18LDXP6mMg3zASaDugULsNaE7mZSoUCTJvyBXYj+V33LBRsVgq
	7xmtwoqhUTlR7RXwO3eIFowSojnMcWHPJoOAipaA+tiVxCj+5D6iEuIJKaCUT8KkENI64bA10aB
	y66BJ2Qrt9wZH1oPzu+ACu5qns8AzqNcQJXc5QUayvCA6We8JRyvf1uUfFfRCe1I/+3j7reaj7Z
	kHsGjMNNl38744WztzRiLbgea2xuzcgGGiyMzaVonFyfMjZkYwORkBnfyOGkJ+8MpwKwRH1Sto2
	Lg7ahDOwG0H4sWbzt1a2eMKe60XhLeHIjvVxBIHnsamOD36c3IpsxoPNjk+mzZHcEYPOskH2w75
	2q+Ja3k5Ruo5QkrEDRJYxwb/3jFY7sjVmPz+Z5rqvr9bSaKj6WjVRJ7gGUq3rNLA9EPNkIuTTB+
	pYcBiugD8HmPYiwkPSGzWOQZCtrWXm50sFVwZdsCewGOpZzyb45k6dMGZwTwfDIYgMvirSZOro9
	us/aBioL+9Qnn2y4cRGeClcmqn7QWgURB26KHv+UePhESk=
X-Received: by 2002:a05:6123:4046:b0:5c6:58e2:8a7 with SMTP id 71dfb90a1353d-5c9e3439832mr4834591e0c.4.1790159403872;
        Wed, 23 Sep 2026 03:30:03 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f324fd53sm1575793e0c.16.2026.09.23.03.30.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:30:03 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97cc700fcf5so1247697241.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:30:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOpVzDyElX28FObAz8tIvAlFbJMt02nH7BCYOEGJpk/pJC2NuVbfe5Mr+iNb8lK71ej+ypo5+ce6irogs=@vger.kernel.org
X-Received: by 2002:a05:6102:1446:10b0:7ab:7e3b:bfba with SMTP id
 ada2fe7eead31-7ab7e3bd9f5mr3203843137.14.1790159402747; Wed, 23 Sep 2026
 03:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-2-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-2-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 12:29:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVeWfoqLiJQXBbbha8LwQ=HSYnoXs92A11gjFDZ-f9eHQ@mail.gmail.com>
X-Gm-Features: AclHuK_YPTNd9n99xYnNvuCZvr7Q9bz_jkhp3XejRIht4VqBRuZcUWZrT97Imys
Message-ID: <CAMuHMdVeWfoqLiJQXBbbha8LwQ=HSYnoXs92A11gjFDZ-f9eHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: power: renesas,rcar-sysc: Document
 vendor-prefixed header paths
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Andi Shyti <andi.shyti@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Update the top-level description to also explicitly mention
> vendor-prefixed header paths and what the asterisk wildcard represents.
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
