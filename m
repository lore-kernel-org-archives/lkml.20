Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592111;
	b=vjRzudQ1VASLdgrSOD6pY4lcIb/ewCi5tKKpeLJBo0k0jurtvJ7qGv7Zv3o/inRJLz1j
	 rCKd8qdIHP1z4RBjEmP4w8jjA44LhxWi1lJL4NTbPOxzdE34OgeSTNe+DlQJYQrsM1U79
	 FW8z4YxtrcmxsEz/0AqKT3dL+JMciR8fyNZOgBKMrBk0bSja7+Mayx1rruOeXcynS2KP7
	 hOfb9tTEGhHP50ORPgTmbyPfTBl1A/YSpI5GnKz3Ux/QjkqBHYikpBz0PMZFkvRGspb6L
	 lJ7rqlFDvx94fVt9VylBUejT5CGw5tlng+zJaPxhbXC2hk3vop67L8pQk5Lms67mQ7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OXFTYTHJxfVh03mXC0hFzyo52/qWvEBt2PQzkOclsuU=;
	b=JW4sthPGkATchcuNWp7qZN8FpypSiY++VXPO613zTbRz6aeczICFGWpC8C9AYW6aWTAq
	 AyMamVAPifzf/5Z9BitcyzD7rbB5DPVe60jgfBM4YbOBmqqWoLOb4lvDmtRIxDsbY6ik1
	 1L0umOD10aK9v38uLGiknBp27thQpLiBS09ZPllsTN5HDA1KQFNmYgAg2Vbr/iPaThEwY
	 0yo99bnzKYtnajAg8HPKuwDhkYejMd6yfpz4TvMdMu+5eAJ0ztewZZLn6sQeA+IQv47/0
	 X7o+5e/dYfTQ6QsvBE+GetBMLquOyiXvuCgQdng8GF9uwuLV6uN5qYo/h03/za1G38g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KkfEYeTI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ar6jBOV3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0013606B23C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0013606B23C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KkfEYeTI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ar6jBOV3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR4Lx551701
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXFTYTHJxfVh03mXC0hFzyo52/qWvEBt2PQzkOclsuU=; b=KkfEYeTI9lRmQdLe
	fqlpoX65pQrVvp9pbgz/9IcgLUM7nN14d9AkwYPEi5PpQKUoSZNODD7Tm3HpEFAH
	2PgmaV4ipL/vczkEMqV6E2lXPISjloHIcJ2JNdt1IODzvMRzVjvtGf/sLvhtq+R1
	WkFgN13QpDuKn6c/Y7yqxZNdpAYHmrfJ3hzVrXxl6ehpMJvw7OjyLua1/SAAMYCY
	9tVGYPeV7d2pgKeKaT+f33fb6aSh4gHP5zyLnpjtPjOYxo6b3U4bA1AHy9unJg+G
	KIcLkqD850a4nhIsk8xGv2p97sO7YbW9UL6VZGgT2mgbJcK5fCvFrcj6Cu/ChQpX
	vumXrw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwc42p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so1841173a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592109; cv=none;
        d=google.com; s=arc-20260327;
        b=ruyPxf2xd6rQVGCa7c6/ztlBNG/fJGZ59cLu11+aKuvK8e1Y0tpHp0rRtf88HOTbtQ
         sObi/CAmwGINSKDCi9XhOaWzDYTeN6cufH1QY4My0y9cmxYODuEqHClHZb8Vj+vj6bGV
         Cdg6+KzKooU4QdnVLGPW2efMADwuLn5x4aQm0N18R8DOZPtHyvRPLC4uJs6pZxeDG7dc
         0IBfIvU7XsWR9Z7cSvsxeQni0ilBPc4+x9/E581EXme9ZqTRuNVMJYxGZRP2DaoSH6ss
         w/9EcmS0FQIu2MbDYNIvCs0zk8xyY1RexzjnNW/GYSh53qM6/5lsvEk4Rg4iL1ycZuIT
         bPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OXFTYTHJxfVh03mXC0hFzyo52/qWvEBt2PQzkOclsuU=;
        fh=LqdyCgby15wZOO3Z1s1bgsUixGOG+nYUHuc3Qkek8ZQ=;
        b=SsFmQA3tUyY5busQh746GiewgHQLXvr8sRBQaVHs/1oBEwrbtZvm45QQx4G4Z71+Al
         B30vUrkIc8wWVFIJyrp/0JwCqZONUNadWNAdhyQTKIIYyT5BRRS40xm6PtswQEsZGhgJ
         gew1acmRV88Ubg7F+NoAqXPRAjjKID2tv4cHFVoFZ/gsp6J62uVWNNsCpJXuTDKnqBeM
         sMlSSgXNiKzqptYdxCc+Nh0h2cOqNQGJKMafwbI7OZIbavZ3YvYpVZuL9w5faKeRDcAx
         oV9FLWmA9LMLsvgHxHoaQVfahZ4Ox5LvEe8Lwvn1ddE7y1RjWmcmOk0lLyWnAJ6eN6MZ
         9etg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592109; x=1795196909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OXFTYTHJxfVh03mXC0hFzyo52/qWvEBt2PQzkOclsuU=;
        b=ar6jBOV331Na1F2iVPRwYG+AiuPeMzoq+rRt5hIsizZCkTbMo2rShbCbSIShF1u5oo
         6fX6SPIHbJmatJ3lcHGZeRyAU8EQA/WZM7YRiIEVxHqEfUK0bEEArApuaurB+9SyJoxR
         S0Z6/xZxqqSRhA66Juysw+trgEdlBLEZ+Lfilv8UfyNggRsXuN7yPuihZn1rC5fI5px6
         6GjSP/9l5hfSwJm6mj6Sghg3g4cMMry4c+CNQawySDk5tHD0H+GCw0hsHXpcywXk5YaP
         tU05T2hvLDk15M0dSfn+KxNLldy35T9/e1knaw+zBXGDdsFiFtusZ3ueLxxfMuoCW+Ct
         RB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592109; x=1795196909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXFTYTHJxfVh03mXC0hFzyo52/qWvEBt2PQzkOclsuU=;
        b=nijPJrM0nEJQjKjD3y/V0hk2Occ3oxxHT2OFHirmDUjSIRsIz8BhoCmeSEWv3ZnBPF
         9O2BMnK/IblRUDPL4xXUBFiG1WuGbhh/7ND9+Up+X2Boqi2GnnC1fk9GTrNvgkHS2ogN
         yhYW1QRsHq/I9V6VTZGDnJYx4QNX+DGuxADHYISSWbt1UKwKifZ425gMfSmjiIhxJnSY
         Rc43vYsxBoDkLkkiya9VXBNyu0htsrlBXej8G3rPfAYk6PMWORqb/2kH6VYsxoU8HhCl
         pmay5buiZ2mCie+JGVJUWyhmrZtiooV/1xucu175aSCBiNQWEBB6EwNOHcpCBoQB97nT
         YGDQ==
X-Forwarded-Encrypted: i=1; AL+hErFd8JINbcYMX/LInZ3jKFF/9D4gpKAHkPpuljs//R5eAAwABCt6g7y+fWW94+jM6e91nt+eedvijiuaskI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vk/5/Il0ooqjgxHCTxSy/pA5nbbdVfr34GOdF6aEzJcjTqHpx
	jdpBFTYlacZ8HVSnZ+a//pEAP8E3GOLzev1rf7zSyzHHEsv1wds7tLh2kEIQp7rlhd7jfebQwWM
	DTDC/9yJ7jCfh+uVPLSrvbo5rlMxkhVq6OzrTVPQTc9K+/y7rnKGKggS/wBDAH2Jex27uHWka6r
	TrBmerZl7PQYe87UP7EKfrM0qT5wOo0wLy7TgUe0GOyw==
X-Gm-Gg: AYBFou243GQuMi+FlYqsSDPMbRsJ6SrV7mbEBLLxgqu24oaEfAAklN7zYU7/R87G37s
	NdOIWjRH9kLfgpFwZklmIru5/AKqfQk0GwuFQReHLidQ75DO4k027fYCeCs9h+OA6rZ+w5sylia
	Le3FOtOA+ePk094RERQC43hASX8EYeqFKD1bVI14/uGUvQ6urRE2p3yEAyDA==
X-Received: by 2002:a17:90b:48c9:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b1b0cf38ffmr3470950a91.49.1794592108613;
        Fri, 13 Nov 2026 09:48:28 -0800 (PST)
X-Received: by 2002:a17:90b:48c9:b0:3ab:f2a9:cacd with SMTP id
 98e67ed59e1d1-3b1b0cf38ffmr3470918a91.49.1794592107986; Fri, 13 Nov 2026
 09:48:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-cpuidle-defer-v1-1-c86e0d450b4f@oss.qualcomm.com>
In-Reply-To: <20261020-cpuidle-defer-v1-1-c86e0d450b4f@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:48:17 +0100
X-Gm-Features: AclHuK9kfYky7mkn_GcNiHozG1zO-1rp4kEjZJ3xhZTmPTd2IODzmeeVV_jJyfg
Message-ID: <CAPx+jO-EkVSELG9L36ZTj6ZdeAJFTiN5L7voxCFrDN-w_GrtSA@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Do not log probe deferral as an error
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af74d6d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=g6GHq2a1GYICSwjt_K4A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: -CJl35xdVPzS-moKoS8AYRnu1eZXMy7X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX5/Vm3GtHSdFY
 cM8DzQTY0kyoXcp+prJj2j8JLB+yUTGeT7onXoJzv5dVEsGd0VG1G+eb7NjsKyJA9ZLwVReiUsg
 htAxBL1598sdlTaIRJuqyXryVhbHzMo0oMmSyJV77pj0dhA5wdP9I+kGfceyrGck7jQ4dua28I1
 Rmr9pZmVC5E3i4d/wjf+tk6tM/i5sSkCBrkSe/IuZ0QX75Aa5b5wypLA+JXJUpPh4dCa3qLpW4b
 PS0xeHEoJXFhZqTlgV80PYvVINbt+ub7S4zXzsZaIiuWkDFNbIpCMJgQUJGdy+JLCSmF3pJxeYe
 IGwZHyNivykD/MO6+0JMYbbCpstvvGZXseRQ11Krg5TgCMcUvR8vsj7Y7ApUdybN88gBu0FeFIn
 zYumXH6iyW26eU3bX5q868UHZZ2FOmYnk8VW7qqInidLfjLQ0X1pBrGNd3cVtlRJ8WZuBHF+mn4
 kh+FkdYHP0i6OYITT2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXxnuI6QsmGd0g
 DiCKJwQvN4k6qgre/bMN7+EC325piOMzRGa6jPtcjkr6D7bn9HNrBdsWfFW4uataK3X5DThJ+Z3
 6uF4aJeY9FrQDObKvyVjwPyB7Hy7ahI=
X-Proofpoint-GUID: -CJl35xdVPzS-moKoS8AYRnu1eZXMy7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

On Tue, Oct 20, 2026 at 4:27=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> psci_cpuidle_domain_probe() reports every failure with pr_err(),
> including -EPROBE_DEFER. dt_idle_pd_init_topology() returns that
> whenever a parent domain is not registered yet, which is a normal and
> recoverable condition, so an otherwise successful boot still logs an
> error:
>
>   CPUidle PSCI: failed to create CPU PM domains ret=3D-517
>
> Report the failure with dev_err_probe() instead, which downgrade
> -EPROBE_DEFER to a debug message while still logging genuine errors.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index b9e4ad7d43a3310a76ce62018dff0af1488e33d2..aa73a2fa14b3af4d1e3edd607=
e058ba96132bad7 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -173,8 +173,7 @@ static int psci_cpuidle_domain_probe(struct platform_=
device *pdev)
>         dt_idle_pd_remove_topology(np);
>         psci_pd_remove();
>  exit:
> -       pr_err("failed to create CPU PM domains ret=3D%d\n", ret);
> -       return ret;
> +       return dev_err_probe(&pdev->dev, ret, "failed to create CPU PM do=
mains\n");
>  }
>
>  static struct platform_driver psci_cpuidle_domain_driver =3D {
>
> ---
> base-commit: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
> change-id: 20261020-cpuidle-defer-4e6184bef223
>
> Best regards,
> --
> Loic Poulain <loic.poulain@oss.qualcomm.com>
>
