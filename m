Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201382;
	b=KzAopDYTfzhUFk16X3+day0yqoQol1qgLovp0oq47QQNmDJ6r2SMMn50fPxvm6iWWrWx
	 oCdo3U+jWCHcI9oecGfwEEenhsNmY7ZQmIaMma3K4HOmSKcs6lfJGot3cS0nR9KHXaTuV
	 vTq6HROoOi8zx/5a7SfgIfQKpfFV6bhgOtaRUdVIWprhb7cnREY2KtTjsUJqcY97n0NYi
	 HvcvVOUHYF85ZZPYoEPxWJJ+FgvcbQsGrwtgB4mz/CY6AigkNUH/esbM4ib0sFfypeY4r
	 erW8dxyYI0CBGMtpb0H8oySn/PkVidK7ing9lbpcK0tbE3PHOQC2fWKzAJ9ymfLAdXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iQrl8WknYAEfdiOkOet54umzUF0swLaPr/vomAPeW8U=;
	b=lol+ssbZQgXtrlpHx6KaF9F2RbqTuZEZnWgxeVTvdbte1YJX4D8keaNcmWS8x+qgWp+O
	 jH8q8qtRfMFenXkMKSj5vM6G8POmcGBoQXMqVAyGV969y73R6+Vd3Vnqro0s7etqg7N9+
	 qmFFF0TCZF7MUAVCOSztYINj3RVnup94GjPg9RtglJS7/zMzX4qFag6sBiRB5r4D8uykJ
	 8I85EdhyQmvwe6I5ouCDT6wMHhaY5ttnv1Z4+DJi0Dd0E55KJHHU/WpZT1dDLLAE5RI2t
	 ZctG94HKqgtuirBSeGzUJF3s3O9RuaUrfmL808ZOOV/UuZ0LswqltG+z3hoDujbo92A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gDLvL3Vz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzOzSm4z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C193C606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C193C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gDLvL3Vz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzOzSm4z
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA45H600091
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iQrl8WknYAEfdiOkOet54umz
	UF0swLaPr/vomAPeW8U=; b=gDLvL3VzhU5Bp5i7n7BerrWt7HmdtMRSMLDxihoA
	TT6qp7GW1PWTHZef3cBSY0Z4eqcJ+t2gSfqS9mXCG2ckezUJnBDiq9jyXD2bfyIz
	8PRSq8dFkSNcktui6PoAs6YH+55J6BFZzSEYKNqRe5JvEnKzQxHpLzYfyNIhyhXE
	TYNNnVvbn22KxAnjZ9l/EdNuzyMj8tix5hVi5aM9TKZd1dMp2BQS7+8129xAN/Ah
	G/6o17oOEq+PQQLyz45NxcgdyMXr09p2NGMVeW4rcSYeo5LX4zjogvcn+huo6B3d
	5/UH2Wj+ARLhCQmA13p+AoiUWJ+hy9aahD1PiG37Q9PYsQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f936gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:29:40 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99082f450bfso881331241.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201380; x=1793806180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQrl8WknYAEfdiOkOet54umzUF0swLaPr/vomAPeW8U=;
        b=PzOzSm4zirVaMUoRZn9LPhXWBzaxk8JIbbRTGFFDfnLyohbulCN/vFt7sTUQJFie4k
         NtedxWAwaJL7S+NRdC+aDf9ZUiio4uzN9LVMZjcTiZiGImlsvi39EROvIWFKcROuQ6zE
         1HKaXyaaOWpfRiWZmf3j116YgAzwC108KjQ519srF4pYDfl/ah+1T5V7uHPd4/WhDTET
         Kz3GOWIw5LVeFJgtRQKp+Ljy6WRE9GbtHgp/Z4ZZ8IoOmyaRk8jqVi7mSlp+EjwoSFBH
         nSQa3ib0staDSBmy3uE1xLVyK9LtLnhFeFKa+FU7QOrUrHGXThUmU2s0gUxYUsBI31ub
         H++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201380; x=1793806180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQrl8WknYAEfdiOkOet54umzUF0swLaPr/vomAPeW8U=;
        b=aqOInHl+Y7NsolnkDqJ7Hu80SVCeKFIZ9ZU5IOhit1XLaXTe0ju2uon761SrGdjNwj
         Ne0z4uyL9oSdW/Eec65R9HhBj4xk5O2gwfoGym3kcOYbQEn8e91RJVLfwU/KxH4L6DOJ
         MhQKmMGdxaqquInH9j+rDBQ4zXPcSf/JGscE5XHeFgSOGkJunligMOxAlpBe5dr8HhdK
         t7HQrdV5xe/vZtdXQ6WOjWi0F3l57Y1MSf5/jt3ljC/EezBl8pyWB2IPx+3wr3kdV6/a
         GSp3b0qbVYRYYucnUrwF50mkdk0NzKqRM4zKBfJ0Ew9dP8GOr+PRenYGYkhManXGqKUF
         J6kw==
X-Forwarded-Encrypted: i=1; AKwUvByQHvdrYmQAchyES++ZPC56DhJTqobY4EP69GYt7lj5e3oH9qvgXEYaP2HSQGq/7VCtTNebvtgy0bxF3kQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQM8eVczHXFzgbxWBf+ERkN4YusaEC2d2qZVdGZpn+fzwv097F
	yVLWRrl3nNwUd14Wcw7qyN9zaTAkUPfZF+LW8ALHcfIz8ApEUrDkhsr7ZLcPvqgVQokCoFaznwI
	jjtONGveZ4J1nE3nMq7GoiSBsUj70gVIruMj1mu7jLfVnvT4qUX25QfRSHZwdJ0VLZkQ=
X-Gm-Gg: AYBFou30O7SUEj2boCh5uWFyp36Cx3aWQdwmf6PRJf1Q93Cx8/IMKFN6GZCqRQxgR+Q
	OKAqkwoWryWFEAyOc8UXMTOFWsT4fRp2toNKc7cZhiVfpwgGriO8EJ2fU5tYwY1maShRUJxblwR
	oq/ffN7Zl+N+rb8uJqEStEp9urO/GNYai7egf6m0KKBpA5Q/cs0IO7jjUqn4R71DhOW+LeH1URN
	2p7GIzgNrn12RhVUlh6uCqYlXfuBKhS3jLxVBWzi7uFjcec0w4kaI4ok8zRjLwUv3NchMDzGs3u
	w+DAxsbryqNAZp+hlpXVlNYWEIOU165djXDezg6hcdLcbYvVZDqDsp801BAVikO3EwNaj0ts4tp
	2mt1FwaRWcV4pbbErYqERxbhsdRe4WkmXeSNIviLiyCD9ECYi9CTivkEDXT5f7gy2LQ==
X-Received: by 2002:a05:6102:4b13:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d03a434b91mr1474832137.8.1793201379827;
        Wed, 28 Oct 2026 08:29:39 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d03a434b91mr1474799137.8.1793201379230;
        Wed, 28 Oct 2026 08:29:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92de010bcsm50884345e9.0.2026.10.28.08.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:29:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:29:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v23 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
Message-ID: <s42v57ohmpj55nsmfiae7ornwkh3wtxx6c6gc2c4nd4rlw32xm@xhyhyni73g63>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
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
In-Reply-To: <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae214e5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WWpD2f5wiKzpAssyet0A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX+6vhbIZ1E3XX
 WQDDNu2kw20bq3qES+b2ft4bP/806DhNZwrwAXbik4qM4ihpgWsE4lvSoSd2ELbhmwvS/TytJ4T
 22e8ht0fHnYprMFNGjWvlz3AyNZ+xlg=
X-Proofpoint-GUID: 2osEy9KhYrrIssuHBr8vcksJ3kYJU3Pm
X-Proofpoint-ORIG-GUID: 2osEy9KhYrrIssuHBr8vcksJ3kYJU3Pm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX33wuni2VFFzJ
 hurXYagzoSCpx5TpGRr8F+O47EK/lKGHqoX2rnGBvzQLq5w0edF80U55JnjI4zKf8VJYmMHMuj8
 Q0Hjm6xekZxZ2tsLjjCQYD7e+9/85neCWhz1SXChOLHIwxFQhWTDT5PGNI0Oq4cjbMwCI5DjKOg
 6FDyF0mk+6eNVSmdxz4RLQ5FaxOn9V8LK9UlzXiwUag59eTYEHaHgudtHWtClEIgWYc0a0QsWPA
 CJbywpVv8ONt6yZodEC8do8WiBinjuI7EaxJpsnjYlnrUN75kvxXgtHY7tWL6aROdSBw2/gm8c1
 ZIjOgVKvC983rSbnaQRftzLcz651QkTuPS0kSM2IUghe8ull9Dzkm9DJCnbicewa1hoVnHdWhwn
 UQLNvIzK77tERTxTm6g3aDq7UPeKHSThCsdehixyTREb4Fmo9l192I/cN90jSKQicsScwvdo61G
 icDJWACFpjl+n2twF7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:49, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
> 
> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
> lane mode on a rework camera module.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
