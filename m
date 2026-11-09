Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213843;
	b=TMCUHrs/IbS77cRgTD5Z4G7WSzefN4xa5bOIje93pvt7AKVpQwaWDCXyyAWM2pYa56d7
	 QtvBU+uKvTko/FdIsY/0eS/miAQqpGvh9GpaWkohH4+gP/8vtRrSq2Gw/dQZzQNeGQr0i
	 xTI63DGF+Q+gXVxKd3kLK5jBCztDUjUJdyXENPFWU/u0wQ4uUnkg9eOCBQPhLQReHHKVl
	 mOBNDWRZhTIslg2bdvFjTxXrsiGRaNQVVp4ljMrULgIKRD53aOa+S4uyO+2zJNheV3VKG
	 V4IA3W9aVykRqYwHYsJzvMJ5HXNnEZ/ij3gdu1VvIMtZMz/sKdF0md62vDGAc33zJjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mprexWtZNDRMwk+G2v0uaj8aq1dqkuFGRNlm1HMFGvM=;
	b=F3cTa1d3IT04Yq3tQ/SFd71Zq3E7fcNMzxpgJG4HpMl6tCuQbjZuHvB3L9UzXXha4YJp
	 KlqbTE4WvN93tMd0z1HfqKToL24xAgplCnDAbFxQse+otxLYg4SElGczyf+EIjW1mybTb
	 kSXkcBjfq7zzJVNAtwYgmmUwYBGRpve6DKMf+X1A+8R4AT/9YBHR5D2dCwP1Lc+rAq7DV
	 71lhcMf7oEsh3+fj2XBKSHzM9wpwCN3XvCpDAkDjshkA8/Szbs2bCnxv+1Kbv32BLhN8o
	 /qww9B9CbfA8Rx+JXZXzcAX2n0BHLD7YdIM7lS5KEJYxWysZvWbt/7KSetvZfBIvwMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Oj0eK2u/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUmWnG0s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A3606D83E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D85A3606D83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oj0eK2u/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUmWnG0s
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AQGH2007668
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mprexWtZNDRMwk+G2v0uaj8a
	q1dqkuFGRNlm1HMFGvM=; b=Oj0eK2u/6vE3/0SZR97f0Xlk1Cj+xcfdD2fZs0E1
	LFdYZqTN2Rd7Da5RKdTijzNs1u0mb1EGkCEBuCc+1/0yAnTfHwXYZMb68kj7QqS3
	B4aOYjHD33ezrZmPXVcHfw0fDSo6boNqyq9q2iVeAZ/bAoxGnwMjQVhQdEiKDoeT
	A/l+W7j8S7COn2fHrsjTgQrquo5oN3Yfg5ZTfJPQOO9EnM04u+eKKehI9UIymAOB
	4sakDt95XRdFrXQcEGfqUnC0zWRUas+HNEzF/Dx8HAApATTM9WCP/Nfc3onCjgZQ
	XYptwiXqlSX+KoBZTTrRYUMCuVCKS+G7ouChq4VjPKWxOQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k5aet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:44:02 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b206156cc6so536705137.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213841; x=1794818641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mprexWtZNDRMwk+G2v0uaj8aq1dqkuFGRNlm1HMFGvM=;
        b=dUmWnG0sZkUcFV0ud8mzOU3tbo2RFWh5gWof52clB6BfeJKT3FMeT4adbITA02fw12
         fZ7Tdt7NDsDR4vHUyVtq3ofwn7N5Zn7mK0h9uqP9dcH1VxIppbXwFsH/J2sDBm2Axe+h
         +v+ZX/4YA17vadvq/RIhVeir4Q36Qo/LJUuQUsfeiRYPhu8Rnzs5bo9npgacenzmrYmj
         //7lxgJ7jo49rCFeOIsINnVnphGKe4PJI54K8qy0cC8MySM4rz3m+5c3RpJ7SHXLBNyi
         yMBENRvTWju75+pBBs7kNQ5gpSv4ezeGQaQqTpWVrxZtwK4S963ssu4cNdYXZo/yAugx
         e29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213841; x=1794818641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mprexWtZNDRMwk+G2v0uaj8aq1dqkuFGRNlm1HMFGvM=;
        b=mFSIbhIjRXMoA3q3gArItcQNl4mC8Nl97T43+mcHmgPju31K+ifgiXSDj27NUev4V1
         Tcxs63Cem6E0VIvxHPb5LMqGZ6di1xbrVaZzTBuTuVugR9JM/GPBmokXV8nWf66+9urD
         RnYyNj6tXHv15sIsjrTtl6/pgkHKOYIxXjtTaiSV4w+BkbyeQdclgse5zItbJkX7Q6/n
         TdVonvg3rgpcumpVIJdb2/LZ/uYUXlFytnIHOhAIy2o0UseKnFPoFAr8qTHUe0bqEQMR
         lnJZVdJ1zYRdfkh287lJT7/fBR85Sj2xWrugEBqUF0EmHWzs2fXAtKn0qdIxF1XSGmHw
         iQBw==
X-Forwarded-Encrypted: i=1; AL+hErHK4lG0pdUPHcUdSY9mGEFQM8JCGC0mZ4zwNRqGXzfq9qK2Wy1jcQJcqBYIoM8TuNNvhfzXnXvNXKey+ns=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pUvI87l4Yr+pAmLWuT+Muba7OONQv8uijDG/vwkVYCf0JV8Dz
	DF3Q8meJchjHBHeh5/KpegZRjzhoO8nRcp+PMMZYt+71BdlUHmu4VIzFI6MgyQkrFzS9NXNUzgo
	/Oi4M5hyU4O9ZQHxG+oLqinaZ4HTnHb5HxRqrZLlvuYq5K+1ALi0md6k+BWr48IA5GC0=
X-Gm-Gg: AYBFou2pJC6jdvS8KRMXkk44cD4a8nbjRNgJBLTkeHupyN5HyNsLgta7ObcLwQ/CLyZ
	RIZBuExI2cJg5EMK+my5hwjf3Ga+Nn3RQ7CVqlw/+G+hHhVicemBKaK4v665S2azgrPIPVgLaLJ
	VOK4Zkf1SkJGvQ9azjIHY1y1j5+41D34xh8uJ3u5lyaM0v+Mr5WakNNLxVyL12KSIhkw4oRNPxD
	xWOq208skta2UtopfxnliG6ibhwnxRfZZ39LVQSZqyqOut41j+VuYbtFE/YJ5b8GtADZjpCJ4LY
	1jY3PK4fFAu2blpbZDbMkk2xwzv9EqUsBiufJ7o8So0rLjyDeNwu9T/vvQKk8xIsIXCnmEAxdoh
	Nh/W6Ya/YIG44nW9Q//me8zWJpmYPf+fi4Bnj+EUNexi+d4FQzaM94TaHFsJhZLg=
X-Received: by 2002:a05:6102:3309:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7d2db220cccmr890400137.23.1794213840892;
        Mon, 09 Nov 2026 00:44:00 -0800 (PST)
X-Received: by 2002:a05:6102:3309:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7d2db220cccmr890389137.23.1794213840331;
        Mon, 09 Nov 2026 00:44:00 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm8264698f8f.36.2026.11.09.00.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:43:59 -0800 (PST)
Date: Mon, 9 Nov 2026 10:43:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: glymur-crd: Fix L8B0 voltage
Message-ID: <qsrxmnicjhmdsdkvcl3nnymgsq5rydacirrp32cj457twaryy2@xl57osz2nawx>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-4-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-4-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX5atXNqS3FR/q
 nj12+dvZ9koWJ+oE6SOHWnfgH353SrfA+EINCQxo1Ns+rr57iPgQd6c5GghDgl5p7Wc9yKSiK1x
 r971Fo23yAQKDfK9AOQT6auZizhHXws0zv4aU3pCSAQ4btMNSObCbh5CMZEJysJ94u3OkzV1gYU
 KmTQclcpVixF+bmxg7H1eUzKpQUGIKzylYPLW9D0uJctNywxd4z2d0HHJJfKTE2EY0LcADNWAPf
 HQYIqh9zhqRGGrDjzB5/g7rR9vK5UBpHDin3eqW/X8nuKJm5BQ3KCOOZRq5jNnmKYyC11QMlgp8
 VU8h00DUs7JBKBEc/wcsoZ6ZG0k5ipbC5HqH0ZLKwWqeX3IuPdHcD1yKK5pA+3dWqdrfTARdiOk
 K/5sb8GcF1ODm4LcyAvNewrz1QQuIZyLoQDm+WFX08w9l/5TjmOI1JcrOPTs3cmTaZ8d1n/+hoK
 D7R5ZZ1DG49HVsy4SsQ==
X-Proofpoint-ORIG-GUID: TvGelFwKGNuvUIk1z-FrZTY3tQeyCKUH
X-Proofpoint-GUID: TvGelFwKGNuvUIk1z-FrZTY3tQeyCKUH
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af187d2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZkbxzI2-Od9abTRmLGAA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX6kNWTSBm6zBh
 ou5QE7qcGYCYNY4dQ0Ajr3VKWuZVMSEKIM+ocQ6xVUU/V5x0yI9wi6h5rywbQa+qrp2i/Eyf9Cq
 yvHPH46CCnhKO2QxXwughUstv0az/Bw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:05, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> L8B0 supplies the 3.3 V rail of the PTN3222 eUSB2 repeaters, but is
> configured to 1.504 V. Set it to the right range.
> 
> Fixes: 9314c6ecace1 ("arm64: dts: qcom: glymur: Enable Glymur CRD board support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
