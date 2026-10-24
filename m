Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873683;
	b=r5t9FJlQxgXyzOqBIeYKFe53ACDbeocSB4+HTjb+b8XxNpV9Fe1B7FGuSRhJiNKK8pim
	 bA5dWV/AOp0yutb737gon84mEbNAU1NooqeZ7eKheEy3V3GahzuXY9gbYljky7WpJiNgU
	 HkOvTx1NU5SBuPCPWRlFiDHhkwMrShbGnx79e45AzVG+6rlfH7xZE9j6A6ex+lgIUkCPD
	 mj5veEXOWoBInMOaDGmGHq5n64J2HXZSd8F+rdNcxzoQz8f4ADIvMFKV9N5R458JWOUbc
	 4z/3fkJdmYapolrH5WKmUtYiWih3z2iHkmBStOjYLJtQYwlEsKMfgyfCJj1yMiZ6png==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873683;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QKc9/tOdnWTGf3efjYi86dyI+DwQZ2YvRPmsUwFYhUU=;
	b=TxrqssgeY9dKTcjEe9VuKhS05qqKosY7KwupQZEhzxEm+vjm0d6l69WerJu/HAOaMnVL
	 tazHCJcJlynloISMz1z/vAd6Np2YANYcuBM4ZIIf2BFcjWHfxM30PqbwWirM/rldUMBuP
	 gBejMMODnWaknGq5qdqOHvtafHgcvYHIOQ0JAy55KX3jt89AHidSjbCdw2Ce38ldQKTyw
	 O3htZM7SzTv2G19fUdfxtpQnvp54P68GwP+LRCpKbRn46IsIAEgdMX7u+rAYbt4stG12C
	 nsaq9c0y2SlC5ZKk9z+JqfLFdYMA+VypnaJZSotiHse5kzGjbBNmRTYZRJFchjx8v6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=llXsbZ09;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MfSO6B6w;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528E0606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528E0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=llXsbZ09;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MfSO6B6w
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OITnL71419246
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QKc9/tOdnWTGf3efjYi86dyI
	+DwQZ2YvRPmsUwFYhUU=; b=llXsbZ09axsDg/0ECDgCXLgLw/EVNj5kofvPVZC0
	DZgz0AdBV2nZnGm204SVWTUIH0ZukScHc9msDzEKTKX2bJvZukUhxjKpOoBHhu9a
	EpKEzthaWzxhwMV10vpKyk0/L/Rxzq6eboMbo0o8qBwdIgspMl0idxAgSRcWR1A/
	0E9pv9pYrocdJt96ppDcTj9r5f+JKS4W4DtmvjJrPiqkRJTQv8edUWiSFq3O1gxt
	r8ea58yK7MKlV56ze5AenhSGxl59iKwWTfhQxV8AbN8Y/VE4lP5eU9XvDQ5LD7qR
	Pj0yBNWa27OBd/hU1VS4oaOne0obtmxKIQKX6m+RjRZcSQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9sk86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:27:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b937ecbb4so42014186d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873677; x=1793478477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QKc9/tOdnWTGf3efjYi86dyI+DwQZ2YvRPmsUwFYhUU=;
        b=MfSO6B6weuVFY9a3dQxM3L6++1pdf8skCn8yjmZg5S0DM1/StW3TcgoSc050T/5kG3
         mSaAnbbt5web5Yd8qgJ9btiALIzMEBupGTXt675Ld6AbVfwwxBynbvAIScQOjN+ga9+M
         ocXqPBznCpBNDi4sndvnHEgIL/7KS81+yhxsf7awtQVtOtwJlxbqUpRUO80Z1EfCMkl6
         J7KKrNJtXzgCcK6UVEc2vlhUmJT8ahSShoW742r/9R2pgKIxJ335ASjrhRFimjcKZp/U
         ptohD7mHQnJO2BkY1XZTFYf/e9bfdX+VlGir9eYor/uUoL1jQbZT5cwizO11+YV31muQ
         hsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873677; x=1793478477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKc9/tOdnWTGf3efjYi86dyI+DwQZ2YvRPmsUwFYhUU=;
        b=oZnfqrwMnVMXu5tqTHAUvXLd7eZmyM+kUA8ZTJvaoowljAv1GmO/MRb3gOrp4dw3A+
         yu6fRWQToBQI9BuZz/XxBMsL7AEld3U6ecm96qoNhBfLCqaW1uu+oWlWiR/T2cWYG6WG
         3R9NmT2xvyxM3GcMIponbAJBTKU5r4V/TWovOFGsNgAU27nYTHIdY3hQkVxM9ZU59RfO
         dbRJ+IHdc6WaPw96ZGmML7YsAX31IRJDvwCg9FSOZHs6Uq/rdWz8nIYVIIgDaUWszFfz
         DJgONUw36kZoK3ofu0NDeX4HuvuiCuNFIESZ98nPQ70kA4PwEzt3Sf67AkK0BfWYBfmg
         i+BQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9sljpdMRlHSl1Gsw4Sw+Y+vQXvskyXsrTl3TiHbxypxHl4Qw/QkNof5aAcdcRJdUfQibAVzwDSBMDhhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7SWaB0sgc6MD1KbMl5qb83DI+ZBZLN6v+xiwK6LbL8WyzqpgJ
	OXzsCyagIKc4PdjPXCKzWZvfR2ihNPHKnkh+SIKJRuWBq4Z85mV3r48sT1cqCoKfRz8Mgh6Awz8
	ldA6XFabd0ubR2LuX9GAlZ0jVm3Ckxy29oUq3GhzAJqVMc/44lpx2OFaQRGcvbpYxvVc=
X-Gm-Gg: AYBFou3PQ2+paN1jvatPUvHrWqnZzoA//rdOQA24b4aRZvD68Wd0m4+kSjOGWegaI/b
	vqvN8+IhquxAO4G7KvxBeYZ/bD3BMPhSCmJCNrch/cfXReV6rlMYxb57jlUkyR62ILU3eCgxsDO
	B5KWpiqzKH07ACCsSjXaXOfCRJcgKM6b2fkBOMcH4puwTcAAryclt1wJOV2QAEh0vKVI6WuQ2ri
	Y9Wv0hBs+l0DOEHeTpkEftZuIUmAabwZs72Fp2AKusaOGVd2OtfrejCobYw44yvn6tQBJSn9Xxr
	ddUlwSTbgL91M6PO3kMXG4jfJNUAWLi9wK2nRVMJQtwyxOBeJ+dFwUVBM0IoYQ1oSf2iQQy1V+g
	pmuELZkG6T/E7Gi4H
X-Received: by 2002:a05:620a:1a20:b0:93e:bcbf:88 with SMTP id af79cd13be357-940ef7ad8a7mr406807585a.4.1792873676573;
        Sat, 24 Oct 2026 13:27:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93e:bcbf:88 with SMTP id af79cd13be357-940ef7ad8a7mr406803985a.4.1792873675559;
        Sat, 24 Oct 2026 13:27:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdd5b3sm6024139f8f.53.2026.10.24.13.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:27:54 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:27:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
Message-ID: <jjdtsucojghnlo7hiaxmt3oxbbdvkhmry2rke4cxqwh5bpfd55@rbdz4agoxncv>
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
 <20261022-topic-sm8x50-next-hdk-i2s-v5-1-aa1030a75e46@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-next-hdk-i2s-v5-1-aa1030a75e46@linaro.org>
X-Proofpoint-GUID: a8KcRyQ_IHx4idWuj96v4J7LzkEf5XtB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX2zNEYNX2wHOz
 T2II0vC9vBzS12fxaGDVOxEkb9wHF6VlyIWxaKpB3kmIJIf4vUp18dmFo9y9L+aQsHN2JMTSVGp
 H6ggGoOlq6Mj/GabvvTDyr3na3NJtDi1mKq/Q3YxcB9jhPLDAB+AkKiIt1+ChwlX9wSWFH4yLW9
 YzYP1bRnWmUCHBhYHzef7w2afOATtF9ueSLhWF/T2H99nf7bbT9Jq5kR8h4aTjBEz9Hks+x9NyI
 KIn9yL7W5iLYomhTeeO9DTAmwlpkG4ObYHzSePVNcnQ/RSLAwL3+Jt6o44/47bi2d0jUK9O7bZg
 ywmtASDGsbcFR5sZ2TOWCSz600P13NxYp0xyIUs56ufHjFBfreK0VgSUVmFnrSQeJ05bdScWMYM
 11l4l+gLzhzKrU1adtEtMXL/FMzkgOVn/nS2bKQArK2a1MTmcx4JNzdujBVw/JzEY8WFNK7L4jE
 wS2CoGRucXS50AN/zvg==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6add14cd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ji0esM3nnZrMOXJC16QA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: a8KcRyQ_IHx4idWuj96v4J7LzkEf5XtB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfXzdaQ5ua0e0Jx
 b6UxHKV6TK6ePFpqO5aLpZB72NkLc6dJxzBefHbSXbrHOrW/HjVeGFJdQHAWeGnU1gAu62rgLix
 jDMLgegxFuU20XBWyzTekgCpif5liz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:16:57, Neil Armstrong wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
