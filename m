Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2393F476CE1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249349; cv=none; b=cOADKuBADzKQd5D6LKepe0mpKBx6y2AanIh4wiOOIRMnX55+h7ZUAuIAKe9Cb9x64GCETTEd7forUcYflzlys80800rcWxCDN73dDqcS+DxZ5ZkugeOMIraGj70O4N0ZY5gfReqvskCtM9LWvRTMbZ6SjclnQU6okVQPk1Pg32s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249349; c=relaxed/simple;
	bh=901dGwwGWeM97UvSCfaUjJ+Jy7KFMI5sFO3aLsz983A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpOE0w8oTIsqp4v/zUAP5G9/lojfoEBR+6ITqN3WdZeG2x24La07swduyQprYMXJu7AKifuA2GQ5DYyfdYl7itKNAFLWcnBGBgw3NPb2mC7Z2Dij+b46Ybl82ujQgIrwSjvb1uOijAqp04LuEDbS+w2HayEJBUcaTCXjNLrywy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUyc8jwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ky7MsPN+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUyc8jwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ky7MsPN+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9QAFX1774014
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qH3AKWtb08ijvgAHQk4wbGp4
	z6QD8iNHR70hZb76a84=; b=aUyc8jwnNSxsy4ttNv/BvcM+/y3GZChoEOcKi7IU
	WJERRgVVwIKYeeesS3SeVKQm2oiYnPmr+bYHVoTKg+zm+ahHP2+87E/Bv9dM/9ce
	ZuS0whcwgpr5PPXMb5iu3NwGIPsbRRvgWIYKq/N7nX5rD2Vn7km+IgntA5rGJfpN
	HgGJiwzRk9cFlzQgbtW2zmpj5uDTy3s/lmfibGaUHeWkSO4S+7oS888ZLb2pnFmU
	PukERyD/bX36JlUi45zJRZrW4YjJpboWc180IaSmsNOAFS3yWcK9njMJrfdpgES+
	LsDMA5ypStW648s3YkkrF78nOPiMP8mPJxA/m1xhkQnNzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb471n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:29:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a183a0e93so399459585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790249342; x=1790854142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qH3AKWtb08ijvgAHQk4wbGp4z6QD8iNHR70hZb76a84=;
        b=Ky7MsPN+K+yURLhY14GrtBSFfVAij0yCEQOqbcuaknBdJnyKil+ORtqjJBv99PfA9j
         S9YnQgP1Rfav89/nA+RlcVPCL51YBNOOOBB8kyl3+toKOilQcGeZt1epqgWW1JqvgI9z
         DTtdreLohelNCNgztmPvwTVtZ+ulAnxB5bfLgHZucZeawHvIKK/gCrSRqYSKLP8jra1L
         75Yh7DS6WFjtfKiWPduK/QgJQePA4pxyQNyitNg2I1BIhB3wlcRX13NQIyoPC+hk8ZNL
         Ff25Rb6xuf8ANjZKatBqFdz+cWO50ptl2tlOPSATneekOlkLrNc6al5upSCvSPwXS0jo
         k3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249342; x=1790854142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qH3AKWtb08ijvgAHQk4wbGp4z6QD8iNHR70hZb76a84=;
        b=G56wtoYvoN3VQq3NCwH5/OgGYg0ztKC/QnTMNIKLHCcPlkt4GzY9aVOeFQr0tYQazE
         K2uTljIq7SKu4uWjY/YYFg38qlmR1uhvo+PcHcg2N1hQTEoyBNDnNI4ZxYR00HyIgaDH
         NF/YQtpo7M+qy516caMHl88D39oMy40iyoQqC5MVLH8qAHG/sPtan6EBHw2OWAXFVZxx
         NicbGva1MJBpuNb3qMQ9wkyR5PloK6Iykuf/dFmS5AIJ8AnC79psBifNP7fNDXYSdrEw
         kpt/p1eke1oOz/RAxNbqqVhbVRlks0HIcvTaMjPyY35iGQRKGCHxVSBSUB0/4m0Wyh4r
         nK2w==
X-Forwarded-Encrypted: i=1; AKwUvByjup0EpUPlu+7uOMiTcF8XEx/n2gzNKyrdimRrGMHcsuyLebLd/qCzpKlPGPV3iwyplsPelsAkscu04rw=@vger.kernel.org
X-Gm-Message-State: AFuF++lDN3TUolMVYyDY0V0s7lTzQta6NBX5vnlA4tAkOqS39ikwiKyB
	4XfuFiTApMo55LVzX5gJgwnBkQoD5H+XvPvBSuxEXEez6KH3qQG5wAuMmQscr2sixHzVL6A+Oxq
	9L08ra/TU2SaxQ8JU/G8xmIEAChSHY98esGFCb+oil2ftFYHQ6wgyPfaq/hXHQHk3K24=
X-Gm-Gg: AYBFou363e1DB9PmDXrGZUDfurWT4SSHNs+iHSGFlDPx4EzPtVdhWAhdV0bXIrCwK6v
	eY5mEgC5BE1Drgfh/12iw/4I7f7QBND98WZsgRgKzCMVU9vKi3E8Twmu/0iIOzUf8PKRE3fNram
	Ip26e1+1ft/2mDKk29qzO074LRRWUJ3pIpKXiWR+Qhcsy2PY3c7fcDYoJzRLWisj/6/38J6ieCG
	roMeak0E37nyY83TbYvXIWewThl+G/gPkH3a0SqMxZJjoY3J6bwasykJUKkEd7sAO/n49KR2/G8
	ljsq0gh0VLJa8tsBIYdZmrYlKoHBKBoHaK9NMup9pgjX2nZ/7uktZ2kUvgo7/AV3z5Tza9oXFUt
	NFWuhCgSpvGqxeEw=
X-Received: by 2002:a05:620a:19a6:b0:93a:1b82:495a with SMTP id af79cd13be357-93c36385bf4mr232410085a.37.1790249342198;
        Thu, 24 Sep 2026 04:29:02 -0700 (PDT)
X-Received: by 2002:a05:620a:19a6:b0:93a:1b82:495a with SMTP id af79cd13be357-93c36385bf4mr232403085a.37.1790249341556;
        Thu, 24 Sep 2026 04:29:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm106427115e9.3.2026.09.24.04.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:29:00 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:28:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add LLCC node
Message-ID: <6pj4rxeansgpqilivwjtugq4mrnfhufxa47fa3ovopxizcz5gf@pvm43wfiqtmo>
References: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: ulQ_exGdQRdn7KX68-k2hdEUuWKJ4l-9
X-Proofpoint-ORIG-GUID: ulQ_exGdQRdn7KX68-k2hdEUuWKJ4l-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfXxdzrpLoNa2C4
 oBNftxB1kHV8ozPNSWQRkZUkRPxfHLehw1vMPYs9PmQVI8r41mpXb3N+qqNg9BN46s2Jw599kjx
 HhoiNJFa/A9cR3Znw6ITuLHMCmhSpS8JM5W9RLA+DtoPLo0ve8neNawqRXTDehTCm/Roytisdvg
 91d+1jgoODNDnHxxRNTTXCvV9ioqaMxCOuE2fTrPG1WeSt50QvPT5oNBl5P2rFefR87dvfc07R4
 xqBTqVhWaMBtxPnB9kO7P+RHvL0c3LJIRhTW/4txJrogFyZY61z1i+gaT9ckUdImeOvJDDfUVhX
 hNcHXo34l3YZIuOxN7M8jphAMVyblwbKJUaC72CrTejJR7/Ycd5sE+QPbkacKCdqVUw3TeR9nU+
 y16cH/L4IK8/SFwIQYIk25ayPyL6Wy9LoPF9fyDdogSKwiLLOjxc5xAi8fyapsFv6/Jhl/dH9/d
 evtcBM76qVfDgVm95Zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfX2AuoV6ZYYqDg
 37nGskpQaTs04xuyUaDMi2ePRxVX+4lsfiEqwHiq6/MrXpzULZdPhAOP44KAg9E+SkRe4btVlIb
 Ti8c6iA9j0QXEaESB2/6sPt3knagIPA=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab5097e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zdnQAcmOsowbSLqG7IQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240047

On 26-09-22 17:17:35, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the system cache controller. All sixteen banks are listed, four per
> DDR slice at 0x100000 strides from slice + 0x800000, followed by the
> global broadcast OR/AND regions, which the driver expects at the reg
> indices right after the last bank.
> 
> No ECC interrupt is described, as the Nord interrupt map does not expose
> one for the LLCC. The driver treats it as optional.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
