Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794148448;
	b=NeRTO8cjIFUVm/kso/Jv+VfzhXL5cYQqRbBp8BJweUSAiG6VUD/Uo6nokNB0l4sXc4et
	 G+GM7XGbRYmYzjnNqcVp6V58jzfOk2Wi2Fa3ac8/1uJ7WezLuTLiyOJEWFqle7uLgFRI2
	 AyBbPrwHw3zETPKEJKIt6GQc62bafFxLTN6UpFs/HEzhpjaDhOVx7uGpfJeOE47rArITd
	 UEYLTp0TkLW2oGeGXd0iSLWt/oZ1vEh1D54VPCcneieXCgzC74ynvDQb43gQJMQjiniYd
	 NOh9aHc9lnrs1+h9JFHtOx3lGqzvwMlNwzKuMpvh0zn0MjNpY+GInbjtb15wenUVFSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bZ6795oK8wTcMWcOgiycQWPJ2nyh3zzKiM/vphOQm/M=;
	b=ImM9zjVW4OJjt17+pQxmwHVKEUMut21SMQ7frrYCPh7LhqGmwWPLKJqtiLp94o3t4MCf
	 JF1eMOppF2EBZXNXvcUx/zNntxq1BytbKj99tSxA+Umu3IFiR/7ACI8u1fZhoIo9gGAVj
	 Hcd5xX48N+8NQjoOz/QKVl7LwmV+znTWCIXj7mLqFAd4VRBW7y3ANyT9/ePLwQrxyWMVh
	 Rg7dRvGVH3/ySmqqwvJWaZr1y5S8XxbD8NHOgCjBhOUzvZygmVQvVwoRYrLvK28SgDPcG
	 ZVvtlX+v7+FjY/IBYOUX+QguwMTwAvEok0V49YtWWj4rWalTb9vpu/1CAo4MCs7Tllg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OZ26sBFr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D94F606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D94F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OZ26sBFr
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso14984666b.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:34:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794148447; cv=none;
        d=google.com; s=arc-20260327;
        b=ER0nxnOnivHqdqMswiQs0qlZBVR0D+Vr5MTbn/mTnCMKe1evuWXdE15KapndOUN/NO
         UQmIEVXeq3/VdUbRC6H/E5jXrx/WFr57yDh2K+A+iCqvD2Cp6rRT6wd3WOAuj4PpdNPL
         YDKqyDBtAxk/63pSr025ADT0IKn+Z5GucoXClXjz5xqXIVePeSHxhiLiYx+IbfIEjWu5
         MAhbZIRXG1iqn6L4iFW4Dfh/TR78vDeUg4SyDANyiy6Oocyt/nI7Y7/cr8JVfMtn4Vil
         hq/WSXD5tPYOwq294DSo58OVA3LAscF3RwtRcwfeejRuVbLDr6G9cUCMX7oz2E2n/5Im
         H1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZ6795oK8wTcMWcOgiycQWPJ2nyh3zzKiM/vphOQm/M=;
        fh=yvR3L2gmDj4GQATRnzk+mwvqsxKXxsSJcRZXFSHJbLk=;
        b=o7NkxBpWXJcZS1FQ1sSvMVfSOf78+dF/v4ecjLmGdMKEJ1RQnbiunXyTHX7vkF9QmU
         +B+0onDptExwJrC0qCNX2hVNJLNc3tn0Gp+DlQcPwQNuga071zK/3PcHEr8q2Ndr76kx
         2an03CpoNo2VfYjd0iSq5j0rUYLvzDXQRsaPk8GGvYYtNXZTvOPaWM5q6AKjGdAiiE7K
         FfowqIj/6vKxrCz566xLlZPO//bE5/UEMGyBRmhauXh4lzie5YS9qExjB5JFzrLHQZ/i
         v7JVwsDuQ8EKls6BM9PjTsh9TGameMfQvMkqlxCD0c3CqUjHrvgZhXPmZgHRkwpYT9Ck
         f8Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794148447; x=1794753247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZ6795oK8wTcMWcOgiycQWPJ2nyh3zzKiM/vphOQm/M=;
        b=OZ26sBFrSVqZ3xMp8JAeHhqwdmFBhIT/2ytJVoysCE/YYcfjFv9IdAmvugyPhTOG6A
         bBVhmyu59Fyex66WGNzGwMh34DQuQOWR+OruDqjxBdEUe3OLCshhu0hlxLh8scfKcMah
         TbtTC8dmUDwCq4SqNjKETd4zjgKQHtaEmjN17v+egZbMkH+2Xg3LWL8UnpSYnBfhCVor
         niK9B0T4VfOiuMVuJg9gFtyxAhhIlp/23hWF/Bwfr9PvNxOGbjHqulcYOQcWT1VqPG0c
         qFOJ1NvnbVdbTsQpJec6alZD3D0PD4vjZToWskMScqx3qn6oetIcvAYLIxnYxTJdEE7e
         +LmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148447; x=1794753247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZ6795oK8wTcMWcOgiycQWPJ2nyh3zzKiM/vphOQm/M=;
        b=QldM1Q52HbC4ba7uxuZbHLwxJmeJRVxL9rv+MzjBGDlS5Kt9gCCukAsZZ8kePferfJ
         d9K5aJrdY73SzWvx80cxuzOUzCZ/xYvL8/pXzO2A9n4aqHPMxqrXNsjx1o5LgMAZ/Z+4
         vSfejhoSZcD7oU97Nbw61qZz2diKuHETMq+C7fc0di9iBWydLmg5ZtyFqLnwiU59fpkb
         cRKqtKCBo0gcgGdSxzW8NzZt81LbBxOXQ2x0InoHUy+1V1aNqgAQw+XFgbR3mmhZW0hG
         vOkct42u2/xs78du9dWrJbJA3Nn6baHVDP6w4j9hQCn6F82fqQUg0GfK/6eBNe8qw+8i
         98Xw==
X-Forwarded-Encrypted: i=1; AL+hErFKnk3r3nkNypSBdcWm8x2CSdwOeSC7GjavwzZqlRS2rnfgc7seAWPDkuu31/qvIIfmHY1INYT1vE+TiiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z91DHRwl4aeeD+jzE63+fcWWnwi+YAjyG8O3Fy7faGtEYX6CYdx
	dcZi0gwqmUWlpNx0/zaR51xREbir8LqJ2XSji/3PTBWrL+/XSXIWbUZ+EXahbg1nueOAv35bQBS
	bEltxNvBerH0zO10aNCgcdqHOHHqfjh3ai4cO
X-Gm-Gg: AYBFou2/rX5QZ3hRphyo+Ntdmmps3KHwCacMJY8QUHZd/D3I84xCwakl0iDYpShQOkQ
	ijvxf6b/Kxa7GAoYRu3G5Ee5gLZsY9+sWHLC7H0g+v/LvuGCZKh50906f006BlxYm4Sa2KLm3n2
	+e78FMdnTWsYSUdLaxgG4HkNORtI8B5AnWj6/ZU2hWgTzdZaoH3IPXmdG0aGZrrLbtHo2U6885w
	2WeoQZ0A4j8azuGPoLdPe9s/+dDhFRPP/RitMnVEFIXWJ4SSML6cYGcT80XKPxd5iJjZmeviNH7
	K6WaAVUGyNnmssbmbzfrssUk18+puMpbNbTVI51N9hZ2GGhBXnoldFycAZSsfoTIu3yqc8sg59d
	QwDdI07wJqjtIlUUUe2nUzDHfUdiPrBfGJi2Bc/0=
X-Received: by 2002:a17:907:86a1:b0:c2e:902e:5208 with SMTP id
 a640c23a62f3a-c4d6dad8db6mr119774866b.5.1794148446720; Sun, 08 Nov 2026
 06:34:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com> <2026110822-unbeaten-unraveled-698e@gregkh>
In-Reply-To: <2026110822-unbeaten-unraveled-698e@gregkh>
From: Alejandro Lucero <aleszlucero@gmail.com>
Date: Sun, 8 Nov 2026 08:33:54 -0600
X-Gm-Features: AclHuK85Cj4IQbHtpoDWOX_0elZu-ELS6tCw4SzCaef8dKcau7FRuk8kknnHO1M
Message-ID: <CAHDi9tpvCP2qJfCfU2TFsY4JJVk2Yy-8_Z8uPigN5yWfpMs6bQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Subject: [PATCH v2 0/4] staging: octeon: Clean up PHY
 interfaces and fix race conditions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

You are completely right, my bad, srry T-T

The code changes are in a big part my own manual work, i've was there
for a while time reading the octeon code in staging, searching a lot
of errors whit the tools I mentioned in another commit but since I was
really nervous about introducing bugs or messing up the logic or
explain bad, I used an AI to double-check the code and write the
descriptions before and after the check (im not really good at
english, im learning it :'c).

I get the gym policy completely now. I will step back, rewrite all the
descriptions by myself if you agree, and re-submit the series later, i
really want to apport.

Thanks for the heads up!

Best regards,
Alejandro Lucero


El dom, 8 nov 2026 a la(s) 7:55=E2=80=AFa.m., Greg Kroah-Hartman
(gregkh@linuxfoundation.org) escribi=C3=B3:
>
> On Sat, Nov 07, 2026 at 08:07:54PM -0600, Oscar Alejandro S=C3=A1nchez Lu=
cero via B4 Relay wrote:
> > This series provides a comprehensive clean-up, documentation alignment,=
 and
> > critical bug fixes for the Cavium Octeon staging ethernet PHY interface=
s
> > (SGMII, MDIO, RGMII, and SPI).
> >
> > - v2: Consolidated the individual floating patches into a single
> >   well-ordered patch series as requested by the maintainer.
>
> Nope, you did not do that at all.
>
> > - Investigation: Patches were identified through manual code analysis o=
f the
> >   staging driver directory, inspecting resource lifetimes on initializa=
tion
> >   routines, checking error rollback pathways, and reviewing compliance =
with
> >   kernel-doc scripting definitions.
> > - Testing: All patches in this series were successfully verified and bu=
ilt
> >   via cross-compilation for the MIPS architecture using the mips64-linu=
x-gnu-
> >   toolchain with explicit W=3D1 compilation flags, ensuring zero compil=
ation
> >   warnings or errors. Style formatting was audited via scripts/checkpat=
ch.pl --strict.
>
> Sorry, I can't take any of these patches from you for these obvious
> reasons.  Please go read:
>         https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
>
