Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794490669;
	b=jQN84GPy9/UngTMyC7UVbS5lFWrbdoUa0eaqwKZU3p/iaYCqSdDc10d2Io6b/MnwSt+B
	 m3IAhMsaJXAE2XS/MmH9dSY87bPHI3b85T+7X2Dv5s4nq8d3SbaIczcMo2wrjl6GcmcJI
	 awtxiuPw/wPncK1xInXU6d0m+qqdqkEr02ZBq90uZTYbvL5VcSfnxuaww1cDnZ4/aRcFy
	 KILD5xHJzQAyYwR5AxdCp/Iomw27kCMRugwLe+TQx4mAIXH+Gr44B1GQbyy5FzS9A1MRY
	 qF7+xY0OJwVnEFPprSNilAVuM4LBL9zjN6fIYx/qYaRhxvNELOEsD9APU25yK52i7oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490669;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xVcgSKEoiJgg+H1FyrIcVXoKCvo2YcTYdwMzq7YEsS8=;
	b=zkEd6WiN5dsKet0bw5mvJ6DeTCShIL4QeRu9V+ZjVkriusY1JmSQstf7GWR2RyaTEDig
	 QvZoY+YnFcPBiPzXz/ctE59iG282teLP0wP/jhxzLuLUEl04O8w26kg8x4WhnXXuNUb6b
	 OTF+X5kSB33izMmgW3N5mNpLyOK+J117UnndprFk5FFTt+wEJ8vbvJjIGkRpfvJohjKLV
	 6/KF2l14VaLI9tvDrmzDEj6Vy0cBvxgN5YSqtzv+YD5JJAKY4Jr9hkKyUV/aUChK7DJmR
	 c1pdbpbDS98zSec95etOAZnDCQbF2K2dUBOvgEHLe2Z/1poiScHW0IWewkR+ViQ4s2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7q2Vm5V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y3x4dn8Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E79606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E79606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7q2Vm5V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y3x4dn8Q
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iqTm125791
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVcgSKEoiJgg+H1FyrIcVXoKCvo2YcTYdwMzq7YEsS8=; b=E7q2Vm5VMYhyrtGf
	CFZs/Mgktw8daQ8HJgkgi1ceLDf7u/ZpiMhYlgLnj6fXMEd31O+B0aNzHtRSY7XW
	LrkrTogp0Q38BwCZmhA+889+IXMAaSsza0ne9qFuFGvBu0doQPsTAmk7WXlGAE5S
	2/lGW4DG5j6q/TU44bTw/iWUaJlPdY2Wt+m/F/vfYpOXBcA42Vjvl+E7UoJfZJpX
	3tBf0wxxHpNg7jwHPqIZMC7rNGarSNmmGowxZ/JeRHJ/JNvOiton9HIDbxybwxQZ
	RYsNH803LpC8MFpCWWMF5JkARN6u5Sco0vRXKgI9WlU/ZsBRnQ37mP85WC1TKNGO
	wPehzw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a097f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:37:47 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece45cb25bso1301002e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490667; cv=none;
        d=google.com; s=arc-20260327;
        b=FkfnaRuNdYMfyC/JBqKaohyFXymRyL0Kutvd+inq/XNw0tYHaQ9yQC2EOsiunzA51v
         vtkggjl86aZupWNTcvsrFpVxOw+tfsv5QRp9Sphk02Bc/znJ3mlakCW5ys7qjd9OO2mq
         jV488JGobx3fBlmpYK0AnWNKuE6D6oo+Hbgt7cZ1ldp9uWjA8UGVHkGlydMM0YE+HB0o
         pCXT1LtYpESpGUADBZZp8fQpeQv+mlHKrZg/lHuXJYs385rW/lqytV7IIzF0dB31yGrN
         M5BNFtoDMUk5Umznlcgw2jgXp6ZAZB5kZoqnAaxk6O5DwwMEG6UWYOGvO18CJZAq+CCG
         1pHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xVcgSKEoiJgg+H1FyrIcVXoKCvo2YcTYdwMzq7YEsS8=;
        fh=4a5lEqsbKtk4QmjHFo4zrIppuya46wxG/Oqy48eM8Ak=;
        b=jV3r7Umcp9i3IVqhRhu3prLedDVwWhWdHs83vXilMFvk2562r57t/+E34SGPgXHA2E
         4ugrYw7W+DVn/zN32bCb6RvGvXzC8rdw/uwqjmMWXkWZBC06ParIx/ZwqhqtnTowcgeu
         gSezwsQ9OQaf9nwjpivo5Bh/I8yO2BCaA9t4hjFkZ9G2Nc63YZ4HeADGQTBh7e6wIabw
         YXakA7ihMqjyS8dMl81t2u1kfMrpHCyEqnhE/r/FoaHLZSY3YeyIXF9B06VK4Pj9dvSw
         sWiWsfdNT0CebeM14b6gLa1a4zeL4IYHYEqGge6JGgbN28DIFzQIv9DceYn0LKxcdKdQ
         ffiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490667; x=1795095467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xVcgSKEoiJgg+H1FyrIcVXoKCvo2YcTYdwMzq7YEsS8=;
        b=Y3x4dn8Qflmv28qZrW5v1HJNOxNDv/hT8nBk19iJy1ow0swtZcnbedeH/skjttX4Pl
         AXp6XaHgP7dX+C+zpLn5/zKLHDYr9eiUWTdCFkrEVvKlzpsAGh8pru2WFpKVmCOUu0Wz
         BAE9R9rF2eJvRq46c7LAPNz9MSMPn15WZi5QwzxzFEk5J/M46f+SYrqPYReyTlbEsQdR
         6xP2h5O+hLpNDrOqw4DTd4cIDk4XHUFpCveY9/TMkF7+jkhkSMFEYjaSWXVdoLNfZXNn
         LK0/+oBk8/fgdgHQe0kUiGPkTKURxBdqQFQTC/M8q2iFT4wXFZvHTi1L4q1kpmLd1r3c
         ymRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490667; x=1795095467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVcgSKEoiJgg+H1FyrIcVXoKCvo2YcTYdwMzq7YEsS8=;
        b=1/12M+4eyMlmk7nW+r5VBYFOhmC1UBCqq0MzgiN/BweEIbtcMdlnF3n7Q8RwdWc1c+
         Gih9Ws7KQZMSEMbFWeer7pnWzUD71WLXNo+crC8rdd9IB8HhRat4x75EJpdJKT9p+F2d
         txI8LCPnnJj52Wh1ZfqH7tjE4rs13+0vU8ftVNYWq2k3zHMsOuSVkb/ohqxVWHZHxRWZ
         XnByBjB8y8dElQEHqxiB/OzEIMb5NvqR8HvdrJ5ULIPfZhgub+TtviVmUOLR9XDM4ArO
         27ztM32TOHXxhCLvQdzuwhgIZM+cfKTNrU21XcO39jZuAPCCeJk55KphZNSdzxsP8g0H
         vyDA==
X-Forwarded-Encrypted: i=1; AL+hErHTDTs7I7A0ycwHWNVPs/V/WK93ZPKr7RJ9qTHbEa4NYyOeK2juS1a4bthJVcBhniL2tUdczrnIX6VXkOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bJA/mQ6vF6Umy3QvvMblTtBNOGJGWI/LtjVnVt3ULwLEX4FmS
	flh3d53kzEsVFD7HXuf99eNvOVTIZJbiO2PTVfBkRX/Qa+jwwjh0dB5Zdi2FjTuOk3SunAlVP37
	9WkDCsOc0sW1zt85Vw+jM0N+drMnsAMP91JmK1bYqdd0IKCZWIDbfJscLG9vePxH0J3ZiTKAHRv
	jXyrvlMa6cjXPao+NO1626zSO2FkGz2dltO0cMauB0iL/d9YvL5Lyn
X-Gm-Gg: AYBFou1ak/Y6Az0FN01A+E6xjCVvDOJIPlCB1EcZ76hLUkbyAp1PMxR5Ii8urPRSWk8
	jZKQgOH46CBqayF7Ty7wO212XDbOmgYWSzc6KksoUKabHsWCWiANst09BSMLWLKcUjMmRrOmwXp
	+K5nW8q0OFEFkgBv+7ZcgGXTN8w3Qtx42P7YZ3Lv5apFXmTPnak93NwqixFQ==
X-Received: by 2002:a05:6102:3911:b0:7c3:6466:3155 with SMTP id ada2fe7eead31-7d5061cb5bbmr1984728137.33.1794490666693;
        Thu, 12 Nov 2026 05:37:46 -0800 (PST)
X-Received: by 2002:a05:6102:3911:b0:7c3:6466:3155 with SMTP id
 ada2fe7eead31-7d5061cb5bbmr1984719137.33.1794490666279; Thu, 12 Nov 2026
 05:37:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013-genpd-boot-performance-floor-v1-0-a765dc83e6d7@oss.qualcomm.com>
 <20261013-genpd-boot-performance-floor-v1-3-a765dc83e6d7@oss.qualcomm.com>
In-Reply-To: <20261013-genpd-boot-performance-floor-v1-3-a765dc83e6d7@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:37:34 +0100
X-Gm-Features: AclHuK_D3_dNomlWbL20p3tVMOhfrYVgRQMwsyI6NGH-uAbOYwZihTFEQR8CH4E
Message-ID: <CAPx+jO8buJH7eBFdzd146F=aUJifSDiksM2FV37fCjK7kOb8AQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] pmdomain: qcom: rpmhpd: Let genpd enforce the boot
 performance floor
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: hdgU9rjOmrdr9FIrryvwSJSXbcT8o8p0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX+XthGFs4jHF2
 C1aBJB0XdKwEqx748w0Z432Kqvm7zY9QHA5LilnLaX93VInDfReshPhZfLa9erDLi6dHhL7nC5P
 AeM/YFedZGmcnXTh4Hu280tukOwiaPNtUByWAQ0xr2jbT6vvsasWSUqsakjRs9Qx7nHC+p49qrH
 ONm+79O+npJgFs0hrro17187HM0lpoE+d5uDCK78aAF8TlaSuT2DUIY0ncfjXsnB4Ss5VgjT9qB
 RWoH1Apv4R+FXDvUk72aKO9ERgW2cwUbOIxP1DEnDUgzZTzKTkwWbhLQNYLjWAW2dJrZXa650YC
 nv51krlqcH61jcQ6aYIqMkeOAP2L4cssIUjiAcWNVCK8mv+a1TlVvQpejL3bn1s+/ArDlW/n2Cj
 OJ0bhpUVCJdumGGSdzjs4dIi0WgTKvPG8J2qJfx9Bm9p5ALzzP6yxerD7dI3uDplBq8tOcmXjc/
 Vx/Imh8G3S5EKpaBNFw==
X-Proofpoint-ORIG-GUID: hdgU9rjOmrdr9FIrryvwSJSXbcT8o8p0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfXxEgZYL0elUPN
 oCL/lvzLvARFAUNFk0PuRw0aRkmGQSkTYaoBhkBknloGJBg5yEyAJY37ujUsNItuQ0KdQshbnVI
 qK15nShxgGa8TnjwYRT588HoHAjBWNw=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5c12b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=jAT_WBN3s0Bi42_mw-kA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120054

On Tue, Oct 13, 2026 at 2:49=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> RPMh power domains are registered as powered off without knowing their
> initial hardware state. Until the provider's sync_state() callback runs,
> rpmhpd_aggregate_corner() replaces requests with the highest supported
> corner, leaving genpd unaware of this boot performance constraint.
>
> Set GENPD_FLAG_POWER_UNKNOWN and provide the highest mapped performance
> level as boot_performance_state. Reject an empty mapping before indexing
> its last entry. Let genpd enforce the floor and retain consumer-enabled
> domains while boot protection is active, instead of clamping corners
> inside the provider.
>
> Retain state_synced for the hardware-specific sleep-vote policy. Include
> the supplied corner in sleep votes for active-only domains until the
> provider's sync_state() callback releases that protection. This also
> applies when translating an enabled peer's vote. Keep the existing sync
> callback to reconcile votes for domains left software-OFF by genpd.

Hmm, perhaps we should start by just enabling GENPD_FLAG_POWER_UNKNOWN
- and making that as a preparation patch, placed first in the series?
Would that not be a more cautious approach, taking it step by step?

Kind regards
Uffe

>
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhp=
d.c
> index fa8fed5bd3e5..1488f31bcdda 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -40,7 +40,7 @@
>   * @res_name:          Resource name used for cmd-db lookup
>   * @addr:              Resource address as looped up using resource name=
 from
>   *                     cmd-db
> - * @state_synced:      Indicator that sync_state has been invoked for th=
e rpmhpd resource
> + * @state_synced:      Whether boot protection of sleep votes has been r=
eleased
>   */
>  struct rpmhpd {
>         struct device   *dev;
> @@ -982,7 +982,7 @@ static void to_active_sleep(struct rpmhpd *pd, unsign=
ed int corner,
>  {
>         *active =3D corner;
>
> -       if (pd->active_only)
> +       if (pd->active_only && pd->state_synced)
>                 *sleep =3D 0;
>         else
>                 *sleep =3D *active;
> @@ -1006,13 +1006,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *=
pd, unsigned int corner)
>         unsigned int peer_active_corner =3D 0, peer_sleep_corner =3D 0;
>         unsigned int peer_enabled_corner;
>
> -       if (pd->state_synced) {
> -               to_active_sleep(pd, corner, &this_active_corner, &this_sl=
eep_corner);
> -       } else {
> -               /* Clamp to highest corner if sync_state hasn't happened =
*/
> -               this_active_corner =3D pd->level_count - 1;
> -               this_sleep_corner =3D pd->level_count - 1;
> -       }
> +       to_active_sleep(pd, corner, &this_active_corner, &this_sleep_corn=
er);
>
>         if (peer && peer->enabled) {
>                 peer_enabled_corner =3D max(peer->corner, peer->enable_co=
rner);
> @@ -1210,10 +1204,15 @@ static int rpmhpd_probe(struct platform_device *p=
dev)
>                 ret =3D rpmhpd_update_level_mapping(rpmhpds[i]);
>                 if (ret)
>                         return ret;
> +               if (!rpmhpds[i]->level_count)
> +                       return -EINVAL;
>
>                 rpmhpds[i]->pd.power_off =3D rpmhpd_power_off;
>                 rpmhpds[i]->pd.power_on =3D rpmhpd_power_on;
>                 rpmhpds[i]->pd.set_performance_state =3D rpmhpd_set_perfo=
rmance_state;
> +               rpmhpds[i]->pd.flags |=3D GENPD_FLAG_POWER_UNKNOWN;
> +               rpmhpds[i]->pd.boot_performance_state =3D
> +                       rpmhpds[i]->level[rpmhpds[i]->level_count - 1];
>                 pm_genpd_init(&rpmhpds[i]->pd, NULL, true);
>
>                 data->domains[i] =3D &rpmhpds[i]->pd;
>
> --
> 2.54.0
>
