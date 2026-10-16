Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3583ACA7A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132624; cv=none; b=FKT/9Fk/olqyNxT3uRQlhNMPCHJWzNUumJ0EKMljk4pto2PtknHM4vSbL+1dUSUDl5XozSsQ1nR7td3O+JIZPmJAy4tUVknNLBtm4lQRW8qjTmUkdWd2xPTk9Dta6MDBidBLVAgvXw1w26bOR6Y6M0R4Gl+k3gC6JyIZoxn7KI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132624; c=relaxed/simple;
	bh=WTQqvgd5qbzY9TUSBvUH2oDxa2Jq+JX02wLUEi1lOPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXaSdFs/5BoT62rSQXZ4G9D4sLbD6gCLo+XVMk00QSfSsjofS6NfSkB9uRhfkvWUQ46RZfPZySfJx8mmpxsfdv09MU4OmEcFEL+1qDn2I9H2T4i8vjmsd8Gw47qUcjwM3typFGv1BDTxYXd53Jt1KoXcsaltf1eKsPM9XaYjeHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3eizn/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJ6ZeoMd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3eizn/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJ6ZeoMd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2Ujde3902274
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJHfsFVJSJ7+ACt1yGwBSr/SsVtOFErQhNFKlR3rnGI=; b=C3eizn/ftp5Npt00
	0alqYppoxsqeQGUUnymowE0Qb7fUkpeqlboJRQqeoWgTm6JoJnvcjI0iSmP0kRck
	a3tGTkZ2qlYMKyv9XbA8akMQgTACcTJVnIL6XN0UitrC44FJPP4paShEA2gHsSrq
	mMJTFHRZJlmtJaIgHFSYgxnumUlyjpZFiwMVb4o1P5dDeBTx8A/vZhoW6HsShvgw
	uQ+bq1haNbPCpe1p1FXAncScNq+DGCaWT74rj95NK++Vrsd6fK2kTxONZ00RqYwu
	09KISOk7ZKy63ofusDFWar9jwjgpAqMbiGSHBdqqwh3mlC935DZKfRrLZtzmmxxC
	yeBNWw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3setdhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:37:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so4228922a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792132621; x=1792737421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJHfsFVJSJ7+ACt1yGwBSr/SsVtOFErQhNFKlR3rnGI=;
        b=cJ6ZeoMd068KbLEZSHHtEBx/6lJ4GVO+k8L4sgIeL2VmXxF+UgNnaEfTCQhRbmovuJ
         A9m1+wJ7nYwccFW89BQW5ozgQy/abC1HFRJB12ixVZjXkJGI9JC/NHxv/3mWc7Ftpg1a
         wCso2Y7GIoJ+Nq/TVFZjvEyvwAzZP+P074Qy9mZBhCyhyzAyxpUClJsiVwbxBH+ISpcc
         ymHxkZATQjRhso2uZhMiRP97Vym0BjLueC0Hndy6DH2dsvnxuZ4Bd2q1cqv1QZOKnS4U
         YBWB1oqCCLVxcIWy5Ah5xbk246E7P+5gLbRsKG3GlP1NwU65+MBmgjBVaO4nz9pYmuzW
         Wpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132621; x=1792737421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJHfsFVJSJ7+ACt1yGwBSr/SsVtOFErQhNFKlR3rnGI=;
        b=orW6lRvQostfCS7tsPjJKfzcMiGyyoeZyG902NksP5NMRh1uBChWEmGxLlLDThcLMz
         F4WBvAdj0hDn16BYgRGqZt64jS3xfCUBiujHnrGjku/tFb0ZYv+16B7T4iDAnNS80FKz
         FbiTk+KFlX05vvKA1jJcm6A8UpyNNzfGrYN8ip/24geL+IJ8eGcXVqkm8X3hE2tFFRod
         uK+JniXKJc+aT+ytbxSvaGhpFsKMtNZN+9Ode683mMpXA/9mzfU84+FYdzJ3HEKfbafq
         bX2xDfXSVRF5hEh+oqbhv4O/guyIWET1z4qy7WtLOyQ+wxXOrpNgUTpVRChvn8mWh1Dq
         2vpg==
X-Forwarded-Encrypted: i=1; AKwUvBzSF/+ZH0C8hWg2BR8K+Rb91MQUvONJouT+9cdURUe5mu1mhpdouYe1Qdd+y0JrvQDGnf6F12zb4hoiutM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIWPpbqhxBMLp70V8TqVw1ovIPIiqhiCxIBFmbqgFI8tG1Hbqv
	jx7KZLUr9f2QeqbdhbdmOvKfDi87E2mv1gD+YwPjlapiq7pf9JJIN9I61SilHDG5iUcCsaTyK7g
	0cfh27rz127Hn5hsGcgogNa3oFADHeyAGapPo8IYokTn4UPv6MBWmuac1+eiUpjXpi5s=
X-Gm-Gg: AYBFou0KfhuAeW12qzgGxY7DF8iusm7u6WCIE0qVrkndjYskr6X6Xqurz6Q1pgd5Orq
	lUaiJ/K3PhcukiJ2BBbH2US41VG+x3xjFPTfcHFtvgy9kMJWm8TIMkc1wZISdCmYw4ExU2HUZgn
	9h8Co26QGQYc0vqDJKZ7epzVI6kiogik4KgbyckxEQQg6ZgLGR12DLmkPMM7t6HHhDEIkIpRPXb
	GlWMAQBYyIBulZeQaaBh7GU4VFfLVS0LqjYhnxikDN7f2CvP1gnp+wVAmxA2FMhm37NtrUk4qUx
	lae489EWDkW5kiBhHc/VVI1FuF/oCzPt/LDS1ScM2qYhNZKAGUTwxQhKp+YSf+1N9Pt1QyqVqrB
	sHZ3wV68pfvqeaTzSahvymUYdBujFXcI=
X-Received: by 2002:a17:90b:3cd0:b0:3ac:7377:fd4b with SMTP id 98e67ed59e1d1-3ac73780774mr6795844a91.45.1792132621368;
        Thu, 15 Oct 2026 23:37:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3cd0:b0:3ac:7377:fd4b with SMTP id 98e67ed59e1d1-3ac73780774mr6795818a91.45.1792132620784;
        Thu, 15 Oct 2026 23:37:00 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1e1esm2703298a91.1.2026.10.15.23.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:37:00 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:06:46 +0530
Subject: [PATCH v5 1/2] dt-bindings: misc: qcom,fastrpc: Allow hex digits
 in compute-cb node names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-glymur-dtfix-v5-1-f56a8b94b4a9@oss.qualcomm.com>
References: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
In-Reply-To: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792132608; l=1379;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=WTQqvgd5qbzY9TUSBvUH2oDxa2Jq+JX02wLUEi1lOPE=;
 b=Mrc9IOZWEdpsXnqQNzy20+D0ruDEPXdge5U634vqEFW/HR+Ap3DGPiVwYsvFOtQdBfRLWY4DE
 GaUdeR/eXxwBviLDC0RB45dDWECj6K4dLSB3+VS/R9t6s59ZRwVTuu4
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: l0LyKC1RHc56l-0ZlsPmPUBjnWAZ2HYj
X-Proofpoint-GUID: l0LyKC1RHc56l-0ZlsPmPUBjnWAZ2HYj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfXxc639i2JMoCi
 i1x7yEa5ty65LjPF2JgI1UqVj/0gfDuG5IhN9Q2MZNzLD4c/Auj/s7/RWwR5+WICsEQGgRrAZjh
 rMeVhbnN8aqXwriz2lzCmPYkuuq0ar0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfXwEPXOtIG+au3
 2TkIcOi9aJTHfMkZcd5yf/y8Y+34iRT19GqqXom/KcKRrRTTT2DRgosjKM20JfCghbBCsrIH0Rn
 Kv0Nl7Oz3oUTzk8eOUSddUFedGC5ul5sl8Oc2gBXZDGiOP7N0RHX0Lz7SOLLhP2BkrS+hjtDe4h
 FRvMf1+77wjo30l0MhAQj/IkQeQF5QqczJ/wOX+cm60Ouyq0vE9Vyv2eVdKQ0MoY7erTNl31Lu3
 2xEq3fGqz8gt2o4POlAwfs8rfqjg+253knhGQyObJbJmIp57wrK3Ac79g66o5v6eVwe01svVlRj
 z+0rlnn9mLbjO1A4CnskOg8ISocPHxM1X/KOnWD58A+IcYAPokTEuPRqvCw0EKsaCl55t3c5th4
 Sz21MRHnMSJihzQa/YXPxxgGjHpMXKEUShN/ruPuqIDjGL72tRqvs6IvbMswg4ExrcI0h7hNVCH
 iIuKXxDkqenxGwYtcLw==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad1c60e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=C3F15k_13UMA7PaxDcEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160026

The patternProperties key for compute-cb subnodes used [0-9]* which
only matches decimal digits. However, per DTS convention, node unit
addresses must be the lowercase hexadecimal representation of the reg
value. For compute-cb nodes with reg values >= 10 (e.g. 12, 13, 14),
the correct node names are compute-cb@c, compute-cb@d, compute-cb@e
respectively, which are not matched by the current pattern.

Extend the pattern to [0-9a-f]+ to allow lowercase hex digits, making
it consistent with DTS unit address conventions. Also change * to +
to require at least one digit in the unit address.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..d9444f452585 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -79,7 +79,7 @@ properties:
     const: 0
 
 patternProperties:
-  "(compute-)?cb@[0-9]*$":
+  "(compute-)?cb@[0-9a-f]+$":
     type: object
 
     description: >

-- 
2.34.1

