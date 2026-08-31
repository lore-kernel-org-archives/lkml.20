Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB1254763
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788137951; cv=pass; b=nYBmvMKymKM+xUVNPNO6+9EjbUAB9gD+/h98uhzhfONCBnArDD2O7czouOtMX5Fg80vhZsJP1CfWycS0bHrYw2T3/qU+7/rJm5636viqLt0EzgtkWSuIzzEKXEYjzJO6w1/EFPZSCk8XwVzzfkZrkVooz9Jy8CTodvj4wfMRwq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788137951; c=relaxed/simple;
	bh=K0NPiNRI+HC21r68OCJOYQCoR80z81MkxKVzw6oWvgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9cQpZrhX6jfEckVeFvYAGopBKq6Eb7zlNp6hzYKhsa8khDFw33dl2pq9sM8U7pF9AGjywTewbpfJI/j3BkdA09IWx6LXfbhvoE7I4iDmq7wt3VL9Pft9koqdXd6nWmW048aMR30T4+Wjj22ODPAJiGma95iqNCaovvr9PCoxBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2020421077so436399366b.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788137948; cv=none;
        d=google.com; s=arc-20260327;
        b=PYY5xicYsqwDLyZZi0fcN3Z2uJc3h3G9Gs6IVivYtBpBasiiA2qhoO7qZoUg/wfs7+
         uL97LaOxviQ52OZR3GuP3Lr4eo3tq06VwAKMHfixwX3LtGQuZHJIfjCHTWZ/eHA38Te/
         4+XRPdCTUv51Ode+H2kPGblwm94wtGA+eqKeD2N72HKQhN1uZfVxSIF8ILgVLDdsPpGc
         obNC/nWa7mS/DP6yqxZDSkW6bXxgS2D8xeB7yD8GIDkGQ2n85Lc4xJk2k5SX8BUbcaF4
         OK2h7RSCsvRQpa5agwtAtIBDwDa+1ZJCLtkhcOpbruFoKbHEEKZhwUcIq0kmHVlE+hx/
         AOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=K0NPiNRI+HC21r68OCJOYQCoR80z81MkxKVzw6oWvgc=;
        fh=BA0IU+Er21urS4AxdnJl2kVMSjQM/sPRvDfdWUFDBck=;
        b=NzmkxsMD7YWVWM9I8i8J3YVi9X0HmqOXKGHZnQ4v3NdaLQ6en7GVYDdYOQfYRhdPNp
         lkYnWrmOoTFohG6Z5QdZxQ/a3tsLbHCuG32ZwOFaoHUlNeBqsEmqFcr4qBublWXfL5il
         U1oqCdGmT2rdxgQAUL0RYx0XZM4ZMGeJVFJzXqVn+Dw38YlEX6HeHAY1P07+EH3k7QXV
         My9M9ijWJWLBskC6PVoAEojB9xB6fLgjbUfu1iqY1kvKuY9pdtxhJ5MFP7we+UTabbq3
         JYMgKxfjnUv4O4hayy0ZUTbX6gdDM1awUCuLHK1UDFkHKD07k0bvnMInRKUw6VpfE3lr
         PWrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788137948; x=1788742748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0NPiNRI+HC21r68OCJOYQCoR80z81MkxKVzw6oWvgc=;
        b=MFXOOHe0TSZqwfIZxJfCXxdcszihN3I/PxVUV5n29bv6IWc1iN93PYdIBHsWTqHtVQ
         UDNLACHuYdypg1aU9DZCh9Zug1LZKNlI2hyzgGtQrTppPFB//NuiHO5MP9wkUAnI1DWe
         pBwcLzyjJYD0JA/zuiHsaumV5dGmoqfgCFEmTZmfRxvakvNv8B9b2gpOXJQ3RgVjuoEm
         j9WNkxQZfa9BpZAb8o7CMzkxZ9U8l+K2CYfD0derk2AEDIC/wniLNuXcABRexmrXcKHY
         dNgMqN5gzVsXGdI+VldvXf3YWZuBlqxnpfV5W3FsolClAPRd4GWe44ZHPn5MD7utslbp
         86qw==
X-Forwarded-Encrypted: i=1; AHgh+RqFrC4hwe8FsdN2MzUYcTJL77f2b9umONTTT3FHDKMbEnuMbewcT9sc2EeKjacSF483qh6VnfZK1AzqRDw=@vger.kernel.org
X-Gm-Message-State: AFuF++mq9upwy+X8EMuSwmJOOcDAP8wJKOxesncjdXaaudZ+r4z7l4Sd
	cjCA6h36qLtI/1BML6ZfwfnKYiVwHKdkUOp6uhACV8SGkkgp04LMmkJqmVO5s84/O6QUimEg0bw
	56quem2HhvTGLHClkEKv/rN17DZ+NjCNQx0kqu7t3
X-Gm-Gg: AYBFou2jL9vg32cT7CI/uL2ZeNuUKBgQ3eGbJ+KzPk4NJu4e8UtG3flh5PERIUNawId
	O6sF88TDlBI80fge15U7M7vNNX4LlZKQTP36qB0gLvlEWXm1PrUtZijRxxVyjbqrmOzRLjPvCgF
	BWXo5g6+BNbEIzSGtOv7TGq8We9u09rQ9eYk88ngXgiQ5pA/E7yiOuG/E2jWWiYL4s1U2xx9R2v
	G31GHe5gghPdUzzO/I/i+8k9psm83FcOXVFYjKnvzFOgM9Mk6eqecHOu4ao5hC9ICMIwv0IbmTk
	b4aClSnY213HvBFqZUzGIMpYl5U1bUWuCoB1g4PI2VejuOblkGXjOQplKvvOU7TH0r1cPghCe5O
	3/LE4/Z9pkw38b7AKf4NzEe+EWcFkQNWlDw==
X-Received: by 2002:a17:907:c08c:b0:c1c:3b06:ed03 with SMTP id
 a640c23a62f3a-c2557423bfemr1484338866b.23.1788137947985; Sun, 30 Aug 2026
 17:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
 <20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com> <20260830165934.34e5b82f.michal.pecio@gmail.com>
In-Reply-To: <20260830165934.34e5b82f.michal.pecio@gmail.com>
From: Matt Eaton <linux@divinehawk.com>
Date: Mon, 31 Aug 2026 02:58:55 +0200
X-Gm-Features: AcwNN1Uxrxe2Vm3t8yDU_lGXXkWAxlZ0xh7uDmJiOIsGJhTP-E-y535X0vUdkyw
Message-ID: <CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk
 device property
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 5:02=E2=80=AFPM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Sat, 29 Aug 2026 22:04:10 +0200, Matt Eaton via B4 Relay wrote:
> > From: Matt Eaton <linux@divinehawk.com>
> >
> >
> > xhci-hcd xhci-hcd.1.auto: xHCI host not responding to stop endpoint com=
mand
> > xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume d=
ead
> > xhci-hcd xhci-hcd.1.auto: HC died; cleaning up
>
> Hi,
>
> Does it still happen in current Linus tree aka upcoming v7.3-rc1?
>
> Similar problem, limited to the specific case of disconnection from the
> root hub, was found on Renesas PCIe controllers (it looked like some
> internal power management interfering with operation). It seems to be
> solved by avoiding Soft Retry on known-disconnected root hub ports.

I applied these (from 7.3-rc1) to my 6.18 kernel and appears to fix the iss=
ue:

commit e3d757dc9257
commit 042aad8d0db6
commit 7e0ef4332ed9

There does not appear to be a need to apply this patchset now. Thanks!

Best regards,
Matt
