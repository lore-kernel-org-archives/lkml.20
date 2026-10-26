Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793008873;
	b=AFw/2cH4r7mg3eePtp/rOncYl91UiIxZ7ztt0u2K3FZa1dhxvA7NHSqkJ/aOUSSX18om
	 spXLnrVkXOYPBfZDqKdP8peXPWcSCGZef5BjEhek394LZlr6DHhc2AJZOcQV35ovsKkZ4
	 A7Ikfsq+Va51V80xBonUlektHVJ6T5ynuU8euTBiprV4K0ddV28HCEdqXOMED0ESQ5uZL
	 CuwXKFpz7cVm/eMjQD5/xs5GCeA7hu8IUPOUweJHfEr8deNZd+knNlsXPraekzbgIRzwq
	 YS3aDp6E80oOD7ywdH/rxmtcykW2sKR8rLnHrKpky6+uUkyK/QRGl4wseK9nQfwDAlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OI/dNtcGZjhk+KLGnWOyJKLydwYsn94SsKin7b9OGlw=;
	b=hus+qIYSuF12+I0n37lvZDUq+Zt9CE+PK1TBsSi68IPvEBiKpZVeP4CAoh5ioEXU705G
	 qmyaviplUrEJluw9WwbODOZcR3+YcBnoZFCvjhYRTL0tZAeSeAPS8RQwA6gKe2FVZy7Z0
	 CfRCQ0+7qJccJfcy7QxQ+Vg8rRsxnSb4eODv5pSxehn/kSVdrMbDMb25xrvU2SPSzolAh
	 wpciTF3wYrmrEy82GxkNdiR7dB/JtyW+fvfH6d2CxdUuk318lxpOpSS+k4LNkZMG95gv8
	 6OfQimt/kyl1SwMvNPugwzmRW3UH/vh2ffPICY24MLmXz44cH22H2qCEz4x4MsESS4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0IcSfKU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WSxmozk3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2B4606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D2B4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0IcSfKU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WSxmozk3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q8xEpr1911428
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OI/dNtcGZjhk+KLGnWOyJKLydwYsn94SsKin7b9OGlw=; b=o0IcSfKU9ohURjzk
	V9O5XnWwQCLwtYhdFJfBIVuXHU0ktXCLDxYfzf6eAU+7P163oSXGoWKsRYsvhzPu
	+TTb4Rk+wYFyaAJhwollKrHoBUwx6GIQKDT9IBIYGVlSnepAft1ITttgWCKyXJWY
	wNPB1soeggDDsYxioINCQkc9dlm+SHLXldCsB7vWP9vX2od2hLX7pFExxUpbI2VB
	bRz1uxs3F3J/O0nPTBZOwC+/fmATFcpew2n/9iOR2tLfy34L88JKXuwQFvVT5Nhc
	2DW0E+IuW6d0E7NkZ7HrE2fKNN9giMRFE0z5IFD6WHKrlYNUY2x/waJ+hP6uZqBW
	a8DdVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u607e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:01:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so352853885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793008870; cv=none;
        d=google.com; s=arc-20260327;
        b=pHQxEw1qr8hD32Ymhe+svu3VvI4Yh5gc7BMbuFfENXuBbLaNycnE/lVdxSSkmZSfx2
         ez1v9OMCTyXvzoc/Ghjyis88FcBjpY3EvuTXRsPjmsGqUgyWFBt9af4eKm8vxpvJ7YkA
         XU+Rur+5J6MzlszacFO/Owd4yNoSZtxszNTZympLzUXwrecRj5C/xHAYV2Op9MrnBs05
         G6othIDivINvIJJszQqxVd7rr5OtHWKAVts7C4PEnWYsjnNy7smaYfzEV6bzl7qRT2tR
         kTovGaxsRwYQ2kWIbMs1wrgZXIPxNvKzo16cJ5u0e9wITfZc7qRnTvExznk5/AyNH8cm
         KcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OI/dNtcGZjhk+KLGnWOyJKLydwYsn94SsKin7b9OGlw=;
        fh=GkNMnYwJXxn5Rf5QNZc4aVCi95FXG4hglmv7Y22vkrQ=;
        b=Mw8NC08b18mPLmkCBKB4Q3YxTZwSPsN5DDGBKNbVexmYd+OQRFmuFSLKmKw7oiRchs
         FPvheUgR6VdfPxCdnqrRn5dLzZmfqZfa6IiGFoNf2mIDE4WV4+ki6bwNILNvyt2jYQKM
         du68mCxqJWPjDDdOnnjqPqn35rqdWiIbHrYgpXcPXx4aW/4yY6P/ApYJM4F9o+DNjpJ0
         4giO2xaN6LZZNu6T+hmQfZih7TyFI3Q6PLrjt7+2LekaqtGjkdJy8DhXNOXAQqA1cxx3
         xXUcuZLn3I1Bq086vrdZPmfwTnMhKJ84QXqXzFM0OqG/4su5ZvWYlzq6t4yVYrZtozrl
         OutQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008870; x=1793613670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OI/dNtcGZjhk+KLGnWOyJKLydwYsn94SsKin7b9OGlw=;
        b=WSxmozk3CaU43LBerKWLRPGKK7b2PwKTytg079IPlouVSxIkwXsVGeOQmKiwHibwsp
         R0b2jMXPRMPGA9NN//HC0fDLsWwV5wlClsZUyVDdaHP1MqxG6SSOl5dGDz0f0SqM+lgJ
         tvL6iSmhuz566UwLnN/aejjYU3/WsIgJ9PlzsRoulvPePYaJbKES63bOIuFAgDNjEFMv
         LctzrOyLKk9KUw+Q9jrBKFvf96a7tN13q205EphijiUykzvnerzqTgwhvNvk/Lyrc+z7
         N3Vqkbdkzkzfv4scxMHLJvVMz5bh5rIZe16paxRC2EDK+6WRLyoUbmScuEzAl9Gt7C6K
         wLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008870; x=1793613670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OI/dNtcGZjhk+KLGnWOyJKLydwYsn94SsKin7b9OGlw=;
        b=fZiHkuPmy4oF46lFthTt/RZzsRrEr/pc1/lCN+OM4RnS//Verkc0vojyWH5fAXQt2M
         JeDZXFW8RjEFjAQfu4djKtTlidRBwjZQ2Q+dQp0LSV/I0hnE8hwP+0HQMDVd0pOPwcRD
         K3HfzugJSalgXvvTOKjSeqN+BZkSpL6cz2wGYsmSHFHliFu8uZQ5GsQ0IkGiafp65MSM
         TGLN7fkholtdPLQJm5wC87/0c/sqtOD11xsPeckm4PpeLVUlD8g9n50utYuqeX3Nsgq8
         LVsQNY+WwLcCPI+R+XD9OnGw/TQ9Fkj3DItjJdO12ig4KjUSCpIVgjjEhN1ho2fAsCoE
         1zxw==
X-Forwarded-Encrypted: i=1; AKwUvByDdVdfFnui4odZBppmxmLklPK39Ob/gaH9rAuMNcfEu8ez8s/tpeYkhi7YZnip5voeKSYee5QFc4EcRDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkWpNnIOdaQ1A0jyrHPNXTain59bJXO0cc955HbhNz24PW1yZn
	z9z9j1255P973Tvvb77DhdAV81tDgSslCNfT+MKPGtwEFvl2SFiUSnEqU8jXmT+6zW42yQDouKZ
	pEAJk1D7hs/FTufGUm/S4v3KWIWTFuSg5R0cAeeCgkG9Gz3ol82hmYy8n8fyKp912rBjS554jbY
	JGYBdt/OFiVuh93fVkoikhaggCV+lpLVRjhpsnfsbOAA==
X-Gm-Gg: AYBFou2/TTYUD9GP7jbPhk2AuCESedtxiQitF673rOllMI92OOt95JgIY0vS77HoTk5
	jzcYJw8VE/Ez8HsUOQSmL/nVZmK1QatVpFgb4t9Iklmf5eWAhzDPqGfEa37VffjxvIZgTRJwUOx
	ATkuR7E7wqCyzcvu4vyJOpkzFqCzKnVw3pF724b4pn400HlX3sJqdmq4W8VnjfUt1mRpBYltFtK
	VlP318LcnDG9pruTI4vbJZrIYASGrZHalQWm1ip9VHi0FXK/5IqZB6fYSPk9BnRyX855wtO4/Rq
	Mae8N4rUSXtN/MfKqumvvYsK+g7+
X-Received: by 2002:a05:620a:4554:b0:93f:3795:e8ca with SMTP id af79cd13be357-940ef8af8eamr905239885a.21.1793008870163;
        Mon, 26 Oct 2026 03:01:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4554:b0:93f:3795:e8ca with SMTP id
 af79cd13be357-940ef8af8eamr905231685a.21.1793008869521; Mon, 26 Oct 2026
 03:01:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com> <20261024-kaanapali-camss-v22-9-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-9-7da3ea49c8a1@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:00:57 +0100
X-Gm-Features: AclHuK-MjFDtNrzIAF2I-LhrglSAW78oQO6yvwYpJ1LYe3TenKq3-aTE9h7hk1k
Message-ID: <CAFEp6-2a9-P=eN-A3h_aWY=pbScKnwwn6me59S0oJipD4gLcmw@mail.gmail.com>
Subject: Re: [PATCH v22 09/14] media: qcom: camss: vfe: Add support for VFE 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: nJI9zW0yN2WmO1kZDBKmCxJwd0bCtJfG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX713X/XQ+pKDY
 jGhXE8USTnpISLHWBnM+4Up6gH4gFSoXOd5tSDs/47JsTswZwcO44GrYSWjX3s2f+SgXxN9Id+o
 vzc3IIL55oTzPGTmdEZiQR9nzAosOUdyBlgDe+AXNK+yj0dGixuCMwSUbW/uKowRYbbNQMQe+Jr
 0Rek505vrMFtJYu6kjfCBstlzWfJplQmPLKJLGpBMPCC80P6aetf9Z8hqKOfXWI6kczOFYg8X2F
 C2qOmT9DemtRZl0/d7Uc6IOT5gEs9tn5iJaE1YW/Pf77GVImAHVIjW6lZscBRh8plyVZFkF0Bah
 Ukh5axkFQohJTicVGPo6wfbLkB3n6OggXFYHaYcETMPmIcwPHen8XyfegXZAravm/QgzZuUl/9I
 RScu1eMGSg52HOnKDYF0V65nwPDTQ5fueGBq2dmPFt8NtO5NsN6Z5SZ4G1i72EqIWu8Pyga0Gcj
 jCo3kLn+zxu0IZ1kaCA==
X-Proofpoint-ORIG-GUID: nJI9zW0yN2WmO1kZDBKmCxJwd0bCtJfG
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf24e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=RwwU9dtkUOg5zNwaluQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX2ApHk3RuwG9f
 3HqI2dpKfv8FiqNyJD9abGdewQwtgSCje4Ic8fjpkUdDQd5gxzLJs1Qe0yMVm97dQS7nfR/0ybl
 7NAVzX0FSAwLL17QAKTqfMD26l1sIe0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
>
> In the Kaanapali camera subsystem, the front-end blocks are referred to
> as TFEs (Thin Front Ends). This driver continues to use the VFE naming
> in some places to preserve consistency with the existing code and avoid
> unnecessary renaming. Support is currently limited to three output lines,
> matching the constraints of the CAMSS framework.
>
> Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
> CSID configuration has completed. In addition, the number of AUP_UPDATE
> requests must match the number of buffers queued to the write master
> while it is being enabled.
>
> Although real-time TFE traffic is routed through RT_CAMNOC, both
> camnoc_rt_axi and camnoc_nrt_axi clocks must be enabled. This ensures
> that the PDX_NOC, which sits downstream of both RT and NRT NOCs, exits
> reset in a fully idle state.
>
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/Makefile         |   1 +
>  drivers/media/platform/qcom/camss/camss-vfe-1080.c | 213 +++++++++++++++=
++++++
>  drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>  drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
>  drivers/media/platform/qcom/camss/camss.c          | 148 ++++++++++++++
>  5 files changed, 365 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/p=
latform/qcom/camss/Makefile
> index 218ba3a95939..42a14e8fe1b7 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -26,6 +26,7 @@ qcom-camss-objs +=3D \
>                 camss-vfe-340.o \
>                 camss-vfe-480.o \
>                 camss-vfe-680.o \
> +               camss-vfe-1080.o \
>                 camss-vfe-gen1.o \
>                 camss-vfe-gen3.o \
>                 camss-vfe-vbif.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers=
/media/platform/qcom/camss/camss-vfe-1080.c
> new file mode 100644
> index 000000000000..68798f13fbea
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-vfe-1080.c
> + *
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 1080
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +/* VFE-1080 Bus Register Base Addresses */
> +#define BUS_REG_BASE                           (vfe_is_lite(vfe) ? 0x800=
 : 0x1000)
> +
> +#define VFE_BUS_WM_CGC_OVERRIDE                        (BUS_REG_BASE + 0=
x08)
> +#define                WM_CGC_OVERRIDE_ALL                     (0x7FFFFF=
F)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL               (BUS_REG_BASE + 0x128)
> +
> +#define VFE_BUS_WM_CFG(n)                      (BUS_REG_BASE + 0x500 + (=
n) * 0x100)
> +#define                WM_CFG_EN                               BIT(0)
> +#define                WM_VIR_FRM_EN                           BIT(1)
> +#define                WM_CFG_MODE                             BIT(16)
> +#define VFE_BUS_WM_IMAGE_ADDR(n)               (BUS_REG_BASE + 0x504 + (=
n) * 0x100)
> +#define VFE_BUS_WM_FRAME_INCR(n)               (BUS_REG_BASE + 0x508 + (=
n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_CFG_0(n)              (BUS_REG_BASE + 0x50C + (=
n) * 0x100)
> +#define                WM_IMAGE_CFG_0_DEFAULT_WIDTH            (0xFFFF)
> +#define VFE_BUS_WM_IMAGE_CFG_2(n)              (BUS_REG_BASE + 0x514 + (=
n) * 0x100)
> +#define                WM_IMAGE_CFG_2_DEFAULT_STRIDE           (0xFFFF)
> +#define VFE_BUS_WM_PACKER_CFG(n)               (BUS_REG_BASE + 0x518 + (=
n) * 0x100)
> +
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)     (BUS_REG_BASE + 0x530 + (=
n) * 0x100)
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)    (BUS_REG_BASE + 0x534 + (=
n) * 0x100)
> +
> +/* VFE lite has no such registers */
> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)         (BUS_REG_BASE + 0x538 + (=
n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)                (BUS_REG_BASE + 0=
x53C + (n) * 0x100)
> +
> +#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)         (BUS_REG_BASE + 0x560 + (=
n) * 0x100)
> +#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)  (BUS_REG_BASE + 0x564 + (=
n) * 0x100)
> +
> +/*
> + * IFE write master client IDs
> + *
> + * VIDEO_FULL                  0
> + * VIDEO_DC4_Y                 1
> + * VIDEO_DC4_C                 2
> + * VIDEO_DC16_Y                        3
> + * VIDEO_DC16_C                        4
> + * DISPLAY_DS2_Y               5
> + * DISPLAY_DS2_C               6
> + * FD_Y                                7
> + * FD_C                                8
> + * PIXEL_RAW                   9
> + * STATS_AEC_BG                        10
> + * STATS_AEC_BHIST             11
> + * STATS_TINTLESS_BG           12
> + * STATS_AWB_BG                        13
> + * STATS_AWB_BFW               14
> + * STATS_AF_BHIST              15
> + * STATS_ALSC_BG               16
> + * STATS_FLICKER_BAYERRS       17
> + * STATS_TMC_BHIST             18
> + * PDAF_0                      19
> + * PDAF_1                      20
> + * PDAF_2                      21
> + * PDAF_3                      22
> + * RDI0                                23
> + * RDI1                                24
> + * RDI2                                25
> + * RDI3                                26
> + * RDI4                                27
> + *
> + * IFE Lite write master client IDs
> + *
> + * RDI0                        0
> + * RDI1                        1
> + * RDI2                        2
> + * RDI3                        3
> + * GAMMA               4
> + * STATES_BE           5
> + */
> +#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> +
> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line =
*line)
> +{
> +       struct v4l2_pix_format_mplane *pix =3D
> +               &line->video_out.active_fmt.fmt.pix_mp;
> +
> +       wm =3D RDI_WM(wm);
> +
> +       /* no clock gating at bus input */
> +       writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> +
> +       writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
> +
> +       writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >>=
 8,
> +              vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +       writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
> +              vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
> +       writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
> +              vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
> +       writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
> +
> +       /* no dropped frames, one irq per frame */
> +       if (!vfe_is_lite(vfe)) {
> +               writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
> +               writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
> +       }
> +
> +       writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
> +       writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
> +
> +       writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
> +       writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET=
(wm));
> +
> +       writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
> +{
> +       wm =3D RDI_WM(wm);
> +       writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
> +                         struct vfe_line *line)
> +{
> +       wm =3D RDI_WM(wm);
> +       writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +
> +       dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr=
);
> +}
> +
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line=
_id)
> +{
> +       int port_id =3D line_id;
> +
> +       camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static void vfe_reg_update_clear(struct vfe_device *vfe,
> +                                enum vfe_line_id line_id)
> +{
> +       int port_id =3D line_id;
> +
> +       camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}
> +
> +static void vfe_addr_update(struct vfe_device *vfe, enum vfe_line_id lin=
e_id)
> +{
> +       int port_id =3D line_id;
> +
> +       camss_addr_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static void vfe_addr_update_clear(struct vfe_device *vfe, enum vfe_line_=
id line_id)
> +{
> +       int port_id =3D line_id;
> +
> +       camss_addr_update(vfe->camss, vfe->id, port_id, true);
> +}
> +
> +static const struct camss_video_ops vfe_video_ops_1080 =3D {
> +       .queue_buffer =3D vfe_queue_buffer_v2,
> +       .flush_buffers =3D vfe_flush_buffers,
> +};
> +
> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
> +{
> +       vfe->video_ops =3D vfe_video_ops_1080;
> +}
> +
> +static void vfe_global_reset(struct vfe_device *vfe)
> +{
> +       vfe_isr_reset_ack(vfe);
> +}
> +
> +static irqreturn_t vfe_isr(int irq, void *dev)
> +{
> +       /* nop */
> +       return IRQ_HANDLED;
> +}
> +
> +static int vfe_halt(struct vfe_device *vfe)
> +{
> +       /* rely on vfe_disable_output() to stop the VFE */
> +       return 0;
> +}
> +
> +const struct vfe_hw_ops vfe_ops_1080 =3D {
> +       .addr_update =3D vfe_addr_update,
> +       .addr_update_clear =3D vfe_addr_update_clear,
> +       .global_reset =3D vfe_global_reset,
> +       .hw_version =3D vfe_hw_version,
> +       .isr =3D vfe_isr,
> +       .pm_domain_off =3D vfe_pm_domain_off,
> +       .pm_domain_on =3D vfe_pm_domain_on,
> +       .reg_update =3D vfe_reg_update,
> +       .reg_update_clear =3D vfe_reg_update_clear,
> +       .subdev_init =3D vfe_subdev_init,
> +       .vfe_disable =3D vfe_disable,
> +       .vfe_enable =3D vfe_enable_v2,
> +       .vfe_halt =3D vfe_halt,
> +       .vfe_wm_start =3D vfe_wm_start,
> +       .vfe_wm_stop =3D vfe_wm_stop,
> +       .vfe_buf_done =3D vfe_buf_done,
> +       .vfe_wm_update =3D vfe_wm_update,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 4f8867daea4c..221abf7bfd47 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u3=
2 sink_code,
>         case CAMSS_8550:
>         case CAMSS_8650:
>         case CAMSS_8775P:
> +       case CAMSS_KAANAPALI:
>         case CAMSS_X1E80100:
>                 switch (sink_code) {
>                 case MEDIA_BUS_FMT_YUYV8_1X16:
> @@ -2020,6 +2021,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe=
)
>         case CAMSS_8550:
>         case CAMSS_8650:
>         case CAMSS_8775P:
> +       case CAMSS_KAANAPALI:
>         case CAMSS_X1E80100:
>                 ret =3D 16;
>                 break;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/medi=
a/platform/qcom/camss/camss-vfe.h
> index 8312e4c91e98..0a91440cfe43 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -251,6 +251,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
>  extern const struct vfe_hw_ops vfe_ops_340;
>  extern const struct vfe_hw_ops vfe_ops_480;
>  extern const struct vfe_hw_ops vfe_ops_680;
> +extern const struct vfe_hw_ops vfe_ops_1080;
>  extern const struct vfe_hw_ops vfe_ops_gen3;
>
>  int vfe_get(struct vfe_device *vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 7acace363fc2..beca4b827b32 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -156,6 +156,152 @@ static const struct camss_subdev_resources csid_res=
_kaanapali[] =3D {
>         }
>  };
>
> +/* In Kaanapali, CAMNOC requires all CPAS_TFEX clocks
> + * to operate on any TFE Full.
> + */
> +static const struct camss_subdev_resources vfe_res_kaanapali[] =3D {
> +       /* VFE0 - TFE Full */
> +       {
> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +                          "vfe0_fast_ahb", "vfe0",
> +                          "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
> +                          "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug=
_xo" },

Now that we have pm_clk in the main camss_resources structure, it
would make sense to move common/top-level clocks, such as the AHB
clocks, to it. That would avoid having to duplicate them across each
individual sub-block.



> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 360280000, 480000000, 630000000, 716000=
000,
> +                                 833000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 200000000, 300000000, 400000000, 480000=
000 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "vfe0" },
> +               .interrupt =3D { "vfe0" },
> +               .vfe =3D {
> +                       .line_num =3D 3,
> +                       .is_lite =3D false,
> +                       .has_pd =3D true,
> +                       .pd_name =3D "ife0",
> +                       .hw_ops =3D &vfe_ops_1080,
> +                       .formats_rdi =3D &vfe_formats_rdi_845,
> +                       .formats_pix =3D &vfe_formats_pix_845
> +               }
> +       },
> +       /* VFE1 - TFE Full */
> +       {
> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +                          "vfe1_fast_ahb", "vfe1",
> +                          "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
> +                          "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug=
_xo" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 360280000, 480000000, 630000000, 716000=
000,
> +                                 833000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 200000000, 300000000, 400000000, 480000=
000 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "vfe1" },
> +               .interrupt =3D { "vfe1" },
> +               .vfe =3D {
> +                       .line_num =3D 3,
> +                       .is_lite =3D false,
> +                       .has_pd =3D true,
> +                       .pd_name =3D "ife1",
> +                       .hw_ops =3D &vfe_ops_1080,
> +                       .formats_rdi =3D &vfe_formats_rdi_845,
> +                       .formats_pix =3D &vfe_formats_pix_845
> +               }
> +       },
> +       /* VFE2 - TFE Full */
> +       {
> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +                          "vfe2_fast_ahb", "vfe2",
> +                          "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
> +                          "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug=
_xo" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 360280000, 480000000, 630000000, 716000=
000,
> +                                 833000000 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 200000000, 300000000, 400000000, 480000=
000 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "vfe2" },
> +               .interrupt =3D { "vfe2" },
> +               .vfe =3D {
> +                       .line_num =3D 3,
> +                       .is_lite =3D false,
> +                       .has_pd =3D true,
> +                       .pd_name =3D "ife2",
> +                       .hw_ops =3D &vfe_ops_1080,
> +                       .formats_rdi =3D &vfe_formats_rdi_845,
> +                       .formats_pix =3D &vfe_formats_pix_845
> +               }
> +       },
> +       /* VFE3 - IFE Lite */
> +       {
> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +                          "vfe_lite_ahb", "vfe_lite",
> +                          "cpas_vfe_lite", "camnoc_rt_axi",
> +                          "camnoc_nrt_axi", "qdss_debug_xo" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 266666667, 400000000, 480000000 },
> +                               { 0 },
> +                               { 200000000, 300000000, 400000000, 480000=
000 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "vfe_lite0" },
> +               .interrupt =3D { "vfe_lite0" },
> +               .vfe =3D {
> +                       .line_num =3D 3,
> +                       .is_lite =3D true,
> +                       .hw_ops =3D &vfe_ops_1080,
> +                       .formats_rdi =3D &vfe_formats_rdi_845,
> +                       .formats_pix =3D &vfe_formats_pix_845
> +               }
> +       },
> +       /* VFE4 - IFE Lite */
> +       {
> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +                          "vfe_lite_ahb", "vfe_lite",
> +                          "cpas_vfe_lite", "camnoc_rt_axi",
> +                          "camnoc_nrt_axi", "qdss_debug_xo" },
> +               .clock_rate =3D { { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 0 },
> +                               { 266666667, 400000000, 480000000 },
> +                               { 0 },
> +                               { 200000000, 300000000, 400000000, 480000=
000 },
> +                               { 0 },
> +                               { 0 } },
> +               .reg =3D { "vfe_lite1" },
> +               .interrupt =3D { "vfe_lite1" },
> +               .vfe =3D {
> +                       .line_num =3D 3,
> +                       .is_lite =3D true,
> +                       .hw_ops =3D &vfe_ops_1080,
> +                       .formats_rdi =3D &vfe_formats_rdi_845,
> +                       .formats_pix =3D &vfe_formats_pix_845
> +               }
> +       },
> +};
> +
>  static const struct resources_icc icc_res_kaanapali[] =3D {
>         {
>                 .name =3D "ahb",
> @@ -5726,10 +5872,12 @@ static const struct camss_resources kaanapali_res=
ources =3D {
>         .pd_name =3D "top",
>         .csiphy_res =3D csiphy_res_kaanapali,
>         .csid_res =3D csid_res_kaanapali,
> +       .vfe_res =3D vfe_res_kaanapali,
>         .icc_res =3D icc_res_kaanapali,
>         .icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
>         .csiphy_num =3D ARRAY_SIZE(csiphy_res_kaanapali),
>         .csid_num =3D ARRAY_SIZE(csid_res_kaanapali),
> +       .vfe_num =3D ARRAY_SIZE(vfe_res_kaanapali),
>  };
>
>  static const struct camss_resources msm8916_resources =3D {
>
> --
> 2.34.1
>
