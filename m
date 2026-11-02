Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620711;
	b=LOdBlOxJssz6lqKEIW6vcWo5IajWgZLRPwQF9QM4NIV85iaoDfD9EWgUlKTjoTHUDprF
	 eSUvYWdvoSc7g8r3Vp8I7oAp5zUJlg86aImZe3QD8UY0I/NERX/Vu1jTquZBrH7kya79h
	 jZErlRyr24dy6RycYvEZNFYFcnxXcuxQOfjpOerawDmz8XPrcCp2SWI2kOe7wjSNQ/I+n
	 ZfKnp1fWaOIfU7szz+LZRSoSeYcNenrQDwXubod5hOyFpI6EGA7N5G3u2LeokFGtK2kVR
	 yp8f5duWLflphV61rOqJNWbvYp+7ARXcwQzvbgKi/lrv5PGnWRR2WvYU1keqjUU5a0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HYqwDlxIzrVgKHvVxNjVgcktbuyT/DDsBjlgMBa52zI=;
	b=e57tcDf4vN+RtsNdtN8v0kWgomwfH02AgkFllImj00DdKafI5RHpydxfRPf6AS//kRM5
	 quUw1w6tT/xVJAyejBkpH+pLH3wOdSHyA69iHT4viGPmDpfzA8plfMChUjvCFqSYaX9Ud
	 3Q4PbzOkD32bF9a3udwTMPOa0/R4P2fZU0avsPFPmEEstXJLFxdW42qVFxZ4s8xSmIou0
	 oqeSjAqCpuZUw04fz9Ea322GZC6v3SWZ9qJXonFG7d8tc1h/L6ll26L10fRd6b/bsJ6oy
	 lPfdLUxBqW3kTI7jgRNu3fpDrAnfZAA/MSaDMV6NIEk3dW6Rlyv+hhXx8X22cqMF/zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C0M4XKP3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MJRGPqST;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71615606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71615606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C0M4XKP3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MJRGPqST
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AJc12880820
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYqwDlxIzrVgKHvVxNjVgcktbuyT/DDsBjlgMBa52zI=; b=C0M4XKP3WMXlU/3W
	I6Pj1JJOyuu6q8lbDD5FGGJsuqIZAn9QacRYoyujRdBogKQr5PyQq1El44cJhoKR
	ucaxCi8rYv+YXWlHpDzqUmcBpTTZhHgZlgmysX2Y0d8DK1JJiqws1V2GXBnqXibM
	4lAyjxIRZWsCyvf18riHvXJAe/HJe4lKMRDttvtnsZS8j+SYQQXwvs0YF3lWOKH4
	sR26Z47ZrAzBHAJ722VqhS9652ZXxw0SQn/Av1JpYKZaZSkgV+NV0XSEXzii8rC6
	rbeTDTHTJrrwpysUyn2jptg+rNkw3eNqGffeQ22D85iMbErKtFr6IPHaOlthnRQO
	rzgWCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgpaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:58:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943fffbc5dbso43615085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620708; x=1794225508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYqwDlxIzrVgKHvVxNjVgcktbuyT/DDsBjlgMBa52zI=;
        b=MJRGPqSToaooX5qXz56yx+/XhNzWc90LAy11B/ZIpkwzI4ea8sKpoPE0G0Dgu/EAAM
         QCMwjv5i7pm0RsKn+Mwvu37NsYJIiTpAmCOwq29I9YNNe3HciKcqivn02ECp1LrZR+1b
         nnM50ANpy1ke6JtREYtMEpQcv0cpAh24QCE1VqjKfsGGQnexWdgtaoynQUxS0Ilki76R
         vdn/lDu6w5TM6QoNF/vSI7CiQMu3w3h9np0KzJNlQ9qzOsO4XCmwxaCeYB9kIOvKBDaN
         9QI5EVHRrvXQ2dSw3IQUg+JIkPhYV/Y7lLeKSBdzZmf4tIaYdcYrrJNtVejZO/f1Mfho
         XCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620708; x=1794225508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYqwDlxIzrVgKHvVxNjVgcktbuyT/DDsBjlgMBa52zI=;
        b=Cjniriou610SLfEbZlndXv4ruWJZiRDBLOXCiwokLt++f6hP6wV0TEpUYxC5Eok8Ve
         VG9iFUs0pK0jb+GXPqaWb2CaU869T0jUzuUkZ9AP3K/yk2YZj2XkjVkWAEQW/ATH+IcG
         o/oOj9ah0ctTEPueE6GlHldz2Uowb81gZ+VVNY4i/6Uoa8gnzzSlhUjN0QczJxlEIn2e
         jQnKd9RhslLLap9+FUAyUL+OrNKvXWj4jswBzQGs2XC14aGxDEXZgiWfx5XbPzDkQY0b
         4/h10+ocSK1ZfqkMBQQw7/GaiTF+5SDyFaISBCBSOtVbqEtWRXASUbv1FY/Z3szd2Wja
         jLRA==
X-Gm-Message-State: AFq9FYJCytxS6UszyE5QS4xREJg/w3sQDHET5du8ZUfHL7pVESfM51fJ
	/Iad7S6ZRzAqCa3Yr0WfcNRv5nk0RI1zgz3uKovKbA+Adjtp2m/ljfBOgWoEg9xqycOzs2BzIZ5
	e0L5CbamLetxXxyxdQplQyZ5Y6MCiPFnyEf0q0l06Kfex2R+xfGOycRIXLmLX8Fo2pSk=
X-Gm-Gg: AYBFou2bbh1f/yHxOFCUA5IKzFOp0JvxBS0pmfp0uLbn+b+qJsOOu0pEXR2la2yDlPD
	qqfYfZZJxnHlLaY3qOkQ1eibR9jXaB68vLNCmEuYIGbTfvGtqJAThtfEJPgujeTIiRRNenm0ebN
	3z+NMtqI0AqbknXk7Ia4EV5fFN9gc8T0cGkeRDdbogCCsPLx2HNfTpO/WKQZaiXUXQF3d8WPrKY
	8MyphbIG2zELcKB7aQmehUvDDgcDfteikFrVWNuJ7uYhU++ztUetWJCRqom6MuhJtCR3VQBkKpJ
	zp2LZSB/VtIPq7EmWjUfaxDz61C1RDGD97yj4NWXJdg4nBO7jxDu+fECNiIPsAemgsrXYAFCfVz
	1aF/bh1ogKTzQKylt/0rqFrZwlnUeadR4e8wzcJEJ0sUdXLYc3v1nSB28xryNVDGcMr6oh70=
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1514682785a.5.1793620708492;
        Mon, 02 Nov 2026 03:58:28 -0800 (PST)
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1514678885a.5.1793620708014;
        Mon, 02 Nov 2026 03:58:28 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca211ddsm3086049a12.34.2026.11.02.03.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:58:27 -0800 (PST)
Message-ID: <4f1ec92b-0ef1-4139-856d-e9077cd7d4bb@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:58:24 +0100
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
Subject: Re: [PATCH v3 03/12] arm64: dts: qcom: sm6350-lena: Add
 qcom,rmtfs-mem node
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-3-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-3-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae87ae5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=RC7kgf61jvLRIQ5xqpwA:9
 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Soq9LBFxuPC4vsCAQt-j:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-GUID: j6r_11177DsRiPUBp7_GOZ07ixdWhcTq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX60aEMFHt8aO2
 U5bdRmI5YfyQhrLWX2pbB8RMnlVz/txCCDAw6CD4anQG6IsJMqVss8diXhp7MhA4lAieLp3/O7u
 Ey7B+lfJRsplnVqKbG2A0oBmNGm95m4=
X-Proofpoint-ORIG-GUID: j6r_11177DsRiPUBp7_GOZ07ixdWhcTq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX57WoRWUIEBVd
 svfvTm2DFfQRDvHc7yv2EAKLfgOQf3CBGucYZtQ3zoHeBbGlCyc+MJRQ+aSBkD8orXeTsWBBigq
 dVe53dlcVCtR5A+pFvePpmK9BtRWjoMzwpivq9EdqoWBDs6e4zGDy5ZVzIdQ1c9jltHj0XCCQyt
 qaLOfLIlFco3cr0MAFkbar44OCg0N/Zp4a56LJuwb44TfW3Qd9aqJUS8sWzF74f07WmXeXEwbWF
 F7PhrkjCkOHqEp7Fbi8XxtO6tMhTeDxjMkj81a0fPAzrXuMVdIk4pFuSYdarWKzTroEhBqaAVMj
 qB/N0dVaZ2cXpx8Gi/jV6KA4L655S17Bf2HMXgo4BRfzZlwjFGPArKtDZR7b4ufGqj6mgiMwPyR
 2AUfmds3VFkYsAFrBFO2GuTsc1+uhKuDwIdWYyrSFRZAK2TD7m7UtRZmICfqvqm1KGSex2cMMKQ
 pAIhLNKvWvqG6UZBQXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> Adds the qcom,rmtfs-mem node required for the modem
> 
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
