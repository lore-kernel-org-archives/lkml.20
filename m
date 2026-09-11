Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB3536A033
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139865; cv=pass; b=kgWiCOax0QyE10xOOnBT8hc/4nIyomV3hfrLBNgNoqcl6+/ip3rxuRAKiuOf0Vfsf19+AmtE8gqQEayaBnCggyiDeTOXbq0sZWBtArJqUKh4r9+X8dbxIct+WtyjWABKfZZ5wFXJf3o8nH/RNQVAuLb3mB+duVeavhk2OzQGElc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139865; c=relaxed/simple;
	bh=qKzGefYJg3Ze6BfCB+nFJHTLMgAtUc8Iojo0PlBGvk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLcn6GzA695ClTvuJVisogNg+kJKln4rP6j3X0cnl1//XzXjcYq0BN35B2n5thWU5gW5lcns9QyZDDOCOW9Q8VqEc0yeCNH3syO9oUGqWhcutEadI6v5G1pc0kQ/RRAPoeMPgwQNIpiGW0Gza+C4xtRt/o5mC0ItxtTunZqd9Fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oDEmzEXy; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oDEmzEXy"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so511466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789139862; cv=none;
        d=google.com; s=arc-20260327;
        b=ffE8P4jw+N/DnhHyaZ8DB6Rkj9WtGmrI3veBLn6rTdkaBZB9RU9BwYo9K8YD32dmc6
         fl1oRzq+dK6VfQBKXlvmJwhsqk3pcC7fh8EP6BBGnjgaY/vG9R7fygremdCoFULwYnmi
         MqL/JGzRo4IMNGzGVgKE4jXdBUNE+RKZPxijbJmVqj+z3Z4B2v5qzjBd5tQQ6b+X0v55
         wiOZivbCXypAhraghzI5v1HQT/ZgJ5Gi4i/A6iObjimfYYGzv3otAZKdAG6wYLT2G7GG
         LBJED+1KOsRnEuGYVCnNE+PpD5gLlFrpoNOTKkOBeQepOTIqgN1jjI9YWLs31rqZ44rH
         VWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qKzGefYJg3Ze6BfCB+nFJHTLMgAtUc8Iojo0PlBGvk0=;
        fh=R/AxZKzO003oEH1Pl61JxjjmeGYQ9mSvlGU05lyDa4c=;
        b=DNiVRoWaRM+WmeMl1jB4OID+9tN4SYfQA//+xsjJY64wivJpZBHqo9t5X9ZqQPgTn6
         1wdGsxY7NfVKLxQi9D+TkDvcqtCZUDcIXrdj2pI3FduUutTdsNiq2gGogwLOe7WdJ8Ok
         +3e+V+DOp56CadqqdfV5YCyWEgtld6ppqysSHz+V5/OKoSqzTh01M4XEMp0QlZQVq+ap
         j+ARMin6XcEG1BHcjQUBTKLCdWGXySrSqLjIP6L8PlevnVXFTjqOkOBZSv+VnNBf5I1f
         dPdcLs2ODK4N4a/R/u9Yt7GKXSoyVFeYRiMwxm57d1TN7rNas4zwY9vVIIZA4UTPf9Ju
         DIOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789139862; x=1789744662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKzGefYJg3Ze6BfCB+nFJHTLMgAtUc8Iojo0PlBGvk0=;
        b=oDEmzEXyS09nBZgfuEhTYwLCGJWLa2oQsKQWYALC/qULfqch9osMrjgYjJ7KnMJC85
         zXPxieTGQnuz5rEJoThiIROBoGAXaQRz/St/FYuAukf0mGDd75rrXIqcszy8ADiMpPt3
         05Db3ooUThz0XThH/JGGshdMd1TMFkBL2bplU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139862; x=1789744662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKzGefYJg3Ze6BfCB+nFJHTLMgAtUc8Iojo0PlBGvk0=;
        b=PYhamyqBcgSwSoeL4UbKOt8N4FuGqUyA+HcygNCnkZJYmAdnaKgQktOn/suK0ziqUS
         yT1KMwGS4E8lhQLsyV+YJFau/lkcLdGFttd76T7Gbux3oZviJfADmvniSw99b6RukoJc
         pYbCrijjcKRMn4bihTTZZgyimEzSXpg7Go6jdlHxsix6U7xMHLAEZ5mWdsXVpHE4xhDz
         uHc/oOU6paT58j4zKe/JjKNYOI2iKode4wLrRa/KK4kC0NeKKSXRtpojXfN0BMaSwx7I
         aM9MqvPwjxouIRpP3QesTpvXWh90lx9QGOofyb6wrxToJD8pwTeq1CZFp0UX8Btv5m9o
         m9Ig==
X-Gm-Message-State: AFuF++m8pyGln85mipzrwra5U/sESEcVl2PeUPnayneKAhnX1t+giXv7
	SBYJvNZHOq73P5ypabZbuBd2W1GX9fEDZxJeFVpPpfQoI1buBMNg3szxKDodYh8KR9DC+5wl0ZZ
	VunZoWtbbNR89voTz4+nC6X0P84F66CI0xcMaY0Fo
X-Gm-Gg: AYBFou2x7cvf31Fw4L7sm49d1uybbwasCzcsQmZEfhXdCZrIbzWZIE1MPHtes+RS02b
	ZpwGBAYAvrxfIfzev5qHc0FvjL6xJk80K0eLzf1OyvqAfGZgOGeCUcycIMfjdh8rqPEah51fplg
	njO6K2ufK7lRupMWEQtrkHO4EU/eg7GBihksfrMTPscMcvwjHZuPmBdFw149a3092ZagBD82XZA
	CmMFQ68g4xD704Q/TeMmQvABaI3yfGYIT50UUxrJBuSuuwGNr+mtkKrlaqla3GvWICno7w/hBzM
	DSw+GY4U2owmFrsIDzZhdUC75g2aeRxsFtgbH1uGaarSEblJ4H9uJz2q
X-Received: by 2002:a17:907:9410:b0:c25:cbec:22cc with SMTP id
 a640c23a62f3a-c29665406bdmr399644566b.5.1789139861734; Fri, 11 Sep 2026
 08:17:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910090512.1197517-1-jaszczyk@chromium.org> <875x0cymr5.ffs@fw13>
In-Reply-To: <875x0cymr5.ffs@fw13>
From: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Date: Fri, 11 Sep 2026 17:17:29 +0200
X-Gm-Features: AcwNN1Wmpi9ArJPZMIyoqNY3g39YmYfPU8IArOv7x_0UkC7aT7EyEWppHhelNd8
Message-ID: <CAGptq8F7MgYt94QuCFF0hRGDAw851sK_xByBJc_cnUpYAF2yMQ@mail.gmail.com>
Subject: Re: [PATCH] x86/apic: Switch to x2apic driver early if x2apic is enabled
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, dmaluka@chromium.org, vineethrp@chromium.org, 
	chuanxiao.dong@intel.com, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, Melody Wang <huibo.wang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 2:51=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Thu, Sep 10 2026 at 09:04, Grzegorz Jaszczyk wrote:
> > To prevent this, check if x2apic is enabled in hardware during early AP=
IC
> > call setup in apic_setup_apic_calls() and switch the default APIC drive=
r
> > from apic_physflat to apic_x2apic_phys immediately. This ensures that a=
ny
> > early EOI writes use safe MSR-based accesses. The driver can still be
> > upgraded later during the normal APIC probe phase.
>
> That's really the wrong place. Initializing those calls has absolutely
> nothing to do with the driver probing.
>
> There is quite some historical ballast in this whole APIC driver
> probing, which I never came around to clean up.
>
> I'll have a look how this can be done sanely without replicating half of
> the existing code just to paper over the real issue.
>

Ok, understood. Thank you. Let me know when you have something to look
at or test.

Thanks,
Grzegorz
