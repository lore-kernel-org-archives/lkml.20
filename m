Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740075;
	b=Ig/XYcx1kn6cY6khrKp0hVjlrDTY3Ud8ujnMmivvoLIyD3Z61khLyZ0uFGrhqQOrGRnA
	 hBPe6Ub7WgZUmRDySyl+i/y+r9eKEIt8YcW0tsSrj7stT8xCTIsgMj78FfNsNDsa8oaZ1
	 RIm182SUfOsn0xDcwaGg1d5w4sSyp5tvzIBmKwVudK+eHoyOkcMpOlVlbustJEHOkU0J3
	 fYESzXh43hdx3HmwLd4D8kTmqzg+ShRm53/ALuKqCuFT6XXuzINQ/6Nq7GmagCNI5NrLT
	 cjYTJ0Lvrek1uwWeSyb/b5Mzm3TO64WB0NesBuF0vEjvgCRBFA73Mhly6k8dFESqmPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3Stj3y7d2zjQ9nTgF2QbTYbeZnbVnfXOQ9Q7r1YW3jI=;
	b=4+Q/ZcQG+O0W1j9tIkvusPGsf5kjQxLb9hGeqfsgUJTJS2LQ7A8bOTLJb7KJFQaF5Ca1
	 Vc99JQP1uWbjQW0GvPKR/xxq8R7u9N7I6bWGEKAHlGz8y7IihRqLq8szzTFIfn+JlD1iR
	 n5aVwR5AnMsXZyJ4qpCTS1e7Htn+NFP/2eskaZskd4X0lIxLoOfUvfENAJM6dM2FEKDdf
	 aauY6bGf8su7B6cQReu0gfJ6gSC7VDEdb5xILCC4ze2/FsQMkIZbwST13yPA6TUCUGeQr
	 GFVnwS9NyvuTZQzSkCFBXAaMqhc6CgRVqk2W+cxyki9+0kmM0UyRnB4e+nKZSd+ZmXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IEltu5Wj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cfyBHH5C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA58606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDA58606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IEltu5Wj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cfyBHH5C
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F9DS2112148
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Stj3y7d2zjQ9nTgF2QbTYbe
	ZnbVnfXOQ9Q7r1YW3jI=; b=IEltu5Wj2EOEoYuMbU7Rp+yEdb5yEQO+oGDu7yLT
	bRNEcKHyufkkzCDVowcbhUqSUFKYTSYqeY9gvdi8IkIgJjoVhuzSqLDwp2lI9br3
	7wqzT4+vAj/YIX5gdZYNAO6z4GMy5kdH00HYKSYIbwt2KpItkAA8Fsl6YHD+xC4V
	erjT2+MHJkF7Kn4vK5fx9VLeqRG1EksYBRxZ+LDPr+T5ZE9OXaIA47mW1++QM4xC
	th8KAXMGyrsd4n0JHcNiYicFPRnKEm5PHYrTyX9Bd6NGMSakVPE/veuTxnvgmRRL
	LidPDb7hElvAW/wToBSUjUCElgTydbP/P8IYmxD3olhAWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsyk9vt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:21:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso177606385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792740073; x=1793344873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Stj3y7d2zjQ9nTgF2QbTYbeZnbVnfXOQ9Q7r1YW3jI=;
        b=cfyBHH5C/u2TJJuBhpThjoMdAVlhknLN1mCb4bNplQaIHHxJSayDILGw0qJVtW8Rop
         GMkFHW0tIlyuBf52D6VoxGf9Xd9BbrUnclL7/HhqaKIfFYHxxWInSkOqQ4UckfRRe3jO
         4HuN3jWOO3p9YP8U0X9HloM87McjWp+0XAJkx2M/Pvl8dyIG729gAjxVghapkJVylmjI
         xqXK75/OkOxzl0mGlAo2m5ZAqYmFkRkEba9ZcFd7YnkMMRmmrOIwOf1EcQdQWb/lbqiI
         W+XlZf331fNwTmrX8fkAprrG2LE1o27a8AUi/IZ6F6XfaFybdnNwxO7FlwqlAFHxSsKQ
         2QRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740073; x=1793344873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Stj3y7d2zjQ9nTgF2QbTYbeZnbVnfXOQ9Q7r1YW3jI=;
        b=xIPkGz7ACMeqFaqioW4RvAfin8AqvpbrbXd0tw4JzW0xcS7/WbC2Qev7g5T+KRVSjr
         KM6q53Iw+s+NhIH0wlKQRNfPZCFuptqr955heERp4W44FbDbToDhrQNyWAM8bRdva2Xt
         h9NMIGg/CpRFGZz5jXyoIv0OFY1vpmU84CTUvEP76hbQN4F+k4mxhToGMIlGGwbsXDVV
         +Q6ulK2YGvrMv/wGhI8EKX3jS2Jdf0ZsLVgn1HEFk3A7Mv5X0YpliqOHynobEYRadhXs
         ZYThgwSyaiUrPIVgmau4ntTzYNX4zEUmL/Id5x1ALyK9yBsnwaAFT1ug1gmw9t2XMWjd
         5yvg==
X-Forwarded-Encrypted: i=1; AKwUvBzdWMuFRc7wfXy13odScY9qfsao4D+vF424L706sAPpGBD1l+uLl2qA8hA46XiD6O7OdkuOdruXf/yb7zI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/3kLkm5td9Vdx0srjDz+NvIgVBHOfttNOBNjjb9tEvhDRn4xj
	36JEDrzOSlMnDr+RRFsH1gcby8CGkxI3lCEWunPXpQYUge4rCS/nxCTU0O1Q4khVsrSr9Xf/2d9
	tgiCa5mOlb7wJBfmhqFhshgAQ6oDYl1H+AZwecandC8ZZz4rmOZG/zTTpaH2yvOzh79w=
X-Gm-Gg: AYBFou32NgHe/BRdPd/HlbisbgWB8IJmgIEwZgjjYB3hnnhMotEPP9mTCki8sNYOUzb
	K8Rkf2Y2WZAzH0oDcoPbmpxX1otAjiH+WQc+Kiql9Tu18NqVsHugNYWpGtzzDy9ZIV/FUc/PUAX
	1TkagMVVGj8q2DtgK943jT6SkkQnT+6JlmA9wIWmwHGhcbL5NLNOS5dCMv/iO/B3FYYY+Wt4oxM
	TQhIvryjoxiCwDCXiCJdTAfqWPcawcPqSZIbX8iIv5Yo5wMgCqaB/32GjJBVg3iWat2yeodIDSY
	XskRJMzdRFwh6zQ3NiVB5PHl2XHhi7I9bpyABSnUFTtvXSMqYquzaIsofMXB7XFzo7O913JSogH
	vD0mpT/GNZnsaVHId
X-Received: by 2002:a05:620a:45a7:b0:93c:c4da:f46c with SMTP id af79cd13be357-93f6f824b06mr269985085a.56.1792740072747;
        Fri, 23 Oct 2026 00:21:12 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:93c:c4da:f46c with SMTP id af79cd13be357-93f6f824b06mr269983085a.56.1792740072198;
        Fri, 23 Oct 2026 00:21:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21555fcd1sm15676145e9.4.2026.10.23.00.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:21:11 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:21:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 2/5] firmware: qcom_scm: Transition to the generic ICE
 service
Message-ID: <2bw26iiqyl3zo7s76hbpwotlowmeeecvqk33rhbcrb4as5blsk@q4yn52qpsieo>
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-2-b035be7aab0a@oss.qualcomm.com>
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
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-2-b035be7aab0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyOSBTYWx0ZWRfX2hm/W3vP5uI+
 TQ5o2AIkdFHkag7UrVJH95H7N7Ax9Jx/SeXaU82xAESh+Z+X3473NWHi6hG/dRy15ta4bqZyUtj
 sXEV4RHDtj9Z1JeGNWrMgnPKn20WQm8+xuB2iHSF5fnkb7qsJJuhjd7blCngfxk7yErPatHC4aA
 znAo0/kamGtBstW1TUb3wDlk1qlo9rNVI6auOvY+IgyYyprT98S+G00zYrHWXCq/+Vd3NgVGvFb
 90UIf96D01unNvMHMFQsvkJ4jNJXSCrPCKkzLMmN0Ou/iT9iEZDke3hcsvkPimow6/qdwvkLxF2
 ym4/XIzkNHRY4/bmxygjScaT25v7H56C0luj+jWVL5LZhgcMlj0CthQKBVE/DJNhK0j44L0dX+S
 uaE0jB/DReHuE+r30LXmsbPJb/QOr+kn2bObUq55ky+MWh92cFPlTAx8c/gwJez8v9tJUPk2SkM
 T1+qDkfX00B+o5nl+3w==
X-Proofpoint-ORIG-GUID: UfjIg6SkXUDspPQqFXuJ3VhLIn18l-w7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyOSBTYWx0ZWRfX4IrKJZRFjzYu
 mPK7Le7DwTdzk2CkdnLf2hjOFBg0LSH7tlBltzSiP2HK/KpIPruqb6gVFzK4IdVLC4hOUrXusK2
 nsJ5MZ4DkYlvUFDiY++RFdOXKzWcLJE=
X-Proofpoint-GUID: UfjIg6SkXUDspPQqFXuJ3VhLIn18l-w7
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb0ae9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=i1ch1AlUq8TPK69w1s8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230029

On 26-10-21 21:13:08, Harshal Dev wrote:
> Transition the ICE related SCM APIs to the generic ICE service by
> registering them with the service's operations and wrapping them in
> exported functions with the same signature.
> 
> This prepares the ICE driver for eventual migration to the ICE
> service from the SCM driver once the TEE bus based back-end becomes
> available.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
