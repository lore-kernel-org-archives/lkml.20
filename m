Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1BF371860
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851865; cv=none; b=L5aKnwKrVoWtzkBSHGCboOPOYCherfhcSf9kO1gAGM/zHd8nCNWMOYBIc+6P/F05sdZQ+afEt4OJc/Q6fKO0QbH6k8S8uaXzXchp0suuQBiN29a2aFNLayzG+gf9SfuGaPcvg8xG9lcTEYosB51QsKezFCX0Q5qBw4Rdj0nCfGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851865; c=relaxed/simple;
	bh=yA3DkIG9wLceIzqY5pH906S7W2EOQlbooZi/3IyjZXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RG4hEUeFBdayzW4papxgcfXV0z9Y3enmg6CZ3euMiR49704HuprHZqdJ1VEyXB7J3mWQJJZwdHWlPPrRXGH1ECcP5dwRHcJ1kviHBsf5BzTxNU1TMJtQJO4ZsgWHUd6pJuAz9mflAJzYFnENhmjYZMHJwo+hhmHZql6VrOA4b+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuZpxWIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZv+WTGy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuZpxWIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZv+WTGy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M9mp1521653
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ubwlFPq4WID6HMwM3Ww8q+VA
	AJmdhFmvzLLU9Ua8Nbk=; b=WuZpxWIP6PoxyE1KUVgXObHpT9XBFF+wz1A1tLRn
	Kawaj8rwBvZfQlXvjeh8u+I3UM7kzEjSlgaPtvzgC7RcUoSVVkoUKJTDThSwD2Zf
	11Q3ZYG/83/CsQuLJun39FaCEgSW9j0dQrLLQ5XWt4Fu7eWMkI3r+6Tw902Jlx9B
	gRQhlIm8fVfUP4EYUTxLdqd0Ug+p6mWOmWo6d4Lc7uKPq32J3+RZDETfTt/+C+lR
	kqiroop2AZIv+2WxbgGCiyypIpe+CtbelP6M61PBkcRaPjpSzvEAyWSnyaHY+4E3
	z7ZT89TGZHNKl6Pdsg9XvyJ1EN8LyrhgBHJMAN1/ICBAUA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077jges-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:17:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104ba8bf51so61414066d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851862; x=1789456662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ubwlFPq4WID6HMwM3Ww8q+VAAJmdhFmvzLLU9Ua8Nbk=;
        b=jZv+WTGy4vEA+cRhe8UreZwnqOs60j6/YsSN2C38g9vBIHG7ynt+XXLSGS4T25Qf6h
         OEHa/s+gQpVh28HgRxQGJAN35YMeOpeWhaTxOCfLY0vC8/wHRXWSbRxRvNgpkM0HYecX
         TUS6NHYt3amL8/IlNlKq8LfE4V/3PHWVYUIaYIMUF1eihIi+vohnCd86bkVkqfYdErMJ
         g9QLEMgS2U+JNvaUxZnXB93dlb4yMtGtacpg8WkKrsa2u/4Uk8IyRMHwQiP1InV5uZb+
         F0sQtCcYsbGIQnPbqxwUgGDbSu1WqTJjtjH7nqI/rLgQDZtGw8ncJcr4R53DMSp8Ikkr
         prKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851862; x=1789456662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ubwlFPq4WID6HMwM3Ww8q+VAAJmdhFmvzLLU9Ua8Nbk=;
        b=jM/UCHgU478iMPU+BbMc3NL9BfUP/gDXyQ8sLxvk8LKfxFQUUtdgPmZnyVer+Ex5iA
         I6XdxB4xg0A5A1kKhLR+Xbxm+1d5Yp78TiYLmHIPJfmN95sl2X+L7ZNUCPodh9azc6in
         XgyGgP1IpPhTTtAtoFMyNEIkwGCMLXNoz/8WtdEStwhaESppPgNjk1nrZvFpEd56/U0d
         eRgMS9t1p7rP6ZXNv7v4p6eYmssHI2zynyuUEAupTwZD93ivDTiLUadEiMB/ieOQK/sM
         ggWhZ3hK8KSZHbaoNstcMqpVgo34hw4sRPKTjN0EE64WgF+3vAZVJNk/8fnjjcHNby8A
         13mA==
X-Forwarded-Encrypted: i=1; AKwUvBwkF+DqaBtIafaWiyyoAmi05GlqFVxebDEOfLOzU4fhTcNOTpWO80wG8sHm2PL+8dX2OtGiPzXeR7ffNd4=@vger.kernel.org
X-Gm-Message-State: AFuF++kcezBo4d/oB3YlOYKBgGA3as7upQw5XPW+YqB2Y7K/QclKVJpD
	7foJFJ1rkJmdcTgCMHTkaJ2QZoXMtRRRSukKuf2l5osJ18mso9VEn6/F75eXhfdgFyq8bKMiWRe
	9BU2LiHzVHCW/nkwV1345wDbyKivrCQ28zf8FovUEFt+4BeSWNVaGMeNRR13R0rlPlS8=
X-Gm-Gg: AYBFou3afoSmQSv7S41tL31nNnKsBMX210eTFsauUzUZDrAxQ7DNoI/LLZFZXAIjRch
	cWpim9yn1N24kjGt1wT2lrz2ofz18fnDE4fZB7GUVSLYXSvMnRpIGaJP9s8TdHl2Nlw4mZxvbV5
	DqiYYvN10+nvZpGGljb5Bkcur4qCIjYT69ZE2Swk9whu/0ZoR5Of/V/ia9J/AEwlvbZqqX2NJ44
	lOqrM6+gEODZbsPtgXNHEmdteRg4vnIODIk/Kh1Xv7DJPasagvCboNqapcP3rcYy8J67v3Lbvat
	HVZlSSzirwPuBFHsJy1LtZzbMPo2kmrHNFMWxxwY5GN55r4CS21th31em/o1U4ncupq8JtoYRX0
	y/Mmjuvq89K0=
X-Received: by 2002:a05:620a:7017:b0:939:76b9:1d00 with SMTP id af79cd13be357-939802efe0amr2984177985a.9.1788851861949;
        Tue, 08 Sep 2026 00:17:41 -0700 (PDT)
X-Received: by 2002:a05:620a:7017:b0:939:76b9:1d00 with SMTP id af79cd13be357-939802efe0amr2984174685a.9.1788851861424;
        Tue, 08 Sep 2026 00:17:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm949579995e9.0.2026.09.08.00.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:17:40 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:17:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
Message-ID: <g4ql75tuwtzi5iy7z43ee2jcpwfxhqu3cqhcgzodbidyb4h6zw@zm6nqwi3eobs>
References: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
 <20260907-pixel3-camera-v9-1-b1981f2d3291@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-pixel3-camera-v9-1-b1981f2d3291@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfXwAwu+UVausXM
 XlmlUtOpwoojK1WSZ4VCtxynoht9sZDUzHVyb/9J3Vvwy2ieb/jyYw90mOvhjk79pNz8X9jON77
 fLl8M9JR6l4IkVU5nC/+NIkdrzbWJgEnaFJy+XCFPgMBprrkAPnO7TxcrIKJ/X8FKjr0/uaTleF
 KQ7jRjc9Xwz0EUzcl5vw+DGskYh0jcQ30kdoedFDcCroA6dhE37KWKDlHq0nosFDMlv0GRXGRa7
 EMWGuyITsO8V2hW3okSMawDLCbihf3LyBacNEqNFtZX5i/xy+bD/rfrn0KuB+0I/csyP+HR11yN
 3/nlSSMxX2wgIFrw2TXrKAA029VmjjVxBe/K8eGBsj261p6HhAzwTWNEoJ5++TViJekA+IUUoGn
 AOd7BbCwMzkFKvaWQqqchP7pJ49VgvnMs7GS4UT55C8ScHYw5Tp89BBtjYZ1Fr7AiNh6aqIzkh7
 SuHxlcjzz/qprY7fHug==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fb696 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: gwQJB78aDqSuK-SyaU9zXtiLsAYvIpVJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX4P5BawOcIaea
 HgopWRPGUtDQnfzrSoNB6jB/iynKwRSfyu8D8C/hqeoWdddbwJnFP3STDlAkB2oqIPLuHk75phC
 k0vfTe3e1qpm5C6dl2SB3aYHC1dYsXU=
X-Proofpoint-GUID: gwQJB78aDqSuK-SyaU9zXtiLsAYvIpVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On 26-09-07 17:58:09, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
