Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0801A41BA7A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790526824; cv=none; b=RfrSZpEoC595f7I5s0Sa76zJKegzwLZcKA9JLC9DkVaLbl2Xrg6ndwUp+asV5rCesSpLLVRaY2f4lKbGcqoPxl6RfbyORVepRCo0VaXoobSPtQy59QQKH/cfFgHSyYI+9qw7mGpHWeFNO1fWW0DASdhSXPvJCPetQsFisvWj9/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790526824; c=relaxed/simple;
	bh=xGlbAsXAOE8rH+2A5jMDhH2JAdQcuVK+CGw16Ag4g3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHcfGi+BvNtwOnK/iTAcWuGAJFA0ccSKO58cdcuIz9w/OxJrJEIXyqujYXvMDklYkNpZrk8ro9G4JAMasAGk3IA/ajpB6otTJgkIJRMSJtzRGNTYZuzTmPw7+8D28HDHDfDAOngHbZzAy1Khg+CEXNuVuhVytSzEU2bmeTD8lvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EN/ib10L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3cmqhd5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EN/ib10L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3cmqhd5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QMkOrJ2148208
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kBaOyYV1iWR4jpfFBZ3VawI9
	vIbejaQgOQsY1cvSmjY=; b=EN/ib10LX8Y/+lkH0LFd8Jk09MJQN+CIC0e7m+uf
	SFjv96uGdqB/t/rKCAY44aGZobz57ViFMvRnVljBHQPa9qd1lHKiYuXvfhaqGAnH
	H92h5WAYp5cigEofp8/jBwuvtbpKRFddGeaCvseffvOiUEtKXC8uS6cPUNmPD7WF
	/BVSAi27/TO/jOfutRTKml2kn7amU4nYxvTg8i8Xa3nxxQlozuSAiYgy/sWmUAxD
	/4drmk0V+Ith/qcM7lQeW0TtVrZqZIQ/jn2l2MAZf3o0CQsKbD90B5+p+VmHrund
	F0ME9KJN4BafMYiviDoi8ZgU1f4tRmUJ33kUeWMiI1rxkQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3rfum6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:33:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c6a0d2122so138590985a.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790526818; x=1791131618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kBaOyYV1iWR4jpfFBZ3VawI9vIbejaQgOQsY1cvSmjY=;
        b=g3cmqhd5myslN0V5757uS/KwZ29tSu5wq/u4g3X9CKoKDEvEpjscVkZmnxP7WZvl11
         l9w+vWLlaUqQ4z5Ov0fW1t1Aa8os0JB3hIoH9DnPj0d9fhTHpDQZZeu+vzyiCEm7X5tc
         kfO1WiSzQkbUTO4DAYguORKrufsSprYwIaI9S4jjnmRiXYNB9HWX48cveKUfxRWMcJKa
         gF8tsLgm8BJtCWmGgiZkcPJoF8C7uTni4M8e8C9UvUKyD+bCjlfe/eE1ZYpwwcPsn/rg
         3giZsQkmfNg0M+7U/DAwNwyXnk7/MjJYTumBDDBSk1AOMG/m7M2k0qvGOEqXkxqUiZ0i
         +r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790526818; x=1791131618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBaOyYV1iWR4jpfFBZ3VawI9vIbejaQgOQsY1cvSmjY=;
        b=LTuRBSC9dhwoDSYjcj1OPqjQEa+OMyO5RvdorYIdt3pIzKDBahCwEa7rY7SgPgw3up
         eJI1UMNUMMYoDgZv0X+y7K3iQAQK3EQP2hZPm5pyWGA1tQUz++76MxhlOc71xAkW3e7W
         GFq4rBguySzL0XXozAsI4kngBXOykjSSORD0gwP1WPpJiFCCy3wD3guOoh28ZDIOpYhS
         qIk0oiV0rU3eTGth2wtbVvNWgndiKATE9hsQz7ROsAMAq8dUuv/vYm9d8O54VOV+AQUG
         kFyX6+HupU4q96MwMVPiesiFP3AZPQcG3KbBj9FN215sK9OR79SsksjSWQoqEmrB0mC7
         xgDw==
X-Forwarded-Encrypted: i=1; AKwUvBw5oI8QMU0Mxi6wiXYyWk1iC25kCI0Xsl4ADg6WqULNy5civ/1V8nDCcUZkQONctoRgx6ywL9iJPV4vP/E=@vger.kernel.org
X-Gm-Message-State: AFuF++n2oF7hBjuyDrlUoKWki2r0j7u110NcBniYDFRTRDLHMPVjA7ft
	WNzckEncrq8+/eh7X33zFXpaX/U9V/mz5QwlePDv47V0BjrJkcb4ddLhmM1PFfR7Q2LuCBkUesm
	yfEV4oBroo9cm85Wq9sWz7kI2o/yYpbBULOVQn0uFov3JyCAIZmq5qm2WUXgji/gFbHw=
X-Gm-Gg: AYBFou25Hld1htl6+WTGM62gIFW6nDtzWkUZ5fhXjjLm5box1hYW04U2pckPF1Va3B7
	hLyGkzYr9+k95aWI4q4H4xRc5Yi3/TBdyni1vHD5vfLICfOzfOzd6M/rNt5zcdtBQQaq+ZWYar0
	Uhn6vEo/dQkAIdXf8qIRJ8o9trP6CuH4DWVEf1lGaxZTBuGCUvboPlkog4MeLajIJYybLSJRm2a
	0WrGcrlliy/h8lXYZXuaTajbppaddWu4xN5VbFi/1RhrTeFJoerakMO7n+bjLjzde7MZ9/zg6iP
	bqL0FmvSUBIum20lUWpbtMkTp4p/GMqozeDR3u4IoP63EXYQh2+AgZO98S/DHSJRD8d7k+CozoL
	IhsILB78nzpsPGL3A+RB1bCrWOHJVbTE9cAPJMmZ168kGDKgt298EiXq8HK70jh8b12o2NUt2nI
	OSk033ruiA0Wxj
X-Received: by 2002:a05:620a:8001:b0:93c:735c:2477 with SMTP id af79cd13be357-93c735c28b2mr277172885a.21.1790526818145;
        Sun, 27 Sep 2026 09:33:38 -0700 (PDT)
X-Received: by 2002:a05:620a:8001:b0:93c:735c:2477 with SMTP id af79cd13be357-93c735c28b2mr277166485a.21.1790526817696;
        Sun, 27 Sep 2026 09:33:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6ae622bsm1929439e87.16.2026.09.27.09.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:33:36 -0700 (PDT)
Date: Sun, 27 Sep 2026 19:33:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
Message-ID: <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
 <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA2NSBTYWx0ZWRfX7bOaqR4LJIRG
 x2+oXZZ6YcEHUjWUK+rEv4TuTG6c1ow5Gb1Ecy6KabI5oTYQ//RH8hhPduCpXCT1juqhbdmCZMe
 h2VVoyys6UqpEPZU9YsRcE5+NJ/zSWA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA2NSBTYWx0ZWRfXzOhK16HJXa9w
 E5pewA9f8sCXM+t2diQz8q7Ngxo2YPgUiSuEeJhCajT0v2aP2kLNa31OOeGuHAo++k+m8n9l9JM
 DNK4WcHpRDQv8IBB8Gx1QSqlrRrFu18CI/l6tNsUk5+zodQpmo/4tRHrgKcrUGGdvQLwmT4O4Im
 tQsb/hRsvmag90AHZ9rh+eRb0eqa1JL5yNBajaIMOiBLzaXtThXfacY49H+VtF+jF2Uzq+GORPA
 jyOQN16rdth//ob4TgxgCsjAs0pUI1o3/a0lJ3Cib/GX+YffyxdcfuFreLYh+/eZMLj/4yd5GWJ
 T4jHFI9M93DYULyZ5ixYP35BjxXKvqfLsHoQt9I7Oo+rivh8adeOGZcgIbGNPgVldxCl8ljoOMn
 /tlYyF8qs4a2GCN7TFCGi2BDr/M7luyxcuGT2mxnOdL19N/cUk3jn5biLW+yNwR6FuvLNMfD0qb
 LCsAeMYRgJT0VQlXj6A==
X-Proofpoint-GUID: yWxRQ8s2XT8mURp4pQu0oSvfAOG9fzMC
X-Proofpoint-ORIG-GUID: yWxRQ8s2XT8mURp4pQu0oSvfAOG9fzMC
X-Authority-Analysis: v=2.4 cv=K6G3jCWI c=1 sm=1 tr=0 ts=6ab94563 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Ei4b4_x7BeZEOqWOIxkA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270065

On Sun, Sep 27, 2026 at 05:16:28PM +0200, David Heidelberg wrote:
> On 27/09/2026 15:05, Dmitry Baryshkov wrote:
> > On Sat, Sep 26, 2026 at 02:40:19PM +0200, David Heidelberg via B4 Relay wrote:
> > > This series adds basic USB Type-C support for 1st gen devices, covering
> > > configurations that do not require VBUS power (e.g. devices using
> > > externally powered docks).
> > > 
> > > VBUS support will be added in a follow-up series after this one is merged.
> > > Supporting VBUS will likely require refactoring parts of the SMBX charger
> > > support, which is why it is not included here.
> > > 
> > > Tested with an externally powered dock station:
> > > 
> > >   - Pixel 3 / 3 XL
> > >   - SHIFT 6mq
> > >   - OnePlus 6
> > > 
> > > Tested with an additional, not-yet-included VBUS patch for non-powered
> > > devices:
> > > 
> > >   - Xiaomi Redmi Note 7
> > >   - Xiaomi Mi Pad 4
> > 
> > THis is very interesting, as it will also unblock DisplayPort support on
> > devices from those generations.
> 
> Yes, DP works with some minor adjustment there and there (going to be follow-up)
> 
> > 
> > 
> > One major comment. As we see, on SMB2 PMICs parts of the Type-C
> > functionality are provided by the charger / FG device. I guess that on
> > SMB5 PMICs we will get the same problem once somebody tries to implement
> > additional charger features. Would it make sense to rework the PMIC TCPM
> > driver to be a composite driver, taking several components via the
> > existing Linux interface?
> 
> As this gets decided from the QCOM side, I'm fine with whatever suits the
> hardware best.

Bryan, as you are a maintainer of the PMIC-TCPM? Would the use of
components be fine?

-- 
With best wishes
Dmitry
