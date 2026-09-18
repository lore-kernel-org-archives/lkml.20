Received: from mail-vs2-f9.google.com (mail-vs2-f9.google.com [74.125.227.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0B42D5436
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717613; cv=none; b=dhVDdtA4tnz8eEt2IORsy2srXpsEz3FgcLxBJNK/DcacFZzLwDfgHgsvXzdyc7lN4/0fTS1qcoUSdu2QxxCktZnwo8UxsmyjbbyFNbDU5bBWiorwl/GBEc8RJr8smAomFcu6ykLYG7V7Us+m+Y1EAKMIga1fblFKM4RMSjoc1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717613; c=relaxed/simple;
	bh=wTlung53wgG0U6uz6ynHrcjwVaYOb0YK4Nvyasm8+go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uN3uwGdW6QxN8bWPVD5YF8Q2NRObT94GYHFGEI7E0UqKpJWZmh0/tQ908KafApICHcL2Fdo20d3OUZbvrwSi4xNyWkp7K83jvmgz54Fa82N/Sw7TRW5XmLBI25Qf5UNaJiPhAYg9t+Lb5lGCTzpSG70Rlh+ppwcsm5bvR49hKIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f9.google.com with SMTP id ada2fe7eead31-790a0799373so87263137.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717607; x=1790322407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y+tYCkkvzZJmFoYOhTQyYw6fM+qA/usgZs/lU8fn+ao=;
        b=0l0uyi+9BR7PJ4l8c/qsSqOkQR0SAmuDt7aAEkMPnPQbIMte8PK1cJ1TXIj9ETK5iP
         nA2zVcoXVdLgMxFgp8PvvSbCr9TX5HQuvCj8/jbsSea7Q8ehb5nucn5GmXBIbzhwvVjk
         zqEgMSKc+K63J5e0sFYn22Ohu656qHryQc6tcukjwccP50Fyr1AJfCh+MYqMjpgOSD/u
         wmALEFypcuXnpw4mOxMUqnH3mL09Hu1hnr1BXxdb6ZZ4HDTm5JVWLkSXV/6uvgcBspQk
         TRYKUGegBn60bsDn3DSN1Vqb8Jt821+U/M2JRnYtdVGUV+3ZSCOKa+cd/Z9rh+TFWrGC
         0tNA==
X-Forwarded-Encrypted: i=1; AKwUvBzNWDH1TFxUdyRg/hCCe/erNB7o9gORJblPjcleRDNg3N3R28WYcM+MhmOjsF4dZmOJ5Mo/vFu410pog4E=@vger.kernel.org
X-Gm-Message-State: AFuF++lOcvPhJBz90U9a46Frm/nbfH2wA06Jk9+4tWB9tscSVdzYq+C2
	AgluAvB555Hzo/GYhUfVuoRGlCVHpktssQB/XNSvlXcHdfyYWpZkftDu4e0UTDEM8yk=
X-Gm-Gg: AYBFou0rxLg8lgA1Zgmer4sp1qMUBiEZR7DXsiog+eG3qnQ7faKzsNMcI3egFM56Aq7
	zZ0UMAuh88pe0zUx/8t4H1WdU0H7n/ZK0HxII6PX77C3BB9hTEESkiV5eExxOc5Z8FhIBI8XE7V
	QVvxSWYDLBLqyeWbVfLLg+A+/4/49DIhQBiFEC0YDYXEA6cQVePJ7lTjT5C4rU2fDw0HPzYlkod
	yj2wPNklhsYPWWIIqKLLoppV6vmyUT4wO5F849CcsQzvm/yqC0OI+srXJrZlbYy1pEtC5RFGDLc
	o/rQtHDCchOlSP8z1Wz2rNERV6Dcq6hhWP8I6mTEstTfZlBfFaNMffzB7AGcUbQFjCmhfjtwBDg
	3ukW6AI3LUZxgj8G5QZVprxPClCGrbSmbYzzrkqgSlGI6fvDsykrkI6qlOYzxH7OtkaEWogPYcu
	pH8xsYwnYzG1ZQSFINFQyPLj8fn9RCAszuNZ7N4KS8Y23ytHOyDs7n7UzEoYGMNDrQx3yfF3DyK
	UD+93AfbxDgJme+hloFkwOV5JzxsjVljzov
X-Received: by 2002:a05:6122:d14:b0:5c8:2dc9:f8d2 with SMTP id 71dfb90a1353d-5c9b872d199mr388471e0c.0.1789717606825;
        Fri, 18 Sep 2026 00:46:46 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9b84c80a8sm830311e0c.18.2026.09.18.00.46.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:46:46 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a7003f94fso107590137.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXNg//Gf4gMQ/n6U7LzsxAItqBrUD4s7O1rUYfhJju4hkeaH213fva6ibxllV/aKrjL+kZJOQqgN6BOZc=@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id
 ada2fe7eead31-7a55af2df71mr547985137.4.1789717606396; Fri, 18 Sep 2026
 00:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <1d5c56c80291e447208ac8777aaf90ad6f0a4f4d.1788338320.git.geert+renesas@glider.be>
 <20260917221647.GA4038349-robh@kernel.org>
In-Reply-To: <20260917221647.GA4038349-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 09:46:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCFY7-SEGLjhaO1uCDwsvogc0ocdqSz=1C_gsWX6T_tA@mail.gmail.com>
X-Gm-Features: AcwNN1XFZho-l6FTtqXfFYSmbjO5DpuymjytNtvp4sOSdCdr5EidSrnlACqjwyk
Message-ID: <CAMuHMdXCFY7-SEGLjhaO1uCDwsvogc0ocdqSz=1C_gsWX6T_tA@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] of: property: fw_devlink: Add support for renesas,scmi-firmware
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Fri, 18 Sept 2026 at 00:16, Rob Herring <robh@kernel.org> wrote:
> On Wed, Sep 02, 2026 at 01:29:20PM +0200, Geert Uytterhoeven wrote:
> > Let fw_devlink create device links between consumers and suppliers of
> > SCMI firmware on Renesas platforms, and enforce these dependencies.
> >
> > This prevents probing of drivers before the firmware they depend on
> > becomes available, thus avoiding unneeded probe deferrals.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - s/firmware/renesas,scmi-firmware/,

> > +++ b/drivers/of/property.c
> > @@ -1417,6 +1417,7 @@ DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
> >  DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
> >  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> >  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> > +DEFINE_SIMPLE_PROP(renesas_scmi_firmware, "renesas,scmi-firmware", NULL)
> >
> >  static struct device_node *parse_pinctrl_n(struct device_node *np,
> >                                          const char *prop_name, int index)
> > @@ -1574,6 +1575,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
> >       { .parse_prop = parse_regulators, },
> >       { .parse_prop = parse_gpio, },
> >       { .parse_prop = parse_gpios, },
> > +     { .parse_prop = parse_renesas_scmi_firmware, },
>
> This is going to be a catch-22, we can't have vendor specific properties
> here. If we need this, we need to come up with a distributed way to
> declare them. Linker section tricks is one way. Maybe something in the
> driver struct would work?

Quoting myself:
"I still think the vendor prefix should be dropped, or replaced by "arm".

> Can you just avoid a property altogether? Why can't you check for the
> presence of SCMI at runtime?

A system can have multiple SCMI providers, so
of_find_compatible_node(..., "arm,scmi") is not sufficient to find
the right one.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
