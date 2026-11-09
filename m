Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794218231;
	b=ASey6lTpLRGLQr9eyOh3JhFWPC+3o8ZjR6Sf2W3rwwz3WtIlcU6ee5CKXgqfgF5Hlvfy
	 RvZ0Z+lMCJzzj0SjFRFQleVIE4d3S4qCqAlRFIJNqdf7q46cOL5GDWgw0mthL/7jkR052
	 8EX4PErp2pCNDipMTO88ppMMl4fKKGzUCC0NZsJPefC/vCH9Ku09XhUQB7CiuxK0LsCTs
	 GeD5+PX0WJORQCX3mrnSSwaNNJ7UyTQPUy4rjiuyuEt04iAVjt1xQETkvRUk5vwleUC+Y
	 TY/XgmQImQJp7tZZI4rZCsLtjL+4WCbNVWR0lJqGpKT1ha9A8vxnO2fvicCGsRUVQFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=;
	b=BG1DO46LOswcWz/CjIxmHhsaKjz1U1rCqxUuCD3wnvNQOfpl67B0CsddYfyZfZw9ej3C
	 6orB21gMgpxCPGWGKwrm48JOG9N+CT26v8fFF4anQf3ecmUCAMKDeqQFcm4stMRx6sREL
	 KeOKR/2m34+D7EAZSbPZtC4WHPpBddIMr6vGE5o4Mz8YqnHlgTDHaTfIovAvp/oYnPo7Q
	 J1GfarlYGIWkzBSlCEieD8D/hZ609xfi62rdiU7HEW7cVzx5/l3711iuZhIS5mKlul834
	 Kr125nFGPyloWHEiQ0a7H+IKiOmoTgMW7P4/j4XmksjCP8D9yMba5Fpo7yxuLueH9ZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPtuRtDG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YI1HO/W0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB42606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB42606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPtuRtDG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YI1HO/W0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99uj0Z2502617
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=; b=VPtuRtDGzb65NmL9
	VLFYDA8OJXcH+ENvRFYSyLXanv3GGUHa6d2HQwcygrFRERVAO9cViv+KuiQjXEI7
	Y9JV6pDfIUcEaKQyOfwoXWnS4i/1R7LzOipuMBeoi0sDOnF8FBLKPN5RJFJdy+T7
	ZTuHdkJ6IQR7NjuVAu+k6tTTs74qHb4VugMtJTk1mU+i0TyZnmlrBi1n3xPST6KR
	Y7xPWEutPUwjd1Bs8Ubuw1s9V1WxlLo7foE6vAj+Q5n+288tGGYId5ioLDgBmPmW
	g271xOtcdtEJJKWV0yzBDc+63+m976m0oSTPCkR32u/2QXI1mkFR02l5qXLM2TRG
	l6cbvQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8r1qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:57:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so134499085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:57:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794218228; cv=none;
        d=google.com; s=arc-20260327;
        b=HchmfEyeINJzKSMH2tOfwCvE0QOLXrtvado9nyg2nhCm84d1xYRIw+aG688yThkoNu
         rQf3BD6KzNkjgj7QMFNzIIT+AX4NIKvM9hkagTpucTpbTkiUZmrKwgjbfkkczUQ3lU9G
         xR5aOhxVvpQBADQFrOXpQpLlodMIL3IsEJKFDPwtM1Ju33eTGU3yEXVLzBVnFP2AR94A
         TJcD+4LEsftyUB15KOqYCmjjH8/rZVeA5zc64oeqWUBoFgxOr32RTHPCSs7TCwrjP1WB
         xh61oeahQZKcom1XEnKXQaMfq+M/R4kYEKRNK0E4Kegp9AG4jcLBkUFnxh3H16usWJc0
         NCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=;
        fh=d1J6yHnBJfvqmfAfYy//bk8eBgYO0nmbAU86obuYlE0=;
        b=RgauV/zx2sT3dfVXEd9PIPstXG/7YcoG+f8GoPZud3OhlqcbnIHqSwMX74Ghd/mJQn
         e4YFgqF021kkVIzO1b71UO0R+l5L4H1aeT+g30WZP5zzfro/gLeIE4FzRwDajsqA5TBt
         MBi//Q0AU35bbMzvvOracJ9RRgv2WlPOLTH/ujL6DL7oPItpdtpVz+jCl2Fls+8SFbJE
         +heqyJ9Z1ctdrhVKv7Z1OrPcGRpG34ft9cwTJEYC4HZR/No0bxMx5bXVuEynYERrzHUP
         qypOiuA3ykH+OA2xWj1kat37+JfVvjJFDrwzM2702INaRBT1QrQUeoTqkI0M1nslEY2/
         zxTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218228; x=1794823028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=;
        b=YI1HO/W0EQLWyHzVs0t1ZJ5qJNb5kcxeU7uNuwCe5segq//c1E5N5oPqoV9dNtfp8L
         93zZqfkERMPSE7DzbD/ZdVK7suWGRfpt+ihpAv6AQVXNu+vIdZOghnBK6qwcKDcmVtXg
         rB2Tf2TOANlYphZejtHgq7gyORN34BqEaSeeSoDkCy9zYy/lRkOfBTT7vjFeyjKl++8d
         xdK4O8XvvLNtywna6hkjsLv8YBjgSrLT5/qVykPiTAyQbrHSSRrhxeBYePzgzwtmExnS
         5oj0D3sY3dWR+/Ut1a+eWJQbW7jVad0yZ47QeCXJE8PESRx7ONc+jLMfceOKCi8dfdn0
         FupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218228; x=1794823028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=;
        b=KCCihN7mmJhgH8wKRPfJw4wIbYZXrCdDCgD0NvTVtGFtKFKRlKES2HWMgwR7qlC0XR
         L3jIYNTzKIBDxUvBScBcWp19qZ4W+eYzi7CHWWjlgBAb051urYwSuuYdaCBCHIaGqYgk
         2kcEv5282AcJmxtQ7WE0ruzmFR3vNM21/2KEsWy2xjGDeWqvcNnBHESiCLFFqJtjo/Xl
         YIngE166BTZyb07J+RdXE7Od2t9WIbRBdgGwhUTuT7gvseDyT192FIwCL3ZQK6Tpyvdn
         RoNdaxJcUp7TqkkdlJzZmr1fyb6ljCaNovuxyy9vS+VId0wBso4WsOEvQnYkkCij7iSZ
         8OCw==
X-Forwarded-Encrypted: i=1; AL+hErGaBuC4XY+DBrCZRRTfrS4E0vBHHfahpLhY0kJjiqcSEpuGsfPq5w1N5RCaHykgFegYyCWrfvXMvgeSBtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tifpAdogGQh/Q8tZ0m1Pi0d66p0PROTwwOziNAjwD/VOOEGsQ
	Z0LERFCcRyngh3e18rNSjJN5bxedrE4JVXTOAeX2ls+td5Q2JZMmyNm7RtW94iUndK1Wiop2Xy4
	YEzD8XxtUKfZnY4l7PcnYr9SJddoSKZmFfD9nHHCpcIHc/kJMeR93xolg1gE9LNaEvaw92/Zq9J
	szOrEvBGV5sYRQgTws+1o+E6JkWQ4h/WixZB0/fFLmAiElbsqKZhIyvtc=
X-Gm-Gg: AYBFou2JnGPSwpjrjUR47QzL8J3VUq9O6EQsnHGoMMuBuPUZ3+4H8aAr+hrN8Z/+dmK
	NI5Emxm0Hqv+b6gCs4J3EWk0o0Ye93gWTxq/GnF+Tn8nfFBmdvC47CaRMw8KNKXW/fITJj4iOgN
	H/20LZkRNtQDSB20dQc8XiU1AhiJFnXMUs+xPE4OTe0zdRferoxJ9HsdKf0Yhdc3OdvkeUIOKhO
	wUWTKKiOkMMGnSlSLqrkf5MR/O437hko8Kap+86D6ZSBnmMdA3nQHFb0HoycmkPpC1ywiLkUSQ=
X-Received: by 2002:a05:620a:2401:20b0:947:84da:8458 with SMTP id af79cd13be357-94784da9342mr336039385a.83.1794218228422;
        Mon, 09 Nov 2026 01:57:08 -0800 (PST)
X-Received: by 2002:a05:620a:2401:20b0:947:84da:8458 with SMTP id
 af79cd13be357-94784da9342mr336037885a.83.1794218227882; Mon, 09 Nov 2026
 01:57:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org> <20261107-v4l2-frame-sync-v3-8-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-8-e5bf7073a35d@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:56:56 +0100
X-Gm-Features: AclHuK9j9RAwJKTKzev9RbLG7mY1UiDABvkGjeRinbRp40Cik4QzcPP6hAY-YhQ
Message-ID: <CAFEp6-0t_r7yH3hGRFH6amgfNUK7sTMe68HXQ2WEuUffHMQF2A@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] media: qcom: camss: Switch on frame_sync_en
 logic for csid-gen3.
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOSBTYWx0ZWRfX4zcbVRqk2INq
 rgILckvju5oWQ8wD/94YhLoLnOKEaL9sj7dGRi3QXaNNoYVaXvtx0+WLP+HlxtgLZ3gxYV4pslV
 068eAhKDkaN7zMVVcTxfZuZXePlOshUeGRdoeZ1RJCJMk1fRm0E0McBc6gZ+6WT46U6GPEuj/VQ
 hbzzbiIIhcYusPJqSlVo+62IFn67U7AN3GJmvZysp5hMFW3/Ujlnnkwm0X8yr28MKrV+HsWxVIL
 6Io9WvC8Fc+XOnFf4TGV6woYNAHH25ACtX3BQIYKbj4DELSFEzznoCrTl+tiS+RhBQSPAljcZTO
 E+VI8ibxHfKKz/FwJioIBS0BcfCCnyUt4lPS5UkoViiG7x7jngVEIvXlssGSG+Gh/vExGd5qeHX
 rUZhodoerbDyHKY8sCpgE/WPiXPV17cbNiDr7yi9IHCdnzmDLGpsyPUR18ufKyZQv3yhMP4jVtv
 vn/K7EPiv6LXD64+Bfg==
X-Proofpoint-GUID: Bl9Yzoxf3xlmqC4WaidXBJUoCU2En1sD
X-Proofpoint-ORIG-GUID: Bl9Yzoxf3xlmqC4WaidXBJUoCU2En1sD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOSBTYWx0ZWRfX9GB/MuQOsgJ8
 FOR88k3d4Bq7IW1wiU20bXfXV/SLoIFiZNdLGK52gPsJKL1gggQqPJeb563ykcVGDILEKiHte9+
 pkaX1YCO9z4kG8AjtzW5DYdGtfvDrH0=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af198f5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XzkgqCU9wlH7P1zULpYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090039

On Sat, Nov 7, 2026 at 2:02=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Switch frame_sync_en to true to track and consume SOF/EOF data.
>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8650-hdk
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

I would have preferred this to be defined directly in the
corresponding CSID implementations rather than in the resource
descriptors, so that the component implementing frame synchronization
is also the one advertising support for it. In other words, something
along the lines of a csid_hw_ops.features flag or a dedicated
csid_hw_ops.has_frame_sync callback/field. That said, this is more of
a design preference than a blocking concern for me, so:

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 52bb19f5fbf3b..b7821019241d7 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3120,6 +3120,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid0" },
>                 .interrupt =3D { "csid0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3135,6 +3136,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid1" },
>                 .interrupt =3D { "csid1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3150,6 +3152,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid2" },
>                 .interrupt =3D { "csid2" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3165,6 +3168,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid_lite0" },
>                 .interrupt =3D { "csid_lite0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3180,6 +3184,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid_lite1" },
>                 .interrupt =3D { "csid_lite1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3433,6 +3438,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid0" },
>                 .interrupt =3D { "csid0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .formats =3D &csid_formats_gen2,
> @@ -3447,6 +3453,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid1" },
>                 .interrupt =3D { "csid1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .formats =3D &csid_formats_gen2,
> @@ -3461,6 +3468,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid2" },
>                 .interrupt =3D { "csid2" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .formats =3D &csid_formats_gen2,
> @@ -3476,6 +3484,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid_lite0" },
>                 .interrupt =3D { "csid_lite0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3492,6 +3501,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid_lite1" },
>                 .interrupt =3D { "csid_lite1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3790,6 +3800,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid0" },
>                 .interrupt =3D { "csid0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3807,6 +3818,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid1" },
>                 .interrupt =3D { "csid1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3825,6 +3837,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite0" },
>                 .interrupt =3D { "csid_lite0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3842,6 +3855,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite1" },
>                 .interrupt =3D { "csid_lite1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3859,6 +3873,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite2" },
>                 .interrupt =3D { "csid_lite2" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3876,6 +3891,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite3" },
>                 .interrupt =3D { "csid_lite3" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3893,6 +3909,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite4" },
>                 .interrupt =3D { "csid_lite4" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>
> --
> 2.56.0
>
