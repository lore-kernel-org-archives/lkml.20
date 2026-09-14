Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B716B3F54C6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371625; cv=none; b=e9jrTMigiuWxLjFFb83iJWbKMNMM/uhe5MSAZ6ZVA5YQNc8fAT9YQ8eF7QxetE7AT9Wd/d3rw0iB2MryulAU7yMLPKYlSxzhTKUwp1348HCAlgtNHLYbUcEAzQLNwC0HdiVKeK0Eoq7UYHT3vjxp4igq2bEr43nJmBsLW7VFJjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371625; c=relaxed/simple;
	bh=ghXK1W4D5whbR8SPBbaqvXVAbzeAKlrM1E+vk0N1mq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ulc1AnG24jcYwnKk5lJ1A1iKuPz4j0Xejf1fDH29nlyS7wv23JXFhMvNVoVpmGZV5NserdA4DO+U47MKhN56RarDpCTdsDsdFo6jE+cWtCy2ECcBgLLObMrfzMeAvZH9mnUdhtH/1qn4TSyTew9q8MvvWLcXBlhUtBQMWkrrYYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXJNAud0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcwKMoGI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXJNAud0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kcwKMoGI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikXX3196157
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PWnct1xCSH3LSH5yvTj5UYkb
	NbZDOb6fZJReyuFwq64=; b=VXJNAud0KMuhaQnZcXrJJvHKLxSRmkeoj+TqZzRJ
	OfR3LrtKihuiy3eCXlEAzozx7OzkhlHi3us+LWxsO4BsAGsnDq5wfha9RK50Rd4T
	ZlH3hdClwaOGYp+v+TBpu7iMjCMa1ZHZGjcKqerBh+QNNlti73xiGAh/Y8IoKR5K
	rPehzNj2sfgHoVlPm1TGd3y2qmbDMIbNFzJ6NqeoITxlbCoSt2k+sna3LBW/pNl1
	baHYzK+3QYZi8RoRnof7XwcovH9556HRaupRxFSb6tm/46q5aPvTHnSAhlruRrx7
	sm8lSptO/5gxlv1EHjOOHJ0SXEtd1Fq0urfy+g9EyB6rtw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdhqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:40:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939a6937513so463238285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371622; x=1789976422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWnct1xCSH3LSH5yvTj5UYkbNbZDOb6fZJReyuFwq64=;
        b=kcwKMoGI+7S1+TZoFU003QkizicBASZqwaVbgIDDLiayVPs3zhgpFFMhLY3uVT6fTG
         H5rICgvSo/b3f1jSoeq/hT8jfhthENnVyhdvBrUoh1Eku4Z0PKReNN0P+ApBt7s8f860
         quNPmEG/O/FuZbOtC+6Fpm48hqbuSgg86BBBwSdPqUIebfB50mqeZsZpOR7qcz7Sx2dM
         V6W3JBXLCJaGXNNsujxn5mSZNPVcj8L7FUy8a6XzoB6LGsAO3Ktcnk5Yh7W22gpoum4H
         +EXxCSHgs0czkttGcvty38bd8cuTzBKVum//iJzvMX5JScXapNwspcogQ4eFoNJhHNJT
         19zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371622; x=1789976422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWnct1xCSH3LSH5yvTj5UYkbNbZDOb6fZJReyuFwq64=;
        b=i+tjlgNcxfYSnaBJWN6T8ShCO7aZZfZioCiY3oL7w+Ovl9fpWMrIYwxl1T+sAY5JF8
         CUmRyabsahh0qS4xX9YPh896Qe/q3OIb77S4U5y/oLTVzXu4Ws9C+sBfzAQVAnBS2rHi
         sJ2SzeaDplSpKKJjIiq+WanYJRoyq9p8jq6PJnw1i5tI/NEc+5b+JK+QR+2K13bm7UBk
         1REAlL8quMecJFV6HG8MVTi51OrrpQqsOUijlCPNqHIH65wslBvymfw72u3CrI1i93E4
         5L3U6SK7Z0hqiGDST06EpBqQveocoWO2mgwIx1WPp+UYY/bFTjZPw2d02JGCdIdtJCBO
         /H6g==
X-Forwarded-Encrypted: i=1; AKwUvBwNcNu4HIqeObl/wqPoaOE5+ZhgdAmWunQENIw/WPdovnUowo6Jiq1W/2XPlaJezyI/qA/7qRKZzmLXOSk=@vger.kernel.org
X-Gm-Message-State: AFuF++nXcsWxP+GyhvlD5553sQruF6+gOI8ZM28OiU9FkAaXyi9PhftS
	IlUU2fvLcqffM55xi3Tqsk70/aUF3cLnlPDN2I3dAp65LBMuZ9E4W3DYJJB++IS7Nu3Sdio9w62
	A5i/v7au8AAkinSV8L5LFu71mJLdo9ZWcB68dajR3/xUnxvBtoS4JjBiH02+alWRcTvE=
X-Gm-Gg: AYBFou15MJCuEjxH6mAyLgqbnDU06Oqjwwnpka2upKlv5OXLk1zZjlmiW4YxZbtyrCJ
	KNwiaYvANpYBD6zir9EeyKIhd8ao1adeZB6epi6ALDp9fly/8JCMq4lb3EvXYxXBY73UKxDj/nf
	y/bd4thUK5+Gh4+tJnX27c64+A6CdkE69scPFOGX5lJiMN2piqp3/oZgQT001/JrF/cANmSxRTB
	wy0ZVNmYMvLmc9z/bZjExGSeUoNWsoY7ucyYYIOnIWZNBnBABWPG0cubhQKeYeknPDNnGOzSUZb
	CvbwtdFS/Ymq1FHy4Q5Y43y9EJb6OzWaD8UIOqvDBYqvnuyvfHKVnhVV932IAILdNfDMV+U8noE
	MAhhxGxEHvrG1N/A=
X-Received: by 2002:a05:620a:319f:b0:939:6dbd:de57 with SMTP id af79cd13be357-93a299fbf06mr196504785a.32.1789371622043;
        Mon, 14 Sep 2026 00:40:22 -0700 (PDT)
X-Received: by 2002:a05:620a:319f:b0:939:6dbd:de57 with SMTP id af79cd13be357-93a299fbf06mr196501385a.32.1789371621465;
        Mon, 14 Sep 2026 00:40:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ad0614sm318424955e9.10.2026.09.14.00.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:40:20 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:40:18 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 18/31] arm64: dts: qcom: sm8650: Add domain idle state
 names
Message-ID: <dt3njguunm7djcf4iycx46hhgwbky2ajshkaul25geruardx5g@u2slpgmakwdo>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-18-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-18-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: OkAytXB6CLjz_mM6dVvG5L6QEGxRE1Hf
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7a4e6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX/pbf+9fhhuo8
 TPFguGTi4vviyZsq8brbgsfJXjR73DezNroj8O+9xQf3pFK3JxwzFJU8+BSiWo3uso5S65Rtge1
 cFGK8qprPLFzqtkZrqYpqrYUpFIJxiU=
X-Proofpoint-ORIG-GUID: OkAytXB6CLjz_mM6dVvG5L6QEGxRE1Hf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXwrVCTXGMQl/5
 BkSM5hjAw8D4F+xTb5k0oQ0IxIb+bLVZltGZIxP4YZLc1+v0VbJaV08rGS6jVLrXhHDAg2JeqKy
 MRBs5cDMPci26FSUSJNJAzUSQvp6eIi+/LLiPt4KKT+Zte44qRGQwGkw1c9KqhKLcmSlVpXEoY2
 KEsweJ6FfyroWms5FXknKk2EkzqEk9gpE3KCLbrsNfC07+09+iqxvgPuqT/SQ1bM1N4QXHYBjN0
 +/NWce0iVTJAzeuMAJAnsqhCpQ07/6tCVjytsYki2z+zSK1XrWzgPOaBRkGgoy8Jwiq3+A6aWS8
 9w+ldwUkSdnTdAaJ625ZsjeRaQR9NM4a90ZkR0rJgNFCysCYMOz7aYfabL2JEnaXqW95JiWCZAL
 dFhTEBbYqogfZyt5xaMlumoAtsAi7dbQZVqEdAESXHQ+qqFl+mC3Bwt6Tr9BqbBYvLY/wthYru7
 4NQ3cfMdMdGtEFJKQAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:50, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Use little, big, and prime CPU idle state labels for consistency with
> other platforms using this CPU naming scheme.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
