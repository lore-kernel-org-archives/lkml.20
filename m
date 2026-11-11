Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794416302;
	b=xjpcK0mOM5HpKR5rpe7LsootmStskVWzGdtSYPvLQPRKVouWq3YDusGRgHld8fHpP5Yx
	 4M9pjJynWYmv2ceelAYdDhFZp/lvpt97fxdxMCi/OlwAaPV5a11Q7AOL/awUfa2mWwPEE
	 O+3D6KOhWdbToQ6iz5iMy6FIASj+qmIQCWpQJ2O3mheFzG6DESImQAKz9MDuYV+JbRdJQ
	 xzgQkptOc9sUSyDlCn3iqpPWVrAFhyTgaJU9VDuREYpulNSXE/A9REaIJTpADLHSbObyI
	 QMuW9WmY/Lfz68wh/dtVJlPPlTiAGrEOHlAxMl0bagr/kIuK4Rc4/JBGeK+cQXpBO+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=15hIaeM6HY+XXzI68kpVg2E+Jve2er7s8+5re1NHej0=;
	b=M59YGvr2gSCbbApvejQPNa3K0tFK6mjUV32P6HEHEc6nVHNoysyM/x9YEE/ljKZBDoLl
	 iIQkaSe0XCbIkTpRaePKwaQAl6F9Z4Yjb8E90hwXU+hY5NJjpLDmEOU6sfc6/+GEMkf1N
	 2npmaYdiinKmO6Dbo7RP/ln7PU7W4Wzv/psd1otjk1T5SM9kWIlyIKLd3xJFzb0J0WWVi
	 pvjZBi3jUCy4PWectI+zQq+PpzqSzihyOu3IqxoQqMvE34RHKUUaRGoDykuNkFhP2o3ay
	 iwfEOW2d/NwTAst/CYa5H+K3Ygi9GKVeb+akWDDVUipDCoLWfVONKUaUN2exI7ux2/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oavwDbJ0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86665606A881
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86665606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oavwDbJ0
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8479f46ecd8so1656900a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:58:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794416301; cv=none;
        d=google.com; s=arc-20260327;
        b=JoqmkfN9PnfFGs7SMuTgtcxBfZw1/6HlH7arIHm8Vx8AE+d6egoparets//XYfQv9Y
         fnDx7Lec0wPmYHWzuQUqptOG2O1OdfikUWL9Q4hVa/LaEAgEIScxVUwwB6D0yVO2Ir6N
         ANlcpxdq79CU1PIa4KFVNbsrOI04mY7kotDbT+pr2KDPHk3A7WbFDn5Tr2tLFoE+i1p1
         2/4xhHPpMoLQInbdqv3bwynSk1qxoor3qDqgTArIIzPqnbItNlJ3f7pMGYu5fOuS5jUA
         toCXCfCIGSTz4qxAEDcJDq13cRlvgTUD7WhgYDg+pSTqFZsFghaRDzhitdviV+1IVGw7
         vxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=15hIaeM6HY+XXzI68kpVg2E+Jve2er7s8+5re1NHej0=;
        fh=sQhfMcc55/+E5aCXLYcwKVHJMX5yzNMHqex+n6BMRGc=;
        b=fddsimbzxp8AQGg5DLWBinHDdCsxEiJRMztj1ok1itXD1xVMvz7QyXGpK8dlXWGAgH
         buOoynJovIGVz/Kdexg/qdLwM2Y5twT7kwMC0ek6ZKqMs4Z5GJSoB4z5PFf6ipgo7EJM
         hlI9tH154Hf+CqEkkWwJwYOs0Gxqf7GMirAMIkuJgfqkc52FGy4aT1woRD5qK4gpjsYU
         d/rZGoVv8orEdf1o400pNCFeP6rZOddeyaZ09U6GvmQY8a+sEGUfDII5ZWLK+lPhsVK1
         ta/feDaQW1EJgw+XODzYg3J7yzw0RYkck8e+Q/lcr3Awj6YCn10aHsWuRcw0Z+PcKUNp
         r5Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416301; x=1795021101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=15hIaeM6HY+XXzI68kpVg2E+Jve2er7s8+5re1NHej0=;
        b=oavwDbJ08/HmX6wVgtCUXPpgOGRzoNrnr23jS47qt+4qWoVD5xLkFh+nGRYw9Kxd8n
         Ryd3a0NTZL6MowswMVIsfIS9LHmX1n4wDGBpAvUKH1nSnkBc3Kvj/BqP6Heie1ITe3zs
         Uf7qOmb0oQyeO1DbC6nxT7UTgGFMTSPzLxjUmc9ftR3jJrj3a5EOR0DzhqxrtTKfS8ey
         gSpSMqF4G9dHcuayBA2ODgVLG491ephmMmEUJlvTdno6bDjP/a/NTU5/GJmuWP2yjuHe
         rlRgs8jcEdX+cyFPspyYAT++yKv0t+fPvStyRlsi10SJqQlG69cbucrWBJpHy48AphJO
         KZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416301; x=1795021101;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15hIaeM6HY+XXzI68kpVg2E+Jve2er7s8+5re1NHej0=;
        b=RgVy+Va4M+l7TI15+Ec7lC/fhVGhjxZeemOstV5gJH0E5Xu1HzXxIUJQGKs81oLmcr
         lzQeKHn62T8yd+ImJGCS78VMK1WU3VOkH8N8ZW7Ej2DBqRX7LWwI7sec8EHfvKkfLiJ8
         6ug1f8N90PptOCwLUCuWT6IYctDZX8b8sG1N1oPH3p1fqah6znok/Iw+f5rejA6ZFNwr
         KgfKxpgO8o9YSR+v2yQKAtXlV5k2yA8Vxk8ZajWJ7lm7sWT/JRapBR29SLEufBqnmOPk
         WJyr0RSH3K7MmjbN9nZw7CnBXvNXAPFk0sSMabPloxPEYtH3nEzBKwYQMHz9NGsv/4RD
         uICw==
X-Forwarded-Encrypted: i=1; AL+hErEX2WrfOIOfISnPMzixrpPblVNb5+4JsE/GzapSQdiTQd1JtEX0iScITGGimlfMd5QU1RGbrqJTyfv9ZYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mnsMHo+Bad3PwFElcCwe3N1FHlda0jCxCL2itlyeoK1HIzrah
	Cg4c9lykF9cz5lKmVcWs9BjcRshH5KHXmAjofWD125nz35V8EkFjbxQvqZqJ18n4wsTTXW7fOCZ
	mCfZy5EFm6ZQacvIBIxJqTTWYd/2HAfg=
X-Gm-Gg: AYBFou1SCdwozUwlIPGAbdaMyE637TdiKRdUJDN/1F44HxhnO93yCG9GvQ/oXGuJrkA
	2yq4gAo8Ylzmdx57owJ+rXx650ksnlH7EJpOvngN+KNRP7LBRWJvCSLFyoOUCVe8ZygFOMyvMeh
	DwpivkZwXtvl3vS0rOhQTOs7x9HAgMGDcGqBULgOthQmgjdshgZ6ojh53xwnRlPemdgYkE8ImFi
	P+33mbfIRb7uKHxjaralDxZhzWBZJaAFVmNNayNwzoL+vrgakQs6Ml6FwFRpInV/0zYyx22r76L
	c/hgx8HoYW16YFDLxYTAIjCd1+Z7jY70e6JVvQbyZBh+xqQDSRMupg9S1V44khip7lZD1FadXgv
	JTXp8FC5GB4xeQOY2eRNAIKGhYTrhlLvQR2d+V+hLcMeBE/Gi4hjdcMfyel3dRPUYH09PKQ==
X-Received: by 2002:a05:6808:f13:b0:567:cac4:f1c3 with SMTP id
 5614622812f47-56b9628f6demr2322703b6e.23.1794416301286; Wed, 11 Nov 2026
 08:58:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105031442.4164960-1-kyle.switch@motor-comm.com> <20261105031442.4164960-6-kyle.switch@motor-comm.com>
In-Reply-To: <20261105031442.4164960-6-kyle.switch@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Thu, 12 Nov 2026 00:57:42 +0800
X-Gm-Features: AclHuK97k3WBHp2-m_5BzCVwlCnsf-cLUmeErgxp3jexwYJIXBcu7tFJPz8zkOo
Message-ID: <CAAXyoMM+HYhnZ_pV1wvjP3zEBbjNrWT6ry5bKQABiLqmHNn_iw@mail.gmail.com>
Subject: Re: [PATCH net-next v17 5/5] net: dsa: motorcomm: Add support for
 Motorcomm YT922x
To: Kyle Switch <kyle.switch@motor-comm.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com, 
	jianmin.wang@motor-comm.com, wei.zhang@gl-inet.com, sijia.huang@gl-inet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:14=E2=80=AFAM Kyle Switch <kyle.switch@motor-comm=
.com> wrote:
> @@ -2608,15 +3104,13 @@ static int yt92xx_register_switch(struct dsa_swit=
ch *ds)
>         mutex_lock(&priv->reg_lock);
>         res =3D yt921x_reg_read(priv, YT921X_CHIP_ID, &chipid);
>         mutex_unlock(&priv->reg_lock);
> -       if (res) {
> -               dev_err(dev, "Unexpected chipid 0x%x\n", chipid);
> +       if (res)
>                 return res;
> -       }
>
>         major =3D FIELD_GET(YT921X_CHIP_ID_MAJOR, chipid);
>         series =3D yt92xx_series_lookup(major);
>         if (!series) {
> -               dev_err(dev, "Undefined series info for the corresponding=
 major\n");
> +               dev_err(dev, "Chip ID: 0x%x, and Unknown major.\n", chipi=
d);
>                 return -ENODEV;
>         }
>         priv->series =3D series;

You are fixing your own code in the same series. Is there any
particular reason for this?
