Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D9D42E40C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421755; cv=none; b=I/1/NuUhvM2bxrltKQa83RYQi9rtE3crpfgTRl4ecU+FAU5NQVbqybe9BHPh7YvyiRtF6V/7r5uc/R99FyJ5tyqAnnP47U9SneouO/xFGb93hgV3YmD4Cuuceunns+2IvcXkL2dJK1ZafAH2XnawqDmNJiQi3EiAnRaO9lMCdWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421755; c=relaxed/simple;
	bh=AF8+smH/cjHnj6tf2C5BjdXBZT7dpf2B5g6nMZvyf9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+EOunfXkvEbyo78LJ85rN9RsSSZoGcN6BT30U7SRsgAy1L+MOW4awYe5kQ4G6M8eh/ngj9p19zFEeW30RjxoNRoHDAwbREYUG2pFuzAafzvZDguafWHbSPnAAGf6u3idTdczbebqheAx1VBZitev9Pmb+CxcYZfT06krnrZg4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHk8LVq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EyyOpqDK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHk8LVq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EyyOpqDK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lK1E3113932
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u87adjPXd/a9/pDAb++PYN7u
	/khN2/IMaGJs1A8fWPM=; b=OHk8LVq7Awz8FhAOG1z60y4iTf9ol7w4CkY9WX62
	Bt9le1Gr82F2RJETbjvOA5kBladvzUry58tClXUzNrAtFq9IZAfdd1RBnPna/xnQ
	B4BEMo2SLCql1apwzWgt7HBmI2ZpzsCyOpD0oCV8lb2FgBvE0ewEtI+DLH60jGzt
	eTpDhAAE3OLu8NsQpEA5kpwc+MGqcBExZW4Rd6aWBfwsMs+4NOYWuBt4ila+yL64
	B7a49qt40T+CvLOdKDjMro+2f9oq9iSiWC6tXkJjGjouPYBCQz6u+scdSan9uAVM
	WPR4e/U27l1yyzPQVFm66rYO+nqqwQNsixMau/+zB+aVzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjs04t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:49:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390a2c895bso545634985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421752; x=1789026552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u87adjPXd/a9/pDAb++PYN7u/khN2/IMaGJs1A8fWPM=;
        b=EyyOpqDKMwkAMNA5wzPW+3ns7Fgbq+JvfIBz3zrLczjQpHQaWDq/8AE0XnCzEjiw7y
         Orpx58ErI6RRvU17UzPYB11NHSLdX6YOxs6IFw8acGTfqRmbx51UiLLW7ZGfQNrXfV0D
         q3xMuE78hE+5hBEyObpmsB48CyDCGHZ4ox3gVEl1O0PvG6mOrKUcfwV9fTFAtGI1A4Ml
         GiDeStiFmtHwrQCMaDB4mXq7jPXv6ajmb7jtNFfnKl4YrZtegHafnrzeHDDksXG7wuhb
         H5/U86Io5XYXWRii3ZK7HT8WH4TfeliD3U30+cwJmkmcSU40wmsiFk/ief5OtC65olNM
         XzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421752; x=1789026552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u87adjPXd/a9/pDAb++PYN7u/khN2/IMaGJs1A8fWPM=;
        b=iI5iMy7FdkjckOWRrrMfCwAyyj6kZVwt74yix6+mhcj4KhqMt/0jwHtktsm5Z9+N77
         46ZILC5hOx2F3YykrBiI6R+X3SaNVVWKlfpYx/Sc43dbrq88Goe+eXnOCwhSq6pJIZFD
         Rwxc2adyk7QdKLL2pVh6y6gKue6quaiMcq3T14SETBX4WUzPwBJYF5Cd75owwn5f4FWz
         IQTuLxqc6RT+gOHX8+1g3YSgqa3tlv1oEs19tyqIebZED7sHnX29PWUs9qwCyo5EN7Ds
         dqC+eTVNhHfE1hWr9rRgpCpId34g6hJUqzW6kC+PpHipPbdbH9pBVIjnwiIkAspeVXqd
         pAfg==
X-Forwarded-Encrypted: i=1; AKwUvBwAUfYoH/pgb83unHHifZKes6RgdInXPmDA0oPLp9PkteSbWLWwqXpEHjalh+q5B5u+z+3sol9fXJYUTG0=@vger.kernel.org
X-Gm-Message-State: AFuF++lXW3HV0LK/vNXv4ah8Hmj0hRDf21w6P6jvE6rMYz+v4JeDyjLz
	WalLMCWpMpzd0lhuuEBfjSkuWPJwS8mDNANY8c19aFm4E0+hq8NFQkG8Tv11ALsZVD9WD3rdPrl
	hZPJNUzooiQWeh7/pGRqTLzqmAWdGAjH7GWnPIK/yKUYVxEN+zEeEVbK8JDnY2DN4S1A=
X-Gm-Gg: AYBFou0HRmBrjKMu6BNPCLSbIyhA88dhPNzcMqa3MW8feSBn6et4Oxhe5UlYOMZ+yZS
	MtMrBsS/0iK9n880ZUtQzJqrgtsR0AyZdJ047AsUjgZRliv7M+qpF92yszvT1IrbdEM6cpiNEyf
	B82ALdqFoiPL+ujiRmHuoJ0d0h1+zaEoGpPnX0FAnb7ud+9AVhaMUjfQJbvHVj+1eKFTiSqr296
	Qpn2u8Xo1GPCqgCQlaMcEhRIyCoG4VXwyNPdIZos7gy6KcBKs6MKald8F12REiMrfwZMPfleAwX
	CKUyniRrqcn1X335HJoMP+K6JgbMdiEw5qpLIhDd81UgggN3+X6ryQczxGvybP9BdbsblOpQUJY
	/1oF3Tyl99OnCpg==
X-Received: by 2002:a05:620a:6911:b0:92e:51ee:7944 with SMTP id af79cd13be357-93960f86b8cmr793485985a.34.1788421752137;
        Thu, 03 Sep 2026 00:49:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6911:b0:92e:51ee:7944 with SMTP id af79cd13be357-93960f86b8cmr793483885a.34.1788421751664;
        Thu, 03 Sep 2026 00:49:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm81003595e9.3.2026.09.03.00.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:49:10 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:49:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
Message-ID: <4gq3i4fldybx67ac6vg25kwddrc3f6uzp44pkdlnik32wg6c2j@j75ifdkrsd7j>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
 <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfXwBhOrQW2cyao
 TWwgIUervL0DbKLKg8PLE2DTroyEC47KtdycvcrWNws6zikgdtW6OpIsypF7UEbq6nuSNecM1I6
 jCpd/FhmaOBG4ndM35YUAcmlmuymKCx+Rp2N3EebFfxAijDASakeF4OIW9/S3Bm+OyibymCwzNz
 fK91TqTM8bzOoPwToVqG8AKZ6N6tDNoBcaki87RZrGPV/4X41WRtm20EBPCMzOM0SxkRkPFwMWT
 GIhPKfxQg6p/Jd+I2kUeRMq2iO7n5FfEvCYUs7TN29NTXfqcl6pqFiBe0aHoe9ss84qC4raVIlm
 fAREVgCRBXQWfkkboePByufO7XPQ9Ii7jZIaKoBX2Rxj80j+lKcgCjO9KVu170ttulOM89/kEmK
 HM52UeCwcgYPq0rmLAjnVnHO9m+O2vLTiRcgjC98FtutMaGGwU3boUuBShucar1R/tgK3lnPKPn
 8+UfXyWkYWHddtUKAzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX1dT1dcU14gnE
 kETUmt+UwTt3mBZFxMLAA1DbpGESumoO3HWXkMsxarqh/YJ64tVDa1vH/b39cs9m3Dn2eKznNUl
 9MsJR4z2R4EJKUxqUPN0VZp5pYQkL20=
X-Proofpoint-GUID: dyu61GEax7Pl3txRZG5tejD3sXphqjrG
X-Proofpoint-ORIG-GUID: dyu61GEax7Pl3txRZG5tejD3sXphqjrG
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a992679 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yLgYBEAqgqfNvTdY-4EA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030068

On 26-09-03 12:48:54, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
