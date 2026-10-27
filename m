Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093902;
	b=rrmi6IuY4fdSpVPTcwEzyn7olGjiMlACuVMY0qBQgDWWf2IZYPvolyMIpsq7XS0tBtw7
	 ENGOeoDlRHSGPl24/CxL+U0p0fYVPZQpBrfNZe+EtSfrov6NPgiKwe+Luq2flscVDFScA
	 1A+O1ajMa6en0k3m4MwxLBCFn4EHPdQrRs8CzwOvZ8I6jH8aeAYwIbvC82NqREEUlylIM
	 VL6BNLrYLB1s+FVt5VeXj516RQzhqEmIDhEFIF68RRlH06pq1giIPKFdk+jdYZefIrs+m
	 WRLuBR0r9SC0ESBuvCyG5TU2lK3v7Jreo0XnHOdCJnTiM+agjnflnq04d68w/KCS4jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i0yudmo6VUVU85MjSM6weznmhVRKi2zeK7oy8nDu0HA=;
	b=npxIaJDwva3IiZtJYkaXOlXCCe7TKTYsWQdyAEYRBBtBYPgxrhtcIJGy9HN+bMYg4PHQ
	 iBKnxIggtv6TKa+FiDS2PCXFdnFZtsWCbgronWpSkqn/wO4ZI332JE8Dmk545j2Mfskup
	 Fp/uryEa2fluikBuaUZn98EZ0fksjapePBKUm/N/eF0FkfDBThsZzDohZC3T2V+8e+ToG
	 IbOPt973P7fB5+duzHIC5gvmiT5sARejgBeuU2BV7lwkLpSyUATRs/5XAPbTFCN2ugGDa
	 ManS9VSNLFX77jtVg9AbYDbRUeIdKc97FxfT/bN/yd2QgfUC2qshGQrmxTG5CXC/zCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6u5XQJI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crtGYp+L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DB0606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DB0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6u5XQJI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crtGYp+L
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8fst62192681
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i0yudmo6VUV
	U85MjSM6weznmhVRKi2zeK7oy8nDu0HA=; b=A6u5XQJICbd6VxefZe0sFqhQnfz
	1cFns9YtPeN2RKesCu9lXgXMzucDrEshF0KjApXHqCNwHWj6dGjOlc5xld3a8H41
	e1HvS7A9OyLF+c7pF066AdeUM/bL+wKE7e61UmpsaBWBdtpdZ+Y4hI8FkpsJbpNA
	fkXw28nnQnJ0zgsRHSvWKgg7xP0Qc+k3c9aUDnI9j+oc5V67GsYkD8sb+spvE2Mx
	sN3DGtxIei0SHIC/LdDeBFmXPo8bFIKR44sSdacn6Grx0OOvR4swM9ejQ6Ro/5T4
	7FfW9mRSpqM8t6up33vUFFF1i8vXHVgGKcYUYRqEQNZUQh0Sd5cXVgZViJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt9kdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:38:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so701828085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793093900; x=1793698700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0yudmo6VUVU85MjSM6weznmhVRKi2zeK7oy8nDu0HA=;
        b=crtGYp+LmroFWe6hRFheAEXJPNV/slhfm86t8qxETGZ6tNtDxkabUwgQJ+icKX7LUu
         UNFfqtaP40raVawgfW0JP0N7S59qRNSzV6ut00vek+zp3AXTq1SuYuN5yqlefQz0CjRw
         c/YDJ/tBoMyIcRXEvIlbTIu0HIfCB9fqHabw4DhgsKj0GiLUUh6datzYoKljII06fk0u
         ZMgYGqsDIAdR6kM9opopvBw76yvbI20DLK2B50srhgpynYkwTw/iDoLXJ+NENwUSQlFX
         qEq5dSOTQpWrDsliJTGdHrAA/73AHCSLAW3FdzZZjhld4Nxcmc4XKCcI+hRnA1jMh/Kh
         pfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093900; x=1793698700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i0yudmo6VUVU85MjSM6weznmhVRKi2zeK7oy8nDu0HA=;
        b=Xc8BUDTeH4jfBzIu9gSy9h1BK2GFnTQC/ZeeQ+BRBJqp3DswgmrcMdEP7AIzqBN69H
         SZ4VdrKMFf5HKMl/4J89/tu1bM9+DinFqH4K+TjHzkCmqoiO3SKvgkDG0h0/8oqY1glN
         +/52yIxZLZX7BVp1kK/4JSBuSkg7vqJPHDorbpVlfh9g4c0Dcc+UZZ2brQ7ANhGVpUJ6
         6pDO3gysR2NLcek68sYVacHV90JliZmSWn0bX/8IoLmpw5YlQp47ZngGJ3O4rHIj8Axz
         QlaDLMbB6qbaWm73FrZbOARPA+x8Rg4y5Xb5dJ59XGhuXyzImRZq3Lyc6f/bWa2Moiz7
         N2tw==
X-Forwarded-Encrypted: i=1; AKwUvBwcM3Te95Gkco9IIZd37Lnpa5sqKHYCtbdYL9mayMJ3XwOl5pXn4QS86gnd5+9hosykpmLsCIMuhlIGJ78=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaNmQD7MZiBEDsY4Ax5DmyjfoXOl83hG65JRh+nmLqFoz4f+5r
	VvcrqMlWwtZqI7TgGimZPNpg6kHKbDdJar6zJKGXchCsydArNk/2VP4CZiIEjcIWWIX28wwOjlS
	IX04igZGQ9zOFK+HLt3CtyhOLYWsrOQ8c4x/1j1iqrMRjTPbWK4rDVQzSrKYWyzSPKPw=
X-Gm-Gg: AYBFou3AT0heQbXCnwXvlPMKoGaR8fH86Px74i5GO/c+UJFK02/L8sLRLuL/FEk8F58
	R/qHiwoyLvcIznkrflFKL47U3Qu6ACdJAGXKpD6p0NKuMP7Qg7FSUSoyTEWadp4jISob4Y+pXBW
	pH/d6lALKlurUv4l3/XRNa2RLe925i4IwG1g89cS9n4a8B6cy6WnPCOYUPkMQAB0YgMGkOCTQJm
	ltGq4iz7HFfaZP8bp6OUPOn6i636ICmsFINMGBRskrUi/kZeiG+sq11Ylox8tKTGt72Y/Jt0RQr
	jucRURt0fBQeZAhYqvUSXR6qfRIRmNFmzIjjBTpy/unZcH0hPZwhKFNpC+JJC2L4zbMUpx4c+3E
	0fRuggqXr/agiZIFHOeXVkYEX
X-Received: by 2002:a05:620a:440d:b0:93e:fa30:f1dd with SMTP id af79cd13be357-940ef999e05mr1366065185a.70.1793093899803;
        Tue, 27 Oct 2026 02:38:19 -0700 (PDT)
X-Received: by 2002:a05:620a:440d:b0:93e:fa30:f1dd with SMTP id af79cd13be357-940ef999e05mr1366063485a.70.1793093899376;
        Tue, 27 Oct 2026 02:38:19 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm264678145e9.11.2026.10.27.02.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:38:18 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: atanas.filipov@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] media: qcom: camss: share VFE clock sources by the highest rate
Date: Tue, 27 Oct 2026 11:38:15 +0200
Message-Id: <20261027091922.3290180-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bdd89ef0-9cb5-4926-a8ec-92d8a4d78738@linaro.org>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com> <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com> <CAFEp6-29k2AoJq1+Rv8a3GE8Da1sZ4E9-RUd4ez-EwOajx0RTA@mail.gmail.com> <bdd89ef0-9cb5-4926-a8ec-92d8a4d78738@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX0H1eMJ3HvzNf
 2LcMDPhUXLrRnJeNNGpW/M+iBuV302x2Y66obM0pv+0/Uf4KoD8Hao8mVBnUWLFBa08FHi6hr2Q
 v0kyJWUbh37c+Ypc42/Gy1i0WgLCBdU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfXw6R+cokeCF+Z
 Ix8pzUCruDMlg+4IPyQ8Z9gbIfVyMsrzzX7u/voBKjZS8/lD3DQfcrN+f3lTAvA3zl8cKNy2Wwl
 JAZjaiXVxmc+ZdGwcwylH+ymAg48dOsUiOT3LQ7rEiBIRGbWYobVzuMfxSgGsSMJs7NWt/6s/lM
 xflaYBoDaBXBvYby72xpQk/Q+GGXC+CC5IH5vqyVgCl6Y/T16+yfu87ovkwNnwLro9evw36kDkg
 fBaSbDg3j3URT2G26bdCVfHM5gJTexRhrvZ4nW49kSSWOBcr78yFAhsDqSZ7djcTUSZ26AU2W64
 T4R9xZDo6ke3fBToSqdXnDNHFnD4ImlWvuEM7whr1mRNOx63SeX9AyGVwPfZH+FBQCTi+fcz9RG
 qU2nvVraw23WrtJZtbJP0OR6rA8J3juGFqzEtZYaiNXyBwXiQZ8WVu363xbyzN46CId2pCeb2te
 YMMT5DzGWbtis5wvnzQ==
X-Proofpoint-ORIG-GUID: _sT8TIG49WYuKQjvQazcfskJUPZlKjBE
X-Proofpoint-GUID: _sT8TIG49WYuKQjvQazcfskJUPZlKjBE
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0710c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=G79TLdkEATUW0zZw2xIA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270038

On 26/10/2026 14:38, Bryan O'Donoghue wrote:
> On 26/10/2026 14:35, Loic Poulain wrote:
>> Why? I think it would make sense to use it unconditionally.
>
> Yeah, my intention suggesting this wasn't to have it booled off into sm8250.
>
> Also would be grateful if you'd add Suggested-by:

I limited it to SM8250 only because that is the SoC I tested on. Will
do in v4: the rate ranges are used on all SoCs, the vfe_clock_ranges
flag is dropped, and Suggested-by: Bryan O'Donoghue is added.

Regards,
Atanas
