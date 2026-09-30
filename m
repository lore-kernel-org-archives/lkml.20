Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB954519A4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807655; cv=pass; b=bygWXovGdlK8ELruiIxifXoD+Cg11YACf04F/zQ/muR0vvLWUviCSAn0zG1SOyN0yhRt0TgscPMj4mdTeSHi8A7VwyIiUg39WrZa4PW0El8E/yOU6kAEqX4CijMkfFaOpRPJh7IhSzVhETX+DGdYg7kt/fdCDanbNPU1xhft4Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807655; c=relaxed/simple;
	bh=PIC7chzdq1cHhl4PkxeRxKhky/x9i9QT91XRVBcM9Z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFkjsepJVxUrKdiPCDgvzP1XZ5Fm56m6RFIbUyHlZ/MpRGASodLsUHy3Fz72dpuEklQplW0AbTqIvYvX+5mFdb4uuUCWY7IeG+My5VbNKR/7h+8aecuHwpgEy79ukc56D5nc4QFTRg2XtYPt+jW4m/lXRR9R8/rPEJKyP+ebV5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKAK+tep; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKAK+tep"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8ab46253999so26856147b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790807653; cv=none;
        d=google.com; s=arc-20260327;
        b=Qb1aSTsWqP6k7qMdCLSVwRo0kMWTUg0/lRDdRPy/UqB+yKYNz0xExFquI7DbFxmbo7
         TX31uFPPOSJvUC5fpN0lZbKha7V8tQlynDLx/tYh9ByKZ8v3EJF3WgCzp8p8YItuZVey
         iqVrVSyGrPhyGj23oITC+rnKb+3OO0Z5eqhw0xsjdn3uEfRQnIhj9p1NbmBISxZJRARk
         wzAf58tUw4cwSu1mKe0OBWZ8wBVRX5c9qwuGGtnRw8YagR9q9UmWfA6oPs/CxuoHtJP0
         fvG7609WyPR2S8OlAFSD108xMzmYwuSXalOgdT/pVhh+b5efiSnN00tl/Kkraaf6vbYr
         W7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oUkmfFRhu+PfGBj+HhIfsuAp+eP4DBxyfph1aN2q324=;
        fh=LghAoFo9FNiz9KuSD8+IXwHA3d3Hft7Nf6XxIcPX99A=;
        b=aJePJh/jRFwv9poYKAeTto6dBkKIi6jUJkHZb9T7okR8mKGZRIonFJZNHeDldZrhj+
         56zP7b5h/4Vd1Guc7hAChjP6Hftfn1PRq+QYvuzOLPVpXTGbLxMeZW1AUsVc/PaO6MQA
         URerYsntdN6ZsarFp0jm2AGmAQ93uFKLq2vN3QUVEPdbPdCsfnFnsH8FnC44YAxNJMHJ
         JUjQPiL22aU/x3wMU4gOoMW6Mij1Wv4zjC/HpU8C3Dpsa6diQ/weDS7u1xDQO4koQUcJ
         mnsREDVfsubHVrA+KYh+JhVcaRHXft3kIoDWC9HUl8RmEsJ6qlugD85oTWWaN0pJ9ZUp
         Prng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790807652; x=1791412452; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUkmfFRhu+PfGBj+HhIfsuAp+eP4DBxyfph1aN2q324=;
        b=AKAK+tepaK4rDsxS4ZKxhopV70hfrQR0aj//8qbnTlG6/IwLkcFsgxuNBEZ2jhGbwG
         uImfXkYdQ0kQAKkFeClFyDEyf2ZpC6gmMlphdnoMn7I60LZPxP2PO6io9C3a58eVD0rR
         JILQAZU7mluE+Rxu5sczN4pntBMFL+kC2hojp/IKoCt0mUHh/zWE9y6dRj5+oixhZhDc
         e3x0ciQCaw7clXbsziLkG9gNmwEmohMTIoy7gzAYxJb5y/CfraWetkaSYTLJTR6GvZoX
         ENJIUy4srswLAM7a/03DUe0LlhokbOLmP1KHJnoGfoeDD0qTbVI9qbXpeE/eU3VaZc/k
         XKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790807652; x=1791412452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oUkmfFRhu+PfGBj+HhIfsuAp+eP4DBxyfph1aN2q324=;
        b=QVYMINc3IlguAxpmYwMTbzR19FlRlonaNWYlmc1GgM9VZL2/lE+LW6s6oaYF88Fgs5
         iHSKbkyby4Jq3pRxpLAqTUKQVmbLIUftmajcD+7002XP0uNJ285qwKLbPSrCIuNZRMOf
         BQHgK8YE1to/gRu4zVKmj/TuXLesBBMFWhk7uoCw3HaAycB8CA8ws/fAj4Ge/bclb3XN
         VnySJ+SnXeBDLFs7UkuiSdmognpDmesEeGH9/tu8P6OvVhwX/KV+LZJKxB/6ebvSC+nc
         Dx7CO3oRrJq6YsWFeLzCTqQenuXj56tLE6Ge23yrEwsnPgN7uO104Fji4x4VFTBXO330
         7JGA==
X-Forwarded-Encrypted: i=1; AKwUvBwoDhJC9JQoXzkrEW9mzhv8ed1SkQ6vLM4eLCnj2+3o8NhUuSgRQJhj7MT6Tygxa+pZWOwCm4Jag68DRrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYL0IsN0rylbKzeYjQliGqMlByCNyUpWtYBXaKk3i/C1hPDcw9
	xI0ZL979GDrNYz1sKYuBW+J6wAjlJ8J/KfsufIBbK58iy+U2J+p6a3tXcf42Q5DkDBhh3SHdHyx
	omZX0CEmS1XMBm75LWbA7k2M2fQs3LG0=
X-Gm-Gg: AYBFou2e2XpscAqGGZQ5pbIDrfijRjBIGhWiXokP36pOALxVvYiwD5kqaO5d4o1IlYJ
	wmmQRHSa6hcnayqD0zRbiC6SLXGF/emFA0HWTHufS6uiIfCBrGKg/1fjTC3AcaQyUVoLiiLbVMW
	bHALmRo/+rsSozipDpyNnLLGRNCTZlczoU7h+/Ca65SqicPvOtqnhFDHr9RZBm1PNp3ENtJ1NSS
	gdTUB/w0TrzkDwg07LH43Jdoi0ORESo4/DMa1Ip0igH7viGN7YHDSpbZye78EA5MXMJT+5EiGM0
	20VL7ngvxB9pJj2YTIGp3E+4R5xNs+nREwN11rPSiuG8nXx6lUKnUmhn5T5ftgdme4wL+JXw/hi
	pqDboYhUi4vGiH2bQwC1aG+OSGdVZM575+Ns1DfDDSo5xQnteo/kuDPatlCbzyaCo7FKp7vQXxA
	==
X-Received: by 2002:a05:690c:4486:b0:8a8:86cc:f0d9 with SMTP id
 00721157ae682-8ac947b8c1amr15185617b3.66.1790807652652; Wed, 30 Sep 2026
 15:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930164704.1049735-1-max.zhen@amd.com>
In-Reply-To: <20260930164704.1049735-1-max.zhen@amd.com>
From: Eva Crystal <0xiviel@gmail.com>
Date: Thu, 1 Oct 2026 10:37:16 +1300
X-Gm-Features: AclHuK8jqvs2xKPcwrh1EjUjBtMkQLDOpjFfC1OF9RWzwzIg9hc1qWQAaXEwGyg
Message-ID: <CA+pz=kLERMEUwN5OQf7=aDDqkH93CHXHUuD+aA0tuYN2xCk3tQ@mail.gmail.com>
Subject: Re: [PATCH V1] accel/amdxdna: eliminate GFP_KERNEL allocation from
 mailbox send path
To: Max Zhen <max.zhen@amd.com>
Cc: ogabbay@kernel.org, quic_jhugo@quicinc.com, 
	dri-devel@lists.freedesktop.org, mario.limonciello@amd.com, 
	karol.wachowski@linux.intel.com, lizhi.hou@amd.com, 
	linux-kernel@vger.kernel.org, sonal.santan@amd.com, 
	Min Ma <mamin506@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Max,

> +#define MSG_BUF_SZ(chann)                                    \
> +     (mailbox_get_ringbuf_size(chann, CHAN_RES_X2I) +        \
> +      sizeof(struct mailbox_msg))

> +     mb_chann->msg_buf = kcalloc(n_msg, MSG_BUF_SZ(mb_chann), GFP_KERNEL);

rb_size comes from the firmware-provided channel info, and with this
change it now sizes a host allocation as well as the ring itself.
Nothing bounds it before the kcalloc(), so a bad or compromised
firmware value turns directly into an arbitrarily large kernel
allocation. Could rb_size be checked against the ring window it
describes before the pool is allocated?

> +     if (!mb_chann->msg_buf)
> +             return -ENOMEM;

This adds another failure path out of xdna_mailbox_start_channel()
before request_irq(). On failure the caller still holds the freed
channel pointer, which "accel/amdxdna: clear the mailbox channel
pointer when starting it fails" (Reviewed-by: Lizhi Hou) fixes, so the
two patches should be fine in either order.

Thanks,

Eva Crystal (0xiviel)
XSource Security
https://xsourcesec.com
