Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B893E557E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371585; cv=none; b=pJTxOQxdiPdSSrlZ38dwPivbazpE2uR5F0xAwphL91cDANgR5mR1k7p6vCC8gEyv3Gvj5XNmWaeEYLGA3O0u2YQJyn378VEllCjmDZ4gB6OM2+zhZniu9PWWzzTunQkGk3VWqiGXsa8wOIfNCTM7IFBEXOz/ZedQWD34X2PNfQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371585; c=relaxed/simple;
	bh=d9Vt4dMcdh3Bu0UXJeuPxUvHEGg0x7JCETPcRfr/3cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWnlf2mG6K/M0NFvG9VyVO+YIrRBeLCRw11ezghw4SA0jpv+ng/xVZSMIXkzwbeaD7w9gyyTVMfiIgg7R9nnfTqZmihC78RaxJsQsEzqpLAmHkWec6SZho+LDIBd/xNEtr6IFWZkuFkWflSlnI/nTQRxbUJYJ9l95IrGwzlN2t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3AYNJjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xgjuzfn8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3AYNJjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xgjuzfn8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikaQ3901085
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o4YUYbLCdwb5dvgKREja2hbc
	wMVPztKBPHs0R7HUkU0=; b=l3AYNJjBjxe9EAwvgDb9YusYyrPLu6drm8Llr5x0
	Sh3OuyPJU3GWc+mARnItdnxAnOfADBZ6IEySO/kc95ZI4aWYFX6t6AgS+CZIa2DG
	Z3eafv9qHhpc4Iu5/nLysjIHyS2bnqUSrcZ3JrWt3JlqvpIq032Tuqz2aMDiYDOx
	5A3ZdN/Yl+WMsGFdiBRGImTEaULflNMVl/RHz1QjuWaFcHPr32xFakdyUhIU7yQF
	Ue3R7NQ0GxVu/NnmX/Ykil1B9b+4ODBb1avO1OhNbO7j9sSlvuzY8tUVwyAl04zo
	1QkXDRTVotVvcj3X0o/CxO3B3LvfD6IFs4xAC/mYqZiEoQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5hkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939d6c515deso597522585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371582; x=1789976382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4YUYbLCdwb5dvgKREja2hbcwMVPztKBPHs0R7HUkU0=;
        b=Xgjuzfn8TDvKQ8arItUNipo+y0vD0hGVQMAqNK1zxKP5SqQDkLpYMwocds8p4iQgar
         uZecoZyYyJQG7hmzG/JmI3ckW8Up0e6edUDYHZD8KR2MOGlWp96bQAo6kTG4rIOmO8Ry
         GbP+Rbj2VpjAh0kVRIQpn4vFCgRD+wGWfBj0QSc0r5C1hU4RB0nhp609bX7T22xplgya
         2BZeB+ZJGpmatboOwvkN/BlECNCatJqCO+Jh+sufN0mKLTZ76PWtfRD4NXxy0oY6VLI9
         tgV1CI/a1RNPwjNrfKSFoXmeLT8RC1rk7yj8rq6irRec+8v6s0BI4KcArcICEm9Wims6
         iocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371582; x=1789976382;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4YUYbLCdwb5dvgKREja2hbcwMVPztKBPHs0R7HUkU0=;
        b=ppqy9sGOvxEo/1/EyLvKTTOb31d5xr1LsKD8oEzYwXrInOqhsi7t4mbC6LzfPBASb2
         HbTcCYa72NyIiJUVjRFWfhxEEBPGprOQ1vKWHMoHfMkogyYp4/L8oopxLjYXyCx+27Ud
         CDwC6teioQEYLwwP18GNEX0Y763zGanyWyXPbC9eoetNrlrSbopNpDoQn0cZLHRSYG6H
         aZeGyqKVqCX/KRAiEXzZyVI1QrzPVMk1sYbjAkV/yoH6QjegEGhNBOLNB+9S+EIansY5
         5DQ/BZ7OsbrZxtYznOvLOGT2MTlLRl5jJdkyNvgnRELVin8LOSaWIECPmGLnjBICrYjd
         k6Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwNdgywoXu8ArXdMe7Vg9vndERZqbfW7Shaeom6oGDdvTz5rFLByhY/v2brgqfEGpvEQg2EpmGhfdkCYRM=@vger.kernel.org
X-Gm-Message-State: AFuF++kICkT0vR7IWjOMR81fxpxzAb0MG4vhLvpG/b4h98Krbvu6ZBko
	FJa6F9Yo9jRiQsRPZ7YqlPfLnWGYDFoyid6LWh3D1OZSKY4Anj0rpvBS60SFOWJe5sy246Q7OTZ
	9xEA3Ne8qGm3bGC/MqWXvkyVe59rM+duTDAtN6WFFKIwOPp6LamkE5PTsRfpaiedX6Kk=
X-Gm-Gg: AYBFou0Ulh/EFe1AZ4ae4IOiSfOgh/7Qu2fFQkNJViHRlyEzYQlAZUuI2aUl7po+ZCF
	aC38HHSEt107Bh2ubSHKJVdOu2BVMIQXDPM4/BiLySf7uTYd8YTPIWzOrG4ExlFzYEM1nawi8uT
	ieaJyaMXripqHnn37PoccEymcYqDQdRLa2zQ8tBLxBbYImR5DbsRgXD5pPIkM5wvkWNFLvToBA9
	1ey53nfUm0EYdeVzO6H0Wc25EMcOgr/bW/5YHEidTH52xPSd+PN+kER/kplh6phuSVShNTma2RU
	EJtiDJuOYz/x3Ep1dAk7VxGIT9pcSj1uGWbZWo0+B9aoIbksHhJcPiMc87cTPP7VsImqIkRgcl7
	tFB+Phi33MAZWJA==
X-Received: by 2002:a05:620a:1b93:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93a299f539emr185963385a.31.1789371581995;
        Mon, 14 Sep 2026 00:39:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93a299f539emr185960385a.31.1789371581363;
        Mon, 14 Sep 2026 00:39:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7548d99bsm130251565e9.1.2026.09.14.00.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:39:40 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:39:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 15/31] arm64: dts: qcom: sm8350: Add domain idle state
 names
Message-ID: <impp454jesz6unwipj25pg3i4nmtfftrm6f5ikavxfdfz2gyue@f4yqvtcy7333>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-15-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-15-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX68M5gTVFMDhZ
 P6XwP48UR2v8081gj7+BK+5f4vPzkWn19J+Go03x2uoSn7kxgYfWtqMRnYTc8dBrFHOfsqmpsgi
 yuyqVMXr91R+ZBblTDd82AtCP1eMGgQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXymj8oXxCkYC8
 6/1VS6Yy+2Pun41K68HPJ8mzu7uxlB5RykovN5P/egIuhoAAoJc4DcD58DnSxrphzeTpw6bKgyf
 cDCw/FZiMzZ/ZC31a6Nbw6VCV4OYomd+2d4V1uxHqbeuSDAmnz2ftVBx5lP9iQnTOiIngB4q818
 7Sa3draSehhSTWgeLEsNnVFSaL4bSovKLngAXffHxtCyM/VGqzqRHeG6wOWejamSZVBCySq3HSx
 VOlae8cKM/qqsqOzodgw66AGpaDsz+5ml+jfGPi2farIDJZ5eMkx2HM9Cr0nVa2fdzEUb8vy4DV
 3pfiMYmPnzcfWKt8VKahMQ0bxx4vvdcKp57jz+2wzmFHzD9sP4RGbb+HmfSDaGTEUoVTTOh1gES
 7NnngAar0S+XyOaBCEkx6T2aidzRkMXSDa7UtqPvNGfD+mhF3e9GeQdbDXFmFQ6mlTbSrmd17lA
 kOAUkMl5SdSnR9Y9oNg==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7a4bf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KM9t8hQxmbDqm-tLX1Dj5QBF_vyCfkwA
X-Proofpoint-GUID: KM9t8hQxmbDqm-tLX1Dj5QBF_vyCfkwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:47, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
