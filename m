Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CCC2BEFF6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789616504; cv=none; b=aRIDep5AM9i5f3wnxktx+I3tA7siXSOaLzYmoroexO+bH57dr5Yrcog9MpPj+8noIULcEVgJzX0I9bfCrgpJaplLs3269hLiD8nDa6v9LMw2082wImzVFNNiRSuW5G5jgng6ll3p6JyEOucYj4ulGIhKwtqcM/+vJQxvBnlAnjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789616504; c=relaxed/simple;
	bh=4XhJsmVizhzHozwZPuPySnL45oeWWBP+08eCboV7Wms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdOJRczREG/i4a1RHdmhpCtK+msrWiY6aX8V0XMesbC5aeAYweEaO6UfQWYy5xSLdh1a1r6cXj0YihDl1cfGfB+PcD8l4f2LfDTw6pitD3PMAwr35/A4NvUSl/RyD/JwmY7wlcAbRudTSowPVPexDieGC5YFiWx/6+g3qlBjfnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzC194yH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbLberWq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzC194yH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbLberWq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2tSlq3305135
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B5C8wjP4LGLq/ehI6YaOhoiR
	mBukehjstLcbOo1B3qM=; b=NzC194yHrdG/MscmREOBfbUZ903PjJFPlId0LMff
	8LF7xeLYFhyMg8L9w8CLKaR+2cERYqDWwH+C196qRU8pHzBZVJhhwzpd9mwH/n/l
	t6jTQje1Z8NMCeZTrx5UXR7VaeJanhYmwnvfWfQFSNQPyfeplHymxCpdk92Oi5iA
	X1KA89i6kUS3t9mCtzBYai3aseimxWYadyXtiPzl6bdT9dvjAWS17aakMMKI6o8E
	AXAy+ENC/VZ5nDE3g1BxNmEWPFKZLagcPnDotRnMhsoK6xCLtNfjoSbBfwYNQ92z
	3L11sFXAbM8EXoKx2kYheR0IR0mhgOgjoIoBOxCJGYCQzQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc854v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:41:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd1631d291so5823795ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789616502; x=1790221302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5C8wjP4LGLq/ehI6YaOhoiRmBukehjstLcbOo1B3qM=;
        b=NbLberWqtJYKv+HqLZDItfWUd2V26KJB0AtdtCCBn1r3yaBgGem2qM2t/fCTwIkTCa
         ntF1dZVhi527FRuxJJtuCSMPg779A137rh5sUhq6tE2zFe4gLtHvbJ0CAtsylk48e0Xk
         CAx+85fNOksVC2P9UjLbTSi/ui/JYdIBYVdsXBuIs9aEiK0hKm9T1uzDN5sX2wq2eUrY
         08H37RqOQqOavR0UOkSMreQYGb3rdcWar5CTDvxaCY5N2uCyfMO7IxQSCABA4rA1BDG8
         L5qm1hNfeYH+cw4B6pVjKTmRlO3sBS6IvzlZUTCov27+rBemdgSFACMDR3i7zN+YbFjX
         KCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789616502; x=1790221302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5C8wjP4LGLq/ehI6YaOhoiRmBukehjstLcbOo1B3qM=;
        b=fqSHj5bthK2cJORHqFu7SLuWwU53L4tdx353tgFjlEgEs/wu3CWYmCtGG7Qjj2hur3
         JH0NMrtW1D/dot7aYUQC3OCr+AD7IDcp4e6jfrllgpYRkt0kDlzOJCT3tr27f3iyKQkR
         GJ+kHYd9HCeiE5sOKrMFLhGRvMWnheAZdOlOa5kfiLivfNx7WuSnDkBKVr+CW/mG6tA9
         OvcAR/AcXRgHQGG5h9Wq4v3UlCGwCuRPhQMf0S91I/HWvB2lBVr4bHBnOzQl3fEW+BFI
         GjLkCwONcPrKQWLX/e0Fvi6kyvfmUgQWdXpYPIFYbJnANE29QPgkOlwX2OOaY5DCcJ5w
         LP5Q==
X-Forwarded-Encrypted: i=1; AKwUvByTuxqOu3Tu47+XTjBE275fbGIW85Jzrtdog0sV2Ixo8NgpIZ1PPLJIziweVtmX9uOiyTP1vQ9ZcqQHVcE=@vger.kernel.org
X-Gm-Message-State: AFuF++nUi0tTxkQOJEilRSMptlds90O9LKHBuAiwp9zxcDAW4mX1fCnG
	VOT04L0gHqBglmltGiEyCIKDk41DxUF4axpjRCp1MNjGNyojrjDP0ahnOYLHid/mwaJpXtdJOsZ
	PFSUwBF4KWZkeeYov+7/GUdZUE2rJN0S5kHFdBCakET5sN+Jj8dqJQC4nz2s1mDc9lo4=
X-Gm-Gg: AYBFou3aDMuE+i5hnVsVHEUFYldK0lx6HJTRyETv8130KC9I2FivfjFTHZQ++xD5Y75
	hbaVMmFG/QNzrqUZjukcM+xb6Ibdd5iTqeUN5uy3FYOt86Tdkc0ZYKXfsqqh8DAxZLOJn4QTGTL
	5nQCIYzoTr1rqO4YMKjbq+0ITgZho5w0oDMX/8ATFd2sqpnBg1cNKF2dkfzKVMNENFGqO9kLSX6
	mcWqJj0pJBbpCjp+cHcm5ZU/jJwy8VrbUOPYuUxYoHA7aD61gu47lClybmP3zefy2c3Ayu00VJf
	ThwLTNe/wxcP+4rNFnRrzN6ULPJIaSG6Y1HWrpuRcceOUwTkVxtcaKSVpw0ONgzqCqJHT3Fg35L
	Z3YKmkcrm/ubGgPVC1ILIFHRLU7/Q4wRUo9W/FJOLOO0=
X-Received: by 2002:a17:902:cf03:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2dd8e77cddcmr113408655ad.22.1789616501755;
        Wed, 16 Sep 2026 20:41:41 -0700 (PDT)
X-Received: by 2002:a17:902:cf03:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2dd8e77cddcmr113408045ad.22.1789616501347;
        Wed, 16 Sep 2026 20:41:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm22826369eec.23.2026.09.16.20.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 20:41:41 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:41:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Document the Nord GPI DMA
 engine
Message-ID: <aqthb96f2zj_dlK5@QCOM-aGQu4IUr3Y>
References: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0MyBTYWx0ZWRfXxgGoWlC4UhfK
 IPi9I1vY/3fnblXd1VFkmL0l3A7gx4WemtYhQ0B3VydA4V1N42SGNo4lIDYxs+TpePr75w+lcbC
 T9cCLE1p4IV3tqwQVq0Zt70gTKPAcnZbXIMCvaT5fEPGZycxKg5Fic1SiyxN8SgcJmKJmzGCjRb
 vf0//VA9cBbb3KVXD4i5PF6e3fT3U0hLfHj6b/nZpY6/Mz499eXjByegtB7Jmihxz3212ZS0ghi
 jqN8PaDxZWruTd9Nz1QQgF/bwG2jVQyDnJRmU7IEHer0Rq66WEA6t2FsgVPMUwW11ZDFxAclkSJ
 3RYLEffaw2haVablmZAIfzvRAeI2QtYvQ7NmHX4IlyXicyk38AtxKxyhNrQ/b5wPqlEH/2Tv1Wg
 qVkqgSwVH+Y8kpfsd1QSq08A7K9HJEYKpIWEZrrBJtUIYMe21jUDNqGKGHyZddIPgP7HGfU9ie8
 quPUkpNMuDa3nxbCzQQ==
X-Proofpoint-GUID: sOrTrsoH_QBmyIHK3jqlpHLdAZ-Z6VJa
X-Proofpoint-ORIG-GUID: sOrTrsoH_QBmyIHK3jqlpHLdAZ-Z6VJa
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aab6176 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yOFVgSGORKUhaciPrRkA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0MyBTYWx0ZWRfX9tgxnUxAlk+F
 MqDIZWQpzQP8ScOBAR9BISuc/0/JvUeFapHyXwghnaw/+1TWTtsnqzKsJJFb31HaTKAfaOSC8JQ
 ogZK0wnGPjdddBW91K0KjQtdf2hVfTU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170043

On Wed, Sep 16, 2026 at 05:21:29PM +0200, Bartosz Golaszewski wrote:
> Add the compatible string for the GPI DMA engine found on the Nord
> family of SoCs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
