Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6594202F70
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788081751; cv=none; b=Y7szfVvUT0LRPe01mRrQFk6icjXnxU+8SQysP7/BbLVyPPUpKCUBZ4k/IgxVgRF2XMF9W/5mubgyjwDMeq7cmlnEFJ5Xe69NDtrY6Sh1IlMnymwVJq5LyZNy0u445/qTLviEXhUkotav+Yi5yRiWW44sXFHCJRrcYAxtlsgwH/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788081751; c=relaxed/simple;
	bh=TtQaTDfMARSY0Cj/dxNfYNkCEH3TeLvjB6wg/BuI/7c=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=D76T8eiwBcC40KIh+u5u2F6T2FPGVi64KcNWEXOLry/inVs+i5V5k3OC2OmU70WXiFsQAyLkl2379JzqOJ9e4cFzxxL4DXr6c/HVWejwqOC/lL6KHKEY3gu7SQW3Z001nKlsjk4xIZPpTV4eTs0RJSO2UEdVi75nL/DPDOQiPDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=g4a5icmF; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="g4a5icmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=ghTUeDMLtevbpI2kelg7teyoeNgEh4fqMmUgF/ewQFA=;
  b=g4a5icmFOKduGeDXoLfbU90YEsWB0lTPnTSwLYolyZtyMMM098XCsuGg
   13wJYZ/p9/oZrQjmSn5lV6T43gcLdx/PCxkg5wDLW91esZDbJaXvSp8OY
   4V2TuyKQuQjNIBGYOfz4RaDgOD22o8HpY9dpsWQ8bWEKJdTbDlRrm/lwq
   4=;
X-CSE-ConnectionGUID: 8SaXmtmURqSY86HGyiTpbQ==
X-CSE-MsgGUID: GrOCKUOJTI6E86+mvvYlBg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=julia.lawall@inria.fr; spf=None smtp.helo=postmaster@zcs2-store9.inria.fr
Received-SPF: Pass (mail2-relais-roc.national.inria.fr: domain of
  julia.lawall@inria.fr designates 128.93.142.4 as permitted
  sender) identity=mailfrom; client-ip=128.93.142.4;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="julia.lawall@inria.fr";
  x-sender="julia.lawall@inria.fr"; x-conformance=spf_only;
  x-record-type="v=spf1"; x-record-text="v=spf1
  ip4:128.93.142.0/24 ip4:192.134.164.0/24 ip4:128.93.162.160
  ip4:128.93.162.3 ip4:128.93.162.88 ip4:89.107.174.7 mx ~all"
Received-SPF: None (mail2-relais-roc.national.inria.fr: no sender
  authenticity information available from domain of
  postmaster@zcs2-store9.inria.fr) identity=helo;
  client-ip=128.93.142.4;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="julia.lawall@inria.fr";
  x-sender="postmaster@zcs2-store9.inria.fr";
  x-conformance=spf_only
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:fk3knaiy1l7AZqsuCtF65uupX1615xEKZh0ujC45NGQN5FlHY01je
 htvXzjXP/7eNGrwL49yb4/i8BsGv5bdyNAyGwQ4pShhRioW8JqUDtmncnv9bniYRiHhZBI+v
 p9GMrEsD+htEySC/k/1WlTFhSMhvU1dbuOkUIYoAggoG0k8Dntn0Us98wIAqtYAqcCjBA+Qs
 s/FrcTaOVu0sxZ5KWt8B5ir8XuDh9ys/mlF1rACTaoT5gGGxyNEVMh3yZyZdBMUfKEERoZWe
 M6YlNlVzkuBlz8xB9WslKrMc0Fiatb6IQiUh3NKbLOpix5EqzZa+v5T2C00NC+7Ix3Q9zxA4
 I0lWa6YEG/FDYWV8AgpaCS0JgkiVUFw0O+ecCLn6aR/+GWdG5fk660G4EjbpuT08M4vaY1F3
 aVwxDzg8nlvLg95qV62YrAEuygtECXkFNMks0Fl0TTkN+8dcMCdY4rb5ONA1g5l06iiHd6GD
 yYYQShkd06FeAFIIFpGTpM4huahwHflG9FagAvP9exmuC6KkFY3jNABM/KNEjCObcdImkeR4
 GbP4G39BjkbMsaewHyL6BpAg8eVzHmiB9JKSeHQGvhCr0e07U8uLz8qdAWW8af6j1CgatZ1J
 BlBksYphe1onKCxdfHwXBO2vSTc5kZNC/JfFuQ77EeGza+8ywCYDW8ARyUHcNUitd8eRDkj2
 RmHhbvBDjtku7y9UmOY7r7SrDWoOCFTI3VqTSsFSxYVptruuoc+ijrRQdt5Vq24lNv4HXf32
 T/ikcQlr6cYlpROzLm8512WxTOqvJnACAAvjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xopi9U
 Hk4dwy2/usVV9SWiCuXTbRLHbez5v/DPie0bZuD2XU+32zFxpJhVdg4DPJCyINBM8AeeDavb
 lW7VcZ5+spIJHXzBUNoS9vZNvnGBpQM2Tgouj44ozaOjlVMmNe7wRxT
IronPort-HdrOrdr: A9a23:HjcDYa8/JtjS1LXOLIJuk+DxI+orL9Y04lQ7vn2YcXduA6mlfq
 GV7ZcmPHrP41wssR4b9OxoR5PwOU80maQY3WBpB8bFYOC+ghrOEGgA1+vfKl/bdREWn9Q1vZ
 uIGJIeNDSfNzdHZeGQ2njbLz4aq+P3lJxBvIzlvg5QpAhRGtpd0zs=
X-Talos-CUID: 9a23:ccljnWD0ql+s8dX6E3lc/X4RBsUYSGTm/SeOA2CpCFpxQoTAHA==
X-Talos-MUID: 9a23:en3wEQg8YKGMNxPAuom4qcMpG91PyIeTL2IxsMsr65fHMDJuCjO3g2Hi
X-IronPort-AV: E=Sophos;i="6.25,251,1779141600"; 
   d="scan'208";a="292178054"
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-MGA-submission: =?us-ascii?q?MDHCmgQCyeqDItQtj02xmrD6W+m7rfy9Ya92LD?=
 =?us-ascii?q?7xJfjOiO3nmGgUOkAHghmIXUyKi4VnMJc/2pYqdjaExPNMp5OQb1e/OT?=
 =?us-ascii?q?4R0dTdwvCsQA3HCUhXHc8fSd3E6+DJOwMxMyWEeefiNwfnJ/H0nydXX7?=
 =?us-ascii?q?j8B8SwoVxnImEAeF/6PCuWqA=3D=3D?=
Received: from zcs2-store9.inria.fr ([128.93.142.4])
  by mail2-relais-roc.national.inria.fr with ESMTP; 30 Aug 2026 11:22:19 +0200
Date: Sun, 30 Aug 2026 11:22:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: nicolas palix <nicolas.palix@imag.fr>, cocci <cocci@inria.fr>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <161516053.8619221.1788081739076.JavaMail.zimbra@inria.fr>
In-Reply-To: <20260823161826.3805598-5-ekffu200098@gmail.com>
References: <20260823161826.3805598-1-ekffu200098@gmail.com> <20260823161826.3805598-5-ekffu200098@gmail.com>
Subject: Re: [PATCH 4/7] coccinelle: pool_zalloc-simple: drop the
 pci_pool_alloc rules
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 10.1.20_GA_4893 (ZimbraWebClient - FF154 (Linux)/10.1.20_GA_4894)
Thread-Topic: coccinelle: pool_zalloc-simple: drop the pci_pool_alloc rules
Thread-Index: Z+Nmc7pw3/2DslLTxqGswtDDrCRUcA==



----- Mail original -----
> De: "Sang-Heon Jeon" <ekffu200098@gmail.com>
> =C0: "Julia Lawall" <Julia.Lawall@inria.fr>, "nicolas palix" <nicolas.pal=
ix@imag.fr>
> Cc: "cocci" <cocci@inria.fr>, "linux-kernel" <linux-kernel@vger.kernel.or=
g>
> Envoy=E9: Dimanche 23 Ao=FBt 2026 18:18:16
> Objet: [PATCH 4/7] coccinelle: pool_zalloc-simple: drop the pci_pool_allo=
c rules

> pci_pool_alloc() and pci_pool_zalloc() were removed by commit
> 88dee3b0efe4 ("PCI: Remove unused pci_pool wrappers").
>=20
> So drop the pci_pool_alloc rules.
>=20
> No functional change.

Applied.  In the last SmPL rule, I removed the \(\) in the + code and move =
the @p one space to the left, to more obviously attach to the =3D.

julia

> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
> .../api/alloc/pool_zalloc-simple.cocci          | 17 +++--------------
> 1 file changed, 3 insertions(+), 14 deletions(-)
>=20
> diff --git a/scripts/coccinelle/api/alloc/pool_zalloc-simple.cocci
> b/scripts/coccinelle/api/alloc/pool_zalloc-simple.cocci
> index 9c61a23b34db..2c36fb70e0ab 100644
> --- a/scripts/coccinelle/api/alloc/pool_zalloc-simple.cocci
> +++ b/scripts/coccinelle/api/alloc/pool_zalloc-simple.cocci
> @@ -5,7 +5,7 @@
> // Copyright: (C) 2015 Intel Corp.
> // Options: --no-includes --include-headers
> //
> -// Keywords: dma_pool_zalloc, pci_pool_zalloc
> +// Keywords: dma_pool_zalloc
> //
>=20
> virtual context
> @@ -22,7 +22,7 @@ expression x;
> statement S;
> @@
>=20
> -* x =3D \(dma_pool_alloc\|pci_pool_alloc\)(...);
> +* x =3D dma_pool_alloc(...);
>   if ((x=3D=3DNULL) || ...) S
> * memset(x,0, ...);
>=20
> @@ -41,17 +41,6 @@ statement S;
>   if ((x=3D=3DNULL) || ...) S
> - memset(x,0,...);
>=20
> -@depends on patch@
> -expression x;
> -expression a,b,c;
> -statement S;
> -@@
> -
> -- x =3D pci_pool_alloc(a,b,c);
> -+ x =3D pci_pool_zalloc(a,b,c);
> -  if ((x=3D=3DNULL) || ...) S
> -- memset(x,0,...);
> -
> //----------------------------------------------------------
> //  For org and report mode
> //----------------------------------------------------------
> @@ -63,7 +52,7 @@ statement S;
> position p;
> @@
>=20
> - x =3D @p\(dma_pool_alloc\|pci_pool_alloc\)(a,b,c);
> + x =3D @p\(dma_pool_alloc\)(a,b,c);
>  if ((x=3D=3DNULL) || ...) S
>  memset(x,0, ...);
>=20
> --
> 2.43.0
