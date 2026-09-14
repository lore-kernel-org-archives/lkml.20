Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BC83E49DE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371600; cv=none; b=Y7kc1+IFo7DqU4iHo0M1nM19hmZoKevE1oJT9GFCbz3OSGwvBozy9AA7H/qfW+FJzDv6iSfH7/PcQxzep/V5Z27bWqSC/zIpk7p6Kw3lvAfUMhfWdzbuW/kEWHrWeX3Y20/utrfoz+q6L0QnCVc5Cwk1qud1CBN3Bi0mT7yM3ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371600; c=relaxed/simple;
	bh=PA9QxTqfPI5AOn0ULq7Lt/rNPfbVB4JxJUnXxTA46ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d374H818yh7QKFWIDuCqURRHN87jjb4ff92mDMUIAF6n3nfkzGn25tc617+E99VooYd2OFm6s5Bwknc0FtqHLbVureLqbQSubdtv7buAhQMVEIhYKsvta+XEDU3Kam+v1/28afy5PBvf0oN39w324PCPAhUGLiGfZK/ojiFnt1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/P4zDaB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMnHp869; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/P4zDaB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMnHp869"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ibLm793174
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K+YUuIr5Tzjda3UhHIE2zWes
	LU//5JK3mNvRXp9NpTk=; b=R/P4zDaBwH8QGg9osDirvquVJXoevo204Bgg5Lk+
	m+s18Pfni1VtZi6DLQocuavb5u2mx3goX55jzziUvu3Fb/lPA2AW4P1dgWdRTZ40
	cGjN8V1LINmcka7fsw2UjlZhL4/vlmY5+CAi3DH0DnEuC2TodhkIxe3FdD3do5iW
	FiMyODkLsFasU7X3EnbGJZezq35i52s8nfI2AnMqR3wOW4nQM9xk5D72SAzJvnRu
	6ZVH3HuKZnpjuaflmJ7ENxMut6Y4W21QT4T5gc1BBdrnYFxpdJFsgvGOPdRJjgY5
	cg7M260F+buqqj1C/kFqE8L+M/L24fRLPui4FIviXsBD4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnhcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0050a554so471211785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371597; x=1789976397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+YUuIr5Tzjda3UhHIE2zWesLU//5JK3mNvRXp9NpTk=;
        b=fMnHp869hV71/FheLct3stBHToFipGw4L1ur8vg2CaC9NziGli7KL5kYYHUWMYCqBl
         Xv0pfDbzVqPZhTXKhdhSC+FEkzTvjpIf8dLQZS5CFQ7ocOAV872r27QSaowCJVdOBpoF
         w8OY30J/ZgD5sxKoZkbDpA2CVDDuTGsyROL+wCMZe7XGjNBVuIvkXAssalOGoFeBlAGN
         UKhSqCsOPgfYJwb1n0OZr5ltfTj8eFwo7+g989tnY6maklk8eFrc8aplUE2X+A0pS0ll
         b8DwFKd7DUX7cA6m1tZQeQPLbqG6Ug6UP81yz7oMEO0E4jhn6sha42Eqwo0NFBEJ+B6U
         Hd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371597; x=1789976397;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+YUuIr5Tzjda3UhHIE2zWesLU//5JK3mNvRXp9NpTk=;
        b=RJplUN0lVJs0AkIxU9EdG14AJBqBP/B/yEjNViRhwfvXnVh+KqlpbUIqAZqqzZe3hf
         ff+q6cYsjngr39iy9s0s4p+B2MLSZnVwy4kIiorjY0Rhqzt2KpNI4ao81eDW4glwC/l7
         d/AoEfNd3qHKwBxe26e4nZ5Yu/B6kxcze8rMd5/tT4O1/Ac8Ch9G6xCsikA5M6DcNDEz
         F6zZcgVp3VyhfmIT4s5JTmW7WVIsR4zZrbtz10k7I5EYqCskx53xgWBXhHeafenEd5kI
         IX8TiGMoAOCmNlOxBmlFbiumP6fhKFtDDrl9jFjeUSl84TIicDH1PV4lP76g7T/h52XL
         nIDw==
X-Forwarded-Encrypted: i=1; AKwUvBwV4Wa2ll7IsIrnsFTQpwysd0Z7OHAbwySLGVetvhqG1YVm7LIZdKgNsUJfxm79HLu5We9UdokQTrvAeWg=@vger.kernel.org
X-Gm-Message-State: AFuF++nOppX96mxF4eWkGY/ZhQ+W0FPBwR6L4ppZFU8FIUKypG8SK4TY
	Ca/IPUVqjrEv0C7huDfbbbuTTEnvJRLx2jlOYky0oZD9pckqCQlm+JTlMO9tG2IMYDQLd7V2gfA
	bsQuauKNVPjiz7XiQ1pj+PCICneT4ikPKB5OpXJlmMXC7XnnqB14gN1estLRkAZMNdz4=
X-Gm-Gg: AYBFou2dBokOc1OTQ/QTLq+zR47id2xirZiYii+skYTabW+hO/IGQlSeRiBBbDay8sT
	5TCA7KBuUEyzAFzZdbwGkmKu85ej/DvWtXK5W6RE64TY39jRU/cKMS01GZTUAu5+FS3QM3UEKeY
	pWOxP+YpAeYS43zCo5Gce/0JuK/qyCSXg1LxTv72HYzBbevt76vBpbxsg3Vk4ZRUhCsDxe2z4M1
	EI2GxEgrAvKDmBFu6Jax+dEA6LWZEwYI/OFapDvGKlSVZW2VjGAocwUMvmwkJhBlXLbkmDGlW3K
	sML886s/URCiteu+aqhQMizmocg4Y0l7aA2fQfq3mTVkr5JoIIsi7ual5jQOsesV91hr3iG0Oos
	9VCFDlkhRaOy76g==
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr186908985a.25.1789371597480;
        Mon, 14 Sep 2026 00:39:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr186905485a.25.1789371597010;
        Mon, 14 Sep 2026 00:39:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e74esm25016368f8f.25.2026.09.14.00.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:39:56 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:39:54 +0300
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
Subject: Re: [PATCH 16/31] arm64: dts: qcom: sm8450: Add domain idle state
 names
Message-ID: <6pm2ghtt4bfjq7js3bsgjwuer4syforkpvbs3ajtn2josua4r6@3znsj5olp5tf>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-16-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-16-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX+B2p9yQiWu27
 RyRW6crGsPRjfExuId31UsYtLKCVy/1R4nU6wJASpg+OwphmxsTran7zShoNUDFhXkPyM2wUryp
 tDLyvKDY8n/JngREU1PRhFlWl5LMZzBHquSiAdrRHjpioa8VWDJjNWZtGFYmXLYIOtUZwAfsx7v
 V6TRaec2zp4eMMllOxHlnKq8lZe/loI1h08UQPR4WWKQX42dxF5inciCxODkiv7tJY7fpFw6Qd0
 r/VVZgVLjKENu6yymfZu+F7RqS9XjalXo8wmsyTcJTh5qdPTD1HAeF8RXfZU6tdgqOrqXy/iqvv
 aTjgI7DkSeMmS4L/zAKaq/F9SQjT0Ow3uwszZdAotUAP5G6FTKBfElJ2lbUDLShBfgZ3t8I0MzG
 yp5kLXbvX5/g+nVycK1x+DU57MCLn2PQEpwaevB2c5U78pcftxNnio7cvSMu9PA5E0BW1Wg8yyf
 r/CorG3ECxon5pBrDYg==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7a4ce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX39gKYA5ESzCx
 YqWtmI8jPFc83qTQdfbnesHM1WHbj1VjUNZuX5HHCAnLYSVd4hiYqiu13K3ZZu/Da2ANsovmDq/
 OKoc6fsOqTzkg61zi50bJCbIpb3cLUA=
X-Proofpoint-GUID: fHRTWk9zLInxm-inzUK85og7Sh68dbA4
X-Proofpoint-ORIG-GUID: fHRTWk9zLInxm-inzUK85og7Sh68dbA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:48, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
