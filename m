Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186142;
	b=rIEGu1u4Tf5LiUSci8cHPs2Qk72hhr0mYws2zMPc4npEjTZF/DWCcYO7nAK81bZHM6I/
	 FRH02yUVXq3rRPoCpDax3LTm0y55xZtdscoSq3xmesx2HFVyCZhCAjn1kqx9sUBvO/8Dn
	 0A324e8TXH2vECxHpNPx/Nrs72aklbTKDSQprbRgzwKUndorOIJdrnXg1ARyEqnoUAbuI
	 Q2ofU3ibdRPBWng/+aJspD+7Jtdz+plG9eAntjDPE5sD+07KBYu5BPUjLb1lOybSKa1Hf
	 lBHF2+7oZrNGIU7eDvByH+4yVDV/l5tZiJr1p40+KPWtjQYBseMtyE8ujwW0WNQkobg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xhyL1Ei7knGKSSnNkUp7BQz86vn3fbusF1+O25OWRvw=;
	b=pzOszx7MC9VQYbzYTet7hXozDBTXk7j+ffa2fJRIf7bWk5W37gFcOqer61Hm9b4Q7jnK
	 W2gb3iQu2G8a6om5cbRnE5mTMrlxBeoU9CzM5A/7c5GsFy8KraCgOiJs5lVJIUpmYchR7
	 geB08wFYW5dKUaQrYznfSnjPzXFGvJLjUVl2jwvYrkusLVjLBoSxMw7eF7XDV+ekztxtU
	 z2p33LbrG4fV4MrFuQEhjME3iaX8Vnhr/TIBxVfazbbEdr/9hvw2gMqNUqucLFRXhL+op
	 4+RbnaR/b6eF4nv3tz2/QriokrOCRj+C45X3+XTSF1J0x1DxvxMU5NBpAqXQBUYB0Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BMqUNwNh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A74606A31A;
	Wed, 28 Oct 2026 11:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A74606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BMqUNwNh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8JspM611811;
	Wed, 28 Oct 2026 11:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xhyL1Ei7knG
	KSSnNkUp7BQz86vn3fbusF1+O25OWRvw=; b=BMqUNwNhikeVmmRommG4GPlVs2n
	+eSeZbQmhg5/qzVs8wyy6YmoBlLKS9oKmGkog+MBQQyor11ixjxQMNe4yWO9CnQI
	dXvf9bjwwH8LyRjaomVN4khW27M9egHBz//gSJLgFDP8q4Po2k7/xLpU5GKCFkPb
	mJD/tTTQlYfQhz/DkDVDMn8F9pa+JhytzdSge2kYEileG04e3q0SF1C2tLfodFKy
	fj2hYCqi1VO+0reY7QzUVpRVEnehndg2U3kqS91FfxMzxZ22Dsqems3Ud3VFyyBH
	v24mLCb84GmRVHNfomQdFaCED7rPavgEwEQSmzzJZOELPSeKSMDfCIYCDhA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw93t7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 11:15:40 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBFbPf3250129;
	Wed, 28 Oct 2026 11:15:37 GMT
Received: from sdciot-sh07-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTP id 69SBFbMF3249814;
	Wed, 28 Oct 2026 11:15:37 +0000 (GMT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra: map WCSS firmware stream in EL2
Date: Wed, 28 Oct 2026 19:15:36 +0800
Message-ID: <20261028111536.1096781-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028104226.1075335-1-linghui.wu@oss.qualcomm.com>
References: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com> <20261028104226.1075335-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: B_69JcDFDtQcxwuXodLCg6p8y3--lQ1C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfXzDwkUpShKzKO
 QWCdI9KLissXLE2IRqxF+7WlQKlQAZHtSaREhZIsBc7DmnzgPMp+JCTl0cfvBP3uotwNTPlNWB9
 qIr/xC/2EWrgjw6N1RyPHgv4BGjQH24=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1d95c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=B0mu7JO4EtI-fM-TRFkA:9
 a=QYH75iMubAgA:10
X-Proofpoint-ORIG-GUID: B_69JcDFDtQcxwuXodLCg6p8y3--lQ1C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfX8Kmn3Mn8nTIH
 01s0GoayDOLq02a7SBFIQT4D9hhzrov10M8hV8QMqsL3JbhM5wLWyZaoMy5tWYzH9HsdX2JDVQ+
 F+YtzBZoqkLUC3WlouMDhKf+cqovyNiPpHu6vFWt4XnbyU4Q9iecPM4QhNxh8+wVgSgEiKhyFdA
 sT6mNxHvpFIJ8L3nJFErspBMlDESz7W9KyWdHiB+RgybGuC2ohz4TEzw/b1cMOD7vFka9a7lXgF
 0aIa8KHRrGSkLHHiHb61YBzH8mvI3C398Ya5xFHj9FXKwI10ciivqUt0MV3AtGJQo0SddDvtdQt
 3nL6gq8vBtzdQtkI+RflWocTyUAX6489wzpNGlCwZaCh+eTW7IztelyFUr0bBCmdXY24T9w3kuW
 UgOKz0Dz2pmpn3dDLySasql3/z4H1ZOMPBn4KSfky1v8/fyor8WcCNI1Mdy9FHr23VcS7NvCkPo
 Iu/A0YO3If87I6suXIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280044

Please disregard this patch for now. It was sent prematurely before the
required internal review at kernel@oss.qualcomm.com.

I will resend the patch after the internal review is complete.

Sorry for the noise.

Regards,
Linghui
