Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07F452BE2D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419700; cv=none; b=d3L46ZckZOgnZ/7SJZd3fucRoYNnODNgM+HlwTMk4TlV05mBSKRgM2qDo/PK556POsJK914K7ucacHpElO42zYFN99z7wNXSP7FNQFdA2mIlAvCnsdfcPO4mXBtgw5sh5o093zezsb5YwRgshvqpQRmmGwE5a9aNwK5feZzHGKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419700; c=relaxed/simple;
	bh=SNGLc1dRo+r2RFwuwPeYSacsXpa5s/1i0LqchSr1mA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WppQB5vZF0oGgwBt0mZWt3wDOGWI2z08BwYKk+sE8tsTxtQeoPzaV/+S50om+CbTgCKbHP0tcioQqDLNCI91IQQxb1gT9yMJKRTQYGyPOBxNW7xTuBhqfHJhqytBzmt0g9JkNr3DG0Y/sKXvw6oW/q3chX3+q12AsmWFrOLp97s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso2072074a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419697; x=1793024497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r5Un3tcFd0CWzR3WfawxmOsdbODnCsUjJ4VgKeoks+s=;
        b=fW9dO8JSlcj8WUjnbYQymaZKACl8Z+mDLeyEfP7OKGLhGEZzqHXCRMZvdmI2WvY9S8
         XpKtVDRX60WaeGtnwg/YsFrs9Oz7oGXZ3uAGHFRfu4jK51X+bp5IDjyj5YJ2Fj+fO0he
         CI23CzErhvuwevrq4liYa1oro0HiklI9iTd6m/EHXkLvJInhfsTg0Z305O+KvnpoGeNQ
         Wa4PvOENPjM7eehBIfszUbTx6zuW4VIDYloLOKi/7wjBXUGDzk0CqJ3paZ2Ne9aRicil
         4TptSSWfI7pPadf93W/HvnLGDHlZ4tcWuOyhoDIhcgXcLbVmFYqunEbLutkFdanSe2iu
         0aPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgM4jER1h6kns9XaA4sxisVJEsbb4uPIjJ7QA/8ruxyU+kEZ+QMcfCnnroWa6D6rxd4fwyfc9d4WgBMxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEUdUB6z/k6C8kjhB7iO8+qcKTMoHjIQGQ9ElHYtz3iTwCa3G5
	t9selDLRZRWyvFcgnIHAuNSExGPyqMHyR2Ky/DdWq1Jq+lTtEWXiJTAORFUiJ1Wt8sw=
X-Gm-Gg: AYBFou2kp1OseggYq6GrX40Lkxw4wE9c4N8l7FntDB5rZPjfqU8CalH7iEUWu7Smh8E
	kERfzF8F4FUBXUBMOEAzZi+3PSWibfDxu25aOOfmvWUV3yOeBbi9mCSGaRgNUM74NwjyCXObu8i
	jnnSQ2ZWeIjlXDuL8Y7N04Rmo/f4UpssJgLmvKgpRNSjDNc+htI6aY8tDYrejENGfoJTewKZ/xf
	VnXw6xv7k+ndtYD++AEKx/7wMxSgi2O/0vV36TUlmLRkz8WRxd47E6PWrKd/pQvCPkf9hqQunk/
	sWJ8casFwagC4n+4oDmXfa76oyWQmZ9IJG63lNUEjuRtnZ4pBnDR/5Y4Uic0Uy5bkHopdmLJ2Op
	oaez7FeOQsQVjXGC625FUKs6hpbFe9WAeM2CCkLWIL93o9PnedA8Ym9TQsZVuDox7oO6/CnmqAX
	sBlAs3SjbN7lu07GjkS3KGJ5ns5KuvjOOrg8icnkX5/OsnxVMb7RHBW6EtYUkZkd9u6/7V9VJUG
	Q2AfhRA1PSyWBslO4s7E97O4rjOftvB+AvN
X-Received: by 2002:a17:906:c114:b0:c34:d75b:dde9 with SMTP id a640c23a62f3a-c419e83aa22mr540142666b.26.1792419696873;
        Mon, 19 Oct 2026 07:21:36 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ca7f2sm384778866b.46.2026.10.19.07.21.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:21:35 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so2588802a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:21:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx41Ggsv250FitPJh0q44mxZkl/B14a8wmrNn0JTDcgC79P+5j4kdokFNM8sSQHJYVwwAFIdhKnRTP1OQM=@vger.kernel.org
X-Received: by 2002:a17:907:720b:b0:c3f:153a:8663 with SMTP id
 a640c23a62f3a-c419e63930cmr576763166b.23.1792419694998; Mon, 19 Oct 2026
 07:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com> <20261013-paul-v7-3-rc1-edac-v6-2-2f1d6f2f74db@bootlin.com>
In-Reply-To: <20261013-paul-v7-3-rc1-edac-v6-2-2f1d6f2f74db@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:21:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkhM3OtWnckc-ou69ZYFMfRT+DmU5AgUctJ0uY9w_GDw@mail.gmail.com>
X-Gm-Features: AclHuK-siV4JYKFbtDQyYh3ROQEzSATnv4TCER_6U2XNGxIXypq0WsoD3L-uWls
Message-ID: <CAMuHMdUkhM3OtWnckc-ou69ZYFMfRT+DmU5AgUctJ0uY9w_GDw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Tue, 13 Oct 2026 at 12:45, Paul Louvel <paul.louvel@bootlin.com> wrote:
> Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
> The memory controller supports ECC, software scrubbing, and SECDED.
>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Thanks for the update!

> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c

> +static const struct of_device_id cdns_ddr_ctrl_of_match[] = { { .compatible = "cdns,ddr-edac" },
> +                                                             {} };

Why this weird formatting?

> +MODULE_DEVICE_TABLE(of, cdns_ddr_ctrl_of_match);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
