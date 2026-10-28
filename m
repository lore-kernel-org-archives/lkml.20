Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200956;
	b=Z9us6MPxIMcsOVgKurJ68RYCk1EVzVNw93Y+GGCpnlUdC6erPAwzvf1BEx8L8j5cdNQP
	 SUxgoRIeaG8RVmrggBfeaPI858VK12pouI6FrlhaUDH7UlXCG8m/AzVIDvtCEy1k6Cg9T
	 e6xja+k8fKlXSo8WkDj3SzknwM3MXIhDUXcWJPzyauw2Yo8qyYB/CRILTZB/WNQNwoh2j
	 qzh8Xetr0vAOx7BQFtiJ3ZVk2kJ1OSEuLLrSjkztBi2a3ieYMFkTvmPX+OFLLV6xb6zih
	 FO2x31djTvi4em3v5wF+q1jWqYu6zEZMlE67+7OIfDywe3ZOTsmQuuSFS5wKHw8FA3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kCYJhvcz0tkcZ//57aYlmOVbRldIvDRnjS0JoS2KLB0=;
	b=KlsT5eZDudadl2UqFqkzfZxoyfFjDoAX6VQDBd6P9nxRkyhOIA3zgCLRgEUT4EJt3CmE
	 Tt6+wEBAPbsKYoYY8itC99yg7jm1jwBe+hqpJSDK13q6aYSn1kYxefZG25udlKzHoJBXJ
	 DMFDiCuh+H+o3s+d8VI3r/jBajZjLXOjQHK2/8Zaw6H72A3/Vd+htf2mO2N+KP6j9tjtA
	 6iloCB2dz31kAA+3IRPD0I2TCzrmQYSq5CkNL6wkz5I8Bm2MJzT2/oTn5cbFikKFUFTmM
	 EsgNDzkhrnX2YkKr3Fj6vB9rr9qk819dZDZm7TzDW0wSioWStu0BJmTVtvvtt5+CF9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MNNXo0Fm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=inDwGyoi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEC660A5BD2
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AEC660A5BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MNNXo0Fm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=inDwGyoi
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA1Xe966395
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kCYJhvcz0tkcZ//57aYlmOVb
	RldIvDRnjS0JoS2KLB0=; b=MNNXo0FmsZuMVCHxoLd/wyoAUempg9g9tRIApuYA
	IsmXFhtTFD60GeBKOj3L1CdOzlH+O/oPOMwLZzIZQUgsGFjelJs5Gi6qgKZq1yaD
	vWUi1gLrlioJzIblvwb7ggNO3mPPr29Nl0+YOkKqqcfh6oTQnlmgJEvJ6FcKl7Co
	/4jGd/1CNYr1j+Y0/T/5zzCFxomJO5+RtAdcpSO+r3gBbMT4kOhaq+FPdnrBQYXt
	Op0Nedj8SmEjD7kdXUR58cFGqgKqrUJZNA+onMeCDXQhAnrcknosuVcpIH0ITcaX
	7mfWicuD7slSiSfozlX++Y46jOzoqEKr4HU2y8C1EmhwUQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgj19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:22:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaab6fa0f0so1226586e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200954; x=1793805754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCYJhvcz0tkcZ//57aYlmOVbRldIvDRnjS0JoS2KLB0=;
        b=inDwGyoiF4OOP/34wRsXFATCAVk/i3XrFE6wo8uYkuEH+Rm0lL/kndHt8FVK3pWz1y
         P0hbu9WXXzYtZUMHXKINOIEqff38u9djCQVbQD++LF1SMC+tcDmnp9rnpSzPhDH9JwYN
         De9hlo7nGfL5jPLCdSZ7GLK83yoid7d+ifYsqBvqS5cli0y5OLFxJvbb9nVL8h7qBOCj
         aN0RCQy9HfsfDBGUucgXc5O0vNHMA6FCdB5sw4a8is7vWMoTfx6p9rYLP2rh+8qPGzU1
         QRlGcxE1HrSKPEduO/CiVUZLMue2SUFrC4YvMmmxiiXaTztdRIE8GqkK/RPqrohhchmy
         o1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200954; x=1793805754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCYJhvcz0tkcZ//57aYlmOVbRldIvDRnjS0JoS2KLB0=;
        b=HSID6KuyRBbXthtZPOYfN8ytq8AZm5xQRPZFxKkPIweF13pF/zP/UI+GPmNESSCQFI
         z5NBS66hHZak4npbZ34YGlUYzXoh22596/Qa+QwzJP8cYEVqxONIqpkgE8rM5VJ1NQDg
         lWWjluaCjmlK27tIyVJ4k6GGvT3lr7K99EZWJIn9LOX9va1bxBIKaenGOsNNGVuWBK0C
         uEAv2G7wkCo5CnLA8a4mtUgQSxZWrys1dljR9zOxP7vJ7DAyzw8MUc2YZIkd6bLjvpxK
         LTsaXn3182dhuEQHtXVeboj9ZXrt7VNRd6A4xtUx6F1dxUxZDslrcT+co4qd2J1Tyqj2
         B+oA==
X-Forwarded-Encrypted: i=1; AKwUvBwNMHMR14YKRqaF7RFxaHjCuLCURqNqAZ0WIUuY33cpmKebqQsNEttl18/s5Kymxn4x1zMCgwUl6bZhGeo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKtZLXJS53WJrKRAewDvvY6LJC3M714wtW3QsUfXKI6UCPq9nz
	9pzHJdGpcjg7z5W/0V5yBBC+du05cKZBkHZS42o7cmU39WsKqkdGiMcSJtdCv14kmm0sox1Gqb8
	4/bMKaEQzu/+VurqPo2QOrgmGyQjDa+297BTygimtA7Nn84y1TIb3djfh827wcJmw6SU=
X-Gm-Gg: AYBFou0HwjkdhqwMgYW0zuenAPyQn1rLHBf2cdU7+pD9hFIh0pUPdaktBQsX2q9IfIh
	HTEbQw2Tf74caPMq1Fnzlz6KCB/G07IMMLe2vV1EuYDiSu/zCL0Z13bXapev/pRbdEBW9rFwe/J
	ib3ATUO8uLg2Q99XB4wGe1QRGWO1r+TuP55rQ/21OoScBUJUSVlP7VWCXYFHOCRnOGcVaNZCfW/
	jphBOCCRvpbN3eLJ4MoIHJJ6pQCH56q10+OV2HRy/JQ8IYzkPKSC1n+honTTdog+0M0J+J5Is/+
	7VGqwpp4Po15pKrWW2W5YL7AfEtR5oY5HtY0wZmDyiu8kZd8zSY1se3JSXrLR4azRoTSq4Cdrb+
	tiZyDcghl2QrqaIljWkGZMQqZC1jJpHUtGRWTDrQEUTyyfiSu4skYmTKc4aW6sTpH5A==
X-Received: by 2002:a05:6122:4d13:b0:5ea:ddfd:3e99 with SMTP id 71dfb90a1353d-5ec4cbf4e29mr1354969e0c.10.1793200954352;
        Wed, 28 Oct 2026 08:22:34 -0700 (PDT)
X-Received: by 2002:a05:6122:4d13:b0:5ea:ddfd:3e99 with SMTP id 71dfb90a1353d-5ec4cbf4e29mr1354925e0c.10.1793200953762;
        Wed, 28 Oct 2026 08:22:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm30560833f8f.24.2026.10.28.08.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:22:32 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:22:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/4] soc: qcom: smem: validate private entry list walks
Message-ID: <mpnzjjzlzwsv4qe25f36ox5kmxcztpgxf4lpxlmrmzqwhfiuwl@iquwzzn3y46v>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
 <20261028-port-smem-v5-2-121257d490b5@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-port-smem-v5-2-121257d490b5@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX0l/DErS5GuVq
 WFTZggPcFExMB9JY0ids+dounzKBWB2iMC2c03cAf4ChgUdqLPw6IHnsENLk1ifLb+jAwV7GLUV
 ecVhChQidbeeX3kxgD0o/+fmuIpKuvTbnHOcWUpOPTbCTn4dKnk4ulUZql5ukb2YRFqvj5wrEg9
 9iURmy+YXx98masL81oBuCbiUbGLbiqweSnaV3dQJDlcRa2wrZ7powr8T9Bdl9OyNzVlVSvRtrK
 jQkyBpFiJH5MaZUn745qj0vQpFnfK0Ky4h2CtyriNaq26+jSA26a1SJmcEESLjDDkVN/QCrzLTe
 2ESxpwCZJtF0W+zIZ7IAU2+cJtMWg0dx9wliwtZEGwHLEWKmdrTJxKh8BBZDQ5nu+oW/4lhTv82
 fp4tehf1KAe9jGoRFUXZ13dwmNac6Xg9hx1ebSYrJSlbvAJ3zIIx6uuWGduUQ4g/w0+CEWoe+48
 c47IurUZLoZg3DZ705w==
X-Proofpoint-GUID: L_IoLIeqYo-8obHn00ReXWE-xMlRRIy6
X-Proofpoint-ORIG-GUID: L_IoLIeqYo-8obHn00ReXWE-xMlRRIy6
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae2133b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=LYivK3g_jumZP2eLkpkA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXycqjkgycZes3
 ylbHShSygyHvnfsNCNyFJOwOL8LzBAj9P02IT2a1kQ2z9b1GLKEfQpdaq7nrxx35Iffabm6s4RZ
 3eISCc2W8V0/TPLz7J9RshQ4Bx9T2SE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 10:33:49, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> When walking private entries, use the uncached/cached free offsets as
> the list bounds, require room for a header before dereferencing, and
> reject a next pointer that does not advance.
> 
> Skip the cached list when the cached free offset is at the partition
> end.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
