Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11503B101C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934447; cv=none; b=tDD6X8Q7FR6+rB8EOFv3RhY1LDZoFlHJdgVpzu16YI27yRqBYeqBOFWGyxiC5xuN+eB9xFCjTlfSxqKj0XZRV2OAkxIUqEBu5q1R7Ns6Tpngqo9qHnQVt6vLuRJ7qX06x3sKr/NJIxwXBffhLwKo9dmGHQF51djMMVSNPZpHXXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934447; c=relaxed/simple;
	bh=DsPF8SjSUErETsimgL0ZJd6+a6VSJ+qHd0qfvNgOCUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/e/n3H5VHsqb3+qHSLnRAmSwNXeyXu4EhU5OhQ76M/4CSLiGFuC3eRrMasmGwRnOUfYT+vpTDzs/ZjGhh4VVZEVTeFN+OW5ZTVCoHRWiNgeW7Ix0pi00bla8JUcZTmBptFYqIpDPzN4Pe+ep6K/uxstCwxS1MsoPfCh+whOxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSQiGAtW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmejdOh2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSQiGAtW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmejdOh2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j7oj437918
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 09:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I6NWwoC36/rmexB8/5T2wdYS
	MyIqsDLRTt1zm46ISPk=; b=pSQiGAtWzBgHX7+Rz7qbSXiF6oedADOO65I+vX6s
	5IQQoPtnfjb+qb2/ouhGrYqvyTMRC8n4dYtC4OkqDHQLnmzVA+P5TuBKAfm1+A2N
	jZ3AxmfcQwkIW+/nmgFZTwezHNaY5y9SSobx9dSMKfJketPhRs8WNJ/aa9Zq/Rkw
	jhUh4WlJ50+6PV1HVCnDY8975R8k5Du4DEq6MGRJc3XTVDVg0EUcoXzaKS9EG2sy
	3VHnQasySB33+q3ofPPVW8FC4NmWF9RRbP3UfoEzUic4Fm1R1Kk4JmwdTedls4xD
	eSxR6tkCfAjiFWGcjONqZPdm+o/eNTTc3xOATuIqAymLpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdckwkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:47:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso416039085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934444; x=1791539244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6NWwoC36/rmexB8/5T2wdYSMyIqsDLRTt1zm46ISPk=;
        b=ZmejdOh2eKU7fm9DmkLmU4O2vLqNNp/hxOkSyRHJy9IAXBNVD59C71FY9GHWkiXIoc
         4oZjwtMZHAbBfLi6mcQoR960MZiVRIDS+ALTZfiusAT7wwXpmJJMFzQglYVvHli7Dspz
         k6RPM2/tBR1BDa9GYjO3h3ttvNax7ocvSRQIl/bO7fkI/tudSz1ZIm3wmyaHILBDXWSK
         n9yc8/Foo0Nw2o7m7VOrKZEjLGxZLq6Bg1BGQafCBhj5WTviYKQW88RQbdaKlk74g57q
         aktgdqn4Z4Wv/zh1zYnVXG9umCJIRXYnyhxgvCtCL6upsfrGHmOaYsxN7GY1aKIV0VCb
         rGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934444; x=1791539244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6NWwoC36/rmexB8/5T2wdYSMyIqsDLRTt1zm46ISPk=;
        b=GDWqxCSufQn52N2C+Vdaz/cWBC3npFQtdOZF99u/aFQMRWfoo2YgU3WH87lFXnjSR4
         qiereTtkA72ttla8RUNP2ugj0du6YkVMLAdws/tJ6qKMe0qqB/oy9zPoM0elRwYWHn/M
         2CTBvEwg4AhLIB3uqLKdaQo5hSaBwHgaZpZyHAyExcxE2UbIPCZhb7mt4LBZgw+a19GO
         WZq0JDdrUR30R5tbp/8UTeaXs9GcBESASnFW8wyh6jlvV8KqiWBnyUMTStuCKEM8/HnA
         B7Te/RBWPaB36eHCun8ahCGKR23TnaV5Bigt6uFgQ1cTgvHoCnxVyS5A2tzJOFRi6crw
         tCfw==
X-Forwarded-Encrypted: i=1; AKwUvBw6cgwfYvoKJ4fjwbFROWoCk21nAICnjM0NIyFx9xYtTZlxkkfPcmu8dEYzqYj+Bx+9vPPLA5GZNz9ztQU=@vger.kernel.org
X-Gm-Message-State: AFuF++lorZU9dEMv9ky7YVUNQ2KIOdLO3FAL6Um+/Dk0Pf4zK9AJFREc
	I2vCOvQci5MWDvWaJhcl0yh0RZ85zNnll4RJW+D+NypulBW6Qd/oq1C/YZP4r8slEIHny4KF4oa
	NFot0I9S5ZtSnv78wop//DoNr+h9IojN2vhCK9rsN0beBNchFA3DTnC82oCW73DwwZgQ=
X-Gm-Gg: AYBFou1tOhUbQKw7RTwfgL6Bj1mfL6u47ZQ4Bx3cNo1kAwoHt/OVvOhM3rbNLwrDJAV
	chzM+SEBwFZa7kN1T/ku+moGnfbKyijUe7m1P99R3Wh+mqDr2+otiFZq1WwvmbmSWiL7hUvdQ9P
	QPeUGTyE2bqxFwfolombNFdYo2FH1QyQmL2EReWB7iggAKkDWa3Oy+kcULnhhClUQ/jkhxm4tnx
	X4InlZOwPTNUe8ceeCyx4E09fNTS/H/rVU0rTS8pKyIf9tYnt4S/qa+xxBLRngjdaOtW5kgf7iY
	c2wPVRe0z9K6RZZOQiSppuJH4z+BCBganeYIm7M1cLoebyIlYgdnIxl6wbJvCPEm/3F+LOjsuvM
	hRtIDdDBI3qmMaE4=
X-Received: by 2002:a05:620a:4442:b0:93c:7861:675 with SMTP id af79cd13be357-93cb5649031mr1092330485a.1.1790934443788;
        Fri, 02 Oct 2026 02:47:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4442:b0:93c:7861:675 with SMTP id af79cd13be357-93cb5649031mr1092327085a.1.1790934443206;
        Fri, 02 Oct 2026 02:47:23 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280dc6e7sm85350485e9.15.2026.10.02.02.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:47:22 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:47:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8650: Add watchdog node
Message-ID: <kcnbtr26pgehhtnnfd3xrasnwer432pqaqllf6jggyk3ckhwed@l5q4pggyqv4l>
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
 <20261002-topic-sm8650-deckard-watchdog-v1-2-7d7f7d71d88a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-topic-sm8650-deckard-watchdog-v1-2-7d7f7d71d88a@linaro.org>
X-Proofpoint-ORIG-GUID: 3uAj3-15SKoTwdXD2jULXIr7WN1Zc2vK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX0pjFbZFfMF59
 3O6XGisoUOzxH3hr1ECDldq4jpH6XMkB7jzzB8rjYIg1Q0PXnImKJcY9ajlqN5koIVexVvvjGm2
 PbBXz827632gmTXRd2QR/X4FM3dq6Wo=
X-Proofpoint-GUID: 3uAj3-15SKoTwdXD2jULXIr7WN1Zc2vK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX+G7cstlI3hp1
 oNO6ybPsDb28UJn8zyjAErlXYuMRoOwphDlAbyIuZW5miS0SfcxUAtpQ0CGYgsdrtkA2Hl5ZQO+
 4QDNsvd8fo0BIXD+i0bCeUJccnHVOHA55TRwrwq3Tc/y0aBpKzujgUAQrzuPKJ8UUiMgwoB3rdh
 nG5nKazi1mHZ0ngehZGLudXhljwDRWFuu+cnLhfh6+/Ze6H7Gm03rKFF1xBLlPNBzoRW5pdnoxT
 FI5lLqwmW47LMdAZk4/XUoaYAYdpQp8yAvrNCJuxeXwD5Czfhcf9PjBoypAfGT9fXBKLlG8aKy9
 QjSdxNJoIDZvvEEiJLRSfTqS1zZIJhNvBLzW4AxhPhtx9m/Y+RU2ExsTP1m9ruJts4ChXVOK71S
 GCL+2Z7yOnbywHie34J5padt9iIm9vFs4qLWTABKU4MkkyfDAL4KW5jrlN7/rgIhhaNdLKvGisP
 yPkPW4qjhMTTBIy2hZw==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abf7dac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1I-uu_GJYuiuqpjYtLYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020038

On 26-10-02 11:45:29, Neil Armstrong wrote:
> Add a node for the watchdog on the SM8650 SoC, the node
> is marked as reserved since on most platforms the Watchdog
> is owned by the Gunyah Hypervisor.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
