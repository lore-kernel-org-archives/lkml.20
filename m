Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794301961;
	b=g2was1sc5ZJk+rBvB23PXn593Hgz89lvbG64VmNxIvYrXJPboOoiGLYjbc/xm9QGXCAZ
	 auBOFBjBaRz+6iy9Y0Skgz4fXYQv0kIYdXNeXxq69MEYCdEwdAL+VSvfl6+VcpYKnc0sW
	 CVguecEwSzJppPBePtgMPGkq5Ep4NLBJ/OqjMhyBt5mWI2102EDQENgCEA4IIWqN8c5XQ
	 uE/qVBRFzb7E0rQDFy7yM7gzZIXNvKveZ7mj3NQKznkx9eE8NTgioy/6yHnX0vAFaBTn6
	 IMCuWcWT8YDTod79CB6XjLmAlBJDhwdLk7hhPL1BvE5jKnDBcUOzN0/NyY0sM+k7iGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
	b=288jgaABwi9YDvc88pqGYfXS5fGs6XWQfQYwUfSSSZS0bmG9TOGfEXPezJwIjQLEh8ix
	 ltmB3tW4ZikBRNfJFiqtcpvJ9dcQ+I+UFN7GWnP1dPAkuyoyLoVbpZf7gebEiEp8mf5Ie
	 rl24m/+NQWa5VR3P25C9CnJjWz3KdHoax6k8sjcM/3KLgbHOhkjwM10daBHCqo5k0yhX9
	 bjF7Q3rkb3QfSTJdaL1ssMj0hybK+4Le8KoBBgJyhi13WhC4RVO2ev4QK7aj6L6NvPdSH
	 to3ga3H+LSCPJPDLaiPUutrtvfaNFuNRt3Ey1c1+tCXlB78kw46T74US7W9ZgBK9YSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXKLOI63;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5246606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5246606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXKLOI63
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b335ef6441so14912757b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794301960; cv=none;
        d=google.com; s=arc-20260327;
        b=oW1/vBVhaWSDG0cuGa5pFpphT16KAf9E0x4i5wRTd2NSpdUd9vqeMw9qHGw+iLs07Q
         dopv29pNwSMdu3MxvxyaEHJolJE8cR7eU3fo+vtVtKcRpl74/n+sJhrpWdoUMf+qq5DF
         MmWMdXJopyAAZ0OAxtD92vtCpcpLyTqHHGCUXX2iRI+3W04a7sqakgAENoLoqi2SyVrQ
         7/EzSy9DkdbQcVYf59+S/9wf+9+DkCZS2hyjAy6FWCb0bSitl0W56xNy0N/pJtf9YqKw
         wRjgxDMEiikmBPTKbzUEBIL5ydKIJG7vJOykpnp3BW5r0qAQYhBfLA3M9qcVggE5hSym
         PjrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
        fh=Z7hZYzgkKV6FpOkjt72m5LAoam1IuhuV/Hk2EhQN20Y=;
        b=QP+v55HJ3TUTMQj+HcKsqH0tiKLuMoBWSbkONh0ZumWnoOYXJJtRQLLz5YLBUIDnT6
         jadr1sOVmv0wV63BYEytJW73u1Lu3J15HER8hCVJqktCJgPxbHyg7owP8KLxvotayxik
         5aOYcpMAbxhW79dNAhGhyzbb647hawbYZHl8xckNogoqrrd3YCuNLnDN8q9aoZBonI4K
         33nLxdWKQtLrCAmlRXEdUYUsX9+LGZAuHSyFWtAsxN2M86AmNdz1Xi6HDtLL006vdxBd
         RlOty7l3KKNRbvAdkhev87T5rkaVP3DtZLJwMMS1gCfgMDFz6DCbNRI4RUQyowpQ7tDJ
         o0Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794301960; x=1794906760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
        b=zXKLOI63QCscfYZHZY4+Myzicd3aopoC7ck6ONm/yWOwDd9HV1/45+T4CD9+NQGcTG
         SlNX7swBaKhRgHML4wPGgoeSBIi35vGBbJSSz4yimhH3cIFRhcjsbCyjb9Uu/ORVkgD6
         hsv+pqcRKb0uHQ/jo7P8JQs3ZK6hvlZjj1oof/XjmAN9/VfK/6x0zq58UrGVPVenk8Du
         3XU4RtAafPfiVRYCDA5qoTR7c7CTBlHqK+BsdQtwJe7rfa9Kr0DBbBdYZZ3bpmYeqIPY
         93hSDDNLGk1fNgdbjh4PX7UbjOYPTKMD1Lhw4NO63Yj/9bYTocSAjc6Wvo5ijvVNmQ+p
         jmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301960; x=1794906760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
        b=peowpD3Twotj1Ov+4kkMpyKxJ2lZe6iVDTOXIx8Q4kv1vZ9GM0T5cLDHpeSosde8CB
         vY2wcjACbgN6ftL4OAmzkMzGEtarML2kedbYtikfBIL8D9Qone90D1xz/GUIJBEkbT7w
         0wErcIqaLiBW9Zpx4JHH7NeFCvd14AJLpeNTlOdahTPosIMJyDHgZ8/c+83jVctv72fm
         eabtNhWhWrC8fB4VKVAplN2xwky5SOIVUkVaYX1bHSiuD6KsJ/+c5+gyk3CoS7qFxjuV
         rLrOkbLiEzOfy8y1Cp9ua2oIPPrpuW++ImAR+FWXw1zVMOI9GCkV6Es4Fw7Z/3owFZZD
         KySw==
X-Forwarded-Encrypted: i=1; AL+hErGqGJxevbul0Y2G9XsWk2Iuh0QYmG9rbWHRFGVamJpJC2bvaAV4anok48CbMb0Z/0x9L40S0yb7BnPe0ZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+45SNZw3poqa4zqGUtxVmBGokFpSj8iioHtK+R0/3I+KxG+VCQ
	xG5VSOePH39O6rgsgh/E8+sauiPgKGNQMBwSGQC2XTivcAYmib5EoMym8u0J/uSydlKlz+gSGRq
	mzmQM5y+fNbItXRczO8UL4lc0xFIlaH4=
X-Gm-Gg: AYBFou0qXfwBZmxTSLhSPBBUqAyPryV+h0pG4iJMgJPtf/8zIj3NpKOhZR4tgqUiyW6
	gGwOd3HokxhvW/uGuVWQFRIvCPzA3ye/4X8B/F7oeUpHnyD/I6ZlcCQ3kZECoofuaKTF/KcNjyY
	tlnC9uAEtA3mGuJfltChiuE/8Bf7JtUP0pJqxwG/IRLKK87Vu0hnBHMnDuWQ38UmoPGWmHGOwbx
	xKEcgSZ5Zkxp6A+Y9XiJeeWVn5kQsRqriaMkA215bp8Q9qVV1AidLJVnqyqdxAq+1tVqoFHuR/g
	m5BJ/QYFkHQL7FuPz1tOhrfjfDV4vunBJwnSnlRiQ8pCF5Q1xRUZrWoGNXQtpsvm1wg7nT3DDVb
	t7OCCDg1zdcuuubpti9h2mOMNmkLmJtT7ZqmnPCfAnJbJsGy6T+xx4Vi+gttBZ5VWjLG8GpqGJ0
	nMnNYgEIxmI3xty8QdAyFWvxvRneE0Gt+9hB5FtPg7UIQPxcrLD53pAbXdPCnPW5k9HRIFGCFyZ
	wx3+n5wgykeBvW/075+k0MkhdFLqxWL3dOLiVnWA2XyuHHdj/rBis5PVsCXvIs=
X-Received: by 2002:a05:690c:1c:b0:8b0:a01e:2cc1 with SMTP id
 00721157ae682-8b392bd3a6bmr12222497b3.53.1794301959730; Tue, 10 Nov 2026
 01:12:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
 <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
 <auuhy40x1BMoW96-@ashevche-desk.local> <7sfr4ljlwbehal3or4dmy5jxbjz6ya2lf3dq3yptr54wym5tea@eqaexflmocih>
 <avICwdxyi-W1Y3PD@ashevche-desk.local> <ab73ez55exen3ew52svsxfinwsuatppdodu2e2zp6izjwwqwwu@2imxzxwclgtl>
In-Reply-To: <ab73ez55exen3ew52svsxfinwsuatppdodu2e2zp6izjwwqwwu@2imxzxwclgtl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 11:12:02 +0200
X-Gm-Features: AclHuK-j7UjC7_2X91Fl0h3tqgy10rRsGsXGtMX-1tGj0PKndsOn6ITWu7Xe30s
Message-ID: <CAHp75VcwiGHB73ny8iSvXeFdjbTKUpnXZPS5iD7NwaMcJ6q-7A@mail.gmail.com>
Subject: Re: [PATCH 5/9] of: property: implement the .property_get_names()
 fwnode operation
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Mon, Nov 09, 2026 at 07:28:33PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 09, 2026 at 02:07:46PM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Nov 04, 2026 at 11:21:15PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 04, 2026 at 03:03:47PM +0100, Bartosz Golaszewski wrote=
:

...

> > > > > +               names[i] =3D kstrdup(prop->name, GFP_KERNEL);
> > > >
> > > > Can property be statically defined somewhere? We might want to also=
 optimize
> > > > these duplications with const variant (here or elsewhere, for fwnod=
e generic
> > > > path, I believe).
> > >
> > > Please rephrase because I'm not quite following what you're saying.
> >
> > Can prop->name come from something that is declared as
> >
> > static const ... foo =3D {
> >       ... .name =3D "bar";
> > };
>
> You can't know it for every instance of struct fwnode_handle, so the
> answer is: no.

I believe I misput my question. If there is any potential that *some*
of fwnodes use statically defined string literals for the property
name? If so, kstrdup_const() and friends may be a better choice here
to save some memory (which is getting more and more expensive these
days :-).

> PS: is there a way of using match_string() with non-const data?

Why? It's an input parameter, it returns an index. Whatever you
provide will be not modified.


--=20
With Best Regards,
Andy Shevchenko
