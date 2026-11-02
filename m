Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632255;
	b=oOoVZhUOynAwBkKNkoy+lefLirn+4IE6eQ87nNCLVz5JipMxiIh5FdZMSawDDOnR+PMF
	 tzr4AjpxjucAlS/mQfA7YMRrGx7Om3O81a7dtseK7NdvLoVd06Dk153puvRB+5OfOn5vv
	 FDEULqY0bK5T80As0JWemxD8VYMLtFg+4KPL8N0PsP3Hhr7fh1x4C3Za2do95QQ7VtPNW
	 7O3ydQlIi7o/Fom3atQ9wudCqZGCvLi1H0qEInu6QBUU1jbNWWZRqw7DLUfOoIrOS+ou2
	 C42cuoEmJ9v3p3142Z7++GbTYP1kC/qQNeAsOQl1hlLGLh2hFVIjEpWgFXQOAn/588Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=;
	b=b+f8VuVpu3VhzSShw0WKWvPsSWueoRh5wqIYRdpA/LmLJc3tUG0bh5xjH+0oyuZKNUYF
	 JEYbF5FNikMsfvDyUPyI/b3iWVDxFNjxuJTtC0PfjTy/iGDGJze8krU/l/YFs8T6TSGxL
	 9BkFqHa2vgv+mpMEPGv3Do0ZrgPRM6RvXtbXz5w5QIFsMNX/AbHzQo6W77XBOkiwzNimv
	 JcRl/+ebk0cjdeO/cR3XFDaPRFKs0EfgjGH0sn2nEVF/XAv/J+4d2Qb2Vhth+dc2OK55H
	 eQiu82C+XR9yolmmdHJmVla/gWhR/LQQ0AhcJO+Pa4K8jcntZoIAKypHXuSczSIgbCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Acb6Ao/k";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TTkdNv5g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49256607670A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49256607670A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Acb6Ao/k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TTkdNv5g
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpL8n3512650
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=; b=Acb6Ao/kD2+0R91x
	Z3b1mdHeDf24o/EhLrUbf5mmmJwueXoNJ0L79M9qz7jX8KUOEdAujv1tsM+b9bK1
	nQRyaJKOk3xCStxMevN9tQtZuGA/xjd+dGp93qNNKiciTFjOLYOGrnWEst2CpaCz
	qEpZJPaDXXqRgeQcjtflMGocW6BWY4OYuq5kehIn/SQWprUGlTmJacCFZvrePFev
	CVqBM07n7QOxBuGrklMUwqNTT7fEu0vPfRqt+wJHsxd4gR7KlOCx9k2HGLi8vggB
	IQfJJZrZNs5Wh6usomoXmnx0XOQZDhsMhOc8T2EQgpn+2hWaLtlIcYYUfQaZM3vU
	tFuePA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrherq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:10:53 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4fb73e868aaso5041493b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632253; cv=none;
        d=google.com; s=arc-20260327;
        b=gPkmFZubgHTx22NCnjk44g1hVMgJ3qHPieFKARdCpBLoUSdbSxQQukzf/UXwpnj+RP
         u8RKflrpNHk9hVfFDbu4sGaMkqqcm24QteHLf+DO7heGJGzzkzAtMnKDrb2ViO1cPj5T
         lVGe3m3CjH7oKR9D2n/pRK41wxyNd7Ang0NTTXoW5IWjQiBZCStZJsApWIOx52cahyJV
         t8ORg3Y54tXzdN6jHUEsCBJGxxaXkptmvE4L29ERxMoHEVziXdU1H0LRt2ggcvZKG4xG
         PbkwFtQ7nvFmS0yc5zM6E5Kj1fyibbWF2n+prR9ixQYJInlkPZY74bMBHFUj96Ufs73n
         RMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=;
        fh=VoCsjoEyoaw1Nbdp3f+fh2v7ZNhAbKPyCXMvHOBht0U=;
        b=X2lgRgHcGW7ghZHMPUXK8OVXcga5dZnlii6FuBdvaW6e1LifUrEUZBwbm1SsjDD5E3
         0dXhydUmLQ4hRR1JW4jrnOWfzLrhD3xxU3DII+k7FhbaoLFYy27WTFswjSI8c4IsRsDB
         0/gIAmskaH4hW19PcPG1FyaKsL2Io8NYmwnjtodV9RYbKOijbonYm7FIFany3UEtr8o3
         ZI3Jl6VCvM9fxETNPPn/6T5iOoL/gPuDG9ijWzSC3CpxaQ6j0DxC/penKQlzIOfqZkgl
         e5c52jnD7Xd7uZJiNQH4nDa/GxVAn3HkDRoRc9Lq8xyo69sYJhYbPvNz4C5TwIeQ10yj
         Tyyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632253; x=1794237053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=;
        b=TTkdNv5gRS6pA9GbsJRxl5LIcnBr8iIkhuV3FgkB3RPXYC72MRb0nLP3MwTIqbijIx
         HuCLJ+fbZPUayMjqtEJY6CeeKaMO3XoEI1Ip71zd25TmU6PVJM/vriDzbTOLP/K/7xlt
         W2CP71JDTqhr+yjkr4JoTyuzOI9BVyH0CpQvOmkpodiOKtbkwF+Gcy4aYpLzZA6rsbuD
         JHfER9k0jTH0rivr0hUU2KtldIHzATggR24xgBal1h+/gHedRzaSgARi8tlqsObTgoBo
         SNFP7IoMubK2v/SOpNSyyKNM6TVt/yqHuRzE/F5oWrArFDL+lYjQhrd20MrYhR9z2xcV
         bkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632253; x=1794237053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=;
        b=Ij/dtNiGtL2Bv4s0ssHHMS0K58ZPu2AsduNAfVXwolfFRx3/5y1TX3Uzvgj1kPlHrM
         5N/3TUvoreS/4AZ8mKKpDTsZLfio/zGWKQBHzjagxS8s3E5a/vv87X2seP6kZXSUpHrZ
         ju3GxDZZXhEgqeUAXKSPu1VkVp7QOstwODgXb6cSegGd9qQXYbzJW9XGNqJUamubMbt4
         4F0DqN0xuqVBPeXZcMeiDhyr2B/JPSX+Bd6GjfVH0enZproEk+j3gz6BSQtTTcI2da3k
         fwtXr2r1o2fxNDCkRjACKph/bRBpCRST7BaGV0E3zFdjAdIoOZOra2Sp+CaZOqpBTTuf
         R1Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ6l/lQ4PJBXvDWaa4CIBBcjd6/mfvQ9RFp0kTjSeZloOw3wkfA5QX1FO8p1KZmlrl6eO1tGJQhjHiLV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWyAoTepY2Qg3AGto4CqCobuOIJzyi3ds2jFHohHfW9bksbbs/
	ZWd2YfmfA2nEavW1Fu2Bl05BIWALFORWdL6Lf5wtbgdrw8uv95HItHwc/wv9f0dPkiKAaaaoHXE
	4LHrMZK5MbUqK8pc25aL3bWaPKvi3lJsLwZl+LIColyUpzWkInG2Xe4/QU/Fock0clDLQswGjql
	Has5vG85ioGld/7AGZ/989aq2SeVISJfx+YobsSYALZw==
X-Gm-Gg: AYBFou23GdrOhFPDm5ozX0J33NGTzfZh3TPWEdIqhC7pKYi/3YKUF/s/+F+/Kwd9aPV
	zMeKDlsNzeRYQ0G6DF1UeB5fPalDlLTeEQmxoJnsyeb7aKmWFzGJo7wn2dRyvJzzBmzAIKRPu+A
	nse3aUbaDwRqeYLhSdaSA0JikQCIGf/YH6SxmNszJgNSSuKuKlGTJsARdCEKNsPGRpqWL+01Fvu
	sbWC5O3gKIBAbmxJvcQb5U3FlQnM6CPJnp0YAFCNR11bYORXvMuEN7WrTlJJa/pVVQbf5o6sK8=
X-Received: by 2002:a05:6808:120b:b0:4e6:6079:c33d with SMTP id 5614622812f47-5640dcf25f8mr6442099b6e.10.1793632252674;
        Mon, 02 Nov 2026 07:10:52 -0800 (PST)
X-Received: by 2002:a05:6808:120b:b0:4e6:6079:c33d with SMTP id
 5614622812f47-5640dcf25f8mr6442070b6e.10.1793632252159; Mon, 02 Nov 2026
 07:10:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-4-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-4-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:10:40 +0100
X-Gm-Features: AclHuK-JQEWhxTCECGBwpwc7HhTmuHtz6VOr3jPQI82NvgKXWXXsfW9ieCjol3E
Message-ID: <CAFEp6-3FGuYO8TUtEeA_K12+CrVRPZ103KJz4AfFgCRFd65k_w@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] media: qcom: camss: csid-gen3: Enable RDI SOF driving
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8a7fd cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Pns92UxjTm5tqybKbc4A:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: s5PRPcFNRk00f_OMajuTKdEwDmJMl2Sv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX41CZq70GD1rM
 oe6ywiAXJKFURngxqPNSVMTwuQA7rXGMHxUa3tgUb1qH0H/GdnK2CMxve6aCcpOoLwGOxVvLyFW
 wFedRICrJO1zb3G69gNuRhXgZZZFQo8=
X-Proofpoint-ORIG-GUID: s5PRPcFNRk00f_OMajuTKdEwDmJMl2Sv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX7cfhVlY6PcH9
 X1kAKatzJQer+Dn6LkxJM78kJjB+MX2cRPCvnQH7FAaMlnz0F+fnj9lMtSkVBcq8XvejgG76u4H
 qjIAJgSXFlehF3OYpNVaaurPc0lsSZfXf9ybzWjBFFECGc+6eClVUT9aiiIX3VHf/vuOJEQsDiS
 YCyp8cupzx4dy19hjGv/3L6u3bL04FdI+aOeO5CWUbzfmBgNpyQEaIayJL5XHQCSH1sXOpnijPO
 KP00b4h8S5f8sgF2Ai77gpqWenY2mceyCc3X9hBMzvRqEFetDgTbSa21BFtMkd9FK9cwHBydKt7
 hq76HRc+/zRv5GYV6tvMZDQLnnbxb+8fizEk8i77/1SifvXp4h+Fb6JJJAfcnayyl/5i6znBivJ
 lMnT358vwtXGR2BCR/1bZU7WYPi/ATelntctnrara5OU45KRVa+YHt+y4j5ge44g8XxL3+OjVP9
 3bWsfCcbSj6acPq+5Gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020060

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Add in silicon enabling code to generate SOF and trigger the routine whic=
h
> produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27db..6a538d825f78b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -34,6 +34,7 @@
>  #define                CSID_RUP_AUP_RDI(rdi)           ((BIT(4) | BIT(20=
)) << (rdi))
>
>  #define CSID_TOP_IRQ_STATUS            0x7C
> +#define                TOP_IRQ_RDI(rdi)                BIT(8 + (rdi))
>  #define                 TOP_IRQ_STATUS_RESET_DONE      BIT(0)
>
>  #define CSID_TOP_IRQ_MASK              0x80
> @@ -58,6 +59,9 @@
>  #define CSID_CSI2_RDIN_IRQ_STATUS(rdi) (0xEC + 0x10 * (rdi))
>  #define                RUP_DONE_IRQ_STATUS             BIT(23)
>
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)   (0xF0 + 0x10 * (rdi))
> +#define                INFO_INPUT_SOF_IRQ              BIT(12)
> +
>  #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)  (0xF4 + 0x10 * (rdi))
>  #define CSID_CSI2_RDIN_IRQ_SET(rdi)    (0xF8 + 0x10 * (rdi))
>
> @@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable=
, u8 rdi)
> +{
> +       u32 val =3D 0;
> +
> +       if (enable)
> +               val =3D INFO_INPUT_SOF_IRQ;
> +
> +       writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +
> +       val =3D readl(csid->base + CSID_TOP_IRQ_MASK);
> +
> +       if (enable)
> +               val |=3D TOP_IRQ_RDI(rdi);
> +       else
> +               val &=3D ~TOP_IRQ_RDI(rdi);
> +
> +       writel(val, csid->base + CSID_TOP_IRQ_MASK);
> +}
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         u8 i;
> @@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       __csid_configure_rdi_irq(csid, enable, i);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
> @@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
>                         val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STA=
TUS(i));
>                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR=
(i));
>
> +                       if (val & INFO_INPUT_SOF_IRQ)
> +                               csid_sof_event(csid, i);
> +
>                         if (val & RUP_DONE_IRQ_STATUS)
>                                 /* clear the reg update bit */
>                                 csid_subdev_reg_update(csid, i, true);
>
> --
> 2.56.0
>
