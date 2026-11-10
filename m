Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319910;
	b=Bd7R0e6nVv7hD5hVdiGjnCm+m/UHz5D1XLvdaB/NTLP4XJHGu1NoKhvTloCGQvVCPnBw
	 9PZmYtWBzyPaIK6ao2Jrv4IOb6ouz96nYmRCqgcEU9cd02K2UuEDhiCE4zliqJmcqxME7
	 N6dGXeLYf71hO8nWQ/skPYlWvizAIpBKGsJ0Cpf9GZcKJvzgphAG9le/uEEmYSB5R4m5z
	 QcRll269WOhDboc6MSrTh8jkKjdSTVTRuX1GAwtAtv2VLam99ocDYO8SlQXnliuXJFGds
	 kIv0o+lSUslUT/ttN8qrq4ZoJdUhTQIp+wv3FhShSQrbreyTXBLzJjSvrgP/PuqEvDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
	b=5H3A/+lKL0awgAJqT4jmPTr6Uj9th+x1QdFpOh1A5WWWajpPB/Vlqnd71G+L6v3qJxl9
	 AH6LJL1r76Yb141FjNQYODEjdXWuaQT8IRxfn3svVEaMVUt4hT+ieHgxJzir7Rn56+fhP
	 T2Txhuw80dmqTeV7Ljr4IqJ0j+7vlA3bniiMnNEGQy0c3UL3AyKQ24eDNMGljXog75l7X
	 l7QNuLuYPda4auxqsyGh+ehYPb+4ki3UbxAEaix7JQu+Ey1nMQPQKfKkosLRXO0dnA3Kw
	 JRr64g29LQxPJGuDCMeYLL16DVJVHLJt+6ua1/P3gsRDilrDRK6Co1+6RsBWJyQZ69Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=blpI6bvV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NXeO/yq9";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B39560A2622
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B39560A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=blpI6bvV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXeO/yq9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA9kf2124822
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=; b=blpI6bvVI0nv4wLC
	GBvh/yOu2RQPe6bTSO8Zi48zC4YOA+3DdgJFlraJb3dohvKvsQRE/hnbZ3uvR601
	d1zkcrmuK7O7hKlLbED8tzncGDiCXiX//QBigUEUDkb1wpJ0mXRdKQDU1vPbVOCH
	jlCEbMxV3WTQ4gY4IP1d/C4GMerq3N7ZqoZj91IF/B84B0A6vRzRSQnzx4T0BSAk
	hIIDEvMwkZUPmMQTAIrBcQI32/WkeWZJALbLi2MXPBB+vWPULalQeFopTl87m4ir
	4PxLQn95D6DgOpeMEUWNvNzyA1cpnAmH8SPWxojiiZyvC3JxWtESUDhpOVQJSNFW
	nD0T1g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkkf8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:11:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so3419433eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319907; x=1794924707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
        b=NXeO/yq9rXyXpHbJjOJt2obvExYi77dvmusesoVb0TcY4SiAKXOh81V+fSE8ubRIun
         sNra5QfacdKdnikb6NqgqiY6fdJIhSZGLLR0Jg1/48ZjPMpexpK5WUZPrL5Z47kodLT6
         G+lo3PZz3QIVblKQKVUW2RQtiOnUAp9/nAmkgiP4cXX5MCu+jkr6MNTh+j4DdxFmWBuX
         2OTWIjmEKX36k6s0IK77kzBM7i5nas4UBrzb2mIPFCd/gqm2ZErqsiMkGP12lOh/Fg3r
         9zx/cBbC1sujU+s/icVhOaA/2bhmMaURKdkdoeFq/jx8YaDWXo395uMsTj8qHCxPI7lq
         gVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319907; x=1794924707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
        b=vf8vDO2hNPdaMQv4tvTJi3KD9/K20uJCJNUpZ3HPch2+eoMv5ryRFEWU0HeFmp7r8q
         TnaQ/6fWsBFkgSl+ruHUYqxVDSqr5CB5k1TYV7v2iDzKyx6KbTTn7nEqNgsVyFHPCiMR
         OR7NyTvfKk358p2ALYXGUuEgT2Tw+3qxZVa7Ht38Zm8YEs5NV+ca0odo74pBkYQvW9nd
         Q8UHEYXnh0LEMwf8HqGlxVOt3vSoIuBNmfE+VF5nhgseDnwlJEIbhasIiP2OTM3qGlJB
         P+7X+9DZFn33OmopXNDhO7NjciCgZhIza3zmDthtPPSMj4Hxp7BxH8DdarZY18HpXqVd
         kDhg==
X-Forwarded-Encrypted: i=1; AL+hErET+EaICugU/D65BdxWyJN32OvFpnhVxCzOSlmeRCcMpap7j1ZRvvmNBCenlAQZmb2HtZHaKQ+djw9e+zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/BcMRA1uUis5B1Ld7hRbb7mB4/4wlLcNFg2Yje+sznlri1Obm
	CSAnn09pu+YW7TAiiGRbz1zu+Xx2ws2gnVSUxzgnsH7vI/Et3IvpYxvJUwdRuwEk3iQo9gdgqMS
	FsIy4hAElPxieiUz7NLv5MGEoW4mXtvn9zSdHSCS8HrX86nKLTBGJIuBUxqIXyvh2aqY=
X-Gm-Gg: AYBFou0cFJSVYwetSGcXmwrhIV66/T4bmkxQWgLDEugbQF5pfj0TI76XF/n03pjotA1
	5P+q8jTo7YwUvI7qf+4UHnEE7rJ6pP2qbv+w69aYAfdLxdjwBVT7LIpriVOCbOxePCsh+PV5Vg3
	8DjDQA4vSpSbF94SFbSD4oVxhqxu4/rCOQcREnM0V66SmQp1nmOaXYVlYr6xt3aUl11taEFIKhh
	g0KuIvQe39wCcb3Kux3vpH/FHBdGDX3C1MUka1lG6lV4hOrvMWF/YkNka6cIqeis/71B10S0bjw
	YAu2/XSStSz3JOBat6NUlLT16zXeck4/m6WTI0RDZrAZOcnSr4IfR7E+DQXNPYglvQM20kz7qNc
	BUBAVPRx5a3DgLQ8tS3/ezxADZXSsZlosuM50M/geyPz1Nrt8mgquQ9u3HNh2hUJ9CahgR1w2nv
	pYCh8U1Sw=
X-Received: by 2002:a05:7300:8252:b0:376:2e3d:7c62 with SMTP id 5a478bee46e88-3762e3db094mr431886eec.12.1794319907328;
        Tue, 10 Nov 2026 06:11:47 -0800 (PST)
X-Received: by 2002:a05:7300:8252:b0:376:2e3d:7c62 with SMTP id 5a478bee46e88-3762e3db094mr431835eec.12.1794319906552;
        Tue, 10 Nov 2026 06:11:46 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm8059128eec.27.2026.11.10.06.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:11:46 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 19:39:50 +0530
Subject: [PATCH v2 2/5] media: iris: Disable the system error work on
 removal
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-iris-handle-unbind-v2-2-86d5f6f1dea8@oss.qualcomm.com>
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
In-Reply-To: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319890; l=1393;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=mTtJUAW16Pa3NLyR5lT7gqKE4xsReqod6ALEVe9NOI8=;
 b=sgYIsWk0J+dy5zR0+93KaXAWwXH6anaB/lPVLcrZptFqpFLlsKwfzf3esBGAbCBTIfiKr11Y0
 Zn8JD3+yTXRCoeGqwa1VUCFVDlEm+U4fPN+LNjyiQmq32Rb+/2MK3bU
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: XL5pl-0LqH4f00gAadnQIw0_DQ4WSNfO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX2ert2e7rSM2S
 J67oGSttQGPuxZaXjMbFTBAOwAwiiAkfvTp3T+Ug5qYD92Ot2d9VLfZJW52FFowXnA5lM80wrf2
 P7C5UA6vW6pVaEtvrhwzr5TTKTxJfV8=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af32624 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bZa8m19-NPAJ73ByzVcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: XL5pl-0LqH4f00gAadnQIw0_DQ4WSNfO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX9E4EMZPCLNLY
 AcNnDFfm8j1D19BMF4o760srIjFadn81spTG0s0onq7wFEGA4logWDh4BD233LTJursCaehTQma
 yvCPqlf9YAVRHAMnpJR645AwtjhXNY9+sUh/UezEaoNbf/VO9I2SW97e86eLGIXXzf6WX/M4yWr
 L7G5cZRrdOrWcfRyb7gKHUor2BffZFqe7rYCdgygu0ZZUPOgmwWNrzIXy+ME57n1O+UWriQ7kH2
 h7AMtsnWnuLNEQIpjutcioPfVWHcdK0ra9M8TV7YEQmtXmcbPRCdeEUufeKFcvhkJfrywzItcuQ
 1aXk1MgPC7lVX1wGHsZ/n/A6k3+OZbShZxf7uQWVExu9fao2BoF2G5E40gjB7dwTgnqNPMaGdDY
 0uurYyaWwExleu5JAiBXx5kebNv3ZfkaKa6KrCKFKZXY5wwWjChOPcshmO4LltndQuBNzw9pY9E
 5tZ48B7KRRVac/z02ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100056

iris_remove() calls cancel_delayed_work_sync() to stop the system error
work. This cancels a pending work and waits for a running one. It does
not stop the work from being queued again afterwards.

A system error interrupt can still arrive after that call. The
interrupt handler queues the work again. The work then runs after the
removal and uses resources that are already freed.

Use disable_delayed_work_sync() instead. Once it returns no new work
can be queued. The work cannot run again during or after the removal.

Fixes: 452480931648 ("media: iris: cancel sys error work on driver removal")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 343e44c6b9c4..6f02bb629867 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,7 +251,7 @@ static void iris_remove(struct platform_device *pdev)
 	if (!core)
 		return;
 
-	cancel_delayed_work_sync(&core->sys_error_handler);
+	disable_delayed_work_sync(&core->sys_error_handler);
 
 	iris_core_deinit(core);
 

-- 
2.34.1

