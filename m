Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816F34A6895
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052801; cv=none; b=HqXEalhsQCWDa0H3qzCHEamQZqz9yxWXArjDh6WxmeiYue3Td+vb5H1VpOIDEUo3w/aClBZwfL2Qvg5cYvDCuVzdwdRBrbtkAOB/BGfWaw/iTahAcPV9U3UFHfWH/+vQpHbErOYidhZ/LJXrXTZpZmbNfvejy/vLDajur4uK1Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052801; c=relaxed/simple;
	bh=HhKxfqZri4OGfPWO86TNfFiRawc8WRDx4wxR8ivdMMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wz+tDggyP5r0oqln03MrJtvm2jfCCSVsL2x2O23Golqtjts9ql6WMoXi09D4VzkTXWspNTyFSaTfJzV5taQqVVC2GeulFcmw9KKunZ7b/q4MBI16C6f9yygHbzw9/zI1qoPbAh3rfDrZpD3rOdfRCLIOzwDuA4LuPUvCPS9LVwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWMeiqBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwTofXjv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWMeiqBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwTofXjv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4KBV1275275
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PkPrpuB/2JVj3QeHoZHTBk6+
	P5ZBHLDJoXGucnbPeZ0=; b=DWMeiqBqEHVh3r3sB6fUKU2AXhCac2u3sfAnj2dh
	/6caS+/4QyoMpgUoqOc2QVOc3zvRrHDuN1wO2YTZ46CiW2M11CQDEf1prnU4UgrN
	3owOi4eeco0GBjW9selJVxpLPdTCTfDfRzfFUtXg2lw/PHsBMVH0ilToDhW3N/WB
	Si62Mf/bHaxrRjk4LKrluxGrlZrAN3SiZnTEkcY+j67SRlwduRyRJtatCYXd7UZi
	9uUZ46h4t1Kmkooub0tJkgEWKcaabuRluLlx5xbaxguagD4H+4eEP+CybNEvQoii
	U/68grNkRbZSicAeVN6/e8dJrxvywGZEDcoklGSAUpoqWw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkw8jq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:06:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f80c76e6so142348105ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052794; x=1789657594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PkPrpuB/2JVj3QeHoZHTBk6+P5ZBHLDJoXGucnbPeZ0=;
        b=iwTofXjvi1eeO8dwVvyj4RLo+d57HVMKRXmi7/4r0lXWgDww9q86cTXKrRDOQ6EyKP
         OToFheiLGtc6IHBep1btGp2yx3oEvB5zOb8opjS1hQkqEzs7JhDmUNK8DrsXqYJtx0eD
         H24XS79xy9h8qycz6/TF0en74Tgxx0426cMOAfJiE84N0kvHoOxrLaaqp89KQgbXWm2P
         KMHA2CyoPlWBF4AIMTJE63UoXGmoQs30G5y+Jvn9pGMHAtCxQcwT2yseXuqzLFUIk3WV
         P4+P+hm39mx/KOzmvirbHYG91bZFTYNTjXCumto/f96EN5S553yzkRnlAwd+TZL6GGKS
         hW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052794; x=1789657594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkPrpuB/2JVj3QeHoZHTBk6+P5ZBHLDJoXGucnbPeZ0=;
        b=ESbtKotrlSEgVoRq3FevEsMQDxFaS6HBTW/0JH8bwO2mMVx6j+W9EG40FDj7fP+9WK
         hMKOq52Q3TiIpwtUsZg0QwnWGXiPpFyuQtjHLMrO0v1IpuUVbJBSb+zCCmuGtlrkIl74
         h/dPktImaxLyzC/UtEfHEYKi05ur/S8KvHjIpHDOI/JYTCDPzdW847zq302lNnb5V4hB
         QKQPfDWZ3kjt47u2YeFnSj3RXABAtOUh0alVGGQwXbpf+6w+M2orj3FTFBP1kk5Y+6wo
         xz/k4bysE5Cg0XANGk04Jk2gNzAH2XUPBMmPFOBRAqbRpPrY2ZozqCamYAfH+HhVdYnH
         Y0lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlqUWmDZ6fPSiXmU93dDunbTMyvMfUU/Za/97nz+oZwEv6yvWmLAqUh6s19IH2xTIM6xBca1RMXcnO4xM=@vger.kernel.org
X-Gm-Message-State: AFuF++kSKjHN/mTV21Po/CPgYGy2z7pXckfEeA/WgMmear488f8744U1
	pPU6gzZ7LTZ0ynqzsqJ+KSuYOsdQfyv6MBQoRXySNZoHErTc7dQCrdpr7NPuZdl235Ya4Mo8MT2
	MlDQTQdMwvGb5LOQb6GKMTS+ENlRkHoBXlyE2baQHWVHE8xlFofjSK6Cvb4I90g3B7ww=
X-Gm-Gg: AYBFou3hqgz/iMt3mttE1jYNibjaja7VhG4yWL3rqR7z5yRZOhLepHQlEpW/9sRIYWU
	31yBjiMBJATqiLg0iC8v92VMfpO1miT7sg7szfZ3Ea9Cf0lsjin5NSEJ+qcy7tMoLGJtaT4tFtx
	oK1o8teoIYl9O9+EjlokHkDRbB578+MLuhGT2tDT67tTsSofzTKg5deytt5KOurLCSDdKWFPWb5
	Aw6MSV2ajmiAwCCTThDZQVviZ+fBjHHKDINLvzx+Dn/DASrj+1xVJQ3PmxZcYneG6xixtT2dLPt
	TtHcEV1+0jpLDmGFXiAwUYPJYlZpGQHEhphzPG2yuKZyN3FemI65yzUpORC5ykbe3tmkT68gSAy
	lkH/kYuNClmEk3sTPWneQb67nG00=
X-Received: by 2002:a17:90b:17c2:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39bac4571cfmr18020025a91.23.1789052793759;
        Thu, 10 Sep 2026 08:06:33 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39bac4571cfmr18019875a91.23.1789052792935;
        Thu, 10 Sep 2026 08:06:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm47578520c88.3.2026.09.10.08.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:06:32 -0700 (PDT)
Date: Thu, 10 Sep 2026 20:36:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make
 qcom,hawi-cdsp-pas standalone
Message-ID: <20260910150625.6sqdwduft5ccflv4@hu-mojha-hyd.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-3-mukesh.ojha@oss.qualcomm.com>
 <ff7a5250-d026-45ba-866b-f92302e3c87d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff7a5250-d026-45ba-866b-f92302e3c87d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa2c77a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=LBkXyKVgYJf2stFOIyoA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX2zw/TpfX/bAy
 xJcFyOf+QUtrlu5skMIliBWj2uMmExstguOG+jRIhn9KB77lXCdniohvUS96QpyYplj5dwyNXIR
 HgotKLVAV5s3OEEeOjVcBXU7gL5gFYU=
X-Proofpoint-ORIG-GUID: 9erkGnJFHBcmLj8sTyCKGvB0GVuRN9ry
X-Proofpoint-GUID: 9erkGnJFHBcmLj8sTyCKGvB0GVuRN9ry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX2pg0jT2QfkIn
 EWV8HIO0zhL7jtFljRRDexCtZPLVI1D/gVj9/J/4umMDLtpi5yHkv8xqDnL37mvnULxLspGKvRy
 appmAm0P7zO6FmIryHLd3k5L2ecIORhVYSCWBnWKLaYAA6oos7WxjzKTPnCYVCEnEhpVI5Skx6e
 7hoVobbV1SJFEEuEk9VeVO7N0LquP79o4adxVhXvpSN/3w7UR9wF+WZYaHDL9pLv1U2fwaYXV7L
 9Vxf41/XUycd2PGEjbJNelWA0FtGzkfSVAib4H3JMrODkg81Vd/ViWs0wde5P/dxDHgCWEOg3dE
 LXy0ZndWctwZYNBmD/Idk5t4Zn+cM0rfUARRVwZKlT5i8vK5374SV9bIOU9pvxUTTyQwuPcLaYz
 IoQqmdsRM+OMGiYhwcW74z347n7at3k8vYpgMSZGfUgUbF3hcaPOqCJ1R6DgoEd8wV10sP06TJc
 3Y9ZMvYA/Pbl59WMGXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100182

On Thu, Sep 10, 2026 at 12:26:21PM +0800, Yijie Yang wrote:
> Maili faces the same issue, and I have verified that they share the same
> fix. Please bundle the Maili binding changes into the next version of this
> patch series.
> 

Sure.

- 
-Mukesh Ojha
