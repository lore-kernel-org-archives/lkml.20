Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617CF4A5EC0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021620; cv=none; b=gj+p8hq16FUSfvbSfQPKneAmz+qISWkszFNp7hHN5jjECmR/eA/75lyA836Fgwjx69FInmfxxlH/dLydxwgCHYaYbZY184P9Zs8RYNxAOmh4C0t9b6L4IwzBMe59ejSMjm4xJF4qAqeILTypRv/Y7ttNQE8G9Rq2Qmfjsh3ahJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021620; c=relaxed/simple;
	bh=VMNpgjn2vngkCQ2fsUTVUd85vdIjXbEJ1pGkDNawlvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8PWypDHioANCEnXszKNVvtIhYeTAojqTZAGaPbenIMn3OY7Zrh/bvYNiHhlatFdVaJ264gJzeStOS+v1vsUsRhbKIurO/qXSWUXH0uo/DUGlhlQv6PO0y16wI6HWy82JRzISzTIdU9/DDQ5jrxWPiG3saLvjnybBsbpK0l3VmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aythbRuD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOWOwLq6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aythbRuD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOWOwLq6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENGlYn4167047
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MVSX185AgSrbI09fOTWvij79
	MrTIRjbwy7Bb3zRoM0M=; b=aythbRuDEL9m8f+kyN/1bOuBhBunx6ptFyZh24so
	rRCqeRzuKYYbiLbOs6kD72uXjQwEW3Dqd8DxtEhsF9/XIHWGDqmEN6cm5TznYK2g
	sARAAaLbJKes6c8FwRfRsDtIuTiXypv+LGPMtcI+pVyt3WJIjua3auH2ULzxC/34
	INJiqzMF2kIwQqDCsc94H5C5ndTcm56ptcdxs2lJEs8DioRFpRvva4nThqIKojEp
	j5ay9f4VU6s7nvhnTm55iXzMJq9fJNjfUsmcImMLpMVP0jWQulTTFJW8JwAs9va5
	wFNVnKRjQd2f0zx+ByYY7iEH3VyZsZ3njjPSO0xESp+INg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hac231trg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:46:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so189868985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021617; x=1792626417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=;
        b=UOWOwLq6U/2zcQRVr9rt2W7Rg4XxmA8uUY4rIg/1hakFLV2DqqxPIA58e7YgOKvz5y
         itxY63uH7ftVrUt4PTT51WbVOUPKVhjEAdLMZnxSrtBECMAEN7fLrvvSkZG2ZLYcIz5H
         qCOocm8bxcle1xUJWx+pG294f8zGXLiwbw2laSCNMQlScUiGO3IDcLrZk4KrgPUKDB3q
         slltBjuLb5yx+T1Gc9eqZ1FKpPuaAA5TChHzYnG7yenfZ1IlOWjDN88Q685Wdygq6Bn3
         LhxRr7EPn5ZF+ROA5d960UlRPupc3lt2A6jJUmKt2f0+3QjqFprrfDpCIiLP3xHWW32h
         HmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021617; x=1792626417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=;
        b=offyApU1Qoo8XuFqUFE4+kh0BizJrMz6+EgQ4T/KDeopqC8mql4qR71iUT4CfqxRZv
         SINp3XVCR09m2WsVLqdNgayYvxdZC/CDNz7TW1n8zTzbYEc1WgRCdUDhlzv+gTum9PqZ
         1a1Id2XGQ6JRYA8x8CNFLLC4+C8Opy1FcXFSZw00VBXBHddH4NZLlxgLCpy/5FCxt3oq
         mnp2zBSxfSQKr/+HM8k2xlD4wQwxAc1uA1Aoxv2YiuLVl0QNdPa3xsE5mkySJ6Z6jvfX
         Ux7e/lEnZ5Ejh4jOzan5AVEd+HBGymYbM8PeW45ruANN5hlbl1IS4S2Ry0ZMh+HgH06+
         vstg==
X-Forwarded-Encrypted: i=1; AKwUvBzq8wOqr5cFg2lW5MJMzJ0o0cY1TnVl/XknCsnxcQLBc57EHepb4zoUIVIpDseOxTgLTQPZqJDAj7Ut14c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu7R6VLajOYQhzT1xuXwBGgtGNpW456CX3p2Wmc+WH4h05Gl0S
	cE/ilA/e3L+O1ZUcvklthMtB0/YSHbLzM92Yfcc/eLUUHtFO13QcC1uvLiKHLVdRBKeP9/hSUNu
	3DewNvqAvWsykt4qGh9+aLrsMccP7puS4p7H5JLjPhGzsI+JeNz4Z+mS7fPMokJlJZJw=
X-Gm-Gg: AYBFou0nyreX/oAql5Ts3nSZNOGbPg4weLjWD6cmu/vFjguF6Cdfeo1I3XwUSUyaWab
	kQFNJCxz8iSKZWt2oIqHCqDlSGQqP2UqGfigO76D3SEoP0I8dh/3Rlim5Pe32dZmF/buW7nsvMh
	7gA27u9YzpAeuvXPJuMWJNlaM3V+kGkE603fKkhi34SdS6ogDHZogHlCZ7cYh4Z/vUbNTgtTg4+
	9AKhOoSXvs44JTbtRwe09J7Gc3ywMwmf9Je5iQt9y4+JKGJn1GEM4+c1/VP8tPCWBUyQuYOBvpW
	OiAdYfWUnb41N50cUKOk3Q7nBz3cWBujy0SDNBKVP6Jf0snayX9UX2IsrKaCCpf77gjlL2cyT0M
	8LWOXPVR5pvtl2ZzXYKvt8hHJ333diikH1Lw3w+9CugeLEy3RaHHxiajXWV7L2X8y+2BZbI/jES
	ISypbjZ57GCTEc
X-Received: by 2002:a05:620a:2701:b0:93e:d364:c9fc with SMTP id af79cd13be357-93ed364eb53mr2144274685a.5.1792021617546;
        Wed, 14 Oct 2026 16:46:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2701:b0:93e:d364:c9fc with SMTP id af79cd13be357-93ed364eb53mr2144271485a.5.1792021616901;
        Wed, 14 Oct 2026 16:46:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d973f7sm934666e87.70.2026.10.14.16.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:55 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Message-ID: <woavboapzszyqhm5qrlca3iqrlq33j3ehy4u4mxsib7emre7yx@4mvuaqk72nj3>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6ad01472 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=M1rqeeilqGQJneHCTBQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX6MsZCp46zT9/
 7647HMITBmC211TOOAIb1ZG6fAtRwYdXWp0g+70NOa8J2jKTSuimFtZ8iQYt2gFUHWaY8h3grh2
 4Nhv0bJ/IdJrREsTK5WZVMK6Ay6ii/0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX2txpoeGt4hFJ
 OvzL2T8Eu0gUUBrYK7vxH+7IKM0EELzriHJ70Zyums65Zg62uFz26nUf46a3Zy7VnIl9YFl/ELd
 QCqF7IQytYfD2AmVlx1i9L2OGv3596vL76rYXA+xxHA3kgmuyj1LUwmI+Mxs7JE1UHi4R3qb6ot
 b3w8ULKf5EDNBPbdvh+o0Rm6sL01J4FEnySYaAMYGCbMB0m98ya3s3Zre4HNbNi4whJBoMVZKCa
 20vRl2TSKM1yUUjtlVbZAdMc+DmanBIDQ3wzK+5EQVLe+G39F95SJmY9Ubii26LdU11sFBBcwxG
 mpvjeesr+m1WtYUi/5923I10w7ZL77cBAN8wkz8N2FIT5oTTbXWFjIWTlHdtuAjcujINcbs4D3o
 wRen55tWcs/gVH7BtDof3hK0Y2hL9H0LzVztyXIdRV+vTSeo0gqkL0dg00M28ebpBZxQbmF3ZNp
 CKkD9QJTDWtyy66py6Q==
X-Proofpoint-GUID: VyBZGH1M5Ach2HdwNe7ZorI52E7t4IBP
X-Proofpoint-ORIG-GUID: VyBZGH1M5Ach2HdwNe7ZorI52E7t4IBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140094

On Wed, Oct 14, 2026 at 11:31:51PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up mt8390 Genio
> platform incorrectly announcing UFP_D (upwards facing) support. This
> feature is unfortunately not supported by the SoC.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi |  8 ++++++--
>  arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 10 ++++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
