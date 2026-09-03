Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43338366DA5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427195; cv=none; b=Onbk1bYbqXMq07GnYFlergnivuqFiPDUoTpLyTT9NlMkMwyrrcltJYGykpemC2MQhb1SbSsboLUgzlGDOw7H+Mr5ZtqIy4EZobaNsapw4AIgff1riwnqEO6vcuqXD++vlh3bnyQW0mzOdVjK8zov1z7GGO08EkX8KuvnB/OZB2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427195; c=relaxed/simple;
	bh=4dMNKcjwNAJVD8eJ1dCKkT2t5k2LSNFyce/zltu/jt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOlDLiF4mV7tV8On48GSmtiPpcDBQMBpnG+o7kfOffq+LA/98dWjU4w1S94+SOTIyoIFbexyLmfnT80gVQ25j/p45b8KXmy4gw8RKm4OYI+amsnAWHjcVk80S0Zz7fa0g9WUpCuXr4ndBMFiTjY9csC+V0X/NB66GRjENa2YvEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPZp4N6v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8qd7Zts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPZp4N6v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8qd7Zts"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683926Yv3035740
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iHKDoa8Z/DIcsHPCK975kS74
	m2aQbfHxcRJjEXuiJgM=; b=OPZp4N6vd2A+AOF+1f1iPndJXGWoz/D0BQkFLLhn
	vDXvPZPjkkYy+cANcEeMKxiWZuee48HtIRkR9KJ208k+TWLfXIhivadMShLMSb32
	JruaJpDM0L7CZ4zNvbUvjSNHyANXOE10GBtPLUOYwGHAuIUO626+yiTEb5DnZNPO
	6V89rDvdIx4aExrxDkkhLZ9ivDOHf1rguSPnYsBpdPyfI7AfiO4GXWoiAsbSF8xf
	b7NsmP0pKscte3B1Bz93AMv3u5ck5uPwPLIr4Dc5+sP49KrBi1KoRMAHQr8aqvYz
	WBRrjNs6Kqn5Kvqxvocq3iiXeyL5310ZHUw2IwoPeNJ6Cw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d1074k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:19:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9382f9430deso400031485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427189; x=1789031989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHKDoa8Z/DIcsHPCK975kS74m2aQbfHxcRJjEXuiJgM=;
        b=Y8qd7ZtsicgBmlCNA/ymThZu5gf3Ds/SRF4Cv0Q3IGM7wvrzTW6q2GtUJ8QcTAaL2W
         6EbghxLJDytSY+JmVgZvlpYnG27XNoaNfogOMfpWRJEj8t4ruClBv/6TdyX2BJv3WseJ
         00M4dJJC1Z3JsTzB7VSqBmFHQ8kORGckntK1dYiulttkUIzEm8E2Cy5Bk2OaFD+wTGNu
         s3v7F819Pm6qrn0TePqaZt2jTGjBBGOnfXozu6uSVNnhK4FCTiujizCqplb0edMu+4yh
         NGI6EvgJnhvfTfZfmBe1umuuQ9bf0XIm0vgsRejINpnK1i3rBRTx+tOaC3sLUVuCsJeF
         MspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427189; x=1789031989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHKDoa8Z/DIcsHPCK975kS74m2aQbfHxcRJjEXuiJgM=;
        b=WONVg5B+bevePn/Wn6ufkbPydxVtAmYLjqftTfiuhkcFVHIddfvi6PCodVov47b3Np
         BLMuW0rqSwD7PXqaFgJ0VBD73Q2sduX1SathEUyueSsIRQrCHDxA2RD65HiRPQVyFxan
         Oum39PEDURYqJEiFBuQdv12YUZjtZrDzoljfdsZF7bzekIhqaXVJofR0s90KXe+D4Lek
         pD5KcHhcqYuzOZv6Q/i6bGAfJJgqwjgpmhUi2l7XFPsFrBRoYLNOj9jxcFR2CYFwzMaE
         JU9oTwUBE/tOsnWrPT1zqVgugqUEXDCagKoedCJx23UyDho4Y8Q0lzY0psudc2pcNRbt
         CEnA==
X-Forwarded-Encrypted: i=1; AKwUvBzUitdQ/Tx+uwpOYJS36oSCKCs3Iggp8tji6pfwkmpae+HZWaHEPpEyhdrOkdDS/5GF4vMmKqajrN/ectE=@vger.kernel.org
X-Gm-Message-State: AFuF++n3BhfG7AHdtUN0D1lKjt21HBn7oE8TjNwX9VuM179ZZKWnFMoy
	SAXXK5Ee5KG44w/nZ8MF0Rck+nF3gvIz9osRBGYCt0/ZFX7o1U9u6TmCUiMak2nXAxEUlFbFwxF
	/ln/dlfudD8WebCUengxoZPR4+qZyEl5GR7nwcLgwQ7MDqAibEgSb0bV6MB8njc39yfU=
X-Gm-Gg: AYBFou121FPw12eJBEN+SpnTtsCPZr/UJXe37s/uJUDL5iBmxws9fVDfVADsftByagC
	rCngrvO/8hawnVIWnHHQ+QaKVwPmoma4aPuIeb4TtiIClEn1cE7aPAzr+eSRti522jiNcQodVo1
	RbPL6Smqura7qnlDYIXX4y5lTrHM5w8BfLl3GcU7tVX+qnaQhuyVsAIsAvi7fYDfDDMHf+Nu7zx
	YR/dsnA7zypAywREaWWpuMe32rxO6hSCiR8/zJnCn1SJOsXx8MbdRwWD916HjOoogLIgW0dj450
	jHotYLvJ/OlDsc+8Zs4N9DZ8nrH9ql7Mv7UkVDJVRJPROSsoUgw7jRxiJFV64L7on6RZ34e75KB
	18C2Bv+EF6bQE3g==
X-Received: by 2002:a05:620a:19a4:b0:936:ca57:25da with SMTP id af79cd13be357-93960fb0a7emr1141584885a.37.1788427188928;
        Thu, 03 Sep 2026 02:19:48 -0700 (PDT)
X-Received: by 2002:a05:620a:19a4:b0:936:ca57:25da with SMTP id af79cd13be357-93960fb0a7emr1141580885a.37.1788427188279;
        Thu, 03 Sep 2026 02:19:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm12265237f8f.16.2026.09.03.02.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:19:47 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:19:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
Message-ID: <3kulhbkdqqexdl2fflc7ci44mvfzjjpqhcorg7epdc2atlwee3@tj5mpzdsir44>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX5DC4cRU6/xUn
 SYWW9sIl0UzcOCDqSXbtoIQ2f1lxSN741bQsiDyXMqEDDcmrPJ8KN0wtYT2/s7VGDFPyUmEUaZR
 IQ7zGSXQggXQeZ6V1iTvkfLG6W8K8E30LdYtlsiAk3ExYJGWjORV81E6MTID6Q+KkRh9p9Kxm1M
 6G0fjBaPIkk+4XRB0XRZUGYB770st7XKhmw0bL0A+gMo7d5K9VsN8nuAsMLZicHt7NfJIcVd/KD
 D8pTSwYU60QNwANFhSaydJWyyL0ueLU+6GFygJM/b6H1wBwCSn/HsQCPUvRp3/j98LZHnJegbdn
 zF1XyF7AGSehqnNzZwyap2Uv7rFIpmwevrPXyj3sKs+V1E6/dF51OPC1lxNZPqQDkMxpSFGi54Y
 8FseOZR1Wjh5H+63yvFOeLUTaDplEy5a2XCTq5vwa9KhhjUQECKoEVPyYsOVkUBrm4ct1Dwlhyj
 xVXQi8+zNwb+Wew4UsA==
X-Proofpoint-ORIG-GUID: 75rMydB3tJsIGJZ5PucT4YFVMdKQPQ6m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXwaCFzZKMEpod
 i5nTWO7rMzLY7zCwYS9JlI30kDzptUVSoQynwJDAlRUJbEicKBz1YzyAQYttg8RVSDcDTnLDv8S
 l4IuH46O8JiE4RE6NVXulEQN8dmPWZ4=
X-Proofpoint-GUID: 75rMydB3tJsIGJZ5PucT4YFVMdKQPQ6m
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a993bb6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4mQfpWPmsH_nVP9DenEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 26-09-03 02:13:32, Mukesh Ojha wrote:
> The proxy power domain enable path discards the return value of
> dev_pm_genpd_set_performance_state(), masking failures silently.
> When the call fails the performance state is not applied, yet
> firmware load proceeds without any indication of the problem.
> 
> Capture the return value and emit a warning on failure. Firmware
> load continues regardless a performance state failure is non-fatal
> but the warning provides a visible signal for debugging.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

With Dmitry's and Konrad's suggestion addressed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
