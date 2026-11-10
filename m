Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794313347;
	b=fAJGFwBJNb8uSgCbgNQNjm33212HgGryA490/R/zNGkH6xytFidpfZ1ppUVGgpFoPhhU
	 BqmGmDBB+XxiAjhdSBOmeyX2NzZ6NEC66VNKzbYY8r5KGlSiHUMVA4kCyo8fXVrhWyKEP
	 fkR7X1u7VNU+JigO2eOBHa65azziJulsDzRiYFoELSbpoUxAoLXN0BWrWK7bzM1j+tXEC
	 eAnzH42BAGZFRn1s1cj0ga5iPvUHdrUKIc3bv81YYPyWtCbSWpNNS2mdry73aKuKbzRpa
	 H+X04EAOQrZY96OnXaQSIlv67YL4vFtELXjHhyVRGXlPafAjcBCCZeSiIoWFjszKQng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/+MHJzkrQTBa0PMMy0ZmVpPU2O2nIABhjZj+wACly9s=;
	b=dfKrb0Oh51r0n+fYnAhiz+H7VKLEBA9Y4h51liSquA5Un3Ip2ynr83oM2Wzk/LzDFAgM
	 ESRd3IeLAQYtx6LZX+eDYhi5YQpUIalY26z+GWEbkFMVWegxkXIfanfRdK7Yt/ime4Hge
	 9Qdu4b3KurAVFxPd2mIEjQD8aj8ytPZbvgLpW4TsrzfjBl0yOl7SxQBVziGFiIzAOGhz0
	 6f/z2ce9/VqQOF4feMTLljJOQJzxc4pUevRziPVYNuYkXYq8ffe8asJBQ/GXiuTG+TK5g
	 NdDYryVOuihis70DQL6sHPU4RpZ2fH132deuUB4CMSArEhuK/wWWh8BLbDtEshOUzcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjIesb2f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7BD606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B7BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjIesb2f
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49134c8509fso1589018f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794313346; cv=none;
        d=google.com; s=arc-20260327;
        b=iYoLLeDrZ+HK4ukDcnYyseA5rzaCITchqStYWh78LdfKC7cQ3mlpxBjXkFUbADCx1g
         4AccBzuMPbLxQOXFtxbNZcGKFly6YZ9VFcHPRdBNMHuPrxXFq1riluf0jOZQLKnL4lLN
         RFT1O4qnAsNmjJWJU8gN1bFhlqwc8QwKhxr6F/g5NLcJb4/3Gk2q43Jog4jLB4G0xk2O
         4JzhsrEjwIBuTNN0g2KZfUPh9G4tB4WHrPG860/x7MAJ7lqfpYeqRNsgtzL8XjVRk8Pb
         WAkTANCsrRKiyJ+UGkPaxjk3F921XGKAzuLP3cy/1jUWs/DpfrT+LvQ8aJhyFLGvp8Zh
         wgmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/+MHJzkrQTBa0PMMy0ZmVpPU2O2nIABhjZj+wACly9s=;
        fh=0haGclR/QIGuoBiUNq77BWw9UWgAQQUoGrUAZUZAafU=;
        b=dJl/pABzkkLelSVg8+9E8kwbjP04CABQFU5PLjOcKe8lwkBUD43D00grpOzHdNL8pQ
         2mCHjBeYSZwcVcv27yFlqMtJEuupWeq3C8cRnGQY3KYiCOkwQCDeK3O7Og1SVKwgnfdj
         SE2EnLhOaMNo/oLje0HJpv0DM36C6nr5kHvObXvq6st6UVtcENP7H1spRWnPZyhTPjm1
         rLbqMClSnGH1LXGRgHUtWA8PpAOzKInYYtTPEXKBFwEIIJJlZwJK7JZbTLUdkxZj3g2F
         itKE1HRROjA1yp0H2YPiF/kxkO8jg29zEzfyPO7tcPzSiCmGhvWLeHhw1LR5alloOmK4
         wI3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794313346; x=1794918146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+MHJzkrQTBa0PMMy0ZmVpPU2O2nIABhjZj+wACly9s=;
        b=NjIesb2fvuO6xRzD3T/V0olRS91tgkrcYm0RDXEV8CiRJoLdL7ApgkHSbxxS3v7N2i
         c+22xEBaPoK3sQrxQRrZKiDb8v5K8gGqtVjXOPa0FfHXVGCB1//kosh4Fs7bHevbHDh4
         v3y4l9dMKDR58cYGybZjw6MjcOdMt6GmHs+oneJrU/FHBE7VLtIibgaZ8/TB4JQrn95R
         piYq9mZmO6qbHmyoICG1nF6UweubbeJfHZ7L2fDjq1sdJ1Lblg3hWQwnBq13MUjwlOxv
         NMoVt9cFBrjaZV/4P+5oP2XpwX3TUZ1kmSQZ3RGcyEx7qkigIOKZWBX2wjUoJa9Z+Pz9
         IKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313346; x=1794918146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+MHJzkrQTBa0PMMy0ZmVpPU2O2nIABhjZj+wACly9s=;
        b=pDvP1hdyDAH8U/0ymqUcSW5LsCbqVvH/dmAivujs3c+L/m5F80NVFNdL72BoSGrVX+
         EW4cHsm8eTDQf8I6tYvDSIZkcK8B3hbf0EKJ1/HV61tSOuVFmNhftpxg/8wJKPhXMTXc
         6Y7q/TigW9fiKyxZrqNwMg10M58T11HQVyuW3iE1Urhc5CoMv/Z1MvyaIeexhB+WBEFC
         rd+OyRMb5WXJfTVvvATUZDMfVhSeBayhmUPgT0eSDLWUYkpHGv3gVvia1IEI6U0uVNS/
         H0uZVyFoqkh92zIEwXmumy2ezIJAKJQcYY7Ntul5MOZ1aKiotH5SO6J/cKP94AgisIfG
         Qg0w==
X-Forwarded-Encrypted: i=1; AL+hErE/ImCCenLxy+W3T1LhDpRS2XUi0gT8dn8dLi6Zfcq9fyq51c5Q1P+CEb5A1Um0/cLjSM3X6jf6I7Tn1CQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bDVazRRfFxRdw5DDgXpfH6LBV0wVQR7hTQzdiP/h5EGlb7IgR
	ObHRr+34T2eOznNQk1Cwh/kYwoza2ULOw/spSJYSqDF6nWCBgDNcUiv7jm9KI5LYEHEO+Szlk76
	Q0VOgzVMun7uCQDgkQ/0IDcBW7QB2REk=
X-Gm-Gg: AYBFou2B1J2U3xHMcuI80oUb9ak04TnBHdm7gA3ESb4Yku78UclA6Gctp7btmFkk7gy
	qaeljYEk1vXi7xzCeIJEmo+/mZp9l5RJF0X3i6A44KaVIKhhmqRp/y6rfIeXgu4IIStEZUkpUzY
	B+Tk7Tr6uKIZMHHk74wXyN1FG9gluvMcyw07XzkSPZMlUMED42HMI7gcGQ37AlPdLPCUs3jdBKh
	AeVdrP8c4xUgdeIXDmmF+Dp4e3erA0fq0hY1U0ZbdHAxoiofagqFOPqFQKJ46Bot7VkMCNJfR+m
	VAUhPesJ7rg1f2ExXI35WQdqLHCO7KBifOWuuR7V26osaqFDHYYM8awnAzuNNEkrATAfso1RjGB
	JHchkfNk+IxuNoALLvLjIId8JpBqlq2XLR/wr9VcHEP27wDxlslRoFt0NUgl6u8oGQPGYzbg40H
	QklYycYdyTggUb+Q/pDqezGW6i/EuXa96FX7ErznAP3UrfOslWUELxDOpnjg==
X-Received: by 2002:a05:6000:4555:b0:485:8cc8:1f5f with SMTP id
 ffacd0b85a97d-498309ae1c2mr3208558f8f.42.1794313345655; Tue, 10 Nov 2026
 04:22:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110114622.229608-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB1134683B4AB5DC97B70F76FB586722@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134683B4AB5DC97B70F76FB586722@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 10 Nov 2026 12:21:59 +0000
X-Gm-Features: AclHuK9UoXtdtc2HXij8q8Oj65-CKlwzKWMQawTDZRBatrdmul0O7w180edoOrI
Message-ID: <CA+V-a8sZovqjaDTDFUrw7WJ8kqP4sjk1p0erV5A6tDL3qZNr5A@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: mipi-dsi: Drop duplicate
 platform_set_drvdata() call
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Nov 10, 2026 at 11:59=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 10 November 2026 11:46
> > Subject: [PATCH] drm: renesas: rz-du: mipi-dsi: Drop duplicate platform=
_set_drvdata() call
> >
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> >
> > The platform driver data is already set earlier in rzg2l_mipi_dsi_probe=
(). The subsequent
> > platform_set_drvdata() call uses the same arguments and is therefore re=
dundant.
> >
> > Remove the duplicate call.
>
> Some thread related to the patch [1]. Can you please drop the first one a=
nd keep the second
> one?
>
Ah, I missed this thread, I will update it and send a v4.

Cheers,
Prabhakar

> [1] https://lore.kernel.org/all/TY6PR01MB173770FD0BA340F5A50633E21FF322@T=
Y6PR01MB17377.jpnprd01.prod.outlook.com/
>
