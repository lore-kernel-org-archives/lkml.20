Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B5F485501
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586703; cv=pass; b=GpYao3V69PRQS/hWcPu5+C7o6b5+0fbbqOCLqyVa6p+1MemGn3KEn7eCmVKA1S5aM0FonBgfJ7b2+qyORok/uwbU5KX0q+e5C2u9jsuTJV4W8ISn4SW9KeAaAu0F1lX7fP32rO/CdxVXNYRaMQki7m//Pm21N6bG0Ei+NrI0UJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586703; c=relaxed/simple;
	bh=KTENyYqQEJ1QJsUU6WyAiz6HgJhYCr6u0cGxg5uGf9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWN9pspsMritEY0HRlIYWdzHKDbxAxfmHRj1s8RYFhYH7qOAemshWVoqaB/nB/fUfOXsocgZc2Wz1dbodLIccco7uTH6Kmtr2qKiwNYgV265R+dOQWgZzoxJBL6keE+uhds5zJLXbRpsTGB8r+p0E2C7ik3SpiWZi3bAC60jPes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocW9bnWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nixc8U/q; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocW9bnWC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nixc8U/q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S80LAV1263138
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=; b=ocW9bnWCtyfDOLpW
	24RrfcaBN2VSok9itSj+FdB/z1HwJYlh8mkkpzn+5p7KHR4dhU/3lspZwD4ofGpd
	bS4OkzdKl8YeJClO77+s2S1jlyVlR5kAVdWG1PRTHTtl8mrX+m35hjUXuJ6lfikd
	D7h9j6hbSunh8SQhdC708muRSNWCy9HHbQGAPqvh4owe3D7BzSPzlD7DMOqoM4gW
	8lDOlS+jWYU0O2672SLTPLUUNLfFXGG7F0BxDyo2Dfd/lKAIFyqWS8iEJhYHhP6e
	P5BuJBGbMApRNMWIo2dmVhlMHr/dPQNgYMFXZ/DGSje+3M/bahkWKArFZPwfqFkQ
	roBfNw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526ngnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:11:40 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8a7d69f4204so37541677b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790586700; cv=none;
        d=google.com; s=arc-20260327;
        b=O1cVvKZIkrm++qY8gRag3wChGihPWEBgQ+Mwqpwur9O2zFzSZAdLV16wPh7iqjSks9
         6Z8rHzN89otz+y31YsPRbXVxhdJqSPrHoqtL7L/cR4+M72fEo2/PT5p/W74ToYarr7aJ
         s6hC/p+YbKFPCuk/XoEMOI4qAFhkC7YccPHbCyKKOg+5i5JP5zgKjYvV/6lJdiUm0umx
         ho52hPQlwUmKAUr5CwXukm4TrE5+WsgHiSunOT//FNd8srx/jJT1j6T+T7RQUauCVOvs
         KAhPYTihKrCOVJW/vyWRTViHC+J+SIVuMtXXLsf2XXiQXFkZBF5Y0OAK7P/6kxA8BEIT
         n9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=;
        fh=PZJfWsMy1QHFQ6g+Vq+EJHAwbe5zFmDQH+mvyr+h6kI=;
        b=C5/4uOF4oWDv0dGKH2tgs4QyRyyk5AJMPLb7SEzvlkb8Ioxk2hYJD/503AZVhmFDyf
         4mBDQmYVKmXLM0yXlwySAd4APPBMKS7EqRgA6DW5waJtZ6ORQSPzezxHiWyQWCICC/U5
         tavmJmAlN2VQiE76qVApEmHBiYpahVv5+nw9uB5aoFmlYenJOguAyKFqfEnrLT0c78/B
         4N2QcwFXLMygz0x9Wk93dQoqjp6SJscW3czkZzB7uY0/WsItyngzk/i4091Vx6uBIpWG
         pU1LFDlGvTKqGgv8QVRguapgqRk3mk9B37hUZ4B5FRxqTuoJuRaPMJOb58sRQP87BXIy
         Fx+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790586700; x=1791191500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=;
        b=Nixc8U/qhB6n9qnty0EC6TNCzgc5b/Ls5dE82vee1i53LODYVX5+y4m0kq3p5Jr25c
         vYrJA6KLbcyLMB5RzjenpJiZNQ/p/3r3JFPmYur3U2LgicVdBTYrz+Buh9V9EUNGAb0e
         IuNGtU0DCaY+fSd48c3rWkJYQKFbZE9qSBoMEf6T/3QdUpzA2Yaptb+9XPYRJSWY2Lz6
         OWCoIaW601wzbor2krIBiRu9wy4Ipt5F9/cqtf9IUr4XeA4zeH4W8JthUXrj/mlz793x
         v5lum27xsDNCEugUmXhI+VZlvQC4CFJYhqip/4hI41LDA1ebt0bM8013r+pc8tyTvStW
         HTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586700; x=1791191500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=;
        b=ni8gf8lxSjrNzBcYZeW1yRfSB6xutBb5C03Qlc3z4JJE0zmunOv6LBeXa5Y4sqWA8o
         xmdq0lVLxHLJmvN9XvjrWwJvsN3jPWiWzW8mjquAxUwsqa6jDW5QSOk6kBIS8HbzpoJK
         ulO2JvdNgohGeTcnB1at2+0J6SoxzcVbEB144hJlIZXL4dAVHSw7QUi3PE4Al1XhknJV
         WEz7KVnTJoE52VA+A4eqqEI5fHWmJnDu6tOCU/9uQAEriGIrmla2yEH94y/xBtMDxCyQ
         wNbChyVt9WCiNRxLYlF0LFoUPL2ryGJ+MnAWDtNLUyGNvjfJCg3OUIwOrfLN/XTIG5mx
         JEYw==
X-Forwarded-Encrypted: i=1; AKwUvBykwzlBwN6n38T/zYy4TbPDRgSZ7xW4E635iKc0/KxOu5vIHNBa68hAf8aB1HVh8UNX9a7CHulMxdotQaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiB8vV61WfcwhZp+XNucMUvLEji2DbgtlLMk0Zxz9veqTou3Nh
	ZcsTRSClF0lo7FeYaPNYjM3ofHM9TIjdOYPvO4Owsr9tLh8pRhql7zdcvbGG7Y+Pc4LSPGA/qId
	uPpOIodPrIfiz+hCdFPaIidh6hoJK/MSMi2XazHYh4gaIpxHYTSRFwSdhRSUSx1abibBdCxJ6xU
	+29Ojz2MWSD5QzUStdJpX7kjZR/Uy1bP253NpfKomYwg==
X-Gm-Gg: AYBFou2+0LQw1/I6XkjbBQ77ch7RcY1ZUHVMqz6a8uF5ODjpdUS74ASjhPKMuCvPk90
	bYG3G+7WTfCH27mSjOSdIAaMj/lnc3i5cn0FM/hOYn5OkOtzI6LgYdkSNpuYnatRYLDKDn3hnVw
	27uT3TmROHvlslvv8zJaXakXYlzDT8bA7xFZBwiRZ2G8ZyP/HFy1xOqas5Njc=
X-Received: by 2002:a05:690c:6610:b0:884:c7df:fd25 with SMTP id 00721157ae682-8a64b527551mr64705627b3.17.1790586700408;
        Mon, 28 Sep 2026 02:11:40 -0700 (PDT)
X-Received: by 2002:a05:690c:6610:b0:884:c7df:fd25 with SMTP id
 00721157ae682-8a64b527551mr64705327b3.17.1790586699978; Mon, 28 Sep 2026
 02:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-2-d5b6f056568e@oss.qualcomm.com> <arOcDLy_ESS6Qwcs@sirena.co.uk>
In-Reply-To: <arOcDLy_ESS6Qwcs@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:41:28 +0530
X-Gm-Features: AclHuK9E6ayaYE_Y95ZKtkfHPWfcu5v3kwH1jhnosx1aL68qwy7Agii-WL47rOs
Message-ID: <CAC-tS8AbBcN98ceaLFJaAt_+d6T0C5dpSSkRz_9yJv64KhE3kQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] ASoC: qcom: Add QAIF shared data structures and
 variant interface
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6aba2f4c cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=_qd6ERi7e6bvJ_0A4_YA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: -NIstSlfWXkw8KsPDPkAQ-2S3uRt1NiP
X-Proofpoint-ORIG-GUID: -NIstSlfWXkw8KsPDPkAQ-2S3uRt1NiP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfX8QJz7TUIBCwI
 JAfTljKhycpZGLDTek8lvRKACYyrv+Fx9K6TqArURORs5D/cYUbte+MMa/b5JeO7DdgRa27LKwN
 I1VzQqjvICXE4mO92xBQwYMbPVztRHr9/bdj88696ocwCeXhSKBASocH0wWFM5y4YX0CsCHey5U
 zxumPMS7ht+G5cioMxTVl61Bvr0F7P/mMYUmraJ4qEKiCThbcm5lSxKpAJFp/aCKypOq90XravJ
 wgedR8VBH3LuZJ3UZHYIxMEL9ioG5aGN4FX3OW7xccBOTyfQ2dQdtpI3diFbnVnYb/uLQ7zg3ob
 EWcF8xYYcxRF+4qXEnsyrvJNdHOY91ngwSNxIjMx9sB2gRGo7vxuHNVBSmp0hxvTRKpwh2VxFLt
 DDFLe2trGvGeuLmJuskunIh8GXt6k8vobQIDNN4Z818ZZ2BOWmqeAymwv4xN4lSx/Ql6mMiPULK
 DB2QazMDH0x8D5XL0xQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfX2nEZywln+mtX
 uM7Ws9oC00zJQMGo7qKyAgb8Nx24XHh+i07eZsuMS/lfjWPrbVTaGDQl3GwietZPYysu+KFjTTA
 ff9mO1hWNX3rPurVH0GEbiPpwa7A9Po=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280036

On Wed, Sep 23, 2026 at 3:00=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Sep 23, 2026 at 12:18:22PM +0530, Harendra Gautam wrote:
> > Add qaif.h to hold common definitions shared by the QAIF CPU DAI and PC=
M
> > platform drivers.
>
> > +struct qaif_variant {
> > +     u32 rd_len;
> > +     u32 wr_len;
>
> Does anything use these?
Thanks for pointing it out, these dead fields were overlooked. Will
drop both in the next version.
-Harendra
