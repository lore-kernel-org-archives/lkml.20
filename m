Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3407368D4A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459306; cv=none; b=jA7vNDEhTEL/6EKJuKtglYwl9vyCpgUDyQYLL4oSPpzEaDep+k54PWpWD0XN36tSyC3uFtPPvTF+VVfepIbBfJmTA222YP/xuSG7hJqgoWskTSWeB6pC7BRIp+iVoq/bxql93OlOMz172jsO+KfsnXaNJvk0SR4/UMzzM3z8+1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459306; c=relaxed/simple;
	bh=FOo0Y3p7vyu4KKdgSMto6VL5M2vg6GZPbJkqE93g7BA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lR0O1LJdw870EiKyj8fS/hMoGThyv9HQphiUeiSGeUchXtwhrKO8zZDOf0EnbQ8VUxhdG4U3KLE3uEnPKyVYjnUBn0XkbniZOmCMllvVJSQRb9S7hhlZIO0yj5DL7uAP/3+aPlFlbF5tULRHn8APMN1hpLB+OMKnCL5APxzxyiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNJ2tfLl; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNJ2tfLl"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso4530387a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459303; x=1790064103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5VtSVjDln4jqzVqGjOlnJtu5rx3kg5yWZwFJ4uLXpRA=;
        b=qNJ2tfLlSP2GHW+UCpN+L90Q0rXKgNc70fpR5zgRM/yPD5cj1RGvfYlo52n2WxNwJx
         qjMusn60MIvnV9Jk0Y7LT9AnysHymsrggGVek1yBNF0/QdffaEFCXKj6z4MYMWfQbQ0V
         KMoHudnOWGTJoxfszyYkpAoDXq5BHUpiOc9Nlj7CiFwVmeiI7JrJxMkIRRZF9gsYqg8Q
         2jrqeeJKOQde9SgsWm8wZDD2D0cZCVFRwHWemb1jwh7fyOze8ORWlIq3wJpMsnZ6KkN8
         kfW6OftZmXqfUxueBRrvEomRPQGaVN/iefCX7h5spKu3K6L8FcSUisk+LbowO0pvyPhZ
         M0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459303; x=1790064103;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5VtSVjDln4jqzVqGjOlnJtu5rx3kg5yWZwFJ4uLXpRA=;
        b=Zzz5F+lTR8zfr2TFCqzDB/u0a/4MWOS2UJfakMgtykqPf10h/nSoou58TIwRpl8ck5
         ZzVZ3geH8dlz/pSfsiE5fHTmHDdydd6ikCzZXP0deTIZ+FZi8reowhzVXr/FRGaFK2nr
         H4teVsH0tghUoPwTo2HsfgC7JhLjvPrMd8XN2uReNYKUR8eOeNeF1wyYhVERz1iAUXFJ
         CrtfYmn+1zySEc+CRl5QspJAlSosMvKBGIl5Vqj8p4XClpQsbu0VjzwwEKpKYJSgPvVv
         H2YogSctidrBhH/Ch5zgaLo0y2nSPgwovUiEuzpZ8dMA+zj0NtAIlQ8dfwXLegYumwmM
         12YQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZoukRTnCP5OMK97Si6OEL5zXo1Bi8wpKtetEWCWqG1CYoobU/KeoD/vn4nn93p90Urb6J2L2IkKQYIjY=@vger.kernel.org
X-Gm-Message-State: AFuF++maYhUPx+8o2ce5jAx4d+2OaVdHlHPedsjzscOywp91Aq20K4Uc
	ADkFg4fJ6cRa5BGCY+W93bdoDiHAVeN/mYU3juuyDstg3jRJZRaYxua/
X-Gm-Gg: AYBFou1pQ5mPNgEqF0WtxsmbK1Md7VQI9r5+Cs3ypYrwzU5mg3ivBEVy1K9pxeb/LPK
	HaIyV7uAZ7Q/wbCRrxVELSVb8dkXEHIbQ8OjnD+x8oYJcCm+xjdSKTmQ88gDM104CsjCeM0OPwp
	98m+FU4/SPMLquzNW3hq7DSkNlTeVMmOfj2rv8VkxyAB1TbBR2vsopW70bKuqoffjNg43YJ4K5u
	FYf/TaPfuiu58NJdpAD6UErbx+pC75os2Mt3YQRislnQy935bZ4nW2lTrlAmzI8LWCaNkZQ+0sC
	8IIuGrUwWtN3Iz64bCOOaw5utKikFtsQHrwOGKUiuqo0JO7kLXW4uXyctjQZwqkwl0RfDVwb+Nv
	CdxaLdPhZxcshr/hbRCWRijAhJHM6ZoVliLRjRV8Gy4s6BuhX6zFt5p3jPpJMd6nomMNBQOYE8C
	PG6r53aqY5UDlao1z3Iz629zwdvzonbH9CyUU8dPQdvHePPjAi6/HX+L9r1pDLuydNmCqVYBKQs
	BAZ8wQ0B+0=
X-Received: by 2002:a05:6402:1ed6:b0:6a9:92f0:76c7 with SMTP id 4fb4d7f45d1cf-6a9f6398f97mr3990458a12.34.1789459302200;
        Tue, 15 Sep 2026 01:01:42 -0700 (PDT)
Received: from foxbook (bfh234.neoplus.adsl.tpnet.pl. [83.28.45.234])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9c7e82cc1sm4177292a12.0.2026.09.15.01.01.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 15 Sep 2026 01:01:42 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:01:36 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Selvarasu Ganesan
 <selvarasu.g@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
 <quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cpgs@samsung.com" <cpgs@samsung.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Subject: Re: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
Message-ID: <20260915100136.38b4c31f.michal.pecio@gmail.com>
In-Reply-To: <TYUPR06MB62176901C1E1403E65F9A365D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
	<360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
	<TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
	<TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
	<191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
	<20260912141837.06b2f3cf.michal.pecio@gmail.com>
	<TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20260914110949.38a46596.michal.pecio@gmail.com>
	<852003c6-317c-4004-ba2c-d6c4b0bd31e6@linux.intel.com>
	<TYUPR06MB621791B56D232A2219614493D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20260914154656.56824fbd.michal.pecio@gmail.com>
	<TYUPR06MB62176901C1E1403E65F9A365D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Sep 2026 07:45:50 +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> Unfortunately, no. The reproduction rate is very low, and we have
> not yet found a stable way to reproduce it =E2=80=94 it requires the
> device to be in a specific state where the port is disabled after
> autosuspend resume, which happens rarely in the field.

Why are offloaded devices being suspended at all? Obviously, no
"sideband entity" can be using a suspended device, so it seems that:

- if the device is unused and meant to be suspended, sideband can be
  removed before suspending
- if the device becomes suspended while in use, obviously it's a bug

Regards,
Michal
