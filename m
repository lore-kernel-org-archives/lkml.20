Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBDC43FD05
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927609; cv=none; b=E225WYb0nkpaFr7uDlXu6ZOBPtF4Tc9A1U3q0AnwA4CmqnpB45pPmolWRyfeHVH5A1uRZmHO59RHJmpmHUtnpYWCCDSR3ZzUTa1t/DTaNU2rnZJ54I7YP8DplRAxT3T49eK77m0usAAFztpVdfeFH+fzd98Ti7d7hj3xeSPMKRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927609; c=relaxed/simple;
	bh=o/RvQv9f1ZtZd51QR8FJOZby6EqzahPJ2E5K519w+Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rec+gUXOmKRxgVVQnuDZA+r7WcQ9l5J62FYMCwzt+usEiSwqjV90qJqjbYc3DlRpFMe1t7nbwC6AVcxa1YBoQGImS/APEflr/5fAtpezQbtgxdMW9AH8vlQNM/zAl64Hz2Jp9C+kib9k7VJnnlg3j+lBYmZfdA8Gp0khthVbWFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FG8vwcof; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MG3XxAHF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FG8vwcof";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MG3XxAHF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jknC3416655
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 07:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6leoAHiHC58kTdNzD41rzsHZ
	ue8MEp5AAZ57oKNPKQI=; b=FG8vwcof6+Yymu+Xm20Dzq5uzPYgxmE7Oh+3KmL9
	4k+05Lbc2lg9qKNEPq9qtsiLUBRv3VR4dETGZ10i/P9o+KNQdNkUM7EVqedL/Ssa
	KK27jCk46B8ABvKq5zQ4XEA+fzDqbLSTEIu1HZ1WXYZsdicLSoJHYn8O5QLdi67o
	zemOmMenzMGG/BDqkhJ71t8iUVgI+KjzE6yKdJuOUIlfbE997K0uT7alHIK/xHZ0
	Oo24b23CSc50iIrinWNXkSiMqqLn0UbG49MXWuQtqjnktqJ7nEcX7AY7U3Xse7TO
	eeDAsgdGubFKFokXl9S49mTv3V8O+eOeXtKjEX/4/NsuPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxea77d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:53:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5333a1b634bso128006651cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790927605; x=1791532405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6leoAHiHC58kTdNzD41rzsHZue8MEp5AAZ57oKNPKQI=;
        b=MG3XxAHFb0JhwLhs2BpNOb232fHRYqzi7oqgOR+NIVQA2R7DwGRbsmyTsHRBPopCur
         0DKnxfF43tLARsyjDcjSTq0sV1cX9mV6CT9g3yoISe4UFIn1318CCJ4Hj6tqLeVp0jsT
         qg9ivf3KCSySDICBVrAKxh4M9xHEsdVluqXvcUjrvkQ+ubnHTHDfhZrLJyK1zdjcgL5V
         0cyjPzqamjD4NlUb+sQ8VvI3preu9Q6Mj/960xvvvuoGYIp6xfk2np4bYoNddi92+c/3
         kRE0GdZgy4KKTUl0GoFZhAoY/15k521by5Vs8HAil88Cw8P6MGECbDhDZiuJmhlBAucV
         qjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927605; x=1791532405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6leoAHiHC58kTdNzD41rzsHZue8MEp5AAZ57oKNPKQI=;
        b=fGhy8w5WfTi0ksZYGphqjmZ51rYqXyCWVBXha0stpp1lp5Hwuwh0trsdZDqbNEmXjU
         w4HMmDuI3LgRsTSOx4NP9FnjLLJKccsbqKpUsUKOGDodbCpxNF3CyekPgBEV0CmwQH/b
         QBZ1iyuihnkZnSTsG1z6uh73J5uM6rjRgaEXPb1fr3/PLKYGVKga8C4huuTwrWMJ3jR+
         aG/U352DsBRWWbRm1o2c+K9zei8W+ORdswSbubvUy4MBoRM8B4xWL4FlpH3neQauvo7E
         8SSjg4V2c8jn6m2PTmCpzSPRYk/oFtyT4FNiC5lDCtR/2UDV3vMVX0vCALBhcoXaBcRx
         u8NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbRqWRgzRS47SrJQ7e5duwkGRCH5d8gxbn+1dAJpyD2f5WgTuvfACRdbKqF2hw48Xzfvc7LcsRkvG26/I=@vger.kernel.org
X-Gm-Message-State: AFuF++ko/gUcd0MwblfovuFO0R+S4JFCE+yv3A9CeumaDcDCMWhgwW2c
	P55RY4i8iK4y4pCFpL/YrSgSzdEYQJNJhZG1EoV0A+pzYLH9PoOPclw33uJB1TUvCeqOHRwIfUi
	r0Qj7CFupsuPhpEz9KVR5s5VgDwcDjYx/a86rlrjgXkUhTwsfsyZ5Irfpo5acvOPhVMU=
X-Gm-Gg: AYBFou3C0DB6Kq/g6EPybpd2dX7tKbSwRpdVsNqY73Cxzma0zCu8sP851cIkHmwkBV2
	sC8LmmkKslSPTtvL1euQjfSb63yzlmVPiNOOKlEe2EgVh8w/DXD6p71P3xCvV6iBzaPreMVKnY+
	OAlAbgg+NPM6CW2WUeQM2cGJJDY1B0FsPc3Eu4YGb/jScWK7swo0Ghw/r9HjdVwED6nBpyhKbw/
	s22RKa/lHY9N3RkZa9T5tLWyc+wVkYM1BjwdihqAY6y82ctZFhosSTVaRNymOmuoep3ESHYrFmU
	iUXY32wfbgZ0WNHSFJ0jrAGAFDPhWqDzlVqjN08zNU1hjBIzIkZQaijmAqBv/39udHiEs054LtZ
	V6oLZj92I4G1OdcUNIQAx
X-Received: by 2002:a05:620a:a0c4:10b0:939:fc74:b6af with SMTP id af79cd13be357-93cf16b3fdbmr230240685a.11.1790927605393;
        Fri, 02 Oct 2026 00:53:25 -0700 (PDT)
X-Received: by 2002:a05:620a:a0c4:10b0:939:fc74:b6af with SMTP id af79cd13be357-93cf16b3fdbmr230237685a.11.1790927604917;
        Fri, 02 Oct 2026 00:53:24 -0700 (PDT)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fad53sm4411184f8f.19.2026.10.02.00.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:53:24 -0700 (PDT)
Date: Fri, 2 Oct 2026 09:53:22 +0200
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: Re: [PATCH v15 3/6] reboot: add parsable tokens for power state
 change reasons
Message-ID: <ar9i8i-7a7ZnT5t8@mai.linaro.org>
References: <20260924-pscrr-framework-v15-0-7af87107e0d3@oss.qualcomm.com>
 <20260924-pscrr-framework-v15-3-7af87107e0d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-pscrr-framework-v15-3-7af87107e0d3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abf62f6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=WjtHAGiS79jxuaiHvU8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6RAW-ZiYN6-2zyEahPI6soeXCWyr5MMA
X-Proofpoint-ORIG-GUID: 6RAW-ZiYN6-2zyEahPI6soeXCWyr5MMA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMSBTYWx0ZWRfXz+KKP7OyGEfW
 cbQ3mADfRhQ1sCTb1jKlff6Nef79IzwuXV+/MeOT1vhIwXZwyyI1sKVjY0PHlOJqNwBKxIx1muc
 ozTZ5UKqyd253GT/8ySj1h7MNkRphp3VMTabMy+X1E1DfSe5vKN643/3L6c1URsVaeCyqpjGdhD
 jOguMc0DerqMjiDk4y5So3XCZAEJcJeQzdbb1T1DSSuf2P3ypJcGiNJYrpR+PjzjO0fHJUejalY
 MZBbU7qCeMe3EYbO/7rsthCwU6+3nNEcBHOfDEYQdjuLdKPTLKKvNKAx4C9ugPCB3JuRIjmLzSP
 K0xQaXqoIzwnV5BRN+YvyC97usLOvVosXms+anf2axlfeRQ2DsiM9tSBkZeajQhr5LkMu6OBm2D
 egowHRtNkcOXcYvC+tJYHN2pZBMhGqbPNWNvR9oqPTUocySaUNyaR/4Hvn338TSAUMdxsz3j2M4
 jKxb/ePkxG8pVrcT+Vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMSBTYWx0ZWRfXwvRB5Cl+Vtec
 OcX27tgkIXqBtI5tlDyEI17zj9qxbtgAGy3hmn2YFaB2KpBxZuTyNq4DlASmjWOPizbTRdqRDGJ
 Z1HX+HW1Bx4oeyfbG3MMVeT6QdN0Y78=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020031

On Thu, Sep 24, 2026 at 12:38:44PM +0530, Faruque Ansari wrote:
> psc_reason_to_str() returns human-readable labels that contain spaces
> (e.g. "over temperature"). Those are fine for logs but unusable as
> values in a space-separated sysfs list or as a write target.
> 
> Extend the single reason descriptor table with a stable, space-free
> token next to the existing label, and add psc_reason_to_token() and
> psc_reason_from_token() so consumers can emit and parse reasons without
> inventing their own string table.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Chnages v15

Nit: ^^^

> - Add Reviewed-by tags from Matti Vaittinen.

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
