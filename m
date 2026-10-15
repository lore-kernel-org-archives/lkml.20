Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4704A3D2E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050350; cv=pass; b=rc0UtoLhn4FFhIv3eOMCkV/NiXTfrzAWpgLp2qlFWlZD+pv8PLiPkvFa5xZC6gDxr/vyuDUR0B9szJks6vyyQem7wsQ0JV1Kyzse94qFFlaDFmVyiL+OQESOWoCa8Tq65dUUvlA35A2RuhPdul2725/+CBrqd/o7YW32+Z+CH4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050350; c=relaxed/simple;
	bh=kCPrYLuWO8Lp8ZdbX53M8PocjLPBiKN9r04H0msOwHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJHiUAOgBcNhOPLuSsqpGC8JsWaCYAidv074q42SrIVkqvdETJg7Pt2DsCMT5Dyb0mNGc7b2C/n/g4ctSc1X0u8aeXf1GyWE171sATDsJVUbrEqs+wg44UoUVr6FQMWTUR04+sN0Yh/nT0hk1T21zhT+LcVnGNxXeSeJ8LjJKQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmXD1OgQ; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmXD1OgQ"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535a54bed9so2661382eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792050347; cv=none;
        d=google.com; s=arc-20260327;
        b=AcHV2Z8YTot4HP1eSTsUxAKLYDDTI1VKj76Lx0hQ+gBL/aGJ1dGQq9//gKDqYkF/rj
         GAn4XHGUEY8Y0J2c64BlcnjTVW15b4esiTzuT8hRrJODBDyhEcrctcdGTKgBhos77DnQ
         dwyLcYDOqzsKHAJgzJb6G4l1dYkHR5B62avZ4s199Ux1mN0/uFKq47LLWAtc5q6VMQGz
         Z83tU1xzLgv/kMSdhC1lXyfR8u6gH4tpg8h2ZhCHRY0NbCVAdDHcaZrGkmpWeUxGC4DK
         tdypHdslZUihSZs25JvmixSstVXCfeMEujYYwD8xQpu2jNfXXQymRtgSE5gqKSZb6wuD
         d38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kCPrYLuWO8Lp8ZdbX53M8PocjLPBiKN9r04H0msOwHM=;
        fh=XZXMfMSxxetJCVbgDfsb1XRE/ghov3KhG87G+k3Cc9w=;
        b=RS9CKDb9fJTVBi9800A2XxgOOs6+MH0HaSp9FXgfgEifr89sEXUDOhHGOweNPCc0xg
         FbnVGgP8F7rAOWaZdRpr+f8pmVUGnllrUQxXL3ULfWWXZNMuVKahJ4XgH6hdrttsklK4
         ESKRoyNsvovjm9QMjF92KI5hyTwhvOd+2KkKja5NFiJmWejStShkvW+/1wgOfYujXAZD
         SRtDZz1q2Cn6RBNxTdCqB8q+ygkE68AUt2T4sAM04fJ1LLNMUY3GQ8gXxElGTz+n30iH
         k/2m87Ly6CmpYmdig0kWtZCFWs7g9qze3I+l+aCtfIrEgCRKOt+88rm3wugiFE3RTffW
         Mz2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050347; x=1792655147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCPrYLuWO8Lp8ZdbX53M8PocjLPBiKN9r04H0msOwHM=;
        b=cmXD1OgQNrTBAqk6/7tmP67vRolPXu0Xa7ZtqukZYtIDJgPxN70Rcg07wDtHYLcsZv
         fMp9NT547SVB8M5jdMDaL+JBUZiFjMk0PnWPaf9eoTl+hnZvxlD1PhORlc20YwxyrPxb
         HqCc0lhFfdqW9h3WW1rO8q9oiyXEQGOT2n1Ly+Ahtt9ydAVAVJWXMakI5AZaQpW3wYqt
         BigEV/1xk1GHikzUjdAseEFcPswxjdeAZKG6i9GdQJSH+ExMpHiU9MPGGRx7BpOzp32y
         1JLo30aBPFmKYuYJH4ES7pfc221fxc55xO0k9HpebR+MRmYvzpG9bEFaUfBIrdh3SSp3
         W9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050347; x=1792655147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCPrYLuWO8Lp8ZdbX53M8PocjLPBiKN9r04H0msOwHM=;
        b=cPxJrihJGe4rasNcE2RFKFhb9yllLBEUM8of40JF6tH/2JclazJpO+NIHVlJutlLUV
         khF2WFhOa6C/r6yWX3RXlMOoDf90/lZEMger6b75xzUNArW6MudHzxi0jOCa41yz4gXG
         9Hfe7kk9YC83x2TlXhlNXmgbUypF1WsygQy3uXjx6w5uQXPhpI7iWVs3pzjmnU7X49c7
         dB1+AA28R6QiUR19dMiZGpb/OqU6FpDU9BUF7cno5TmYDDGu2zidyoUJLR19sbBui7zm
         EE6srvtJvi9uXCkbL2hX9Necp4D3L/Jwo1vnBP4cLiuiPYwfW4nGh3jOnD5ttp2oG3lU
         0Bjg==
X-Forwarded-Encrypted: i=1; AKwUvBy/Hv/LKHgfswcPir3rV5MGgfNsY+M0RZpcOVIlfRM+ebtCLyFSR6w5NSgxSyQATF29icYa5+UM2zdDk5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPn7NqLwc76aWdxPLT+DDYWFkf4RGNMcKEJAE1Yrmc0WL0I6f1
	Uk4pO3ZEjx76egAoBnbprh5N8VLSDnpBbdW9ecQt+nx6htIb4biNBDWm2sxyoV0gLR1p5E0dWvV
	9AroKW5SE4y6l44OI2yKnP9wNQXN5a7U=
X-Gm-Gg: AYBFou1NFyRQLbwJ8PKRj14i/OcZDMTwG98aCrX4cD6jPBI6uwdK1pyDRGeFebpGcCl
	jdRo/+YQtyonUDvBiYFkVHT864o9O5eH0HH910lwXVvjDes+MazC+2Z8mJwBEFbwVfP4NBa6soX
	FXuwdJ6enzSw5aMd7HAhpjC9+kOJCLtxiHGS/WeekEjeiDHxTUiAANqkjz/UvK2EYUoh+XHq9nf
	xwTxpP3Ap89o5JhNuI1uWsKslpKmKK850Bpf3GTYR+i2zekj8raLfDpeikkYOVQKD7AilKZMFbF
	rI8+jp3cBS++SsEIAaY3KmkciRdzX4MPcfWQZrZLHLcvBbYr169M9pB3tZwzkUSOYD/YX1qQ0wo
	FVeaYuY01vSe6
X-Received: by 2002:a05:7300:cf92:b0:35a:3c46:80d5 with SMTP id
 5a478bee46e88-35a3c4689e0mr13623404eec.0.1792050347121; Thu, 15 Oct 2026
 00:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013184755.530392-1-clamor95@gmail.com> <20261013184755.530392-3-clamor95@gmail.com>
 <atBzoZhsanU90pxP@monoceros>
In-Reply-To: <atBzoZhsanU90pxP@monoceros>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 10:45:35 +0300
X-Gm-Features: AclHuK9K2QRydAoWIjgvp0vfxdb0H0LVdOrWtHQEIZxa4k3bTKOXeIz17sOm7BU
Message-ID: <CAPVz0n011sUEWzdybBf=M8Euf4oz+E0J8idhsicpZtr+dwKDgg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 09:3=
4 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello,
>
> On Tue, Oct 13, 2026 at 09:47:53PM +0300, Svyatoslav Ryhel wrote:
> > +#include <linux/i2c.h>
> > +#include <linux/mod_devicetable.h>
>
> i2c_device_id is already provided by <linux/i2c.h> and
> <linux/mod_devicetable.h> depends on a lot of subsystems that are not
> used in this driver. So please drop the latter.
>

I must have overseen this. Thank you, I will drop it.

> Best regards
> Uwe
