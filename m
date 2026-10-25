Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792918326;
	b=R57gu/G0O4PjkL8qDlnROp14Gc85HXRTHHrzDnvDVrz0UfEZ24SkkWxD+ki7SJqL7AWo
	 yYn7rpnfYb+8mzaobBi1Gcb39PMre1AtmCGr3oP11KAozYdVfAJoQScGdnX1BAl3txXXw
	 xYNJRXlv78jW9aljh4Mrvjog26Y9EOtA01Xc7VT12xBUXYFlzUIZS44ipSZQFj/HY16U8
	 Szk/I39G1IAReiE0mab5oK18I3+yfw084ISlnHCmb7IN8eenBSLuWuF9zKPmlPuj2lFuR
	 ckkVlqbmeyeqf5M9S91RfOgEDxy83PTf/+hsR3Q0WfqcyXfrMkLyPAozBh7Fkj4IHtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bc41FckTcBQthvtCzkFLVNCK1+fJ08FUf/3Pl3O3aMU=;
	b=B9tQDDULOntO/HL++2ikcJ5MWnKHoqNLE4kCnzVa3ram6moHP7hsfHyfnywMLPkRH2qH
	 PUATl89K+PcHwZVA4dWF5KHpBOf/kSH37QFHv5Nx7qZ3/OdTkhayCDFDLGrbyEMJkLK3w
	 Kta9+GdT+AQSH43y/Fs042TH8h0wrxbV3pEjES7BL6JUm2Py3sPpThsxH7DpZ0N5ymQhX
	 EX/hag7ykWcqNNdcbQ97m5aMcCirfiMq8hBEcjCQ9pMuhOc8nNRybLsY2p3hAznBpiaaT
	 7ft9+963mRQwYYf3FSRPIhIgdDczJZTFgmhK07J0XwUB3rS2nMj/7UAOc2V369N0azA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="fHuKXae/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EF8606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38EF8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fHuKXae/
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35f036b17easo5274789eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792918325; cv=none;
        d=google.com; s=arc-20260327;
        b=SNNUa1f7TeCXsndYCH7jjyE27bliW2cWmuaTJSg5SfRIV8m3GQ2HiXqayBUT63THp9
         tMlfBu8oCCkovAlZ1LJooYQj5EpG6NGNlUYHS5RC/KkZAUroKajj3bhS7hEslYCecJxD
         0AJTLGN+dSZyuJUXyXkG+mu9be0jzXvyIVf1b/qN3qmy1dcMG2OowEDQ7R0l1A57panT
         vKNO3Lc6+5N++RTIVB4QnKbe8I1JknDQQXvyxnhjNEvPGTQtwAERMcFYfQ+4kdQP5kKW
         lDGBDI7BXknuBIApPV0HoBzEAPico50Pj4kAS0MzTb6U+3HGPCD6qRRGpb9TSAUkIuc3
         r/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bc41FckTcBQthvtCzkFLVNCK1+fJ08FUf/3Pl3O3aMU=;
        fh=g9Byrh5pAdri/lsJn3Qxob5QWa7/X9mwFngTEIkIWAE=;
        b=Nr1e7q7bPCNhTi4MbiwZfefKOApqWdniXI59X6RRsuS6K6DXDC1+Wj0oT7Cc+h+UTb
         vu43Gf/8ASXPPfPARbgx/Pl3dJ6a3ojIwxLA9Nk0LJUytr5N8gWAY/I34tIAJiXZtVfc
         raDYJ2XJPJemwiMoBGAsyYp8Pmraf2UdAnNtfycVoEIdMzzbNEqimSqXApEMYoRs6ESa
         bARRPoZymMiPoixJZb0spleeIgCbOmoCPlrUUJ40n71Sw+0/eMnlnA+TeP36g5hAch+u
         GxX0kf6gd3xJoT6Ul0NM0zo3iZutvBaEYERQzk9wOgPMmfpnWYsG5VYN6HlCpE4SsbaD
         K2cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792918325; x=1793523125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bc41FckTcBQthvtCzkFLVNCK1+fJ08FUf/3Pl3O3aMU=;
        b=fHuKXae/GVi8tRawUFa4lbNSNPGpcGy3etaTNS3Eq865jP6HTXqyTAU7pQ9lO5hztV
         L5T/ZeoFN1auALf2FXwqBPd7bBS2wagtMIyz37ToFRQMa/WXNVD2BEtbTGUextAR6OC6
         m8uMdrEus0LGhKtjw18ZAw7Xky2dQ1k8endaHdCWWVCVIQF+aZ43iOE+gZdVkiSA+7S9
         3rYxkMEDMFtqfVnmDFJ2mIM4OYrdYpqdVvaZ34/8vJ82aQJ7/B8SKZdFeN9aS9WzZRwj
         A/dKaDDRhdAcXB5yS5wm4iH2pYAGPR/KvcqTD1AaDgNBeRnCRbeFzhw1rqQLW1Veeq0v
         5J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918325; x=1793523125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bc41FckTcBQthvtCzkFLVNCK1+fJ08FUf/3Pl3O3aMU=;
        b=CiVuF7eJ4JUaQ1DI3n1DP/5yjWXBoA3ilLtubdg6pfhU5KPQ9iGVdfN2FOAVZ7YXaa
         42wt2LBH08o3gM0xXyBh0AGLSYdOpDkVuPiPJ99CYk1C2VXFNesYLuNlQ6Al2+RPkwO7
         j8Eeze3VbOmWSDC9wxHHnjL/Jeuxi46B+mS5lOm74ZkuoF6db9Gj+MMDkXfzxQeZ32K7
         3rvZDtQWt8KuGZuQbk1SeZLedL/XM7NsSa9vHfc9ZZMah0rDb02Mw1jzSmLJt6lavGpZ
         p6aDd9y9JVyBSdGOoHeU0DWyqsDgC2jv8noG/KL/s+07oD242X33NNTMiTFKPYls+LcJ
         uzzA==
X-Forwarded-Encrypted: i=1; AKwUvBy7Kndtwotq+I0/BG45gwSIFc2RQx+tQl9mW/yolmj/xT/7MgIaxtUTiaDQtqquLIH58nhRpQ8rVqblLIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaYjUKMSk+KzeRPzS3dwYEmFARS7rWfGwZ63us/ARg4Nhah3SB
	2pVW9G7GGIrbl26zQwoFsJxper/LwPHLOA4H3Gb9tMyjxy0Iw8ynh2OqaMVotb7mOxeTnbMtTGg
	K/jn993admxtf0G/WFJ5bFVst9viFU1I=
X-Gm-Gg: AYBFou0NVoRcKWGRpZxRcKN/Cyl+uFf7ptxEwTQv9bfK5PZpgkcd+SoJtIFTaQoOwtt
	2JSUQvpiT7ainh4wgUJXJBHR17mKP1q05kcR2kSBeAQmzuldhub+dLwrp2pk7aB/G1ti9SJDDSV
	POc3+DJ+EYwIgrbUkb7+C7V/R0jZ/jUsnPJ5OgrLdQaEIsYfQYC0FdIqcBLUpRDrZhoBsPfjbXP
	QicnLZb/OI1eFXH+C4JuTiUM4lwFc6sfNK0TmtZl+PbuFMIqilRsWBvY6uBZo7dotHEFOUs9d5f
	7dxCw/v8eyd7HOI4qDM8ibMPeT0pujBC2A52/23JjrjpcjxpTjLWMAox/5fq4tewi7r/X4gZg/S
	2HicxxgB3OIUBxv/BrPf9Pe9e/2mNFAs8zCkdgsUn0sIW4KPvseQqAbjI9z2y42Sr03jtVw==
X-Received: by 2002:a05:693c:66c1:20b0:35e:51d6:9f6f with SMTP id
 5a478bee46e88-369e84f5952mr5827731eec.27.1792918325200; Sun, 25 Oct 2026
 01:52:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <CAPVz0n3Vrzb96iR5ZW8zvmruZ4aK0hKGKpJ2T9Ys+bSPCtLWHw@mail.gmail.com>
 <CAPVz0n3gzV+gAu_gzp3oTG9VOu-YiNSiQA0SdCFApKsi0dGjKQ@mail.gmail.com> <0g7damfVTZ2r6s4H0kv6Lg@nvidia.com>
In-Reply-To: <0g7damfVTZ2r6s4H0kv6Lg@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 25 Oct 2026 10:51:53 +0200
X-Gm-Features: AclHuK8VdLvGZN3upYS8jizoanUHoPG-jyCBtPV5Pp4C9VbRI_nvkyJWhb9qq0g
Message-ID: <CAPVz0n1G0cDuUj7WRfj9YRgvMSd0sqSCjnir2p=QxUGu5BWTXQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/tegra: Add support for 8-bit CPU interface
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 25 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:4=
6 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, October 23, 2026 11:14=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
11:26 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 10:53 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > ...
> > > > > +MODULE_ALIAS("platform:tegra-dbi");
> > > > > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > > > > +MODULE_DESCRIPTION("Nvidia Tegra20/30 MIPI-DBI Type B driver");
> > > > > +MODULE_LICENSE("GPL");
> > > >
> > > > No separate platform driver or device. If a separate struct device =
is
> > > > needed for some technical purpose, we need to create a minimal sepa=
rate
> > > > virtual device, but unless there is a strong reason to have that we
> > > > should be fine with just the dc device.
> > > >
> > > > Thank you
> > > > Mikko
> > > >
> > >
> > > ATM, I use bridge framework to describe interface and I am attaching
> > > it to RGB since it basically uses RGB to transfer video data. It work=
s
> > > pretty nice so far.
> > >
> > > You propose to replicate how RGB works just for DBI?
> > >
> >
> > One of the reasons I used separate pdev was to be able get mipi_dbi
> > from it using dev_get_drvdata() from patent (dbi bridge in this case).
> > DBI framework seems to not have a way to pass it in any other way,
> > unless you know smth I don't.
>
> Right, I think using a bridge is fine; passing the mipi_dbi interface is
> properly done in other ways. The direct parent devdata link is a bit of
> a "poor man's bus", and sometimes it breaks down, such as here.
>
> MIPI DBI is comparable to MIPI DSI -- both have a hardware channel that
> sends both pixel data and commands. I think we should follow DSI's
> example and have a DBI bus and devices while keeping it as simple as
> possible.
>
> The DC driver would register a DBI host and the panel would bind as a
> DBI device. The DC driver can then supply the mipi_dbi object in a field
> of the mipi_dbi_device.
>
> This is a bit more complicated than a parent devdata pointer but much
> cleaner, and follows the existing DSI pattern.
>

I understand your intentions, but ATM kernel lacks any DBI type B
framework. No hosts, ho devices, noting granular. Implementing
everything just not worth my time to support 2 panels of device based
on Tegra 20. And I am talking not about time to actually implement
this in the code, but to upstream. DSI framework is huge, copying even
part of it to wrap legacy DBI interface and ustreaming it does not
worth hassle. And yes, I am a poor man, I use a parent devdata bus.

>
>
