Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500400;
	b=EKgpwTpeOoRB0N56UlnMJ9ccMDyjBt+t3ll6aaX7zeqyIOfjAxbfUyYu7ph48BOmK7l+
	 oPWw2xRtMO51NqCQ2CV28xKC+VJxToNVqB70WeENQv+raOzrIFmpNztF4kiksX2DehjPu
	 E2505wiwAPzMNve/qMeu4q7RprMcrrVIYPx1KhWMrM8bEOnYCyerx9IZWInWJt3yUoNGd
	 RAcdF4SAXoL6w6XKISDIfJo6YKGueuJVIuyRmTpv0SsNZClBpla7V7J/QSPXXX0C3OxrD
	 geLIpKyQNEbBFcF3ieV9R6JU5N5ZjzyA2+sq8VzRyB7lSyfi1UdWqq7qv456HPy4KVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QeE2tYwp8mzE086gdIcUEvuuD3n7eTJHgzKi/qUwFhE=;
	b=BEAs+eKyKHCNTNCBYvBY1u+Evtur+AxRRgushHWLdJyICyUJ1mdgTxGnmjlLdaSyxd7v
	 CwmUaa/Fhv6E0WnuNK7PWvRQ1rDfWhQNiaAqwt4VJYxCSh5pia7SMRkdiNxQmWISxE5qJ
	 CyOUo/S4Yb0xkvoTzMwM0X1ypnu8ynu8uVRpJgeSTpCGDhuriCGoiFldk7YLJQSe+AERI
	 4dNfMoxjx+KC7we+bbv9Ds3LRVR5dBsdoRi3FXUEIJxRy6fNyiP0Fhmkq02uao4J7nDkS
	 JqdcEGn/40YaY00PACoAWvwUbNOtcEHCPP8Xsoq5071zW+s9n1M706IwhIFG1w+Ncig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KWMIS5Zw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EB1q4tBD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE99E606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE99E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KWMIS5Zw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EB1q4tBD
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxH011292861
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeE2tYwp8mzE086gdIcUEvuuD3n7eTJHgzKi/qUwFhE=; b=KWMIS5ZwvKpMuQy6
	B/Hq5J4jh2srTIJZj1rWvqt6giAfvYSZW79kkcplGj3Pb5uX2s5BYuT4w7satKnZ
	qIt/RY86cpQpFZub+nFCKRuvtD7ezEKT3pq2bTFv3IAjx7AcgTrEd4XYceMIKDkX
	nHPISHFqcS8+mXt7tdiJpCJT1XsOvmTdubjRYr93W5fa+h8s8Ho4GOyVvcg7O/yk
	l0Qcu/9VFpIYN5mHoIjLNIsmW+QyaJHV3u4x9veuaRxSdNtJ25LM19vjeBFMGrP+
	nbOBnFcWcJArZUCkmeGcJyHiq67CeywfbBCxc3K4kX+iCmw8jXG0p2VssBP68s92
	fnn7zw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2gcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:46:38 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5cc87885c6eso39589e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500398; x=1793105198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeE2tYwp8mzE086gdIcUEvuuD3n7eTJHgzKi/qUwFhE=;
        b=EB1q4tBD1HROKieSRH9n0lXMHmHUXTHXcqox7NujofddDur3IW/vzXZuHNmPjUsVUg
         Cpnp7/MwVUATG2r127SlusUVMKR+dd/elIruKnrYSaGP2Xj1jQd5WQzEJeC5ixka+3Q2
         vndWjGaVLck7ayTxyPfBLRb66j21HgZiAHmqpyA0jWRd15l4Uwu1RgDsSn3Cvya/o8bN
         eNCJfIH+4vsrbWj1dBPRjfFtA58DYJyxCEpDYw08mCSmFVPHXS/5iFmQWdJeoUQVxLj8
         1qc4xAkKRcCZzASj5JLAL+a3z0cxVfRKsmyN5LC/IcK7ln1C6M5YNaHr0zg/1lBNyOuc
         tUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500398; x=1793105198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QeE2tYwp8mzE086gdIcUEvuuD3n7eTJHgzKi/qUwFhE=;
        b=vqmsdJ+RblUZU26jT5fKRIeLmddz3nPTBSxXqOnqZButKb973tKF5opYw2i9Bb59GE
         PN5QIZIfCD9S45oLiKkGT0nmoi/1LTxuJ0/vwbbm/CH1P10SYJiNNUfY5fgf08OV09HJ
         XGvKMMZuCZW24Drj/Wu6Brwbt21m7e9k5itU5Lmvf9ilipe9ZapHN4bJ3qspcWpOXuTY
         pQP+/b99IZbeZAlcYI58BigPTHeukbmKRg/UZ5qO1iawFy3otnVVImb/xA9U4uXgMd/W
         FA85WObdDS4tfbajUIOAq+LPxWjC99VF323bKLzCZ1/ZvZlKL3jWQ7bNlHfyHckokRpI
         4f/A==
X-Forwarded-Encrypted: i=1; AKwUvBza9UE5vjb/tPP11d2CAWPDxdsBox9YSNS9WT1Ca8McppKGClmWduy3jGfKmvIuCzRHgSvuNDyOPXjIDXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ5mEUTLEIqAkXP51yL5SFYACNxpt0mBRZ3MPX7VzkSeCW32lH
	sN04I6L+waHrm308yfHGfPaAbS/p10zTajGuKlWJcKYMmEkBBhq1uszonlbnQSHJ0NfP2dBHxu0
	Pk9FZZj6GZ9TQf6xaIo7DIGLLsi+qKq4kJ5YHwc/H9IlxEaf4lEMQ43IYantOf/aw588=
X-Gm-Gg: AYBFou1FsdJ3W3eQfsvrx0gKbIJtPp4g6kBH+jfLWTwLYLMmFieh5N7GS/YN2RyUhcQ
	QwR/7iRrHsyGyRlj9gIacL60A6KNFsyYuz7CzT2KZylBGQTBeKjugVtf6NUi+5vBeAvz7a79F4U
	UxCWngq3PA2fharVUWj+/r0nIgkvppNgONoZ1NCyT68MoMr4favvMr5K9qcbsKyUAAXyKp4DzI6
	CYAtffsGHxuqGXXrO7BmLehRKqm7+0LBdot4o1z2iPj/VQFTUUiKKpSdc+DrGi27Fzoj6ac+UGe
	GyBhw6bYwlCRcbL3ImjqNCyRt6icA73gmciTFNDGMFB6CJrpzcZjgHSMGrmEKy0tLaCmmEt7enh
	7tL7mIrK5MDQ6Z+NiFGOazA==
X-Received: by 2002:a05:6102:509f:b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7cc36929107mr1800640137.2.1792500398226;
        Tue, 20 Oct 2026 05:46:38 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7cc36929107mr1800634137.2.1792500397661;
        Tue, 20 Oct 2026 05:46:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c4806sm475795366b.44.2026.10.20.05.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:46:36 -0700 (PDT)
Message-ID: <72b98e95-29b2-4c8e-8afb-986abcd1367e@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:46:33 +0200
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
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as
 critical
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Stanislaw Pal <kuncy7@gmail.com>, Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Jie Luo <jie.luo@oss.qualcomm.com>, Georg Seema <georgseema@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
 <e16cf23c-82aa-465b-81b2-6240f4a0f4d9@oss.qualcomm.com>
 <f2ccd6b6-e5a2-4d36-a12c-124638c31280@gmail.com>
 <66d48e1f-7bab-42f3-84db-ce794f2a2a89@oss.qualcomm.com>
 <4ae83db6-768d-447e-b177-3ef5206267f9@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4ae83db6-768d-447e-b177-3ef5206267f9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: md4C7Z3JXlbvWkM5TkFiQFSeXXlI7byS
X-Proofpoint-ORIG-GUID: md4C7Z3JXlbvWkM5TkFiQFSeXXlI7byS
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad762ae cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=k2Pudi_VgRJteF2nVXcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfXyLaQF/mAdxnb
 u1KJGqdP2BZMr/KTqOFNgWPzxAp17wog/51dy9HFbPeOAlyba6uUHeNOiVwo88if96dkV4Nw62V
 IBZ0EO4foEnNq8qIXYNfLLS0PWHfj1MmpFP53J2QKbFrryIKLsjSNEBp3GCZjPbqonsPNjqIGaN
 o5TztiKiQ/a9wwbM29wuzgupSfzpcTR9d72B1bxQ6bjO9bYyx274XoEckWX/kyaQ0ZO9AvOxUCg
 1GiKXoeEtxSr7jftL/CJc79uPHSePwFNSM4pn+PiTVL4hvOXFL6aP673gfL/Pt0kHxD4WOHEfD7
 rWa8T7lf5BwbzYtCiQ9m8YlmaeCR1+CgHzug84U1pLKvaN3HuprU0ENp201+oBI8hJjC7bXf2vl
 HZa/4NhrWpOqTtl3jT5eHIkuvnqwR0SaJNExctktZ7jOHgskshw/XrvEUSOYROYmlgPrc56ZtzE
 4SsFO9hR+zT3O+Zblyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX1JUmBScCFl0t
 noIcWH9EkjFwcfrbaVjIDrLbsCYIeBVkELHXAmokd6Y9FufOKTJ5ea4Lq0LPpnRsln1Cy+YB0pm
 jDQ0MmyAqUaIlsg0EHqOKVPiHZakZJQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200050

On 10/3/26 9:50 PM, Gabor Juhos wrote:
> 2026. 10. 01. 18:15 keltezéssel, Konrad Dybcio írta:
>> On 9/24/26 1:33 PM, Gabor Juhos wrote:
>>> Hi Konrad,
>>>
>>> 2026. 09. 23. 15:32 keltezéssel, Konrad Dybcio írta:
>>>> On 9/18/26 11:27 AM, Gabor Juhos wrote:
>>>>> On IPQ5018, the APCS core clock feeds the CPUs. It can use
>>>>> different clocks as its parent, but during system boot it
>>>>> utilizes GPLL0.

[...]

> Maybe this helps to understand the problem.

Yes, it's much clearer now. I think the right solution here could
be to make .sync_state hold off any non-transient disables until
sync_state has completed.

But we're still working on getting any sort of sync_state in the
clk framework:

https://lore.kernel.org/linux-arm-msm/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/

Konrad
