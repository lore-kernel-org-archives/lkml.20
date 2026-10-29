Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261288;
	b=z088wXZyW9Yb9Q73IldGdESW/Ef/7eb3KgGgyZDpK2G+wSqYD/kuGUp9Bn2hpcOl7WCt
	 tWhqGkf0pwdLgdrKebYOasll8tXS7IvbSW83dAW8mcuRtshe9lBzC2qfSdCXuzxDA5cCY
	 zAD4z3q9YaIUOr/B3K1V0nB/Ep3KMgmL22VTff/ny2YUB3mWIAwVVo8dkYkmLQaYpRM9+
	 yA4sOXBawy1/vBRngK5VAdwoPYM5MfWs6GWgaRuMYEZd9bXbKl3qzfxGCeWC4QzRe3Lc/
	 /pYvGY3HLkab4AqHKD/PjPKXbbElxuV+7g4MJhI0V59oVn798dBrYRHR7Vrlh6U5M/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2dGnBacEascwLV7PlpDA1yoO3iuD70WS8ruoY1ymrZk=;
	b=ypvwng/v5w0tOwksnOAPKpSjWZoSqTycZgwJ5ODiL2K5+OWMZTvCBm1C8RDQsPLRF6ZS
	 tOMJ8WO1EzIkWWkgchFXbGLWHk7PxEtHSUs6DAhLA2GMrtpf7XKcMgVff34/TId5Y02l0
	 hLM2EYs3N6KYEQIJkOePbqa/0uyWV6IO9/+9kymVYSFkLOfntKvwf0JQFzRCU5/MIRwpn
	 T0XbMSXMxsfOYiUlURA+4h7Q0gF6HcRX/RbXvM01DcpDlX2y4o0xXfAwd0UH/W3dupesX
	 R4IzEPzj/K7glF7tEegYgAvXcGurAbGy/nMClpycuhu+JFHSK1eN7WHb+eldi/HaLSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aGzoY2lz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SiuOJP1F;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AFE606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6AFE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aGzoY2lz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SiuOJP1F
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HXWT1793394
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dGnBacEascwLV7PlpDA1yoO3iuD70WS8ruoY1ymrZk=; b=aGzoY2lzhLKgvZDS
	wavnmCCaDeVdjFZRdROWQEq+yZyCqjXxo6IqpJHRcBg0fVDIejsA2VXy3BUUc1Ov
	WEuxBpMNsbfnyns34QVDvSFWcakINl2K18rPbPsFHqtOZF9m8xa2Nuf92IeeN08h
	LQld35e5J98OjSkUMblxn2NC2OTepzx17ODRt71p2IdBgj67buaWqbARLY1RUcZg
	LNc75is+7ooCV/pTuo/6YNkY245hxPXq14FiAspIkPMNUIPLE6kKn/shHqbx1O4k
	nFRDvZiDFkk01RinKZ8meXFI+NH2vNMESwzCQPBGn4yIHS5OD5GaOiPKxYtNhO6n
	1l2zDg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnm0n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:08:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea71803effso19649525ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261286; x=1793866086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dGnBacEascwLV7PlpDA1yoO3iuD70WS8ruoY1ymrZk=;
        b=SiuOJP1F8c194OafCX524DizHsokakQu1GnG3B8AwOnjYGyjGKzjinJDcyUWG7Ex0O
         laDevBnRgA88Yr86hjgB4LKhTeOloQ3NyfoPHcHp4Sk1zWteG16M9udLhKAlBOdzp51h
         5uYoJ7g8z25RynJe7DHgFYfWj+Fiogoxxe97OeQHpTaeQGGvmop5yv4X7J3Z2dzmTgwv
         9lPHzJiiY7EyHEmde1plV6bViKAAXJcSKfMKvOo2NJTuCotmTMSJmKrGvsdNq+Z0HO52
         kzQ7TyvxOL1txHzMynd6EsYmZBAvLhSrQIctBmPZjsfOJewGLZm1uO21rgmTMealKvbq
         WsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261286; x=1793866086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dGnBacEascwLV7PlpDA1yoO3iuD70WS8ruoY1ymrZk=;
        b=UiAeDa1uvO1D+UjFjRf3LrqQwpNV20sxs2zJI2nzNPNrq+eHhh4MOTH5QqHhkIhmnR
         4U6fuqmv0UnZG3ue7HCe0Ho0OkR53pTzZm8EsawlWDot8EqyOybeEbzLfFu3y3ShQYBS
         5kStZ5iNNhmJUY4WQf0rKgRTKYi6ffl9/c21qnAuCZ5y/jw0xpce44A9s4XzmvnIXVfE
         48/w1spSNvcJhuApf6g3P3a4DCJl8guWGwWhRcf5kx/EoShtJfgua/lZAXVou6TuFJWQ
         1WwR5nIwMzuvbd3iAjLDsGw3RB6rOKtNTs4OzoxoTcCBjvYj2ftRGZdq8f/MYgLSAElq
         brTA==
X-Forwarded-Encrypted: i=1; AKwUvBwoM0HIUk6ipWL53SdlZoGTh0lnlfldJT0Gg8/2DDou2AT7Gz3xjILkNKvsYO46A+aQACe5BW/Gj58j3P0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMq01TQP2IG8GkO/BZKzCPx0+bIigMbP7cCLRpSClif+zOdKlF
	QwZYsPSLoilXOkY3Qhzz6GKTBASDALyidjwXVcvrxGiMKAyIx+X+bO3o5o9Xz2XU2Ll46ek09kH
	7wYuGR5+vZctd/FY/Jc/YQwKZHmgBQd7y5ZmKTpMt+/vQv2g+KD/rmIi46W9tPGnhprk=
X-Gm-Gg: AYBFou3tSfWYwtYSXXBy5Cy89EU1iAc3xPy/dCtmhCMx/VdxlPxwmeAOUCY0G8djk3v
	Lv302V8Z7CXWy85yeNZouaKwhAWJgNIi+/R+EXWF4j8WSWJZxcEHamhvvA56r6InJXWY2t7ko7o
	6HGwEuENF9+CJ7CkDHsIYR0gtZ2Vt9wYc0V0hBBJbAASEBkrJiC9UX2NofFk7uHOyXRtGE3U1k4
	3OsWOUKaSVGlVAimWqnEbYp1jzcPreRcfGaVoaEbRNcrZfNQ+GC4eiRRCfJUZGX4bEIzgfsWleU
	yH6cim5IAKG2XVucVZ+zf9joth8BjBuoQylhv9Ucqq/SGRhEVvxcuwWlQCnnu2BT4ydhSIH4XfV
	fqdiSNyKrcZngOZmboAXe1ZBsjfsGb8wfIepHCDDGIniqkLC/slpzbiyQaRMhvzHySjtaHiDJfl
	AVu/qan5JtkpIMkRLW8STfsdErQmiAoGS6SOOI22pe0FI6
X-Received: by 2002:a17:902:d485:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2eb003dcd00mr40685285ad.16.1793261286234;
        Thu, 29 Oct 2026 01:08:06 -0700 (PDT)
X-Received: by 2002:a17:902:d485:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2eb003dcd00mr40684995ad.16.1793261285721;
        Thu, 29 Oct 2026 01:08:05 -0700 (PDT)
Received: from [10.133.33.227] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37539sm30068785ad.49.2026.10.29.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:08:04 -0700 (PDT)
Message-ID: <b8f90e57-4aca-41ed-91e6-27fc072d98e9@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:07:59 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: qrtr: implement shutdown()
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sashiko@kernel.org,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        horms@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        tao.zhang1@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        jeff.johnson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
References: <20261016-qrtr-add-shutdown-v1-3-e1cc01ca5919@oss.qualcomm.com>
 <179248895481.3135.9231497728918795508@kernel.org>
 <20261021133531.55da7de5@kernel.org>
 <9f76467c-5b21-40a2-95b8-e91cf1e1b47c@oss.qualcomm.com>
 <at9XxF32WiKBEJQY@debian>
Content-Language: en-US
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
In-Reply-To: <at9XxF32WiKBEJQY@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JQq5Mhz_Y5AVzAEtJhtA9pDR1elixn4O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX6UaG/QMJuW/D
 uN6ouctiewelFMT8DNGXZ6EyfL4tJJJHVY9JvXyn03sAesUOUrD+j4YfKKM67OrcN8aqMUjfXoc
 Pl0+SitGygeReLvhjsLU4iDVQtQOM1hOwbCFYEcw+HNHnem2Moew9XZnqgewMfCRyklVTj+ogfs
 loF6RKYlJncdUGZPygvDCCa2l1ElGkw8LIWlWHFB/PYuCMzrx8FA0by0a4LrZLDOthDLAtDCjrU
 O/Jq0rpp6keHWmBKZ1DU/I5XHAHZrqjfXMEVGwG5zhax/GIEfo0iWV2oIs1wdqa2/KR+R+QCTpE
 4H6oJ8nshlMC3Vi7kfkih6hYVjaQ9p1WQ/9nEQ6NinyoyjRAsxxAdWfEohCDQKJsNfnkKLipQsb
 09Gch0pyzL2W+njpE27N/Mtiz5H8K+T5DEV0yxYrFLdcmdRbTGI4Z3+YoldmQ/3di0L9f45c7CR
 QRhDF1ZGcd0ioJ8ybvQ==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae2fee6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=OT3QJeMhKsL16cy7qL0A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: JQq5Mhz_Y5AVzAEtJhtA9pDR1elixn4O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX7LetOQ30P16f
 lEMuTslYry4Ypmgt+Op6HoRJlXxf9vzGZVMAv5d4i+H4zczE+Xyn4OH85YVqCY3uJHzHgG5VxyQ
 FnYSqwRSWMmq7BvGXY0T0tAKTuqYrfU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290031

Thanks for pointing this out, you're right. That is actually what I had planned for the follow-up series. Since it is outside the scope of this one, I described it as "no way", which overstated it a bit. Thanks Chunkai Deng

On 10/26/2026 9:53 PM, Manivannan Sadhasivam wrote:

> On Mon, Oct 26, 2026 at 06:23:18PM +0800, Chunkai Deng wrote:
>> Yeah, this is a known limitation and the commit message calls it out.
>>
>> The sender sleeps on flow->resume_tx, which hangs off the node and is
>> keyed by destination node/port, so the socket has no way to reach it.
> It is fine to defer this fix as a follow-up patch, but I'm not buying the 'no
> way to reach flow control' from shutdown() callback claim. Why can't you just
> store the 'qtrt_tx_flow' pointer in qrtr_sock and dereference it in shutdown()
> callback to wake up qrtr_tx_wait()?
>
> Storing the pointer here is fine since all callers of qrtr_tx_wait() hold
> lock_sock().
>
> - Mani
>
