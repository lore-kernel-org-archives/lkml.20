Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B76945D5D5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560615; cv=pass; b=r4/S5PbdpnbLf3zs9EKnnDYkl8FNl7OydIvwxlGTTOrfA3QHD3d59Vbk4K5RqPRFso+hAJaSiplZME8GxBf/OABZinqDbXMiwwwxa5DBk/ABZe7pOY+1Jwsa/Ngt/sAIt+AyyLJNO2Dni83tDWr0+d8JOSBveOTqhmmwFZrpD4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560615; c=relaxed/simple;
	bh=zx2j5RAhzB4SxO38lj6J7oJt413F43gvw2W6oYAdPvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MU3Lntt0jwgS8BmumucM/P+0Y9EMhIwQsYt2EQDG0DSjpfN0+jqa12ORgm0Kj5hEOUad+HcIcWxte5+CQWWEILf9U3DHeU5muetBTQmpV+ArRkpM6AA+jSa2+Aysx3eVjGTSbsf235WbduXEPIlcCHicG2T8k7k7fjU69rXJXBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2CjXMyh; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2CjXMyh"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-823b938464fso5029772a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791560612; cv=none;
        d=google.com; s=arc-20260327;
        b=TmQObxwD3+H5PlsvbzbrkQQ8M+bC/Di5Anvlcti7RfB0+OLHG2LBuz2npt1GTu0zgQ
         MNl9mKao+0yFxDXSyOx5xDRLbRtsP/j/DplX3x3ziWy4rUu/kjmNBhBeNsbU2fgZUccn
         XorB4JcVVSMMRHuNa48V+UsuO3gCkDwlFxVPc79jp3dBQL2HkhkpIV2YCeot9XqsNXe8
         vuDRlogQDFPMiJIOpRCAjBWgF4f/bjqRgxehmTSRoYLuaVCfsrfhqv11xUXLJuDIKbhh
         J3l0BMDrJAdUJGM/AY+foOyLbX2jLuQC/N0QPCaYs9rI3I6lwjzNuUX1YqFJpvL22HTl
         zqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=30V3aYAGacnfDe5Uw314wkUS1h4m5vyY1WpctMWa5as=;
        fh=mujwVv65pmdo1BEr8F5G99pb4A0V84m8krhV15IAMjE=;
        b=L5HHTocJeG+CcPsumqkScG24hoNdBL4/hAJ1y81Oh0KN2agDl6+M1yMNDSuqhg5emP
         kvXdK/g38Z+bMCgEjnrNZYksn+AxrpEPtYgqeVQQ5CkMJOZBS7B9tHqE3FZEGrXHt3sc
         yYbSF1etI7V5fHAW0bBGBGDdd8uDeZsk0UPLDintK7I9hgKxbrS5d+2c+1ciAM9EpH4B
         6mc9x8Mqwc7doORakdZBZUMFSaOXmDLrg7cMlJQXEFXFr/Zch0JnUxS6N7COeHzPKhiL
         EPcrA07hDmLb/Cn1uUNoPyKuO1fPOx/0S3sdsMTYbzVRKQ/wuYAjSmBFIFOjm/47DXgg
         x1QA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560612; x=1792165412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=30V3aYAGacnfDe5Uw314wkUS1h4m5vyY1WpctMWa5as=;
        b=H2CjXMyhqCC6QqV+f0sWmmLR3zKCPMX3+pvSiwM2n7GRHZ85zFjFRh0ei2srHnnGk8
         oDRum1EF/wgjTZcwm2eyrGYXB7CSITG97li3/OBebvwFflNoTAjJXdNdEK9Gp8W0DZKp
         d6dKPCgesx4Awq5FJzNBLcOGd5ODjTwRu24VY+5ediAvqG5L48kwhPxmR4wSvHGU1NVo
         k217LVDV3i3Sl4+/epWLnxXY+5q4PnwaPrtaDRFlh1JHXLQReaTi21IHHlNw54nb6jcA
         0DlynOtM5h6pfHHPsWMHGkdhpoVeP5zKf43ymkrldxvc0DT+xW+Mjiuxu8k43/mNO745
         FUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560612; x=1792165412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30V3aYAGacnfDe5Uw314wkUS1h4m5vyY1WpctMWa5as=;
        b=bgvWO8lL8lJCh95JAzomOhV2wZ31c5b7+g2mEP/lVePoIKvp0yttUxT9vmvFpNUyie
         rA45XA99u+0pD5VuzbcGCn0LWGzgmm81a8IWFFH+r1FacBY03j7W6a7PeQ8kVr2eRVzA
         2elIiy5hIhjdt9Ow/8CGPPalm2p0zaPjE4OE0gNUbZ1/UcACFTNDf8vkkabZ9kbxIhmc
         bf8O1WuDbL/CSg5jGeInrSwB360jJ4zMhOceOfpeAu5pNVUqu4dT694fjTBf63IJ8zoz
         JEQk5dzQ3xc8jV/FdN4G7mzhhYBocaQxLUQIuYtuxNa1hkPLYUs+TGOGPgOYFAzwRFZ3
         KScQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpCgDFXyNBSZtJoUCGJK5fs+YGzSVzBwEMv8vdPOVGntxSX7/nwZnKzdQrB8SibRBo1Oo0gsWF23upbNs=@vger.kernel.org
X-Gm-Message-State: AFuF++mMfwNYUMoyYh58/jVBY6fIwKzEwgBSptqIkruXE3fxPUONH3PH
	Bm1RRNgFyqcOpl+my4WPcPdrvyXBhelrB9qy5lm/PXUtM2R3c6w35ng+T27btGPVHomJncKRXLK
	EqMmuGQpvAK+T6ivFNHyMJkWeYGbWGO4=
X-Gm-Gg: AYBFou2vSiRHuihfMw1+UpXuQGdYBiXOAeB0fj6YbOG09USZHK5E6gKmcWVJIOc92tj
	wk+UVUQvIUWPV9llWg0UZgeeD3OCvaAP1QfLzPhZkpht/JkGTdeZrfaHMVH/k3lb99dbLFr66Ff
	j8wWoOsOnxA0RVoVPLc99aOokVgoJf9n4OG3rUHxKV3hDT0jUt0PJdKX6d8bGQaoGlTqEf8MARd
	fALVVvysmQjLnyaw6NfyuBZTetk4dluQWdRP1teUk+hsgFBLJqq8MldSd+racnGPHtoQaDDhjXZ
	ICS6McHdsYfmd6mlePqRXfoGN5YdBPRxfjcj39aCoooP/u36KknWw6Q=
X-Received: by 2002:a05:6820:1992:b0:6e0:84b2:edb8 with SMTP id
 006d021491bc7-6ef08c7c614mr1702776eaf.1.1791560612403; Fri, 09 Oct 2026
 08:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
 <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
 <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
 <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
 <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
 <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
 <b1f088eb-7c77-4079-9b05-20729fcfd612@kernel.org> <CAD=FV=VSSEZykDpu48XVwDzNWKAhZjsPm3PNweTqeHv_DxiykQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VSSEZykDpu48XVwDzNWKAhZjsPm3PNweTqeHv_DxiykQ@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 9 Oct 2026 10:43:20 -0500
X-Gm-Features: AclHuK_n4jA48VU427LdptzIuvcXkvRmkA34iUq3fGa6NHmP0M26irsb0xZMW1I
Message-ID: <CABb+yY0yaXZX7=0L8Tt5P4u-GTX=unmgBMePoNTVQ5BHKzLM3g@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Joonwon Kang <joonwonkang@google.com>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Lucas Wei <lucaswei@google.com>, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Fri, Oct 9, 2026 at 3:42=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
> > >
> > >   for (i =3D 0; i < mbox->num_chans; i++) {
> > >     if (!mbox->chans[i].cl)
> > >       return &mbox->chans[i];
> > >   }
> > >
> > >   return ERR_PTR(-EBUSY);
> > > }
> > > ```
> > >
> > > Then the client loops around and requests the same channel over and
> > > over again until it gets -EBUSY? Like:
> > >
> > > ```C
> > > for (i =3D 0; i < FIFO_MAX; i++) {
> > >   client
> > >   chan[i] =3D mbox_request_channel(client[i], TX_CHAN);
> > >   if (IS_ERR(chan[i]) && PTR_ERR(chan[i]) =3D=3D -EBUSY)
> > >     break;
> > > }
> > > fifo_depth =3D i;
> > > ```
> > >
> > > I _guess_ that works, but it still feels like a bit of a hack to me.
> > > You said you were worried about people abusing the "has_queue" API.
> > > The above feels like it's abusing the "fw_xlate" API, turning it from
> > > something that is normally a "lookup" into an allocator function.
> > >
> > > +Rob, Saravana, and devicetree@vger.kernel.org. DT folks: is the abov=
e
> > > something that looks right to you?
> >
> > There is no allocation in your xlate code above, so this is not that
> > terrible as we talked on LPC.
> >
> > >
> > >
> > > I researched whether other upstream drivers use of_xlate() /
> > > fw_xlate() as an "allocator" like this. I did find "exynos-mailbox,"
> > > which appears to be doing something similar. However, upon deeper
> > > digging it seems like "exynos-mailbox" isn't using this dynamic
> > > allocation for any compelling reason. It looks like, really,
> > > "exynos-mailbox" should just be returning one channel. The client
> > > (exynos-acpm) could just use the same channel for everything since:
> > > * It actually gets the _real_ channel ID out of the data.
> > > * It doesn't care about txdone.
> > > * All it does is ring a doorbell and there's no queueing.
> > >
> > >
> > > In any case, if using fw_xlate() as an allocator is truly the only wa=
y
> > > to proceed, I'll finish my prototype and send a v2, but I'm still
> >
> > Why fw_xlate() would be an allocator? Can you extend your code to show =
that?
> >
> > I think doing any allocation in xlate() is calls is fundamentally wrong=
.
> > These should not modify the state of the device, so no allocations, no
> > device_link_add() etc.
>
> It's not _calling_ an allocator, it _is_ an allocator. It is walking
> through the array of channels and returning the first free one. Then
> that free channel is "allocated" to the client.
>
You mean _assigned_.
Allocation means when there are some resources reserved that must be
released at some point later .... which is what the mailbox controller
driver does in probe() and remove().
In xlate() the platform just decides which channel to assign to the
incoming request -- some platforms take the hint from device-tree,
your platform has flexibility and can simply assign the first free
found.

I will try to explain in detail your questions in your last post, but
I am still not convinced you need to modify the api.

Regards,
Jassi
