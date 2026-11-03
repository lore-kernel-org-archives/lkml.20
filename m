Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697180;
	b=f8Ilsi92oZrB4EUG3/viDZQH5077fDoUQULZcZMPuRmNf2gXxMRr/NwUz/gjDtyQapRJ
	 O231rmneLpapd9PqWNg6m//uziXR1M1+5gc8pRH03ZwG5JyUsl3a6IXcyrEq7FxiOSDqV
	 oXK9ZU/7Ha7AuSJv31nNmpL6c9eaQLtGfmmf5mHAS8KRFZXIU7i5AH9VtVlVCg9J/jN/M
	 +YaO7FSpj3urTudXVSzdAdiIJNi23LoynSR5sM9HupcgQZlJP8eeqTvNlh5LJ+VDrzUZ8
	 m1+lk7ke/PQ/G/WDhFX3wDxptc1DhwJMLNTEEbfJkcGZx48U/AIW6cap832qrpD28yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9oFOp0yBXC4uh77wsDuOcoqxLQK5iMsPJrZNKlEEsr8=;
	b=DmF7dpSfIL0c5fMYS4wWHhpXbFxisnzle7fZxkKEvGRtKhLu7e4bw4yhbMRcmsGuLD91
	 EtKhIn2nm2VRr5quLfHNxNqok4OpGVtHuJJR5/pIe353nVH22pNJnoLGMSsys3qjKe+gB
	 ZVzqSupaQ63u5Z9OqR0FxV7M2aJJrZ1G+ZPyKg9al1+pfVK/vsRG9vtpmSt6FelJjbVKf
	 waH116bWIPXA6IIt7jiQFr4xCNYo9Nee79dMI+gbz4IcQ1tPdMT507CfMi+ycFilWeKXo
	 M1rN4Pqd3zPMg+5PzwNOZHP3/v4fFXU/R2IVsr2Fw1pCKoX5V5F1DXuoL2m+dx9b1gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCz8XUD4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DvQV5wjF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49157606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49157606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCz8XUD4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DvQV5wjF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38ZnvE2106785
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9oFOp0yBXC4uh77wsDuOcoqx
	LQK5iMsPJrZNKlEEsr8=; b=DCz8XUD40mdjSL1obAHtWV6sDJkw2cAjiH7qMdOc
	fE+CHwwc7C0fM3V5/YrN22mx0LNY+OUbJdY0LK0yEtWlzoP6x8Cmgwks37HlDiPu
	HGWt3m2pYVn9I2Blx2CNv6BXe33USiTDhZl3JGmgXWpWYLoV/rzBB8yi/xnvevZy
	8AzcAq2ffmTT+hVqt3ChhJ5MFOi/G/JI0XaUNddvoaABzW6DgFYE6yvkoCDkdRCs
	kQKQIvCmAQAstP/TsGD2BzCvT1hhukKFxBAmp4vPjQtmtReTO1LV9BcDQsT8nfHS
	LLxqWAVUZ307ioCe6ozrg7Jys/I+tkLMTYJH2ugdN5TN/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m99ext-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:12:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so792997885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793697177; x=1794301977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9oFOp0yBXC4uh77wsDuOcoqxLQK5iMsPJrZNKlEEsr8=;
        b=DvQV5wjFkxsiJYCaMY+3zuPhBENytrYzRGk3Vr3W5CDd4dHdMvG8DOHExxszfwyRKq
         /knJblByc3o9wZrRhuaLAxsAlCrlH0opVLfYK+KvBjQyHegKD8lfIoDywBlZ/rUUPvFE
         msrMgM/M+Fx8uyRZ6ZSsBLGHIYgY9L51wMDqI9uVfkISAOBdk9RDyI0MnBM6RV8CZGsJ
         dnMlJL+yE7IQ8drksJehcQV6EsbO2sBz3pZd23MyWBeNoP2MCn/sGeMZAifPkoO6WyiW
         0HCo23DvnjK6tGQn+OiZnca9TTeF4t+b2yI/t6J1q5Nyj9eJPZdlMRO3hPxyKj3DPNj7
         BHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697177; x=1794301977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oFOp0yBXC4uh77wsDuOcoqxLQK5iMsPJrZNKlEEsr8=;
        b=jetFgmrdeDpwK6ChhPqw+A/pGNy8JAWK3Zhglag8eFxSooN8Jv9ZCXoFgdm0ZRIxJl
         I7Zk7boXTtN+4+3AS8TwR032evzzHr7tHCDAk1Qskx27Wkf9qxktiDmBGKCXBcI7Hw30
         d22fU+U/8djwD55t0u7bA3XUDV5R54v4OoBQ43acgno1NPRpQjtRfqWqZ0CkJWe3JK1m
         bHVdyExQn0o/HpXOYW2cSChInFgxJZ08W9yVnzNsYIeqgUd1mYMjxpg+geXpIN0sSu76
         LY4lvsTTm+zGSRXLXPZXSCK8aeGADJq5nkOKErbR+O0XLnf8+v7Tua4AbDSiFZBxZ6gO
         ePtQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4tpVUIrREGoQ+PJ6yy9QBJ/5D1HEDUVLLTIQUwhyh6zpe70ZrlMW2sHVRKnJhJYSO8zK2QuDwo8DCrfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DyTchKSI6DZR/s9oTXEtctYPcZm8onr4qBhF8W1y2oTw5HQCQ
	4TKn95I2mMWbktWJK22oELHOWr/PXql9cnFVrqIIPcMBgzqV6Yuw29Jlksqt2UfXHp0W6QCmE7O
	G8q5ZvukPooQMFP/DUOhM2GXcDVMpPcHFdppuLFxEQIoQhcictK9g2ZKWWNA8ZBaHaiY=
X-Gm-Gg: AYBFou3FxLUzc2vK2QiAbFQSHnIkSlyIkqmtbUykd9Z56o1L48bfgSqXg8btF/LHc/d
	NQRONIxNz3wlgXqxw8WpkScftke6BiuZtJO9kdJc/pzO0Xi8R/vVRAko6M34UG2JTs7EgbP5z8n
	aGvnxD37F0k+z+XQhdrNqcCYdOmjZAz/XAgfTaV8TJZlqOrtjLY6rpwnDLLou8lntJLFb53fY3E
	ic7gvk23Xxcd6jFQs/NCqdiijiVNQza/9oV0D1wcWUtzgeyKBumuawiSF9uNIHmEb2uEstYiOJy
	FOUArNdwOpIyDOlRI+yOJMYhc1T/T4+OEwA6bp8GbuDHb+0Vbtw3QiCuldWI1DLul7GZkzkvceF
	tqN6cCz8c3QutXv+7Xul4hJdDqYDQYV7QPlfZa27Rk1IUD5w7TynwIoK2vLK4na8=
X-Received: by 2002:a05:620a:838b:b0:93b:d7a0:d9e5 with SMTP id af79cd13be357-944217c8512mr1958704185a.63.1793697177370;
        Tue, 03 Nov 2026 01:12:57 -0800 (PST)
X-Received: by 2002:a05:620a:838b:b0:93b:d7a0:d9e5 with SMTP id af79cd13be357-944217c8512mr1958702485a.63.1793697176814;
        Tue, 03 Nov 2026 01:12:56 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm215839755e9.0.2026.11.03.01.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:12:56 -0800 (PST)
Date: Tue, 3 Nov 2026 11:12:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, Raj Aryan <raryan@qti.qualcomm.com>
Subject: Re: [PATCH v2 1/2] soc: qcom: pmic_glink: Add RTC client support
Message-ID: <ko2v7vgyzqx2lj44syzky6fnyubhlhaimbeyvko2exujtpriv7@gv2m5xtjxlgh>
References: <20261103-rtc-glink-cleanup-v2-0-895eb6e8d890@qti.qualcomm.com>
 <20261103-rtc-glink-cleanup-v2-1-895eb6e8d890@qti.qualcomm.com>
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
In-Reply-To: <20261103-rtc-glink-cleanup-v2-1-895eb6e8d890@qti.qualcomm.com>
X-Proofpoint-GUID: K62JuE3EixxxYTkgiNDT5BYmasPqMJN8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNiBTYWx0ZWRfXyxXHkE5jcfOU
 vnyzmi39p7nCfEy9Jzl2gWrbLh/FV1MRWOaJq6HoqaVTEbZV+Sg3RtYKGv6uhB6AqiQSZCIInta
 gN/CG/xpfYZ5onuAo8zIkQHtkER+9Yc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNiBTYWx0ZWRfXyC0PfY2SaEUJ
 I59Qn2sidp/Q7hqjelJYhVYFLOPfmNPWIvFFzgiuj+Zuu163hUBgjl8aFrwq2er2qZzQUHehbAX
 XZZTraAXQsQq7SPDWJ/5WxvqQUx++QqnQYsQGkkfS+5nQybxqJaO5yftk2Wz5Z0e+PPNVrCarxw
 KaoKnpJfNbqKrMklyXGGt6aGtFGr8RTCl73ccU1gEDIw+PzYBK97D65c6A1hTvRhHBlU2sdq2WN
 vX+R+EvJ/RflBkI1gr0jxk1X53CEcvIRZQxH/zWU5uKQBdoeF21xac9nQq2mc8t4FvvU3lc2ONr
 L4JO4VqFIeuMtmstw9Hn4JlU2BNYxfoDrgnPJck1XGBF1WbmGHwmbMeVikuQxipjrNUBA1hS28/
 3Y7Xc12bMApLM4VVRAqY7DyvhP7Y+nn16imcjvhKdnq4ZHm5n9eLVJVxoS4MLkQOHlYn+ypKIQP
 qJf7gO+IDsuMrJ4JH9w==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9a59a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fuBDp3P7rzG2D-Ll8goA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: K62JuE3EixxxYTkgiNDT5BYmasPqMJN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030036

On 26-11-03 04:12:17, Kamal Wadhwa wrote:
> On some Qualcomm targets like Hamoa and Glymur, PMIC RTC is only reachable over
> the GLINK interface, so add a new RTC auxiliary device ("rtc-glink") to let the
> new RTC glink driver bind against it, mirroring the existing
> altmode/UCSI/power-supply clients.
> 
> Also add pmic_glink_client_unregister() so the RTC aux client can detach from the
> clients list before unregistering the RTC in order to avoid use-after-free issue
> in a scenario when an alarm IRQ is received during teardown.
> 
> Enable the RTC client on Glymur and Hamoa/X1E80100 variants, as only those
> currently support this RTC client from the firmware side.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Raj Aryan <raryan@qti.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
