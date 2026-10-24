Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873455;
	b=TJyE1fgbMAXA/DS2siRbsqC5DHJNtHUMXwYNRMPEoh/1Rhk6BYnCYyNGbvjzafAJZ1HY
	 L0qfGU8TMOOv0EtWsSEfs4ZsEBRhw7RPtiBGttMNUofYJwzcXflPT10abSKbOV+5NKfjD
	 xJpJg/PDcUFE+eXVnCWSz3ZKmPzW3kYDA6PNAqNyuBwY42SXI8bMR7+XOq9Q1bFimmryL
	 CUKcWkarZlFUfv0yBDHBLy6heJh3ssuUy0VNpqpQofV54+wlhOT3wU01Ub1wWOPVNaL9O
	 oAiPmj6VkGV9FkPMGfruKRejE2xMY2zLwrTyURFUqbnZ4/gQSkAW83mJU5gA9qkbKkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OSWoeKkSl8LV8SI4xnbQdI97ATBMcNBTzfvGNoiDQeE=;
	b=P+AZAwPuJFhiqvCiw/g/MJ2wi0CeyKT6l8Covsx7k0r1T3tNvm6lQOCeZ3HGbm3DMfh/
	 fiK6GwiPAZpCt9sVF+sQYfa05AjrzEcR3uCv0rew5YsmK5MmZcigz4dd3Qw0dCIbN3ryu
	 wtzCkhPrPlqekCsSP59Huzb63qtQX8VatrOSYcRqMfvg+P///giAxWuihn5GMf+ieGZcJ
	 mYkwEVL/BcGmfh8BW59QTh4qnBHmFO6gRKx9W4ExFXYkwmyXVCfoiDAq+PTxftlBOGrDM
	 8cPmwB7qqVEOXEEOaAPu/0JDpvYNT5Hls/2gMeNHKGauvgKH3XPktiaoRHd2W72HeXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSFLzhfB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWmCLqyE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB75F606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB75F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSFLzhfB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWmCLqyE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OITsWx2330989
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OSWoeKkSl8LV8SI4xnbQdI97
	ATBMcNBTzfvGNoiDQeE=; b=nSFLzhfBkwVROVya8rQbcprcd/wwmxZH2IEH+0NC
	/EGySx2O54lH4yS+3MCMM7e4Bf2L7/0LXM0rUPVBbH2GsT+B3yJveCFKOw88DPCQ
	R0aX83tHrbINfjf1ResSTTQ2ZgYVuBRaUwdaJ3hVgZRKSSCS7e+GPfJSKqL8LvAO
	5wTNZ9iZRUUgVVn4mQ7nUFGZV14sz2dpgpS4a/tM7RIGPBZ3nipMGdfjN0sQVWcS
	WBMvptXJcUBu00iPf2NFwDREQk4gK4na3cgZBysIZ5B3pb23YVDWF6YAbyv0MHTZ
	CQaO6xck6xKKJrA49A45ywGiUhF2ryMtB1ZFi2vDekBDlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3hqeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:24:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so397054485a.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873453; x=1793478253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSWoeKkSl8LV8SI4xnbQdI97ATBMcNBTzfvGNoiDQeE=;
        b=AWmCLqyEwBm/meuHJkBuuEbfmtULihA4NR1YSFB4Au+T7j7I9IZgonW6E+0tWY3eVk
         C9+77cMndtfPcggxTJWefEKpPSPJiA3EMqqK2H3MyF7z9P/9unPckabc9HU5c/aFV8hK
         XV6kYwp6QVEyU0VCs/JTAEmywJZQRy6pYbo/sI889pTdDX5V2zo9ZtXS/zgXXUXMsW7+
         ExKI2HyM14OlvsPZ+M6D6cmD6jODdFD+Ckxg3M4KBYX7GXTQzxpK+InKF221GYTExpT3
         u3Q0xAvyfG9TMtvKboipM9Omq/1DDC1akzU7T67DJ9WQu8XpG3tHuGIhR+CJRA8J1/2k
         mUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873453; x=1793478253;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSWoeKkSl8LV8SI4xnbQdI97ATBMcNBTzfvGNoiDQeE=;
        b=nyIvjmasA2cRdLxOKmSH2a4+Xb4zWT0xE/r+lwmfyydUfLcbZQjyAQJmK8gjihsYiv
         XnYgZqWfOjGto0HDgzu/pVDlfQ0KRIFwCl1PQq/cxaWgDYHeRjDFEVrnt9TRWCxMXd+t
         CSFTXHwJzypoIeU+Vt2PDwoOWoLfynDsUFdJlnY0oIZWLC+tbg8rcM6Gu6G0yjGKddaQ
         iqOxpnbD9HFNGDqxl/cJcNlSsz4UQwl8oJa8enperGA22sx43YSGTqehlS37onv7H5FK
         1veIknBiVur8FGCYrgacFQo3wwdkbE2mOEfkXK+USQzhunFUg2wq6NzvoxsZcNWY+ecM
         XVPg==
X-Forwarded-Encrypted: i=1; AKwUvBzhxwN2EVHaKrtF9Zoo7lX9PG6VG5+PAjU0GakHzjzFK5iih3sEGGr1h2Y9H3HFvC2iP+lwYNv7nLm/lPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyEXwDmU7nLH3aY0mzVRbU5qF2U3749zLcMVlbC4lHfFburA9u
	4s3YiOwAzXACCK5RI868lL1TsmYSnsSF3a/m1nI1B5P5lUfvEMBRuW4cY1fg2TqDzsEkkwgIeoF
	rjNgYW4gqPbUA3BUXhK0LMVbEtX2srn/anplpudgpVTyTRCKfjDnBamPZoOKhs7yS6mfhsqDndJ
	w=
X-Gm-Gg: AYBFou0hvfIDwMjerzIYQtIjbceqGTQ2kQoUrLyLSqAVLGyhZ6sd/KB5r7eybi9uFwz
	ohLqkHzTC+td5A0D1L58kk5uzKzmcU5cieswc4beQbc97a2c9rNQybClusomR8Ck2r/U25beNhY
	ZFUuiPbEOJOnDJIBSV49cQvZExSOJJDv7oiEgupshW2h+pgDzHfBNaJn9qyfCMZg9fHfIWKHmvl
	Oan4hU9WYpewWUsjFCpyBRcNX/RRhD1eZDvYhmYQQJzQFvC6oAWPbEqTrcFcYAEK1v9sXmQTOJJ
	pUfvlMZb6bmKhTTyEXacPaDj6+6Kw2i8rEUhuY1Ta7JcR/lwTCeJIL1wLRa+BKF5FZjGsVRqwbS
	IDYPLnUipHTeXGTft
X-Received: by 2002:a05:620a:4152:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-940ef98b7d3mr417512685a.64.1792873453047;
        Sat, 24 Oct 2026 13:24:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4152:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-940ef98b7d3mr417509085a.64.1792873452350;
        Sat, 24 Oct 2026 13:24:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm73364725e9.12.2026.10.24.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:24:11 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:24:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8450-hdk: add DisplayPort audio
 playback support
Message-ID: <x4vqbuds2nl4apdi533rqkx4jbtb42f3gtdog5fqvilqx62x5g@lhud5o6ayymw>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
X-Proofpoint-GUID: vKO-G35hX3lZz3RpthxXJK2pS6dG6xh5
X-Proofpoint-ORIG-GUID: vKO-G35hX3lZz3RpthxXJK2pS6dG6xh5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX5CQKFqhSXSIK
 6dANWJnu9JDc4p11OYYjZ9EdwdpZcOjfJ+Or1pDxZC5qlYJhRo5j2AU2y4HBDtiTcXacYkvCvea
 4V5JTPx638opbqc5kgCpQQJ5QAUgKjg=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6add13ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX7pEQTckUqW9b
 PfUkXJ6dK7NiK3hJv2NcL6LbDGW9nkfFY32ecoJcyvCSCxKSs+SYpkUkl9m3pIcWm6cMK5ylgYI
 qJaziXI/gG2BYuW1OIlCYjr7Kkx5gx1BLwLAYL1xNr+qBWJF5lPUfVSjhDChUs3faOO6wc+O3CI
 nCnTDGR74Mrgg2AbIIUte+lw5AonYXZpp6g+lqreGnAbjd3cZoYN3ckNDHcma6DH2lqZVvLMPXm
 p1FNcoa1Dbo/zwtyw8pSQDnQFjoAkNGzONSpnFmrzn+w3JTjG3Z724SCY/5YrNskL9ighF2Lmdz
 p8xiaDHbT67meJLL9TvArVz1TtuLQmvHepX8u8tyJEQlOhsNoJTeaOEt9+9TXuj0v5hyAmMZmO6
 q2Nu83SkXaV1cpYJH164EofCUaHk3km6C5ThkobkuR9WxT/R9f1tkIRqVRoAWTu+juuShEnW2ny
 dhxm5m0UwHwKYgerrbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:36:21, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
