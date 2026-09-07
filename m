Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41B7414A34
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766900; cv=none; b=PyNIgxfcQb44m1jsl66IzoC1dDeSMNWCyPnT2JGdZFD3Y2y/VvTtKPfsa0XQ7u03uG6G1OwRRumBZc1iY2Gjuz6EEd5MBc84USMEda9V3PI5+EISo0+JCPaBDV8+Vco9AhBq5ZrTc/xEFl/I2MqNO78FptrC+MQr0x9IUQGTjEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766900; c=relaxed/simple;
	bh=DnNc5f48h9tlH5aZsY01Qskkv+ulrJsjhy1LITI0FMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJbDe5mvQCo3emPKWV01tHx9a/NaJqUoHCnFY1h1zM25EejVj2qt5GTlXXrkMdv+CwK2H1ErrNtUZn69Rt1a65QszPi6xCbE5sUM7tCMVI/SMBsrQIFGY64Wh7pWiDY62Oj0ziqHDTW7WmlyPKC7RSDNrsEMVEG1bnlEQ08+xbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nk9kG9ss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LE3JJ+OJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nk9kG9ss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LE3JJ+OJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777ZJk2668325
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3dyAuDpWbShrONS2lMP2iU1W3wClkzsBqh+y4YLHBU=; b=nk9kG9ssBv3EUXtP
	puStuKyg0AEF8pbuQK79HECIOARhAZGcmqE+mbyvPTboXnCTvEsa7tCrmc503TL1
	gcf6C0G+HgHuohw4GOhXGqmyUuUay3vr4R0B9erSGqGIcCipdOpBd2HGomcj8KAk
	34LfIwXacm1xsIdjArE5+gcDoy6XirkHihE15Y4On9QQwonPBMUZJErrmbjzc4YY
	Qyz/Wedv41XghFBd8MU2d+DSp9oEVTE4zmoOyVh7kNaINpI7tJ/UWBRA0bmOvelK
	JGuNiEqXXhMJ2zRYIjJw/VfvctMGCMl/X3SQg1EFsN31CqpEHEWNVEcCD8LWfmNl
	2bIoVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca5j9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:41:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939a28482e4so16014585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766896; x=1789371696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3dyAuDpWbShrONS2lMP2iU1W3wClkzsBqh+y4YLHBU=;
        b=LE3JJ+OJzSqS5r3BTFPq2j5g9v5IQFofI0fKy7cS8QW8Mg8zGD+Hyq/NMw1x/fg09O
         CYMNH9omiFcXCpa3iVD55c8WEHkhK7DQZj/OU8zSV52Me1iq0xcsbo+QPF6bpSmYurMr
         C8hhaxwY5TlliBaU2fv1nFcUl8Bz4rAMReur0TFO7kFJFLot/J0KuzZjkG5CjGqx5Gaq
         3jerAkhfF9H6xxxUTQ967O7JkSAEzhtt3cxDzumk8oSZCSf5NEQyCSez+IAX3CL8aDZ1
         Y4Ye+qwJvVwl3kPFDIQhNc1k1FrjYfwj0zbAN0MJ6g6ywpuCjr7F7AyZHdzsD2KIW2d/
         XzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766896; x=1789371696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3dyAuDpWbShrONS2lMP2iU1W3wClkzsBqh+y4YLHBU=;
        b=qGBKaE0PP8ij3IXfxWKgCngxgVTWuio8rWKwk7h6o19e8t+Ilh0i5UNtAMktpKXheW
         dzI9t+dpcx2Yyz3kfHeW3NHaK+386SWIXT8ksjLfQ2UYgwXodH3/79QzsLwwT1OCZX99
         Q6ShMaCB+NvdChHtraH+x8RCMff4RY7IJN17Xfu3yFzVQzuKkHMI7WemOicyKKKRlbYi
         7hHddaJT8Q/XJSRdCQe6J617RT/sAq6woMNCXQzMnFZncIQ95AUV76+P/EFtDfkXy+94
         fgni/5EeFCoCzCVPFaNZr0NGhv0dsyjIzbPovhI4U2zlrdaoE8wLJvLHC/qz7sa5LRDA
         FVdg==
X-Gm-Message-State: AFuF++n4FO2Hxd10lDraf2TVqJe8S8GsKosZllTRqBduvw23bdfDIaw9
	EneJjeFCBHC783qaHzh2KlrTQtTctZ50s9+eoHkin1+PJdszrEMNo+hmcfSXrlMqeI1RShQnyaZ
	QDJnb3WAgjwLVtJb2nKOFE6VXFlxl4OBzKF9KU2vWXdlNfGbacu8vuNSKCO9h+lXW64A=
X-Gm-Gg: AYBFou0Gi1oHQFI7O2Iff9Zr9juAa6sDIdXi+1eYianCl1yGNjtgPYfFeMNwBHa/LGO
	fLw/1b3yrSsnK0x4Ipt5MOiGz8qTt15LZ4LKQEWrzxlwmCxhydB15mAMK00OPkjXrcDIOOOxijB
	s5g6pbgAEbmyPdzHIH4M36nK9qYg47vCdccktyly84NzH88zqg/oLnCCa6vveL3vfRJEpSrT1Hr
	LJt/cyv22NT0n0vm57TxGVx/U64ZDa1u64BX4virNo98giBGKa7hXnDWhCxe/1GPnzNUu32NTdG
	uXu7qedQAzwJUmBWkbil3HlWI94b2EivIUy+ZRvCslDO5/U0amx+IyGmbzAc7PiyJVK+dm6KiEH
	NvPyl0Cu3iSzmcsmlHx+v5w==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1663963785a.1.1788766895737;
        Mon, 07 Sep 2026 00:41:35 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1663960885a.1.1788766895295;
        Mon, 07 Sep 2026 00:41:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261f673000sm348405566b.24.2026.09.07.00.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:41:34 -0700 (PDT)
Message-ID: <897b62b6-c520-41b7-8599-3ed9ada794fd@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:41:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20260904120601.18363-1-hemanth.selam@gmail.com>
 <20260904120601.18363-2-hemanth.selam@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904120601.18363-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iq5Tigs09-A6W9FbwHZa6vzl31AFvCsJ
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9e6ab0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SkUglc1C9CtHUDT49zcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: iq5Tigs09-A6W9FbwHZa6vzl31AFvCsJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfXz6mOZTzaqSDU
 8kmSXUVYbbuIT1qfhL0ZinPjz7bJ7vpZOtxTPLUk7q0BjZUBNZpOUluL5ctv74TY0Y4NSWO37Wc
 ocwYZCpOkU/emkl/4t890WvK6PXcgiEIpbcXzM3Plxn9L5BwwhCMQiyauiaRPhG/7RSgGgglgWb
 MGGOjZiuWC1nkzAdq3LysopZogVjNXZX4fwyiX2hpB9NYlylROAjQqJsk3MyfCsNUVwvliYda6r
 yFtHg0bbuw+W+L/hqVjHDd7xwpoUBlxQMmAQ2eZfeOGhMySibbLw1sU14/FJ4kAO7znwjJ1CnQr
 yohw5ZVDoGHFQZ7I9bEFQYzZr6OnLRux79Yz5v+r5V/tQzqoycTSVvxdef39a8ngpmn8qs703dw
 hwVh2KUC2tnWMM1p6MHf0Aw7NVJGb4en5mt/m8BG3MjIAU4Hgbc11giDUjAQ/o83SOtthieOGMj
 IYML6xfwDbGD89jzmlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfX+UwOvFsTwGr0
 aJl9ibjU+1/78XNNa9qsYCbjRMigmePLMPPTAB5iYhCPKRt3ujmwLu2/cd/64l2+XG5esZChYCC
 9hwcwJVD/ohjAnIuKn3bXwXuwNzvNOw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070082

On 9/4/26 2:05 PM, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5

This is a very expensive model for catching typos!

> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
