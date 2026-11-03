Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699492;
	b=MCChiRKhxlznz8Z9oFJx36uQX4ucfqIGzk1x55rxFsoMJ+/lKnuQ2Qy4saNtcWhXcnxm
	 7zFt4O8mzMrU2KIHTfoa3zl6XyMYj4KZTpqHO8u4/zul9AsI/6bxV28dRmCDghMrArMYU
	 l+vMr5ixEZmL4Df4uggAYGllTVCX6DJ12p7FgctzXmsn7eI07oEGzcuH5c4AqqreXVd2I
	 nwUGPr5FcApQ7FBYg5x+vAaZBnv3lDwZFkXaESQrgAYQCOvOayS6Tu2KMzqsWq3Fm934p
	 3Zm+GL1XUGwO9pAznxuPK3IRFmFC4CVF8YCA6LPHKcVKY5Sbn3G2JNb7NdJshQhzJQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ndhs2gPZWQqMxGEvtstXED2ivhl7ySi/UCRjgZTdU7I=;
	b=M0/Kn4+hjfEJjhv7n7m1V3667+CXqBRQRkJXcf5GDrRAh9UqspCqhrCWd+Z3VYHjjq+H
	 yaHE0i3t5o8jDSFYOmjVSc7bSsVyuGK6yA0MeC7FguOb6JiwJMIKz07xTteifa+LYcUfd
	 kYfH3bux29Fd6lLYPxymYN5H3QaqKICDw4J294bheMznPq7G7NqUqhvoZ/1+cB7vWelkt
	 XzG9iwsT5paIBRx1b1XPf50NSJGILqvfoFweksS4oPPQU2ZrR/yR2ZcWj+66dz+1DSoKV
	 UHFyOoW5cLHXFtNQFEFws8ByQ8iOIn/EX6ynbQ4Wi5Cv/KL6YmskqholDNXjoB5lmWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLY6HHxE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PApfJzOt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0A4606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE0A4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLY6HHxE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PApfJzOt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3537oU2450966
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ndhs2gPZWQqMxGEvtstXED2i
	vhl7ySi/UCRjgZTdU7I=; b=GLY6HHxEgQBey5ncZnXyjc9HW32D04TovwDXn5gt
	m4tllotCuGqZnLA07vqzTV08uBxlaJe7GpGxQMmnvDiXjvL18OKxErsSjS7dijw1
	yutbpVNjGLfn+TjcFLlUqeyUjFsZoCPTwi+ac6X8VKGRzmiolkIjL8QDRihA3P0y
	X1joBtsE30L4pTvyxzCHr54wYWLF8rPQtY0Lg5uWsaARO7Tl64/zZrBXjSDfRiHj
	Z8/EqW4HgMiT5CzkTkvVSW23TqlOlWXIuyOwUp5QQU9gELWRx6S4sijd4bQycp/I
	sX21A38IVAt7+f9vQQtlMTrl4qtMPcixR937hRfrzziXHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cs3ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:51:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so455378285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699490; x=1794304290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ndhs2gPZWQqMxGEvtstXED2ivhl7ySi/UCRjgZTdU7I=;
        b=PApfJzOtRCVsmfIPjSOsNGMWSi+3yAu2i13NyBDgEtBoBWzZ8c7ceTAmJNXC9cgk3k
         +nopD5lwiudWr0EV6+vUd7seCFk1GJMl9P/zAR8Bs+MsaEU1T2BvOhr75fH2Q89abSnv
         0Qru2VlUwLVRO3bLjmYXQv8Pz2nBlD9fW64HURelOvvvkAoFJfQTg8Ft4wyPOmaSrjry
         GZeSwc5iFcwN4i0bzZLVIaAZHldff4sw2cmWzmw1dX2KP4ktbhOQRHLO9EW5nMOCaj2r
         AJniB7RMRmo194urdwPg6XUqBaaHVWRbBk4YlySkHljwebIEBtA3J/18H69KqCWRexsi
         sz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699490; x=1794304290;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ndhs2gPZWQqMxGEvtstXED2ivhl7ySi/UCRjgZTdU7I=;
        b=tAcNU/NmFWl+gufR54Gwdl2Yv0TGRuZBuBGewcjAw8yVhZbBnoOil5TBAifoHZce/3
         +xbsdy1sQB/f9zTxLhojuCI8SurkH27TWLP8HCsvAK8T7KyUUmBTZaj1hsbrt/h3FtOW
         NCJI8SV9hkkVDC/fmK4wk16zg8cN9MXCTiyG6hb7lBsaZhD4PLbK5dyu3kZ5ZN/vXVC3
         uUG3Ij9EXQ+I26vMJ25LwHQNOWyNnyfA8b5GD/xB47oZI/Ak4kdgE5s2F76uO07OETHo
         Pj0RUQVWxoCVjOS3JCcbtfL19sY/dNiM0DOtc14AvMk00CT/lpeoMm3uel+Z5/YjPBFi
         8FZA==
X-Forwarded-Encrypted: i=1; AKwUvBwhqs0PhazcSXIQFJdeZPcIdwLTTGKRHlDiMn/BlQQL4/LeM7qtWRdEr3fqwZ1CzTMIbmNj5gnALoez1AM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uBKTw8CdDoRCg9frum5G17F2r7iYGgFp4ry1Z60X6ohSIlfXp
	0xcF9Yj/t1k7KOCnkkhoyjiwECuNhAz4jRW9yH1cXHzejNXXqMhMJ9EI8eDKyQPUcmtz3+LapPj
	Rj9nIe9E4bWETvtbnrrMwkIZa2CWOnSzEYAbkPuyUWAgqTjH87U50Lr8zfWxxT9CsmBA=
X-Gm-Gg: AYBFou3ez3MxSe9fzr8Vuo5Ud/loAV8vs2kYYgwWcY+G6O6QtI7PYNny32K452devR7
	VhnMqE8nQ6dZzKg1s9VcVAcfEPsxACXS4b+48/fYbxQYYcR9dKxZ9aQSOUPLZPTsDHe5mcsRWHx
	fPtDai+PHAadi3HAQl1PyTonGrPT/SjdHrZlIZyesYDnZ2aHSQ/iCJKuCnW47kMitqntwpII6ty
	LQTBuKp/ZQoo1Udj0ymIJRD/juJfAvPM6n1zJU23BgOg+mr/2ZVNZZk8WNboXU4IFkd0u61Meqf
	E3qPwzt1QgvOZyc6RlL0le82CN6oEx1ipw1UJlbdJEOVsFSz6rOD9rZ1ym6uxeazKI2AYv6kyK4
	ZZ3wYPEtEV8ETVo7GvNGZ2nka83Nj+XR8eAAk4j4xEjOt8/j8AZ1+Jw5iNCFiaRA=
X-Received: by 2002:a05:620a:271b:b0:93c:2c15:e513 with SMTP id af79cd13be357-9442178a95emr2014617885a.63.1793699489821;
        Tue, 03 Nov 2026 01:51:29 -0800 (PST)
X-Received: by 2002:a05:620a:271b:b0:93c:2c15:e513 with SMTP id af79cd13be357-9442178a95emr2014614685a.63.1793699489133;
        Tue, 03 Nov 2026 01:51:29 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b393fd1748sm2186495e9.7.2026.11.03.01.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:51:28 -0800 (PST)
Date: Tue, 3 Nov 2026 11:51:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org,
        wesley.cheng@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, val@packett.cool,
        balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller
 as a Type-C mode switch
Message-ID: <6d6aic4idenq2keiqa3jngibrurldo3krytmvjovudo3k5wlmw@zsoujav6f2jd>
References: <20261102215121.738-1-26rote@gmail.com>
 <20261102215121.738-4-26rote@gmail.com>
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
In-Reply-To: <20261102215121.738-4-26rote@gmail.com>
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9aea2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jTYuYfucqK6tsm4y4RIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LB8oi-hdhI4t6NNNwaqIYmELhFBhEhqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX9MMsddAdkxeN
 X7XoTQgRh2g3w+YidMtdNyK6vR8Ws3ygs21nVXhAOzTsohksPoz03u/ET6SdEjceV9EDbnV0AGd
 32zrR9b7TRy95kcrLqa78zUqwI+WsxvnHc62RRmMbuEvWdFLJJ2zvjRmZbBlFCVom7JwPpMTz+b
 aCQ9SSalRmf7hl5DCkHN/wnmhR/yQ7whA5ZEbBZ5SPzNlt7YC41EwZgijKoIHKll9u7q1JbyzGy
 3aIOrOz9aMFSvQfyY/LjwSC9FuZpnfGNN3SABpSw5p2yr8jjxal+7H/koHOrcY7mL6Ay6DPj4Rf
 h2fSn9EKgrIQP7c498mD2jU+OatRu+X7XSM4UuDPEeiiG9cxPz6s5dkl0oOe7uO209/Ds3WZRUP
 8uZ2uHirM+SRieup2s9AZ4wRHZ523mIpT40GKg4MxuDQ72k4LoxY1BWZSOwDG+DKT7+PPyRkYAX
 GUAnzwpEaZrf7kxOO4g==
X-Proofpoint-GUID: LB8oi-hdhI4t6NNNwaqIYmELhFBhEhqC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXxSrTOJEQ2T6n
 v6iTGd9dKtadMlLCXHiFijtpkBnzJxHsyqRVP/wEIQf+andXBMJDkvwP7x5G8S1f6mrj7OXDfWo
 Em44xi39JhZCm6vh1Xx07a27Q8avjJ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030039

On 26-11-03 06:51:20, Joonhoe Kim wrote:
> When the USB3-DP combo PHY is a mode switch, DisplayPort pin
> assignments C and E put it in DP-only mode, where it stops the USB3
> PIPE clock. Make the USB controller a mode switch as well, so that it
> moves to the UTMI clock first and keeps its USB 2.0 port working.
> 
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
