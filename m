Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E69391E58
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852092; cv=none; b=VBBLXZg5zoS29/2WidcB2gPtee2d1LdZ+5ZXGZ2LZyPI1GZCz57kbC+l0gjvaeiVUHk/uBoZHk7eVTjauC9UPOTEFR+DvMhbXNZrdv1HHbszHiWmNPVI82nbwvp8tcbNVLFXFCnKmFjJC0eIZRqaNu96jWdvgiYr+RTL+PLyYIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852092; c=relaxed/simple;
	bh=UbArGawaOLt004uiQzVxVKoD0CYmXsvOoyStHnCjaBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDJONzxUmS0vxbYXWGGeWdIpPUIBHQURLT8AczozVpSM1xA702rfK0evwGvjLZ9eR/Dh/FyeGRFGkZCjSZ+ZPFu0vQNTtuL88hRXHInLEGqpf4CF0p2Y3bvE/AYtRcdGLAIqfARRzt+Qw76YsQpJYzTNg8FxjA9kKpCW2bceGQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M46hdB4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUTPpF4o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M46hdB4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUTPpF4o"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M01l2172912
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CT4nJKvnmHwXrIL3UMrQ8SXJ
	kJUib8CpEc/1U78sn/4=; b=M46hdB4nERfHRDmec6ezX877heZmliZM8niN4dK8
	NxyNFZLj1flK58vXQMnYrRXusgYM59w13QMc9YZ8U02VsVHYbbYRIhcBk+rntBD2
	z/aGikmrhBM+NIOuggGJY5lkTfWKhc+kGFUL7s8S28EiR2PTHQFEmsh7JODngCoX
	iPBN6tCD8/7R9DXd2u4xwlN9JU+3cWkZouJnkBPi95pYhPYfiJSQUVBpQ5rk1LSj
	2HX2SAxtgKXguEiHgTVJr51Og5+A/MiMl35hBPcn+BD0wa8BaAHzo+Myf9yMCuLz
	hJ67l1Eg1h+YQfgqgFNFRGvUIzZcwTfsHVIcvvfNGkqVgQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrj7xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:21:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939a00c45easo305365785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788852088; x=1789456888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CT4nJKvnmHwXrIL3UMrQ8SXJkJUib8CpEc/1U78sn/4=;
        b=cUTPpF4oI/6HKS9ArlIDEnjHdvi8HIXnDq39YX/i7cU19hHGrPR6DVBY6FTIOPFR0F
         jjHhLK0up+PvE1a4QeYvBsQU7/kv8nMBqVhfrY+AaQD2l2cqso4RFycqZ/9rSaSYOx6d
         31fD+JRUsnvfFXjXzA72o5xqoFbTYzGQS2ZRQBFEnaTZKysUMBZmNQSytvvZQ9E0qKQM
         BrU/Mor00Ioa7Q+oyYO0X6Mz5rGtdULF5hVi3Xeh41JmUbHzPdhXDVvfIGbm6ARmfFDU
         4s7iK7ENCohc7uyZitL/GshPqKHW94ILTfoK8G1rXrMrvwsGL+zWQfMnBB/v6dxqeTUT
         VEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852088; x=1789456888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CT4nJKvnmHwXrIL3UMrQ8SXJkJUib8CpEc/1U78sn/4=;
        b=UBkD5JimD3e04arsQblQp0NxUTBqXMlhpCqYo/EuopC/ZCFtmqKDs+j/fyN41r51uq
         QY5cS8A1uwR944bkuwl5/bK6SZJVYot+7/Kl7lc+we0mwFJ5sNjSjcSi5S4/qCVaQ+Oc
         JlPMO0gCnTNsjrQG6iHejzGViFSO2y1Ji0WP1939mz63r69GIsP9sIz1m6SSDk69/swr
         4gfVBB5Et5I3ZBUpEIEMVJ28rvVbnNHK+WHmviv3ZQCvggeZSXxh4lnvt7YTnEWHzjYL
         9kTPaOAb4w4GqSdO6DQk3O7GsZIQQNme3BJgxJkc2yqF+uwIJytCXW2HQ+ufLMrBee1s
         +r9g==
X-Forwarded-Encrypted: i=1; AKwUvBzY46l75+msTbBkFwewNFOAlMdpXGWr5kk1p31FmIS47z3ySBhl6l9f/rNaWhaDDsVRVXLETTEGaucIiw8=@vger.kernel.org
X-Gm-Message-State: AFuF++mz/0X+2R6xtjmKNh34817Sg4bieZaOqqMe2aaeo344Njfus6Yj
	zRFjsXa4GAqDbL74McdwPVRLLYkk/bZcRfPoAwf5J0yvBU8U4QSsE4KFTw6K1XIrsXMAe98/LMq
	SuQS05HizHwE4Dl4Ngpd2wq35CiRxQTIPtATvZQ4BaISrgbINzKU9T6KNd/TyXelny4M=
X-Gm-Gg: AYBFou1ehJoFUTzwVgiOZAn/uSTNl50OnFqcPr+oDJwOpr/FKiytNSu0PNzAY9N4UyQ
	geF25+XYRCNzvA1axiNSYz9P8/Z4CfgHXWK5dYXO9LBwyfIim+juyDsvFCbndj557T/2VM/0uSJ
	B0ihIZCULNSqGRR6L794VAIPixsziH7MvAXIL73eo+rbwgkqypRcno0Tc0vHiw/OB2t/WH3oeK2
	0HduCpLXOu4uphi7PI4RKoPak+EKuyBuepZZAMj86dnwa0jfQvJCTVlg3VSPvXW7e14KpjyMISc
	J1P4MWc6VcniHsAHAgb+vFHfYI3c4Y5WTMPl2+T6y/BBDKYd4RHc1FTNJgl7+ROFmkDe2X1hGL6
	eAAPyVwvHvCo=
X-Received: by 2002:a05:620a:4054:b0:932:ddff:123d with SMTP id af79cd13be357-9398042e263mr3035261685a.29.1788852087733;
        Tue, 08 Sep 2026 00:21:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4054:b0:932:ddff:123d with SMTP id af79cd13be357-9398042e263mr3035257985a.29.1788852087230;
        Tue, 08 Sep 2026 00:21:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm36575044f8f.24.2026.09.08.00.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:21:26 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:21:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: agatti: Add OPE node
Message-ID: <jncyxiupuqadcasf7te2eugg5jog7yg67h6oilw57q2hblnz5u@uw7jbabkauta>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
 <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfXzbg/j51VZgVm
 JZd1UNArj8JWPepuFBD4Pf/VJtxL7R83YJxJLh11h1Z/abkFONVzx1/iN3+zTb8rsMjMEXOlzcW
 qTsuhskwg4IZyK1RlNVZQiv3fRp+wqo=
X-Proofpoint-GUID: NEl9dNwgVb5JsddGCrMfjzX_BMczQ2TP
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9fb778 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=I_ukrOqQsWpVYGr8uL4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX+RL06Fznaysc
 dh21kdaI9r8vyI7E34V8e/HZxeDOqgoqNZfXAKR1J3k/Q3dLvM/nqpuPC0KjKJpOWp9hV5OCz4T
 WQWghGnlce2r+lLk1YEyZ5TQuNGb0V413j9XUbNsu5m61pv6p8TKJAoK5aVbjfUGKAoM8aeUFlR
 DgY3cjTFRV/c6StB8FJhrgUp94X/PSqG4N0Fe44BZDONFGGrlC74BSwCnhrQ+oCsziIlbyJglHe
 wQ/DSsYVK8mEdGI5/J7vejNUaOFkbuaYmr4pcs2K9m7gUmCOrjxcD7NktGGH645RDcPnh6d3uog
 FjhprgVgu05lERwfL1nVBiVfzgJBf59kkZiNz1vippOOM1LsfbQn+8s8ib43/ETSZM1RYXNezr7
 J4WUU7WiqwVTfXHhFJK1JhZmQBSG2/XewgyYzXmjl6MdTP38JLi2puZJBpvm17vVpViGibFcpYL
 vcHbrTmLTqms/ABHvuQ==
X-Proofpoint-ORIG-GUID: NEl9dNwgVb5JsddGCrMfjzX_BMczQ2TP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On 26-09-07 12:51:17, Loic Poulain wrote:
> Add the Offline Processing Engine (OPE) device tree node for the
> Agatti platform (QCM2290). The node describes the five register
> regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
> interconnects, IOMMU mappings, and OPP table.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
