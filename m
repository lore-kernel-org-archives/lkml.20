Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699808;
	b=BvE5xRq1MfzBnHRxbjg+g18+qBgqNPv9r3gJMvfO2Iu6keBi6h1F3BCAlBgmF+AqscNu
	 3Eo9rNF2jIjo9If+oEuFlnERajyWwbRzvyUGj6/kKsW0EvrpAPqEpceO8tYRZFzzjznOA
	 uhW4lP58vgE7EfGqAVX723fibk7koNWvHF9xUtZRVLJK5yzv9XLLljS65EEFUefIFKX/c
	 B/7e5Mc/aBK6hkUR00UsMuZ9lqGuVslJAg4h630ZV7sKNf2TnkOKzk6GZLbHqeTibJPnN
	 e4df3i8DxDc6Br/dYoBiBL1QLxQvBWDQDsU/vz8jwo7avaeIp3pJTH+hALQGcKcybFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/ifhjCVZVvtRk/0jKZlaJa9Z7ofZnoDnw22mCyuV304=;
	b=TPN7bTUOJD4z8bN9mUb4HhmowhzgdkGY2y8hQOoPkSiphy0Rl1VxwN/FQnEpiZjyKbcX
	 H6YU6yyUSvgjrajC03ineXLC7Ms85oCQ2Dwghc4xIjeVewYe7J9Em+1dmd2Jxx1lpJxhT
	 kfVQI7ZFgEzVofwWGzSueAKVPuGzbzkdIqaLcH0ko88mUw7qa66sdeQ1ZUaU6/X1Kzfuw
	 r1a5K6C3PmEwcSxsxiBYlL5/pKD7slXmSPWx3lh5O0KwA9KCi+5m7aBt5qmJ3YofsXBSA
	 4ikIe14DYk9dYd9ME4JF7HjdQ1Og/fhwrG2ZIvSPdhizQLYF1OoYAoCU6AeNmrLsDBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Us0N9EgN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZqIa33oa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8A560A2628
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8A560A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Us0N9EgN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZqIa33oa
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38Almq1431391
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ifhjCVZVvtRk/0jKZlaJa9Z
	7ofZnoDnw22mCyuV304=; b=Us0N9EgNjX0M802Yq0RrxyEGHcgnAt80KJ20E36S
	UYK8qNIGMo19dWqP2BJ+tHiw5NZs1BqsB1Xad/Yjafu2HDDwF7Vpiv7c0gXFkxhx
	chrraE6/UEF5BaDORw3CycD3Tqkw7B1z5tb4sC19GzR5yVkwmD6bcSmLglGMeRhT
	uC0NEtv7PwUjvEqt3GuXW93F04LliAPSbutq2bWp+Gfpabd+MPJMedxw8WRhDZGZ
	3daaKDrR2EnVimDa6QFyPhpk4DTb2Q+8vAOHcuTWJoWtAPnsShkYFCIjKZ737zys
	K7ShMRFz6aXq2Krwqke4o5FkW7XVnbxhh21kFBVrIuK7JQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq08734em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:56:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944138ed63fso626071285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699806; x=1794304606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ifhjCVZVvtRk/0jKZlaJa9Z7ofZnoDnw22mCyuV304=;
        b=ZqIa33oaU0rM4zp3wrrLmympfOxZslaifpH+eKtANr5s4zrhZrLLM5rabfQ9JcfQgO
         +x21vkuZIwVW8CVZeJXGnz2/L1p3JfdLDrM7+coOa7nkhvy/JojXjROaXTGDtheNnjoL
         CIJpXniOuO2y6NF5YflXKSURaGbuGyoyrH2q+Wg8UBbGV8TDX5cGCgxwWxS2z+GrceT6
         Zr1Jr7+JMw9rbekZUqQBKJnpgWsVr8cFClRn7ZUPsrL4CUWQ1dfnNvbb5mEVTAAX5Hho
         sUaIZadxYBk2hoXLUMCb6y272qS9hHEytWpzMC2H/HiPh+Q+bPNzN7xsmX+uvkqycWqK
         uyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699806; x=1794304606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ifhjCVZVvtRk/0jKZlaJa9Z7ofZnoDnw22mCyuV304=;
        b=fnqusA1tyPTjPCW2ajyrXAAVYW4IirxqYyoEGxrjrPqMKB3LwGeTMoFRao8brLKB72
         sywFb63P3OpMDuaYL+kts322ctW8AI3SOIEeCaDFrFjJJ92nhWN6di5xPWFOMXcQaVfg
         s5CaucgLDd4lb/CUdtKZ9o1VJ/O7BX3tDh0KYp21N49pJV3Bk7S50m1jHXXaldwxOt22
         0v+LQqXHkeeM1GNHgy+L3A3QpXvIXV+vw/JWr5Yh4uB9F+NcPqcWEZaI/OTlC61RDgKj
         XjeewqQMW2zTdmQ5evHH+cbdGw90LR8nCFnksp2C3PuguCehRciORDzDu8Y99ENjXajN
         1sTw==
X-Forwarded-Encrypted: i=1; AKwUvByUUBLY7VUgTj4E9IzAugYjkbJtsqmUJgryK8QJk2XaO/+w7L+MJJBOQqrLy1UZmgZoPxXwDgeusJ5TMSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KqR+EZtFqsYghaJzBKZO8eCufLVqxgt8zRP0gRldJCB5XfxBL
	2KimU+asiDE5naV1MR74F3dB6Y8ZvwM9H67MkbSaWCKaXb0pwcQ7kE7TcHWb3OgLIKBg6s/i7bD
	gCWMj4p/e2Q7Libq6hY5P04J94rzTq45OcR+J8hlx78ME7ASNDjVjPcWcPLaH0lpkta0=
X-Gm-Gg: AYBFou0zPyeERqi8DCxhLQ4DFBC7Y8/JGOpcXqKVjHPZZf+NEfO0z0CMIc9lyT8dfQ/
	SzzvyptbIrURq31xUaXSDtRox0uHYKtAD/MMitn7c99ffFbX6zwI5b9qvS7R9+J0YNmfae+OWUd
	5VWyZjRd/zzlZgUN69LAjW25L8KWA++63MGrJyJ6qT5sL/VgREGX8bVZ5RUF9pIgJaDcsCO7S8d
	f4gPrBO0NHu32kMGex6NUnRAWddzrTU7eF9PeygQ32dJG/WJAmgYzDQZCkXS2osQqJ5vbhYVl5a
	o2lVbhNsCNTIUpSncLc7nIBk/8mI0uQdWiYROdMb66PEK6YyU+F2dzoB/w5J8lwJ/8iIEfBc6ZS
	4FqeBAfAyCgUwKcoJTO7VOPsYslt72woLjvKokl4BnbeL5yfehrBGMI7/cRWdBgU=
X-Received: by 2002:a05:620a:29c1:b0:93c:6028:6d2b with SMTP id af79cd13be357-9442175b5b4mr2182516485a.43.1793699805729;
        Tue, 03 Nov 2026 01:56:45 -0800 (PST)
X-Received: by 2002:a05:620a:29c1:b0:93c:6028:6d2b with SMTP id af79cd13be357-9442175b5b4mr2182513685a.43.1793699805095;
        Tue, 03 Nov 2026 01:56:45 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77c132sm230865925e9.1.2026.11.03.01.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:56:44 -0800 (PST)
Date: Tue, 3 Nov 2026 11:56:43 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] phy: qcom: qmp-combo: Separate PCS misc clamp mapping
Message-ID: <sfnbemeazka5o2muhztakkfmh6q3uz5adfmha4vesdnqjf2uto@67n7ay2eymex>
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
 <20261102-topic-qmp_aon_clamp-v1-1-141c2cb6cdf6@oss.qualcomm.com>
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
In-Reply-To: <20261102-topic-qmp_aon_clamp-v1-1-141c2cb6cdf6@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXy+u4PLWFI1g1
 3+5Eg99tcK5z2QOlbm7zxRNiZdtgkFovkLKDmyGTzF+6v+JQ1hpvArxmJhn/3pr+bsKJl7utvM4
 ZY7a51XxjdU2lZxngbymFbvsExpGWWU=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9afde cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cGOgi5_NMkWPeH9ql9QA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX+1TQo1+aDmfv
 Z2+U6VET36Hwcg8QLXmr/pSqah+OANq7QFuUDw+3fcE5z6kTu9gIx8Nm+yf7pocoywek0U8lFwZ
 PWfHiAKtGlEhAdfh1ctIKUKS898/aaVSV+NeIGxjYtx8lRh8yMTEh8m1cG0Tc0xjF1RBlqDwpKe
 hCjXKo6oMfUkMJpN1BOpYEgDCMGHlvZ4nb4A0GqPGBcyGvtHL2Ek2RZV3JcOuDN4qVMlle7hvtH
 BteZXjBEKllj7U6ieQ+uLq2PatHVvfrKCG7xb/sF/2W89mIEsdyM6wrexxOAHN17V7nkcyW6/cK
 YIEokoiGR684UVA1cg9i+MWrrDjZXiR7WPx0R+wm1BJguXSFKIIh47RCiLTu1AKYl7UueK1sgnf
 cGnhF6LHd04RQzW7Y5/y21ivrDqMLgaTgAcFAFe6kv+RhMcoZ01/1s03ENqQK8DqsQxfV2Rkdrf
 rq5fqkbEXrR8xp9YgIQ==
X-Proofpoint-ORIG-GUID: mO-G8ZrTLHyN1VuM_10UXnFFgggXc-91
X-Proofpoint-GUID: mO-G8ZrTLHyN1VuM_10UXnFFgggXc-91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030039

On 26-11-02 14:59:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> PCS clamp offsets can belong to different register windows. Using
> QPHY_PCS_CLAMP_ENABLE for both the AON and PCS misc windows conflates
> those layouts when a PHY has both controls.
> 
> Add QPHY_PCS_MISC_CLAMP_ENABLE for misc-backed platforms and use it for
> misc-window clamp accesses. Keep QPHY_PCS_CLAMP_ENABLE for PCS/AON
> clamps.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
