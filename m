Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793178576;
	b=NXniFTDrOiSz6ph1gqRDMJoeCg5JtnVu8fkRk3BVT88iH2qB39a2yHMsuulyOgO2QPED
	 IOC4z3ffI086OVfLbh0Cve54TlDJVQsdeTdPCayPmdBUoHx5ycvCNHvhnWZ69X6ZO87ql
	 0MvMfeBRU3kpw5L9/3Mqqdxka1XYfZk9ecIFiaXOaW+aaloKHt1c8BO3q32epKcyFQITB
	 J9WTSnWvOMVaYIt5Bw7iA15Kw83BhTZsy4A/aHVgRy++rDqO2MwsI/9D99WCZqxT6VBhS
	 ZiYc99g2l0uoxWVA3bL9Z8Vqaj0HFVsw4NCUnihjVsCuoFMKWMFafvcQT3NmBf8CwqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8V3vKlQqADekuYChxRGPaw/nmB5SOwI58nVZf4lvwQY=;
	b=1tE7hOcPdn/UUlIfFNVQ4zE463nROZKh1SCju1+IL/4I3cSIxv0fbCOfE8EUIGzEfeL/
	 SwlUDnVeFbLOwqVblDuAm1AFMvZARA3Fd8dALEIivHY2GTL04YDjsvFNrv24ZiPN+LCKX
	 TfityDWHC9fdP5Oy3AFaA9I7M7MddcLcTk7LRrra0IoXRhxgQoRaFBw5/rJ1n0M8cP6T1
	 KrhAEBTWlEBWtAKboVBq3P+C7d20YLImM/Wv6yM4ithgUpQ8Z3zds9W4qxvabGfB7pHts
	 8PikJe/6iAdiXfSkd9PAWeI82rBeFw5HSvyGRtzCAQNrzb2PMnfraRayv2xQjdMbLag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y0Y7Bj/r";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8149C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8149C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0Y7Bj/r
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0f59a5fdeso6404077b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793178575; cv=none;
        d=google.com; s=arc-20260327;
        b=k4q6XpKmEIV+aceqyzuvsC17Lqm+DpmgTDr1qM0wEWLDVBuhPKCiv5ZsNKt1fMWy9n
         QYwFa3vSdxIIyu6/CBRY9Hnf0EEqHANEWZerXatIF12bGmsYIR0oi1kM7p5fzVEZZr4R
         5Jy0h9WYvHK2LXWTdqslpO8Vq19FMsMhZ9Hgr2ltSuFJiGgw9/iaktPFTbrbLJ5RdTfu
         QThcLvzf9nxMDemuK+Wkmx4WBdbT2LEgRp+dBiPcphXVaK4RkmljjSqZxE/bI1ZpRheu
         DsTJzY+Qm0r1e5yW1JpPrpPsW3NIWyU5iKCerUl4aUboq6KXaNVZcEEoNDCsSqKgjENw
         ibcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8V3vKlQqADekuYChxRGPaw/nmB5SOwI58nVZf4lvwQY=;
        fh=7P40oVVKeChNXR21GmX1Xmkwpj6JLteSvUJiRVETFjA=;
        b=rvkS33AX9qvjZdjTdhlFzXcVhrlHd7PlfVO5+/X3BsEDYRhlheHYzblxqirebZFrcw
         6BZZlDlO764ZUwO7y6gAPqFTLodJKpbAoQ73cvf9C7iT/kDZ+RwjtU8hFXm0nmuJVTI1
         4NZsJ7kFDVf6jBNdOErIvsP5SNOAR0pYmtri3yJE9MPWIjAm+KRQMsJCgMNPNQj+NmP2
         IdT+MmEKLSG93smDFEDpEabaoZtbIkhh0GKD0nqc2/PfN9rDe5V46Bdu8k2XBZl1kcur
         ZhM62X16s3+j1EPUG8Lj7LmRROw8ymkOUkGLxuVqkPKQL3YOcgWazyRMORlea51GtHc2
         99bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178575; x=1793783375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8V3vKlQqADekuYChxRGPaw/nmB5SOwI58nVZf4lvwQY=;
        b=y0Y7Bj/rx+OCyXMC8sGtJV2TyS3aw/sNv3z6PQrCncJUU1o7y1ypCV6gVCiDPhuTxW
         X+5XmXkUjiA67QznRmy+C3ilCr4GRwT0khv0oiGXjAM67mcGTUtrtpGRiPZsJ6glj6Hn
         qzAUKXSChy6V57mVAkSYAsZVFghsFObVMtrfsz8VXyKEwvucowIT+1SWDdH5IiXggPDD
         9fQgWHQWHcIfALC2NSfgcPf6pKYhNwxnKdLzgP5IDNczmG9Hyd5Qcuwvw7c6yt9rKwYu
         PAoK+lKqDi5JBoFq3zZl4/kP0v46Fe7/PYeS2MlDAcPQOv+6GkPwAaEG6G1lP9J2al6P
         ZThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178575; x=1793783375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8V3vKlQqADekuYChxRGPaw/nmB5SOwI58nVZf4lvwQY=;
        b=ubuHNiyQFeEc/U8M9xYLu2yOtbr1dhMHZdWde3QrrWFT8WsTZv4bunVCd4cbcYJ0dd
         rXxFlfqdeuBTQZqemGeQC7K4afZj/dIz/sr/Zi9bgGwPKQRsmzGPLW8WhILBuasLrQUN
         J3UtM+CW9jekOh2mPCo88sG1FlinXKhbk7d+0aAwR9OOtW29KVxErcP353yBmXqy++4I
         jH0rWWlZ+Q16h24VB/gFLIq0EFf6uG9/zGb4cmt2+A+smOmONa1ISv8C82V7IhAABcz/
         vDBcMlmvE33Sty1AuPBq4yI8GEybhhzFyJn/nQq8DA0WvLDtj3ZqBxYqS/uiDcFFMMyf
         d0Ig==
X-Forwarded-Encrypted: i=1; AKwUvBzAS36K0NumkA0oo28VUI8owe5Oqmddinu7f+we1mtzhPvAtMJoGi4aSPUxXj4x4jHUP+ycGv/YpqrMzIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvhhd3VKZOvm8VJHIrFPjJfIApfL9+/gLBrqDInc1uGuZ2D9hA
	CtwYPX2Jn0ItF9VtxQto/e0ruwN93wm+f18lg88R+IpnWMmWNIhA72SXMRryHBNbpI056CjS+jW
	RTA5h/7EuM1geEP0kZZY8WH342T4rjKw=
X-Gm-Gg: AYBFou1Fer5hhH8ZDsGQZHN96ifN18DriVCIiTmyWXwjumFXv12WF2SKfWJn7U6EU1F
	jndHaNLoKWgGmjX04AwJmyp1MYMHNpC9Gh0/ImkjFZH+vizl3C7fk2eUeeOayCSIbOoB0B8V8py
	aUTffqRDIdOi0yoI5mapHaWTefMV05E75aGKsvzDQUn59yPYxS+j0vMN7n9hlJpGpcBKN6k4xno
	QGgeSC964UfdH5IHYkswaxbF4L5Zn7V8NCIg/GJHgbc/gsrGkITzQlrs3aenGm6NNGq8VqT90sD
	ImqmT4QGgZ6cn5iyKZbkAqZc+XCwsKImkPEBsEh2RaT2EuX1E1OS0Xmy4dqU7eDVfUmGecZIIiP
	yvypi5KhI+JKKHKR/iGswPzYSFq7eEgcfGah3KEHdF8ostk646KOG4q87S7GBdGNlCaf9lxhD6D
	M3qjexoIM9nv01tvWCN4NKdtOQtOaXpdTZLnd41CwVyxXOGQOYDpCeDFvs56WW/kNG46jY0Ub8d
	c9S
X-Received: by 2002:a05:690c:e3cc:b0:8b0:d4bb:c9e7 with SMTP id
 00721157ae682-8b1b5ce052fmr11702967b3.46.1793178575340; Wed, 28 Oct 2026
 02:09:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027202230.3539646-1-florian.fainelli@broadcom.com> <20261027202230.3539646-2-florian.fainelli@broadcom.com>
In-Reply-To: <20261027202230.3539646-2-florian.fainelli@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 28 Oct 2026 10:09:24 +0100
X-Gm-Features: AclHuK-ovVXCbI-zwn7qh1kikdJ9e3riBKCGOQhvdBZS9sM1LitUGyq7XdqjpQM
Message-ID: <CAOiHx==vXaMg2aBtnnO8F0hB=kvTr6R=Bq=CdqMX-uOjL_DzWg@mail.gmail.com>
Subject: Re: [PATCH net 1/5] net: dsa: b53: initialize the jumbo frame size
 register offset
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:22=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> The chip data specifies both the jumbo port mask and frame size register
> offsets, but b53_switch_init() only copies the former into the device.
> Since the device is zero-initialized, b53_set_jumbo() writes the frame
> size to offset zero instead of the chip-specific size register at 0x05
> or 0x08.

That offset is reserved, so (hopefully) was effectively just a NOP.

Which reminds me that I still don't really know what this register is
good for. The (bcm53115) datasheet says it's used when jumbo support
is disabled(?) to determine max good frame size for MIBs, but also
that it controls up to which lengths frames are admitted, then dropped
(and only allows the values 1518 and 2000).

I tried writing various values to it, and never managed to make it do
anything; neither did the switch start dropping frames longer than
that, nor did I see any effect on the MIB counters ... .

> Copy jumbo_size_reg from the chip data along with jumbo_pm_reg so frame
> size updates reach the intended register.
>
> Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch"=
)
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>

> ---
>  drivers/net/dsa/b53/b53_common.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_c=
ommon.c
> index 0880310c9ce3..559d4b360c82 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -3109,6 +3109,7 @@ static int b53_switch_init(struct b53_device *dev)
>                         dev->vta_regs[1] =3D chip->vta_regs[1];
>                         dev->vta_regs[2] =3D chip->vta_regs[2];
>                         dev->jumbo_pm_reg =3D chip->jumbo_pm_reg;
> +                       dev->jumbo_size_reg =3D chip->jumbo_size_reg;
>                         dev->imp_port =3D chip->imp_port;
>                         dev->num_vlans =3D chip->vlans;
>                         dev->num_arl_bins =3D chip->arl_bins;
> --
> 2.53.0
>
