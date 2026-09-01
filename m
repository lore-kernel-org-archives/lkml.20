Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A22A3E63B0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265368; cv=none; b=THL5/vQIzWqECd18sS/7dklMLHpEqTylER8C5dqjShISiK3riPUmh7TjgAsjjE66NdVHHaNwhi5dkumMU1APew5CNxbT+QMsDjsiKIlZWb2IU1zlvvUtRpFTHVZLY400w8Z5dkI9dYnAVVSuW18rqUXjCrw0z/mohk8mU5OLw+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265368; c=relaxed/simple;
	bh=9Chwd0w2EDIAHB3WrSewTF0LFKue/rO2MaRya1pagTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGTz93NnaglnwgHHhi3ZH5dHB9I89I07V/Rr1UPplIt+jRDHMI453BhBhvq7VbpCo3QAgLUfXvz1QtAp1uKofZ9GixRoF12vWzAIcV72fVFauJGOpfKRhpz/prsmpZ2L+g1sRnkmN/4l32DwUz8PNFJo3PsCk765em/X+k67WXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQ4lw1Mr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OuHuOJQn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQ4lw1Mr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OuHuOJQn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJenn2494586
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 12:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u9bhKclenKPG4bSJi3Dfg5sn
	oNshWyvaPdPox2LBfdw=; b=lQ4lw1Mr/YKKYY6luXGya7LGeGohXeQigDhqPSEC
	WPAhwC/RwlAzZMVA1usY9JOWSS2fZu7yHHuYd91PX55nGj3eT3SuiLJ+pBP4WJIp
	LusrB/KHNaVMYsBVT9XMwEHLFNmZ7w06js9O0vDHcI3Lgh3GolkcS8m9pIJPvDsJ
	lIn29eInHjH2fjgEuULX64946KdhQJ6gSKxpfJZWaW8oGBcItyjh+l06l+TH8Xk9
	FkrQbm1S8KVld4VwjiGLnt6R0p7ZLSvngsiLYFOvVYtT/lUmfGYDp7QNF82O5VtF
	Rv+spqI6DfMyKP50CgNrXCWEE0iED9aN/EmU62OpCfXswA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh20yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:22:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494cce712so850913685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788265366; x=1788870166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u9bhKclenKPG4bSJi3Dfg5snoNshWyvaPdPox2LBfdw=;
        b=OuHuOJQnrtnQ4NtbMlgXPKMV9dIrEcbwWuYPBzyQytuCA+RrxY+6CeV3YKz2Rx5I68
         YxU9b41vVKgDD9XW2qE6NA5KyLnIXTeMMpbpCQCBZBHU8+2MfaP2aIzQQ277dsoVc1F7
         AcqipweMTfZ6mKtSpMvBb35xxQrBcWMxN3BeP25FzXKqep8hFo2d/l3he19aDSrMI8gt
         6Vja9dG8mxGawSsHc9EO7R6peuSCiYQvlWZXDJ7zLlyzGHf8uPyuNdAyJYDs2+/fprh/
         FF3pkBLoF0VNnD+dHsSqh+DUJCfCesdIn4T0ceS2XQaGXqwyaa9tVF0SrknIWS50lQH7
         CrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265366; x=1788870166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9bhKclenKPG4bSJi3Dfg5snoNshWyvaPdPox2LBfdw=;
        b=ChbvCSlgiE1eAtMMuuAGEvkYMBxPJ8XHqRTOYFc34l5eNjRUyjGaFWNmSnieM7B1H3
         zQQ7GmiBurEkWeCVv2UfJ2D42Of61S/20oXJ3/JaIe8Nk2Rm60Ixx1MTYJEXKri8+2Q0
         jviz/6ztQ3vHlSBIOgT31azaI0nMxMLqTB+gsE3K/MJxdHL3BNlkas6BlE1/7D+80WDr
         MSqisYLt3TkZKU8NnjgtkTyZvuU29hjyQtbxrHKaN7vrXupKwfKvyfwWcPNbVu3PkJYg
         1OkfASzjmNYYXgoC6YXZD3IDXMkV5nYTqKfRFgVsBb0zhr+RtznRxXhJE952wMDaIXBE
         qnXA==
X-Forwarded-Encrypted: i=1; AHgh+Rp14IGZfJTeoQCxBT4lSYrHpW+0Ygw/7YieZ8XDrZN+eaxgDF+pKKRzlkvT7h3zGS7LG4DO+7dTlLCt+Q0=@vger.kernel.org
X-Gm-Message-State: AFuF++lHby+F+JC5fR/Oc7Gr/cz2G6MxeIspn7EzlWYa7i8fFVv+fQxp
	J+kc4TGdkaW6CfUq2tXznUDh4QR3KR/1YUizTkHZHG8XP8q9CK+2nL3Vpd6K6VaU2CecpWZhVu/
	g9+LtigjDgaBtCZYMqNmG4yzyfyw1EJ4LYWzkwqNirHtn6f21JapUYWX0qs5t7vSjeG8gFITeAy
	8=
X-Gm-Gg: AR+sD12Sg7YhkcK6s72T9ntIlt8Szj1V+nNyblxfYonGtdwayYk6szTdWr4Jk7E+IJI
	kYmmlML1nh23oGpFxKJUafae1cxCgGqPOaaGOIEEgvqL1M2PlSVX/l4RDibmYX2z+XIOCWQBIKX
	rUNAO/sGLTMJcDZ3IdgkWtbohnESej0mnB6sU00h9poNntlQKv9RCZFB15nFUw+fIZb5ce5qeHk
	Op4NS/3rTHXp4FZVkG7vqK1usAcd4yytVXthrPgP6BZ1QqtSzuB8DjkoHdx+9LEJcmE4CACp9Bc
	z2Vdgd6DoajFZgmnN8D5Ca1xCV6xMvFEElI/wjNNQlaoQIUaMcg+8eHxnXnYonWaBZAj7dCagQW
	NQq0HywUjZBKXCg==
X-Received: by 2002:a05:620a:319d:b0:937:45fb:6b95 with SMTP id af79cd13be357-93947fe52e2mr1038441585a.17.1788265365664;
        Tue, 01 Sep 2026 05:22:45 -0700 (PDT)
X-Received: by 2002:a05:620a:319d:b0:937:45fb:6b95 with SMTP id af79cd13be357-93947fe52e2mr1038429185a.17.1788265364948;
        Tue, 01 Sep 2026 05:22:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e04csm57938805e9.10.2026.09.01.05.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:22:43 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:22:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: m31: propagate reset errors
Message-ID: <f2jjxkjwmgwxl3fgjlwdpjgjzisj6xweatqu5klvlcjgwstflu@cbxmjvgvejuy>
References: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMCBTYWx0ZWRfX1gOQPHd/CGsa
 EY57wpwA8RE6juyFdYdCa10r2WSaT08bhvUtTBi+XhE9eh7PcqHFst6paVU2af43b43+ivpsuFK
 yqFbwBAYIngW7/iU6qTgSL8KgKj7aWg=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96c396 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Eo94fBGS1rxZ-i0BCloA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: bp4tsoYHcbaiVIe6yT9pGcStPsNOOgwa
X-Proofpoint-ORIG-GUID: bp4tsoYHcbaiVIe6yT9pGcStPsNOOgwa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMCBTYWx0ZWRfXySia8yfOJZuk
 +pPsBUVRj7PniY6i1ZAWpv+NIG6fbYHwWt6i7zX1HEB4fFbPrZT/7MlkZTJQSfj7BkHIpeB7UlP
 784h9jbrDxL/4P3YVfLPczTuQx7kAcxCYcH+Ipu8eA3pJfi0vp0m6nOJLFrGm00UFj+QsMeB41D
 UC2ZamILqcknWzUsJ0JWDJVuxVFXvNKfcSOzj5YDyn4Wt1uXFRrz8nobQB39ou8CISJtNT7H1QA
 7j+lAVWGOneLZEfn/7y315jKP6rlKqj3iRsF9lWOH1g4KrPUV9GvY+40fZa91e4guDNpACZ8Xqn
 CgTduoybGRroFnQvelyfEojoT1JSM8rHVg6qPTh9Xox27uKFIgrBBWqQj90WWSJD2NR9gIZ1uAe
 mp2FBmf+kbu36WhLHFAME3z5lb6ccIjMPASKjY6doyuN6LJX40VJ2Bd2w2q6lWf9QSjgvaVTf3f
 QmJGbi4aoaa5mz3SS9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010110

On 26-08-30 21:14:42, Pengpeng Hou wrote:
> m31usb_phy_init() enables the regulator and clock, then performs an
> unchecked
> reset pulse before reporting that the PHY powered on.
> 
> Return reset-controller errors and release the clock and regulator that
> were
> enabled for the failed power-on attempt.
> 
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
