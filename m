Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995777;
	b=ygPxxO6oOMtNyZRcs7ZCFszr0e+Zdd7jFU56GFAqot+Gax54sLuCtyvsiUVvIzcBasCk
	 DhKQsMLgW2izbexm1YBpKQoZ9Anvl5uRcIaWwTcekHVqALGcKIYOdgTMdJW5APvYNJ1AR
	 EunBv2tWKjsYkUUbhVMfeify70z6pW9YGGwn67FHld/mG5D3tC6mnXFF65DMplKNZdxgv
	 JBfcwV5GQjUcd6CMeGeECdewEM8Ak+/toGkPlzc+04FaqZ9SsEyt8TetZM36eSbj0R49t
	 u/3oEacie63TU49IKrMwOu/lR7jw4g1OrNSuBimEyOECw1o7K/FOBrgQzJFjR4FW5RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=;
	b=axKceeTupT51QncSg4HDhq9D/SUWTXX204h1V01BxZfKZF+J4hKDsKxrWGVhxXLy+mxv
	 ifMUD3wcLB8Q/Lc857cq36TKb8Pad5L2I89Psc+PEkLw/6RW0iQBmZn+mKuUFtx4DgiDu
	 q9zjUUxuQtVz0K3RaWOFVCcNYakEzbcmhqTwTL8VkAVEfjFCkgSSjsDrAUVIaQzunVd7R
	 R1MwvrPaHbz63XXAcl4HAJASyvkF+B9wSz3LULRzlHsnugidW2XM8uaIS3d9Nid6LX7zf
	 3NCQPtPSgDXUcX6iFBUzkjWCvJpdhJG1OVNOdjXAbYiAkVH/Ls29OgDUkaC6PyU7omQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Igk+3iVG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yjep0Xqf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0956606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0956606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Igk+3iVG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yjep0Xqf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aQUF3300584
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=; b=Igk+3iVGlbz5b6tB
	V0gA1Nrz0Jly4J1OoNE4xjoJzvyRPSUvYvWw5qqIicKvSIFMpsef8xt0gCj8xm6u
	m+3YAe/99SqF4IOPJYeMV3u2Ko1V4qRB6G2Y+eMGuU5FssFwDbDQYNrc36fCvlYc
	O0BbhCKv3duQ+abRD280UU5h5nx3fFj/1/w+yVP+P/zvM4xQI18VQikn4VPcPZGP
	nNEITFedz13srfsp0fnhIfkYyy5z5Y8hYyDCG8prtOzLpxBgNC8oL06RDGX2Qody
	DkZl0Q1IRZ6f5nDTmYLGJMLnUFa7PLP0gfiyQh+/vS/XClLzwNAIG136J9NUOcwJ
	xlMm5g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshps3hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:22:56 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso6728852c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995775; x=1793600575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=;
        b=Yjep0Xqf6bdTiKRuVRARy9CvCTiuRZ2d68nGzYVb6CtG4BeVFbiGQFvJ9WKUU9ekGT
         nnGSyKxquyu1S7mZnNDih2yW6IXTP7Kh6T0SHWeyx7ynpHqYBbWk9JUIRGm129+YhIAY
         LFiMHW1zLFueThJ7ANwDRsCUFW54wZlH6AGpbEe9Ga0MTKfoLKSYL/mQ/hEnyeKg0w7p
         t8n3Rbw/FbH+4BFfZ/6jc4gdCYd6aCXQNWOLxUbMmC86AbGd6UBEdn6iwvGGBjdl8dvB
         TogHWygR0R5YLouI4QlovcHdCbGcUVJKo8Y4iFmDpxhhW+7NNkJfAWz+oac6TsTDd7JZ
         WSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995775; x=1793600575;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=;
        b=Ec2EB3rvNcCRCJqzlU4nZnm7PRbecGbN2w8LxTQ8NsEafhnlSgV0J+2Pw1g6ezQPDN
         eoeXh+m8jyDfkDnQhsRTT4Ao0A4Kv2XFcFx4xp351xWCgqSn9ftcggmBt7TcbRafrOWP
         DZB8+o+fJ1N9V1CD6TKupfI5lLJv+gzD8UNt7AmM/V9NyB7rR/9HkxRMi9EcygvpXVFC
         /YmjL12Se9GEGgqNRXk1wwymZVAKk45Ueuxm+K0IpZdoPL+5k0Hfkj0skv5c6CNHrgJI
         2CD0QzuCLCW7RsA+SNiz+yDxhMXRsa9+dO0/WdmMxX+PLhOfO2QwLyPgfzZWUSO7FuGH
         EdQw==
X-Forwarded-Encrypted: i=1; AKwUvBynqixg12uxeHWc74OtKIF0KueamCKtG1YzcZJY0u0bIo5cwM66bhEYJsUP3ienmRQsLIgq9WZgL79PAho=@vger.kernel.org
X-Gm-Message-State: AFq9FYIliXL7Nw29k6H25p87GQ2kKYfO5DkO27zAh63qSY+OWHZVDzvH
	tVrS6JhiUYZNYCroWaw5D1wwG2raZaghGUYVtZq/KpXx89XsxoBXsZXDGn8XrdeOFfFmV3Dvyc7
	kZQyuvR0wP/96UKwATXFjDqutcK38a2aNFZ1KYl2+Mu5WJjRykSTnjNE7HqC491tMBtM=
X-Gm-Gg: AYBFou3S7Mf5R2hcrigv0Kd+SaF3UazU2IUvXqFB2c2IYhdRFmGiXPp86EuA3f/Yu88
	xOQhgC14BB2T4nU2Gl2RqfU/RDoFLXz9ZF6ufrNTr3kyi5SoaPpgPCbtPUnFe0wvSD5TWqBJ3FW
	V4YxuKGokegOiIodZh5oMr3+P18mnKMiopOhK5VuXfL54rOhaklVxS2/Ox+zXs4/YsZ9jHz7w66
	Ma/i21itP6Qsjd8Gk9DgZ0C7nlfA9B2AvUZXvchK6nqYnwi6OhCavv7YOSsmtFlIn99HAIOUxg2
	bR/cM+tUlY6nNMM3l2yrYoVwwNTTahb/HEyCDjkdAxQxJ8Wc/YvruUi7wXSGrY8ITvsYZGixPgi
	HIgXwABhjgo31ob/tGRTgboraPVBos0te
X-Received: by 2002:a05:701b:2405:b0:18c:e014:6f1d with SMTP id a92af1059eb24-19929a9e465mr8204928c88.1.1792995775111;
        Sun, 25 Oct 2026 23:22:55 -0700 (PDT)
X-Received: by 2002:a05:701b:2405:b0:18c:e014:6f1d with SMTP id a92af1059eb24-19929a9e465mr8204894c88.1.1792995774577;
        Sun, 25 Oct 2026 23:22:54 -0700 (PDT)
Received: from hu-daizhuan-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm19719783c88.19.2026.10.25.23.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:22:54 -0700 (PDT)
From: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/4] wifi: ath12k: Connect to the QMI server belonging to the MHI endpoint that received the packet
Date: Mon, 26 Oct 2026 11:52:20 +0530
Message-ID: <20261026062244.2875432-1-daizhuang.bai@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com> <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXwEMBT4beafm9
 czeaYB1Zgpa+tOyFF7nC7YhWeMJCR4YmjR90FFrI0Bg6rKpC8nhYh6VX20de6O2XaZMOKA+1kKT
 Beb1onQv1rxFfihIWPmPug5Fjerdbts=
X-Proofpoint-GUID: F17cWWFmsB7wT59GZpQ3YJftiUXkG5wS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX95r4LW8gIzg6
 MCZ9+Ju5/RCs63EMku109KQaV3/O/lJ+e7zIdJ48Wpsk1RuFP9Rs4TMjlF6QXZnHx/U3/6hEZEn
 wgdKPmv6TElDApOtd+z1YeE0FnJF7zIg+t9Xjl+KvZIFu3oqob9heE1uX9x0q7LVVOvmXVn/T6/
 SbRDsvznXuyXt86Cc9aEFwgTEPn/I4qlBUzq+PepSGmxOCLp/IZ++wcsfXFU95E+BML/OC4kXdc
 PaIyQ3vFreoHWh27QMPjx9Gofy4cienDHni8PSbW5J/MGS+9gpM/AXNohM4YSwt6u/c3QRCpuSr
 S25OqmGg/JXQasr0BbViQPHRUlCiUWBlsThQH2OiSesMK5aLKA//F6zuHMbA7rEDMK13VHfTogL
 XAf1yd9cKR4/Q+F7+kSf0xF9jrKfg3RZVPIesTZL2+fhGtaJ+Q6eKpyZ1PgzRh0mL+aVnBTcfEO
 ozpKGw6afitti4XlW6w==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adef1c0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zDojY5Dqmkyknr1b:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nUn8ewCANHEy0S7HLBYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: F17cWWFmsB7wT59GZpQ3YJftiUXkG5wS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

Tested-by: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

I took the entire state of the QRTR directory as of after these changes,
on top of 6.18.44 kernel, and with some trivial changes to avoid conflicts.
Then I cherry-picked the ath11k/ath12k changes, which
had no conflicts.

Before these changes, Cologne WLAN QRTR NID could conflict with CDSP QRTR NID.
After applying this series, the conflict is gone and WLAN/CDSP QRTR services
work as expected.
