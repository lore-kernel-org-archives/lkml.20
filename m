Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D80265620
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371746; cv=none; b=XIEyAPY6gmqvRc0zvRrFcJfhy+BY/g6iRBpJm9UoNJZDMwmrErLMjk5B+awW4bU6wgHiEbst6qZZSntMUWPKleSb+Vmf+O3IM7h1DQPnCPwRxCKkQReVvQXD11qSXKorGmP7rIikBoGOAEOL8SEgF2tacNyFrU3ElFfVarfTHWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371746; c=relaxed/simple;
	bh=hEGigLVsABYi+19iFHU7a7vBcEAe4a7cZGQQsrQeVtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjXBX5qpMXAlTIdxI0eKYBFTLMv1X00jZctgoy4VtE31fHTf3okslup8Az0xfjEOvkL3ZrCMHtDBNUwAgLMZb68ieiMcAQcsHP5O8/0E8GXwkX+qBvK08yGwZRt+2kM8kY2xPjjiCdOP3qXDpJxdnNskosF0pmoLXQcui6DNFww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lT8OwkmR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ac+EhU2y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lT8OwkmR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ac+EhU2y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7S26Q3351624
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1KPSWCtPsZzDfnveyc4r3Sgx
	7K6pKqfSWEz8fsSXk0w=; b=lT8OwkmRRJtmiY/4tCbbPA8fImxSW0A65QLf0Nrd
	4YytYhgLTovlK1VqLZSVF3QMxR/LkGiQfvJzBue42eVKaSdPu4AEUe1um5VodSA3
	PhUZICCBWI3UhEySH796Ft2Nbsd8xsqqoqTjjv3K9MouIItmhZuXuQA3HFB5g7La
	ULFMYbflyVhlnef66XLPGxDGFjZLNXfpBtD07Egg/wrAouZQEr4eAAL0IMfoQZdK
	KmMKNZu3spFrk4Jbny3+5s9pxqABV/p9E69PW3aexhOLshOvwIZTsf3iCJVatc67
	idPEDOWQ+Ji431apmCD1LVmpq3plb02wZY1nKs5+66SfPw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg01qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:42:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so792755785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371743; x=1789976543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1KPSWCtPsZzDfnveyc4r3Sgx7K6pKqfSWEz8fsSXk0w=;
        b=Ac+EhU2yyFSejFuYBlA2TWSbB+3Deg7TieRt/ZUSY9Samr2fMa1zUbMsJUujWLtloa
         nZ7TsczBSMkxhLvJ7m+A1EPNXdu/91Prz1qXIIdJA8nQ/2MdBorejeH2XDW9QzbuJMwn
         Nyk79a2jeaH/FWynnO2kDspvy4Oa7kWyGmOpdNHfglPQrmdKvpMWrw/4bHCjR5wzB5+3
         ljR4u0Hrs2kH3Ux64u+sHZRDHbMr1IcFne8tLal46E2A/MVnxKHrnScGooDMyorqAzLE
         0++P4lGC3xqy0WLjobOf9Y3L5mDeCqsX0XHZxHCuh8UXTYTNN2VZbmSoeOPICjKLVRim
         q7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371743; x=1789976543;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KPSWCtPsZzDfnveyc4r3Sgx7K6pKqfSWEz8fsSXk0w=;
        b=TMx//eCK381IJmlqF9pjosZ43bVmp+H6WJdRScqQTwymXslARHC1/FZM+6O4virNDj
         eup1H0mnTHHpG2kzl+j73CSa1YxxkbsWpVGck9rJDz8i83zRY34eXZbvgD3yE8f+A76Y
         FWMBqwgWqleVkJa/qgErTjB62jl0Tvyw3+SXHtLB28HOPw/ARLRq9idhwlFzT3CBFtmx
         jTpu+cFB862DlFTehO0MmybTkcQiaqnjU2QEwQJyqexx4FQM3lvgcHieu9k0ACk21FNJ
         2LEs3kWrEAPgbe8P+kUK2aTNFyWWKKQHK4MS3oNAskJohC1Ba7+5vkPbF0HtMSWKhGw7
         Ctfg==
X-Forwarded-Encrypted: i=1; AKwUvBz23nwLfqJjqeOkcnX8wfucGwDPkmtcj0CP22yAiZPfyqSRPOAvhgnqFdMhhbRP7y9fUukgErt5dpYoRW4=@vger.kernel.org
X-Gm-Message-State: AFuF++mu4x7Jsf/+AjvlrnRJW+/XXBDSv7zTiktIK/C9/bMDmSyi2h7q
	9eLYNJ2rHDW9Hr9jtdcmZHCphnBx6btu9Pyj6+E1UHqxBpJXUm+TyU+DU1U3ImSYSkpnRNLMJPJ
	Hdd0xF1RjuFSBjeHo5ZSR6Aze5+7YTriQkVPC7y+tYSLbMxmGfjHvDLNRHxxJeq2LinE=
X-Gm-Gg: AYBFou0JdhKl34CQr95O/+8aPiMry+fohJDNS2JbLSRXh/qdovq4FwZxW/eXhTXdO9z
	wr4KN3tw4k5wYobyfHzRxJ7YhIAxtE4wTLYvlBfTZXxR6PPncpnATo6ycE2GLySOratURiV5fsu
	YeleP5qIiVkk0VoumBsoZewsjIhSc9hy9KATBh9cRDrgeoQZ7/SuS69Jh1l2JKz9pKn4dLb1xco
	8WEwOsFLn6Dz00QxcPhbk9EKVfFwocB1yh9E9R+Ml9c3pPdxf85bIQ/IbmGePmApOhPwk/ABgjs
	9d5U//pEKJp32rHODeVHFCHK+jerhvE/lkXxqfJrDG6k6Ac0Z9VrqSuMeaO5m9kP7hw+HLvCVVd
	bXLJzO7xI3r8Yww==
X-Received: by 2002:a05:620a:601c:b0:932:df7e:b31d with SMTP id af79cd13be357-93a29847db7mr177788885a.12.1789371743476;
        Mon, 14 Sep 2026 00:42:23 -0700 (PDT)
X-Received: by 2002:a05:620a:601c:b0:932:df7e:b31d with SMTP id af79cd13be357-93a29847db7mr177786285a.12.1789371743003;
        Mon, 14 Sep 2026 00:42:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c0cb676sm213066355e9.14.2026.09.14.00.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:42:22 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:42:20 +0300
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
Subject: Re: [PATCH 25/31] arm64: dts: qcom: qdu1000: Add domain idle state
 names
Message-ID: <ah6tud7odwqbpb6otxzmv5zqsorlkjkzyp7xbsushzxe43kowq@etgojpyqxcnc>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-25-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-25-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7a560 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XhW4ycQZETjrkSQXg8CdnRPu5tYtRBGs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX648GrY7/Y+RL
 UFH3GKQedWrUul6HUbUI0sbp0+9BbA6Eae+BjsfKp70i5jj72m3P7x4CNtTUTYf/dTbDyr1yEPD
 gdNCFq1dkQ7wCRSCsgF0ILPrGP6QJDY=
X-Proofpoint-GUID: XhW4ycQZETjrkSQXg8CdnRPu5tYtRBGs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXyu+xjjluGIno
 fwFRUtrHzr/NoEfielcV+/m4KtLEnaoW7u0nEfUERZeZix3U4KC8GqXGjS78WXIghFJEehkvakT
 LLhNUOCuUipXaIHRlLQcNxwVC19xYptIlE5BZ5kyJ9bV0jdp4znMMrl2czC0bUmagvDeq4KYDoE
 SAF7IxCQG8fMWsf/QQTUEyCdUkQpeA1zlWUfJ6R1kt//nACTeA8/nf+EA1Alr5PWqgp+U8bqo6d
 bZip4NqMD1BkZx87GoqWvkHixEZuUJd1+kEO5knBvLf+9e6WTzyYdTwGoZl7UslZ4GiCMj98gib
 QOrMdK2BkY5d4tnBvzc+eyqtzXr72qGBYNlb8JldZlqDB2SuVjpoSJJ5B+0hT2Z+uLUS+LMgsCY
 3uxInsGzRA0ZWNVBQsjKJR5ySeCEGXsnz6tyiI5qX734M6+XpqBUKIxHy8V08caVLOwb1VOkJQT
 elo0GuJR+NFuexONo1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:57, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
