Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793269062;
	b=19fnwp4OXxnCdCZ42J37ibTKOnsQ4Kwyc609FTxK7JuHSS/c8/nGqlbIWL9PblVtvbeH
	 0X1WK8wYispz+Sh1LTlMTzH/bojzgdwF1IO/uTXRJCM/pxiI3NwiOHijoNgJlup9l9lIG
	 y4kpHUeyiXhAFv5DCV6sx3OU2Icro3eCGYXGyMhVSsRp46ExN8p/OpEUOxPlejNPkL3bJ
	 FEeEvEZ5euCirOlfXa/DWC8gT+0XPXQyzi5nykGg+9KSKM+XVULvmnUHibLLXJ/3N16KZ
	 MbsLmlkrtLV0+oocIGlqxhH6bkzz44W4hgkPtT8PSObqV+WQqekPgcB5K/PSQPweL7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269062;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=adbKXnkrj/Zj0MFQsrgS7CP9R8qw1nrS1ry1AUvfysk=;
	b=sJPjU72Y77DwpuLH2aBUayW9CiMTR6+eQyhHDCaM8yywQqqeVTn/6tp6/I3lKaW3JwwR
	 Pr4TIKnQiagr/PlkL0cqBAGjQtu88CUMUm5Q1wgvulidhz8aH0S+TPC4dneQamhrTLun4
	 SHZuHIzjF61TleNTN4AS1rA1XQlbrelc+W+AYSlOv+eYzTQacaF4Br/kR7XjZG2X2f26L
	 pkRhRYBWvVzV/78WSjPRbFOuCk3Jw8VkC/YJUvutK8BfutZG6STEpUfVtgmONvvf3aVhN
	 6C4zm5M2wM62LR5kFS1Og3fQ+KE0F6XKYInCofEpw8orgOV8jjVcvordRrYy9CjQymA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HGKgjvO3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1fpzKNl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F87606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F87606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HGKgjvO3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1fpzKNl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8v9AE2273151
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	adbKXnkrj/Zj0MFQsrgS7CP9R8qw1nrS1ry1AUvfysk=; b=HGKgjvO3Mmul6mYm
	HXsndv9hvZ0Zx7kg2j9MQNzkelbImXc6UzBdBrI9yoyICak/R9oxwqfxch2oPpl3
	kGSfDlwKb6YCMsjrvFyAcTk2kpu49mcjYlQnNZxxVvEaIBZpgTGN1xcPXxKMhCar
	nHkkJu8UnM9QtHFfTOHVDU6E+dL+iNaamDLII2QF55NFVEjPX8A/A/0BYtp/86L2
	xBXof97Tv6BPKwySquobaRqiSBITjy+5PUwNhtx643IQ3u8+5ahHyDMNfOYTPKFJ
	bqUYfgrHbkY2OX3CDMkFfJGoa4rLovyk2cxPRi085aQfBfTaPYFLXNfDJ6rjNjfh
	9N6CBg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b0b7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:17:41 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67a781c1080so1754465d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793269060; cv=none;
        d=google.com; s=arc-20260327;
        b=GTMS6+UvlcJ/lQqtKKUHdjj4CF740dXRYle8nN7mPzc75sGnI9L2GZXbsy3RCF1dPm
         9jai8BO4PnWoOlgbMp0rznl6HsgnWEGF7iUS5wHPQGleYGp7cF+eEpdXafRXD0EQP2Vx
         OGq4S5hYCRAzupkZyqptnwxbRD3MmZGN2Y1B/XyS/aBk0Dfoa0/J8ZcCK66VMK9JfPdZ
         MXJYDhFdQ3ceJ2ZoCtHMfEiT1uo+WmEwUY0BzmnNSd9wMPtkNMRA3PH2GJtxO8818srC
         QTxZcZJju0s/Fo0gB9pMHIZXmEfWmnibmreO7VYBwRcDVx5beWwptcOPBlk2N6qgE8Y7
         Eokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=adbKXnkrj/Zj0MFQsrgS7CP9R8qw1nrS1ry1AUvfysk=;
        fh=ucmGKrW/bTwsM5HmLY1JvaztmlEYVHRJFj4GgVh2Jr4=;
        b=p32WkQYB+mFyyK41u8Y5LXY/nKp6XEjguwgJOSvcf/Bx68Qu0fRaNjaB8Ay4YWeC93
         3QDWhy7dGLF0b/w2zwAC1+ulPrs2HMFSKIOnt6RMFf1GstKkxusDPs4coXZOKhTqodlH
         8OpCRfJxkX4GokcucObsZFL5DUsuzqw9FpdY3qIKdeUOyAHJdN68C1UjCSfEYjXew89A
         7tpZW4x6tci1BSnSfBtLGG01aDb7IPudI4FTXQ84XY8tuNbKuPuRjr5bgyRhLXpGu2dd
         oYBoQ1YIEYmde6jr9p/ABfoROtbGcwKIsxL+rn6hrxdVQzJAagd8fJa27o6mdsf5JQNd
         WdBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269060; x=1793873860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=adbKXnkrj/Zj0MFQsrgS7CP9R8qw1nrS1ry1AUvfysk=;
        b=N1fpzKNl7vJKDYtFaQbbnn9QCb9ycrn3a06eCemsTzmwR1BOyWkoxBwF+jKNPELFYK
         uD8g5bTBFUsqyVivQFV5UiSsa6OP7Uoz2gQYmbc7wFW9G0nvruNJElM5jAkedtDW8Ezw
         lKqX3CHiza86WeqNADnz4C3cFVSqNVaWqRZrdJXlTIGGqqbgsw2hIocBgNeS/TyerJsO
         F59/OK4o0IAAsif4XOlwf5jsZHqgeHMbX9EiihZzPE4LxyZtR6vSmUARIO+xTHxIyNW1
         PaAUHGZwscxhezdSbhMo1764o1evdroD7EJ4Csj71SADcqVE8kpi+3TTGyWE/ZBB3wQe
         8EVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269060; x=1793873860;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=adbKXnkrj/Zj0MFQsrgS7CP9R8qw1nrS1ry1AUvfysk=;
        b=naMW17Qm/H8Z+uPXyzY5MtKQdMSMdSJd7ehXPmW8pyhlPPdPPm3dyJb8Qmf+0tAha4
         +pmGHkgA3Hk8kW1lfpy7VgGtVFO/YbS2eg8zVH1yCQQ//ZNEft3QspJsQ0iDokcs0WeW
         odWC2IkvuZqlEiXEKdNK99P31W8kDViAAqK/Ti2vXnC+eYsD+CsHh3aX6zaTBICRYouD
         divYkrt1EfYOrwzRvkhrEF3bbdysknyQZymUB6Ywg0ltVxSfK0DHUdn3T1farlml92If
         Podi/ATNr5rmnSysEQgoE4Ic5FcW/YJYaK93uoAxnjVNklGYBRPWGnFKSN1PXv9lj2Xn
         m+lw==
X-Forwarded-Encrypted: i=1; AKwUvByYj6ZPgKXJ2+c8n74wXrl5KCZmSSoZzl/xtvZZsiJnjR7aTEUUVM6keNPSicGDhNT6JuYHimUsEONh7b0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWFAOweAZGc7uPl3D1Icd5G3DZZhJwqpNjlLbQgKFH4c2376nj
	175vscsnwmtXRugTc5RzzveeC0pPX9r66EFXTWsnd0MySEKaE+IU1I/09MPSslndZc5CGbJHqnr
	2nGt3b0PA2iVSsCAWH4KJMGeFnteVFPK3NIDn3fj8zMsEGD7do820J+gJJmrNRpqxzOgA+B8oNg
	MPnWTB7zuXcR+1cF5ByAOKpHcyR8YaMa7k8msy4JPMvg==
X-Gm-Gg: AYBFou0mnIxDiGS4LH5pUzkTkzOdUxo8+T2af5G66y0TfU0P/36QOXeHNkCukypqQac
	1qJR4gvDPrXl/f+OXq7MfHcybwE+fVdJnU9ZSfzzuoKExOEKKmt7VZjLfx3zl93zVTP60bywnHy
	a2HPQuWMlgTwCIbhqmRO96OCE3ykDXUDZ5mUvz83FL9ve6Ih9/aknl9kf9Xw==
X-Received: by 2002:a53:ef8a:0:b0:679:3b0e:3e11 with SMTP id 956f58d0204a3-67a7bcfb0aemr2293233d50.109.1793269060100;
        Thu, 29 Oct 2026 03:17:40 -0700 (PDT)
X-Received: by 2002:a53:ef8a:0:b0:679:3b0e:3e11 with SMTP id
 956f58d0204a3-67a7bcfb0aemr2293227d50.109.1793269059583; Thu, 29 Oct 2026
 03:17:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260923-aquantia-support-5gbaser-v2-1-4d789dc21418@oss.qualcomm.com>
 <179027194602.2160803.1483822531995612133@kernel.org>
In-Reply-To: <179027194602.2160803.1483822531995612133@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 18:17:27 +0800
X-Gm-Features: AclHuK8qA7sT9aXyMK9MadwT18kA_k0cGovoEZRIA8-V0lCOv1JHPksIROlbU5U
Message-ID: <CAPTcHHS7fckRfGzT-_n-GShsbaG7D1nV5=r8XgRbfV8vg7KK8Q@mail.gmail.com>
Subject: Re: [PATCH v2] net: phy: aquantia: Add support for 5GbaseR
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzOSBTYWx0ZWRfX1BiviREbPkRE
 qkeW+XEwbQR8IJ6kEBmZnN7xE0yVUZf/xUDoH7MrMikusiR1pb60lGShWIfLHIctLzvFHCiaj5s
 F6GsnyDXk2EpgT1k2jACfS+rFRZxki0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzOSBTYWx0ZWRfXxck14LbNmwPv
 ynrdetDvsth6aPuAWyBxCFyyQXGw51XVFf6bTEog1B0pSSRJglzrU+WjWpSEG9N1CM785MTok9W
 qNr0r4gwq4VVbvs2MbCqn3dBYhNDQ/ToppM65fL4PTPoIUXX+Li+VnQP7H4ieCR/tjFUbsY0JzO
 Ldz3bhLJwyPk05T698l6zQD7BDBMY3mvriIrTE4GDtyTzSUP0+40jHQRglNcA+/9PPeOLQW3FDq
 JqKCfPoFhDA4SiFt+NLRaxLygo0rOfsRTzELIFglzamIy+kXbuuYt3K5fjQ60kCegBNKGN89aOn
 SxYC2pykgelsKpI7Ufyd9DZQOSOfXPP5oB0m4RRstxzGy9QiybyXJAxYn93uSKJRq0JToCB/vKA
 NkQvtCkxl7Uk+MY7a2rTi2ZEDZSzdLzHXvER5ugvDXFzSNQBWynod7Zq0XXut/TLe6rCfx2t0Ex
 4MofuslUBjZVjY9sFrA==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae31d45 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=TrX7sf6gzCYKm8an2WsA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: mI4Q-I957h_K-GbXPqedx0ZuGLMtblhq
X-Proofpoint-ORIG-GUID: mI4Q-I957h_K-GbXPqedx0ZuGLMtblhq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290039

On Fri, Sep 25, 2026 at 1:45=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The commit message does not mention a behaviour change in
>   aqr_gen2_get_rate_matching()=E2=80=A6
> - [Low] The submission is incomplete.
>
> --
>
> net: phy: aquantia: Add support for 5GbaseR
>
> This patch decodes PHYXS interface status code 12 as 5GBASER in
> aqr_gen1_read_status(). It also makes aqr_gen1_config_init() accept
> 5GBASER, and makes aqr_gen2_get_rate_matching() report pause rate
> matching for 5GBASER.
>
> > Add support for 5GbaseR within Aquantia phy driver.
> >
> > Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
> >
> > ---
> > Changes in v2:
> > - EDITME: describe what is new in this series revision.
> > - EDITME: use bulletpoints and terse descriptions.
> > - Link to v1: https://patch.msgid.link/20260923-aquantia-support-5gbase=
r-v1-1-537d39bb8c35@oss.qualcomm.com
>
> [Severity: Low]
> This isn't a bug, but the v2 changelog is still the unedited b4 template.
> That makes it hard to tell what changed since v1.
>
This is a careless, it is fixed in new version now.

> The commit body is also a single line. Could it describe the three
> separate changes in the patch?
>
Yes, will privide more accurate commit message for it.

>   - aqr_gen1_read_status() now decodes interface status code 12.
>   - aqr_gen1_config_init() now accepts 5GBASER for all gen1 and later
>     PHYs, including AQR105.
>   - aqr_gen2_get_rate_matching() now returns RATE_MATCH_PAUSE for
>     5GBASER on existing gen2 and later PHYs.
>
> Separately, the new define lines up its value with spaces:
>
>   #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_USX_5G   12
>
> The neighbouring MDIO_PHYXS_VEND_IF_STATUS_TYPE_* defines use tabs.
>
OK, will use tabs.

> > diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy=
/aquantia/aquantia_main.c
> > index e95d391a6dc23..0bcec88fcf727 100644
> > --- a/drivers/net/phy/aquantia/aquantia_main.c
> > +++ b/drivers/net/phy/aquantia/aquantia_main.c
>
> [ ... ]
>
> > @@ -1040,7 +1045,8 @@ static int aqr_gen2_get_rate_matching(struct phy_=
device *phydev,
> >                                     phy_interface_t iface)
> >  {
> >       if (iface =3D=3D PHY_INTERFACE_MODE_10GBASER ||
> > -         iface =3D=3D PHY_INTERFACE_MODE_2500BASEX)
> > +         iface =3D=3D PHY_INTERFACE_MODE_2500BASEX ||
> > +         iface =3D=3D PHY_INTERFACE_MODE_5GBASER)
> >               return RATE_MATCH_PAUSE;
>
> [Severity: Medium]
> Every PHY that uses aqr_gen2_get_rate_matching() now gets
> RATE_MATCH_PAUSE for 5GBASER instead of RATE_MATCH_NONE. That covers
> AQR107, AQCS109, AQR111/B0, AQR112, AQR412/C, AQR113/C, AQR114C,
> AQR115/C and AQR813. Does this hold for every firmware provisioning?
>
> aqr_gen2_read_global_syscfg() maps XFI5G to 5GBASER whatever the
> provisioned rate adaptation mode is:
>
> drivers/net/phy/aquantia/aquantia_main.c:aqr_gen2_read_global_syscfg() {
>     ...
>                 case VEND1_GLOBAL_CFG_SERDES_MODE_XFI5G:
>                         interface =3D PHY_INTERFACE_MODE_5GBASER;
>                         break;
>     ...
> }
>
> So 5GBASER can end up in possible_interfaces when firmware provisions
> XFI5G with RATE_ADAPT_NONE or RATE_ADAPT_USX.
>
> At runtime, aqr_gen2_read_status() still takes the provisioned value:
>
> drivers/net/phy/aquantia/aquantia_main.c:aqr_gen2_read_status() {
>     ...
>                 if (syscfg->rate_adapt =3D=3D AQR_RATE_ADAPT_PAUSE)
>                         phydev->rate_matching =3D RATE_MATCH_PAUSE;
>                 else
>                         phydev->rate_matching =3D RATE_MATCH_NONE;
>     ...
> }
>
> phylink validation, however, uses the fixed answer:
>
> phylink_validate_one()
>     tmp_state.rate_matching =3D phy_get_rate_matching(phy, interface);
>     ...
>     phylink_get_capabilities()
>
> When 5GBASER returns PAUSE, phylink_get_capabilities() adds every speed
> below 5G to the supported and advertised link modes over 5GBASE-R. The
> fallback path in phylink_validate_phy() also stops widening validation to
> all interfaces for c45 PHYs.
>
> The get_rate_matching kernel-doc in include/linux/phy.h says:
>
>   It is assumed that if a rate matching mode is supported on an
>   interface, then that interface's rate can be adapted to all slower
>   link speeds supported by the phy.
>
> Could phylink then advertise 10M to 2.5G over a 5GBASE-R host link that
> the PHY won't pause-adapt? A MAC that only supports 5GBASE-R is one
> example. Validation and runtime would then disagree about the same
> interface.
>
> The existing 10GBASER and 2500BASEX checks are just as unconditional, but
> the 5GBASER case is new in this patch. Would it make sense to check the
> provisioned rate_adapt in priv->global_cfg[] for the requested interface?
> The commit message also doesn't mention this change in behaviour.
>
> >       return RATE_MATCH_NONE;
> >  }
>
> --

this is  a pre-existing concern, not caused by my change, can consider
to address it
in separate patch, this patch only focus on 5GBaseR mode enablement.

pw-bot: cr


Regards,
Hongmei Xu
