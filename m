Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88EB4E8DFA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556757; cv=none; b=aiN/5kif78xaKE+cZiRHKkin4Ed+YoP0jkX7dvnenvKdNAx2Vkqd2ix2efgZmG+IQyEtMZRWHrk+mDAWWNKW3MiB1a2bNuadMggLIUNk8HNMDSwGbjKBvXeX/5F0cmn0RM1OnJ614/S0fI6mgXFBYGQlbZpH4sGdSrlE//wjEyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556757; c=relaxed/simple;
	bh=M3b7vcLCF4NPMxZ3ZX82+QlHQZlC0pfWJmSdq3RAlRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1JzKzmJQmTcqe6k5kMJA4oPYvWyvYb1jpxV+rCrvds6g/R0G4Pjg3FU6OaGwWczg1adCvwWDZRTGJ8U2CFuF8G28Z8fyBYDDX//jloYfKCzSPNoesG+snoOLQTpUgj9WH4j/OPLWqMyhLlOgdK+HRMl/pP1M8VqSkdgoOVjRts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWfdU8rJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClTo2FHo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWfdU8rJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClTo2FHo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G932os1587054
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78RH45jGJ3qYRyX0Cn1bvWAKRmZzAW7/P+11DCJ2RqE=; b=RWfdU8rJ+up6Qdg/
	jhDp1hmNO9mtw1w7Z8t3cRWVelU1LZLSa+DOJxYmkusUpHLG13OneCrTCjppkeSM
	VD6b12xiEd1Ra5JG90q6UBifUEKbHURRykcQjm878MsJkY0O3WKR9+a6sdbAJjnW
	rY+IaMnN4R91fkJPrC7WM3hglX/8xIyfzGHOdcdN0vG9ekVxAJef4Wkd9sMW51Cq
	t++q1W0ZwAiYDT94GOZg9e8eL+JnTnAO4bvjb1tVU8W6wQf6yVtPNhO3oR+PZLNi
	cCHhNTqjv8be/Lzqt5ud/xd9JciLv4n309dXNYXyvQfVTH96XyS3J9V0Bozco7fK
	KoS2AQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqagekway-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:05:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso6969735a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789556741; x=1790161541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78RH45jGJ3qYRyX0Cn1bvWAKRmZzAW7/P+11DCJ2RqE=;
        b=ClTo2FHoLcMpP2dmwvK7d2W0S/u/aQ1yJiV5d6Ar2pdz4SzS1NKhkNP3unRY+14dh7
         2OdINdRX/iZlfKxNNrD0tPVABaj1tZjO+9R9JOaKoyl4KQPTTHMdg7G+lnuVE9VylWSg
         PtP8nwGAe7aypEy73n5Qz70zbSFxy84K2qFor/y4DpXjfFywmPYo7rugds0rv1vcT7PV
         1d1U1Tmtc4jFPhrl/zB4fZVAOcjK74+MwJGBrxTk8vPZkJuWao2oXdGjamF4MG8O4K4f
         D691Ju7Q78ASkYIVG7cOx8kDJDCD+sNyVI09zDFKfnrVS7E/OzDVGsOOVmC/51tZq7Vy
         4yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789556741; x=1790161541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78RH45jGJ3qYRyX0Cn1bvWAKRmZzAW7/P+11DCJ2RqE=;
        b=MJ5uS9fAOAEKQU4lirTlAvG5CvCwdcyllKepjiOofOXAOdZ3B8jaKqbtohTbBwbL7h
         EuIm4MNnUat46p18is4JiP0vQXt3aJZdvJOKFtBSrl6hovCFI5sBE4VyieTKTzoByR/R
         AuPU8Dce6CK7lh82z08GHrYULrzsk5t8Gxd2BBOEcigwqTwP0W4aFLh2ePK3OaIaSh7d
         bg1NLOqjgVLril9RLDKCBgY8bUeOKJ+DGxxR2q7FBwxrmnCApRgePMye54B8RBe+XDpk
         vkpatmyhx9T5u0e0zQjtWKq4j8+JaiawIb/Wmxptz4PErGXDmZ3+n+m4tiepJPyVK04w
         9DiA==
X-Forwarded-Encrypted: i=1; AKwUvBzyghjr7RIhNzkYL5bs6WT1rzfHLyUl1IucB/QokCBPUFtyDGUqdRINUQ9y7FFWO3AjKo9gEj72hLC6KOE=@vger.kernel.org
X-Gm-Message-State: AFuF++kh1cT+PDecx0UuoXbGZF0drK0I2/bSkTXW1AmDH6l2ucZ6dq5M
	MKgerUOlFg8HtGitJdCwub8NWzZAOn35uaFoluHIvYsABwSschUrqQjBTIb9L67PCdsMHRAf/2E
	x4Yfo6CWAVTnptm6RgTqaNjVrmukaBZhN9DKTeNtORpW5iB8Lmt4ZaOgfmgExalzJRrA=
X-Gm-Gg: AYBFou2YH/dmNXlM+aC+lViiiUFOk7fftbdHd+fLUKHHeC6gQKtjKPbIbGnBFT+mfxs
	HYoeRlGBNsxbeP+KPV4Jy6tNNHm6anzwK+xbB1JUAKXP9p8md86oZ8gOwSlsdTro8xqfM/9pVq6
	1cq5vGPcfRSY5V8WOBBdzUpD+iQHpzYBa+aHWX07xKboDDg2qOvLXr+rnhwcFQ+sk6odkUh8d7i
	jVHcxaIyjuQAXS1NlpNpQwvtQxNHS1Ylyar2LmxugNwsJCB3INHP2Hqx0wo0EnOyyF3XPmYxOsX
	BHKoe2b2tdcBZejzwjRyGFtLiGT0Lqcc3sMDjBTnBtUKhludxD79RpxBDhrt+4tGgSr/miq6P52
	8BUz6waikgzQ+nVFmOXBU1WDiI6/d
X-Received: by 2002:a17:90a:e18f:b0:39e:1315:a952 with SMTP id 98e67ed59e1d1-39e1e4deb71mr5857098a91.18.1789556740819;
        Wed, 16 Sep 2026 04:05:40 -0700 (PDT)
X-Received: by 2002:a17:90a:e18f:b0:39e:1315:a952 with SMTP id 98e67ed59e1d1-39e1e4deb71mr5856987a91.18.1789556740360;
        Wed, 16 Sep 2026 04:05:40 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm14822916eec.31.2026.09.16.04.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:05:39 -0700 (PDT)
Message-ID: <ad4aff4f-2d66-425a-a358-6cefaaa1319e@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 16:35:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
 <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0NiBTYWx0ZWRfX/63PnVJQzW9o
 /pFX+0kE+It/apRd5ddT+Keye0sIL5weEbvYFreQnDndtMWhSJwNPr0H3lf2q6a6c9O6oQ4QBUm
 DkK3ChSy73wYtRBc5M8WzGzorVD2qDA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0NiBTYWx0ZWRfXwnxHYFtwfLoD
 50Fnnw0tnSW1YNIE9yRrkKioAg1aPMdqAEw5TAIu/u/ZpX1PBEJJKnBJ33zmjvwbu/TkrKvgnwK
 lRQu7qD9b3G5lgWcXRGPC8AGOI4ZbwIlfjq58x+peQqHnimhD0qT3XczSUMgIdo1XO8VLGJrgvd
 6mGbZ236knAMc89hJh68/wvY8XS5umuZdwTuhWOx5oaNoYmxj0ghgYt7k0+W9QQ1p6sdFOGqUqd
 r7o7MfDKkiDGfDSyJ/mQXeyEUVe03RbNNsqmXoAep95RgGujlcvN1Ooj5DsmtYPNzJk+Wyxd0SH
 +/hH54On3zjSdB2mdTuoxgFVgGEApD7SxuYrJ10/83DcCxbRXAZsQ0FKJLjrjcRJYu62EvyKXCG
 sH6B+gte9ff5Cd7dTbVrlxJPYXNsJO+oHIAJfKzDXFLgKParHqypGDwqLd3N2k6sUx59AWzi8om
 uqBSgAy2ZOLx5sKmdhA==
X-Proofpoint-GUID: 7p20Il0QwYs6Qk0WNiPKYRpRh-39Dffi
X-Proofpoint-ORIG-GUID: 7p20Il0QwYs6Qk0WNiPKYRpRh-39Dffi
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa7805 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SFMMcejBtk9OI5fOnjwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160146



On 11-09-2026 02:36 pm, Konrad Dybcio wrote:
> On 9/10/26 3:44 PM, Imran Shaik wrote:
>> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
>> every clock, keeping them non-zero until a consumer takes over. If there
>> is no consumer, those clocks will remain active in the idle scenario as
>> well, and the sleep vote is never cleared, blocking XO shutdown.
>>
>> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
>> keeping other targets unaffected.
>>
>> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> Are you booting with clk_ignore_unused?
> 

No Konrad, clk_ignore_unused is not present.

Irrespective of clk_ignore_unused, the proxy votes are placed to RPM
during handoff. If no consumer takes over, those votes remain active,
keeping the resource ON in idle and preventing XO shutdown.

Thanks,
Imran
