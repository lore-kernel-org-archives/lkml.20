Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D04E30FF36
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587198; cv=pass; b=oekz9ISUB/2tYXPmMoqgKTdzsuwFSybKt420WLNV7BThc0o7mDqu1BPEK6M5iouEysFIiSn4LOP8X32sP1iC5k5eekBVpZdAfIV5StCyG+rVgzE6Qg6rTornW9P7p9AFGp4y37SHwRd0ffqlxsLmhF9UQ3+Hn6qKg8lBYOGr79M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587198; c=relaxed/simple;
	bh=kNNTZdNo9rMeYPIlppeyIuQw9iUN3f9leJevelva1Lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOTJogTG/qf7YdfZOmPFTPNsrFOyUVYStv7S5gPa+wV/nCJ/HnY+gO/6is6ppjxSZt5JrOut40FvXT8jpCK+/cz1hGyQGFAobDM3RcexyNxjO/6va8/JVu7Dp81w6pNO34DNhmYAOnbGFXBzWZpJ0ZXRohcKB2ap+KDm0Bx8Wf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdZ9GVvG; arc=pass smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdZ9GVvG"
Received: by mail-yx2-f39.google.com with SMTP id 956f58d0204a3-6755a6109c1so5453d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790587196; cv=none;
        d=google.com; s=arc-20260327;
        b=XCe2Nc1eZIGHvPUFGkSLoudsfyfREBIGxwpO84ngW+Zb8PLRpRI2T7WwPHcoLG3ENa
         cllWkfE4gHJF/5BDW0KNq9tjWbA/EL8GSxwm4u4dtA5XKptf6Nx5bhogSaT0t0/bml4V
         b+1JzuEdJoYf+mHnx9yGAvTCINX83uq1WXINwl3ghBs2WLbPlo8Euvuoa1CxKMeZLbPz
         SyEK2y/odpvCyr/n4jtZdXhnTeED/cLJ371HefJrIr92SKZZi/yZ2qenMZV5xBztL7KS
         5sCH6dB8k8vBcq+vqF3GzAePxu42w8qPYdBCKGEOfpy3F/4mDtnR98VXJuOG0PFtxAlx
         lB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kNNTZdNo9rMeYPIlppeyIuQw9iUN3f9leJevelva1Lw=;
        fh=zQeemLdkMfTgiSj38DX75Fg5dNplpVs+HuKyLTGfpnM=;
        b=svt/9n965RqeW37+hD4Emf/B7QzfnLWf0dPdpsTXgneDDgDVB/gfzV4c7UoJ19joZi
         YBhMaWgCTPOD7MjtDLEUkQI/VA2EmEEtqSd+eD2U923c3ZProS1i18j01Rp+of3OPocj
         vHhGrNXfRn9q8lW9kq/azKPyJF11IbdOCqMcMZwvSFjwaLkqNCZHB7MjR1HzzIoLQDoq
         0PQpcG5usH+eD1gpBvrgK5mwk6o9itMylKyzdIDyh4QFnl9Z7Mm7CJkgdtBcooonXqVy
         F9+lWsOmk6xPOCOL865uavXt/6U2f2L+rrA1ZLCYoiCNKd09BjXO/ZX9PJBfYEIslzg2
         2jcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790587196; x=1791191996; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNNTZdNo9rMeYPIlppeyIuQw9iUN3f9leJevelva1Lw=;
        b=BdZ9GVvG8lO7hUf0wMTknnYf002UTIyVncj5oMHCLg8peEf/Qii9nXOgRlal7yC+BL
         rdYFJY5wq5vZL4CgkuDRXxVui4XA5EZ/L9LZ+R1HNlInXEvBtsL+tdOLLVqyEYt2Rc0P
         NfTwQrXEMALMQTyIL3oxlAaBENC/jjyu1JD17iRJa9niQM5uy5pQAG5qy+3pN8YzLdUc
         bKsdkGQ0b8mNb3lUzq15NwEyrJwjCYLtMxACVVM9YxvzbTVTnbeclmlsnI2Nlj5rjgJi
         xdaXz1QcmLBRrokqOh2D6z1WQ65qiZVu3dS/OW1JzluDeb2GHGvgj0oCwKr0x/YNZxxu
         GOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790587196; x=1791191996;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kNNTZdNo9rMeYPIlppeyIuQw9iUN3f9leJevelva1Lw=;
        b=Q+SSjR3evfXE8COJ8AVA32pvH7rZ54+Qpa3nrd0Os+gCdUKzxfYjBZOl2PyVDXo1Kc
         nHariSlexLSdeLhf+GMfDbOi/brPBoYZdk5RuIJQD3Xzt6NHcRnrmRfz1904cwW4i8gF
         eOaSdlIil8bGLcP+TI6Q0jt2Y2sRjhUekAkax3ExffXfoL3UAgoOo+A+5Dil8aGs5B6q
         WjjITWM57d/W4n39CRgTVFVyk06SbA34bWXM3SJG/Xo22IAceFvzY2Zbi13KtBf9ttig
         giGBL/n7s6dVxgO2VcKarsGJa9VB0nf7wo0mT+rbpnpmkHqmQf3aCOuqyglDBagAiG3U
         kz4g==
X-Forwarded-Encrypted: i=1; AKwUvByt1X1/O3OsokgVYXrXzpyydLe0A3BjALjRvOKu0BElf77ajFRnUei0TtdgkzNasygCGH8FqzwXGs/Nk/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDcd1f1iQ6vBYEXQS3/7l5Rdmc3y5YL4XHON5akPb9VEKpurxD
	KM8G5TDSTElv7vH82u2O7jPRQuGSoOaP1vB3vDxJa6l8+elaTENkFYxGFxndMO9H2TNVeZvQzyl
	JhHVpEn+gAsdJmkQukuD+DHz/tzlgoag=
X-Gm-Gg: AYBFou1zyTqJmmd+wCT4nWvF3UvloEvGFK/jntfUhY6U93XajQpq7zCYKv8vjLydnuU
	5B8VKq3dXK+fRwcvj8T6igdWt7lTU0JnzK87J96rU2cEg5MHM8WbNm/Y1KEbsD2E9d+ThAvXDG2
	KrtuOvK5W1mvCNfGULTME5gwvrhQJlVfiH6tpauN6jDweQgWgNf812ZvBUsCdwbd51hqew9Wk48
	H1MlXt0gkDT49V6tvQRbvn0JCnFi7Pcv3fcUee0wZJoUeMM1BN/mFHMpeH8kf09djlfeLz5SAw/
	oH066Z/sbFhXETUOka99fDXPau7MgmKQnRh3tg4HRvMP558ngOi7duVjO4W/D9mVhDU=
X-Received: by 2002:a05:690e:4089:b0:674:aae3:8528 with SMTP id
 956f58d0204a3-674aae388damr2080262d50.37.1790587195700; Mon, 28 Sep 2026
 02:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927-pvr-fixes-a-v1-0-7f5b18ab989a@gmail.com>
 <20260927-pvr-fixes-a-v1-2-7f5b18ab989a@gmail.com> <661f8ddfda9f5cb3f0c23d4594fa912b9ef2e2ff.camel@imgtec.com>
In-Reply-To: <661f8ddfda9f5cb3f0c23d4594fa912b9ef2e2ff.camel@imgtec.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Mon, 28 Sep 2026 18:19:43 +0900
X-Gm-Features: AclHuK-TWrdXWb66WfcrQ4B5bq2__80Eb9x9toN9UFV7dUY5ijmxw7Myy-UKG4E
Message-ID: <CAKbEznvPCFpf-HqD95v_8dZSZna3BPNZcrHjUZReBHToROPROA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/imagination: Fix pvr_mmu_map_sgl() overwriting
 its own error
To: Brajesh Gupta <Brajesh.Gupta@imgtec.com>
Cc: Luigi Santivetti <Luigi.Santivetti@imgtec.com>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"airlied@gmail.com" <airlied@gmail.com>, Alessio Belle <Alessio.Belle@imgtec.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"imagination@lists.freedesktop.org" <imagination@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Thanks for pointing that out, I should have rechecked the tree before
sending v2.
Sorry for the noise!


> This issue is recently fixed under
> https://patchwork.freedesktop.org/patch/755273/. Please have a look.
>

--
Thanks,
Gyeyoung
