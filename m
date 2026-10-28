Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793166898;
	b=uUYdJUP8oyOPnzI8o5+uFan3w47TvX0esB4FdoM7Fsachyyb2NxNuIBH+qU+UWhJ4fTQ
	 qEa0nvGlDnlbLcavDSI7gBtnZ1L50i20DsHkiSP+ps7JeY+TL1/ZkJJydHRWWFlA8p5Ve
	 eOeIKgVxWsShUsq1fJBoJafeeqnxpx6pN2lsg5IZ9F7VjXITkr5PfOMDAibRpo5mR9JV+
	 pp/TbFDwuiVYon1Wos7NzMrIAIqDGbQZy0Q3xYZO2Ue/IH3sKIqJim79psZg4/dNYirHm
	 EVJ9JI1v6ADbGCd0z51wNgTrABHLoMjRFhxyPXTDdFcJ6/4UQpoLyjldiX439w38stQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/OIe7V+Z5EIyhdSgn5/cXwPf5qh49NuJQ9MgeW2mgsM=;
	b=Xb96rF3XszvIyza/MHFaAMrCQQZlZmfgW8FaSj5jTIKffvNxBpks1JdifXJqwyMdOQKu
	 AxpnqxJ/YSUaFlV9YZe00ZZVZ1GXWKc7HYiOK2nfeD+t97miET4tF9XXp6dxzUZqQ73Cc
	 4aGdquPI5FNJwZvfdMCUip4hDXsgoroFGcllS+m5gG0csmelLf/7awGom8RXXCRs4YB/n
	 P+PHmDA7vK2R4I75DKNtkNlr+4Sy2bdoi5baJyXC5ntNHSavdTgQCqoRIdKbT9rYONCgY
	 9aQZV0xh0w8YuGTKdWlmUIvzqBMzrUcNgBirLsWH3brVc2E8XVTd/oVk85Knz9+H9rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y5fJfnOZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FE5606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9FE5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y5fJfnOZ
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab39af88aeso4692701fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793166896; cv=none;
        d=google.com; s=arc-20260327;
        b=I+ZmoejqPCqUyxcKboQLYTiv+yTSos9H8Nrko9zWTU6csMWZrkUn11kmyWfkLhkt+4
         Sldp8T0XmedDnuN/F3mrsjb5ASEyFgzwnizomejT9nFtSyX1yT5PFBFh3/5W4xlev5D1
         xfYGEegCg0sVWj7XuDNCsmcLGZ8iKOfyOCDHNRfpeHeEYJx/JmHHHKQoN6V84ky0m9Hg
         aLpJ7aYBY35SwWqyde7AEMFsY8gxiAyfjVQbPLvJ8WkTx/pWbqB9TdhdUkt5L7VDRi6+
         0kjMfn6ytuZqpCSt06S/amvlWHY6sOgbnz6nspX9ZyQNwsdrCVq1kmV1bbsvMEoPO+ha
         jDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/OIe7V+Z5EIyhdSgn5/cXwPf5qh49NuJQ9MgeW2mgsM=;
        fh=hSJGrZLFUTmjchOQrtExGL7vgaxA9KG70cKcQwP6JjE=;
        b=OPrg/1Qk3etneaB5KbhxYgQf2n+7Dar6uEgEozAiACf2GwdYvf2YzHm+nJM/mzjWYw
         kea5HTa63b3SaeGBJOrr6eJ4Bq/zVHW8qEUbmAxK7vP+oCd+n9ukp9Pmt/JJf9Opgho8
         sp50bdxUd9v01hDEfovImQVMmx3swuaDbdPnZ0K+zUxRYIj9qjEjW9kYBo6IIeFROZ7B
         r6u5yT4TGrgc4NN22eyxMI3sP+u8pKEvMD+xRLITj7l5A3m5gFrsfjZg6E37CF9uqJly
         Wr0EkIzwml1UXWLqKGiqNdLXKp+Jbxu7Vkzk6yFn0noMmx5gz1+6eX9OOyhYk1oGTGpU
         9STA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793166896; x=1793771696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/OIe7V+Z5EIyhdSgn5/cXwPf5qh49NuJQ9MgeW2mgsM=;
        b=y5fJfnOZfY2r/CWtBhTWUeLDQQ9nrWnD1jocOsU5bRRm1ODKifUXQwx1zGcra4IQiK
         QtlRAnmLMj6BIPQ09d2fP8MHnP2U0eTm+qptYlyRQ+80NsT5tzqZattPqb448NJZyeRr
         vdXcw6AiUf7wX6p7YpgSHKlRVqFWSIBHKz88vOTVBHgotXgmq1ny369PyQyGnlcGdQ7B
         PvZAIYrWABGZW8mOy7zFO7IGAvkZm8ejeeMQm3dfrNVk0ZN4U5uP6NqiittMxc5TFgfS
         N5+FQT8/bz9g/TUUCgJQRnc65NCpqDdMaYtXaELkOqJIOrd6VZtb02SWagSTkXhHyadf
         Lc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793166896; x=1793771696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/OIe7V+Z5EIyhdSgn5/cXwPf5qh49NuJQ9MgeW2mgsM=;
        b=P5adadkX1ppZQJHcPneBpTZ2rmlAS4o+naNxXJf9/wdzS7+D0bB9DfL575MkCbsicS
         h6go4dXYsk2f0qrafjkQQMQ9XbSnGi6i//mQhpoO+3plwxWeQdtUaKgqV5920zqoCwaR
         Day5qNfnY/lfzonUlVr+uiLEIKnD8qtUEdXRcIr+VBZ5fbZGdy6YKOZuAC9NrnvQAVWa
         GK+WwcByBr61CfCvpXNTNV5yr2SntisHOQwz3UFKhyrWkyDI5GNm4NXBkGwyEQmiRHiO
         0iraFPhK6vZzOT1e5RQSOsjyN99bdWqA8KjJT5TKSJkgEkG7bPTzRnfUAMox4+ztQgQ8
         s8OA==
X-Forwarded-Encrypted: i=1; AKwUvBx/2LNgo4PUrj9YES0eLpRt5gw42ocFqOLGjdICUsfG6rVkU3gDeWnXjgDxC4lS1dxa0WiyaugzejdUkBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzKJ7yrCxzaD01U6UDypI9DCcKZPegEr/hmqSVbFPaXqBKNvz5
	tPhW+K/1B43M2eANaA+YWWBOY8mKgrjY7nvCjwiBlCI7dFD379J5EC7UUlOal7pBymvYMivOnrX
	J30dGgI1fT/Pdy5y9wpXmw8mXbclbp2w=
X-Gm-Gg: AYBFou3ob+xnLtsg4+ykLDGeRqqw642szhi5FeiAg5J0DJ29WGYxl2210S9AkJ/WyIe
	F0vbbAK/1XA4gzsPe3gkWAkVy6wjMEqsGao2ZlGa30xNnmsXLSVJy3djkPd+GGBxi7CEgascfZA
	fEe2nYXuoemw1FaCUIEMnC0KgmJFuMy2G/ShUb/MOLctKRJ/v+ViuELK5RgoB95EvE2wB6RSapD
	607by3UCqVY4qdxw+pmPHhy5Fkl135NDd1lbLiM4LfjXJ71KNUqLK5uglSKOJp2jIpMD1a5lmrN
	eM1Ac9cqiDQRjSbZNZ+KZmjhT7iGrhLvNzmrBCzXnDaylEj2HFp0Ro2aPf5w3DrVAa3jDBH5Cxb
	i7I4G5CB/G4zVmOdWpBplrOXWNrixbj5qSlAJeoW+N+zyHOq+bzow+QYZObxxlZ0igE9z25koyg
	uhHYZVxnznTi+4gFf3XIIJXHTnCmdifaggqut05PjinslHSA==
X-Received: by 2002:a05:651c:1543:b0:3ab:a27a:882b with SMTP id
 38308e7fff4ca-3ac9cf8f039mr2342071fa.14.1793166895636; Tue, 27 Oct 2026
 22:54:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028020147.2014466-1-matthew.schwartz@linux.dev>
 <CALHNRZ9f8ZTnc0LnAJ+YPRYKA9D1=tvY=Ce6bf=91O=WWU6XmA@mail.gmail.com> <7521fb7a-d46e-4e2a-89a8-ddd1b55e0afb@linux.dev>
In-Reply-To: <7521fb7a-d46e-4e2a-89a8-ddd1b55e0afb@linux.dev>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 28 Oct 2026 00:54:43 -0500
X-Gm-Features: AclHuK9WWp8SGPM-eWG0fxs1FWBVmuy6ctOftERy8mB7zwqvdR8blmFBBHZ3Uv0
Message-ID: <CALHNRZ8Tjb8hyhA4fbz10u4ptmS8ubgcVNEf6qhhUZ=+BwTyEw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: chipwealth-ch13726a: Fix dark grays rendering
 green at 120 Hz
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Teguh Sobirin <teguh@sobir.in>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:46=E2=80=AFAM Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> On 10/27/26 9:57 PM, Aaron Kling wrote:
> > On Tue, Oct 27, 2026 at 9:02=E2=80=AFPM Matthew Schwartz
> > <matthew.schwartz@linux.dev> wrote:
> >>
> >> The init sequence writes 0xf0 0x50 followed by 0xb9 0x00. The panel
> >> configuration in the Thor's stock Android firmware (decompiled from it=
s
> >> devicetree overlay, dtbo.img) has two runtime command sequences that
> >> differ only in the 0xb9 value, both "display off; f0 50; b9 xx; displa=
y
> >> on":
> >>
> >>   qcom,mdss-dsi-ram-command:        b9 11
> >>   qcom,mdss-dsi-bypass-ram-command: b9 00
> >>
> >> With 0x00, in the 120 Hz mode, a full-screen gray ramp from black to
> >> white, shown with identity color management, renders black as green an=
d
> >> the darkest grays as bright green, both at maximum and at reduced
> >> brightness, and the tint is more noticeable at lower brightness. The
> >> 60 Hz mode renders it correctly. With 0x11 the ramp renders correctly =
in
> >> both modes and the panel dims without a color shift.
> >>
> >> Use 0x11, the value from the vendor's ram-command sequence, instead.
> >>
> >> Fixes: 3ee01b8647b5 ("drm/panel: Add panel driver for ChipWealth CH137=
26A based panels")
> >> Reported-by: Aaron Kling <webgeek1234@gmail.com>
> >> Link: https://lore.kernel.org/all/20260727-ch13726a-washout-v1-1-bf869=
ddfc5cf@gmail.com/
> >> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> >> ---
> >> Aaron, this should be the 120 Hz issue from your washout patch; could
> >> you give it a try on your Thor? I found the issue here separately and
> >> saw your patch as I was prepping for submission, and I bet I was seein=
g
> >> the same bug you originally saw.
> >
> > This is something we tried before. And best we can tell, enabling gram
> > limits frame rate to 60hz on this panel. Framerate tests such as the
> > ufo test were reporting 60 when set up like this. Can you verify the
> > refresh rate on your device?
>
> Hmm, yeah, it was a bit hard to tell until instrumenting it but it
> seems to use a panel refresh rate of ~63 Hz. I do wonder if this panel
> is just not meant to be driven at 120 Hz though, since it seems like a
> very poor choice to expose as a mode with color issues like this.
>
> It might make more sense to just not expose it if it isn't fixable.

I had hoped to be able to fix it with color profiles or something,
since this as is does appear to push pixels fast enough, just with
gamma issues. But so far none of us have been able to find a way to do
so. Which is sad. But there may not be any other reasonable choice but
to drop the 120hz mode. And if that has to happen, might as well
switch to cmd mode and enable gram at the same time.

Aaron

> - Matt
>
> >
> > Aaron
> >
> >>  drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c b/drive=
rs/gpu/drm/panel/panel-chipwealth-ch13726a.c
> >> index 562dc573528d..0832e49b77a9 100644
> >> --- a/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
> >> +++ b/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
> >> @@ -65,7 +65,8 @@ static int ch13726a_on(struct ch13726a_panel *ctx)
> >>         ctx->dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> >>
> >>         mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x50);
> >> -       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9, 0x00);
> >> +       /* 0x00 (the vendor "bypass ram" sequence) renders near-black =
as green */
> >> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9, 0x11);
> >>
> >>         mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> >>
> >>
> >> base-commit: 8ef66514d7b993c9fb96a5886f001e3556610c1c
> >> --
> >> 2.56.0
> >>
>
