Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099746;
	b=bfhV7/Kw2fUGvdQInoN2sk3r80ZB8liqH2FUacRad13H6P4HXl9zFkb6/FJT7zQ4jNqW
	 SLxqpkA+dWMIWDCAuZXnL1oRHoKHoyjLBBS/WKflMVRNBRik2thczoQVJmX1DXT7TtvBa
	 FnfC+8aGC7vQJHoGYFf7c68NSFsrqLtfNpiZrm3Xj9HTMEe193HK7FftJ8JFRniKcQ2d/
	 p45s3lSd4bBkie5BWRe2GfrDc2poYaZbvBXKZIykkf5R5kgBX4E6eaE1SR2nEyewPUzOc
	 1AvRnG0QcPZgolU+IGPY53PLeTtATyDQXto5fqj6o5nm1U7SYVvcgS1tKXSBQmJHg0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=clFZbp6yNCB/YE/B1ve7L1IoY6Bcs0zpZMjkhGO28Kc=;
	b=Fwcc/p+1ouSbALJle5kGYCL1UBUJMwyD6B6VLkF+Pn4UPnAiskgOTLO1touEM+IYsngQ
	 9cU8FIX5Z2obPhFjPwpsM9L2kh1ZHuub/5Tvkal7NvdU9ntvlq8kFq2b2r+hFKdcECC3F
	 cVuHfAmoBex41aLaJOHmIX+EnV8hly/TCK4pt8IUqernNgz0S2JAbWXmpDrDHYbthZf9Y
	 806OHOLSPpPvCOvuxJetOskHThqqkm2Dj3SfBwHf8jv73Sn7cy6e+g4Jz95rny75pliNi
	 sNSicb8eZxCiYM8mPrJj8HuqxNXcb2z2vIXnpqOSflodCK745bhXod6hrHPhWz9ztbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nYElmgpm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVXEVJz7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E046606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E046606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nYElmgpm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVXEVJz7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeKJF1427430
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=clFZbp6yNCB/YE/B1ve7L1Io
	Y6Bcs0zpZMjkhGO28Kc=; b=nYElmgpmdzTiT/98uSp7vg3/UTN89eAvFjrP2ULr
	r/ddRaT9EB2Xzc1S8YxCdrFScOifda03FyieisurvtoyactKVdG3NtwLZeIIskjK
	Vsf2MgJRWuhc9Om7fF60wtLQX2ShpdrEn6j/wB3visIThtxRFRasojWOwxBKOsyA
	PBnyjkctfLOt+Twzz7PjIaYn7e2AOdHXWuuab27wPtsQRSWyTrb/2Th3Kie2nDNi
	EYZxXK7wyWtNabwMOsDHjNL6bJn6PcJKnSVhKsc09K5UDxq90f+/cFZVeM87wSjV
	neM6EFOVnaYB8kC2RpFHEEEnULTo2r1kEt6P7TZW5AC3FA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmb9q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:15:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so770864085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099744; x=1793704544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=clFZbp6yNCB/YE/B1ve7L1IoY6Bcs0zpZMjkhGO28Kc=;
        b=MVXEVJz7m/ITB4rYKSo8NUO0IwihxZgCJAjE21vQyHY5MaIxNdhE18rbFZo9AtBO/J
         r19qi6hcYANMTEhCSTgt3wFoi8F91RrwItTypftZvmXk/HZu75kldNSzq2rQOqIF2W1Z
         uFsSaovRz2S/Dv2u8jkFt3ObjS6fhr2ICdPr0UtCG4uuoVxS56OzJRvWLOs11+L+HUa4
         BTCIU9j8WHqYHOWMLM7KUebwWqENTJjkSOCpfhly2rOqfzli9M+lleE/uqMcJxNp0X18
         FhbWeWPrDkYvDtxMb9Q7TXL5DrTxAT5zY9Vpmwio/Zjk7VRkkogfaoYtEXmzG2HG+TeG
         7B1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099744; x=1793704544;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clFZbp6yNCB/YE/B1ve7L1IoY6Bcs0zpZMjkhGO28Kc=;
        b=wzv8AGsbLcgCxQyVqXHRRmVd+kGW0rKQrZ59OUDkQnjzfGIo47WKK30E5Dbn/qUTeH
         2MM5doayVbe3jXz2PigcmqJV5LPkCgM1+s8SO6CMw/QwO9SP6Q9dxnU16fi0ELTNlRqM
         RuJtqcaNWK5D/0tP3UYdw0Hl2Mz5NukVrrneoLpXQ0rM7GloUf+ucZORWI198S8UcBvB
         XwDiPSeKG4HgMx+dbiCoNv6YeOaU/uqOX1pmWULLxq8iOSIVbUBfYAal1wVRVK6urYoK
         n5IoqmHW9VzPymnut/VPZHF1yBORGYT1paABesw4S6l/1D4beQ0ioZt1XH7W4G02e43s
         PKOw==
X-Forwarded-Encrypted: i=1; AKwUvBzj7n6EVANZC6jkYOndt8AzZD1EH1BYasHrIS8+179VSUPoGp4AD6VQdfZ1cQEQKcD1PpuYj3xKWzFR0AM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqobQ62qM4/tfOHI8v4LRPVbdx9TKiEblDrO+gcI08ZoZV5ZEr
	tAFRDoWJ78A6ge3emKl2+UDpruB2J648VrAU304mqBtQTDS3oKWzNxs9uKhgO9V/XtXl3wZonJB
	Q6xz6ladNggvPqyYun+VQkUZcCXGJct2uHB1hgWF5mwER6jn1Z8FjN9vh6QvV0txCLeA=
X-Gm-Gg: AYBFou3WED5srwlvi9gXw4W2fDfEAf1j1HszuzuYSq4wybl/0UPZsoJ2WUve4KpcY70
	YZYU5zVKoIgW1w3EgOXUtemiMpu9xJme3UWZKqQU8Qs6xSPil/EQS63XMHReVUMiUUtXrT0/JRq
	lgbNLz5Y/g/jAusiYnjGO52EoYTl5MwWOsPJ4iKGIHXN3hiQOqgOnhnwDZWIqSLFhuV1uz96pKx
	hvLZMrnTituEZCcZ31C4zM4c6lZmrnVLTBVaD+OaBIUPHNw1ws7B+xgrTp+XcZ3/4lblhyJwF02
	uE0yULb1kDtWWXZs/wftPomC2aXfrrA47qN9fvwcCaB7Fm0Z28Hq+MfTWkv/dyv3Y3V66zyAPCU
	ChYurVDSkIP3gkYCT
X-Received: by 2002:a05:620a:2b82:b0:93f:5f83:2ca4 with SMTP id af79cd13be357-940ef97bd9cmr1448742485a.51.1793099743958;
        Tue, 27 Oct 2026 04:15:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2b82:b0:93f:5f83:2ca4 with SMTP id af79cd13be357-940ef97bd9cmr1448739085a.51.1793099743381;
        Tue, 27 Oct 2026 04:15:43 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm262014585e9.14.2026.10.27.04.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:15:42 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:15:41 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] phy: qualcomm: m31-eusb2: Add register
 XCFGI_159_152 for SE0 recovery
Message-ID: <2e2t6xf3mnvauzi7qyh4gu4ngzrgaijryggj5kpyhrizimvnvt@vth2h3bd2g4m>
References: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
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
In-Reply-To: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX/XspIqHBS2iJ
 kJQ93YR8gEJNiDBgKS9SJN758IgcefRjrsf2ytbE/tZ9Ptt1pqe0o9xr1FcNwM4rbF+sBmzXPUM
 +thxBzI+REBSjUCbasgTL0g+ZO8MJvU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX6B/ssoE5S5BM
 QYn8S0DNxOVjFn0PZRM1CqQ746ie+qJH6UuJv2F3FKBAT46lIuCKtTaH/jn40FHRdN3HGJnkqEE
 jYvA/gvHefVyvDUJ0fieQKwNCwuX4PpX74Jy8Uxjh4Q8eA0VTFbJkxf3xfOkit00rKJZufoG3sE
 HY1LiyEjEw9PnLAZxOeCrAoSodEFbp9nBASX3uq1Lq1REX1mG5kXmVnn1GhE/SkfVh/m6Uo9d65
 lzDDMeQdPsSVikXj7FYIlHKT/ddrmh2mGdIKGA7Z6a2/srxetU96uknfUCcTlfMARiwYgJARDNz
 CI78eN1H5uSagIynMDMU+gNpyaigIg2GO69DSiNQzDwJJGJjD2Cw3+jmeNKk0fRheBurh6U8FxK
 UR8DFCCQdUT9F4qFn2VpaE2HR6Jno+qh8zSxdnXJMcHgoIIDu+OFJURfGeiz/IXVL4jTOS8i9MQ
 8IZ2h2s648ZQV7hkzag==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae087e1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fd6TEVAS4L3J52g8tvEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XBTxttfZ4iJaw0u-jGTgU456UXW9oCFm
X-Proofpoint-GUID: XBTxttfZ4iJaw0u-jGTgU456UXW9oCFm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270044

On 26-10-26 18:55:45, Peter Chen wrote:
> From: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> This patch introduces support for the XCFGI_159_152 register to enable a
> hardware-based SE0 recovery mechanism in the M31 PHY when operating in
> host mode.
> 
> During PHY initialization, spurious pulses from external devices can
> interfere with speed negotiation, potentially leading to abnormal
> behavior. To mitigate this, the M31 PHY provides a fail-safe mechanism
> controlled by bit 159 of the XCFGI register.
> 
> When XCFG_SE0_TIMEOUT_EN (bit 159) is set, a hardware counter is
> activated to monitor the SE0 state. If SE0 persists for more than 2.5 ms
> before entering L0 mode, the PHY interprets this as bus inactivity and
> resets the state machine to its default state. After transitioning to
> L0, the PHY resumes normal operation in accordance with the eUSB
> specification.
> 
> Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
