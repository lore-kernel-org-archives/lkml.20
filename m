Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023317;
	b=KQSh5gxUnQS23OXQO0hyVRisQa5Euqz6aVtaFZyHyoaOJlXjXsPMULdYkNqwv+adnhva
	 CMaaud1J/7ed3rHH70rE0OXm0YRVanDuKmOO5MJeC8Xh6v2RMj34XLv2QS2fRINvb7wPY
	 B/G/kQgMNKDyQVTnhy13yZbh34B0MNo9ww/NQnPiy9OyHKnUxE00+K5HZahkLlXU9rjfZ
	 nLK5p7KH79hIHPUp/dbcucohr5BowdGqlF2Xn4Qt3Snpdjpuv7axLVCS2JWLr/FPnbFqt
	 T+nZIwvt5V9205jHgfcOCZDSR3Q0/0jISKWMXbF9M7SehWMorpUZb10f3LFtMVklFQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ghBeo+TK4npvaXsZEpt21+g1yXC6b+Urto50LbpsTK0=;
	b=XG0601cK/wsI5YWHxksJ0OoqBopTXlW2ar1BNKCOjLiAmGHfoXFdVzlbZgCmcw5/Rs/j
	 V5GcbUXn4ptinxm99mhX9aEMRzeqym3ePZ29RXe+30nqDY5ZeieJtiUu7yvG8jp/gve8g
	 f0kVoXnUd7MUPaUI5L1V6kEr4pQATj6P0d/BNr4S7Wp91nozAPWKbakLiKeLH5mzwZG2b
	 hQG7ZBhw96AvBvOWuoJvinJxdUCOiIi7DL+h5htWr/ZSsYCv2/7L8LaKCQCOufCQ0P1Gv
	 qHNQis4A62y2psm3CwjKiUl8LJEx2e3vHntwbauxcreLfMoDXK78E56SWOH2/PaU6wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P6mhZ0lf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O+zoa0X0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF56606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF56606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P6mhZ0lf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O+zoa0X0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt1W23631981
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghBeo+TK4npvaXsZEpt21+g1yXC6b+Urto50LbpsTK0=; b=P6mhZ0lfV80JodKf
	qlhHrTNNTaPjsSjPQpgo7tBVjmWl3MKkJ5obEIvI/tgSZrkHAtB0/n/ydTk9RqfX
	f3clKbcE+Be9utsUDOiGiHU59Rl+yj4chbCiY8tufsWz2GKS8hliy+8Ge4CKpER4
	7aURYfDu9QYTeOdEn/57LT6/PEbpps3nSyZsev52EU7iAnhes4kICSBdx024/n5p
	bhdMDUs0W4j7Kk/HhklqYBcTIAmWzGw6jPF1X3QoaFKmG9qbs8R8H2ESFn+s62xQ
	lAZpSlwQIDA/JWWv66UzUeS/rtLE9WxelSIT80+6L4dQJTq9gtzfmjBonp/pGonn
	eKTC4Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf0uw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:01:54 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso149563e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023314; x=1793628114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghBeo+TK4npvaXsZEpt21+g1yXC6b+Urto50LbpsTK0=;
        b=O+zoa0X0GmaUXb+NMh2Nc7StA3H6od0Qgt5jiqh2r9dBIfFIgWdVFCflnuRTu+bLCC
         ZVujLW8OLJHyCgRdf8+ChgC42WeGZry0EtLdhSkN6LPJBsV+0XnUEz9x8PZ5R5a3kkhj
         iAHWUdGkXqouElxMtAOZwuVsjvxhUJ99EibZztgVFJJmEZgAoU9BWaLNem8QvNrtD2+o
         VIRSefsq8O1Z/gIcLC1PtXKiytKhFfbLH1m5fS5YjbzGGxqPhNlkaP+vGGlreIixpEiJ
         IuvTlLcPvP3or7Bl4ufWZBEb0EDqZ/hr+fD39n9jgyQnKd+aIZlh9Zvj7DBD1xeW5Ln5
         3uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023314; x=1793628114;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghBeo+TK4npvaXsZEpt21+g1yXC6b+Urto50LbpsTK0=;
        b=ocXLU6Vv80veVwO7e7hfsE9Whft8Y03dXfTNB5Oe8/5lbVElNMKQbCAOf8MF7doTBW
         yiSLKSdvxHRzj70ZDgSF7rBElr/LGAddrp1Ttsf6/wAIMMcGFC1KOCK2e5nfzh4U0JQl
         1DQzIg2xX+fdATC277JViiV7nVZKyem8NGIbPuhZx5mVx8fpm31efDfePPUmIYcrTa+a
         uyLB79KtZ6uKP1o2GZwTC1kf7JI0jhNQcHgsA97AVhvxxbVjUzkDx4paE1urV9nZExKc
         Gs3kR+sH8FKezNV/ehEUwL2BCxnjpFbIHfcb8XJwY7DnG+P2U64OhCVjp/Kzry15C5mw
         ZTLw==
X-Forwarded-Encrypted: i=1; AKwUvBxjB0PZ1PxxK2bIELP6DX332ermOu9xycz4URRaeN2YET4C9P3WJJnDEsFaUdrh4ysd/Cyss3tJ6rol0S4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKojU2NyVW0fZH/nfaOoDky0vICa+6uxVN9ALToFyMeY4iRmN3D
	NuuCoYcv7vOTpyXrO33uxUgSUyrSInhO3wVZSu5rcU85cFdbqX54yzLf7kTo+P1PDgcHgclCeFn
	E4O+EOxtUWCnhrueZu+mZGv0tKyNbXIajpfIVqRjfWW1b8hFChm7sstfJOKCl/kxWC2A=
X-Gm-Gg: AYBFou1RbDM59X30SqY/r+nCKpruswN9j1FMi6mVlw0FbphNcaHsGA9yXVHRT6DA/82
	V8yKO0kK6o01tOCJEZ9kPvkIuqcbK8d4G0gxDO8+qPk1sBUKQvPeD6Y6/zDO3RIlIjgfXze7l8i
	hGItYNCOhAQ13k7akEpQh75iXVX/+43hNxrjC7HgcWNREI6ysptua1JmJmWoMyMHmDYDrpfmIJs
	JxPlBz3Ftdo3j4on3gW5V5K+T/QVZrv6wltWKmwZj+0P6sN2c0Ftmh427LX1/gAWRArAAf+YoWN
	I0a9Dq53ORQIAwrWijQ8jPF46ckRR5qIYjHUjp79q6DtoHNvlAn6QRTQxVoW/1HgAmNO4k09U1F
	P35XKCxeMw575QebaZRdKmw==
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr1986250e0c.0.1793023312284;
        Mon, 26 Oct 2026 07:01:52 -0700 (PDT)
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr1986164e0c.0.1793023311680;
        Mon, 26 Oct 2026 07:01:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7984f5sm322859066b.77.2026.10.26.07.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:01:50 -0700 (PDT)
Message-ID: <7684f3dd-e5c1-44ae-bc05-49d2ce64af24@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:01:47 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add initial Nothing Phone (4a) Pro
 support
To: Oleksii Onchul <oleksiionchul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261011095221.24767-1-oleksiionchul@gmail.com>
 <20261011095221.24767-3-oleksiionchul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011095221.24767-3-oleksiionchul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NSBTYWx0ZWRfX7Vxg1h0io19x
 TCZFZJddkRTCNulDqbPak2wvLH74P2rNH7TiNMolkrPdLj4jsSaktSqH4zZMqRYZx/qxbszVa+x
 URmUh6qoWuhK4XwKi1hrydJj3djcJRI=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf5d52 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=g09VQlvOWAvZh4W_s68A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: CXcB0cjJpR3BMWw36FItO7OAGKpHAapo
X-Proofpoint-ORIG-GUID: CXcB0cjJpR3BMWw36FItO7OAGKpHAapo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NSBTYWx0ZWRfX+9iPFS//da1M
 bc7ajtplNj8RqPXvz9BaINaXez8BkvvDFifyOZTaV6FaVTmuFSIc7eHmzq0jWwa27R3l/kRfIwo
 x8gdg5sz2daHNbaM9ViTlvmeGgGbkn7BUAHkev9htDpHVbin8+0cJwiKtW6DJGdSNgsqXa2drmQ
 zzmyL9YrDs9ZRd7lZUaVllWRh7rgKmkDuw1iA/Vif1u9NEizqVqtli+WI7pEUzvWjTd049sjlej
 XTkcDbXuuY2fwHQFAopAMv6eSl4fISyOcDl8EAlY/fxoUBPaeIKHYy9zTF8MJJPO36OBMlN8DUY
 cnGxjLqyYQv4NGJTinq/Z4VP0P3DLkQg6I7+MIX0ozb4ruiQlNmGSeStDJNsnsLTUr+KFB4Lak8
 W954DoC3gaLJblBrtk66Jc9LHFaxRBU+B6mFe/JtZjp+jWt6Tdz1EylKk63YYvmz211lYvbwlyw
 4o4e5q92djU9DlE/xIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260055

On 10/11/26 11:52 AM, Oleksii Onchul wrote:
> Add initial device tree support for the Nothing Phone (4a) Pro
> (FroggerPro), based on the Qualcomm Eliza platform.
> 
> Describe the UART, GPIO keys and reserved memory, including ramoops.
> 
> Assisted-by: LLM
> Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
