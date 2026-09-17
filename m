Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FFF4582F3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636942; cv=pass; b=AKCvDWUG17hileRMLUDgFcOLxKPMeCO/BVe6X9l8JGkwVHSoID1+Bry3ftdPbLbBZ+MmwLlmIOJPlz9sstagvXeWe1Glaya9V5qY2qG07eKJQLLsSmPTLFQio9gctWJORZgrczol6/4k/AafENOBMVFn4k/nQrcmW0AFrWJ143E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636942; c=relaxed/simple;
	bh=q+ma/8aYfxNGmFq5c8KlrcKT51onboM1niI7EeZQn40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJ9mvPOuRNZJZNEZWaNxDXw++4sFW/iRe2HFb5R2yoaDsSUm4W7RFjLxOSgD1pKDKnZUYrbtPsCRPj6gcIX+85ZJbOb5+Q59tKus7LAJXF/IbuxDrGmuqKiDt+kQaLn1hjMQFpXcor3UBrMid2MbL3VNE1iz4C19kk6PkGso8DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uiwmo/bP; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uiwmo/bP"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-80a7469f5e9so393360a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789636940; cv=none;
        d=google.com; s=arc-20260327;
        b=RTvIeROFWVOeBP3nylBXTaspNZq82rKL8c+mj9waQa+FGFvNOwsxju6VFm9lINMbeP
         NH7bne3r53tICk/4ikOP5Wly3pJ/2WUpDbCCpPs12WexFGrN5rrViAaBCLrRvBai4ukt
         mfikXTbwC4WDA0drZ28DJresbz9rB1ewcdcRE1h8jclkIVygnxXILBILUJQiOnfv3PUK
         PBN1p72Vp5+ztVKa7yFa7UYVkf6pJ5VLRKXBgsoY9QPkqgxa+GzvEzTcx/ZQtZQOSD3P
         Bkzx3CnRnd0Poex1CioiGom5Ra0bglUw6u6T6+UZ8DzffZUFixhTIfrcSg4iT46Xighe
         gXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xML49QZPU1Thc36BE9MAJyCWem50hfkHhyKIdhFthUI=;
        fh=V4aNWLLjNLtJ6KsFIcr6qKEQ3bO7daSifcu76iWwvFo=;
        b=AMTqlatcl8GDqNQFGxlDSRZsz4CS3pocYGC2nL1/9re5g9F2+1erY/F/zY7ssR7qbK
         qVjT6g6Okb87127qxntPjyy4qOsFnMYhxs1hwjESuXcPeZndacHPn8lyrxWr6odp8HkR
         Q6NY57NyEWGH//wk6YRxsGhcAZH+Z9eZ3ZCIKhSTJiKJZOXC/FPBls/B4WQP1zFcseT/
         BLuR95AYpDkvR+8K9PD/fVZUrgXuLJMYiylRzeBhYdAzEmtUMSLIiCUI9Thv8/3ljIxC
         KGJon3MGUwq/gYE8U7DJj6BoH5Jtt2BUGDIanLbP6SP+qsnLK+NDlfyyI24hyYbeafAV
         nSlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789636940; x=1790241740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xML49QZPU1Thc36BE9MAJyCWem50hfkHhyKIdhFthUI=;
        b=Uiwmo/bPg/BQ8jwOEEcptdd9E7YXNzU0Tft8OpcdZDC0+gV45nWXX9imHV7gAMXRQO
         P/1RDTZj91oA2Inh7+JO10p25ydpYM2/zG65P+hBsHAT1ZXUvArr6br+HiScgtDRRrRS
         5hMRspONgiG4dhvbdqBvWXZX/HIWL0bCT8fGrz4M3ttCnYNNf9vAAWgZyywWo6r+t6lr
         DvAl9HM2R8qYMtT1Vf91JQIbUHl+6r6ffpZz8xiNtD0jsbkY4yeQaYlukE6j2ZjUm6Is
         yyrDG5i8br+LkIwrB8WsyEau8S73KLKiNJqo7duzFVAbs/+tFGUQpn84dXK6axsPmk86
         DP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636940; x=1790241740;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xML49QZPU1Thc36BE9MAJyCWem50hfkHhyKIdhFthUI=;
        b=UD810AfpiFMIwPam9trn/vMYARkoMu3wIdy390JeRl0NyjZ4PJ6OiNdttYjLvlZcvc
         7qLYBGdS0q0l8IfuFsR/a/FA3JACvspOWBOzCne2GpbvhqIjJWH8RPaozQz1tzhhuj5I
         tsAKfhqhcyZUcDYQ+9dwOzYWCaE6VzkhvLWHjPpyuFE+F0sp7p1tuig5Y1s4AKRFl93n
         T/hDyheHJd1rKho12WFJiEOIvMCZ4vqXKlHTgwzvOotdOpJJCewchjex1VYDHjg4yA0i
         0NnUt2MN22BfYajdyPXMln2euzzM3edrS2wR4g472VesN20+QVgkEZRpo1uO21LYuif5
         gY+A==
X-Forwarded-Encrypted: i=1; AKwUvByltyUhzVz7XOv/tZ7D278sdlJHOSTU1Rek/+I1Ek1cvUUD/qoDB6q8q0wYwMJJbi/3sslRFqox697inhg=@vger.kernel.org
X-Gm-Message-State: AFuF++k/XNdxUvpk4QwiaOE55IB3lOjxAtDufhIAVuEQRJfCySez6FnF
	N7ZC7eKrVL6PVpp2siwytFVQ8E/RYbxnwdFe9zWUzWiIeCV65q0D4Ao6sapZunOMCmHcK7NkkRS
	FCYb1iMXOPdugzkVg1k1wrOgm0BkQhB8=
X-Gm-Gg: AYBFou2gzF/uZslVsOjPrfdVzzTDTkFMSGl7dLtT/ZYVPqQDmRNfW/bOxcpoG7jAIXT
	IvLDBLB3/0gfYoWorTOL/hHL5V1uEj91VCSTxB1us5YQkRo6WoxTlGTrWOoorWfHfxhset7dlCi
	kTVYlV/7GqGyQV288RARcBzAroOsJP+GbG45LvvZdpsG79tEdWSKwA1lENfyGAcfM1cCMJ7jAB6
	cgLYTDToaL5RsTceaflo4W+KZIu4k16vZ/q4nID+rjqbTmvgWTn8WGk8sDWbVcCkLp48e9xJOwe
	hRs+eb6z08qEhVVXMNicw4NGtgS/bA/bAT85HSx3SwR8V1bO/Of8sUGWA/es64ab+iuAmiU0Es9
	BB+Nvq2VGEQSTBbM2npOhW7RxBnf4bIPFLY1ewEGw9A==
X-Received: by 2002:a05:6830:4c05:b0:7fa:ac4f:7a2 with SMTP id
 46e09a7af769-80b2fae21b0mr6132293a34.30.1789636940009; Thu, 17 Sep 2026
 02:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829004608.25252-1-mikhail.v.gavrilov@gmail.com> <20260829085941.106318-1-mikhail.v.gavrilov@gmail.com>
In-Reply-To: <20260829085941.106318-1-mikhail.v.gavrilov@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 17 Sep 2026 14:22:07 +0500
X-Gm-Features: AcwNN1Vv-J6lv17tD-bMi7gxggeLr8WQiXsU2DbcXEie7e_OqjgYjTWegQ9t7A8
Message-ID: <CABXGCsNQZY+g5AB17yiZP4aD3eKBpNWWNqcOL3_eh5JLxp=H3A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: add missing CRC engine 1 registers
 and masks for DCN3.2
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>, ChiaHsuan Chung <chiahsuan.chung@amd.com>, 
	Roman Li <roman.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 1:59=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Opening the CRTC CRC debugfs file on a DCN3.2 card triggers a WARN from
> dc_helper.c on the first attempt after boot:
>
>   WARNING: drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:53 at
>   set_reg_field_values.isra.0+0x30d/0x730 [amdgpu], CPU#1: cat/58468

Gentle ping.  Is there anything you would like changed here?

Since this carries a Fixes: tag for a commit that landed in the 7.3
merge window, I was not sure whether it belongs in drm-fixes rather
than amd-staging-drm-next - happy to resend against whichever tree you
prefer.

And if DC header lists are easier to regenerate in your internal tree,
say so and I will drop this patch: the WARN is harmless in practice
and I only sent it because I had the hardware to test it.

--=20
Thanks,
Mikhail Gavrilov.
