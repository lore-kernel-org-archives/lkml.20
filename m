Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8152F38398F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227356; cv=none; b=iSXjaqDdZpjN9wIiD0VCYa8S5XSqWbElKkPvp+xEw97VhwQF6/UNkqagrbFS9Z/z5c+Boz6hu9q2lp3cHsXfZuDyYiTJNCkuuSUsWBFE0ZTO3YtR9AJIeDx2WDCkM5apZTLVuywopofnkehyPtqv5uiKF8W2fFNn6LGjlcIkgGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227356; c=relaxed/simple;
	bh=gxcvj0KOnHwI5dUadhryMS9KAVUEfdDmh3EcnxfKxq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rP40FPYuzs1+2G+fhKfw1YF3lS21AXuXD5LNQs37Y4f1DZ1g4KtX0gJBeMzUj4IDV2IHsnG4f5X9bqcPyf/HoXUCvwXfnijUEsQRy9hOVA0TfYCluFXOdWJjSjRA7zfdjGahqq+iXHN1fE+nQ0suRFOtyY6v9tFGNXKqkEyLyew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uh81rjka; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1xsRqMS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uh81rjka";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1xsRqMS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdhJi2606769
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aAA4yBz2x1MDnJxsSFSl/P2k
	omSZ2bvSIHTk8jsqx6s=; b=Uh81rjkayZAlNB03JSH2r3gRmk5jLSvbYfepXLlB
	PDnPTK6xVGjNA/9DCUUczf5fPfZQaHlHPrza/Xmxjq0S+z7nHwkxPtOdUXR7BwFs
	uJhD48Vz7rLatuOM3TV1EqmKvkdNxhC58mDLBNtY1NMGR1qWZ7300P68+gVfb14z
	/XdjxB4EEugwOWX+y3Ydl/4XMj0JFNB8PfWT8Keouzy3humvTYBpG+9saAz391L4
	S8lB8EYgcZPMQNCOvJmU6C5HQn6YFCYBh4jlh5fzVv7YQ9d0x/t+9lSr2LVSwJ5L
	KIbs0ADosdxq/1jrbZEPeSLhXqDXyxGUURCEMqMlr8u8jA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c98u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:35:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a05d645acso112250985a.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227353; x=1789832153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAA4yBz2x1MDnJxsSFSl/P2komSZ2bvSIHTk8jsqx6s=;
        b=R1xsRqMSga8eEnpkl7WD4PWqETTd1kGk7boTPXrTwhX4bHjoCk4dFO6J4KJBRQf3Mn
         l3u7C8c9+ptYPALcUSkZ+l3fUEDiaJWVGYRrGbKlc2M9atIzWjNAgUqQYwqjjcDRRIi1
         8Ag2JMOVGYhYh6ack4SJ+WGTZv0MPuA//7Eu/Rk4SbuW3za383xUYFlLcvhTe0fdugeq
         NZm/vF0NDnpQsE0a1TxhI3x7vCw/qUn6AHUsH9ORoQXDzbGWGlcoDUU6Na39LySfaTIZ
         UNsbSrYEc1tQ6HhKl/ouOXYUwLnz1Zj5QaQEQcXnufg46P/fS5u0Woz6hwblh9srKbsz
         jhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227353; x=1789832153;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAA4yBz2x1MDnJxsSFSl/P2komSZ2bvSIHTk8jsqx6s=;
        b=Q51RgZlLTZLf0/doL5gjgLjCqWOj1PNfGFGdeVeYJyFpDkBprqBsG5p0hDcCoHLqe1
         14po9UH/0v8nmbb7/hBUTCnKZFOF4re1u2uWeY7TsVqBdoc8YDO/hpTOv51GU0RkB/S2
         mttujRnvG6dAXaSCyGVJKggu0LM3+d5cieHdbiJwrvFaJLWOY1SgK4cLf2wfkfYQpYm3
         s0X9HWRU+2BbBazymY5LAfx5gYMOTo41jDZO9T3zr1KQzuedtx2QmJJc8/0Ibul9wcuS
         eIbJZKnYL1mrySAOs1/RqguWjlOOd9a9RPYkFzInE6rYQ40ZpsYbT8P2cVHH0WMoLD3v
         tKNA==
X-Forwarded-Encrypted: i=1; AKwUvBxc94CZ6kEt+r9Ct2SpjRDoWlQgynFf9jAgymi94KLvMIne9Kt/tqZUNrayiz2z+CZa3bEN4//9Pxpz/3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nlsP0KmCiM6A56rfxeTIMbtMADW2A+PbLrq/znFApQceWhTLtb
	CU440nwdTvzCrD0HnGNTrfKsS3BACPseUChnfIsdWNpT8YSu7zSzZLm8NX2awtDhYbNpZ1ZiCaY
	tvBRGMCWYrrgj2qQvpE4pxGbYewLfRPCmWMOSaFOeo6gRm23mAO1usWo/iztvJ/2JSUo=
X-Gm-Gg: AYBFou0OxT2eFWxNwAzXRnxNi/+aZ7lMhEwZiPxRxyX73dYnDm0XUnJ4vCaIKVKKFKU
	djYI6LxvFVkPButJT13EkiwSBM8Com3JOVAFnankPBkVV1P5s8l1fGPNrLrJjGDTivma9+jfdZG
	m3hRMCP6me2tGa7cRqRdryZyu33UyU+mrxbQ0Sq9r/BUBofixnJwV3h3TYlnku/goxXOABzW/uw
	axf4yDXfM0JyxsD9IXsUT5xLYWF813efPPYrSILb9X2HV+/x6MWbp3QiSdIEhlmYG7cpmyj5KRv
	bs8w5yidOLco1NIFIe6FLNvPDxxN+8wXYtRxM7P0cvvW6z7gbUpMDJ7HELh9EPPGxPvZAuDgm/z
	gMJs9HJczHcIXQQ==
X-Received: by 2002:a05:620a:1d03:b0:92e:4927:2002 with SMTP id af79cd13be357-939ea28decbmr1485013985a.39.1789227352628;
        Sat, 12 Sep 2026 08:35:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1d03:b0:92e:4927:2002 with SMTP id af79cd13be357-939ea28decbmr1485007285a.39.1789227352036;
        Sat, 12 Sep 2026 08:35:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6cc11607sm63806145e9.12.2026.09.12.08.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:35:51 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:35:49 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Message-ID: <ah22mmvaofsqgivm5csfloqoru4quohbvdmdgat4jfkhntl7k4@mcwqyb6hq3bg>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
 <20260911-shikra_adc_support-v6-2-e4b2da5cd55c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-shikra_adc_support-v6-2-e4b2da5cd55c@oss.qualcomm.com>
X-Proofpoint-GUID: BqHSK0Juwubd3zRSo8TKZXp6-9wmVd6t
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa57159 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0iEBmV3l9DZ82o72BXwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX88Chtxp+EsKn
 dAekjTwzo03j9gHZF961HeIMdPQqQ1iF5nBAx2lKKLMyl5mYepS7iAoZ91xgz0TcwBKPKZU5t4Y
 rY1nAOnlQ8GIp0FfOBreM7pdXl7LHVg=
X-Proofpoint-ORIG-GUID: BqHSK0Juwubd3zRSo8TKZXp6-9wmVd6t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX51zNifL7KtTK
 ngr6pxRc6QDqYGX0zgloXNA3ysa54rqhCw+ulMReWy2fqJehmGYDL4dgLoxqlsnpGoSltlyaTxv
 DDAQ+hVoEBxQihS5RZgzJFvEKrjC4OUrSwQ8mSIe7c51k+/HZ6VbrTOgw0v6sixdKhtaduAZDem
 22cJ53vjCMfdJHjLCAJ78pURuS5bEjabKD+NGM3m9bBqQzt6rjauCSA8eNa3whoJ2rX9VEoUaVE
 EYi3Nd1mZbJ931c7FvwoyqdPu7TAW5sIH/T75CuztsDt1x27CG/r4Ctsgi9w+RAMaRSYkKHCKL9
 YJRE0XmfhTfr4hNMZr7LCOpWaFsyVkWs6gZ/FbzMd3U1cvT81vQSt4P7DZpnKK23OSIsnWNWrP2
 RQkJSFGfe0u7T+WIGcdxPd0UxLoiGkCI4rMr08oxTxfEzD7KRrji7HAJSEyzPaylz7DlOG/ohV1
 ug7X8yJPrYyIqwIztgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120226

On 26-09-11 22:10:40, Jishnu Prakash wrote:
> Add temperature alarm node along with thermal zone used
> for PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
