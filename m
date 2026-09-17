Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9F33612F3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632429; cv=none; b=ttvZcuw4gGUKPBHGxbF+EgsTB6Qgc2Cy6EkC5Cy9tfRu0vS+MZJCCH2N87UjIE/QOGvkfROi3E2icEFq41BroObdyGFlvaNShfWBAPeCPNo/dxYYXFdXDO/CRr2wARCP6L3wLdpYnLRM/naLr1jNEi8EgHrgm/ybhbNnOU93RmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632429; c=relaxed/simple;
	bh=qf4Z/Wab6W5GL4Sinbl+uCK7C7f+qmxZxKQBDuJWh9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7J/8LQ2Nn3YPetP7qhVNJ6Y/cTBQo4iTwNkSqYCoGJ+0PTqWfKh9XPW/w1+vZLVeWTL8NvgXRNDYZ4IR6D7ojgDnWaMCZF2SvWmuP8t5RQUCTe1vSDxlPqmnXmdyOyrle5InWdS4q6SA6kPgDJ0aCmvQrq1Jh0HTer65bvmzpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e52ff5dso377719e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632427; x=1790237227;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jrUfKqIAU8KdEdqG0jEkfz64jh4Vm1/h0EwrowMtP0c=;
        b=FJrw6SObRIPlB1TgHveS2jsgxRN5TlpXesda4r3Ix7cPhD2AS34FP56riZsSM5pu0l
         P/zKQWaa5Bo8Fc5sp84VnTyzzTKKEQFUTpfRLxew+9ZgRl1iAKksDi57XmKZBAwI/bEV
         7i4IP2t45R31inQAyrmlL1fts8tvZwg71sKm9c/4W26hJDlbrxFa59BhPnefEBo3MzV+
         bUL/iqkCo4Xf4Wlz81u4Nkb+X2rVB28ePJBwPQfKhvTO+DjD1pfizWI+Py6yEpp7anLm
         4ugPmyaVDgXyCUkDRubZZ2bu+vIRqKRGgJur/TnN4nqeQdOeKZVYptQpuflmdoBXJl0f
         YUpg==
X-Forwarded-Encrypted: i=1; AKwUvBwlnanVHv17MzwBbB+fkRwUOfyw6rtM/rj7eJV019aBp/jgJkg/83RG1eOMzmSu9BYp3E7NyFJ12H6I1jg=@vger.kernel.org
X-Gm-Message-State: AFuF++n0oOfKH+fqirFZRGnHcNufTgx6OfGgXe4mOMOt9BygZek4cZcr
	257dpw5MxvyXcPSL472qNzNI38Iu/RHi4BjeUR20UC3mDZE6GyraPpqeg/3ha4GzD9c=
X-Gm-Gg: AYBFou2pwjhVZPAWV8URQnqaG5yRaSth/kB3WE4fz0OsKod5PQYv1NHKXGeO54QnbYj
	qnOOxfeNY+I+SGyfbu6zRWn+zPlJat1EDD3Y2ER1GKO0OYC/HfmomWRWOq4+HiXu/01IqSHgBLv
	WW59m6m/O8ZBkoZ/S8aEPRBYD1E8HrgmqBqU9eTUI9P10Lni3q0jTxxP7jVxP3UJhooYfZ4Bqqy
	OaCAnBWfjRLbRnOcjI5nEXsS5vAPSxH3WdEp/tcrUbAfXwqYSm6mgIh/oV7XjDSappVq3X+gdrH
	XcxACA0gnYogZ3+amsaeFoaGpTwhfl7wfAw2RbFj0E0Wi4hge2J3+b23loj2CPEqEKg2F+IuAFT
	08w3+h4WVJuD0UsNMkzQy4L6Du9TDDw4WpqWbFnksL4D3zCyTwBDTH6P76en16/GO76zPiLw5nS
	054YtEplxveN1HMG6r1Djvl69O5chYzsAiGTEoAzENpxDwI9R6Skhj0d4Eh+auNmUNeK4pasGnb
	8BzJeTDBMwAoJDuMVfkU77rhVCp4aedSjTP
X-Received: by 2002:a05:6122:893:b0:5c9:983e:79e4 with SMTP id 71dfb90a1353d-5c99ad82876mr6293116e0c.7.1789632427394;
        Thu, 17 Sep 2026 01:07:07 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a53e6001sm1949647e0c.10.2026.09.17.01.07.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:07:07 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-785692e5907so338449137.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:07:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxtteDqwxENAaje4Y358cKL7ie+W2wnxLwqe8rL+HzwgDq8dEqF9QXUCqvVPXKOBxGIk2xktxgo04btebI=@vger.kernel.org
X-Received: by 2002:a05:6102:918:b0:7a1:f951:6653 with SMTP id
 ada2fe7eead31-7a1f9516b82mr1577084137.26.1789632426525; Thu, 17 Sep 2026
 01:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917035438.523010-1-marek.vasut+renesas@mailbox.org> <20260917035438.523010-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260917035438.523010-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 10:06:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKJYtZ=0r2rXbrsTcVyLmVs7m-jGbD2b7CgP_GRMeWdw@mail.gmail.com>
X-Gm-Features: AcwNN1XfAZfrsW2pvaRzJQf-phJcWcSDCPkogzibQkcINXJ4SIBpgbRww5eIOW0
Message-ID: <CAMuHMdUKJYtZ=0r2rXbrsTcVyLmVs7m-jGbD2b7CgP_GRMeWdw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 05:54, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> R-Car X5H (R8A78000) is the first member of the R-Car Gen5 family.
> Add support for R-Car X5H, which has slightly different GPIO block
> register layout compared to previous generations. Introduce offset
> remap table which performs 1:1 remap for R-Car Gen1..4 and a bit
> more complex remap for R-Car Gen5.
>
> The GPIO block register offsets on R-Car Gen5 changed and the change
> can be divided into five groups, registers which remained at the
> same offset, INDT register shifted by +0x10, OUTDTSEL register
> shifted by -0x34, INEN register shifted by -0x38 and the rest of
> the registers used by the driver shifted by +0x70 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Rewrite this into a table look up
> V3: - Use enum gpio_rcar_reg
>     - Drop the IOINTSEL initializer
>     - Drop REG_COUNT
>     - s/int offs/enum gpio_rcar_reg reg/
>     - Make offsetmap into two maps, and static const
>     - Use C99-style initializers
>     - Drop BUILD_BUG_ON
>     - Store a pointer to the offset map table to use in priv
> V4: Rebase on current next-20260916

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
