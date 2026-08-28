Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7957A32692C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787878507; cv=none; b=jquYEmoOnjAAdcxkPQX6jvAimM+7AILIoiz9L9R8NTd7MZvW7OWTDOl601bD5aVgrywe46XV3I/vMrBT5yPTFESYzWsNMatwSGaNpdN8a1uhNX9zTHvCsDvSXPlpqU4n0xiGMMcy50GxONRcvfKkPe+N3UOaUUPxYph478u+dGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787878507; c=relaxed/simple;
	bh=2E0lKP6wx5lNJZK9UHYmgZgGNv7M7Ppr7TT2yk8dZ9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXWH2F0J1+7tXKeLN3YG48JipTErhzowAIZDypoEDi1/DUcd/P3lpG/QC1Dx3j7WF29Wdww4qkmxKOE6PKLJJlYPHLeipPxo+AFD6kI/5fEN4IRaBT3G6+soWu0YTZKsi6jEm8avDM6ibTKM2+T4hdhs04BMIQ0t0bzxnA1WRnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XojdBnS3; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XojdBnS3"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so276459a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787878505; x=1788483305;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5EA4rjGRcsfT36C5hz4iP7GIuQrzL3ujh+keys5adGQ=;
        b=c6C8TW+h9UmeZEQDHs99GABdqY4kh4MmTsdrP7ZURyUcU0PCnarqcqSBNkBHQvCZ9e
         SzjpmCnn1uA3mgwX0hvEePp59H9DTTwV9CuHhlcA7OB0FHDfR541Qg6El98N8ou5rOxQ
         uHY7gzVBtiLhIxAalKBatksqUD4sQhhRkdEhCCEMBYZPwU0ty+4qISJwIBsz/eJwfL3Y
         NLsIJFLFvU0Hfr8c3Mo0VXrbnXShTt636l5T3NcC2Q4UHvMHnJ5HQY5nwJUHragYBuor
         e17WAohnWBidpRYaDO5NEeHj5LZPcTt9Leh6geQxJPHvv0wiVkTyfiHlgpKjNR02+l8D
         UJRg==
X-Forwarded-Encrypted: i=1; AHgh+RrEeo9Ts3P7bnHQ9O1UqurSiMWCwmuqHTvrYh5lqCpLmkVErbz74+emQcH2pDuRmwjTbEsbF9F+iHvrG50=@vger.kernel.org
X-Gm-Message-State: AFuF++kodOajEhQAvAD/CpUoZMTfndAip1fwIgs1ahT3qThASlMKPs25
	Ka0BG3bpDtXpD5gU6vqCSH8RC2Z0cFmuhgmHbzyTBPSn7T/VRA/K8Pobg/8f8ranj5SR84F+QyB
	OKqoZ1gs+73HdDBRpG32qmyiw8AK09eCCSAO25WbK27yOPZxYcX4aEPbmbM2SHn4/xFDpXygr1G
	zJzxTo1XoXmlajNqPDZEoOIJXCe1o2P2NV7HoMMUpJK3aq4ICk05/lBbOKXP1Tbku7H/mVH90Jg
	4kGtAIoju/9d4U3uXAH0Mfg
X-Gm-Gg: AR+sD128FzJra/dMwHAIEvCXlYdwZyLYmyBVm9bfLh5D7K4vWwIJGvfy2UnX0IHBgz8
	t72nA5U6iUvgd3rw1vFby+Ggfkosc+cc5x5VaY1o2z3IvigG29HNGk+zUO5UbGRidMdsMAlzdlH
	T8j5zzwGi4tqzAQGyz+bFxWSrcpcdMPE6R4yMqWtcWdTF+PADCHisMOD5Gcw4TK4RWtQiB28nvI
	fJhHudFyomuKp8uvbDfZg/qEguKdQ1FFeXMVBQ5VAUEvet96fWwjFLNF+3GzJzw8zyePUWC1wJc
	lZcPAygDhrgmPJlPiFWQp1mU/v7+dptoaVueAoSg6siT1W3IgxHkT0dA6sCIpmdR6biAQI1Ow+Z
	z39iaxaDfmO9anFkWm690pJ6vwkBvHl/z08wcBCGjxABQ2aKgUTHDjCqJAxxi36AQYvaboq/sUX
	TZjbSVjAQkJ0QH+k/tbddgFzeu3J6H+ZWHMsloAw==
X-Received: by 2002:a17:90b:5405:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-396d0de4c19mr6187992a91.6.1787878504507;
        Thu, 27 Aug 2026 17:55:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-396dda838cesm72452a91.5.2026.08.27.17.55.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2026 17:55:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c25501f4aa2so41015266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787878502; x=1788483302; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5EA4rjGRcsfT36C5hz4iP7GIuQrzL3ujh+keys5adGQ=;
        b=XojdBnS3hfz4PH0vHNYGujQKJEM3+41b4bLckxUkZZhXrVyJxb5z8iYwzJ3z4mDl4I
         O/KRG05ES+l9onkhhEKPSZA+uZI6s/+rQZbWd9HbOyBlqrpllAADdS1BRLWl4KgrbJIC
         v68oe2K9F8hrdAYKqCjgao1EvN11OjmvKqgGM=
X-Forwarded-Encrypted: i=1; AHgh+RrNWzG7cKoXi9X8e3PrQ1IxyuxVLW/CqExWZN2i6Nr8ZDhpUOcMwvjq297DVgy8uPmRRAsXWb9PVjy7F2c=@vger.kernel.org
X-Received: by 2002:a17:907:1c94:b0:c08:580e:899a with SMTP id a640c23a62f3a-c2553d1daf7mr168029266b.10.1787878502436;
        Thu, 27 Aug 2026 17:55:02 -0700 (PDT)
X-Received: by 2002:a17:907:1c94:b0:c08:580e:899a with SMTP id
 a640c23a62f3a-c2553d1daf7mr168027266b.10.1787878501945; Thu, 27 Aug 2026
 17:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
 <20260826201500.3000125-2-danesh.petigara@broadcom.com> <067b7e2e-f2b2-4462-96f1-3a1e35bd25e8@kernel.org>
 <682b68a0-03b7-4ec9-9d17-698fe134b57a@broadcom.com> <e21a7302-44db-4e20-805b-5c1de1f59c56@kernel.org>
In-Reply-To: <e21a7302-44db-4e20-805b-5c1de1f59c56@kernel.org>
From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 27 Aug 2026 17:54:50 -0700
X-Gm-Features: AcwNN1XmLO_Rvc2p8Ux2izW5uUHsteD0CqZs8Iz7q39NcNd-WXmBavD0M7y7m7Y
Message-ID: <CAGt4E5u9MLNku3ROaCD-HJALkLgL=RmOg1zuF1QmcsE_ss=YwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] memory: brcmstb_dpfe: Fix out-of-bounds access due to
 DCPU offset
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Danesh Petigara <danesh.petigara@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Justin Chen <justin.chen@broadcom.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Thu, 27 Aug 2026 at 14:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/08/2026 19:37, Florian Fainelli wrote:
> > On 8/26/26 23:48, Krzysztof Kozlowski wrote:
> >> On 26/08/2026 22:14, Danesh Petigara wrote:
> >>> From: Justin Chen <justin.chen@broadcom.com>
> >>>
> >>> On API v1/v2 boards, the DCPU coprocessor can steer kernel readl_relaxed()
> >>> and writel_relaxed() to any address within 256 MB of the ioremapped DPFE
> >>> dmem or regs base. The DCPU firmware provides a 28-bit offset which the
> >>> driver adds to the ioremap base without any bounds checking in
> >>> get_msg_ptr().
> >>>
> >>> This allows a compromised DCPU firmware to trick the host kernel into
> >>> reading or writing arbitrary memory-mapped I/O registers in vmalloc
> >>> space. When combined with a root-writable sysfs file like dpfe_refresh,
> >>> it provides an arbitrary MMIO write primitive. Similarly, world-readable
> >>> sysfs files can be used to leak other devices' register contents.
> >>
> >> If someone can compromise firmware to provide different addresses, then
> >> what stops this person to change DTB with completely different MMIO
> >> ranges for this device?
> >
> > On our platforms the DTB is part of the boot loader which is
> > signed+encrypted and customers do not build any UART driver or
> > user-interface so changing the DTB is somewhat difficult. Same goes with
> > the Linux kernel, it's also signed+encrypted. This is defense in depth
> > at this point.
>
> Ack
>
> >
> >>
> >> Isn't better just to drop root-writeable sysfs interfaces, since they
> >> are the insecure parts?
> >
> > Yes that would probably be an acceptable move forward. Markus do you
> > remember what was the use case for the dpfe_refresh file to be R/W?
>
> That's in this case separate solution, worth anyway investigating.

As I recall, there was a reason the refresh rate was changeable. Note,
however, that this is only available for the older version of the
communication API. This hasn't been used in a while. So, unless you
are on an older architecture chip, there will be no "refresh"
attribute at all (because it'll be using the v3 sysfs attributes).

I'll dig some more through documentation and old email threads to find
the concrete explanation behind the "refresh" attribute.

> >>> Fix this by recording the resource_size() of the dmem and regs ioremaps
> >>> at probe time, and rejecting any offset that, along with the largest
> >>> field accessed (DRAM_VENDOR_ERROR + sizeof(u32)), exceeds the recorded
> >>> mapping size.
> >>>
> >>> Fixes: fee5f1ef6cf7 ("memory: brcmstb: dpfe: support new way of passing data from the DCPU")
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> >>> Assisted-by: Gemini:gemini-3.1-pro-preview cursor
> >>> Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>
> >>> ---
> >>>   drivers/memory/brcmstb_dpfe.c | 22 ++++++++++++++++++++--
> >>>   1 file changed, 20 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/memory/brcmstb_dpfe.c b/drivers/memory/brcmstb_dpfe.c
> >>> index 08d9e05b1b33..66343205f585 100644
> >>> --- a/drivers/memory/brcmstb_dpfe.c
> >>> +++ b/drivers/memory/brcmstb_dpfe.c
> >>> @@ -182,6 +182,8 @@ struct brcmstb_dpfe_priv {
> >>>     void __iomem *regs;
> >>>     void __iomem *dmem;
> >>>     void __iomem *imem;
> >>> +   resource_size_t regs_size;
> >>> +   resource_size_t dmem_size;
> >>>     struct device *dev;
> >>>     const struct dpfe_api *dpfe_api;
> >>>     struct mutex lock;
> >>> @@ -401,9 +403,14 @@ static void __iomem *get_msg_ptr(struct brcmstb_dpfe_priv *priv, u32 response,
> >>>      */
> >>>     switch (msg_type) {
> >>>     case 1:
> >>> +           if (DCPU_MSG_RAM_START + offset + DRAM_VENDOR_ERROR +
> >>> +               sizeof(u32) > priv->regs_size)
> >>> +                   goto bad_offset;
> >>>             ptr = priv->regs + DCPU_MSG_RAM_START + offset;
> >>>             break;
> >>>     case 0:
> >>> +           if (offset + DRAM_VENDOR_ERROR + sizeof(u32) > priv->dmem_size)
> >>> +                   goto bad_offset;
> >>>             ptr = priv->dmem + offset;
> >>>             break;
> >>>     default:
> >>> @@ -415,6 +422,12 @@ static void __iomem *get_msg_ptr(struct brcmstb_dpfe_priv *priv, u32 response,
> >>>     }
> >>>
> >>>     return ptr;
> >>> +
> >>> +bad_offset:
> >>> +   dev_err(priv->dev, "DCPU returned out-of-range offset %#x\n", offset);
> >>> +   if (buf && size)
> >>> +           *size = sprintf(buf, "ERROR: DCPU offset out of range\n");
> >>> +   return NULL;
> >>>   }
> >>>
> >>>   static void __finalize_command(struct brcmstb_dpfe_priv *priv)
> >>> @@ -858,6 +871,7 @@ static int brcmstb_dpfe_probe(struct platform_device *pdev)
> >>>   {
> >>>     struct device *dev = &pdev->dev;
> >>>     struct brcmstb_dpfe_priv *priv;
> >>> +   struct resource *res;
> >>>     int ret;
> >>>
> >>>     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >>> @@ -869,17 +883,21 @@ static int brcmstb_dpfe_probe(struct platform_device *pdev)
> >>>     mutex_init(&priv->lock);
> >>>     platform_set_drvdata(pdev, priv);
> >>>
> >>> -   priv->regs = devm_platform_ioremap_resource_byname(pdev, "dpfe-cpu");
> >>> +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dpfe-cpu");
> >>
> >> You cannot use devm_platform_get_and_ioremap_resource()? Are the 'reg'
> >> entries flexible/random?
> >
> > IIRC the names and indexes are stable so we could do a positional index
> > resource lookup, but maybe what we want is to introduce a
> > devm_platform_get_and_ioremap_resource_by_name()?
>
> If the bindings enforces strict order, that could be a way, but I do not
> want to push towards new
> devm_platform_get_and_ioremap_resource_by_name() because that could lead
> to long patchset with bikeshedding about how many wrappers we need...
>
> Approach is fine then. New wrapper can be brought on top.
>
> Best regards,
> Krzysztof
