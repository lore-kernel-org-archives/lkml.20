Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792491713;
	b=sz71jc5qI6BOXBf2Za2VCNICUegbAGctjP6znT0Q5HupMtieqlu8f4CkqBkKPsCRzwyZ
	 8hkhuSgC6Su502Sqg/8GpWmEP70W3jM7suyEXSs9e2s2H7APktRW8HEKx3AXAfJBg2uxp
	 hhzgl4YcpZkIRcqtVoRlXJEBhjsfX6PLOztKpIlp4OMjoQEgihXGh4DfJX2KsmnUJoKyj
	 hutB8gPwwQG1uM6GWmRecojg16nT/1NdbCOuZFB4SCBKUYiKv9QtWsrTJOHfx/cGNh8+h
	 D9bs7zG1F82etd7ewrM2XHx6KCc1c0wN3M/gaja8lNI9+xgwjAxn7jU0C6R91Y9oupA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zmzEU/pYlWp69Fnmfb5E7Xfs+qaL+26qFfmEOpd/OvA=;
	b=37D0qxiTBih6u3lx/BwqBftSmlPRBzQu0n5+GR4CWNxAPNuf/E7dFXojtb1ppmiA0GrA
	 /xAXEFHUaGFg1OARRbzBUe9Rd60pcTPTS5W63Y0ddfGdYTaSHSx9qXwBKS1s2U6E/QRIF
	 Wr+zgVL/dkz27tOGRnr4IfzcoU+u9gQvNvs0VFoh0Xo5vDiGHzxOGP9UtXr9N1a/ftcKH
	 R+oOZC57GCVCQdWaLzhz2kIxizHcEL9MU0LZ6rTwAKmkV3dP587nv9+sWexXY23rA0asl
	 FDqqr2AU1dLaNybKf7fsH/6bnTvdpOEoqYEM++t8j1xhs+zx5SPe1UGsYfqiJykQXug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Lh0j/ICX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EU4V8c7d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D30606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D30606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lh0j/ICX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EU4V8c7d
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8RdbV1254519
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmzEU/pYlWp69Fnmfb5E7Xfs+qaL+26qFfmEOpd/OvA=; b=Lh0j/ICXD9F9bypK
	pUpAeSGdmK8ensVnmGZogRd77GWqLFCHY2yGj8cB1NSyL4EjnnrNLUM8p0kDH7tu
	GTvF2SosRxf5P33qoBdOsgES+AgTE8BqJM6W9J5imYDBPaz+oAIC0k9v9GKo2+eC
	0TJFy0VoN93QfyFHTt1YGPQcqmvWPBOS5QByjRdvJKXlWXTuJwxW4b8ajh7qYOVm
	w+RgxZE7+aWAlbuiMtLnIxsGBdZvP6BP99ZAWLT5539fY3FezqJViTRHaZy+EVru
	z+YBWcc27GBKfTdwRIXvkvQHMdoIk/6vj3+BmjYw7AHua1EKjbXm0OFHYjNU+oEu
	fpCvPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5na18m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:21:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so370759085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792491711; cv=none;
        d=google.com; s=arc-20260327;
        b=b9zamw33Lk8jLQEn7U/rdm5jlQBud56s//9kJ41qSC/++VJvJnKY56E7ezku9XC0sw
         l7VPF3mogE+fLcjYCGdE8b5cF09KaWJ8LQ98PNLXAIW5KzDLwL12FtmflSknd7vUdrBh
         8HW15tmeI9VSdtlbRYRFYdqA+Zzfvyt/X6npAQ7LWb+SCYEbAwChf5hV9XkhgHkBglaz
         o4vFCEFaIKuUEZDjic/yetip8z6pR2BMtNcNDRm5lAeV/5oOz5q5f92v7vBZ20j31qv+
         KYC1RhKxABjMwpgNFr7yhsAK+N9dPkGh8ol/OyVO3EIfQ/wNTi0iKNNHpXtd95LLJnLs
         BJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zmzEU/pYlWp69Fnmfb5E7Xfs+qaL+26qFfmEOpd/OvA=;
        fh=VU6bMl86he0TjkW6zsOVDxGRW44vzeKSq1MqlhmK75c=;
        b=GCuxZIPlZkyxkcRXAk+L+xX8ZE+RYuJspg+nY+pTPamRdOc51GYw70jzbKkfniLNIO
         cTP5rj5mPmxvkrj3TY83iQkgcC18zrYPRQy69AI89u/18fZV430sRyaOYDThHO1CZcqB
         dSIYxrmXssF65dnIqgFLhBGAb47rbkvvHMnjyBI6Wx4NdVRXXm8ZJeNK6TgwjSaQ6hv4
         TNe/Jbept/BwfHXLRdsjcwLMFfDBaa3Vo6C1nPfH/c4quLBuPM7As4MhHtu7ivLBVZzY
         +4cAHeouYaHq3IbwCjoEN082wNnMkUWxp0veIXwXZEQg0ON+jCeIJ8v+zg1de/GOcBXq
         5p+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491711; x=1793096511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zmzEU/pYlWp69Fnmfb5E7Xfs+qaL+26qFfmEOpd/OvA=;
        b=EU4V8c7dwPEcZ51zzG9IvdAHykYk0uA0MUUMiLLbMkTzZ6o+INI2aUc4iSeOj8BjHc
         yuIOYr1G+ge6AAQheGgRH5q6LqCc+FLqBFIs631p4MfDBYtNZRMJlPAvUzTYseFBUInh
         zw1rFj5moKxwxugWvU1/gIlQOSrD9QNz+7/EyNLq+PVCkuPBU0Avk0E0ACstqQnf7vmj
         rvkOwhrQFMpSV/THubJ+TcqRVbZXr+t/1+Z98r/NKzlgtzfnnPCKd0ITluZZDyIk1aVg
         pM+7FhXqBXyzFgjbCwlM1QH3hx1ubANYU8UgtpGSk2be0HKSwyR77SVtu81iPMNA5af0
         7Q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491711; x=1793096511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmzEU/pYlWp69Fnmfb5E7Xfs+qaL+26qFfmEOpd/OvA=;
        b=eEA6AQEPny7wDjWznxR4Q86mtAloBEjVcKAUyyeI1MgPitunZ2EpX/qKFa8ZT3ZeGz
         V7+fV+P65eKG8t9fOHce2V8MbqvW3ExtaB26s3ATINQcBDmR3KGeRAy0lv3ceiNYJr7l
         dJJc0Ae7QvjIsI6NFWtBPSrWagn6AAkf6bH7Fg3iZVfXSKTr9HwhJfOzIG1VuhDovt48
         eMB5DctdrRQtQD3+01aVzrrcKRHHP3qFGkaImzUcw8X2ZmXWBCOdNdi9BIjYIPKmb7g0
         K2GruJ2Uc9uC2/xBljR/ktQvGMw5Hdvx1H7GUzxau1p4SS+ytHH0WGCof2Gj5w6zhRFi
         lkbA==
X-Forwarded-Encrypted: i=1; AKwUvBw0PhG0mQOUNado5y0W+fK1I2ksDemePlN4qnUBipXDRSljhfkF3W5BEMQafSc3W3rD9WeubA3SRu83I0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOiKo7HayXVQgoRtvSldz3ojYT9pnJGIyGXJ9tYee7l4VV+iYp
	aD9SFtyFfo393LoSNsce/c86FF1Kaz4l2X/Q4JGbRVtdYpRkIMnhHbdYRgFcRKZGR+sYTqymcwg
	UoOx5dPWE1HlFhqxy91gwI8lV7fLUmBgN2YJOLF8SvnM7KmkYM4zD1g9NPotG3lIRiLbJNq3FZg
	LCS2FUdwwWxHPglEAizvLSpgm4c5b0CRUzIa/7IcWb0w==
X-Gm-Gg: AYBFou3jaySioIaVnCI4dDmhDTPWJpDQdVrCTJbO/8QoYTJonItBntkR3gD/Yn1T4uV
	zyPpH2w9SmJ/152DST1aK863P8yI/EWrP5bJi9A91mtN75XSoO7xbRylYNqASlJex3WW62NbUSR
	a1xFTPEDSQhepLVFN8AKOty8b0Pn884MuIrUt1TYnvefgB7Cua5XgBS6hiNFJz39eMNvPWqoatF
	ISVKftRMdLMpHMPhRngOb8Ov26ChzEii1OTzGNsdp/Y17qKHICDUZZ1I7HyzdOjMU09+2FGSEE=
X-Received: by 2002:a05:620a:2948:b0:93f:228c:52fc with SMTP id af79cd13be357-93f29d7b1admr1754525285a.58.1792491711350;
        Tue, 20 Oct 2026 03:21:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93f:228c:52fc with SMTP id
 af79cd13be357-93f29d7b1admr1754521585a.58.1792491710779; Tue, 20 Oct 2026
 03:21:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020101150.16967-1-liuc63@xiaopeng.com>
In-Reply-To: <20261020101150.16967-1-liuc63@xiaopeng.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:21:39 +0200
X-Gm-Features: AclHuK_litW1CsHp-p-GfN5m3qzJOLKXldulgV3ixEju9BrCrj64dCZjrQIAVEk
Message-ID: <CAFEp6-341f_TjYw_rz75h3N9Ph56N05MowosmKJh-UobS+SdTg@mail.gmail.com>
Subject: Re: [PATCH] net: wwan: iosm: fix NULL skb deref in ul_td_process
To: liuc63 <liuc63@xiaopeng.com>
Cc: M Chetan Kumar <m.chetan.kumar@intel.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Guanglei Zhu <zhugl3@xiaopeng.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: BtbXfpAhLtOBIE0l2UdCzw2ET5aIocIZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MSBTYWx0ZWRfXytShrAyuSqDl
 0AR7rV+p3/cJYW8p+B2mCPq1cpXJ/PQ8rVwkeXZQEwDOuLNDCOVDK+e4GFQCremOde3fxFdsi07
 YQR+/U8E9h4I5cfv1iuHONa5C/mGYW3eKtVPGGKhpWcxZttr0LpTK2A6JKtfrXlZkHvpIzjZcuM
 XkFyBq+p/+xTxpvFFmiJZ41wJ8fr9INyE1DLrzg8tt0tCnaF3YgbYwVAXWuLa24c8kLYXU78QYo
 ys/AYdjyoMYtEV93L13AlShgMZ9fp4sOp3cOWPrARKd3DlMYcE8UEkg0NOAxZOhQNDoeL0rPgU4
 zd6SXE1Wo+aD2DkjdRd4fxLqL4W1EEtRCCy8Z3I3EJ2NF6x8a+pHlMbI6QLkm/cBs0S/VNTSrCz
 PkhAnBOfw/G3n7P5DrcTZjmsGBvSdONUGVJnMGQJcQINGbzZrSTCKuxSn+EKQn+SMd7ubosvMqu
 e0Rxzgbqv2czU+vYbZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MSBTYWx0ZWRfXw1QZhA9+s4gT
 msxJ7aludMYFwZF/RwpeMp/MWgS2amC/fEeKu2npMn8USbQYvOgVKQ3HocTW4SewyPG+aK1ETzL
 ndeb/iJg+jXxVk2BR9yPvBXUj7gDFMA=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad740c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EgahoUkMAAAA:8 a=VwQbUJbxAAAA:8
 a=5kY9qsDIvHh0I-ch4TEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=D2SkTF70-_n5gOfERQdM:22
X-Proofpoint-GUID: BtbXfpAhLtOBIE0l2UdCzw2ET5aIocIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200041

On Tue, Oct 20, 2026 at 12:11=E2=80=AFPM liuc63 <liuc63@xiaopeng.com> wrote=
:
>
> From: Liu Chao <liuc63@xiaopeng.com>
>
> ipc_protocol_ul_td_process() fetches the skb for the current tail
> entry and then dereferences IPC_CB(skb) when comparing the TD buffer
> address against the skb DMA mapping. If the skb slot is NULL (e.g.
> the entry was never populated or was already consumed), this results
> in a NULL pointer dereference.
>
> Validate skb before dereferencing it, mirroring the existing check on
> p_td->buffer.address. Return NULL and log the error when the skb is
> missing so the caller can handle the malformed descriptor.
>
> Fixes: 64516f633bfd ("net: iosm: protocol operations")
> Cc: stable@vger.kernel.org
> Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
> ---
>  drivers/net/wwan/iosm/iosm_ipc_protocol_ops.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_protocol_ops.c b/drivers/net/=
wwan/iosm/iosm_ipc_protocol_ops.c
> index f2f86f41fd10..dee2e6607f77 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_protocol_ops.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_protocol_ops.c
> @@ -302,6 +302,11 @@ struct sk_buff *ipc_protocol_ul_td_process(struct io=
sm_protocol *ipc_protocol,
>         if (pipe->old_tail >=3D pipe->nr_of_entries)
>                 pipe->old_tail =3D 0;
>
> +       if (!skb) {
> +               dev_err(ipc_protocol->dev, "skb is null");
> +               return NULL;

Look like the caller(s) already check/report for null skb, so instead
of adding another print here, maybe it would be simpler to check for
skb in the condition where IPC_CB(skb) is used:
`if (skb && p_td->buffer.address !=3D IPC_CB(skb)->mapping)`

> +
>         if (!p_td->buffer.address) {
>                 dev_err(ipc_protocol->dev, "Td buffer address is NULL");
>                 return NULL;
> --
> 2.50.1
>
