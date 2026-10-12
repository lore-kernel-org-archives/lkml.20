Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B134F24E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816069; cv=pass; b=upBRWIOIYldlIGz+XdwgV/J3VwJAIaxpwBKXpigRIY2QLhC6yj3acPLyOhAF+bi46rRWUwfShQBh2k+zcy6ws+DT8fw4NSqfnXTIUGTk3fGbRDuLs//shoQSSDXi2bLrkDNUKC6YJUtnW3VJGOy9pKC2wy0pYQtyL8lqg0IHyzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816069; c=relaxed/simple;
	bh=hVt+2VZkW4XSaJKirxsUTpM7f+JQAOjlXtbg/RMP49g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEP4xgr8kLlGI8zF4w8OE4O6QPelkzUKE6tXuABuFOzTgE0oOtPs6qUdUl9YWB/Ykhj3mLUX/SG9YSVAcvrqsxnbYRWIcXPQssHn0kcFqsXXmfs37AG0EbiAb6sUCiaTKOUW0fhtlNPn7UZ1YvU+PcPOvyXedO/wWyXf7JdXMwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5y9rFtV; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5y9rFtV"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ad98c3fb15so13275307b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791816067; cv=none;
        d=google.com; s=arc-20260327;
        b=iB6KD6Ys5FyecL8P0HAylvnCAntW0OAFuEFaAwlOl2JwaXELSVXrQKnmGQQ/32yKCT
         rmSDExLW0g8Rl4rnOorCTJm/g/V2Rqco+HH/pKz5am2valRR7oIV+zyf18TcW7Sg18Ic
         Gw2PlbwlXMwp6Jps7a8I3NNDiWpYGpJt8RplCcBTmDVax80t1kdMJZpavlzQ8CG9gaWm
         1OGHE5y6wuVithTtmYl+f2qwigyh5NIZhQxxxnZ8JhKFTXipgprXwWdW0QK0MGUEFU4P
         umN3ereo9SVb3FO5rQdqr8zzQLk9BWnYK3ITSFlNBVRUXfILH76pNmw4+emX5NmfdYjh
         UoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hVt+2VZkW4XSaJKirxsUTpM7f+JQAOjlXtbg/RMP49g=;
        fh=A9xPbL1naaRd5c3PGkj4BxpPUGrqnda9VTF0Ar72k+U=;
        b=B0uv1uH5pXu9243SUT8exj91Perb3fnNFJLcOT7pDVm+F6qlC631Rb0fYVdFMgGYgZ
         diAVxJpPeKwWF/TKS/CYKEfWYVzLKxYJ/oc/IJd/olPH603tX1XRrapGBvqjhajeRsU3
         2bHRCKaQL5ZWkgRIr0bycMgwh2DKqYf6bsd4mD55+GIyjPVpJxy+5m8XYODFTadf9npO
         ONEJhNSFTnzAth//tEdHAbROeCLesj4/oRbmLBxmmYJtUX02ZrHTud6cQ8fm4h22j2oK
         7LYe0p/KDQzlZkbp8AJfoto2b0CV6iMKhoA8QGK7N3GPhMWNEaeOGjPU+D/k3U9LNzjI
         fzqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791816067; x=1792420867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVt+2VZkW4XSaJKirxsUTpM7f+JQAOjlXtbg/RMP49g=;
        b=s5y9rFtVdUlUZVe2QFe7PNntJ4VD+CW25EMC4qcnLN3inOHGr44O1ZM3rup8DuohC2
         ys+6NgGIt+zSsWvhLJbMZmDdciyf2J8OsowHjubJTW2XQafjM2Xo2W75kDBf+I/qTBvk
         JLui7OW/dRXXM+ZSqj4R5zSmhjnvcwpqdQAU+8A5p55t+hClAv/uUySF2B56xJe/lr8a
         2JjrRTobJXDkDMYpBXKe3H2rK47bqm/XI97PH0rnIdxeVkxS6VyLdmpoMjat+2UT1W/N
         oKG0JF+VK4eTgckE+EDcica+UlHKGOZTe4kHsNa8CSGk8bICgMnq8kEvw/AC/nKMI5hA
         poog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816067; x=1792420867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVt+2VZkW4XSaJKirxsUTpM7f+JQAOjlXtbg/RMP49g=;
        b=ztGdjVjIWO2XE5Ih9Nd1tfMcOu8VQwzjACaLX2MRIQXGAYklK/+kyeoD05gwaFFnY3
         clVq/mE5eeOyOYjpqrYv2rum5bq87ZMlrAScKeSvgTtxYrcsBoETcvTnHSC+Itxk4iHX
         yoL3q6/NW56HiAquFemumQlqCyBqAKTJQS/mxglYyn49TfuGPyxuWX1i9WOe03E1Fhrl
         UkMu9a1MNGNCVcWEFldW7sI3YeUI9d2vf/Ab/iAlGkyTMQ/N+10N5nMGhI5rKbzXNV4P
         whAevtmgGWiByZrqgKXVtBAqTa4vRsxU7vT/CnMhfeSM2NK41lMjjlHFNGk+ae1byEwy
         kxXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwot3p7YEGoMrXPDi14COIRpJlj2XjZW7nmA2UWjhGe20HgzEf+R1FvegbsgVjYZcTxykvKeXoWgbt+FxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaxiRTLsc9QqUXkgDZNXy+zYkk9CizawgE2w8dzSK2sOo+QZ58
	cCpgqHGp5H+KiocRwaveOj7qSvUq+esIyJkLS6c+fj3yhUZ+SnR0SB5Ngj51mt7SE2SwZe5FsH5
	L6dC+DQkNTIZiXfeDplHVD8MFOqQFEABg2+KwgSPMrA==
X-Gm-Gg: AYBFou2IX5agyB7rZrQ2H8wj6+oJarxt0sDa/UNEhq25cLle0cUNue2ASvnbeDgtbfZ
	iFl6EqgLUzQkDgwlC1CTID7fiTmXfPAKJL25pNls2/Ebd4ydkf0vyjCc2HyLoMEqg2n0QC0v5gq
	osGvQEX2yhvLAye3M3h3YPucMgAm8537+4pU+65MSZte96/qjq2hyZQfWXadqhKkFsGY8IEES++
	mH1DCaGZBxp03WBiK9jSeidTaGfqjCUPCUjf8fwfa7PkosjwC0qAygGFcLVoyz/0bd9yEAf+6LM
	kby9inXrIWNgNMhZQhsT9dApbPUY6jvfxni5G9SGTQ1nVrTeWG+8eJFX2eHn6nDR
X-Received: by 2002:a05:690e:1907:b0:66f:b528:cc51 with SMTP id
 956f58d0204a3-6793698594fmr4322156d50.21.1791816067411; Mon, 12 Oct 2026
 07:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org>
 <CAD++jLm2dVVKM075MDoStTudO+2hdECS-XucFiMGnM1H-Xk=TA@mail.gmail.com>
 <CABymUCN1oxuqPi=s1cpBHvMJorHN62uieD8Pf=Y--WBPp-=NHA@mail.gmail.com> <CAD++jLnkr+M9Tn_zAL8+owO7H706XYSMosSz-1D20rwbUukQ3A@mail.gmail.com>
In-Reply-To: <CAD++jLnkr+M9Tn_zAL8+owO7H706XYSMosSz-1D20rwbUukQ3A@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 12 Oct 2026 22:40:56 +0800
X-Gm-Features: AclHuK8DXIfIQSpEn-02OXtKO750H1QIkJhmjnTnvXTflrGk6XkO0SctyamV-mw
Message-ID: <CABymUCNzxWhud1qtv3os=f2txZ=nrTdMrQ6BOYkbfK87D=AnHQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 DSI panel
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus Walleij <linusw@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=881=E6=97=
=A5=E5=91=A8=E5=9B=9B 03:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 30, 2026 at 6:31=E2=80=AFPM Jun Nie <jun.nie@linaro.org> wrot=
e:
> > > On Mon, Jul 27, 2026 at 10:09=E2=80=AFAM Jun Nie <jun.nie@linaro.org>=
 wrote:
>
> > > If you have a datasheet for this display controller, then please add =
some
> > > one-line comments before each command to explain what is being set
> > > up.
> >
> > I hope I had datasheet, but the answer is no. All I have is an init seq=
uence
> > with the information in the above macro definition. Let just live with =
it @_@
>
> I would send the message "upward" that you need a proper datasheet
> for this, from whoever wants this to happen.
>
> I have seen from the presentation that you will be working on
> compensation for chromatic aberration for this device, and that is only
> going to have a point if the color representation on the display can be
> trusted to begin with. Which means
> gamma correction. (Which we don't yet support in the panels,
> but hey, another opportunity to be first!)
>
> Gamma is invariably going to be one of these
> "magic commands", at that point of depth you really need the manual
> to see what is going on.
>
> Yours,
> Linus Walleij

Compensation for chromatic aberration can be done either on the GPU,
or display controller, or by panel. As long as the R/G/B channel
can be processed individually, that's enough for the aberration. I will
work on the solution with processing inside the display controller. So ther=
e
is no dependency on this specific panel.

Jun
