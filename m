Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3E33CAA3F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062883; cv=pass; b=DrD+VRDX4468yKYTSc/nDGjUxN20VZk8boRKkeNUgiuKnP8Xt7ubOtb4q/R6jSQsnsVktH+ljLlrfJbiZOFdqN/KVV4IR7D2jx5l93WKHvlpqTruKa1B13NvKF3pGFLer27UOM3fBq+1d0n3ygWjIrTZVWvJ0QXBP9YLHFq+0O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062883; c=relaxed/simple;
	bh=8dO5H5NH2RszZryttcomG76BD17kGA9isNzAWX9CjXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhnduBS6zGc8VzQERWNOTADSswoqTmdMgmIrq0Jw3yKjfZcSJuCMzeY625jFGTJDWRmHB6vHWUgb1Xqlmnmzk9IFFJMjiVt6fWCKuzIVF6KloWucbbCS+wMUDpox6Cs4hp7PQNWD9o3Y3WslbtyUzCPCzCj5oaI1c3d43+QV67A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8hiim9z; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8hiim9z"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e50968489so3554421d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790062881; cv=none;
        d=google.com; s=arc-20260327;
        b=s++9lYpTzLeV9R6/Xz6oBiu8EoYXjMP6HBDKd/FZG9sln7FO5vuu5YIJlCdqDvH8Dh
         iRDf9twXaLWXpxWfQVygvyUdHn+bIVfnjfPUAdMbJfakK5r6/cDpBZieqyn7C5PC8C30
         cw+c3idQjFiAUTPNurJJxUgyLqUp0tZS4rA0qt3poLZYqpddCqnLkhpu/D86NY1vy6S7
         sLo6AhN2GsD8Xhw0moOaBYrlBFYF3wbwHycaC3jgpV4ONnc4EodWbGkff7FD7oWLvQ5E
         peoo9a1tff0HGfpEbbtzSCmDV46AMUZpiuuFoJ8SnRfCDbZEHX2WGm5VweozV/ULTW90
         re/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=io8UjoxhH2lPg3HQUAyI0U/34+pkdRwtw5UyaKVMvYA=;
        fh=z7Uymw9Wg/TRTg3I904mqH9/Jp//YUETR/JZ+AP64vE=;
        b=g4cfYfME2txrnRK/HlyMuxJHon1s87koaUFtFLN+6HNpnq+NxEsA/A2pIUnJJxp2GH
         s0Dl370qg6dOiXDpyu0kQyM12R0N3h2aGc7ppJ1m/XR6D6gXQ0ReP+6OZ5l5E/xFwWoA
         hDC/TFII6KxES6+wEiDMCNdU/DXGqX1An3uREzguGl/wmcGCz19hFKtUtkzvjQ0i10Le
         h7pwHBbSZh3Npug7KqnFBM9N1tE2vMbINa7Ohy1vsdJ6fZ0ePwiDjki/RDzfDDVDjvb5
         aeCo1o1W9UyGlxVmSx9PeUwCWljf68N2ZUyQzB5xhffk4BqTMqpdCjrwkdOfkl1+JOGt
         XDSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790062881; x=1790667681; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=io8UjoxhH2lPg3HQUAyI0U/34+pkdRwtw5UyaKVMvYA=;
        b=S8hiim9zmeIQ/4AZ5jWWarKAVusTDFtb+fpzXuvoYezS6czOhrnxhjnB6abMz5TZrA
         kHa4F+xLAjINy+kW3J9OysC+49rKPyR7ovGXMpQF+61JZjxbDjiODB4O/PcT8HtU+QYM
         br+pIa/g3lJaNPruAVocrtxr9churnOXKnEAjNSBPPXlK4khPIwV2FkuH8llqZDFQXKJ
         TmwMR5awpDz5CMYIarx0+ePNvSFpXEbFR4LbbHMHmZyJAAoJtc0v55nyCIoZZQx0qBRE
         IYqXJr2FHStQQywC3hmA5lKqOXQ13EUTImKzbitTMk4tzrGxESspGViaNHY7vYnxkFjO
         MW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790062881; x=1790667681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=io8UjoxhH2lPg3HQUAyI0U/34+pkdRwtw5UyaKVMvYA=;
        b=m4o4LwlKtK27xE5k7URKJ4ux5xiqr+I1yfPTtSvqncUU8GEfuul04jUGGuek2NzIke
         +XE8SwalXiLntL/Q3sRYFmVZYJUK9PLeWvl34GcT3OHwZzQH+PWNDtJC/8RwytgwswU1
         286DxL3pWCCW3e1VJ+5zaYd5GgxCBH6mgRrKt/tLghBhGM3P1fhDf5hJ2YjKMO0ZcjBp
         6MuVeWAHC7Ocpr8fu3xi0W9WiXjyy00J0kaJBuomTl/uNQZUcG3al4IxV15j7Y4X4RzI
         5+Tt47OLxWQu8ObVH1A4oFxKAVS3MveFVVl+6jwpppUJi4Ew04a/4n/cu7ulEosNrijj
         5rWg==
X-Forwarded-Encrypted: i=1; AKwUvBzKRlGWm/y++y82Y3lFYJkWC2l4c3DOfpa6TAOl7DRaSZDeZNDuvslEN1xW8zSLXUk3fBryveHhARljOe0=@vger.kernel.org
X-Gm-Message-State: AFuF++m+0om5YFDS3Ymt4nxHveDo96uPN18baJfrA7I0seaB1fwVS7J4
	aTbH9mRXpsIXyB+cnObWzpCVf4MmgnuwNtkgu+vwwup08DD9Sjt9ANrkiMaCz7qSsnniR0jmGs5
	DEWVZO1UbFmENo9KDCXABGIXCvn6cSpU=
X-Gm-Gg: AYBFou215wF2RSmm+YcVvk7vjh5rIhi36OAU37iBAe9XPUOE/mwI1rPIPbBhCdX/S4G
	kLWPFtFsSMnURcPZOinlRtPqYRUUaLymurSuO3lq6boBfvz6ToP7f7vLBAW5tIaT6Q7zIsnzZg2
	AgfQXBaEmcEQVhi6FrSAXrXdHJCrs/SLoMmiSWAx+/IRGnKOHnFEAJXe5PULRMm4oGk38VHKSYe
	B4ainx4ShvdZ4Y+iZI7zPUXvnKLt1MsxLiK6shqDEHIxMVrm3vitEvlbkDuI+KMOv7hnW5Q8gue
	IYe3LeB9VSPisNsTbbUYPgKcFli/xw8oysDbBIRj61s1qJu8/GCFqCIleQ==
X-Received: by 2002:a05:690e:1913:b0:66d:2cd9:91d with SMTP id
 956f58d0204a3-6717fd6bd3amr4742587d50.50.1790062880773; Tue, 22 Sep 2026
 00:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918031323.3376849-1-lgs201920130244@gmail.com> <aqzqvfbeh653jUce@ashevche-desk.local>
In-Reply-To: <aqzqvfbeh653jUce@ashevche-desk.local>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 15:41:07 +0800
X-Gm-Features: AcwNN1VuZPbV3cKT7eLyi5Ad-zawrqaD9RbQUP_M-BL5VAYRTq9TxG7WFCvCE54
Message-ID: <CANUHTR9ipEFUGteK4TTpnpN0yUmxjop1v783aOhyq6AE9cwO0A@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: gpc: remove all initialized power domains
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wentao Liang <vulab@iscas.ac.cn>, 
	Miaoqian Lin <linmq006@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

  Hi Andy,

 Thanks for the review.

On Fri, 18 Sept 2026 at 15:39, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 18, 2026 at 11:13:22AM +0800, Guangshuo Li wrote:
> > imx_gpc_old_dt_init() initializes all power domains described by
> > of_id_data->num_domains. Its probe failure path removes all of these
> > domains, but imx_gpc_remove() only removes the PU and ARM domains.
> >
> > On SoCs with more than two domains, such as i.MX6SL and i.MX6SX, the
> > additional DISPLAY and PCI generic power domains can remain registered
> > after the GPC driver is removed.
> >
> > Remove all initialized power domains in reverse order. Keep releasing
> > the PU clocks immediately after the PU domain has been successfully
> > removed.
> >
> > This issue was found by manual code inspection.
>
> ...
>
> >  static void imx_gpc_remove(struct platform_device *pdev)
> >  {
> > +     const struct imx_gpc_dt_data *of_id_data =
> > +             device_get_match_data(&pdev->dev);
>
> No...
>
> >       struct device_node *pgc_node;
> > -     int ret;
> > +     int i, ret;
>
> ...and no.
>
> The result of the device_get_match_data() better to be checked, in some cases
> it might lead to NULL dereference.
>
> It's better to split semantically different variables, also naming 'i' is not
> good, num_domains is better. Besides that, why is it signed?
>
> ...
>
> > +             for (i = of_id_data->num_domains - 1; i >= 0; i--) {
>
> What you are doing here can be written in a shorter form
>
>                 num_domains = of_id_data->num_domains;
>                 while (num_domains--) {
>
> > +                     ret = pm_genpd_remove(&imx_gpc_domains[i].base);
> > +                     if (ret) {
> > +                             dev_err(&pdev->dev,
> > +                                     "Failed to remove %s power domain (%pe)\n",
> > +                                     imx_gpc_domains[i].base.name,
> > +                                     ERR_PTR(ret));
> > +                             return;
> > +                     }
> >
> > +                     if (i == GPC_PGC_DOMAIN_PU)
> > +                             imx_pgc_put_clocks(&imx_gpc_domains[i]);
> >               }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
How about this:

 static void imx_gpc_remove(struct platform_device *pdev)
 {
+       const struct imx_gpc_dt_data *of_id_data;
        struct device_node *pgc_node;
-       int ret;
+       unsigned int num_domains;
+       int ret;

        pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");

        ...

        if (!pgc_node) {
                of_genpd_del_provider(pdev->dev.of_node);

-               ret = pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_PU].base);
-               if (ret) {
-                       dev_err(&pdev->dev, "Failed to remove PU power
domain (%pe)\n",
-                               ERR_PTR(ret));
-                       return;
-               }
-               imx_pgc_put_clocks(&imx_gpc_domains[GPC_PGC_DOMAIN_PU]);
+               of_id_data = device_get_match_data(&pdev->dev);
+               if (!of_id_data)
+                       return;

-               ret =
pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_ARM].base);
-               if (ret) {
-                       dev_err(&pdev->dev, "Failed to remove ARM
power domain (%pe)\n",
-                               ERR_PTR(ret));
-                       return;
+               num_domains = of_id_data->num_domains;
+               while (num_domains--) {
+                       ret =
pm_genpd_remove(&imx_gpc_domains[num_domains].base);
+                       if (ret) {
+                               dev_err(&pdev->dev,
+                                       "Failed to remove %s power
domain (%pe)\n",
+                                       imx_gpc_domains[num_domains].base.name,
+                                       ERR_PTR(ret));
+                               return;
+                       }
+
+                       if (num_domains == GPC_PGC_DOMAIN_PU)
+
imx_pgc_put_clocks(&imx_gpc_domains[num_domains]);
                }
        }

Does this look OK to you? If so, I'll send a v2.

Thanks,
Guangshuo
