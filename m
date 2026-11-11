Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390149;
	b=Yg5+XMZTWCH8lwWmsgp8QQNpGKlletzTZODaIy0saVWM7vw2VVvsHS8eN8RvD/T0Sfth
	 hDieTr2t67A28xL7A3hiYguyNntxX2ErrZNVGV6+UZR6JJFTY4JQA5gw91b3DHuyJdVCZ
	 S+aMvjeaJsF9id7nL4Mi3omzTent9H6rzhwUsjtxuZaw233SifSsUfNeqjzbmEoHxGJN0
	 Eelj3a7pKwJtVEgW78lnE3GgNKdu+XAQ358Y6i7UxIwjQ5S4P7nX/hgNIncw1Bl9Mty1L
	 M2anA98qzeFpKizX79T1/nby/YriBJOuFdircXfoEiFPNbeJH5XVWroywPWFHZbeEcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3swutLSFvBISsC5bdMMauSRcUcq6pG/QsuKifyeeuiU=;
	b=igVpA6yGf36m1LIVNbjmhyK4ZAhEXU1eD8Z1LGjuUZRnjlFqPf/7+FEQkC6+jT7zc2Ap
	 I8pWkC5ADhd/XHZCype584scu/+2xHV9ZZmfYzzd8TgANsv8x4OAIBBQUI4asH5lq3daO
	 Kn7WqQBlNoNCSbrAdae6wsaY+N4keluRUAU1dzCxVbrkSHmMj8pfFmTKJufEFeRcniwKi
	 z3iUm4bJhrsrYm75X66bzZvkD/Ybon/Kd5yykCxWYTs4vZjU+CGS+0/39Ryd6H101EjLg
	 HvjtQM1Mlndbkf12R2ghdQMXymxhF4YNNIo9J91Ao7746I2wWaxAh/wHWoVWboe0bNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fjJFyaNh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdc5ItuF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28798606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28798606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fjJFyaNh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdc5ItuF
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB6ZMq6581865
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3swutLSFvBISsC5bdMMauSRcUcq6pG/QsuKifyeeuiU=; b=fjJFyaNhFfYeQIjf
	f/cqmsW8Bg4Np3NHwE6PaLnBprrlk5eLPMFsBnLyEFjma8tPaQQ7tuYvQ8Lbiuca
	eIoj7nlaZkqiHVNWaW6Unz6kq5hGmT5QL3Sou8T5UdjQHKoeRBi4jpRoLVTwS8JI
	BBsfZSsLWtXHKl5lP4bwUGtVlRqeSGYWWSxO6CcdF6DLPSo5r3ctdjmWeODPoM4z
	Oc0wUx6M8N7aH3V+fq+E2us+OIcnWqEDkJZHeUW9Rk4he7oIeyZ3D3ybSIOwZjVy
	IUG1OQ0E8IEyT5sHR3EhWPu1ngvuUFigMNZZwwSazKDRxzva7U0ZpP1LC1hRqrxQ
	L9wFHA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7prptq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b09a466295so2528301a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794390148; x=1794994948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3swutLSFvBISsC5bdMMauSRcUcq6pG/QsuKifyeeuiU=;
        b=gdc5ItuFYDmPRwEhgusugxVRHCv4AXKfFTcC0d+uIITcqJ7X2f0vsivnKZxWr6FGdX
         fPx3caqRiH4lvDBNz0jQwW1i4Mn1GRveX8pJ/fqDwO0JrSkEt6UvFMNuaEYVzgaEOm+V
         9w1/gpnGsPRbuFPMplsef79aPeiIbEBTqRvpPmM7KYJJ1RV62ReHhq/M0x7IZHgZ9ApE
         w7DEYc5gvjua1RINm3uKdbDkagM3mLj0Dm9Qh72F/3/MDKs+rZrUl18q8Yb94f6dXgPc
         29xnbf01R/WMhTlLrZo6pWXL+mgMtpNebNCcJCt3RDbEoACDunzuHvf2JqV3SxnDqifC
         Kg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390148; x=1794994948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3swutLSFvBISsC5bdMMauSRcUcq6pG/QsuKifyeeuiU=;
        b=uWkb70rCQpXYcE8nzNasNpZNAJY1vY9JrcaSdhi9eGrIzk8KpUUJgMHvMQ7x8AfhW4
         RHMhblUhMzAMT+UDsHjWLVNjmyy6FaW1OOWV8Xi4DTSPVwoPTdE4+ljdj/AiETg7+cVV
         2ZPX7JjKpaB4huzKk1dDXzK8qXJsTySRWrQ114qDbvdCNScESfEippF2A9idIBAYBNk2
         bUNFukVKgRmuV6i8NXWaoIuB4YqOfpUT0/V7viDoTQAyyw/GLWQe9CtCy7CYfRLXvcuM
         +dXXvRtXHILXpsrXpw6ZB+GXDVPbOhnoGgGAelqWmcgzCXSYe3UGvr/FIdQJLaTfsvwR
         IdJA==
X-Forwarded-Encrypted: i=1; AL+hErHf1vp2fPa6GTBxPtepH+WnwaPBSsoRIud+prkwSbLaK2ZExCrK5VGIEPjlQRai5oeKlxQ8pNLocWrB4VI=@vger.kernel.org
X-Gm-Message-State: APuU4Z907zzgvoLjwD04wGFOGRJ463Yggrvqbxa7OEO4iMQXbteYOnmh
	N5G3A/ZwRS1IuFr3KaMkajLwVJi4vkwFqj6jJrifzJnTXwWNFu4IhtoVK3q0zZcFUOU29RzuAnw
	6Th07Mci+BwIeSLghcfk7UlxrlbBHJ5mUYU0LjOI3y5BhCAkY06nsQoncASuvTQ3ouzw=
X-Gm-Gg: AYBFou1KEoM6eIpTVLI9tn9Ht6EifbRQpvkcUglh45yKpxEHvY+AVGiX9CO9Hoyg4VU
	W4Xqfsh4hgA7AH+SUF7mEYxhTGxiaD7Uc9Pdp0mG1lWVSpvHStdglZssvXZsUPYI58gMFQ3I2qF
	/3dL5MSZJLBVhJyK9B+D8+tgZW8n9o1m4LMgRUwQBgwOReVb22sxvQ/I6R4WNIWXbAWb+qivdFL
	4JgWDD9aPOT/gumXRwAErw1dUW1xkz16oYoq40wHu4/7Dqtpc+9UV+DdfFLm3huRGtPLyhsrAFu
	RvV7uBEPPVrTwZmYMGBQBXkjNOyphDFHwSbwOU9XabFcfdoqx+zQ78aTnG896mlbY6fISDu9Kw8
	4aZ8q1y7/uQrtIM48iEB81fTOmvI4WCLT7pHDjB2MtGPYMiQRJymQtt02HNHhP9Fd6WUDpQM6WP
	J1SSnsiKA0ImliyA0ehwB2mKBIVTxIV1Kt0yHgcQ==
X-Received: by 2002:a17:90b:1646:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3b182d5e478mr1994771a91.0.1794390147737;
        Wed, 11 Nov 2026 01:42:27 -0800 (PST)
X-Received: by 2002:a17:90b:1646:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3b182d5e478mr1994754a91.0.1794390147211;
        Wed, 11 Nov 2026 01:42:27 -0800 (PST)
Received: from [10.133.33.237] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e0ecd3sm1254717a91.3.2026.11.11.01.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 01:42:26 -0800 (PST)
Message-ID: <f8911f68-ee78-4eb2-b7e5-1e879224091d@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 17:42:23 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on
 DT platforms
To: Ping Li <leeonion.muyu@gmail.com>
Cc: sdonthineni@nvidia.com, james.morse@arm.com, robh@kernel.org,
        ben.horgan@arm.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
 <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
 <20261109112737.1081437-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261109112737.1081437-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOCBTYWx0ZWRfX32i1GjQNIwff
 IevOpaREh1o8oYfmTMgTonNrpteaGgt1JsaH4cl0Nc6+UiG+3H8Qbs/Pjr8lNSs9TqL34nWIuqQ
 CQYXYoyjWF0ZsZcNl8oh61RK+alpxv0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOCBTYWx0ZWRfX3/3jmvkE0Ogg
 F5q9hw73ryGfkUSMewiW8UPNYRUsi/14OfEhmqrGARlHUwxe9Q7lCony9N/bgg6WXGK8T6tTf8l
 5Lkyqwo3x+vXXRjDIUUFAQW7gsPZ3FOHS2yxQeJpqpqpbA6pPH6oRcAa7DIFm891Sh7iZW9MHq/
 IO9PoHHw8bOEPrDMRe4UMpyCVUE/BzHPUby2L01RKrwqEyuXk1fChwXBdj7+63P5XQn/28kkURk
 0qlO8IPps9eX2Hu6CWjX1BjNY1WSRflOxzXvDbLIF4I7xoSOiBn7QN/+W4vqgkTpjsh1Ove9jxX
 mT9aWJdOSYm/EubyvgkZ5blIUQbMMKmaPNNOHfHaZ41mQH8yIh2OuYnDnEwmeHvtu6zucJH2ORM
 Daro37y+x/Fh2E0pZb8bKOYNO7icWEJU35y/ZUQhb/K4U2xH2WQNz6o1oef9MT414vVg8SDNWcq
 IdpGrgJYIGdMGoTlN5w==
X-Proofpoint-GUID: CK6Wz6DHG8TcxPll8peVs-98vNeqyx9-
X-Proofpoint-ORIG-GUID: CK6Wz6DHG8TcxPll8peVs-98vNeqyx9-
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af43884 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=dT42ApTGJaDrCQAcAPEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110038



On 11/9/2026 7:27 PM, Ping Li wrote:
> Tested-by: Ping Li <leeonion.muyu@gmail.com>


Hi Ping,

Thank you for the Tested-by — it really helps move v5 forward.

To help the maintainers evaluate this series more quickly, could you
share some additional information about your use case?

1. Your SoC or platform name (if publicly available), or a brief
    description (e.g. "server SoC with an MPAM MSC on the DDR egress
    path").
2. The typical workload scenario where memory bandwidth QoS is useful
    for you (e.g. isolating bandwidth between tenants, preventing certain
    workloads from saturating DDR, etc.).
3. Which specific features did you verify on v5? (MSC probe, resctrl
    mount, MB allocation, mbm_total_bytes monitoring, etc.)

A real usage log showing the memory controller MSC working through
resctrl would also be very helpful — similar to what we have for the
cache MSC:

```
root@qcom-armv8a:/sys/fs/resctrl# cat schemata
     L2:0=fff;65536=fff;131072=fff
root@qcom-armv8a:/sys/fs/resctrl# echo "L2:0=111;65536=222;131072=333" > 
schemata
root@qcom-armv8a:/sys/fs/resctrl# cat schemata
     L2:0=111;65536=222;131072=333
root@qcom-armv8a:/sys/fs/resctrl#
```

This would give the maintainers a clearer picture of the real-world
value of these patches and help speed up the review.

Thanks,
Yin

-- 
Thx and BRs,
Yin

