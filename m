Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8970C35DA6A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791573125; cv=none; b=nGA1+Wivtl1dlqvG5g6+4EoItJw3du0DQ8JS25HRmiFtkWblr5mEmMFmYxyArtVOF3k+HOj4WqGwmtub6PfzJ0HjDvd4WaXV1dIkvinymU+tjyYmJ4e8jMlM7cu0p6gMq5h5n//y+O6s0hk79s2+SaOr1aWXbCNmtLGAsrWcIPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791573125; c=relaxed/simple;
	bh=6BcyXUedRwNIZg/+M/T5XxIeJ13NgbgCs/YF2n5Wep4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDRIWe5v8sqvzu5yzegjU4DzxX8yy97SKWP9X0pwfWvco6Xmio9CLJMHT85VIIuibcWvQPEMKaBNEMgwg4pxyAKHbsbiN2zLsm+MY6MOjoRDIXLUYn/qIwN/QZZ+TQG1yf+LewOlkTS2VEBHmmlcBVA7i12Q1kkBOIehTsx246g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKA+fSkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHSpW7zA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKA+fSkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHSpW7zA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HbAJW2873153
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 19:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+zoMtv0ZCc2ved9YN/MjY3J
	Xy1JEV7egryQjS3u/wc=; b=GKA+fSkVJcj4UqVgYw5fvYwvP81c0aVgkDM6Lviq
	IpFN2gzfd+MpA//WbHQuidrH/zzQ2PmEHgA5XPTixa+9kOXkD7o3FRUVriBu6OMg
	22rDa0fATY/aNkinlm+oc3VwOC7AkBbjWvEXAQUQqXVW7IdEZ9G3aTUf5mNFhdQG
	l1LXBkem9hupA8NFtp+NZ0UHinzBONfXvy6Gyabh0+fqN7vdHqHG0oN5KowLBQQP
	qo6HqKtQD3B2GH8mq40pim6cvquFkSnKPB50wmWELmKGppTFv5nXV0d76cxQ1wcI
	Qg4kxyLKU0OCsCWH1yzKPHQrXg+NWlPIuFcKR05+s8IwCQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7gdcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:12:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so112985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791573121; x=1792177921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b+zoMtv0ZCc2ved9YN/MjY3JXy1JEV7egryQjS3u/wc=;
        b=bHSpW7zAsg3C8r72bjBaSbuaobhojI67gxDqIvKjDQSaMJiVlPdtJkW5IT04FAdBrB
         VRsapVg6TBlOcjfuMEvauYI9boD7bRQu6rXVIU9gllszTkTjz/+Z3MKpOt8cErBZg1yB
         yEKqpjM/vRq33yUHd0OaEfpUOQXUe7bUF9ddPlv7dnWkJXYZUtpfW2t58VpH1ja43y9W
         CDQEriWm59GE0bFITiTI7zxt/7g92ky/jPnzhtTvs8JrA5OeoKWEqTHyg/pu5sJL/Awi
         GqctYunnUNzN3emJjihxt1GZPxa0X8KYxKkk40VRFbXe/NW4Sl8hJpqgUVE2i4SFou8c
         f5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791573121; x=1792177921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+zoMtv0ZCc2ved9YN/MjY3JXy1JEV7egryQjS3u/wc=;
        b=RFdjRGVP6YwF4UMh4BCLZAR6BqUv7fqIWQjBJw9kS3QGWUtHk01rZHzvMDIDjKxZR9
         NiFcmJG6UUMS3eG4BMsX8lrHSZsVx4p4nyW5QUFAXVqoPb2QxokYfC/LdD/Z4b0ILNC5
         WH9i17OJNZoOvAfof8gZsVq9VstkuqkTZW6X+NXtZDEQq03X/rBQdCmlKms6bNFBW74k
         dQfjNDXeacfISm09Lv1qWa9XSOVGK6x9yEawfc3kntbw9WsTW+TJ9ozLrJqyJqV90i0C
         SQBn4zhXiqrMscHyFN6OIFUmt118eo1HHdgY5eDsPcaqflnE4vaIumvGWyYstXQQNMfe
         nVig==
X-Forwarded-Encrypted: i=1; AKwUvBxQaTXxV2o9pFBR8N0jdWPXII2li8TiUaxeCGb2QqAfRo5qzK15P3PbVmgNs0Xghr3xNszcR0eg1RTpbew=@vger.kernel.org
X-Gm-Message-State: AFuF++lKiA+JQXMzMmREE+0wPh+lkki18lLJuw6DZTiWJmsO7qrw/REi
	ABpCHVx3IwSA/h66UtYsgVbdstGDh30JTBiJQnwOieBeiU7ZY1K/wiHv0NRtnlkkRlIAlQfru6K
	RwNiNUybPwlUWvyrHVRpfnX3C46nUmIwq8gm5nSej7d05uSxvOcn3EhpaNteqgJXH2T0=
X-Gm-Gg: AYBFou3ULINW7BEXFxM7m4haXzXo5SMsMwLYyzQmQYFKUEqMKqPmeBcXLM46l7G/l6p
	QdEvbH3w9sv6U3iMFGLyls7x3ft6r1oQpE1k9sPxbXAtZqkukgBrp9QwDzHmjiEm5ePoa6EBcAs
	acHVil5EUtwZrKyXskkxOmimekhDSYcs2rMUNPirRBy7loTBcMbdKK0ixR+SEDsEtYzjHHaUPJj
	RwUv3sVOdPj95wOepS3/Fv/smfnvrc3ytC6P1KaI0mtzIzdhqTAW2A2fNwf3t3hQq2TRtV9TX+1
	fry9WGVYHjjUTYuAun1O3bCYqnSAiJi8D6pahzkCwB6AA3boD1DIC8jhsiOxT6msANVucC/rBSj
	tVorXyWoXaBFPhEU=
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr471120085a.23.1791573120477;
        Fri, 09 Oct 2026 12:12:00 -0700 (PDT)
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr471112185a.23.1791573119702;
        Fri, 09 Oct 2026 12:11:59 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea1fefsm88705995e9.11.2026.10.09.12.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:11:58 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:11:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: juerg.haefliger@canonical.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hp-elitebook-ultra-g1q: Drop
 omnibook-x14.dts include
Message-ID: <3hc574blvlfxelyvrki27dc3pjabf36vc3jh7muiisz7cjuvbd@qv5cjqvao6he>
References: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-0-9702f7c6f9a0@canonical.com>
 <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-2-9702f7c6f9a0@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-2-9702f7c6f9a0@canonical.com>
X-Authority-Analysis: v=2.4 cv=W8atxhWk c=1 sm=1 tr=0 ts=6ac93c81 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=7U0OwENbvIhYZRclMzIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-GUID: F5HGa177ummWrJke6qLB-3D7MskZuDLX
X-Proofpoint-ORIG-GUID: F5HGa177ummWrJke6qLB-3D7MskZuDLX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX5aaGWvchFp4y
 2PWJTSG8yGxl049f9kfxx9pI3SK/GhjScsfQhVjOHy7hByH9WOyAwgUnNHq66JvIqrIFMCPyXT6
 3Lc2KCJfFYo9l/fAFPH6HkBE1koY4+A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX/Q1ez7LvZh1n
 Ot9EOku2UiXDSYgb7LGak2RoU6EkI9x/OdB2v5h8BKEDmEWq2/8pXLaP0wyZAXNWvBQnHSjV/ZV
 lKztOb61l113CzN8fgsYoZMgY1n/S/lB9RUSZel0a2nHHgMEnaeQY3bFe2eZ5MXLaTtTh2XNUKp
 WcUgRLpgFt31X8M00pb6/9HGtvU7j6/RspqtAj1JMj7Bl8LTTKbNTEK0zln1DKW6ew4bbHbKxkv
 Q4g06s3/IE8KPrbHN60y5lmDMAk0gDgX500iwjz+r33SAFs1diQkAfsmJvGSqXLwBBqWQBYTGV3
 G+2/eon/0vebmswZxsYI3LYdMvbfFeMPTD6GG17aHG3FMCF5cMHPNsfuuRGc+UGHecBqS8oCFyG
 an6xsPxT+oc7QC5nX/qnUBhk353TsF3qX1c1BCdBJ+OVg7SAQa56Ih6NlMJEyKGzMzOCVcP1jB4
 z5VG31uuaPadL6mUYWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090076

On 26-10-08 20:34:46, Juerg Haefliger via B4 Relay wrote:
> From: Juerg Haefliger <juerg.haefliger@canonical.com>
> 
> The EliteBook Ultra G1q is a different product from the OmniBook X14 that
> happens to reuse the same mainboard, not a variant of it. As such, it
> should not be a child of x1e80100-hp-omnibook-x14 but rather a sibling.
> Include the shared base platform dtsi to match the other OmniBook X14s.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

You are also enabling the some remoteprocs, so please mention that in
the commit message.

With that fixed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
