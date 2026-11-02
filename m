Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793609956;
	b=fJXM+PlyvBzWiIBmWbz0T3lGgEJQggNDJtvDOAlKuFd4wvEEDKiq15f7fQk1uj3yENlL
	 4ZfCP/lnU1DGx+f5hyuxx4VLMxustwf0pVaoAT8taIFUK/XkVFskcRpiaJUvSpFL9lC8L
	 mh+hzXhu3ZMLMVw8PzIm5PzuZ8jq/LPKVPRSssuvHzNH9u/IXFdrhwrcBoCCaEUQ7k0zr
	 mUrpBW0EUiIrSPxkfsiAtM+4kgjB/UKYXAiyMLFhWqa7Cur7aoiq+7cY/X1IKeFwos3u4
	 hn6ED1IGI+c3CgRWg4bHFO50iYXlkrDQMlI9UrgP8Zj07PD68zfVn8wVYD7YhAfbf8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wH0pYginndFNXKmHWtZ9RkHg4TaTelF4VIgtZlMHbgE=;
	b=CYYkcLIevOJiOYNYawT3YIKlXZsu7DtjhSwTldq0Z7grynqE/gN0LhP3TTndVqWRo4si
	 wfqoiKpLK63l0b6GHh5DwUJ7sfIi308k9T0m3GtTaomp88RER8O6WNjkG3sjmBym4uWdC
	 FXgIBSzuT7KQX1dqFoKAZTNBlR8OA2KRsBbCrqkFc4Hn65GIuE9LmGzc16XZNQ3rLwnaP
	 p0eMcd+327CfSvVNLBfrXvPq1NKfbrdahZiImndR50K7h3Cig5PHAfobkLoUFPEiSv/2n
	 qPTbgCxIbJA9uNDwJN7NIvvBgwETvgko2hj2IsCYVcHgZuk1uJJJsIhmBt8mTHJqOtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sc9Xoyrj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kk52tOc3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C65606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43C65606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sc9Xoyrj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kk52tOc3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24DIdx2433742
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 08:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wH0pYginndFNXKmHWtZ9RkHg4TaTelF4VIgtZlMHbgE=; b=Sc9Xoyrjm/M2Hzci
	KWUdEyuJd+F5CrlengSQ0+5xWNpiH74flcMumwoJDyM96aSc+onN+U0LHlTDJo+w
	pVKahq9ZLo9nyfgPV3jGqlW3Hsj9zYMVHRGnU68bSdxTPLc1ZGj+QEBDXX+CgFMB
	tNDWOVteg/OatLrnIrq6Wjsi45ABRKt3juUpKl6KadxmQg1FB4h+gI6DPQdcMlRZ
	1JCT1sLrPAa3iSPJRJZ7fQRf9SsVseLdzhedxYq7SsVdccZGXLEyswP6BVHOUH+y
	TY2mEKJYMIvsUhgH8iTRHisbaZzwKLEJTLokoY82dyxgCfoX7QLAAjqIw0nCFcEx
	isi7cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka60ysp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:59:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so259305885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:59:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793609950; cv=none;
        d=google.com; s=arc-20260327;
        b=rH98x509IOw+fchHkyN0m8l2ryw9mOx9oyfvcwH2V3sDa3wqscy3I7A+J47vzLEdAS
         5o4GG00A8gNFROI3mMZvkW1aJYwXuy5PAa3vFFiQNMITHqQIVV4PZzzpv5lgwwEI5jeH
         cwdWmZgWxMMVF00GC8X9nyPY4KJmMXnspgMZO3dGn6GmZW2W3EcOzqvC1sHEn6/do2u3
         3/RQHhbkwojM/VYSJbi7WPfCw/PQ10JPeihVbqCv2AP6WyHF1CMawuXxYW89baI3bwRh
         +1Cb1nZ8J+9YFT5bS977169Ux1TOkK62a2rRlXwNxBxt8NpljXqE/Dhl/CRUjqMXHGHx
         3vkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wH0pYginndFNXKmHWtZ9RkHg4TaTelF4VIgtZlMHbgE=;
        fh=4UnJavCmbQBK/+X/95UrLswx4fhKwX1NachIK4tKVM8=;
        b=k6+X05ROZD9ooKeGYKc+JXRieh2hxQQH1YP8uedszPwhFns0ItUIMODObnsOvyV4N/
         8cph7OhVrGj3q1DaZ7fQ4juCeb1lL6txnLX5ksZlCcWK2RnKHIgLf7b8ouvEM0masGM8
         /4Wy4iZmMXa2hRbHRPCSACKNEEYwgWMrJhcul0qKkVEtlduw5iIZdsSr7+5M70gfqVsZ
         QRBfBpEQ5i8rRz9eXTS1D7KTbIS1LfC+18GZln6XNfGtT97ImCw42ja2nljKtqjTjlBe
         uIU2gvqE8g0T/rkUbiVJ3iCtHuQhCDFs+rlQZ4n+f/KpV2ourJ04bGD3dSLG6wXATqD5
         qNMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609950; x=1794214750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wH0pYginndFNXKmHWtZ9RkHg4TaTelF4VIgtZlMHbgE=;
        b=kk52tOc3BapLxezU4CtQuPsz+s1kr6x4Z+J0UjG237B6UGwmitkG6jC6C8Cw2/uZxz
         c8bKvMdltv8F+Zw4sqU4yKp9r1i7vbDLOQ2IhAUTIWee60Xgwxbo1S9b1Nr644RwC8Qo
         Rvm7QJLoFEzR8rYHScBLxKb5JaLqZLsxT1Lp/c//VpLCJ1jJYMGOuCXQyiPwdNIizISI
         y5r9Or+iJPzccsGY5Wy8ZHCjmY93EXHOLauCx0bhKNM6I0kFdS4DyU/6k97ESpYHJiJt
         68zhiwi6O9CWvNh5XcbxALAljfGgGwgR46kAanBVsu+icJW5YCYGpzc6r9EMHI0PEDS4
         b0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609950; x=1794214750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH0pYginndFNXKmHWtZ9RkHg4TaTelF4VIgtZlMHbgE=;
        b=mo6cuip7bD7G1fU+O4VbmCFyYCbNHs2/VoVJS0i920IIl00VoczBP4qrjxLodlAQea
         NiB/24k9VQie+xunDJkrYnLJJVc1sEyLH3/2rc+AleDyetAOyG2ZUFo5680arJUevVA6
         Oekj+S4NsSIkeyhyNLQmy19zHna/UrOXl+e7QhRUehiP0H/DU96zpOgv3KZOJ1EU+IFw
         Tb4n0ui4XbaiDipGu5vOlXC2WLOQyhcyarItjgfScEfU0M1WovlRI4q5x/t7TRfZT66O
         ctghm+RpmMgoXZxmBjLmbbOdmyPR4xdZmBVAxGNjNWVbju7NztaHBXDDaH1R0mek9GEm
         QWhg==
X-Forwarded-Encrypted: i=1; AKwUvBxsT70B67y8hkV9Yvd4fR61wQoMIw/fH3n4kEn2jhmg7osjcoOow0TSj2me2Ec0/icDHN1ly5MZyJ/Jyu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKgnqNzgKPkuIHDERglFQRNPTceKaKMHVQHFgJlGkPk9CEbfi9
	WoWhxFkowcKPFG4PmexNm2NhyDhMBJ4vngLIXoT9cdQDOaBVeWJ3f2Z+uxFX3q37kcgpRXLFvlH
	9AVxxcUsXMIcybw5u6s4vpgMsLnjgwaGbnfI4LiHHdzXMNm53n1AzA7FgOFJ90LhYIHJyBwYcA0
	OwZdgXhMWU/WSIT801OVwOTXiAYG6V/Yfe+ZW/AjB24g==
X-Gm-Gg: AYBFou3YKhHT5qLtElhXgwBYQTuOCPZmUUilugoRb/8S5BgxSkPXI9I1zGcIV4TMJcw
	a7XfY9eKphtiZ0IVtzIMTMKSK4iS/hdW3Mhd1nh+b55cA7OGE3umdZENmCJphHa9yKdjHAcLjcu
	vEPyo7NVWd5uBSJiFb6SBNqUd821qiKSZN5AktcSufzmw7SiNzaRpCRmyktBbRdt0ODOPLpHWuR
	yCvCPwkghXJdrC62bjwQvU7c4VHnBkqYMoW96oRVm7GDFI8KF6Wi4WSQyKQa4z+Xt8UNO3r5MM=
X-Received: by 2002:a05:620a:4153:b0:93e:f9ba:690f with SMTP id af79cd13be357-94421737147mr1533812785a.73.1793609950275;
        Mon, 02 Nov 2026 00:59:10 -0800 (PST)
X-Received: by 2002:a05:620a:4153:b0:93e:f9ba:690f with SMTP id
 af79cd13be357-94421737147mr1533810485a.73.1793609949729; Mon, 02 Nov 2026
 00:59:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102081920.50288-1-fangxy@xiaopeng.com>
In-Reply-To: <20261102081920.50288-1-fangxy@xiaopeng.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:58:58 +0100
X-Gm-Features: AclHuK-sllA9dS0XNIfV1bAcZUW7oqBp3VabvOVBggv578_nS6KaXfjT9KFUlYk
Message-ID: <CAFEp6-1JqRXuXQgaoCRDivHyu668d-5Sb-gY+rWbn1aEBqTV3w@mail.gmail.com>
Subject: Re: [PATCH] net: wwan: iosm: fix potential skb leak in MUX DL decode
To: Fang Xieyan <fangxy@xiaopeng.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        M Chetan Kumar <m.chetan.kumar@intel.com>,
        Guanglei Zhu <zhugl3@xiaopeng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: mjNeU2umMgEX-pfiPy1qVQ3gCiAD0rG-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfXx6/mtYPOEIKU
 NGLiGPQW2jFzSnVDGLu0QxH1IzaGyQ7OD2TyQadHM4Vv/9kufDKQ5XhMg6phf0af4BAnPESCjmr
 Nglcl0sSVrsbTCj00G6GwsEcss+bz3E=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae850e3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EgahoUkMAAAA:8 a=JYyk8ZF4ti7sTYY4iAsA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=D2SkTF70-_n5gOfERQdM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX5NN28Rk02YhQ
 RSdVNl0Jkk/8TTB5aZTp9jZzLXwIfQRldRukYGOajl5Q/a+1y+C3ZQoAZZsoEh9e3UEqgdA4v+Y
 /FVFcXqu5wGcnncWa7K5Li+KihwgliqTI0bF8bN9f4I0b7pXrYKVf6OAgb57IiRapD5qsjUP8OT
 4loLch7NMb2+sUCCHbjAwFiCXrCBTBa6j7q1JaeJSdM+K7nVk7Bo4kibobLPQIbarrxyFU/zg/D
 FDSdY10tDw/0FyCRfADnotn9Wa4+uYriVM0SdxDLpqMIyzYgw5Ew3cWPQr7pAS2SI+ZHPSgAvE/
 a/mFaha9saPq5Ro+bIiVSuVWFQKm0aP+ulsaRw9sa4QzzR1LQwVfNopyYetg6FPHbO66sFhf4Jt
 A+Wwu6EmSVmo1jk/oVWiiMdDYrCYQymDJvyYaHOhF5ro+e4J3wLWTCoTf3Qm1rwU2VTu5KQi1qe
 Itx52qEJJCosOmLCuLw==
X-Proofpoint-GUID: mjNeU2umMgEX-pfiPy1qVQ3gCiAD0rG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020035

Hi Fang,

On Mon, Nov 2, 2026 at 9:19=E2=80=AFAM Fang Xieyan <fangxy@xiaopeng.com> wr=
ote:
>
> ipc_mux_dl_decode() owns the received skb and frees it after
> decoding. However, the early return when skb->data is NULL
> bypasses the skb cleanup.
>
> Free the skb through ipc_pcie_kfree_skb() before returning
> to ensure that both the DMA mapping and skb are released.
>
> Fixes: 3670970dd8c6 ("net: iosm: shared memory IPC interface")
> Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>
> ---
>  drivers/net/wwan/iosm/iosm_ipc_mux_codec.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c b/drivers/net/wwa=
n/iosm/iosm_ipc_mux_codec.c
> index 0bbd41263cc2..61700688eac9 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
> @@ -693,8 +693,10 @@ void ipc_mux_dl_decode(struct iosm_mux *ipc_mux, str=
uct sk_buff *skb)
>  {
>         u32 signature;
>
> -       if (!skb->data)
> +       if (!skb->data) {

Can skb->data ever be NULL in the first place? This looks rather
unusual. If it can happen, please describe what leads to that
situation. Otherwise, the check should simply be removed.

> +               ipc_pcie_kfree_skb(ipc_mux->pcie, skb);
>                 return;
> +       }
>
>         /* Decode the MUX header type. */
>         signature =3D le32_to_cpup((__le32 *)skb->data);
> --
> 2.50.1
>
