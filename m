Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9F62EEE76
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160541; cv=none; b=mgK7hxGiHozFSzaTRa0X10AjJDi2A9sau18e5Ub1PVAWzqEEJgpMV5d3DG6k2EnWYjmvYNXhszlbv/t6TbjzsOT86KeiFMNRhK1JcBnRggm2dY9lmaeO64yWF8iLwYtQdj3/CeKPlgDCeX/Bo32+TW8oWTj8uf9EFhDYHOnr864=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160541; c=relaxed/simple;
	bh=kORCVDsWGCpDhkisR/azDk7+qHAvKoqMy3xtWWCCDvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IbnsPL5DjT84PKm+p16HuEPdvbX97pzyioN/nQpe6Ob9LJEjMQb1+DI1CSoeLczRX4WV6dK+d7gUEiFC13R7QjbAbZVc8KV4162Z2Vzz9knJxOwAv+74cb/QJS4eqz0mFtXG0arn8D+mM349aKrnvUSc3k6O+KfZ7yWWRtIamNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+UjZ9aM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADUnEgWR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+UjZ9aM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADUnEgWR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52ZF91445360
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XxoTtQGpt2NRnraiRP6sl7g4799xTHOIwvY14N1jedE=; b=Z+UjZ9aMLgVpb88y
	7eOvdVvnbpZkSRiNHi5Jc8RVgn1FWsqg5rXxf/VqZwxLwf7wv6/blaJRnrtOYtGg
	8ZHYKP0wJJG6+1lArxYTCbJ3pZL1Q7s1Nm2ydc3+mxbUL51qFx0Gvt7+WY7rpUze
	ZA2J/bdLbR/vvTZNkg8xtrWzNgr7eVEvUYjk3LeZ+73c7pDiJ2UfQlrqqqH63BBS
	OfZe35uT1xXChmgdTl4MMOtMsrZ6N8/sXVG7+mUXZxwt0AcR2uun9OfPxXg/9fbZ
	Ac7tqSzRfKhrJEIfhq2mjddu373CZeDHo1DX9lQGGPXVRbZQ9LDz0uen5B2fdt03
	TO2j3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgvxvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:15:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ec554a80aso9301701cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160539; x=1788765339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XxoTtQGpt2NRnraiRP6sl7g4799xTHOIwvY14N1jedE=;
        b=ADUnEgWR9mTodMzt/N2fR/MA0aYj4jpVYBNANc0tSuCxL3i+64T3XVtbAQ+Zuu0suc
         hFn66eSTNireXz6O1pUFDMJqC9LqK7vRtvVloS5kA5oDny1ycXkC2sQj5dbTxItf/1kq
         4RX49thf0tog4Rby5ElB0H9Afm7VuCHqInwH3WG5xmKY1q+VqBNJ6EsNZhkfHVKXiJnL
         fZTpInOhpwpheS7IcuGYLZGHwbeb+OD29Dt96AarOEiZngVR2sCuGw/3ZsoXxOG01K4E
         iIOOvFMtkQtBZ+QUCgfK+VmEQurbfQhFdUXVjFmrdhXR6iiDkFw07ufzzIs1KuocZNwJ
         YZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160539; x=1788765339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxoTtQGpt2NRnraiRP6sl7g4799xTHOIwvY14N1jedE=;
        b=QeLwPf5L7kN3tSr9MEOaYlIAju0QOe4mLojyn8jKJgAvzgZEe8oOuCcBL5P9remEvt
         Qdoz69J3XFQjf6fzPm0mUrqWMQ7FOQR7lE5Ztb6bZCRJ1rYM8Azi8mTDQtWVatZb3K75
         PI5PBYUD08zY3rN/rSKcRF0ZymyUEj2y41HLm4M7v6bMkL6mSZ9Ay50hGj1m9n/uHYrn
         UfQw2Ptyk4F2oxSEmGl2QSRPHFjibWPsA8fM4sAOIMZT7hV+O1mkUvtr4oocDswRNZj4
         6Oi7tx1UqlFSTvuznOQCKKVl1YnJmWrB9nL+bYCBhcIsm7BsaQgGJRam6sRhYZ8lOLtq
         jgZg==
X-Forwarded-Encrypted: i=1; AHgh+Roqd8tBMD6HCplT9Uy/PZU9GJGzVMQwd9w1I/D3iVFY12xXXt8RpBkN5CyGEazK5nSbRR3bAyVQulqQQSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ke+hTScQfO5AzIx5trrCZPF8qEcGm6hNwn/XV4kQm/zm9OlHNE
	OCQTtB/tM26JMf+hKkgbU7/L+RjrJ+HWF/4E8zgcqOABokZSr88L3ocsuP3EoFpzpVAu7Cq9FNi
	aPhejYwJXeU6uMBBa8tylruHzpgrka6EZ5bldN4Xhb08nI0OsZYf+tfh9nt3r0jxuuXA=
X-Gm-Gg: AR+sD12XrDSmHtj4sY19TbloAj1yAdNkUzF9yx7cqDx6MpfxwOWYC8n4DJiOg7Wt9FB
	F4r9Vh7hBFsws2phR0ZFMTvFWvJRZ7+TFXjbYt5+WbHBlodJ6vEy6u1mPAPfKx5WSrLHIALAXTs
	/SP3pxg5gsDAOk23YlCvEKxbGe6ZDVHzjX7f3HNR8CRVn87RdkjsyrkuG+dC5EOcad6d9XyPzqa
	DP4RpFObafNw+aHp8Lkr+htEdJODrVz/Ok3LSOP5pqIlN5sL5A06stgxdMN2sH/gPs7PwD+dUsF
	nSh8xZMqCMKcvlAPAIA26Ky5x2Cm4KP/8LpZbJQcnMBscYAC/8cz2CGLRrvlnJES6kUKo4l9wN/
	LGjTXT2umwVjiF1UJ+iT4Vg==
X-Received: by 2002:a05:620a:29d2:b0:939:288a:8a30 with SMTP id af79cd13be357-939288a8d25mr764553785a.6.1788160538910;
        Mon, 31 Aug 2026 00:15:38 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:939:288a:8a30 with SMTP id af79cd13be357-939288a8d25mr764551585a.6.1788160538530;
        Mon, 31 Aug 2026 00:15:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09f4dsm408993966b.6.2026.08.31.00.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:15:37 -0700 (PDT)
Message-ID: <1aaacff8-18ad-46bd-a3e0-8df58dc1b6ce@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:15:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Replace spaces indentation with tabs
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260829193839.107040-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829193839.107040-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MCBTYWx0ZWRfX3AXkbWjMMTVs
 gsq4jZXPyGGC5qwkdS+1zHHanShIMo5gvr/LUFZ2z1GI9nyV46mEm8mQ8XiDJlQcQlAOppTZPHW
 2EzxuOlL5WSat7Sv2ncmgeQPriqCqU55qwnYisAbPcnSxWPhkzWLp07jH+HXLLd5dCk24tQKbqr
 68KXMbZUkxReLRcZVC8uCNc7GOYiCSBb+Vj85SALJZTHzKrs9hsrJiTE9ErFSQUoBFOXWnDk2l1
 O2kqtqEouVzR6bWirBRKr2+1YeSKTqOke6jIXkModX/TYxux3WPr1PjS5HAOkX9qeMgxcZQsvj7
 dY6+IGyqm3KLylMUQmLHDbHKqs+Ty1uGjzIU1ZWpHQhtE/f2Vu3ac/Wowz6HOr7kcgyXRFdSlm9
 yKIALWGB05By81g75Lz/OIZ5FRXpJbUzD8lg1bjR+Tb9CuerdxFU4SwgADa68q3S/5yy0imf852
 LBTRPeeG3OXy+AWdJcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MCBTYWx0ZWRfXzYoKHZzM62xr
 3wGDwwiFDpBnMJs4mdOCCVs9vIWperwM3z+EtlUGm9QEbNiYnUL6Adbj+Q8lNMYMpZSZnnE+baG
 0HcCQuDewrKQCr3UYJZcUoTGYyO5S18=
X-Proofpoint-ORIG-GUID: TBN5c1WeHjIyoDijne6I3k_6zlFiPECh
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a952a1b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OO0WwtfGA5T6cXiHK_0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: TBN5c1WeHjIyoDijne6I3k_6zlFiPECh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310060

On 8/29/26 9:38 PM, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
