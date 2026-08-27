Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916C846D095
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836163; cv=pass; b=HywGnVIrOyE1QRsEIGY/7UF5RywK9hY5F5yMcUilOA+GLT+UR1t1yXyxvo+3S+8L0YrSWK152mViJLe+I0FKSNnRf4olpwqQYzi/3t5+qCkFsJPbYT7zZXvLd7FeC4OMkamJDDifoDZWAuQcIrb48abzZ5bjK06C5E33hJnjFEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836163; c=relaxed/simple;
	bh=yVbl3Z9HVr6Uibx2P5f7A2CJaisyDJjFLYgGyEoH47M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+7l8kC9mKU9/1Cgk9MOWfH/3vDcTbWTWTwSQ7srW87AGBRUvMa/cYvyBMxv9hQPp18ENH5EYueTNqONHChzDx8O+EyeKOKBxw0KpcOcKbgJa29BGBiIo57T2XP93aNaWOyuYF0ughboLVMLE+fl8cpapvdnAjF3qlBV0BNpf0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRcTrciv; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRcTrciv"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c74c469e8so12032831fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787836145; cv=none;
        d=google.com; s=arc-20260327;
        b=pyouJn2ymbZR+fncKr+y97P0J7pLEI0Y+aAdryfa8VyIMR/zOWt9sxHA7zZS2sQFwX
         /J3ly1IhSneLiWgnKOULVZZF0mXlzMWRUuvdxHkFEHcb2lmogGE5U8Mc6J/QqhXXEFDQ
         R0pg/zgdl0wDmPULURJ+fMnItD04dOQfLEcLJkJJGNkbHr6rGj9HIaFwylRXgrOgtB8O
         rrjYI3/xcrBnwmjvwrW9aOeWJhpYSmSbo/K9uRJO9EJodFmXgrSoC08o0kfYTiOg1r+X
         aPuy4FRqg5CjGjy/BM00tTYgA1N4jZDou61yWEaokTmyrOeltM4iHlcECieKjvh2GKfF
         VjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yVbl3Z9HVr6Uibx2P5f7A2CJaisyDJjFLYgGyEoH47M=;
        fh=pG4KLY41U9c/5wGOobzWsCRmrr3K1JHFLx2nBkx/9aI=;
        b=R7jyNlUoOwt7Y49NgmSZStQ73sju5ZfPrJQVCs9vOiTOctSDlFb3PjhghmJGJqA0CG
         qsj4I55yeI2xqlEULUEE49GrCXyvUdPeAmmokYDRQKnhLATSXDujA7bMyOKmvGeEOgpg
         XPctbSa+NODYxEYZvmNYF3xCUNAQAHd5lWghBUEtB+SYmmprjkMoaguLUoygVoADEnDN
         tsYoXkxflcagAU74Y4460P/FkSbGp7tbjLHquo2ognD5Di3/kWKsb/o6GLm+GhoSSAjN
         CkkUwR1VtqYzOQtS5tapFQ6aAP2at/5ATF34Iix6rrYBGn3lseMzumh1s5feOR/vTkgZ
         U+gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787836145; x=1788440945; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVbl3Z9HVr6Uibx2P5f7A2CJaisyDJjFLYgGyEoH47M=;
        b=lRcTrciv1tpI+038IVPgCI2tC2Pcj6vTAlv+YwTWScJuGM4KIs5fvLPs3iLlRepcd8
         AdoyoJLWwxxvYyFHX1e8Vrly9rpYjMkUYmPfyLUB3ebqKwIBSdiB7pXJwi8iA9WaMSxB
         IBhFCqTLUDfJ+VQjvOtZ8RDl5NdtzoxL1rUDrKwfTkkgAOA8khrsn12UMfyXWZmOne/l
         AcMVSb5VCFypAc8pyurjApvpr2NtCKy7Z/KKJsMWspF8VIFzfY6Sd4qGkDwseP32tF54
         mxNQtguRbY57Gfq7Ease6C27QqN7v8YjofkIHg1zkG0uKKk69kos5EZ+laUGa7rZA1c4
         mOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836145; x=1788440945;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yVbl3Z9HVr6Uibx2P5f7A2CJaisyDJjFLYgGyEoH47M=;
        b=PuEtDbp1RlpteYkYOI5AdA1p7qt6HGZph/atnloqm8/vWRcM0ePOqe6dTSxVdKmmFt
         jKClvUZ9BAi5b9eaMnwumCT1VLFLTzvMwPNWQcdaaBPO2CcIhsPe2WpWhr9SzyrRtTQg
         q5XqJ0u4nVi00+uBOWIymzH7QAzWoR6I0KpXhj1VCubQGOBImMkhj0LCuLdKAHWc2O1N
         /YM75YdvB7ivTq+B+xhgX+B0YLEuWLlTKh8RGjVJe4gxU7AsJcAu9plW62gzUTEIBFxM
         jB/khJyfwChmunR/rYPA4lYf70KINCB41hD7WoG7NBkXoVdzMRgYOW6Ae9RQp8ua+Dba
         pR8g==
X-Forwarded-Encrypted: i=1; AHgh+RosY3mw2cGThb7+doLCQcxEXDBjPoe88j04d5WxqemvdcbCqXkRtRDjR6zm0UEU/sRCpchd1puI6g5LcgA=@vger.kernel.org
X-Gm-Message-State: AFuF++nMhA3ZMc4B65bmZwqXMjaJmk90lIuN7p4lpRUR2q+PKT7V4Qjp
	4bIvzjXfSLUu8IFbecr4YPrSkeNMZPo6LEC1/7KocC0k+ZPrFwKS0Xb+bNZofCwfbLivF50gifs
	BT+bcCWydKy9P7tYyObVdzrkXxGu/2BA=
X-Gm-Gg: AR+sD13yNXH2EKuNtZCLhIYmtHwuQqBwo+HmWfeeNtb5nTpte6nW0xvrz5JN0zKptBc
	3aUEv3JatdmSnCEIAFhjpIA2pM8SV4UYSf1LCQ3LU477j0io4y+zdRGhSH+1L08kMMPru0/2nCM
	hwWOozto0bsCDaOEkAnDVwsIjGHo4nGEV77bZaEu6xpVXgxvEOf8NalK/RM8WXnNUkos0QuC9VS
	DhyUxkCJ5jiZBctSTbP/F6c/Ipq2oV6JqFM+rAknNjMrr4Q9QG2DZhZmG7bcUcRilUZ4/mh1zOK
	9AyNlHPv+5KlJzMXEwhSe/G5/M0NDjoDOeRQxNhXU7JgOPqWL2lOb7XpQUCrsGhrgbEFYT/hNph
	uj6GHdN7um5kztSAlbXgblmQyFyxPyHLA5toUqIFEUxjoPb4qfZb9dmSMbA==
X-Received: by 2002:a2e:be27:0:b0:3a1:d468:f988 with SMTP id
 38308e7fff4ca-3a1fd453e09mr37025921fa.1.1787836144417; Thu, 27 Aug 2026
 06:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821010728.45065-1-gvalkov@gmail.com> <20260827-helpful-icy-donkey-9bfdaf@quoll>
In-Reply-To: <20260827-helpful-icy-donkey-9bfdaf@quoll>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 27 Aug 2026 16:08:52 +0300
X-Gm-Features: AcwNN1UImZDtg3-upEabUa_XGggulmtbmlnjP2_UXhZYxbNMdjonIxEdG5ok4DI
Message-ID: <CADOrJmaF0UpRefk1+BDyn5iU5La4ke1gFWwzyRr5-9wp7Zr2+A@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: net: wireless: add flag marvell,invalid-reg-hint-in-rom
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, 
	kees@kernel.org, miriam.rachel.korenblit@intel.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com, 
	peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 13:34, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Aug 21, 2026 at 04:07:26AM +0300, Georgi Valkov wrote:
> > WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> > from the mwifiex ROM, which conflicts with the platform regulatory
> > configuration on units sold outside the US market. For example:
> > - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> > - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> > - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >
> > When the system boots, it detects a conflict between the user selected
> > region and the radios, e.g. BG FR US, and applies extreme restrictions,
> > preventing phy0 from starting on any DFS channel. phy2 works.
> >
> > Add a device-tree flag, which allows affected devices, where the radio
> > conflicts with the platform to ignore the incorrect regulatory hint in
> > the ROM of the radio, so the platform regulatory domain can be used.
> > This does not allow the user to change the regulatory configuration of
> > any radio. It only allows phy0 to start and operate according to its
> > certified configuration.
> >
> > [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> > [2] https://github.com/openwrt/openwrt/issues/9956
> >
> > Cc: stable@vger.kernel.org
>
> I don't think there is any bug to be fixed here. Support was incomplete,
> so you add a missing quirk, but there was no bug in the binding.
> Binding was correct.
>
> With stable dropped:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I added Reviewed-by to the first patch and sent v7 with these changes:
1. drop Cc: stable, the first patch only documents a binding
2. restore colon after Tested-on as requested by openwrt-ai
3. mention the added wifi@1 node
https://lore.kernel.org/linux-wireless/20260827130335.6606-1-gvalkov@gmail.com/T/#t

Thank you for your help and patience!
Georgi Valkov
