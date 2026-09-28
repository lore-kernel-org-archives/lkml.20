Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B55F44C51D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578081; cv=pass; b=fgkzaePB7U9Juv69cWkSAu6APlz/UdiVmje1c0ecTsdN2S6dQSvn71+SzjBx2JMXSMaOY3cqx987wUtN+tG3Fyz3GrkEP6qY5/sgkFHQXzJsuKfEfwYeJql2fqLs2Dj8Lf+RIitdOkLwN4EMmCIo5tm47lYiIWoQ3/v5/AnXhIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578081; c=relaxed/simple;
	bh=Eoh53J4E2pxYdCKQgHv2CnHOlx/HRF/85mL2UYWNhjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fK/KFLPlJtu/KVoa6HGJOoalbzw6I7fDPs06x2jAKpax/QZs0SB1IIhAyt+welB7on5mxSY46Uka0IlfF3J8f0F+DrRUTiZA4KXk/i5t6d+7Qgo6y2VoqQV6/p44hKJ36OH7DqYME/qQpCesj3P/QzEO1ar76Zfi09M7hHOYk7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bjNg6qEv; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bjNg6qEv"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b8e81e2a0bso8048e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790578078; cv=none;
        d=google.com; s=arc-20260327;
        b=Dsza2Us1NZM5vb1HUhJfRMLqtVyKaERUNgb/FZoyp+x4bv5FldVriDixVknNQKH8eD
         0bqgKHFXH/tIkNes9Ce8syo77dcRIOk7O5tTMKWnT4YQ/OqcWieryvbnU9VdokFsBktr
         QYka3rVj6YjKTAvIpErJpiG/mXfh7sY9G/ctesJyH3qry1lqvE8HDUExv6/e4pV3vOvo
         LzmqU02zQ6PwkBuc3676KCLGmwbrozwg/3/8mKaxXsZ9T0/QxTLZeC51IvhsVOtkaD8m
         nRas7UMsSoUewNQUUnzELVJf0fZJQYza2fL5AwSVYqNKXrLHHzMyAI1wFooWfXKQhoV7
         aVig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pV3hKJ3Me7Ojj+atZ/rnndL/YrpQT5uN3qy2jXMQXAc=;
        fh=sIzRKagXp1UC2Lm/1n1AtAQ0k2OBXFjPpHfIexu6MgU=;
        b=d+YyNCMR84yaVbRKn54WBIijhfuCiwPiYB0MoTmSiyb+sAcd4vkHbSr3SBVIZyfsM1
         b1iRChSbL8eapj6KMo3JnMUAUTjvrJeGdBBrnYMUcNkuU/Ange4wZPhYdiB+aW3vvUSI
         YsIRS1p7oSLUj7mpSpaAudm+5sKgEc4bkTvmxa0rXUEuGpNSAlz6TcHxyYl7JoPFlMLA
         XKPPSR1Uc63Ib8aort88U7RXmfKAW3UTtgDUpUdXCbVS5/ithKCBkyBTt1tPCnWRach/
         JKg5M+Bgvka4y0ZVO8TpKR/GePMneE99k2Attfdi4rMWXb/9jntkMSo1Csu4ep3Hzj24
         dvHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790578078; x=1791182878; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV3hKJ3Me7Ojj+atZ/rnndL/YrpQT5uN3qy2jXMQXAc=;
        b=bjNg6qEvthaPq56eY0zkjQujLCNNyhx37OiAkgd8xVmQJjwCyHX6PJ9BH6UP0U6O12
         TTOA8HFUO0U462uZwQjLP67Ij1Tuv08YdbAyF4G7jxdTPNeAT8xMfThDYWNVffAw/9Mh
         i7u0JqAeIDjD2BjUsE65QL2Pwo8AqxLikat3Fk7RnIqZFEZfTsCYUDrbsDKfA4DGwRD0
         ZmX2ZSU9CPnuJfadzVrP0qfo7HXw6o9aHvaMY3Hw+CYcEdHuGVc0dO/CWs+BnNwpHO4h
         iyErc1VAP5+XxNXXD4FHCX4t+K1G0jhULyBbqywtDJA1sPl4upH1UY5rKpY32O8d/8ns
         OrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578078; x=1791182878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pV3hKJ3Me7Ojj+atZ/rnndL/YrpQT5uN3qy2jXMQXAc=;
        b=ngFhz+eWb2dXbhKFLM4pQFPYWyYLQ3QIEKBMSrHNE8rD3Nuhesv1exohhKoa4ISSk1
         z+kHIzXjUoSAz5AVWR8pnK63EXBybQPrHGSoxETf3eP7+eneRoHPgji6B9dW/qiJCSXl
         ReJT0V0BlueW1olldubg5dCHPgQrPQsQfRWwjKda1T4YlqiaBkoE+xJunQQ7uCBVxunI
         OVWEE264Z3big3h6VPp5ukP2yNSI87F445bt82UlZd+28aOTC35ivSg17jXFqPGLsdkd
         WUFA1ZOSrOkRuOO4uaZkf2Fkd5yPn9HsmSod9PZuDXMlbvYmpLp1aYAob/IFlGIHsc1k
         fBFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx35L9HLhdV3uxcJVcNDOeB0zoeHr1o9HxrN7L6o75UFk/LIiago3CxDfLZQAC/P8GQUueYX2X0kIFcPH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2BsGexRNSkMaA89B1QuGq8vfNk4P5ajruilbwrojlrryHbRQ6
	Twe77Hvme7lOCQPH71v2Cwi1HNoAHcOaIw/ph7j0oavWpYQJuzMQUuDNVbSQdbmkBejOJIGCSZI
	nVsIaDUkaGmz5amSdtlFoldKNs5/WJkOui1kG7TvunPpvvWFNPf2Md4sY+zc=
X-Gm-Gg: AYBFou3PSYUpHImUhO0Z7F3or+ATAoL1TPzn8TSikaHxucRVxoitzpj8dtbSzG6PvGH
	FT6oeYzl2kNR2/6A9SyCtX1acDPaASvA3pvdfBiHhxP4Ja/+p8H524x5hBKCL8LM2p7OqMXPMXi
	hQuAh0UDk8mWIMk1DHWQTDjTgL8JeoPoztcjHNpsmuU06VGRtX1MRBHC3DcQVzi457d7bwWRR/l
	nnxZyhsXtBeNvvJ7JFeLw0RdEtJPwzRaxaOalu8QIa9uuWQbdefG14Yohd2oGHBPVjmsQiVNyJk
	JUdFtjRE5y8WNQwqn9G+WFnjuJ48XPO5P6VEij6KQ+8uMYMzybdx6E4JLJU0g5X/2/Yhs52g7QO
	gOTRFQBiRrRy7
X-Received: by 2002:a05:6512:220c:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b8ef277c63mr143069e87.8.1790578077022; Sun, 27 Sep 2026
 23:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907112944.313618-1-fuad.tabba@linux.dev>
In-Reply-To: <20260907112944.313618-1-fuad.tabba@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 28 Sep 2026 07:47:20 +0100
X-Gm-Features: AclHuK91QbBNcvBWx7myc6pcingVvXraYotkCaAy_hj6gs7ZUrok019AkyOIvbI
Message-ID: <CA+EHjTxV5G=2Ffjh6qbUqet4rtfK644vpN_Yp_c3y_GOtUpTNw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] of/irq: msi-parent handling in of_msi_xlate()
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob, Saravana,

On Mon, 7 Sept 2026 at 12:29, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> Hi folks,
>
> Changes since v1 [1]:
>   - Added patch 2: end the walk at the first node that declares an
>     msi-parent, with the reference handling moved into of_msi_xlate().
>     (Lorenzo)
>   - Patch 1 is unchanged.

Gentle ping on this one. Patch 2 is the msi-parent walk change Lorenzo
suggested on v1. Anything else needed for it to go in?

Cheers,
/fuad

>
> Patch 1 is the v1 fix: of_check_msi_parent() hands back a node reference
> even when the caller passed one in as a filter, which of_msi_xlate()
> documents as receiving none. Patch 2 is what Lorenzo asked for [2]: a
> node declaring an msi-parent names the MSI controller for what sits
> below it, so the walk ends there rather than carrying on to an
> ancestor's msi-map.
>
> Patch 2 removes the line patch 1 adds, along with the rest of the
> reference handling. They stay separate because patch 1 is a small fix
> for a leak that has been there since v6.18, and patch 2 changes
> behaviour: folding them would hide the fix inside the change.
>
> Based on Linux 7.3-rc1 (cee9395acd804).
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/20260904073424.3855365-1-fuad.tabba@linux.dev/
> [2] https://lore.kernel.org/all/apqnaNmeuUjfC8Ng@red-moon/
>
> Fuad Tabba (2):
>   of/irq: Fix device node refcount leak in of_check_msi_parent()
>   of/irq: Stop the MSI walk at the first msi-parent
>
>  drivers/of/irq.c | 39 ++++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
>
> --
> 2.39.5
>
