Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992672;
	b=rNfNjfqYS+0znOffn1Q6I/cNWv8DbKr7LoHL1npgv/ZtI7LTjmNkuquxEwbIbpsnu0ux
	 FwyQFdKu6joRuhhaaZqbeC3SPNGM9eMiIVVjA9Ulg3n4Wr1FC7cbH57eh86/V5lCcAtIc
	 2rIdf9+O+UGvJ1bwoD3EM4GXsTUzMDTk2aui973MhNcczVW3FH/ns6MFZLXrka6Kwnaqc
	 lhDXMG0225nSowuhrl17AygVSZBZJjGFnBtlCyM1G0hcSOTKnQtTDPg85su0BPazrwbs0
	 k+ALi7oYv3R9h+5UxaLkO99V6+g45oTsM4OXh+OqdD22Otjm+Y618+xuE4MaVCzCJNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992672;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pWiYTS5xlZMJkO9ffGbPW6SlUMuEk+RahN2CrYFfdU8=;
	b=iQldSC/qbtS3Fj1bGLF+0BYvPeEq/j5CioiWYWkZR5E4k0tU4PVhDAJQWOwRY53ffk9E
	 cCfC1wx31zzPNAp8X4/0aAbRMbNw8mBFNLiA2L/V9qZZaztlUpENIsiDk14Z6mO7QUPkC
	 beBAkzRbFJ5QpbT/4LVJsLudUU+axXFmUagV9nwIacqXEwQEz17dKOA6LBJqlKc9bOW9I
	 SD5A4K2Ge5Xht01Rt6gfRr971Dkex+HzEoRtWMai4ye6KY/+BW3GkfnJw6J8x3fPWyic8
	 o7pEDItjuE/4cpQq1wZsmjsi9NosUQQfweRf4pmgxnxY4pWcbQWQe6ZmVG+dl3u+3YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PKLEFtZ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iWRsRuil;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AA9606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55AA9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PKLEFtZ3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iWRsRuil
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b97G2728036
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWiYTS5xlZMJkO9ffGbPW6SlUMuEk+RahN2CrYFfdU8=; b=PKLEFtZ3m5ovf/FK
	FiMSaP+eiXFmhzCrPKaLjzAX0H5Tx3jcBhuuNeQFH7I6DQwxw6WUsAdQrpz0fads
	LQt8mip8M/jYaKXP44NZYvkSS67p17+vFnjbsF6UpToEh1OcVRjRMdiZ4hmLvoMj
	hLWexFGoDUWXyLWBjI+s9iRPLgVwf/0XufgOS4scare6NtemRj2NCYUfF6dabvrR
	GWIOfwfB7pntWVMPQsUWA2cPVj7nsQ6EijXoZPBWQZOjbb890yonUUVAWvM+OKTA
	xV2X81H2C5N0PB8g2BuIXcep/le4omOlFjDxF83QvzZ/QdPZncvq6g/cu66ng2p/
	kyRKCQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6n0su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:31:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaae62796dso12119855ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992669; x=1793597469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWiYTS5xlZMJkO9ffGbPW6SlUMuEk+RahN2CrYFfdU8=;
        b=iWRsRuilFU0X2s4Py3ViXHhdw9EUmt/dEwtrzCEarvP9V1k9NsfUQSMKWCL1UO7or5
         VAu7k4UCMyZMTNOG2Dg6Y0hvT1PBUO5/QHODYHIQO7t0VO2dMRMKdHanqfNSwYOmxAA3
         EDSU6wqxH94CXStiqrnWWCgZOOpB3vHS9co3UrwWhwcnpb3ATjs112iImaq9jthEDo9l
         /0p6YfhvRL+qjCs4ZEuRxFcJzOiptph310KyvIdY9DVi7nqVlxCxEzwBMztxp0ADMde8
         kd2y7x5Z7FHjTT/ZMQgvXOdFuk7pt0NsGLQxHDzXZ2u9AHU9mbhdVUGeGIrS5vu1JWJz
         EEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992669; x=1793597469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWiYTS5xlZMJkO9ffGbPW6SlUMuEk+RahN2CrYFfdU8=;
        b=cg73+w3VFX1EEmQ0Pj5Mvi7f3B2OODX8tepHEZFf9opozHkVDb8zWopC4ZrnY1d7sz
         X5kgZ/WIBs3p73D1/t3hAdnaECaHile5MGt7c2Ziw3PQL84tLGiEpEmOXlxmf0uXEcuf
         Y3PKm1e8p9du+BcqYOSvoJhcNXCQk6zQr1kJeAOHyhsf9LXf6Jg+gOOn0BtriBjoTmfG
         y7XWogiLeSUMYUGNe16ApjsAm1jHO3H0MDGcgRbUn0yv3nCATYvhp4hLZF1/BK5isCFP
         oPaVZKI5/iXnWrAIJnCuqRWPZsjWvzFVaoMuP4FE1XY0paVGA/VD0uluh4ftnrZadAJo
         Kt8g==
X-Forwarded-Encrypted: i=1; AKwUvBwHZ8lVrkohk08GsUAeAJw5aWcuGLwBVkhC9Fru8qxmSAhitaqQXgG04zjsQCvNn/OjiO9a83moW8xPK2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLhQD46GrlGJ/1myFMtZV1xgQLw2kJlpVqySn+EaF/J4tu80dG
	OU5a5b3Qi1T4tqjux/p0S1EzK5o/0jZ0N0MOOTguCs+nB5J0uIZU9R2dJjrAsR3BnXg953s0bov
	peBoog+KUSZbxWQTaZImXJXUaMDuCh1yOgPsvGpF7DVEbgRL8hWfMOtBr3putYsFcbpU=
X-Gm-Gg: AYBFou3RA7M4SJxryhGGtXdAJVOSzWAGGaZPBS4FNZdudhR2yMlWrXG34NM8oLlGgVp
	OJ+u2WfLPgwjQUxnxvjFJ1V4QgXLhuaA01kEQniCWjZ3+N1d/D7/OkO8dESL8OiwUtUg918wEtU
	mCWGWBm+QvRU9xCKakibv83FoeW2QKJzNT+v+E+1rvjc6ZNzzwlpI8NWXKAiLAaXcP6+RlrUkNL
	Yr4WnV0aOMC6Ae0V7cnA+SJShkkOOcTUQBDLl+g/PqjqWPdDBLGZasYEf9qBrbEr0aUTbaX6ehA
	aEpjDldigVMYib3Pt1sfGt4ueFA1txLnbjmGgkQ2YUX6RJVFmq3RMLlmxByfqTrQ7BDPkHO0EnT
	lqPMXNO3BG5XPVlfkvyS1fZTOMi3xRQ==
X-Received: by 2002:a17:903:2d1:b0:2e9:9522:ed3b with SMTP id d9443c01a7336-2ea9c84b245mr45565895ad.70.1792992669195;
        Sun, 25 Oct 2026 22:31:09 -0700 (PDT)
X-Received: by 2002:a17:903:2d1:b0:2e9:9522:ed3b with SMTP id d9443c01a7336-2ea9c84b245mr45565785ad.70.1792992668719;
        Sun, 25 Oct 2026 22:31:08 -0700 (PDT)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1dfee1sm11134745ad.64.2026.10.25.22.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:31:08 -0700 (PDT)
Message-ID: <5a761083-d031-4792-9471-93d013abc45b@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:01:03 +0530
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
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: lemans: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-2-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-2-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -7sYYJR184YqwJMfnDDEd64z4q-szHHD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfXxcMgnpQ9x7X/
 /YW/ecUWeSEY3Mp7tlBQ+syEmAFw3gOmO8VNMvrsqRvD/BRf0tl5bMFklC6z6d7V+7IyNd4dt6a
 fRbbEZhtrHS5WIswDjqvfcgbwcTqlUs=
X-Proofpoint-GUID: -7sYYJR184YqwJMfnDDEd64z4q-szHHD
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adee59e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fOTrkZ0PMPD3N0poT60A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX2Abxlxbb0S3/
 WxyZBCbmVpW6Hs5oaeC2LYqGFgsHYDwVaLIRiKgPW7XsJURiaOelsgO5GKsC/NkCco3vQB7g5xe
 Er83FxUOtVypt3USnM8IjzVc28cUllMFfM/0fo1JeV2LamHe4K1ZN2VQ1nmsO4bmloWnwAKNE0f
 wxJi0YYip/MXCUBzn3TFpc3v+7WEH0mYLqi/XwRlleyQwgliQOhu5qAyalfHl2ikbVQrNO1EYnG
 JFjjU0uVIdSatArFnvtHk1osRAwAXzwrheI5F3c4UoCCKEsdYpzc8JUiUQhrV22+4Jy89zZY1Cz
 GKjm3KfEtNgkfISTdu5igQzTLzW7dBVw6MvvWZucUtdKXq/bFuIgL14UzHVsQRSIT1VRVEoND1x
 ph9v3tWy0jPWpxyjRoMiA1mHXqDltI948I5WcRW290kzfm59+OSN/AMXPSdGyxmhDl1XJ16YcWq
 dXFi1i4QgVZHPweK6yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260021

On 23-10-2026 14:33, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from Lemans device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
