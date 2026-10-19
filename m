Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D254DAF89
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410386; cv=none; b=dW9be3QfpN6gSNbFZiDyS8yC0B+Oy82VSwyTmQ16ICIBSmDRatdS3xKE24KunfP+rT52HPwDrhK7PK1cE7/malW0TJBMADFxnSWxUQgNrhstZMi03vXSV3oHmPCT1nYBfCNauhS6IjHnV3omajBL2MSyQaIPWU9N38qWX41bVBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410386; c=relaxed/simple;
	bh=ewQoxyQLo/SIXE0r9ug8m4TnQqvVKS+4FgnH3/X1IRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsH8dH7rRoVejC2zPZpcPkUwiMWKMhkAGB/GemuYgS6nadeSGYQ8VEZSU7XJSwzXA60JfAgZLeuOtDHLenMG/sqyqWeTdTF+cSgT8wWY7mt5PVCshHO35rDQQVz+WkkziVCAwF78mU2+BWrGhN7fqLp/vmWm1JWQbIm1B5wyAio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEaqUc/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i85v3/+h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEaqUc/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i85v3/+h"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrqD1665586
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hG197sZx3XRJAemskE7V+hMh
	trqkgeOsYb24Xht8LNk=; b=TEaqUc/AW2zv0dvvnpDGjbJ34/KQDGa49xWXOlC6
	yz/a6Xp6aX5v3p3UgpV+s4NNziLQicA+imw6XHDL5sTpGfxlnvUIPDyXYxy7GADV
	G7JscBXn6Mg6NOG3jb/vIszrSa4jEGMWEgItHiJU/ZlgycX/KT6j7cPKNqLwFO6I
	mrMjWB4dAWZoYrpSRN7NSgZ7Kc6IL9SC3Gr6nyRCe2Xv9AQfof4YdWucsVpurvpi
	/QvDTfMq5abkWg1dR4XwYEkJf8D5/jjMoMkvbeQ4qHhUXD5Fxy+kev39xWw6OTPP
	8MAqZgjbQ1GcywD+xKQjFwCyK222Xlnw7uAsbnQgqF2TkQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0w16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:46:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so435235885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410383; x=1793015183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hG197sZx3XRJAemskE7V+hMhtrqkgeOsYb24Xht8LNk=;
        b=i85v3/+hl5YPgvLGvk7GpL03Lxz+8U3PNwW348k9UR16r9t3nd+u7fy3Q3QbisIkbk
         euCcB1JMFh4Ii+UkcMvrhcSI4ZNru4HwGZFlHhEdTqb9OgBuzutpTwi5+1thMNQQaFPg
         rNLz+UP25dR8nObWvFpwyJfVzCQWdHYQ8M7LIvYWvaZ8QPO9EyS4lP2GQLeLkB1t6v31
         oCiLneEy3vnlXAscCPcM6iMNCW4bkl0rHGfk8JphaQdHwFKla/OeMkpz2cW7CUPA12KI
         GwLiHc14+1Aj5ZjpaRi0D3dF15UKR8dAdlB9p6caymwJ1DfCRsIzVynFEs1/s+5E11/9
         /4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410383; x=1793015183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hG197sZx3XRJAemskE7V+hMhtrqkgeOsYb24Xht8LNk=;
        b=r1yKNUIkRXHjKWWqlwyICz926fJ++8a5WCdVGeuxS4TtQ3DUA32fxcYaPcj4cNTDML
         qT0WVxkWh+8/1cwLsNpfWRrDNhepooq1+doylCyuSCnF0SH3t4XmIA8bn5u/X0Iwovuk
         ZwH1epIvtab5GdGEtkwTAWm2REysQ8NBiRxvU/fFH/t2ZkeDZ2XJygzTaBMjo0yBun+U
         +GJmqmujpYW5tgyBEMpFoJ78b5Lhe4tVtBrOOpz3DspYviFF7T5bkSdN+jiohcVSJZh7
         FxfzwqQeNoGq4gbOt66vJyxIqRB29SYHchS8J8RFyuaezL34XIdlN+s/GehDm9+paHU2
         rRcA==
X-Forwarded-Encrypted: i=1; AKwUvBzntf648iMI8FYO69BBjY0lgWrU+yIHZZE0V3BjJnB1aoxZabsrPYDFl+v8n1L+9B3RMQX4RBgWmP5LZSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHRnaSStCFIpT4BFVMVOXi5G+VSsvJt0U2Ks+gVSOnwPjwXkOM
	W/D+pIcuap5hs0MZZGyt48lSoQCOLN7/uEHW/lJnlItH4PxC4zeWKMDUJ6cIuLGdgtRndhlBIG9
	1Wy2KGbeO6RuI6SAhKjYwqk7JUsZhX1tAE1/LV3iKnCEQw46omJBDBpV66CHzaPolu88=
X-Gm-Gg: AYBFou0JBUeHC/C1ia87kEwhCfAD09BwUHN1LcoDtaiB3Z3JpVkwKFFT05gVLs6A8My
	XQ8M14QVEpHpLJAZWrnxl5M6lJdXiOzr2jmTnF5CJrXQnHM4pr/khD/t4DtddoEQTzgdPiVpadN
	aJLfNlFa/1Uf1KzNM/YZMK+C6KH8BiNETqeUd+vLuT/0w2XucPbCQAmqz8/SXz/u769dryxWPce
	Vpj5Ts1hVDaS80Fx+RugUgCZUwEwb2YxYG37X6DXaFe1IUqIabnbzeMfwg9nYpyv+2b8VP1QQEK
	khqgsJyhgyhiRr2bwgtjkj+B7N8awIEAWQdSKFMqpRvpKKEaiBo1reOeVE3fjdCaGPK8ZfieTzC
	yWT0cLISzG3JeI9Uq
X-Received: by 2002:a05:620a:2601:b0:93f:115:7338 with SMTP id af79cd13be357-93f29d66830mr1237946085a.54.1792410383081;
        Mon, 19 Oct 2026 04:46:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2601:b0:93f:115:7338 with SMTP id af79cd13be357-93f29d66830mr1237940185a.54.1792410382478;
        Mon, 19 Oct 2026 04:46:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e19ad17esm60581775e9.3.2026.10.19.04.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:46:21 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:46:18 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
Message-ID: <rpsezddufer654mndwogaguvriun4i2lhu4nnosedz2h34qnfk@s44v3tjrrnnv>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-7-86c05068efc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-sm8150-display-card-v2-7-86c05068efc5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX4Xj4CrcbgIGZ
 al5EI1mJ/rmbSPNHaXJz5OnH7sc9+YkuTUkxOjGJYG53zxL5uuD2mIMOePXcIlPbggKjqX00n4u
 GVZvGfluoSVwAz8n11KEV5vkoYJw+S4=
X-Proofpoint-ORIG-GUID: lC_GoK-YL_jQ7HsddGaSXSB8R3QEfdkI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX0i5jXt5wcm3G
 jjcRPNofuHScWXYpf6PRrFfV+vBoMqyXyiSxdEuc/gT4FoHqpcAX9G2kebVkt5PXqraq/khKyta
 TPGP5J+NIjgSlv41eZGOL0EgyNSxLMzJXrVroiM1T/SF25cT8REthcpEDedL1T7UdG7zJkuTjOl
 wVoBz1XnTSR39E1OMTjNu5XkjRtXEeV5oObq7Ri6wU4x3opDYS/16Fe0C3xBpRgoKToHj3wbPzO
 vEGqBmwgDUWrm8lfddPF3IdWgnskWAmaMuNUYuHope7r2hl0UluK2x3tgcjPep4AsEe26Ljq2K2
 xev66cfudIWfGOoAYwKF+rQXwndGS7m/9dcHXBD+Fc1rkTNGRhIlKwBOn59izgWbuFQtAfTK4fn
 xyVFz72rLHNmkTrVSUONYf2/yXadtk9wyqdjxA5vyscF74o0hrkmtl6nNFSyJpMQTrXIRIpzamt
 0UcsE79nMXIRFqc1Dlw==
X-Proofpoint-GUID: lC_GoK-YL_jQ7HsddGaSXSB8R3QEfdkI
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad60310 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=No1CG8Rj059PRq910ZoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-19 14:25:43, Dmitry Baryshkov wrote:
> The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
> the wrong address the mux driver fails to probe, the Type-C controller
> and the DisplayPort controller keep waiting for it and the display
> subsystem never binds.
> 
> Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
> Assisted-by: LLM
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
