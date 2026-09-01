Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D294A3D26
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295155; cv=pass; b=KyASp5US9p0LgAT6xH6594t36th5GsvByd6UrIVse85hIzvmGpDtjlXpRFzhCh5zAi8RQdaKbN6vLoXb7OSPBihZ+LOMFS8dNJ3lrQRiUTK4ZGYvapktXrmYJBE5zsQ94/IRqYEp7bh0n59OpAqaFVymB0GZI4iMLTGRn/xiVh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295155; c=relaxed/simple;
	bh=zMXQqnAx/G3j/QNYM2LWpXw58ytOME0jkznw3ohEhIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeKi/5LriI+mGo127u6TnBFwzXigyDy1nG9nF4+6QskyPQl019mvQ3C+NUDMF3sEtbiQTIW0e26evSvJx9u4yvmwrlOyz3qZywJu/Wf6o5EgcRaJxgPE/EShf55AZysioDC6hc3924chEfNqXYj/Hbxz0FQZYU9VsKCzRkvWtAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxrvSSNx; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxrvSSNx"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a668ce86abso511222a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788295152; cv=none;
        d=google.com; s=arc-20260327;
        b=VMmXpvAToiwwIMamRVROLVcggoTah09czIAuXQbwaVDBRPIp2V9n3a1AbJepXTHpO1
         tkjwH1eR6ou4jBv+ctrRVfEAk0l7uGlnl7zj5c6YfvRAqqgRs6pBu7Qq8LB9/JxJ7gn8
         C05G7mn1SzHLNAOOOn8dQ+ME2u9qTOKGR/tTNVFTwPt8P1YVMm3tPMo6q8rv0XkzCfR/
         Nbet9IVAxTLyVIYl+eyXac/jNWEirrE5L4cjiRopua6L/nMOn0qjNXerb9ZeprnzUhoe
         rU+bhheOIQFB6HPzXV41lNuvxtAiBLLOycMMJopfITERQTLM3WcO4RxAVyIL41VxylpM
         7Qww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iMSVbAMMClabJnl3yUfS4i27AaasElWu73GA2BM0Mik=;
        fh=Od34XMZKnC4h97mcA7v0LmNM4NsE+FYbDmocsF5/KgA=;
        b=LOXCVgbdVQrijrlG9KjzW05SQYQBZZ4+Mtqr3Ep+asBepZhfTkMC1FjcD4eo7yk5G0
         /Zf5ZkssNB8gOzyPA9oIJG2m0fC7iWrvJfB6mlInjOH2pElXfo3qIs65KHFP/BLr6ORG
         m4pg4sCgUgzzOUY3o6AzyKkkwNI0UKh4Xx5qgXv87JIIrwL9SvwAGpttxw1wDRrS5pWa
         M0EU3OaqHzAWrfIKJsIo8pkpfXopigaDMeo5v4sG3zI2AWr5B5dQh8KjY18IV7KMVJHe
         xFpLc9Cflqz4TP74HMVI9Y0/AlFcFzzl/3H7ulPlneo9wXHZwKDsXIDKhrls+gIiRZYg
         1YFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788295152; x=1788899952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMSVbAMMClabJnl3yUfS4i27AaasElWu73GA2BM0Mik=;
        b=KxrvSSNx4a0vucLe6PhZiunmKB1ppV8M9Wwy+WzJQbelssBPIYCCZyos26/L3b0w+f
         HQFveJHWyRa5J7shqRKrBeleU2D5HwXMaX6wO+3NoaHH2UfvOmGLVaRK7oIv3tl0OhVk
         cDANjOfWYql9g776UmyXreetVyCuJGhECdlkcvBGpu5csMf8TqnmDNeUy/pbTd0Rwk2a
         tPHZiataGNm7fWBv5rhYZ4kB8GK2PHOCLcF1NeixySnBUEnlcYvn29BTsAswrdQGIptm
         unDJE9VI6F0hmyhtQDx2XG1V8T4jkuBOZAixdnhNLHMCvTp0LCQ/9ilEaiRRKYLJTAyV
         SHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295152; x=1788899952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMSVbAMMClabJnl3yUfS4i27AaasElWu73GA2BM0Mik=;
        b=p/oyvTLhwsaWfeV1Bt9ujq4JKYPKT+TfOI1YO5vZz/NH/lcMFjk+W9BvlxG+h6dSBM
         +pjLrGQ/gCr3+aiEXhRqKRlgcW0gq37NtniCw0klMu7kVGVJi8IRuDRqLcYNoykOKYSk
         xeTUR5nqQ7XGGe1bkUHyRpnKxmCW4rDBOnVKH9MIvj4pCGPEM59HokUdAfvdgT6/4W+8
         XFQmyKvhRRcmw0lKXp+eOFvJi852si8x6DyXW/ErHcNrR8G8BDaJqWr5JROE69etAAg9
         FPm9jUwBW1uxR5f27Ar5x/nUHiuFCxIwy2x5i+jJq3xyyLsEaVo6uDoj5/MAHF54dreQ
         5E9A==
X-Forwarded-Encrypted: i=1; AKwUvBy/m9ZlTtHrH/o5qUI5+Q5ZLjmJ85xoSCcTk2tgZLxq3s2SS+spqV5wWCBcmYD0HjqqNULT26/wJ1+m7Oo=@vger.kernel.org
X-Gm-Message-State: AFuF++mYFPpPngyIWzmaR0amtVu+uo3vFDaKR/Cf9Jn8uVzw77tgA3bl
	9iLDUUpy9Uk43U+SFbNxcAmPKrydrTu3PpmNSv/IF90ZYvZkwoMt+HY5o1CFbE0NwsEYuyIyEGv
	1dE7bnNYyxDp5BN26LsBqFMORiT1W5hw=
X-Gm-Gg: AYBFou3gbtXrAlnnpiGYogM8Rh6PHm3yqyKIDirJJFPsh2TTUQgwm1gC9Ot+fjhvCBS
	QxJBwbqYfFhIhOnuJR4o2rYkjRphfE87l3tb/VkpVZB9bHRUn4191jhIhI6r618Br0wmsu8wJhQ
	Bq/VQ+hYzmcXNdpDtn2+FXdOnasfzL69lV8RGN0qEbwitARfYVZllsnZ33VM13GeaBVngUgah7q
	OExbktejc3tRnVus+/ruOOfwyNBZfIejsm6G3XeVg3ThSfPqAbULT4AQhiak5qcXTaZToeFk5Bx
	V/+u2ghG2BnJWLIzjH4PwYINJ83fl9j+uju50kMT+YFyAAhXgWDwB36gl24bxyfW0tsTq+Oa2mz
	p8TqPiZgyVyrYBqlvAPvY3kcl1AMK4yYdlRq9zBzwWsYUym5c+dKHPlyMQ1zfQ8bo30QHWbud1H
	GZohopAfH5+LlVCwepf+IOiWVKIk1rKaUIGQE4F0TTO+6IgAsSnF2T08s03PROOUBXeA==
X-Received: by 2002:a05:6402:4585:b0:6a6:776f:5859 with SMTP id
 4fb4d7f45d1cf-6a682ac2b12mr255347a12.17.1788295151738; Tue, 01 Sep 2026
 13:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730204722.1101805-1-rosenp@gmail.com> <20260901194524.908240-1-ghidoliemanuele@gmail.com>
In-Reply-To: <20260901194524.908240-1-ghidoliemanuele@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 1 Sep 2026 13:39:00 -0700
X-Gm-Features: AcwNN1WlvzKl5Ma1R8rX-hNwpVEErP-nMy6eoOGTbH_FUp8tWYaCb1AqEhDSbAA
Message-ID: <CAKxU2N9rW7PpNqUX0w8AR1Doc=LrRPJNct0rYJCTOm3Vskd7Qg@mail.gmail.com>
Subject: Re: [PATCH] crypto: caam: simplify probe resource and IRQ handling
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>, 
	Pankaj Gupta <pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, 
	"David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:45=E2=80=AFPM Emanuele Ghidoli
<ghidoliemanuele@gmail.com> wrote:
>
> On Thu, Jul 30, 2026 at 01:47:22PM -0700, Rosen Penev wrote:
> > Replace the open-coded platform_get_resource() plus devm_ioremap()
> > sequence with devm_platform_ioremap_resource(), which fetches the
> > resource, requests the region and maps it in one call.
> >
> > Each fsl,sec-*-job-ring node has a distinct 0x10000 reg region and
> > interrupts property, so the region reservation added by
> > devm_ioremap_resource() is exclusive and does not introduce overlap
> > failures.
>
> This patch, now commit 9a955c0a7d11 in v7.3-rc1, breaks CAAM on most i.MX
> SoCs (i.MX6, i.MX7, i.MX8). All job rings fail to probe and the machine
> loses its hardware RNG:
Sent fix.
>
>   caam_jr 30902000.jr: error -EBUSY: can't request region for resource [m=
em 0x30902000-0x30902fff]
>   caam_jr 30902000.jr: probe with driver caam_jr failed with error -16
>   caam_jr 30903000.jr: error -EBUSY: can't request region for resource [m=
em 0x30903000-0x30903fff]
>   caam_jr 30903000.jr: probe with driver caam_jr failed with error -16
>
> The job rings do not overlap each other, but they all sit inside the reg
> window of their parent fsl,sec-v4.0 node, which caam_probe() already
> reserves exclusively via devm_of_iomap() before it populates the children=
.
> So each job ring now collides with its own parent.
>
> Seen on these boards (CI/CD):
>  - apalis-imx6
>  - apalis-imx8
>  - colibri-imx6
>  - colibri-imx7
>  - colibri-imx8
>  - verdin-imx8mm
>  - verdin-imx8mp
>
> Reverting 9a955c0a7d11 on colibri-imx7 makes the errors disappear.
>
> #regzbot introduced: 9a955c0a7d11
>
> Thanks,
> Emanuele
