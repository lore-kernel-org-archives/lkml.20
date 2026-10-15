Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB732459CF
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090274; cv=pass; b=YZfGQe8S7edBFXBngHUl9gGGF2/3qEGUfRvuEsy11d3OzJqxBYt7qI0R+7SvFehBJ6Cvg6twB1YA6cpsIVDCElYPed3Eyj7P+SriRPUWkUMFgE3K0IYEXRklS6/islhQehqDDTXx3n/ncM8aas/ZRu6Zx2Vo/5r2uUK8LxY8I1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090274; c=relaxed/simple;
	bh=IEDYV/oMsNIIC9aAUGfWzyRuIca4944IDU5jBSjbiQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r56yCEIxit59aoZDREc6LMZzOppNx1LrREOfrLotXYYHqbybdi1DI6mYOWa1ya1BIf4EGBDMgmRrkCZ9qGt9L5QXhury2ploOrUXt2UG9aqiu4DPNUSJU0UnKBiuDFOuQAVM3vNMd6KrVELZUAUz+2eTMEW5ztqkG1UEZBqo/To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zxxm//uo; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zxxm//uo"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2901542a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792090272; cv=none;
        d=google.com; s=arc-20260327;
        b=EseERG9OEuTJ4TefldCcLDe1TWe7zBtjGiNHvzoHcIGQ+ihpzpG6LVJI1I4H9VSYnL
         /BrGPBzeDDXYJr9MzIYH8lGYRcsEesXPwLp8i5RqiAAPhYZTgxkvnlWchIjvdefsSzsc
         WPH7RIUGLGE0QIlhb+dHWH0taLS4XHWIashHj1/xrVPI72QFC8LaQfQ8ZPfXnj2Hjvh8
         ygq8caIrV2bis1DCNsQQjFr/lH6qbNsXujkOlSmBtA37HDbSfZ3QNzCO8GsTEQlyr1Aw
         b4dCansyuSBHhiGC2XXYrU3GG7wgl1AQaqEIFunv8n4xwx8pJNdqR7yD0ZqS4YbHfIGd
         Z40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/cnv9PXs+SLKwxhru2dM31XWKUG/qt9LV+qno25AKuI=;
        fh=6kurh9DpLQnOVLGDnrKB0vWDi7MQNxTUVrx+EjeycjU=;
        b=m831x+FVDlFWpd8s0W1lAdckH4BboD8Op20r2cqgzzhYi11Z9vsqQOU6WvIyEhHbp3
         KIrewXrWok5CJ0ZHH+n9X686FTuoyQ+mkuL38uiCxq5o5AQ7WFgV8hlnqVxiLsOv8jmD
         ETgwx561+k0MX4fMEuNOzh5VAdhrtVqFGP1Fj+mnsjLKgXqKHPHWpeb4hpDBisBKVaY5
         TF2EZ5PMv4+LEJ1EZmt0NZKgRrL17Wtfcp11SioUuadtJxdQ9yXsDOGOchTFe5j5B4Pd
         Avk9/nBoimNsAmXiD68e/2KldNB9lCZQ8/dU/O93eV+ZiFzf2Mn75JltVh4urMSmayZE
         TQ5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090272; x=1792695072; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cnv9PXs+SLKwxhru2dM31XWKUG/qt9LV+qno25AKuI=;
        b=Zxxm//uoKZNz+sqojZIA3Wwn8KU/ovZ6LebAYSWFAT0MLu9a3xjY7BsFlBuWJi2BmH
         mQ4vpWt12J69N3niOHwcqXqmu/6Pa/7xlX/l3aUAX2WGccRICrQNefl/LpRxqDTpGFB+
         YeIPxCclE2CkO8gDxPysQ4qMCKZadQ5kRYirgsNANnK7qU3n7zEmApRadIvnWHWnS/rJ
         D54yA4sdnzKRuUXoOXQnq+kgERSd3yfGEUJDo9vmAAHp7NYwjCWgSh9+iFea36kCMrzX
         kWW6lj3XEN34JOGhsCLobNX2g4vdsdTmPJGttVG+Vf7rEaa5iC1bQnM9gjW1zwhILndd
         gSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090272; x=1792695072;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/cnv9PXs+SLKwxhru2dM31XWKUG/qt9LV+qno25AKuI=;
        b=pPeSglR4vpQS8w/Y14yDPIq3eqjp8pjAk91Ym/+DaCHD6lt2XqSry5YvrlLarIeWR7
         8PjJFheLR5z6RU5lJkKRK6Mi6uSnzut45mmcv2lCmnpNGo3Yli/xHcab7v5rBLF4HuQh
         nLDHpcNC+RVi+dkQMmy1yaUIfK/j4BhZqfVeK8hBMOIM42y3quV1TR5C6uf2AUVF4GdJ
         ZhOCJn7M5aBzA398oOMo9kCEKoGay7ZlnRwU9g2FdXYQ78aKx/5Wx4JgtCR91NZO3Byn
         2BSe3vzSZM3qgtXCpie/zpVT3ewbtdZQJueRrYMBBOVYz/N6uAygA4UI01v6e2jrdsEE
         uS0A==
X-Forwarded-Encrypted: i=1; AKwUvBxqZ0WQci79xiD8z5bLe/vi9E0uYZrBW7XwUNsghMo/Bi5FGJ98SaMc51X7Ry4QMOXjZcKd4SrhfT9+Kd0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbhIpfb3nTfjdya3IgejayC5jSYPP5fFcArLgDkXC4T6fWNvqy
	sZArFetGkeUApLs3XcjDSTotGlJQfYlgwLF1/GNo5pq7CSj7r5xiMN4fdr5+srKypxQcvcyLsmZ
	Z5PUO8uIK9oUikuKxlJNnn+MPg4Ta+X0=
X-Gm-Gg: AYBFou3I03FMWRn0LGHpjwpap6XJvuZELRUJOklhbiIbNoXKT9VMlQa+YNPAugY+paJ
	ok3zHTp82qZpxLvNlONUK/5MxwdRZONYaEBdnni8K1x1jECl9rKMB+9E6sIf2AShLKZtNg6KZOe
	CfG/0/epPTmDM32+cBmI83g9cf91Ofeon78ekms96MZnk/LCJmTGOtnIjiPvbRlRSXtKMjY4cAj
	YOhGvpn6tj4irqIalJ15xjI/+Yx8t3WGCfTEiV94bGfJaiHWF6TLpMZ5cMWttBbdSY/rMimDpAI
	uFoZABvhIAePppJR3CDKpMZbhssBFO56GtqiuUYYHnepgY9vjxNd73wwmw6JMJRQ6CYlKH6eLIE
	cYSqxnfioC2155iAxbtPD7m9/SQyR1f5nqT6E+A==
X-Received: by 2002:a17:90b:2e4e:b0:39e:59a0:46b5 with SMTP id
 98e67ed59e1d1-3ab3ac9c833mr15854338a91.24.1792090271582; Thu, 15 Oct 2026
 11:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013220421.1588051-1-bhelgaas@google.com> <0dcfb2db-5536-465a-bee1-afe160535748@broadcom.com>
In-Reply-To: <0dcfb2db-5536-465a-bee1-afe160535748@broadcom.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Thu, 15 Oct 2026 21:51:00 +0300
X-Gm-Features: AclHuK_BV3ETbypQUjfcwsZGOp4gpBmrzYDmoAzMDYlah33XznaIYLJzxw5l43g
Message-ID: <CAAsRjR=_Q7aT6+NGAszYx=FkFMYWtp0HVe1KJwLwHEVhR0ghSw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] PCI: iproc-bcma: Use EROM instead of devicetree
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>, Rani Hod <rani.hod@gmail.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"

> Humm, this is not materially different for me before/after applying tihs
> patch and unfortunately but here is what I am getting with these two
> patches applied on top of Linus' master at
> 0fcb05b72344f40806cbe810de8872f1698bf053:
[...]
> Unhandled fault: external abort on non-linefetch (0x1008) at 0xc896df40
[...]
> r3 : c896df40  r2 : 0000ffff  r1 : 00000f40  r0 : c1ce1a00
[...]
>   pci_host_probe from iproc_pcie_setup+0x8a0/0xd94
>   iproc_pcie_setup from iproc_pltfm_pcie_probe+0x10c/0x1d4

The series only changes the pcie-iproc-bcma path, and this kernel probes
the controller with pcie-iproc-platform, so the patches do not run here.

I think the abort is the read of APB_ERR_EN at offset 0xf40 (r1). I
measured the same on an RT-N18U (core revision 0x01) in September: the
platform-only kernel does not come up, and with this one line it boots
and enumerates the BCM4360 [1]:

--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -1388,7 +1388,7 @@
         break;
     case IPROC_PCIE_PAXB:
         regs = iproc_pcie_reg_paxb;
-        pcie->has_apb_err_disable = true;
+        pcie->has_apb_err_disable = false;
         if (pcie->need_ob_cfg) {
             pcie->ob_map = paxb_ob_map;
             pcie->ob.nr_windows = ARRAY_SIZE(paxb_ob_map);

[1] https://lore.kernel.org/all/CAAsRjRnV-RTddO6h2XCUz2N5pB0pS8i_-_2XRcD=WOTA7AAFZQ@mail.gmail.com/

Best regards,
Semih
