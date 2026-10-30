Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354560;
	b=c9A0PY/xUG54oGvvdJlC/kIyGBE+te3Z+Sy6DyV3aKGODZ3XrCBbYQl+4/9Ka+c3yYQY
	 rQNkioB/gY40TO4A/VyR2w6COWTPXUW4yAXtFz5+QEUg+vVrsMiKHgFdVXJZ8cJ07GhmR
	 yMVUgojw8beIUReZq+KkeSqVi/NJ5OO8IgdeCKZZjQtyvLvg0A/aTpU/s74vn2wk5h7fu
	 3TY8K/7Bxs3AUuJrToQyZr0sERo0od5oJ8kdildastMOPgJewyZrJq3TmOPHYiG16oVke
	 OI+Zczt8Wdz6l6Iii2YGgPLdV0OJr37ZdDtOyw7d52SGyQqNpmF4lVoo+uLxkyJO5sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354560;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XPOou6CQafNHNZDV+h/LKdSD2kkWtiLvC6RPPBJtYFA=;
	b=MpeTOjyoOG8CfEBWnfrn/yFWKnfhI3UquaX/KBWKcdsFH2uybDjOhMZ3l0Pq2bz3opJF
	 X4l50jUdRY5FmpO0JH+0SQqtdm6SD+daZLTNZPX8o4ukMmJCXjiXaVsyt9A3fSOALj2FO
	 RwJ8iM4FUvb5NEWN/14UwQt+AF4Va2PA9lE87nAWLMJyLl1kLkJZrw/ApqJRs5pB5nrIs
	 4xn0NpP6BtUl9NoRpfMetzUbCobyFHx2TVHPTJNLGfLFtyjwbU29vM6lh16VrqRAYpQTs
	 Sl3JzDtk5GOL3RnlZbnGaLabnpbAxcQflnr14yPS+8iaEWY40h9T9pjRIJDaadqgFDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBFHhwPY;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U4giFQcw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F56606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F56606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBFHhwPY;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U4giFQcw
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FFxR2374381
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XPOou6CQafNHNZDV+h/LKdSD
	2kkWtiLvC6RPPBJtYFA=; b=KBFHhwPYr++jbg4TF3vSjdJW1POzBYkAi3+RvfSd
	RtzlrtdMwBBDIaJx7+ddGCxoPXXfmqWm7EkxNxwTiKaEcrFSpMBa4iZEtM3d+eTU
	BIylE7jUINtqtnmJpg37mM2mJdqS08SL1ZjE755XYPuNUalOxi3xRMeTeZKKCjeZ
	EbOL8tbpLV2lQgWI7m+wpdOue51XGnlbu50aUMb0EZ0v4QVqy4tmZbIl9PIM0J+J
	eiSzVyUm/6rX/jfH+EPgir2UQbmcjw40pAZwGygoR1r5wIuOiTq6yMx1YdVlZIEN
	ad4DhGtxKOQRaFQQ5SMFS0d4E87WWuYt78zNnAjLxqNc6A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjc6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:02:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1467273eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793354548; x=1793959348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XPOou6CQafNHNZDV+h/LKdSD2kkWtiLvC6RPPBJtYFA=;
        b=U4giFQcwsLt8O88iH6fF/3J5vLMK0AZLuczdL4lXN18ry31u43LCXFz/OcNNCU3BQA
         CzcnAoyfclP5+Pk4yXSPHrW1OGIB32+aO1klCCIDdHXz3xcaIZkHJpwFYXnttyCXsTG9
         cAhffzpEQDariNokkBMlEFusJlkBcDoBaVZZMxgtv0rDWcgSfBBod0RhJMk0mD6zReFc
         Iv/CA6aOe5AJ2ojj8/YMkJ0dsaDJ9UsWTgS52GqP3hzpPUKwPqdV+yjLoFpM0UEho4d7
         kAl2HTnDCtmM++K98RA8v7+sJkl49OfeY4iIClunqZ3LpTuBX3EwQXl9zU2idNHqlNyY
         qsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793354548; x=1793959348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPOou6CQafNHNZDV+h/LKdSD2kkWtiLvC6RPPBJtYFA=;
        b=LQurR04HFnDR/XsdH2pjZrKOY669qVXNnR5K8VpsUDOsjveofX1hvtw4FVKbZdhBp7
         D4gl0d3M/a0acR4diVd+wN3stmSR7DKTwQQdlAjb7iRnqp9wOvDjwuE4l0i4BrXrRBUF
         UH29C8JjlAWUE/3UgXXW5puJdCD5FEHHj7NeR4zgkJkPsxEQPaSO8lo7i30wxm+JE9I1
         ZBM9NsSzseAndDeoEbrrHf+epz4rpHpu6TDR6Vdt6SkWDZWp+7sEvDEwASLAUaUIdIgd
         +Z/YGImrAf0pbXFgYhVuMyngD1eCLGsO3K7vh2xf92QnuDi8e+gFEp+zvOy+LolOAXIB
         yN1g==
X-Forwarded-Encrypted: i=1; AKwUvByxVPCA8plGqNEeZz02/XOXj63woqHC/liZiTAIij+Eck4GrrkANsOgDmvfJumihTfXeJN82NOng9lBt9w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzYqEW3xrTkpslLuj4DjssbmEQtrB/TSb6/wa3Qo/VVPOREcHk
	g5Jdzv6/t/+jL/NyVGchXWh60sIek0TNCUERNy84BLrlElG7tinUrESnRrkm0Au+YpLuVTvC1vs
	aQZqo13X3y3JtnVvyK/LrnM24mzgpqGfWqUpeNxvmUw4yoxtWV1YAcDJL2oOC2RRpJzU=
X-Gm-Gg: AYBFou3PkzFNFBmE2Fu2SUIwFFiTOTFpmx8XSIw0bj2+Q9IgLq2LvPFDT/FfveinAs5
	Xj4CQEVbxA4oNhdX8r7qLmhoPu/1KT3FNLamuPrvuFFwB4Jyo6gD2eqOhbSkpxRTKgPCYLalYBv
	w8I2wulPL3gTFu/WjnG+1lJvn4qTDJP8XlMgDQeUecB2RFFsTANCYA6yq2XhqzMuM2LIxjOjqNn
	UyPMhGdWhRSoUyhy3OLCwtpLbqnW9+zbvLRqFT7938WI70ig1ip8NRzAIx5cLZmnQa1MyR7fDzW
	MIBeXNPoKquCjPsvfKHwF+6lh3Syfc2RmH+bftudnQKIDkAW0l7y0sTxcTN7lsDDLy9DyBm6sib
	g85uKdqz7DSSyyDPbSR9Q7azG97JxEKpUU54So7vXUZp3oCEmSIMc2QZK8EVCeFwRRSMnfneJFS
	cb4UVNxHfPsVK4k+M=
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr2702554eec.15.1793354547651;
        Fri, 30 Oct 2026 03:02:27 -0700 (PDT)
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr2702509eec.15.1793354547051;
        Fri, 30 Oct 2026 03:02:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm6925218eec.29.2026.10.30.03.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:02:26 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:02:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH 7.3.y] wifi: ath12k: Increase RXDMA buffer ring size for
 default memory profile
Message-ID: <auRrK4JWN-7rUcG5@QCOM-aGQu4IUr3Y>
References: <20261029095541.685879-1-shengchao.guo@oss.qualcomm.com>
 <2026-10-29-1-daily-reply-0011-ath12k-rxdma-ring-7-3@kernel.org>
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
In-Reply-To: <2026-10-29-1-daily-reply-0011-ath12k-rxdma-ring-7-3@kernel.org>
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae46b34 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=3Y6tUoXcgYOYlkcqMpIA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: e-t6n16S5uG-pJu95j_xuti7Rt57ju9T
X-Proofpoint-GUID: e-t6n16S5uG-pJu95j_xuti7Rt57ju9T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOSBTYWx0ZWRfX7vO6tcs++NHR
 sLLlL6gGeyJjagZ6n7S92U7SO+dtRY23NvLgC8ITST+LGdaLf0fSGRMroojjF9vFSG41+kD2Ozn
 TcRFSPPG0fh4qG1mas2Ex0/W0nKGb/5D83OXmhoXxVqyi/pmM0awI9tN0DrxpiedW4DWtfK0Ind
 JzxtjKDelxtz7uxyFYNdA4MFkT9UBGqKfjMMEfDNxqAuMDj98+2vrmIRpFCHtQhAk1lQH3795s3
 J94et3db+Zv0CA70owRIJetbyXM0v0ewhJTCGx5ZrB01lvqADySHGRANzyxneiP5eBxqZ7cRBZl
 Bgn+0GjFX5XZAPaEU011EHALpbnLtbHwHNbjNVdtysqFkVMAGxvUnGH4Jk9OSYqcSctswqOUXHA
 XdCzEAjLEzQ9vv+1BkZnSa+uqpE4oIUGVKsAGsq0r85CJrYO3ysAbMPAXpBKtwIDEkH4ik1vEJ2
 4s0Qtv/3avEgFx3F4rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOSBTYWx0ZWRfXxdcPM6SIADwr
 uLu2QkMdZfgOS+iuqsZYMIpPpGuAyl6OLkKBM2JC116QHzM7p5IOhLYeQynQWa1BV0nDbDgbz/y
 qKqY3K7Wl6tUYG9vyldGOPyyg56IxjM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300039

On Thu, Oct 29, 2026 at 02:43:18PM -0400, Sasha Levin wrote:
> > commit 15f7603b69a83a0acc7fcc8992ecbea6110f9424 upstream.
> > commit 643f0bf936176c114d5631da7547e991b5d99f10 upstream.
> 
> Queued the upstream chain for 7.3 as Greg asked, rather than the folded patch,
> thanks.

Awesome! Thank you, Sasha!

Shawn
