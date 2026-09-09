Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B67457267A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965448; cv=none; b=KIBXvT3ML+vwQ4mv3V/FHmpSREbILothewqFHONhGXJqhY8OQ/PKC2/5vFOG54WFbNCRQfFSGb1/vuvCCxQXF1Af4oKjRlI3cEjLPxVQ76k3269hZ+hUuzp5VxNQ8PHF76lW5PmTRBSKXM6T8iSHfZ7w84Og+2GEul6um7jMUBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965448; c=relaxed/simple;
	bh=htk8qv/K4eyGgE6wRDDFxPqjA1aEaZbCUEbrz7LLR28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7FuzDWm83C5Vbph4/vK9SAxHgpiW0TXSPiFxDZsK4XXOWPa3nqFjzxsHKg+sVXdJWaF0zr0BSRn3yV6vpCnD5wJr5a3bPYKYEuh444vkFDOyZ6o5cbxJMLseSvsK6swax2dmRLUhvxKVOPcru29hSKRf8v7ciCniFILX0CamMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7q7mKH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpZID4WT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7q7mKH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MpZID4WT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CD07G3053243
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0VjXXRzrnnx8TfMPI+JKRTyu
	HaxUZ5vAOhqpXkWfWS4=; b=A7q7mKH777AFl2Ncy+u3VqVNQBmj1KUIZrjTkfzZ
	peKGuE/ccFJ2aeYfnju+y3LrD4U54uUlMLivBADm/ks85lLb4lL26P0elnrKJsHU
	nGCDKbhWqdVQD1ClN6w8VID6aO+R6KO8oM4saf2a9q9pyTtP9SIXwB9I6iaPsUiK
	i/tlW4SHGStpOVEMtXjDXuG5XFIKSabBby4NIf2ZRUwjPzqAVYXSSQbwkeRtkQWI
	8i9Gko8WqNW4y+2TXFI3aEpKWtuddLxNfJWpW/pQ7T0KePl+etcJB7y8nB5aj04S
	fwTDhOok7RRpeoPoXu3MNtHBvfSqRikCdWany4qALpMb1Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk7920pse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:50:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc92350888so17678845ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965445; x=1789570245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VjXXRzrnnx8TfMPI+JKRTyuHaxUZ5vAOhqpXkWfWS4=;
        b=MpZID4WTbmWZbVfKywYAVsBk8qyQ8pbcJMzAgZg1an+3FGfVYhUOfCRn++sF73gUXj
         at4uK5phfEGLeOz+K89EL6s77YaRxXltcAPokjxHCDgwjKz0ZPqXgrcopTWB5upQOVHW
         3CppTQFiaXcCZLZwh9StT+kdb3hNZ7z6IRg0gFVWD3QVYVuXeAnYyIhJG8B5raFlJ200
         4duyFzDGwkWghe9QMHrg2H19BGtMFmRQptF6ubl9CL3rPt20dgulqvS92X+6N6FzuYyM
         A7hsbOC4QaZuwozfMCIh43fCggdBDmheeew9rrz5J0O7A8eyCGSVFvUswLUFK1bZnNrM
         SL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965445; x=1789570245;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VjXXRzrnnx8TfMPI+JKRTyuHaxUZ5vAOhqpXkWfWS4=;
        b=k4ze/Kjgdwvc3g0MrRaBqo6zCzzpVacfnFbATVhxprZ5JjmJBDzlnLZfI0kRDzfz5k
         +Z+t1zIKG1+MUpUeQWE9l78t1YoAGDJILCOTUFJr2wdv0gpPaUPhknyYW3Q3Ly9RbSJT
         N+izzIgxkUhhuOrQtw3oB5t3fJyQUGgcwZ95eJc7kQ46xi4QgfyQWuUbh3wgA+nNMo8K
         37RYolqiVKJIrKZyzdl2DFKz26jlm7wLzTucfB+0rCvrOBOg+uycVFRAdXnHhVzkTvQ4
         YObU4ofUS9eStOZvEb6LsninjjAL9+HqIhhjXEIUbOG64armp3iEcthbnyw7BgMSZHiC
         oZaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsMcl4K08h+sWZi1R8y+YGFnypgozZRsE0TMDlfHUv65Rl3p51OxFhFxSvHbEY4jk9u1MY9n6T55qd0iQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mTV6/eIc5kwgRFzX1TSgB4F2tvjXhiF/ZK6Y1CGcjFzmDHer4r
	U1IdEjIt7hO0gJNynX2dhoC/E4UoZn0wIvcUOf/R4aVoCuYWpyBeTD5bQJkKk880B7HeqWTYksE
	LRPWRQyoug6srx3Ts86ayordnt1EfH6Am7ycVcSEn5jcGyj/iaIJvIFxSOt3d2+CZsfg=
X-Gm-Gg: AYBFou1vPcSQW5MvRkcceobOJN6Bi34S3UyxI4toRzL4kieG5JCJIeDpL2YwM3Wmq/G
	59Aij3ykn1TzdICpGjYpTGHYVkPmym7lOeH6IVWDrYtvnW6fR3PVgRce7WnuhiPSPvEOr0PkB7G
	Fq16l1SXoYa74wRHiZqdAv/YrKoeXOFriNzA9kyWf6xAknbqG8Z0H2pjj5S3vX8h95XrZfcReD1
	mC2qn+EMJQPnrN3bnlGhMYMMsamjvzoXMa5bZQkvPJYqTprv7jzKb9AQPbbHPMI7N1omdwGOzZw
	LO3oJKaZik5NR4GUWXerwZOwyEer8wxqq+Z325Bwo3jbLbFyGoFqwXCqGVN9sZqn+ia2LP+8Ea5
	pQO52sxyEW8ms1+aPdiTqB4vYI9UdurgBm37xZGE1tww=
X-Received: by 2002:a17:903:1968:b0:2d9:43f6:59f0 with SMTP id d9443c01a7336-2dd07cb78bemr22984055ad.22.1788965445238;
        Wed, 09 Sep 2026 07:50:45 -0700 (PDT)
X-Received: by 2002:a17:903:1968:b0:2d9:43f6:59f0 with SMTP id d9443c01a7336-2dd07cb78bemr22983335ad.22.1788965444698;
        Wed, 09 Sep 2026 07:50:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b57fsm75371185ad.24.2026.09.09.07.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:50:44 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:50:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
Message-ID: <aqFyO2iX53-Ivgnn@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-2-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-2-997d3b20cf43@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa17245 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iZO5Dqbo_VVVwkFoHOcA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX9JDPvR9SfEob
 ywbuB9vNVta7pXm0NJvtoGRrj3V7ubNjoB/oOvesZmxoebzuq6j4enWxN1ONhEbnwtjKtX/Kc+x
 vLbW0D56jwjgOgPDQ82zYPrNZlfIBUQri0ZyXA4LQ2YAf9M9Ev8dBU7/8ZpCazzIGV1wUBLcV3K
 KGpJf3c+hlxvHiv5k/0BqiRGpw+Aah5zigvips5YfGGrAi1ccjfKlC2Lnrc7N/1jvCBDMAEJ4ei
 yveeggMpqyvUyH27xhyHHhUGkor8pHTuTMACLV+ex0z64+LU4ivYqOvtg3el8rNVvhDmzjsKge8
 Qj+a0ixEwY/1s2DItHOATZDao9jZRiJ8bkOgQ4y1kCBbwGfEBxxlUjkiVWgFsR5R1IHgrmt62KJ
 2RdEFOE43GUA6UZL7OKA/Ja3hpN0jNlNeSKng7JYHSy2fUr55GXDgUj+F2vROxgGcCso8hEv4sw
 h1qSMMK2bblaYaEb/cw==
X-Proofpoint-ORIG-GUID: JzX1gg3be8Dnm1HiaKtm6NS6PGpnTNzM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX+/RMSOs2ZK51
 ACwmoDMwyP7TqoUNwxRNAC4BJjf8V+zXc3VwCtZh7fpsThCN72ajX4YYFkKjHTpJd8KqQuexkxj
 gP6oV+OllmVf6h+IvrlL2JVkF0qoCMI=
X-Proofpoint-GUID: JzX1gg3be8Dnm1HiaKtm6NS6PGpnTNzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165

On Mon, Sep 07, 2026 at 11:39:43PM +0530, Mohammad Rafi Shaik wrote:
> The PCM1681 can use an external system clock supplied on the SCK input
> pin. Platforms that provide this clock need a way to describe the clock
> connection in Device Tree.
> 
> Document the optional 'clocks' and 'clock-names' properties and define
> the clock name as "sck" to represent the external system clock source.
> 
> This allows boards using an externally supplied SCK clock to accurately
> describe the hardware configuration.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
