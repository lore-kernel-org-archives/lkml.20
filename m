Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B614F3EB6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894235; cv=none; b=APnJAMJTaQ7hwVrYsv3l7i6+spqo9JHB21k6yASxZQ/9/cpegXkI40Ta03y7l2rBmvNl08B4874UraaBzTMKZBmGoaS4CQNQUomI8OarRa6exl0tm8hFIY53T5JRVjLN8feIYPmRjU2fHCsyvvuD9sP032cnhHNwg7F5xyDWvss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894235; c=relaxed/simple;
	bh=lDUZrXI4ageL/14i3JPc+1VGuvQ85xf8ByPYGgCshwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwKX9FEI8L1JHgidmvRZMtoJ1APub2oosEk/MYPzk+191+GdUWVphtQ47hv+eyZp00JIuHu5OZz+adUJbugE4+Bn/DdbUusAfoY+iZNMJhfXCuLdeuvjTg9BEg1ABMumkc4VVR1Oj5tnlCWsAcRAzXg74XAFiV9ab53Yy66vuuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gX+0sRyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSWT74YE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gX+0sRyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSWT74YE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9tR0D3475857
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CrlcQxNH4MH9uiduBnmx2EX5npg4ih1ZTI8/FTCX8UY=; b=gX+0sRywB6y2e78U
	E7iydsJL2KE2BYhKpEIouUPpyNNTmUa+Mf2yjwCmZjOjyXXILhALwtfpk089wHax
	EGaVSgvNB+uLzk42s5SNMj9ED5Afq54yVvu8Z8uIA/mM/cUNz7456KpDHTF3lkpa
	QoYUUvQbdGOXbq3HxB/u4fYNG96KA7U6XUt2Is21TpsTTmk5iE4GRGDsXsPeWQMa
	kfjuA1yH19bFRCfvrxCPyoTq95aIdm1EXnjx9ysSDxwh2ztE8Bcam4Ftmt0pM2t/
	h3Z2CBUJ75nzPYIvqKRG9llnCJH69bG2DxtckffaowMk7wrWWf/aLxTiwMGHT13y
	r86lAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7ja0g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:23:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so42279885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791894233; x=1792499033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrlcQxNH4MH9uiduBnmx2EX5npg4ih1ZTI8/FTCX8UY=;
        b=JSWT74YEBc80Z6hqemDgfVjIH9tHdo0E8tq3hqjFqWcQTS4QqMXs67JnragmV5UxT/
         mpexCXSVXjlP64NzleWmabSGlTxp1mMgdYuCX7TbUVCn8P07mJp3tQdkvWrBZuOPR+FD
         RKT/EzmB3NuEcqS0njU3NnMVGJD/wVHvGFbxAnAohNB3rzJQqX5SPhjR8VFSjld8kkcl
         HU2z5Olo2zxgK1LXMcTsp/48Wu2tSvIUQGu3sGbm1cqG70NrhJ1glJKr4MfRw80o3Yvl
         WaJljtP2aHdXw8THD6OtuBSJxu6DYWpVEmEcx3YAkGz8dGIxuWfCuKJ76Mj7wiIlZlob
         DzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894233; x=1792499033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrlcQxNH4MH9uiduBnmx2EX5npg4ih1ZTI8/FTCX8UY=;
        b=SeAlFwAoLH3m20fCoJm5+8wFHJCGnvQGLdaOoQB+gPxgSi0Xo3KV2sKs1QHiEQ4tDR
         ewvrZkVqdwEhwY0BthA3OMt8YjhkaxtT0C6a6ARW9EMA9YBWrVV6jqeu1zeHzNGhPACI
         KljlPONN9FzZMr0DecRWj2fBqjGYPrrj7XqSVUpH3h5GsICOcTLnl06FSrAqctl0XlfR
         xodBRNd/AWrtdLZYrpmKiRW54coKKECPkqBVnXgLyNMY8LOBHxIg5RcHjWsuKEAOCvj2
         SlDJ9JHqtWaZe8IbEadIoKmoM3XqGoHhejS1oSTP9eG90Cka8ODBQjLpdsMsD0G1/nUT
         dx5g==
X-Forwarded-Encrypted: i=1; AKwUvBxmPsoT9Sy7bgTTmXvgWqhMYR87fwTOpuJ4aXpGoIaXoKCIt9Aq1j5wfn4oRCj0toa4xXF1x5pK0KiaQrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIo4Ni4C3p136mUMc/HFnHcqiK/huJXy35JJLtKmehjjF3ULojf
	XTFHMG9xE0oR2OC5cRvJ5gXxG5X186i1+YKJk9j9BLQV4vQyYk2UqAQ3dLj5UkVRBnoGAGS5Gdo
	aP/gbCxnrnpKV656ffHd3sC+kF+CAJl9pe2RZogBM5I+jVBe42mSwEqsP5PnUJncXYIw=
X-Gm-Gg: AYBFou34g8XINp6TBjG07yCvFXtpM5f2VI+KBqc2aLSUMYKm/qySOA2k5s3JpiuNonq
	8QLFQoDwW6IQCG1W14zm+e1CwF4YgU9tQYFhWFu2lKv1X04te1fZyxx6LrpE0qw4nD0TJ4qlT2E
	u/5DChSrlvN8M1LOzTENRp5mO8qSU+kJsAFi1lTfc/V+K2occ8SS2Fj9Fl2w4vn77AfILjwS+Bb
	pSqpogMWpbHkZC+qF3sKA2J9fHFHHnVt+1wAHOv+MrdoboT0qHSR09pcBKV1ncf85QuaFXQ/pSN
	z3j5QafTLhRT85WS0WRPZg5TLdUnE/jmAf2mjE04f8RSkT2fKWVMt9vZWAe8Qt7J00oiy1fcpU5
	0k7bHq+Uh52MxBVaxRuEUOw==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr2307009085a.4.1791894232731;
        Tue, 13 Oct 2026 05:23:52 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr2307001985a.4.1791894232143;
        Tue, 13 Oct 2026 05:23:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm598078566b.74.2026.10.13.05.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:23:51 -0700 (PDT)
Message-ID: <4b630483-4699-4802-b036-fa4968c7032c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:23:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: Enable DMIC4 and DMIC5
 on CRD
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922101550.2216689-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922101550.2216689-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P9dXTjdrBXDpLipEZ3HFLiGCHBEeOBef
X-Proofpoint-ORIG-GUID: P9dXTjdrBXDpLipEZ3HFLiGCHBEeOBef
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfXzu74hAf2QBCZ
 nTHvEyyiKaMePg8bBREUaCIU0XEX/bCxSi5aR5ErJfgXxq3YZuEpkfPMGe5FoTiSGOv8TPmHlrW
 Tr4vEXr730Dyx1RCuR1hGp3vqQnLmt4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX59lV0HRnM0mv
 mTskswIgZXNtLQNDjKsIjyQrrOWNgQ7E9dkbYN9AofJq3VTRpgpx1NZ/1KWSZybPhMTD5a8e5wp
 aX+/ON2gsDO4kuiRpVy/rTBG2c7e+L4XCdo/NgRKTCHIE5CPBS8UwxNXUEH/AsKxJW/mBI1DfGj
 0jzc52+w4bEC+vWywZBxrbp0085ykXmjF3oWBF+42hKilnvAMfZ7/QO2uUMmD8E1JZdjLnr+1cH
 9utV7vbvWNCI8/cK9BzutqXHd0gBEQ1A07cNZcg9pOEAPlTGPNrXfhZDX5FZ+EG3SqVChUNHsre
 DKymy3l+HTfRYfR3DTzSIfmqeMkutpeaHeyvqyRI0ja6ZaV8iLSvu734x7OkN8KJL/gLbUZgoJd
 tEAFycgADqg2f4lBcHPXlUlY3HiBLu9yU5sKhLTJmiC+QQdKNCVPkXjboBDnFDLqCtcuffnYlzT
 0qQYg5AnMLGVB7D1lVQ==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace22d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KGhTxkWfJfEZ3ort4-QA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130049

On 9/22/26 12:15 PM, Mohammad Rafi Shaik wrote:
> Add the LPASS LPI pinctrl state for the third DMIC clock line, which
> drives DMIC4 and DMIC5.
> 
> CRD has additional digital microphones connected to this clock line, so
> reference the new pinctrl state from the VA macro and route the
> microphone bias supply to DMIC4 and DMIC5 to make them usable.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
