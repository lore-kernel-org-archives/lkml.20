Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308944;
	b=HmE2NFFLzSLWUGwOF8mOSJPcTErOdJFb0/tJHzgm1Sv45tWB5KV0/nbwinDQ+416B1YU
	 DLPwEQJekMOFGVM1H/0VpXOKnOTwU0pA86A8vTr1LfE2Hu1PfMNmaz0ocARegQGqiEfv5
	 VrueDYEWOBYN6a5t0kVpd+5VQ4RluNq7qCBXV6RRxfbofsGfMEIzWpDmIW7qZDgbpwFc1
	 jx3HL3WMOBIKFrvHTaDkKnIbkt/znAW6kRP7UrJSp9YQrBpTOzR5AhXpde9B4jupnbF4r
	 UXOFfX5rTgELfqIiD9i+E7SrAi1g/MrWbvQ6Moue38gAuXL9TdaK5Lynv7CaxaMrFbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308944;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=auzMHF9mizeGPb4pIAKNV1dcFrP9ke4ZkvXnr9sGJcA=;
	b=lUkP7Qyw7dc7dpkzkd4/f0unKrY9qvqFGEKV5eDnow8Mv/l76FBE0Ua6nzHem39bgk3Z
	 6rTX4o51JT+qFZFQ+udnDLUWFsMcdDCvSeV4H8gLwqKIbLpcQuXFNySs0Y+wp7OMrpzDG
	 ZQdePEbvKZC0gSnpKFhueHjgbcVIG8B9TbF824nDCLTgevllSqsOmtkaRHTlL8F/Ku1Kw
	 gXgXtBHVE5tJmDop/56tqin+MjbkH293hxYTqq32Q0SbFJ88Z2xeivGeYNSKnNzu89EnG
	 0oN6atDkqU30ZB23LZ0KLfrqQNv2sgHVQ9JPu4lnSPyyAb9RV0ph9CZX61elNimt3SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CF9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CF9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eac01ff101so633626e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308943; x=1794913743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=auzMHF9mizeGPb4pIAKNV1dcFrP9ke4ZkvXnr9sGJcA=;
        b=RjL4NPUarO7z4WvfzKoZZJXgA/WVAzGOCfQMFxM1RH5elpace2pf0NRQYP5FNxZMP6
         pWA/CNPeU4crWbL69vVgDylAsJzMzBJdS9kR34XCuam64OlDvgTE8dUHcHFag3nlnmwg
         cN4gdkkMYf4WUcu5f+bjAV37leEujc4gOA7Bv2qOS842Kxbv3N3t1z1xjjyFQjF4xwp6
         m/jDG0U9d/xRbPo5f9MC1V5YTNKrDfyJRC7jVHGNcE61j2wFN1gDoRATnun/EY0Ub//j
         3bxIc/I38PyZKjedxjcqB8Bs/ZNMmp3LYjbpLTZblu+U6Y0YnT37GbzQQGzfdVnHuFfU
         gfSg==
X-Forwarded-Encrypted: i=1; AL+hErGYWrtGRbigcWE3p1RARnUrcHFLHEzOX7KPOuPBo6h1NCjTQKlLCJKSmfQ6plPYv5Oq1hMDQLbrm+B6tnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UGiCFgk6M8yEBKYUAXOx7WfQdco2a80eTlu/kQ440yzjNgy6t
	QlTzmAwsB8deiaG3rsXdlE8sDf5IwjmR1JWeaTEnfGxdsLuqNrdaHh1XQKYCMdsVphQ=
X-Gm-Gg: AYBFou0ZeGn9g0lREbwcaItkL3ViAJQfD04m1QbQuHTvWLB/adM+Y2wLG3pjSMc0aDY
	O9uJg336HsKaNu3Rsp9uzwooFHZQGRQfMu7icsq90d2bHoN1XjNUbJHA3ml6vfz8iMNsO33pQyi
	Cc9E1ne68Af895sVOOg3GxEQwj44zRZ3oerqTmSnCUOTD2gBOdNH2d6UyTuogeoBcbZbw1abgCy
	jxz8HOYN5aooIVJ9YkuWFyib5Ql6wMvnedR4VzUGdQFZwYaKDY8WQIYXTAA1M+smZemwMMdnMEy
	b7iEtsCqrviCydRT45QYS353mRXXxSqzutHfKERr67G2Ol+8IPOadwKMkPBTbwqaoZDQYwgLZUh
	xlRtR/dBDS74ItJ+UAic5RYh8vz/YUH2t6IvIbhSvDnDoDtCrbArG43tS7uTaXysKw4UUS86AcM
	SLt9txUDiFTvQ1WP6tCfwjh3IJspawCtOKATmsWBwwsqITYJ9WFHDP2s1sR0ZnTRBOq5ndFCfsm
	6iN9Lf2S9jCAQ23h1CAT4PcTCAI+735nTp4P0No6qzVZtcYbPEYihQ3xUUaTQjn4/kD11zzfEda
	u9CE6f2yDcjv4yaPRbGJcG3mq8srrQenoqdMbDb4wGYPizIREY/IGXyaxxG71m5XA14=
X-Received: by 2002:a05:6122:4f81:b0:5ea:ae99:9b2c with SMTP id 71dfb90a1353d-5ee0d1400d9mr592879e0c.14.1794308942596;
        Tue, 10 Nov 2026 03:09:02 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c45a110sm1594706e0c.2.2026.11.10.03.09.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:09:01 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so659293137.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:09:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGN1Jdcc2GSfb/Kb3ATu6u+4WoIkzZ3pT4gwASf9bAR7lQaGNqTLg2zfodkQ7/L3Uq03VPWF6LWqhsw4M0=@vger.kernel.org
X-Received: by 2002:a05:6102:688e:b0:7d2:d65f:b479 with SMTP id
 ada2fe7eead31-7d301c226cfmr561698137.28.1794308940907; Tue, 10 Nov 2026
 03:09:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev> <20260929-loon-of-remarkable-romance-197df6-mkl@pengutronix.de>
In-Reply-To: <20260929-loon-of-remarkable-romance-197df6-mkl@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 12:08:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE1Jh605kgj4ADU7p1UjE-0u3ydBehL_5wsQPbe1EPMw@mail.gmail.com>
X-Gm-Features: AclHuK8XmPD0hM0Yy0td_5BzKaCizARWIEsuGHtnTdehhY19YbtXTFG2NJSt-Nk
Message-ID: <CAMuHMdUE1Jh605kgj4ADU7p1UjE-0u3ydBehL_5wsQPbe1EPMw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Tue, 29 Sept 2026 at 16:19, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> On 02.09.2026 17:15:37, Claudiu Beznea wrote:
> > Series adds CAN support for the Renesas RZ/G3S SoC. Along with it a typo
> > fix patch was added on the CAN driver.
> >
> > Merge strategy:
> > - patches 1-5/7 should go though the CAN tree
>
> Applied 1...5 to the linux-can-next tree.

Thanks, but six weeks later they are still not visible?
Same for " [PATCH] dt-bindings: can: renesas,rcar-canfd: Restrict
resets in top-level"
https://lore.kernel.org/20261009-holistic-warping-puffin-3b92fe-mkl@pengutronix.de

Am I looking at the wrong tree?
Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
