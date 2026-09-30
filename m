Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DB849DB90
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765278; cv=pass; b=bsvZ5hornTR/9bkMplmxpQhlmb3p26xt0+FEXBMeK3Bm4ivrNwJaj1AQ99JPYinLGOSPUpqNQPBMO9z/AiuIsfWAIHwIDO7uRaxmgNkru4lL8gVPN6HYK8oJJoqWnYS416bIe1Bfyhm/uqFKXhxG1wQ9SxgY0cJv8cI8o594pPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765278; c=relaxed/simple;
	bh=BJbbh5rIl1dEuHCd/t+PuKNfcL4FcSDDMLm4FZ7TkbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5eefoDY1Essrhn+wsXJY8E31FeHhL6Y4Vg34au2QcTuDBpvgeVf3IMkXps9eqgTtB3u6GFbH2IU65hLGbr0H2nemVgl4r5J1i6NUFowKEEVjmw5Hwud4gcvKVUm+M5z9C1Z3KZgZirhKlsHBYANMGKjAF6OkTQQhPOyDuJQY/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qP3uvbAJ; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qP3uvbAJ"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b355ffso2203902b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790765268; cv=none;
        d=google.com; s=arc-20260327;
        b=dYptY6ZsZbq+WqFExmk1fDzwcKhEhSUjwHJJM95cRI59WewVlqug6MBGIlxV4elLar
         235VcmwUWfCJk4aWkK3gJ+vsUxTfXT411XIlMG356Rc2X7mR0fY2Te6hv6+bZ+VXSbnP
         Bw/M/qMriRMERqnKl9B1tsaGuvWO4CJK4YgqOyIj+BKu/c1l0FxwdouA0WM/8EgBBeLd
         y30NQXkFzekIiPh02hNkz7nTThh4i/pzQmE7XQEIS1uyKdkHnEnmyYAGy7vMEGrJypCP
         kp6hna4MrFaGP4gST+ex6YkbmTJRNop4vdIPTHwt6pcOsUr2pmfH9T2Y1WKx5e2+dNT7
         WA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=;
        fh=a2S6TtF7gcK+hhr6EiWPy4AV1VZ/Y4GyCv4B63iwOGQ=;
        b=IZiwxl8XNYa4wMlRByg7EZYLNDtNxk2sCuVppmAsO3klX5BonoOQpgY5K7jWkEcchx
         +1upISShv8gPcb0KQ+Ovb0HOJQzK0QNZat6zOGDG7K8fENe5x8s1SFaz+oKK2azRj3Ge
         liae+ImXyL5+7Ctxgofd84Oi93P7u5txsYnA6nonkLewx8fuPF6M3SGFT+gfwkmZO35T
         0FvnB95iMPvQL26cw8kEjMG1HESIe9u1O9g02Gbti83JU++/TOg4XJthS2PorMgvx0E8
         GD3W23/bZ7glvIBv+xz75qJlnqHhT2VQ4W8RWTqnky7DaRjKyuLuZw+dC30MUKuQuX6n
         cXvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765268; x=1791370068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=;
        b=qP3uvbAJc+BVGMRsNqrXSmbmrVa3FHC242tujymtCMQZy5pY8KR4iEIX4tfjUk5E2X
         03V3Z3I6pM/K2uQmX5B9QmRlv/IFau0ifvJqUx0VGpl/735baM6JgLm12MWESCsgaeZO
         sk88OeYx/0dyvyw2eHY61UiJQquOU8yK1U4dxJiEnScX4YptIfZEyvayf/+5ekFB+b4M
         IHtKYTctXJqMWEOY/nu32C4yCBm0/V5ATDL5eG6iIlkFv2NVyWln2wj3iqqi57JJ5dcm
         SGIvKz0l4mcL+ZzZJ8wrRvdf+s1QzaZI4jjnfulgYZ/CGgP307wuA6Mz+wpFnTRZLQyJ
         o1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765268; x=1791370068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=;
        b=mpDysVHi+rPUM52GYZS/pvmTimP4HmJyjtfkdHqFwyqh0UgPwGSJ+1s0xaHKZ3Myl7
         jL29WW/OQdIkZjp6R56+5qNARDOYWg7KHcTBp7GcZY4Z3rWwW4EbNWc+qqbNowtaCwWJ
         htEkFIXgqj5s9Ue8XKRif4A2rEsq1gxLbWFVfV9Oo3RPzGIEc+vdryv0ZMLgcpEODjw2
         Os1gQpzNRrImEvFoNhly3keVC64yfWSUaGJeChKkvbdZZL0nPTaZb8+aHsw7q/7YJl3u
         S2S74WMiW4R8FCwN5nyhpopZG++KmQls+5Opvn4qRS/WmS2Ueew0yLa5530nYUauze6/
         N2sg==
X-Forwarded-Encrypted: i=1; AKwUvByBgZTl/Ls69Y3ffkbM41DMiilFqm2adpZ1G3nEmBAWgASFe+lB1OQ0gZ0Zcijt/mGNeCksLieCoW7NQOw=@vger.kernel.org
X-Gm-Message-State: AFuF++mMVRXsFLvUvCkibn5Y9oxGdFx3Uxwk96ZA1CU98JmYv+LrgghP
	pCMxOntSZ38VTNDWRXZm2o1mI9/Tu+jtCcuooZ94Dcdf7kM1UK3kjrOZQoxYjPTKvI+Macjb9kz
	+H44HAbbtLTnvsjYgxyrVcMV35rI36N0=
X-Gm-Gg: AYBFou0t0mVh38rt8xonfGKojnrrtdK6/5Gs5+YRVhrlrqidKjVpWTSXAR/KKfkjE/c
	UITp6J/F28B2kh/8BnhXwgNwC7+IRVs1Wx0P/ZQ30QCX3hn7RvyJKyRqB6sogqaMkkWBjKpo93+
	TyjWxYEwWVttAcsQHiPWKHLImC+fhdHWHvM6Snyo6vylsYkMVX7XvwLMwj5VgkzUvIkgOwL+ZLB
	VJd9usimWOxBEdHiZJB4JX+AYVoJxp2PAGgjnHNrIEKXNoXrCVilakDf9nGmFJVpYaIbdXzM0N5
	9J4eqLbearc0u9saTfpfc9yf6yFISXDGkXrdAvFGomHfm8TZb2E8R7wTUGMr6tD0AUZjRDo=
X-Received: by 2002:a05:6a00:6c8d:b0:880:3b31:a4bb with SMTP id
 d2e1a72fcca58-8874a89ae36mr654876b3a.20.1790765268145; Wed, 30 Sep 2026
 03:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927151016.186493-1-pmazzini@gmail.com> <20260927151016.186493-6-pmazzini@gmail.com>
 <20260930-camouflaged-koel-of-resistance-7b09f5@quoll>
In-Reply-To: <20260930-camouflaged-koel-of-resistance-7b09f5@quoll>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 30 Sep 2026 11:47:05 +0100
X-Gm-Features: AclHuK8o0ZcgRpk54PvKUPvKEFYR13nUvSknbUcihyLHytfHbaM-Aa-FPmvKY64
Message-ID: <CAAxh=jsr1M-RHfqPF-hgQnM+RmH_D82=YX==Vn5-r2=1AB9eMA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks, will fix in v3.

Regards,
Pablo



On Wed, Sep 30, 2026 at 11:10=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sun, Sep 27, 2026 at 04:10:10PM +0100, Pablo Mazzini wrote:
> > The B288 RTC wires one alarm interrupt, not two.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Seems like valid and unaddressed comment from Sashiko, so dropping from
> DT Patchwork.
>
> Best regards,
> Krzysztof
>
