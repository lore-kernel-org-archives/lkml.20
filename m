Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0029E37F31B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534608; cv=none; b=ARsJrO4zy356Adqr/iPCzxRJG49X8W88Ybm8WJrd9evBgW9W7Zf95t9fImScX4UpTa6UrbY5sGfE5N8Gggvox5E95ED3BcTiirqAv6w9BwCk0AgXoycL76tPouEKgo2/gyBc8Dd1aFkB3Y0crmhXOsFktKSGRsAL+SAhToe1KVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534608; c=relaxed/simple;
	bh=fzOREMKstNdN+mmlGhqGbzBVxrEgv8H1fmeOK6xcw88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+MHNWhQKTg6UN2wDsu7w42Uyv04rtWaopc5gyBavxRgraXWgiDkZDjzw4hFdZ6QiOZ/f9CsewDjjHfEo2qk0VrvEG2Y5ZMxX2Q7sKsl99uR4OhshsyoLfYZ1l4avUb7XnM8mTlFi73nZJGkyRaMQJawrT8sanYpC1QXsvufdE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90cc64570deso15927856d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534606; x=1789139406;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FwDxiYsshE/fUWnWj2Ruj2wFFXY+QnXdoCrsnnd25AU=;
        b=Xckz3tFqwN1zeU9Bka8A/9mkU0o6o5CCmbsgeuaP1Ol/YQX/5hOkdYYS5RG9e5PJAR
         qPU6QqiefoJA5vOAc59SsME151QVnQB8+rC/+YvSBL4TmvQqjgRsEgFQNZvwF9RPMKzW
         bU0jdHtzpzYHPIAhgiCj818smxhdDyQMRax/tiS4L0zA1IW6mBIBCSN/PIX0Pi3O+78u
         NN3yzl/n10q5SJi6Rx4efhHT2vtA2LkxvZkM3mGJ3yy5dov267Pp7FEIrcu5YDNsxLqE
         zwlXU2serujGCxTBnKqsw8XebCdulNQFmDkEl8PlhUJ8iRU1KHNiKKkqICpzENpWvSUV
         akYA==
X-Forwarded-Encrypted: i=1; AKwUvBxeW1tUh3t9qLHMB+FsAuN+DPHn/U40c6e3thBU4IF5YOY7rlkQ5nOMCkYAWtplzy2K7IM/N25QGh4RZmc=@vger.kernel.org
X-Gm-Message-State: AFuF++m29lnKbcDsZzw8yAhEmsoiUy0uSQEZ+0ViGsTmw0+NEXOs6Pfp
	3x+x3kMGnD17HF9Xz2N7MNBVm4EfE/SWBNEolaNuhyuAqxhJfR8yptGnLeSmFtKi
X-Gm-Gg: AYBFou1KErnTYu0PQmdYL89Y/D/38kF3jfDOHjDdQAv8wn3AGervp2omltCBzFo+H3w
	UqIbEpkeDcQyyCHQWPUUb06golC95dyjopDTWBy7zSErhczz7MlH50X2G3pShlu2MvrUe8zQk80
	fLLjke17rYlcKM+vv/GcqKaKy+m1Hl2DQSpcodqYVlE0XDw/z3CQrGCHrqi314fijZO3ti0Wdxw
	WFG6tVD3Khvvd80C/6AOkQhZw/+CUlwj7it2QqkGVOIpFxZCJgLpab/fkioIEHFkFK8ITK5qzm2
	rSLb1haUqIn59sbBYBHjRcIJXsjhB2k35vd6dsL7At4/CEMKSyF3yzdzQ6YQGkeYMqDvqPv8K3b
	312T3cxYts5d6owYWuow7bmhWeWRsfxIW/daIaRnMEBiY2u82rJ4DVMg8M43/YjvYSwHTMuq/FD
	7Wx1+249GE7mmlmcbaFsyXr4uHFukxoiAElBiJdWZqHAPbHjgV0jXj5azPq5K1bgLCJepNEKz8T
	4NpKgKXV6DinctREbBIgo+VDbTFiA==
X-Received: by 2002:a05:6214:3198:b0:90a:5779:d30a with SMTP id 6a1803df08f44-910401ceb90mr50149586d6.6.1788534605673;
        Fri, 04 Sep 2026 08:10:05 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406976a5sm22232166d6.39.2026.09.04.08.10.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:10:05 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-530616af937so3162881cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:10:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzw7Spjgn6QI1f55yIp4AeIdbJaVhi6oUwyelywbHDP6c9+xPjwxNRu4elIaKsfHS513LcYz4Lvk/RzGng=@vger.kernel.org
X-Received: by 2002:a67:ecd7:0:b0:78a:568a:616e with SMTP id
 ada2fe7eead31-78a568a7517mr457415137.5.1788534217450; Fri, 04 Sep 2026
 08:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-5-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-5-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:03:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1gcLybr06anojAeym-Y8ogRCavOOfJiiWeJRHrOePtg@mail.gmail.com>
X-Gm-Features: AcwNN1UeX_tHY_zGLACot_ynQRVuzMQ5hoKZFPwjcrfLfwgwmaAT5NZ4wqS9wQ0
Message-ID: <CAMuHMdW1gcLybr06anojAeym-Y8ogRCavOOfJiiWeJRHrOePtg@mail.gmail.com>
Subject: Re: [PATCH 04/10] soc: renesas: Enable SYSC driver for r8a774a3
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
> Select SYSC_R8A774A3 config option if ARCH_R8A774A3 is enabled
> so that System Controller driver is enabled on Renesas RZ/G2M v3.0 SoC.
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
