Received: from mail-ej2-f9.google.com (mail-ej2-f9.google.com [74.125.228.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989B6377ABB
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791237707; cv=pass; b=ocfEBTQyyWLnVshzjmNAA4RZE7QqyR2ERmqrFpp6n2H2XNTzK/HHVK4PMdakTmW6NQxqlYu40+92ehCOJBp4bapgIfz+9tq34Q0AEAGaSILLprV9Qlg49TJ7OMvsklZzlJl90whcOTfViE8kZQACPnWltnhF5MRrTSic/Gehy0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791237707; c=relaxed/simple;
	bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M39ZYr05P2PMPv3h+Yp9k+Bb3g0v8I6hnGnoJISawu92DyJn+YFdrJhduQ65CATRgLVTQ5JgObjHqEmjUVDAAjOdGlYk0/PdE7h83YDvF9InR79cdyCk8t7TjA2Ga3ROr+KBg1enO48P9Ex2OwlRrAE1udLvnBIcjScO/fotgqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMVISnrZ; arc=pass smtp.client-ip=74.125.228.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMVISnrZ"
Received: by mail-ej2-f9.google.com with SMTP id a640c23a62f3a-c2e31c05606so67987666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791237704; cv=none;
        d=google.com; s=arc-20260327;
        b=ap4v1TT5Idd88YQmzg+yVM+yI5gvFfoyIM44G56EnWF/C+jwy05B8nXdl9GOHEJmEN
         ExYWtD/Xd43M9XxOM1sE7XbZ7w3nRPwtr3GtpoUL0E50f3XlajI6YoNV+FJKnLBipEBa
         L0KBmjTsUdtfS1jv6IGzETMWqz4bRx9bJS/g9PvB0e56rnJIWOiK8hZah3+VZWTvGbSV
         XjXvtujSh9E2QvAXrcd1/SH7FUt6hxyzU8kMDPgxPKc46xJBRDftIRQz8vrYAqZq5QEk
         nanI+DhiGWe4BVNGqOFSsTpPXujjkAjF14T2YIDFeOX+nppzZQPj3ma12ZgSH54FgeWe
         uWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
        fh=veQ/r0LfNQmED+dxb2V5xqUQpLcKr931CNKLhJ5mdnA=;
        b=HGpZ67Vl9TOSZuyoMZuDsAlM9pIcacqV5YfT3YtXV+5wgVgC6ZdUODzRoTNtWrYUDD
         lARvp9MdY0ZhuliEF8gqG1Oj/aKUsAQyQ7LdWdc8EoSjt69nvxaIOrXWVNwV0GT3icjz
         uaCCWeo6OmpRqWMWI2QWZdqDpK60bAtjdX7thuUmB60Pzmj5FX264iM5iiMvX+CDN48Z
         Osa/57VIkVNwUpdJiyTRSbyLuQTL1cyCzWmYbfq2sFlgc1TIErkH5+6nBSyPeNt5uHhH
         LWTobWTEbeuZQceuiInbEmXv8ZuhkZJ4idQ1anBfqMEp6iBTuJdNlUE1HYBX7EBPiN/A
         N3VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791237704; x=1791842504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
        b=VMVISnrZL1wHWumoSE1JWHa4u73KOsWbHFE3G3orTGu7+JYRVCX3S8kMHXYSvdfG9Q
         UdXDeZAVvBHi1OkxNKzhjwcpEiVtfpZoUz224dn3W3H6a7Blp8+xrBV0HTEevbD7k/MI
         b1REuqdItszSL/27/2sEGqUGao3lb3DMzUog2l3cNvXJDBlM4ZTfpr5RHWofkW7EbEET
         fQlrRKaGib4KVSUhgdDFYIo+pklFe+IYLIiawdfQN6LWtnX684xmKOgcFpQAxFtzg8EG
         I8pKC7dGLRknHQO8NX/098ZPGp/FRCeMPHim1YTTvsy6AvSMnooyAvu+sucSvk7SU9Sb
         RPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791237704; x=1791842504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
        b=Wsy+W0Qx0t/NIZ3MrK2XUgr9nFc9oPLvUNWUIIrE7fD/cVdivJEv43h96zerdiUFNn
         LIw/ZfjJReClWWBI6DHx4knd4FHhReAVr4YybhYFRj31mZGOaak7nUSIK1UWt1RU4O7l
         +SrH9vOcHn1SqCMi7SdNay9B/wQqsIBMRl3urdrGyTpr7bEX4SbLqeE6xjUr9JHvahDU
         qk2nRW0oaASHdMgpKqd6bukzsGEcdYe+78H2MQ5rCU686S8HrnWaM9hc4lnnaQA12Fin
         PvVwTKMkhIETNZZKcncSjvEsqkN3O5/cR6tc0+NQeFLCmHdGEJl1fKGDhPhrRgrjpQU0
         ftsA==
X-Forwarded-Encrypted: i=1; AKwUvBz71V2Ut1w4S1qDqSiXWnPctWW92nSCQ/e5PhiPenYDMLZMX2L1uLemWGg8xpVanw6nY4/P4Y5XxSXVBhg=@vger.kernel.org
X-Gm-Message-State: AFuF++kB7xeZ6eWeJyZ2RR+QqCkYQ7k4YDzgHMzf/0m//Y1wDETNA6M1
	+5TbyF8iTHurhLJnZd8Iwecbx3pwHU1n6LCWXGxaV4dQ8Dqbb5K34y4d54ijAnpY2JSZaTcpYMo
	fKTfYcnlXQ8VbPoS/lWLK86BP6EEyFn8=
X-Gm-Gg: AYBFou3cotB5cyt9BzSybt13k5Kbi5Sdz77U1DAn0OM2jckaICqu7hHmJOufTA6Ijuw
	SEMD/QUuw2zp8mIUz/rg+hMr+XzxeOJ8bwDZvHvkzVucWHrppJoFYpHO4xP1Ufb0ZwJjDfCSSKW
	kLSfI1qqEJ5Tg/W1F04npg90jRvcQO5MJTJDn8NkQzIrXSdSuIuJ0O/ZfwNiJln8tQ+nenVtuOU
	grz8K6jd2xeVe/LxeTXZ0lFmb3cZ6AG6Dn/HBNQX4qE83oE6rhSokZD7wOedWpBbDmGXJtp02lg
	vlv8IkFgWtbv0K4v2J2Hkg3POgZ24/zioEYN1f7qQ4ssjXmFFKKj0w2kiw==
X-Received: by 2002:a17:907:2d92:b0:c29:f5d5:5a92 with SMTP id
 a640c23a62f3a-c2e4b007c22mr1011878966b.28.1791237703713; Mon, 05 Oct 2026
 15:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-4-coiaprant@gmail.com>
 <20261005135939.01ccde50@kernel.org> <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
 <asQZ99CMsQF10-RZ@parshuram>
In-Reply-To: <asQZ99CMsQF10-RZ@parshuram>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 06:01:31 +0800
X-Gm-Features: AclHuK-R2LsVgHnJjNmWI_vZ1n3RwcrYHA0O30u1dyI8VYXPn7GxP9tLow2x2eg
Message-ID: <CALj3r0i+sBhefWPqzt76OX+DxEZqzxg1JOz3d3te0sHzHQTV0A@mail.gmail.com>
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
To: Vinod Koul <vkoul@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Vinod Koul <vkoul@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=BA=8C 05:43=E5=86=99=E9=81=93=EF=BC=9A
>
> Typical order is that binding and driver goes thru subsystem (in this
> case phy tree) and dts thru the soc tree.
>
> I can review and pick these if you would like
>
> --
> ~Vinod

Hi Vinod,

Thanks, I'll resend the PHY binding and driver (02+03) as a separate
series to linux-phy right away.

Thanks,
Coia
