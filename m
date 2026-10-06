Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E673B05AD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283679; cv=pass; b=IMpCE01TWchA8YTsCgRKdq45vNVwdkZXCWSkYzKGzwGe/l8OxQze5149n7e6FGJp0FCcBErDWaInwxTl3oC0EOCs3vaYchsG1ZH8A4DxzbW3QqhV4AjbiboSTendZb1uqb5fYrTLWAtxmtvOAaI4CNlvEGF6Oidujb0bkPUD+N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283679; c=relaxed/simple;
	bh=e/UFUu1HfFn6538kphTVwWa5FV2s/YJlDCcIhCs7g5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfO3gvi9zNtzjUjmPBu+u8d/j3vo1qQBI07AbYeHeGxvJNvdqc+JMIsZ4d9mXz5/4rny/xCjfw3J2/ZJZyfk3cgI9/IKnHACMOfYGZHIzTrg0L4/IuAFeCELb0fgp3oPXEoSw49qkSUAuinBCQDT8JEgwelp0XV6nokmtq/Pzr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1kklJ8Q; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1kklJ8Q"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917a9f42283so32832786d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791283677; cv=none;
        d=google.com; s=arc-20260327;
        b=gew+xP1bVIacLKeYAw7fbKUtNNP+KsCYOoYcciCCsoy6VgvBiRfJup67F+YLH8rs7l
         6TtSLlxi2KQNpxt5MVVbPQGI5gLzd2hjr9ddxONP54TlUSuH1rtV7/t/+uHYn6renQCq
         cqhvGQc57gKt/AU3FBiWD65tsGWIMoPMM+yMltwCvevuhAmrla1it9R+ypCF707+EHEw
         butXk50Mk3u8yEN7U2c1bTgvyEfEEDiYfokgAFtIiGFGDz6/I8EcVrw092wyxP2y1ie6
         TQiGeLvy3XRtwlgk+63DScEouR6uawCXPAkUOOlJSBT7sLbPfJDRsTNPJ6UmuGL1w+qJ
         NTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SYZusaEHeQJp9+PNNGappmpwDZuJKs0VI2BXqV5hxv4=;
        fh=XiPKNWZZtrxjRuyUdBrqBTf3YGT1tI8pnGDfgbc2uGg=;
        b=ohQWMCH+x5BMNCyilbIXb6qGljJj+s+dCvpnS689o2hjAEj9D/DqRbe9aQVdGN4dYd
         LwkZxXabTBoQn9RXEcHYJQxCABuzxEHoRMYVDKNZrSd90aY+aGjst9g4FTjTZmuS/LoJ
         1w/T+bB9mu18gfzJZ80E5XXLEiyO3Lx9B16MhLUWu/4FIWxeXZ+989SG4m9l21ZeHoj5
         zXgiLvELHtS/iDNOGUGnVv6BGyWVDhCn6Ji66WILOqTK95AGY7fr2Hvj694SBd6qZiwz
         tLefMnLLUvQ3ycvB9JB2ipsZeqGnOixQES5F8wz2Xm5C8p4Pk6nTouwVPIoqS502DXeT
         m18w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791283677; x=1791888477; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYZusaEHeQJp9+PNNGappmpwDZuJKs0VI2BXqV5hxv4=;
        b=a1kklJ8QXYoIGi8lOlZsRO9VraF/W//BIFsd966H1Bj7WVBE79q3p+MOh3/Cq3rtPn
         efHncnYAyQwhVVLjyDJBGc4At7S2q1wU9nGH90Pd84kxixRkYGsQGLpSuNbeJP6CdxiS
         /x+WHdhXXi/vKTQN6cFFGphbo/TWu6eek1PEA5oQ3mBY9gnu2po6RVl8ctUNlNUT9rXs
         Mq0Gq3djU69YqAZuauI4rdv0XviL0YNEfPbDO3imnSkjvZRyU22Frx6fcOcxuaSYGRO6
         K/q6mG6ewNrU25RPub0hkE+EB9ALROElmYOCgv8T4mUB72e374CDNi7XQHqmGOTe+h7S
         sr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283677; x=1791888477;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SYZusaEHeQJp9+PNNGappmpwDZuJKs0VI2BXqV5hxv4=;
        b=O5MShmFcHTiE74Dd/orgA6Ra1HZP3ZgtuJ0ZEW6YWU3LJYhWs1YU9ZW/qcPACBsvQ+
         nqNEf1RSl0+8Gsl3m6f1jW/1LTZgyfn/xRpyAfpuji0n55hl6B00CP1ctp6AmFb93HR6
         MexV9UhlTl7hOD74Iqqk29x9Fldjo93QmfTRN6RVi5/sm7xsFA7pF+Lb9wuPlPJTTF76
         hLqNlPWvSyaCVgTV+ohEnXnJDEml4pjiTa+/SjhAbvigzRh17Vt9Ed31InFdEbmtJc6R
         rvr/OreI1JpG0qnaeSHGw1w+Yle7oONOUM42LUaPab0HH0ccFiJ42joXoSmYn8ujFNGt
         GHLg==
X-Forwarded-Encrypted: i=1; AKwUvBxa435V3UJPYZNJ4ngLCeXU04y8o5PJU9RUbsNX85UX5vnRKBdqwXA5IKbhX6smM67o9OPx2ouVeGIJpRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI+rGL+9cywexLZmXDkUV2N2q4HkYFhZgnTumK0Ul1MkES2Rob
	wt/q4cz5fOb/cizGStt46fDx7JmvphQaBG1BwVGtpgmpmLCn1YDSALPWOVP4WiTTwcgfeW6uHjr
	PfqL7GCY8fbMWDhX1yUJ8zAEgJJlbd0Q=
X-Gm-Gg: AYBFou0N8f4YgjMZ44fGhZ+Ip8y7Q3jcGiEHMzHafL52gpT+TTfmFP45aELTw/g76xx
	ZpRYpY8yPtSF96GvOMGFQL2id1wVPn2Pvq1RdEg1KWxv/S9XdAf2x7mqX1h26s3vNwrJuxEjU6s
	p9MyYJ6x6ftJtDnGK9WRF7RvN2pE860ZYWEwckFopl1d0DrFd2t0qVDL2vwwpmmUJfpIs7CCaJf
	Q7U6ouDZKL3WCSMvDEgRNHlPr/yZCdjtLt/+xb8fcEHsUNpOtTQAHCKeWmolbEvsnVCAcOZQ6T+
	KrdqB86d/y3sfFd1BMXVhWh3C1jKUU5Wj9rNis7yYD7jPxaGZ8WRiEV5Xw08baNtMEx4hiDzKCh
	MPRIjnnQY
X-Received: by 2002:ad4:5fc9:0:b0:912:435f:1a8b with SMTP id
 6a1803df08f44-9198b7a05f0mr16247936d6.22.1791283676856; Tue, 06 Oct 2026
 03:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006102937.10972-1-ansuelsmth@gmail.com> <asTRQ6d0-NYOeHqX@parshuram>
In-Reply-To: <asTRQ6d0-NYOeHqX@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 6 Oct 2026 12:47:44 +0200
X-Gm-Features: AclHuK9fa-eKez1qMwGkLA8zpyrdQxMIu76X1IlFgkWsR3UIRNVxdiubkFU4NSU
Message-ID: <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 6 ott 2026 alle ore 12:45 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 06-10-26, 12:29, Christian Marangi wrote:
> > This is a major rework of the old v2 series.
> >
> > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > configuration for the Serdes port. Such port can be either configured
> > for USB usage or for PCIe lines or HSGMII and these are configured
> > in the SCU space.
> >
> > The previous implementation of a dedicated SSR driver was too
> > complex and fragile for the simple task of configuring a register
> > hence it was dropped and the handling is entirely in the PHY driver.
> >
> > Everything was reducted to the dt-bindings to describe the Serdes line.
> >
> > Also the property for the PHY are renamed to a more suitable name and
> > everything is now mandatory to simplify the implementation.
> > (the PHY are always present and active on the SoC)
>
> I get build failure:
>
> drivers/phy/airoha/phy-an7581-usb.c:7:10: fatal error: dt-bindings/soc/airoha,scu-ssr.h: No such file or directory
>     7 | #include <dt-bindings/soc/airoha,scu-ssr.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>

This header is present in linux-next

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/soc/airoha,scu-ssr.h
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/soc/airoha,scu-ssr.h?id=11952173d8a180ac05641775f80bd6946327478f

Introduced by a clk series.
