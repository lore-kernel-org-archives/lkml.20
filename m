Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B642E43F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082259; cv=none; b=J9aq6QbORIvdNeGBBFcWJ0X9sDQWLPuXxl0Z7rzfuXRkmnMUkM6VwbL6Q9U7DDH8M945gcdV93x7pEqara4CPQDb83J2sbwY+fStJ0usEds0e8LsRj2GKbd6me2x2PLtY1NS4jf/zn4nzlNN7zIVkHnOnpqwRWPvAdh9nEKwo70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082259; c=relaxed/simple;
	bh=ztVNH4vuSfVR3gj8fZ0vViL22IF/85VKkTRz2Wc8cYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMchyb06DR9xPMaOYm/rKv+Tgu6d0mdX1YTDeQZwvVXmTB9iVuLNpQhe5jdap63+IPCPbBsnIr2Nsz2LR7fY3D4Q503Mg8j+6TQ8WIT6aKICTwka1ku3m4dZKZBfXAFYbHlIRWt95YnE+jGzjc3z3OpZO/gA2iJMi8k4mldqMT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWgIntcf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADh8Qzgj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWgIntcf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADh8Qzgj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FG0jJ33510317
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZEBnHRPWcaOA/9dLapYt18AI
	Vs57G9ViDn2EaeI+nYI=; b=RWgIntcfs59WN3QZtzbBmBmwUKj6VRbjd1/aj50m
	BwVcHSlvviaL3CbhMRjymP70WkaCAyDvJgxFu9gfKAQT+yBgsdyTVxGhZhoW7lUn
	WrwtJ/IdJs+GyKzFhHgtWTzxJnZG2KYlg4bhRZeQvVqE5KbrBigmOfZoBn34YnZ4
	tImZalj+Cvq7NZEfEORYouxOHMO5RfGxBVLKJW8sGPQLQ9XpqTTHWdegvq+yi97P
	oQNNi7xW9BfarxLd4sM5Ub8VGm7Edn1KZpnIIEHJmfmeRMZzXnHeaeT/K2yNF2YM
	qedjggLhMttrn3MRABMJHL/dWThbXxva6DGxGb6Uho/USA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdsb1tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:37:28 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so20279761c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792082247; x=1792687047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEBnHRPWcaOA/9dLapYt18AIVs57G9ViDn2EaeI+nYI=;
        b=ADh8QzgjlByxyTn+u902jtgIjeYJ4mOYFESSVe5I3IiaWI+nI+s+F3EH4eeRA2ExRP
         /MWBmDAc2i45aN6tHQYB7HpkkVVg9cdY2ldSNQV4Vtw9nU617gvy5xuNG6kv4zIFRIWt
         ToAcx0hTkwuD7/RKA4nzTCAb1T1ivMgQofLtXZWxtYlcY6tJQR2BRhDtOv6P7IdePYP4
         hn+uOe+BpWjFVruBzzS7a0wCrcPuTvE/Lm1F4aCbfG654yCtj7hwcGH9GzRzjgAD9vkg
         IA1TDcaVp24yLxS2zJvfweRDEnS5p9hUQ97MjZhyR6FQRpvy/GF7x5Kz8A9cv09ipQd0
         JG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082247; x=1792687047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEBnHRPWcaOA/9dLapYt18AIVs57G9ViDn2EaeI+nYI=;
        b=nagsnSdUNDTm5qQVOy4Ibkl8UZ0UgX+nCGZptpz8j3XjtY178/nOxZeVLPtGroFZzg
         j/oc0K8aAir2w9rGv90pt36F8FpAGK8FXkjsFH1jl59McbnVL0Bn0ruzy03Zwcd53RXN
         3W34Oe46oolotwMkhx0PeE7H8BGhGKWZLqR1Jgb5DktNud+5nanhkmRFYW6kUO3aWGQD
         dlAVTBMI+cETJnHnadzqoWzm8VtkhAYRjlAkFChRbrPpioOslPKNwdHfDPy8cdr/VSU/
         olCTtnq0GBql+xIOWa5YAbrOPcVwsaKZmgthcPoKNc9hWb4T1ZxHIGj04ytNDsQh9+lI
         jsRA==
X-Forwarded-Encrypted: i=1; AKwUvBxZIYyRzv1CPPx4z3LgZbsycyNsuITDbizXbt/2hmqzJaQM/UcpC0RTNQveO8paOQKBB5cu35YWBq2PHHw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJAWTEsusdQYKOGgLYCbqdxOynbuK9RcBLt6i7k8IR89v/NQtK
	ktrjoaYRJlJx7lVKlPiwBW45ujdZkuYE9s+cnRxfwIU+lirojzTLgguOsF7uCq3+DapSd0fRU/Q
	2jmGcOx2I1/05coch7gCcBcA9+WL97lnG1k25InexhvzQANnZxrnBxDtICQfbijcew0I=
X-Gm-Gg: AYBFou0SJRa4HzTtuAlbq1mJRKr683yQBFNN9I+H8LhQuayoNpErJkCXl6Q4X1xJiFS
	YieHWwUcNVnoFCR0w/+foaO7Gb+BpKxG2TVnC49TEI2B53z+vsFbyto0MkmjrsfrWBuP3vBsENL
	7xZYJtLOhUWpH/bteTjHvNcx/QR3yh/8LQB5YXaJ6+dv1STUBdxCXxiFZm6620eELO8ocCICHdo
	oK9gzHLFisQumi4HA4qRY+Lf5nYFM7fi1cpwmXTGsiN1UxB1U2E61XDWIg0H9NaA4VUq0exq886
	+a//8coXdp8PO7+zpXhfN/AH3UMKEQnU83RMsCJl99msQDEXv68Xp1FH1iq4qd4qQ/rqwnSdCWp
	1DSzJOyvzyz6+
X-Received: by 2002:a05:7022:3b85:b0:163:cc63:ecee with SMTP id a92af1059eb24-16a65c03d19mr29504822c88.45.1792082247038;
        Thu, 15 Oct 2026 09:37:27 -0700 (PDT)
X-Received: by 2002:a05:7022:3b85:b0:163:cc63:ecee with SMTP id a92af1059eb24-16a65c03d19mr29504789c88.45.1792082246332;
        Thu, 15 Oct 2026 09:37:26 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a5a2fb99sm116946c88.5.2026.10.15.09.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:37:25 -0700 (PDT)
Date: Thu, 15 Oct 2026 22:07:17 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alex Elder <elder@riscstar.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, hkallweit1@gmail.com,
        linux@armlinux.org.uk, Daniel Thompson <daniel@riscstar.com>,
        ansuelsmth@gmail.com, donggeunyoo.kernel@gmail.com,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: phy: qcom: qca808x: Add regulator
 management
Message-ID: <atEBPbpMtlmG+Mxe@oss.qualcomm.com>
References: <20261015143849.483339-1-elder@riscstar.com>
 <20261015143849.483339-3-elder@riscstar.com>
 <atDz2hJ6xpA3p5y7@lore-desk>
 <4fc165eb-b57d-41f8-b7b9-c9fe433d866c@riscstar.com>
 <1af4e7a8-adb9-41bd-8841-61180b284470@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1af4e7a8-adb9-41bd-8841-61180b284470@lunn.ch>
X-Proofpoint-ORIG-GUID: uM0e3pGTFbCXPJNSs6vXDqgf6VwJF2lg
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad10148 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=XObs8swggq2u4OB2KFAA:9 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2NiBTYWx0ZWRfX1LuBJP03Tehz
 c7Heom9LUKTnq/X0d/POGmRLhZfT7iAKzqXjjCddPbjH0of6d1GJu3dATDzMluXLhwKm1Bw72dH
 zWYu9yY5cPBWpueGY6yXpzWy8i64r1mhIQoC1vf9h9DJNtRuR3H2YD3BaDDxBZc10xVhDN7FQRI
 glfn9MNcOeU8qTcXYx8I1wjLpC/LWPADNv4QA974H2HYyNs0BiTVozAthR4QklADKzNQuDN17PQ
 EE2t+CC0qGou6IIaSjOca8VUIseVw9VrVHd/gEqfsc0KjaObDj/W4rAg+TOUeootlfavLnJDsQM
 xo7o0nS0X5xYMJI6PLyLMq0U33Fj+aAc1XGh0jAULtJerZDMZy9g/aPjHD2TwL+PhMUlVFGjGKF
 X2FBX6f/rxijP611DmyFiFZVRsyKpAee2u3XK2C0MCa9GQ6J4sUHwv328eS0qABWHvHD4HG+iXi
 A8osbtmxCtEjzaLOs/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2NiBTYWx0ZWRfX0nHPfAvaM5qc
 qn6/0Zq0A6OWP/W1gpYg6mcglnYw5tf8VzYR0YxFawCNMoBudjxCd5ZhBU/P6Wt6KP06zxZfthd
 RS4oUoRUuvEvXK/87W9cejJW8ZSCsow=
X-Proofpoint-GUID: uM0e3pGTFbCXPJNSs6vXDqgf6VwJF2lg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150066

On Thu, Oct 15, 2026 at 06:27:01PM +0200, Andrew Lunn wrote:
> On Thu, Oct 15, 2026 at 11:01:43AM -0500, Alex Elder wrote:
> > On 10/15/26 10:40 AM, Lorenzo Bianconi wrote:
> > > > +	if (count)
> > > > +		fsleep(phydev->mdio.reset_assert_delay);
> > > nit: should we check reset_assert_delay field is actually set?
> > 
> > Are you saying there should be an alternative delay used
> > if it is not set?  Do you have a suggestion for what to
> > use in that case?
> 
> Does the binding require the value is set?
> 
> What happens it if is 0? I think fsleep() is happy to delay for 0 uS,
> but does the hardware still work? Does the datasheet say anything
> about power on delays?
> 

I was going to share a text version of the power-up diagram given in
this PHY's datasheet. This might help.

Power-Up Sequence

1. DVDD asserted
   |
   |<-------- 10 ms -------->|   (required for external power)
   |
2. DVDD18 / AVDD18 asserted

3. VDD1P25 asserted
   |
   |<-------- 0.2 ms ------->|   (required for LDO to settle)
   |
4. VDD_LDO asserted

5. AVDD asserted
   |
   |<--------- 2 ms -------->|   (required for XTL to oscillate)
   |
6. Crystal 50 MHz starts oscillating

7. PAD reset deasserted
   |
   |<------- 10 ms --------->|   (deglitch time)


So, maybe just fsleep(22200) or something a bit higher?

	Ayaan

