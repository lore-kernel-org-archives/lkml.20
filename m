Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794308119;
	b=Yk3fH9+qKSYtZmRxXo4R04qbedllGZ9OdfKUc/xnmg91c5iZO/iTbL0gvASNbnekShG+
	 wQikIBhUvv36BsjzdjUO4q6VfFiNdVJcd9d8hBcUVlApzgjaLyn4tGsq6R+4ob7tXifRt
	 OMYNs1BlaQQQUmOzHJW5lqmbNRSXv50RqVxUI+WqWcHPpZKD2bOojRTnGFKVuxc8zFRvI
	 78Zrec+wOJoOMMPByBoaruWMWY5lLQM61uC+Ghbf9XBBrX6RVfQim3HAtE3H6kgnB1QIP
	 L24IFSXXeVn9kZ70BT7HB0FgWITPaJbMxxbnalotzXhcG5qCUZxHPoA951VxzQGlbRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=;
	b=lJ6Tk17GdE2bWqpVhm02EoCaku86XUjPmcLJ24KjupQs3XQR4eiu38rZU7yDHncVkgPL
	 Jh0QF/Tl14+3WecY6WczmZYVm3TJUz7teIFdhy03Sj42+u/+d2Q6zPEY8K6JoFGlnF6Wj
	 WS/Pj2uXFdgGL6n9aukwg+TVpzDIHPNiLApg6qxYORlyu2ltZBcU7GNgJkryd7p+mGYN7
	 eR0z7L3duZahesYai/VgFxq8NMVBttnf/SNjeoaU+5UpQxMlazYvaDZFMGRCfzrvQ4MDu
	 gy/pz2JsUP+cNmnGev4xmWrCjBvqnmSx3Cud3tk6szf8AqdDgVqJvDHS2Uezbuil4Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oe7X6rYC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iGLOvKGP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9FE606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E9FE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oe7X6rYC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iGLOvKGP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l8Zv2433783
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=; b=Oe7X6rYC7ba/GxLY
	1OYvKjjZ6uf3OAffFNrlbabF2j6cVGaxzg4fn6/E82YNIxSg4iZ1C7APW8DdxE74
	ENiN0wjxqWTlZyELXOx21oPG5L5rh7pROa/FzwVB2r4PJFSq2xaf24BA5eVpoCqd
	n94N7ixOpjlD0E1R6Eu+wPx1tSRWTK3hiGZzlCoAtUKRUdCNFfvXMxxzcYwQPtfs
	SOPfW6xghtNdIDosOPXruQRUcpbAEF7vY8V4G+onFhTXci6VXJc0uVczIg31KFCg
	ZOL6jgxic4Sxf+mbUym3+gb77zBlCMN3xILGCGKR66T0CV+zSTfYRjfSKZTJWotV
	FVc2Ew==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux848xx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so2771731a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308116; cv=none;
        d=google.com; s=arc-20260327;
        b=cmpQwhFX70S6LZC/ZJ8ViwXHD7U067/So/amaM/j1l12wh5cVSMprcpyTROisutP7W
         LI99UzeucSuwr05E3u5OiztzA1qNpzjxXVBwC12ZpPb94fUPMTptCwDbvJtHBxK5+Cr0
         MHcrnsDsIqlZePfvzOFeMJB+A6DIijWCsxe9PkQWhIewk7CAQu3aA2vD1JQL2FzeYrtq
         H7a7MOTVwKunOKs7ceuEx7usaFfHRJahNsW0sOxo33zkNjG5QzBocDAb2Dbqh424SWr4
         c5Ylv+Q2B5eUERLu7WvdRGkmg/6P+VvE9ozj9rZtYkGVqRyFmkGytL5T6LIJACxzJew9
         1aFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=;
        fh=+8YZxEd/MjuHkZvDvU+06qZmAqbo5AqBkSkVv1NLax0=;
        b=rYLhHFBCxu/Tyir1Zl0k2BCeSOY51vCtuKgjQZUZC5dYqZ7em1RMu1UDPEc6vdd0bT
         B+Xhkuh05j5KbK7VZ5VsxIO0LWrhp/2Iw1zAJNHx8WoScAZ54WK0nmqxpf6JA4NkAzLy
         uMdODFAZY8UF26jThrr3hAaq7hhRIFNIyag54DosogMxnXSJS6i4gNeH3FqGMESGEZ1C
         Ek6xGPGfExkG6Hugn8SWGWc7anZIdQcypDK12Ht3ZnN1uYQYltwMKfHCdGC8t7LUtUYS
         R3IT6+L2Jo7zjjsgUrqtOmZdjrrohAZoVBpvz9wqmeHC0EWJVUP85ZevDCo5nxaFWjcB
         gEFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308116; x=1794912916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=;
        b=iGLOvKGPL228gMU6kednwrmkWHMzhMweiF54OAKArGCKzEyXK/cFBS7wycFEGnvPjc
         APY6t0VFszvzVPgTerB5SjY6zvioZnMy6i0SyscAlXhBa12w4ZJutOHQWN+Zlg70/WWb
         bP23/GBEtwzp31gQU3mclAltD8hxVV7D2LI78UCY4IyTXchVrQnDowoWrQQhhxZbKdN+
         WVGyOZbEbp2Sgq14d4+0nX7vsU8sLADQNcciKFy3lZc8scYRwoVJVkcpMLrw6IcHKILo
         b8sYJVoGAIyDCXVGTKDhVmSsp+peIQrZ+QJQPm1PyANJQc9mzjQboo6bOC2wb1S3kL6q
         2OhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308116; x=1794912916;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=;
        b=aQdxvuM991tEUrsuE+MoVn4yz7I2HV7OE9vr3iJ9KHXmf0doEPEAThS+Jl92yoTUb9
         Qydacsudp1BClyFrq2uTBBZ0NWaxJxuz819K9TjlTbh3dQTYwLcH3e7x/aQn1qFPRkvQ
         7wTDfwLgjgQbakNyrN6SBzC/ycW/BN05JHDCjnTyKLpDPHZEnNsbfBQjAt7cFYwNdIHw
         tEeAaWLGSVhUjicV4OLRTniESH87rfkjr0Mhmt5Vs4jg5MB2kEDww1RRJsmNlw8sxZN9
         yrSmTe3OE7GVeeWIPG55lNYBTSS/e4SPnwTBZszz9PDKieaayfel/q1sTr/Tbo2JbH/K
         C5Cw==
X-Forwarded-Encrypted: i=1; AL+hErEV74rTCh86fcMhif6i8AayglQXYlEY7ritwduTHT56n39ubX3vcpDhz/cJ5XUTpm1hT8Oza+J0dDGNFws=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vgA4tpv+YimcsoTr6lo2dk8gkIrzLPBpCkUtxeVovtWWBsiV0
	dlny/ospUNpF3PWyS8wgrr9tMyiivYrh6rygYrJky93whaFWtKDNEDYSLlokOidx5FrW8cgv5p8
	g56If2wD0997n5um8Aa+Z+M05UjSk0wdeDO5BweK+piLekBiKl3BA41GRi23ChQejzmCqLK35sH
	Gik2rs23jGMiFeBySMzXyuPII8u3CsS9ev/1cbKtTauSfy3aioXA==
X-Gm-Gg: AYBFou337j2nveRmXGf1pJzIQ9LI9FlsZ+mIG5PV+ec7MDJ6V9PZjHTK8wORXG18EIt
	7nfnwHRVo6/E2lyWR4Whs9qZna6oLWmnLasX9Zz9vO62dMZZff9SnDZ2p79L2IyJYpTv6SZv0db
	gbylE1yMIHFpjWjVkuRk5Bb7mfYEzbQYOKpH8zLm9GMYPJB+xv6xIFeC2MLg==
X-Received: by 2002:a17:90b:164c:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3b166c84952mr2169234a91.10.1794308116364;
        Tue, 10 Nov 2026 02:55:16 -0800 (PST)
X-Received: by 2002:a17:90b:164c:b0:3a8:9d0d:ca50 with SMTP id
 98e67ed59e1d1-3b166c84952mr2169224a91.10.1794308115925; Tue, 10 Nov 2026
 02:55:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005131923.291619-1-nils@buechner.me>
In-Reply-To: <20261005131923.291619-1-nils@buechner.me>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:55:03 +0100
X-Gm-Features: AclHuK_HV3ZZmq-KfeYfcuWg-ilNBvuN8Akbycq_to22pxvhsiankk74K8OHQ30
Message-ID: <CAPx+jO8KitFsFdDFfza5WTZGwVzOOtB+Agr=qKESHf=54q10Ow@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: mt8183: Fix silent audio from
 premature sync_state
To: =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX3WMxQzTnRXfx
 O+/iDUWe+SOwF0YMpnwjXtidFNCon8DybA+CtVi9V16yiyCN1dsiFiB0gOjtJp5mqBnpLaa2zym
 vOmaL/JGHEP4G/xxbyC4B+stBL5olW39HfADj5vrx4CG4PNhXXDxh+0kmGtM/hH+8XUzAsAjfgc
 TU9SDHWhAyysfaDqyWctMzS1BpvFDSsv1i828tLO4o4h3OnpWR0gpeSMG1Dmw4QHa14TWln6U5M
 XjwUraksyE40OXC2xH9adNIarXH1Rx1nzAVZkYYxtOUt+XFKQUFcRrMMZXEBlcygQlk/6I4f3uZ
 R3ipLuAm3PzLCrh4/is64yKfFkVlnDwQIS3Ra7r9SXHOuUPdsMprv5Vqdth7Ipq/mT5CBej7qRn
 BO06M6BgyFOu6tM780qRj0m5TOhRjxYCab5tditX3v1RFELaNE1vrQNXwCyciwddkEsk5wMuLxs
 WAmMq2R1TKCENQC/dvA==
X-Proofpoint-GUID: mwD4Z4x8IQvFwTTWMiBi_9qD9_7HbRb_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX+23adFTaL+1/
 Js5BfbWgb+iLH3vKL588sL2gqJ/+2JpiR5g4xbpUuihYUm5dBTn3ePNC9cUS5ypOL2nUHLTbz1o
 pDld8JdMOu1RyJCcShCsO4xrdSmRJeo=
X-Proofpoint-ORIG-GUID: mwD4Z4x8IQvFwTTWMiBi_9qD9_7HbRb_
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af2f815 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=byjLVS86Mrn06biGc8YA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100043

On Mon, Oct 5, 2026 at 3:19=E2=80=AFPM Nils B=C3=BCchner <nils@buechner.me>=
 wrote:
>
> Commit 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until
> sync_state") made genpd trust that a power domain already on at probe
> time is correctly, fully initialized, and stopped forcing a real
> power-off/power-on cycle for it until the devicetree provider's
> sync_state() callback fires.
>
> On the Juniper board (Acer Chromebook Spin 311, MT8183), the firmware
> leaves the audio power domain in exactly this misleading state: genpd
> reports it as on, so this new behavior never runs the real hardware
> sequencing in scpsys_power_on() that clears the domain's AXI bus
> protection. Register access to the AFE block over APB keeps working
> normally, giving no obvious sign anything is wrong, but the memif DMA
> engine's own bus transactions silently never complete: its current-
> position register stays frozen at the value it was reset to, the
> period-elapsed interrupt is never raised, and ALSA playback fails with
> -EIO. The net effect is silent internal speakers on every boot.
>
> This is the same class of problem already fixed for the MFG/GPU
> domains in commit 818d56ac1d ("pmdomain: mediatek: Fix mt8183 hang on
> boot"), which does not cover the audio domain. Apply the identical,
> already-reviewed fix here: MTK_SCPD_KEEP_DEFAULT_OFF makes genpd start
> the domain in GENPD_STATE_OFF instead of trusting the bootloader's
> "on" state, so the AFE driver's own first pm_runtime resume triggers a
> genuine power-on transition and actually runs the bus-protection
> clear.
>
> Root-caused with a git bisect across released kernel versions on real
> Juniper hardware (audio works on v6.6, fails from v6.16 onward),
> narrowing the regression down to this exact commit, and confirmed
> fixed with speaker-test playback after applying this change.
>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sy=
nc_state")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nils B=C3=BCchner <nils@buechner.me>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mt8183-pm-domains.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/mt8183-pm-domains.h b/drivers/pmdo=
main/mediatek/mt8183-pm-domains.h
> index 5e33b8628..8e29e5117 100644
> --- a/drivers/pmdomain/mediatek/mt8183-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
> @@ -22,6 +22,15 @@ static const struct scpsys_domain_data scpsys_domain_d=
ata_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D GENMASK(11, 8),
>                 .sram_pdn_ack_bits =3D GENMASK(15, 12),
> +               /*
> +                * Depending on firmware, the audio domain may be left
> +                * partially on at boot, with genpd detecting it as on wh=
en
> +                * it isn't fully initialized. Force a real off/on cycle
> +                * instead of trusting that state, same as the MFG domain=
s
> +                * in commit 818d56ac1d ("pmdomain: mediatek: Fix mt8183
> +                * hang on boot").
> +                */
> +               .caps =3D MTK_SCPD_KEEP_DEFAULT_OFF,
>         },
>         [MT8183_POWER_DOMAIN_CONN] =3D {
>                 .name =3D "conn",
> --
> 2.53.0
>
