Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0388F4FD28B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739190; cv=none; b=WqXEfnpXmvd0xhbbAVKCJMCgpX6X5/6hpBcJAgikXRYlDRVeNeE9+Ez3KjJq1EKZxbBMR8SwJMZgRZLbUJfpBseQk/i0PaCrC9k0Qby1AKGaXonf2N9jDmtg51yyppwhvIpSDSpGTpon2EemSs9KK9RjaHVf/alO06bssDd3ao0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739190; c=relaxed/simple;
	bh=2qSOzg4sizQOzLLpcD7UP/ZCzP16AZ3iwLyfpqnq6bQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbsxQEnuL+LdC/NXGb/COn9JpukohOUm1GdV35bzUCA83WghC/YiKHRo/Cc4wFa8FRVcWHoycFWzDsDK+/hokAn0rLVuJ/qzAry4uJwsXAba83L7oOGq3eswP2PH5OHkjlU8nk0bpjeVCOGZ6/KwAiUrvNKA0KgtOVjXWPLGoow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U8OG1fpB; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U8OG1fpB"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso552508b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789739188; x=1790343988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEr+Jllj6UvgKGonQFQTN481MqBknHTPJ/e8FyyBLLY=;
        b=U8OG1fpBqKzHgxLtAhjjjrutpFfbebKp5c8SDOLwsGXCjqOShWFOviqsbbkxjpTOkZ
         d98v4i8IE4eZ7l1Bo1IXYfGfLyA6Kk65sx68DxRz+keq5H65QOj9HwUxY9UD03D3Im3Q
         fMXbhXFgsASb88ITxc33ozQ4KF1Csl3aTXV+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739188; x=1790343988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LEr+Jllj6UvgKGonQFQTN481MqBknHTPJ/e8FyyBLLY=;
        b=OX27rll97g1hal7mozgO7tJDpsjHuo+rZwjPTjQqIqFOyeiTAfrYa+mu28W2bxmS18
         VZ/YKmDS67yKnuDBOn6rsbkwc29aT19YOv6E9Q12VarxdIAoSduyJEll/CAnN0jwMb7Y
         tJgq2tv564Mjivqjr6mN0PPeXN/YA1nfNXkbf6vjVg+0AIoFP90sj4AlWVsNh4Ud/p7u
         FzBCj3ARbu0kCBzD3kMgqMcil0hELJuX+1VXXWn3PeKiBb7OmuZnyViOEsjPSA7wDnph
         loLnZMpNs5CUXS1bYy5bp9D/mJvjLJeF5+CD1HPEFHIl/hPwM0rQRU+eaeCFYBoDCoM5
         FRHA==
X-Forwarded-Encrypted: i=1; AKwUvBwNs+4vOlYZHczSAE1U8IEGNO5+Vrrw5qNHdJCKTQsG8QcM0OBEfrAX9QYql12oMY8+1XhOVo88Vnbzub0=@vger.kernel.org
X-Gm-Message-State: AFuF++nRm2WK2E8+l71ZqrMYpRYZJtlA/fWB+5jtnISJZBJt+1i6ri31
	7TkpETnVcxZZ82M5DivzweUYUfWJP1dOCNa2Mpul0PHYzTb8R0BnDhj6kzRQXVFaTnA/vfWslGp
	cHFCN4Q==
X-Gm-Gg: AYBFou03hJLudfcJXVb7IMufg+zum82wYyeKAPM8xlPEGc8DtIL7uwqtCqwyoSYJWbN
	oK3FxBU+c2G+jIARl1XVXg3qmSfuIlLlc6k2eLlOLs3KtOVUc6YkbgaTnQLRxZqGyA7rOnDuFtR
	/xvZrpGcpdgTos0v+0iW5kb5zse1NhBLABa1PA4PDCrixPuGNNK9IxQEiR3+QlmRtfUT4+KJ+PF
	0oqmP8WxjID+AdWiGX8d5XmkhG99t/Aefdcj9Z+bF7dwCH5XySqikyxlw/AuQdpm7Qy+fxCVdji
	A0aAfhTaPfXYhY6oE5AV45LfVaifr/c5/uKCJSfZXAZ9wwzBxP6SYFbomInQ0t4U2fOWJhDTN2b
	4gu3/cDgsFRS800l3dGj4pkYSYTX6tovY2iSdKNlAaW7dNs1FbfVbATt1bv13vrFo0MkoNB+Psp
	4Dh+Hu22cgEua41kg/t78mnsjlxNZNsQlzYX14SY+Lg95HJAaWTdtTpGvFjJmXGfqKuVcNFDuKm
	hPKRq8rvqP6Xj4Bjhn0z4hL8uloJn9ald2V
X-Received: by 2002:a05:6a00:4107:b0:874:708d:b620 with SMTP id d2e1a72fcca58-874dfff1f30mr5254409b3a.30.1789739188168;
        Fri, 18 Sep 2026 06:46:28 -0700 (PDT)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com. [74.125.228.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dceddd1csm862329b3a.28.2026.09.18.06.46.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:46:26 -0700 (PDT)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f204f6so495234b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:46:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy2slEQFBL6zI6t/mulUnLBvTFhj5cYwSVwEP2ZrkwfCSNt08cvp3oEm8CW04EP9uMh9q6FzYGdMFZ4lS4=@vger.kernel.org
X-Received: by 2002:a05:6a20:c792:b0:3dd:85aa:d269 with SMTP id
 adf61e73a8af0-3dd8c57c8b3mr6488270637.33.1789739185437; Fri, 18 Sep 2026
 06:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aq0siVcghDe6x9cs@stanley.mountain> <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
 <aq06Kq-3n2R79YZL@stanley.mountain>
In-Reply-To: <aq06Kq-3n2R79YZL@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Sep 2026 15:46:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCsVgGsbf0P6000Jgw=yCop580w61_BaVE6OxnBNXXDfSQ@mail.gmail.com>
X-Gm-Features: AcwNN1W7JB6JPajEBAwfNwsaOz6EGNg1kBmmMiFsHZqDGyowXMecVDSoVfzZz04
Message-ID: <CANiDSCsVgGsbf0P6000Jgw=yCop580w61_BaVE6OxnBNXXDfSQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in uvc_mapping_get_menu_value()
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Fri, 18 Sept 2026 at 15:18, Dan Carpenter <error27@gmail.com> wrote:
>
> On Fri, Sep 18, 2026 at 02:59:29PM +0200, Ricardo Ribalda wrote:
> > Hi Dan
> >
> > I believe that for all the uses of uvc_mapping_get_menu_value we are
> > already doing bound checks:
> >
> > index >= BITS_PER_TYPE(mapping->menu_mask) in uvc_query_v4l2_menu()
> > value> fls(mapping->menu_mask) -1 in uvc_ctrl_clamp()
> > BIT(i) <= mapping->menu_mask in uvc_menu_to_v4l2_menu()
> >
>
> The problematic caller is uvc_set_le_value().
>
>         value = *(s32 *)v4l2_in;
>
> Smatch thinks that is called from uvc_mapping_set_xctrl_compound().

uvc_mapping_set_xctrl_compound() are only called if v4l2_type >=
V4L2_CTRL_TYPE_RECT and then v4l2_type != V4L2_CTRL_TYPE_MENU. So I
think we are safe.

>
> drivers/media/usb/uvc/uvc_ctrl.c
>   2772          data = memdup_user(xctrl->ptr, size);
>   2773          if (IS_ERR(data))
>   2774                  return PTR_ERR(data);
>   2775
>   2776          return mapping->set(mapping, size, data,
>   2777                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>
> But maybe that mapping->set can't point to uvc_set_le_value.
>
> > In any case, I think this patch is still worthwhile. It will help us
> > avoiding bugs in the future (have you found this with a new test for
> > smatch?)
> > and if we go that way it is probably a good idea to also "fix"
> > uvc_mapping_get_menu_name()
> >
> >
> > On Fri, 18 Sept 2026 at 14:20, Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > The "idx" value is a user controlled u32 so we have to bounds check it
> > > before calling test_bit() to avoid reading beyond the end of the bitmap.
> > Maybe change the commit message as well to avoid stable cherry picking
> > it blindly (sorry seems like I am more picky than usual  :) )
> >
>
> I mean if uvc_set_le_value() turns out not to be a bug then, of course.
>
> > >
> > > Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
> > I believe this should be:
> > Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
> > or no Fixes at all.
> >
> >
> >
> > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 3ca108b83f1d..f157ed99be4e 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -538,7 +538,7 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
> > >  static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
> > >                                       u32 idx)
> > >  {
> > > -       if (!test_bit(idx, &mapping->menu_mask))
> > > +       if (idx >= BITS_PER_LONG || !test_bit(idx, &mapping->menu_mask))
> > >                 return -EINVAL;
> >
> > What about using BITS_PER_TYPE(mapping->menu_mask) to be consistent?
> >
>
> Sure.
>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda
