Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472CB3E3DA7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790312451; cv=pass; b=Wacom5jduOBPUFN4RGkW9xaGyo2qdupKv7N1MuX6SdqDB1tmF7NxcIEZwG2lNBXKiA3r92vs+/eJZujLt9toLN+92AYWkN18eQMgZe7fCG/CjGoxaRr89gasVdJvd2kAJ4ZQLdUnQ9HKGLqpzj/5WdDQzYUWsIYc+asO8Tm//RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790312451; c=relaxed/simple;
	bh=n9aUztV7nibTo3d+DWhgc6O46VXgB8ine1jUf8ps2ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7iZ80qWd2r1ypib8cKSCbTna4M3LChab+peEhk1JYXC/MO5DWLnd48CLRKiLrps74TxRP0rMz0crEKIqrlk0FvEOObdF3VjxKrDcdyfV4nmyXxIZgV/1sVWmg7tK8S/z7r/XdPyUMyinJwhuWPgYIfJeEebx3RyzQC39/aDcJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUoCzTVD; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUoCzTVD"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a64e7f4892so724781fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790312448; cv=none;
        d=google.com; s=arc-20260327;
        b=BoASzQVC71Ij/mTgspSntzvTHyJ98gxhoNDWqPAovi/iheZPzq4WOJPfgiZibSHGoI
         QQF1Rio8mtCfFcXLx8X0/NCOJJ0ut13gr5eE+pDV8WWojNNzXi5NTt+y6xjq13PRQR/+
         uCXTF4XWuv/4uXjc2RAGIUs7le4/PveZ+o6djaVFN4bBP4l92JPSaV+zMmwchxqhygBH
         9IEIw11s7JGrCQdr9EsclU4ZsqADZQAwK9DfCboOJNdj/ZqQxKZLQ2srSyI1C3zvqqJQ
         PoumtAUfdHNbI7u5mvjKOntVpRoz8R7cR4zftQhXkf1RKaKAsZG9boJKbx8QdDH3HPRu
         qujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rm0EqLIUkFc/YQEYZghm/9aMXZ0pgY5F/cnsZASSdbc=;
        fh=NiXNtV2IL243iMA8Rz5Zo6vU2QzR9kozrM48vDYClXo=;
        b=JHf2AV76bfuilzG/Jurl9IdwGOzJrA7uSv6YGGtnvzRT6Enp+FPQgnP7aAfLk8nC11
         WJhCIxesWaAcf19h0N9PrPe1PkA4HO1JT/DRBplJGw0F+BKQkT5SkEePa8sNpgMxrA0e
         CxXOekq2ma466FXNJeXkNL/Be6Cvul5HTONbUbr3UoBDoHR0qrQ0vywQP0htVSNCfeWn
         dwOr4befFEvwQXQrQSvMK/c1s75fPV8AB6kTkoRq8YqAtlZ2O4vXR5UX+U0OnUirdNTP
         arg+nJhXFCGL8cVi6FXjAN0uDC+oghdlCs5STobeCpj3lDaiSKXs9rKzmcdEzZdg3OZ6
         mW0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790312448; x=1790917248; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rm0EqLIUkFc/YQEYZghm/9aMXZ0pgY5F/cnsZASSdbc=;
        b=TUoCzTVD50PP5/8F11YKNf7BsPN9TmouyAVSziUL0SYytQ1J8ayLdSmJrUCM6l9qkS
         QGxrcm2ba62Nq9PW5qjrP5JWaje81gu1PODDjMlwcc8DfW26JEauzInBtwkCktxx2HMO
         4DTj8NivbjI3qYiv+QbyM8rdQwVggc+SY+gVLEiTnJAanK32LqB2x8Q2hpPQuBctMOOW
         ftqYeWNoVcRUUyurUwikPQXMsT15NG5ViF04LdaHwukqcvipP7s/3gBmyYkRPoo0olvc
         RTHMx9CWb/LRCB/YipidEEXZogvZY163fOMTFEW5DLtjupQDLJBCCR5dIOnMHln1T4el
         JgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790312448; x=1790917248;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rm0EqLIUkFc/YQEYZghm/9aMXZ0pgY5F/cnsZASSdbc=;
        b=RACg2uYHi6qnmzmdhRHfePt0EpEOsbxQdEAk9a+KiAGp1CCR9W+iolMuU/qMcu+1Ot
         3oqlxd6d/PtFdMSw4uwubc5FzRaB1B2RfG17usyANZF7vUXrLf69vJ88IkiSoibVywsJ
         Aui423xGC0IC4dj79kfT2jyOU3gM2PJuoYE08bYwq8B3mOLUnH8fA//qSq2DdWkNbpyL
         zHcwE9M4joRkaT3si+okMzdAjRbbKq2v5MV+BlipzjGbh9KK73ipVnwM89cJ8+qlQG1N
         uGs448f3ugwRI+zN+Iysf2gAdl/E4ESGCtaHZJK83d6gPGwpQXavRxDQZj/gXJPFnfHu
         ouhg==
X-Forwarded-Encrypted: i=1; AKwUvBz+J4tfeN7wrmHJPxErrdaSh/SfWVCOMdAjZ5xpscSBSdy31z9bdhN9aI7GCDAaHZXnDIVXgPlogiQwmTk=@vger.kernel.org
X-Gm-Message-State: AFuF++kBae2nSHLmy/I9k/b0qPutMI8QIP8DcrDLwBbI7gF19jR8TaTq
	7cMrrUbV0p71QKfczxk4R2FQrFYZbeFHY4y7+rcxow5sCr5Eyj0K69t6Rx+gPHhCrfN9YoHuTPf
	3R4VIrWVP/w8ef5V88V7rgnY4uaIc70LifFR4piU=
X-Gm-Gg: AYBFou2169koW2gGkiJqb4ESPFNbHWucQh8QGkOtufDqiLt1BIzV0hI/m/OmThA+lPj
	K9s8nxqpuLrM+tOJy4AzRTKvay1Znnvoqno7N30taivYyHkpwaSmlySj/e/uD2GCJtor+OVXTQM
	WjpFKY8Qnti/6MUdKNU5WI1op/Yvmfq/RonzvQnRYmJnxoDSP5dVDId2CH9XHr2L+gAtrEXk6n+
	IcXYghoI72QWzT2JKDhsmdReV8+oZ591j3FGb+0XbN/4CDHT+rvPoqSCy/0gFHReOzF5jdh2Z8N
	j8UHcDMsiXIQbi1iGQGlHbjJBuZuzW1TfT2yKRdbyQqxkFs6VwDfvX88i9R0AKBbu+kqNtupX1V
	kzhy1ZQpg0apwfifHXQ==
X-Received: by 2002:a05:651c:1442:b0:3a5:d8c5:dec3 with SMTP id
 38308e7fff4ca-3a63bf30056mr9425791fa.4.1790312447882; Thu, 24 Sep 2026
 22:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923165447.619477-1-oss.patchbox@gmail.com>
 <20260923101026.000034ea@oss.qualcomm.com> <86jyoa4de3.wl-maz@kernel.org>
In-Reply-To: <86jyoa4de3.wl-maz@kernel.org>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Fri, 25 Sep 2026 01:00:34 -0400
X-Gm-Features: AclHuK_aa1lbVC07A0bMFtx-SCHDmF8FwruzF-cMfKgCuCV9kjuVsj4-WFomK0k
Message-ID: <CAGG=RgARi_wVpUBRuGS8UkEbXim1gVLx8Xuskocc5QYL6+68iQ@mail.gmail.com>
Subject: Re: [PATCH v1] irqchip/gic-v3-its: Drop ITS node reference on
 its_of_probe() errors
To: Marc Zyngier <maz@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sept 2026 at 16:12, Marc Zyngier <maz@kernel.org> wrote:
>
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index e9807af235373..91e08b5229b1c 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -5561,7 +5561,6 @@ static void its_node_destroy(struct its_node *its)
>
>  static int __init its_of_probe(struct device_node *node)
>  {
> -       struct device_node *np;
>         struct resource res;
>         int err;
>
> @@ -5571,7 +5570,7 @@ static int __init its_of_probe(struct device_node *node)
>          * reset, don't even try to go any further, as this could
>          * result in something even worse.
>          */
> -       for (np = of_find_matching_node(node, its_device_id); np;
> +       for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
>              np = of_find_matching_node(np, its_device_id)) {
>                 if (!of_device_is_available(np) ||
>                     !of_property_read_bool(np, "msi-controller") ||
> @@ -5583,7 +5582,7 @@ static int __init its_of_probe(struct device_node *node)
>                         return err;
>         }
>
> -       for (np = of_find_matching_node(node, its_device_id); np;
> +       for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
>              np = of_find_matching_node(np, its_device_id)) {
>                 struct its_node *its;

I appreciate your time reviewing this.
I'll send v2 based on your feedback.
