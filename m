Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794049997;
	b=Cgx8CH2oILWfcz9d4N9ll507GEl1W3R2ruKxu7z46Kp1GuhvIafc45OMkkGWBkXfBtcr
	 SIeNmATI5Vj5ZyAY5Qqx8t7/UKZyQ4N9GCfDQOJvG8uu52LVXbF0gXfOJuXS/JJy7ram7
	 HdA3s2VIkJuHlmu4CX/rhxElEIQkc3414O4wslpbS48IhP0EmLUrR0H/j+5D9mInB8Y9w
	 0k7VcmOfc1sxPi9rVM2arD9AgkYNlCi2LX6ZAV2mJRPRxbz1XOEm9Pt+0SW6GBW3Sg5py
	 KyahoRGNqk6azabBKCD0moHFxYM2gVbXasewl48JsXdZssifmp6B+yCiASAFATy3G1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7CfQFlNQ0Wpv/PI/08FuADOPka34n4mC+wkHpFkQ2RU=;
	b=LtJ4VEFQqON1/01daReFMGZsiQ6HUgiqOyItj0ST1ZlEjeBYySeKoCs0tBrU8R5s+Drv
	 cHC7CdNYuBAeKygQdfb3rw8EQnLO39+mSFgVxbuzKRLABCueDE5tktJ5iBja4Bw3YdV89
	 ZgNexvUydzy4UKxvjFWsSPGjZO8vNrUtSMEz7jVYbdeWsFd0epfnIQCflocuTiKjpyqSs
	 XaCYPSK6HrRqRPEP//gPur0888g+/9wyoI3mUrjyX0lh8Rmj3wZCwyBxwC/iHYvjW2euP
	 Ef0jBKUrYMC2TRxEUEbDrucSRk2Un10IRLubWLG2mRta/4YAJfglMFsm4EcJ1CvHFCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivnycKhu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20B606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB20B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivnycKhu
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b31ca7e0bcso12657897b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:13:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794049996; cv=none;
        d=google.com; s=arc-20260327;
        b=OghkN6qqq1EznrAWdRw0bhEaSprFUGjSdpNTo/shW7lFbGqaUcAKFpudhKa2lx0ajN
         m7LH47guDSWD5R+4mXBffDd4Q/4uih00aSfGcDKd1waBxqXc0Yf1o9y3Y4a1fsXegBQN
         NFexj5m83y9MMxN7o+e6F+LxNwMggA35pomINyro5isl0SVmiW3eW5ho7WIMK0old+I1
         XinVwbLRtDwGwvSVzqgffKjsjkQszLSgWDclKoi1YbHkYoz+JirULS6waefE7UI5z5mN
         wTmnksO5FxpCefkYVCmJ5eAKMvusqeXa4WcnFp/0pg/t40pT4sDAT//bQHIZmVisx7rd
         SkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7CfQFlNQ0Wpv/PI/08FuADOPka34n4mC+wkHpFkQ2RU=;
        fh=TRc7XB7POcg5JjhgUDR1mo644yUeU8jqFf/Y0zkPwmU=;
        b=lHJ29/ITH+JkSPOexpzb6PGlnl225yaADpabO/AKFev1/YVmDxjEl/1h2agJeBnGeP
         xhjRZqcA7CC4EH8Q7E7IWOxdxL84roYloqcgndSwPU+M9O5RhAi9P1qM0l3TBd9QBEGz
         G8QhYPWJJqu89dN7S55h2S+pN6tNUCgA7xSIFZGlcyMFcqo1rC1frz/Au/nsMo4IzhXU
         c9JSBmOdfcJEMKYtHDo12uY1Ie/fZtaI6Dcf2Aln0kRjeA4B+Y0rl06FrWfGXaOKaNJl
         HNT/0dhZtzOqfWkMIZFVxnaB6htF9kA/l/hHGb9En1URlkCRWhDWteENXjmte7xnKTfI
         tC8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794049996; x=1794654796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7CfQFlNQ0Wpv/PI/08FuADOPka34n4mC+wkHpFkQ2RU=;
        b=ivnycKhuAxWBrnQWYSCvqMA4+zpotiW8esslbkodt4qvYj9ggQ2v8rYs4fK2i12qXG
         maGQIXpdSi575tzTx7jB3P7BFSoWBXBHxgOy3B/oyzbtJd5ZCvd9KN9nvrhDKOgGMpuK
         0seZO+NPFfds7I8AreR4quObnpKgi7Kps6MSBz406mUacLX7PRCAwyx4hNyPjm3GoiGY
         G/ZrU198q4ZqSfuUKbjppXr1DyucCvYr3G/quNSLuN+ehqbVYrrmIl980RxctPX5rgv/
         xwUaU3hEM7QEaVOgan57LdgQJ6qcTFmM/eqcQ24BOU5yfTo2KA2QnGP6lZNyGtZ1DxiF
         rf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794049996; x=1794654796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CfQFlNQ0Wpv/PI/08FuADOPka34n4mC+wkHpFkQ2RU=;
        b=IXIpt9tpvI/R9sgWa21WxddhtVlmEjmuQrleG2owWcnbJKkOkKRN4YzaPaghNH+7GK
         rNeOBQhevr7IvnIebNCipagda5KRtPQXvZ9unpQbWrgSJjcFXqstcSJPAF8M0N1TSzRE
         y4vlohO41rHJgQ/2YVb4t+NFMChZXXzJ8ezUozIqHzPu8wJ5Ujh3HHRYDegmaNV7Oas8
         RbhjZ2yNAbXoVfTAdTtimHIkLQ2XSzmwNtvUHQf3Rf0ydpYcZXwr4EDse0agnww41YrH
         eWLL4sHUK1AQrOdPw1hYSovwmCDltN5Z6jn2cM7vDHjMO8TNvLey4MHxOdH+9NZUtIap
         falA==
X-Forwarded-Encrypted: i=1; AL+hErEkNXYnJf8cvWrdeeznldUk5nki7P6tvn76/f4YabAGJY9MCPjrMX1SPAmGhKH5IjG5v2ICbPYkqVxGaTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iNLH2bCLwHx20vrQT28Poic78gCf047BRq/T393ut8F9f3p9A
	D+6E4W2TqKQCZ+2udfc6M3I85UPEZO0ZoBhGSF8oG0Woy9XUsdGDTebPPchmY5OjEbUQN1Ufxnm
	kgFxmxvJTrRszqPRq5u9QNdkiXF1DIco=
X-Gm-Gg: AYBFou1j32wZ/Nmbk9JAPptBcL4ryyUCqg0RSTQiFNaJFDr3D6Crpy06fCTA8zNsKC4
	gZBRlwvNhUPV12iILE610u33efNozC4F8N189iZpQL/DTE7RfF1VcMt4hWyE1CxH1ANCpuDMYJB
	w4SCaziWx1KdJgL9Z7lT3YQ0PX1R3gWSlLoGMG4XdFuiIQHrQHlQb2qafEbcPxyvJZiwQmcNQa7
	eLLPPxc2NZ/Q1UU8+iiC0vrByKY3sVBcmBSUsG/EbUJOk6cvdx/CjoUY9GmnqWfCOXseXm1o/bZ
	UhOusCKJea80Gzyl+pLe80fNKJ5FsmaFm5Or4IQq/z0oubzTXAjU37O1yDqd1qxftTj+VMRrhar
	aOwB+yLI0+v9pF70tM+bmS0kRXkYBkNCP9lHbxlNCxoJQSaJ1OjgLY1XlgX+6wsKbzMiudBFcSc
	0TAZIIUUZ1GTEYps2tHLAtlk4yWHQ5VkytbnkV267a77Vbl+Xu5JDg2BTLJMoDhd56GRpYZO6Vq
	UW0M0Mn3fWhrgGkSeYx4hfhZkS+xRMM7TuSA2GX+W16Hn6ErwITwm+geeXBDw==
X-Received: by 2002:a05:690c:e3e2:b0:8b3:1fab:fbe2 with SMTP id
 00721157ae682-8b3419a12a6mr35202727b3.36.1794049995845; Sat, 07 Nov 2026
 03:13:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
 <20261105-b4-gpiolib-free-v3-6-bb47ad58642d@gmail.com> <CAD++jLk+EfkLsHCyY+O6Om_xTEe2dJX+cscDLqW+TVM2f_V8qw@mail.gmail.com>
In-Reply-To: <CAD++jLk+EfkLsHCyY+O6Om_xTEe2dJX+cscDLqW+TVM2f_V8qw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 13:12:39 +0200
X-Gm-Features: AclHuK8EJ5-TX-3H9n-_URllAt1JXIUxUWdN7PJdZa4KHOlR5un4fYeASzixMP0
Message-ID: <CAHp75Vf8dd7N-9QvciUQ7Wug_JY=Ru4_CGvhSpA+-icx3z64tw@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] gpiolib: avoid krealloc() in gpiod_get_array()
To: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 3:56=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
> On Fri, Nov 6, 2026 at 7:30=E2=80=AFAM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>
> > Instead of allocating descs before the loop and reallocating it via
> > krealloc() when candidate hardware array matching is detected on the
> > first iteration, defer allocation of descs until the first descriptor
> > is retrieved.
> >
> > Factor descriptor allocation and fast-path validation into helper
> > functions gpio_descs_alloc() and gpio_descs_check_fastpath(). Inside
> > the loop, acquire the descriptor using __free(gpiod_put), allocate
> > descs once on the first iteration, check fast-path candidate
> > suitability, and transfer descriptor ownership using no_free_ptr().
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> The kernel clearly looks better after this patch than before so:
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> > +       descs_size =3D struct_size(descs, desc, count);
> > +       bitmap_size =3D BITS_TO_LONGS(max(gdev->ngpio, count));
> > +       alloc_size =3D descs_size + struct_size(array_info, invert_mask=
, 3 * bitmap_size);
>
> Nitpick:
> I know this is not your code, but if you respin try to add a comment
> here explaining this 3 * bitmap_size.

And the very next patch will remove that as it makes obvious what's
going on. Since it's not a fix, I don't think we need such a
short-live comment.


--=20
With Best Regards,
Andy Shevchenko
