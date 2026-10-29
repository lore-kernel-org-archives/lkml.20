Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284982;
	b=OY1fCq7bSwCVPvvvnoKpBunxB2yvtivX+jSJjvl/5dyrqcfL/CeWZF7ReBOdm+kY0etM
	 8fOgs+zUz4MW5F2x1JyvdTLuO8IuefwmB14ct3koORNlKKACiecUMy3TPSKzlmnhN21YD
	 3n0k60ugkahCqcPWDLfZ48VKCXyD5w04SwuP+dQFC8cxyhBOctI3a+QXoPitiGWWrm1tK
	 e8S+sCvGaPZQVsQBE9ZkHLxAw0dW+HnKrwH9NCs7FVx2ZSCj0JYpXPBk3ODtO1EbWupmO
	 RzttL6n7yLzzHvEpOCTfskUMx+18UsgaOMnGYyY6BcWzxg2/NCA6iLhfWEz6ck/BZfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
	b=TE/nPoyt2fuz3B8M8VV/aACahwJf8SjG8thNAexgAYLzcLfBuXfCVlv2Gi7WXggVtFfP
	 bau6YuYUnJ8zKWJBNps+PfU1ADP/ICY+sBY6QDyynaK28HPUk7ZIn+ouWOBJm6ZG1HYuE
	 //MhiT9Kh6Y6jIXG8R6dehwfHIdYoVMGiUGMNY1+sQtQBCX3HtvXC45cbOYZ7o+le27Ta
	 IZTEeJQd2nFPZGMcM6yWHwMUUP3/VUT5yEQJSUfhTZ22DXbve0Zz51z/dS4tQK39LzjzQ
	 RL2/gf+NDsXZGspJh7pc0C8YqY7uvKQ6lSdsXA5upQgN+QfxkSyDeTxcgXMhPtRYMrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0stL60wK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D840B606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D840B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0stL60wK
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4c9abc1824so34206566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284980; cv=none;
        d=google.com; s=arc-20260327;
        b=JRzJG7aEfOcLSYm+EDFvg5PD3/dWnGvNA6LgVSyr5OT+ml3Wj5JS/C0f0hUT1oa2Ty
         epuP4FRWrTAlTiOFpCw8v9stUb3fLvGOW7k7rwsN7GzLjQcWxkmybsaz/vKJS4xyN0n7
         wvcnk/LP/uOCAAlPAAsfZdsvb2ZEngmEBmLCnZHpzCIMhlBxwa2bRJ9d31TI/UThXx5C
         ye3QxzKrJ/6kebFTG9o6pozyB3fkm8BrnV0+eDSrSTAooORgIuw/M1IG+cvhXb32IYtr
         QPuG1QzTlV22G6Cbh93o334K2RIdfuVi+k3vh3ol6hA8+yYrVNA9QdqG1LYVu4jhhFPR
         bkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        fh=NpGxUgju0BzZp9uENxl+VfIAihXUb0dwAt2bBSrcbwk=;
        b=O+RIMF9xudF3/WQnbzyv5VNRO14yFyf/NFTq8rsy1ELxomEOpQT7oc2qy3nXXgwjb8
         20M5xxiNj18v+bWLCd04bA5y3AS7dGoPr9rfipe8mupvfxOagn9Q6WgyWRaPMLjb5KWM
         ASLkAipq8nNUITYIZWIYDXPuB3Ut1c5aXtUB7ST2eZ0uZg77+vIQ8nR8+ts8J9+YSmyA
         fcwUb0u8/Rn/Vn1RKOn0MXkWx4DWXHs9++Wjb0C0sjQ/KU28bGCd0k3jcStr72agxBAm
         2+I3JmBxTk4HGdmOQrMiPS77VWol2EIfb2+vrFariV+AtAc6DXm8ypjsdfEDvtSKeAde
         zjkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284980; x=1793889780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        b=0stL60wKxdKw/s6tHgGvZR0/rzg5KWUL5YTsT+3DjIAzJ+OcSQOZaaHNrT9ZWZ/zh+
         +Xl8MeNrwF56V5jPtuB+LEMmCPk+nSFiqX8R0KfIboElVJg6LAtPXEveGIDUH1rDFZYf
         Jmjb8UCIUbLQfpI/mRHamUeswF/G5myPdqNeQWkjb3AnBw8XGqeD+C6LDc0eV6chfVgH
         O1Fikbjje6CXtZlmMNNthSiVQwxiIecjd1ZpEPoT+i63vefU1BGoUZQVkj4vteNlPh+A
         Ur/oomBPTRABHVKfjTSPzVsPnwk2Y+j1aWLVGn3iltW52D0RxfB2lNY7MgEyo+J+4ssu
         /N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284980; x=1793889780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        b=dZ08HNOgIVTFLKTnzHrGmVpNEIQ+rAEcWmk8LwFq5hC2xYwWyqrWncvLcZb7oGo6Zf
         oKk3YFgx3ifNLN+2p4fSpGKAxL3FoXsL0IwTXOmBRpFoi5qXn+2wrpUSdL3D71sueE/1
         nC4wa7qU8Wm/qhqPE+QjEOaNluzQAwCdnS9OoBOxUo3DQyYI78kg68pYFeQKQu7zX2TR
         O9zXUCfRmvok4jb18NwQxpnbBgxH+an32Zh4CTMRc+8Kp7p4G4QI2MWNuVNt5aeh/NQG
         1F0X3eZeCN7qe2iia18dZJfAm7WCcsosQOBudkSpTBj6oN1j2g4n6CMNDyEZYBCNfrEB
         D07A==
X-Forwarded-Encrypted: i=1; AKwUvBwLaxdYbKE+kQ35nCnbx3PxHuGg1dXYk1oH5kigTNP+W6WEIfxzVCYjvEttXDr2hUaDzM0Fa+v7JeqcHqs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNSpjOiwcp98UD6qhxdmyAyxM8s9hkGdW9AArDKXDkOsvNS/Xw
	bCydufa6wfOR4XDMI4SH5FrRvDU55iZXzNAMUg/jpQqpcd5P3J0zF0wT+YG1enHMPmJ+2mjuwS6
	eaFjAcaUEsSb0DK0PEXyaZv1gD+psTX8=
X-Gm-Gg: AYBFou10d+gI1dUKs5OH0n2y0PtUyO6CU821Hb3Lz6tNigfIO1LZN+8375qvVS88/5E
	YVQmUxsSQ0kNGK1+V/Y0o67cuUWUl/QNT9BcpvETMyWPgnyBPbFRoLu0Z59kBBfnGxRThm+uGHa
	TB+Y19buKImPItHf3axnY/TeT/1JeICQrH9hkrcTFVHFn11U9gZvA8VNKBlmuFbXPfpxJbXx+R7
	8v/CojGfxBeD0QnaXDC/CgLGr2ikhAE5ba6jxm+iflJKyH+fd4EZ1cqVdzYxOCrZpOSJwuXUQVS
	ZAeR5qxVdw8OGzDxmJTyRYb6NM9lsiGMC4o2OfZBQ6UNjBZW6VW/4QhyQK5QKkes5uXbKHAT9fw
	kjFTEE6UhLUjcl26Po4w0IEWJNg0rvMrZVESad8DcNCEVG0Czu8d1iVhBB3qsgEmKuOrwokrq7e
	IiHJyh6ecPlcKM/wziGM9gtdS1yQ2dL8pUF64uFEZpZhahB90ZDQg=
X-Received: by 2002:a17:907:94c9:b0:c3e:34fa:611d with SMTP id
 a640c23a62f3a-c49be00bf6fmr469836966b.35.1793284980100; Thu, 29 Oct 2026
 07:43:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com> <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Oct 2026 16:46:28 +0200
X-Gm-Features: AclHuK-5fF5L0EppdkS4D8ZIoBbTyK3ZL1smqB5yKpnauEf7H2xoksPh6zRmaVc
Message-ID: <CAEnQRZBsKsDGhABri5MwiPSL1EGC=a5=GfK9H_OX1jXcYnerFw@mail.gmail.com>
Subject: Re: [PATCH 03/11] gpio: vf610: simplify with irq_set_irq_wake
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual enable/disable irq wake logic with a single call to
> irq_set_irq_wake() to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
