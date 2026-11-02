Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793609507;
	b=K7YRBjDolUudHVLzQGuUrfpdrq5MvRNeH1d5IQoTA70WjxNL4cTFh4JCchJXijSl35c3
	 ZHxJXvemfna+G1Y8S3zZdksGPJea8K3E1yYf0yBe3+O6ZsEY8X8BZ4smd2GmTEJrmZ72c
	 WhNu2sed9QTbL1Jeoe9YpMbYV4tEU1SY9MJPJmEJd8Bjy7HnDJ15qmU3yLBO5Pr25JIGo
	 J/DCNHUXFzcaGtsfltsu1nkCss79ZzdPfUEAiXgFVRKAkJl1fILO7zUkxbiLrWodCEi9Q
	 ymHcXvMxgEA12X0fR4VDkzwNHlOIGybLa099T30bDv7GqcQJV6Uct+SwL7W2HFI1Udw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=;
	b=kr/09SDUl9VmSb7/HK2EHKcG8N8h6KNgzQVZmL66xLs2jaOjsAPvdSN6oe84LF9uJrjy
	 +k0w0IwMNPnlpr9FX7WpCFqHzFXn5FsKie/ukTzeztxIFcHG8mnbbjweWs/ERBV/MT8Yb
	 BhTgMQH/OJxshwf1OWpU/+4w9eP+IaQ/yQMKnOsISStDD383aq0Ko88EvrM8tGupJfGLC
	 I+iYLONPUqEEa5bjbV63tDUeAl9FeFj8Nyzm8VT37eww+v/qei7PiUPsLvA4UrAcsJsZy
	 xUyKvHbwgV3Z4wb4Kjm/Zj51Y1zACSWAmRem9rvMBXq8PpdLrC2kGgyY00yk0bhUHLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XReDPP9D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcCp9OM+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF66D606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF66D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XReDPP9D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcCp9OM+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vKM73769168
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 08:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=; b=XReDPP9D99nIrwZ0
	yotNp0bmeTYK7gdFNJbZWdLk6ND9e/WfJeEZ31tdc3XvoRbX8cL7O3X+qQUov+ZB
	yl9Orz/hsy8h1PQBjrQghdjRTQw/9dDaU0goyswbeGLrVN8WWLlD/GJK3N3Fm5ue
	9tPNVj/wGVNYkRfpVKjTkFZ5jSsphgGdqyLDq+gxOJresz5EeS0H03i667kCgyCr
	o+zKPjG4nrn9Ml2Vd7YneU6bGAiQ9UM8dJa7lMzoduhwaCRB/xgEfctglN589pZH
	BdP8acUyhm0Ca5r54pQ47R8hb8s0PbH2aaJ6tiRzvZifvMH/Vi6ehQmcl7KnntGV
	F+x1Pw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rx4kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:51:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so542807885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:51:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793609505; cv=none;
        d=google.com; s=arc-20260327;
        b=s6s51dYJPjNxcwnasMAVRryY3SQl4nRDRlub6REn68SckXIHeBeBKHLaCkGJOqrWFP
         GGfirYmQ02NDVSxyeOso1dwHCq9tS90oDDCVWQ39nlsLtClGRV1PvEKVqg47EFGru6L1
         7OMLNg2cbdSTnuY2nebuZCtNLp2aN80mh4Gtsp3CKxHTl+4j8zCF86jw7TcPqLj+oUB9
         X7vgCiiiqNh487eG6rxXhQo0h3BoZ5eIt7x8BzJbOrJfZoHeCnZcouvipyAf/nKzVnZM
         UbZRoFbZXcjjo38WyGsd81o16+iFy845N1reUsl4UrNbMCbI9P7OmUBDAV0jWpB2pBCT
         EDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=;
        fh=GTRFeBvGBlklpGB3HuQ/l+nZqq8hSBS+xnqdQWioBOA=;
        b=COA++/tfU4vcAtJm/+QrmTw+b7kyZvlnDuXXmeKnSp/6oW8UQxJVt5FFWO8OlNuaTN
         sXWDqTmB4Ai6uKAblfVwEoy+YfcPV6/yotgtqdCMopfcPXauVrUgd3Cn5Sjmp9D/+wzV
         6b7XPxl4VkZs+kexJnS1iNlEtoJu7frIehF/AdhFWBHyW7Ke4GMXnh/OGiZ6+jTuT3QA
         +4OqrovudYIaHX0cRaKOp0xoaV/kLPEoVNt80QfszXdRGuY01pTF9qm8y1DRORI+K3CL
         BmWgKveG7ARbSrDwCx6OYZVv43hldwz2N5aUyeo4MmuGy4mcbmDUUYUaKdRz9FKngaKq
         J4/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609505; x=1794214305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=;
        b=dcCp9OM+WqesPeKJPtsCJlDxgF8VmMh5jbak7eRQF+iarusZmVzN09l7P4zckz8YCa
         DfGAXuJ4sflHeN8o/HVvcJHAzTo7gryGlOaZvU7lh1dFTOlXSOldnqYAFxSjY5ElB4k+
         1c96Q4dQBEACQiDjMT3s4D15on6EfMijweyXs0+WnRR2yr8iUTum106CkjmuCUZNW/CD
         koZAmeEQUg1EDC3r9PBFHpEFx6VyZ0NdIOhKIiTGQeK7Hl/1hWRzNRxD5QGb5ztr6/Ex
         MUUdjrxRAnggdK5WDsSz8GPc/lzncFE7U7W7/9ZvW4gr9kQCMt3Fet4VpxC/XclQQXLX
         Nudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609505; x=1794214305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=;
        b=0+dZ5nAtVBs4k39rQdWzI16NsqtLPYCGQiB1y6U0SIUxiq/ON0VC2FYPKHzwuBqUcI
         T+bsUygzvFMeHAnYvA7kL7sYmFttxIFLpL3Qlx36+UmBaD3t63Fq2mlXJhZJIaBOoPjD
         i60VAHlAwjGfHM58H9jVjjR8YWHnntxGcGmkF78cPzD3HyV/Tt2Ze0WSJayhzEVtLsWy
         qFsnLh1oGssERg5HHocUior2BeXbP+YF2Xoo4fB6D2xiQr05+K8A8wMyu8RqBd+/XR1t
         N4r+pLvS+I5MtPcOwi5pUqP0YXycj2T2vjIimYJxYdAUFIoc4vXfe36msp07+Lo/hOPa
         MGAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsNlm4FVuzozqHSsrqGneXMT2uVp/vGibfyXsiQiPB3X4n7Ov3nZPDS6H4aRyFjaj71TN7ieFhNfHtJzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLda00+zG9d1bTP1l1BAE/6IcL9a0Z9DB0EamdZGCCe50hoSxvW
	ERfXOOlWUzZ7i2Oje2XDvP8khcO7SdOvCgdF0D9K7ItQBc/Bdx6EftqKc1NAmdheVhOerMmTeTV
	bRhN3c390O1y5knMKjmO2nm4S83srcovEVmiz5ZIFmtOJQReHph/VK3U9Hr4xuQQjRaBlXd7BTa
	fk0VeGskP2RHOfX29W8i+TtXZSokWOtT51O6WSHOo/agiM/GnAdqZPn3M=
X-Gm-Gg: AYBFou2/swbVEi8mVmE4KHtO6vl4ZM20aoliqUgvWO/Q0zmsWuP7tVSfGKqx9o1FPOe
	oWdZaGQUJ/GU8yYxxYtKFpvHRcJB6c+xLgyFFuaYjilYEFPzvf46G7J+fKreXB3zuEKRTywsHY0
	nmI3aCKMtalJbvJhuz4kl4/qWlEMvU76dd9fD+4SDcRgr7xyCVXA0TdFYJWBj0f67dH8BE3yxrY
	3DOis9j0b6UN5nR8sELw/U4LhUJ/UPKRpgeXfnw+RwNBAHU4dfywYFu32/PNPMxgGZedl55eMw=
X-Received: by 2002:a05:620a:2b9b:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-944133f0eb7mr1861958885a.39.1793609504816;
        Mon, 02 Nov 2026 00:51:44 -0800 (PST)
X-Received: by 2002:a05:620a:2b9b:b0:93e:c12d:4ec7 with SMTP id
 af79cd13be357-944133f0eb7mr1861957685a.39.1793609504418; Mon, 02 Nov 2026
 00:51:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_0D164F79882608DC3FB1B70913F736690207@qq.com>
In-Reply-To: <tencent_0D164F79882608DC3FB1B70913F736690207@qq.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:51:32 +0100
X-Gm-Features: AclHuK-EJcKoQq8ZTaXsIzEoJvTlXhA2-TZ0zFrIKuJnpNWnR6DDxucUMC3DkOg
Message-ID: <CAFEp6-3KgeKHEFtbyuZRd2PW5uiy=ofWP9z_FnPaqJo4qDL6sQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
To: Shuai Liu <847807867@qq.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, manivannan.sadhasivam@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: bigLZJTC-NJZR3xsxt2Cdi9zZ-_i-IAo
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae84f21 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=dZbOZ2KzAAAA:8 a=LO7QhAU4TRSVvaEUstIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX8R/aDE+DJucY
 UXdxW4to6RE32QTe2AH6ynmFN/k+ax1RFT7/wLFFwa68gGNEpev5k51rAxKqh3PRr0oFXUItKtd
 RBuJldOW7PJ2F32g22QjqPYzWaYWSaw=
X-Proofpoint-GUID: bigLZJTC-NJZR3xsxt2Cdi9zZ-_i-IAo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX0fkiyP3+hpcG
 XM9gpZmPJZruS/4XS/uO4pTgP+tRFvz3pJl3ns5jzoeOsXxgs126/JuGPzIxHqOY0bpUTBO5W//
 PYtewkCNebtne4SRHJMLcwP6g4YgOxNBUzjDUzTppWXHTJSwVlMVZIg5DIuYi/SBTv/IieouUU1
 qz+ti9Q4GUcsTLJFKO4bpwjXqKTsxA5Q8os/lTRFq7wzDKizs1TOmIoOKxHSVcVgszocCMySD4V
 oiVXHApkc8wsgoIu42a8O0IKSvnBuppcfT1hocgQ3U8ZSaNrLdF44Qik9fMkVw6MTsOWmAoGx8Q
 czJk7GpW1ozIjBbQ/ECTQs6/uGEW7RDttMmmv1m5Y3Mvmt0c7EZfucmuKSAJd0uvKsn80epN0tS
 KlT49NrV/OVItbD52GEDx2Vd9TcYMV6P+fKMnJkR5Z2gTozUb/qLuPNKUE9w3QxECdZqwH1a1VR
 axC+q0MjZIO5N7i9Hog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

On Mon, Nov 2, 2026 at 7:58=E2=80=AFAM Shuai Liu <847807867@qq.com> wrote:
>
> Commit 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API
> devices") added a call to phy_mipi_dphy_get_default_config_for_hsclk()
> in camss-csiphy.c but did not select GENERIC_PHY_MIPI_DPHY, the
> invisible bool gating phy-core-mipi-dphy.c where that helper lives.
>
> With CONFIG_VIDEO_QCOM_CAMSS=3Dy and no other driver pulling in
> GENERIC_PHY_MIPI_DPHY, the build fails at link time:
>
>   camss-csiphy.c:(.text+0x51d): undefined reference to
>   `phy_mipi_dphy_get_default_config_for_hsclk'
>
> Select GENERIC_PHY_MIPI_DPHY, matching the other MIPI D-PHY consumers
> such as rkisp1, mali-c55, cadence-csi2rx and sun6i-mipi-csi2.
>
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices=
")
> Signed-off-by: Shuai Liu <847807867@qq.com>
> ---
>  drivers/media/platform/qcom/camss/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index b51745c942c9..b18ae4405502 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -8,4 +8,5 @@ config VIDEO_QCOM_CAMSS
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
>         select GENERIC_PHY
> +       select GENERIC_PHY_MIPI_DPHY

So do we still need to select GENERIC_PHY?

>         imply PHY_QCOM_MIPI_CSI2
> --
> 2.43.0
>
