Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637516;
	b=POoqwqHJX4xfNYoME4VkbmrG30JAtt5bSi+d8s9EvlGPsg5F3KphmYr/mwxD1YO/Qj0N
	 hk3M5fc1v8yWG/42nF6/8cuu2yZTVXhyTZXHm9TV9fs2IJ3bCRJAlM9V5V7H4/IEqP3x9
	 +qP/i5/dhkQLtJ+JUGhg0MlS9p4QkEqmAnsWQNn4VZ4xNqEdrLAj2p4a5BvWEac6yEDxD
	 8zoVXbyuE4++yxxgJ4E8CxbyrJ944Z4QFb09c5q1CnmHqbjTPCczB7fegEpwPJE/CdjNl
	 h/mFE4DV01vYKL/zil2iI2qB400cbSjAEQoMvtvAY4OALS5DDz9CRdRfx1wSLq6OfWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RYH59DRywd2tcO8Con8trQ/dK8KHQ//hYqQ0KcwUeG4=;
	b=rc+UPdVyG4dYCvJnVOk+dzMzXbxDZjLZC5DWXfw26RmCCPYtWNnw9Kbbvwetobm9nrVC
	 vwLYzoALaib4bG5rFWEl7iIeg7wbGnlxwboCXOc7hUCdPBk+FH/ufVFC1M/hOoz6T7zzM
	 JLqGIkCUulKk9iqzJgR7u0s+naRxBE9AIn65OiOncvcqQyX1gQD4GRU1gVpNG0KFqMTKJ
	 FTVSJQOGg7mEUDm4gem+524rmTNYST6634kjb/3eg69AqRqtL2twTujnl2iwC4D9Kdx49
	 Qd2mWpNhCVdN+C/P3/RGzsuiw0le06ybbkvh4SoERAAhigk3rAAAJ7q+fgUGWDeFfYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CNJXcpTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNwbPXru;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE60606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE60606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CNJXcpTA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNwbPXru
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1ijs6866110
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RYH59DRywd2tcO8Con8trQ/dK8KHQ//hYqQ0KcwUeG4=; b=CNJXcpTA2NqGIjg8
	DsF6XL5RmacyN91f/g5iMEcJjRP9UzMQz1s1gxJpNOt7Ncx6gpgj1tbHST2S3d9n
	4tMii8WolkF8tV/Px5C5S2L21+gk8PSVvSuEEks9VruAKFb9hYsR2cJh8VpNvfUF
	emFOiFpiSV7dFtoaPs++kEL2gi6ozsS6F7fF+svNdIa7g4x/PZfB5d0UrtGEWtH1
	hNECfQS7QN+NFVxtR201pKjF2Dk6VaK06GrmIdyR+tkjY35OGFc2Za23BZhchuvG
	3Vr+Pcy+h/7C+eF92362gAsIV7wMh2WbXd1NkA3NWs7Av+JvEykTqghNc6f2QF1Z
	2R4ZEA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93agcmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:51:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8e16d22d8so21315125ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792637514; x=1793242314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYH59DRywd2tcO8Con8trQ/dK8KHQ//hYqQ0KcwUeG4=;
        b=dNwbPXruhGc/r24tp5UBqqV+GU5qX77/qPStdXvSW6jx0bqFmmAGVEBdwaG5xuMN7M
         5y/SkuuQKfYH/r1szjIZapFyufmdsyMMHWIibl5dPxI/b9/oFZbtSSx4ioEOKy9E6Rmc
         Vt9sMTUQ+sfXnin28tMY6SA2tnYEO18pI84bAxOkDBul03jKaH60kTtNdjKYGbtHc8gX
         4A4Geac7YQaNNxAQcmEVdHioiXNGr50IDrGeRWZA/Wp17nxjf8bVRJzjOAxjmEU8VE5P
         /J8r5f9BegJ8HMu0V5+sGDPTUeYCuYepU/ocmtQYlajvSFgp6PokD+cnsq8CuGKku8V+
         VhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637514; x=1793242314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYH59DRywd2tcO8Con8trQ/dK8KHQ//hYqQ0KcwUeG4=;
        b=uYls12E3y9SmnGBmIcPLMpZcuc5f4YQ7mhKH6Acqt5NFA2JAgL2n4iJcokRiUvcmA/
         5pJx8jcX4aM64ZQf80lncfXVcY/eTmWxg0gH3PLH3Q2i0IVjBuglKH6e2bMNAt2E/mgd
         2dy1YtiarJCAix4qkoP5WPBn4F9jBVcMLDrkwdFc0Pdn9rITYeP1JMnnFwfCJCDud+lU
         MxbzgXH14J9XxdEjVUxjyq3zTMcWMSyYLwnoXFannvdmTKtuWwVQ862FB7YQ4V/KZmvF
         Vy9AS+CWdyF9IBB3tD8DdcYSkRciNHl1ozHDFMd9n9E+QWsIpvIzjO1ZuGJEc0osYB+A
         PqWg==
X-Forwarded-Encrypted: i=1; AKwUvBx9MiU2DthBDIjVUBA+pLCxTnw2PUS1ILL3y1Ah7lNTDb7wIhCUa+4glP51UjtbtfVldw1xjSf0AgzTUAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbjTgIs6f55rASK50xXN6/VpSJ49UBTm5bFusCQn5t3Zn7y0W4
	LJVErYDVJvtVZ1rCWGeMyvy6ddbCyWlfEyS4S+cJ9ti7dnckiqwpYW6LUAgZXH7NRmmVy1bcU1+
	BTljiKy14uVgv9sNVxUG295vgl65F0TX+Zu/o5BxKqHE5uRuyPJFvU9GXyFecKZYvPZE=
X-Gm-Gg: AYBFou0Updt8xC4Kij6ZLke5D3YpUm6LhUG+H2ssYsA6wij+FZ5wCV0WaxCEV6adtEb
	r5LGaaHjNuq/YKj3V27rsPMiuO6jj0Ajt+UM9dmWmXOrkiAeTEW5GyY+p6/9y7hnC4JKNjrhNOn
	eGT6Y8K9LS75OUYZfnZBWjfvuzHaZHtUX8T6OjcQkeKFUWrN8Pk2IIpM3V0T8QN+bNZ24aBhLqQ
	gBr3swcAb3OBu1sNiyY4Ycb1OzwxirvrAfcj9sWEYdHwBk8tK7gS4vtiUWyrxifVrnMs9Z8K36y
	quluUk+GdHtSD6Mo1t3pzCDG9foz3yaX3k6r6lXECn31OhoVg4PvzmWY1ZB9XBfHSTxomNGyuFK
	Br0a7tiNfDy9pM5kaOj9NqQa3ySjd878aexisP5Gj6VE8C4VQnHdV1X6XnBCd
X-Received: by 2002:a17:902:ce83:b0:2e9:3d65:22f1 with SMTP id d9443c01a7336-2ea439fbc95mr34017485ad.20.1792637514105;
        Wed, 21 Oct 2026 19:51:54 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:2e9:3d65:22f1 with SMTP id d9443c01a7336-2ea439fbc95mr34017315ad.20.1792637513713;
        Wed, 21 Oct 2026 19:51:53 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4113b6sm17063935ad.19.2026.10.21.19.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 19:51:53 -0700 (PDT)
Message-ID: <4bfbd19a-5fda-4859-89d9-60e40950dac5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:51:46 +0800
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
Subject: Re: [PATCH v21 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-11-04fd28d815c6@oss.qualcomm.com>
 <f275d9de-a51b-400b-83ad-298d0fc9eda8@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <f275d9de-a51b-400b-83ad-298d0fc9eda8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMSBTYWx0ZWRfX/r+fkgTyeSeW
 I3eA9SSVuZXQnIrs91kEvgqjYTdsiE++zKXGbtBQ/HXZNcTYS08zA7+U8V+6pZRbF4mS0UKZBC7
 cKXkj/9brWUrgswTpRvLaALg9A3mdz84RFRXOsulN83dCwmMbFVl/fOQG5oDm4LgYrXA4XsBZHm
 G5VUFtXMj/Efg4ZijdB9lsumpzBZLV0BZ1tcGYRKiCEL9T1tO9Y3YAxjfad1P0gTcjzU/+TisWs
 Spr3ASMxYiEfZQb+Rhbor62htzW4hV+zSRWGeJSvFAcp+aEoWImeFKzF/W+N70BhZLZ2Ctwxk1Z
 RfTC4enEabLBIjJHWGFZZFntXAswgVAO6pBtJRWHuz6mybpLBGIdxI0ayQ2lz8bcmfMitABlhvn
 paj7wQLD4GF5MsM4c6v23vkgY9rOwSDGU6pGYTmu8/13LMYZBDuKbBsr0UpsDwcM78h2pIqfl1E
 J2Q5jWBbXMBHtVTo5PA==
X-Proofpoint-GUID: rXEtziY1-Svh4T9pqdrSTD9eotcAl1_z
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad97a4a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GmJ2lDigl4HxMnUU5kcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: rXEtziY1-Svh4T9pqdrSTD9eotcAl1_z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMSBTYWx0ZWRfX5RcJruzahf/K
 /1iKkkSK1Y/vNgNesRkoZMOm1YDRJ4hpUwFSjairc6uv2zKHAZ/+JkueGf8C/f4RjUu+gHuKsBF
 K5J/YLWD8Z9ht3ZZURzL435ZbxnAigc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220011

On 10/21/2026 9:59 PM, Konrad Dybcio wrote:
> On 10/12/26 8:45 AM, Hangxiang Ma wrote:
>> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
>> can be enabled by board device trees.
> 
> [...]
> 
>> +			      <0x0 0x09191000 0x0 0x20000>,
>> +			      <0x0 0x092dc000 0x0 0x1300>,
>> +			      <0x0 0x092f0000 0x0 0x1300>;
>> +
>> +			reg-names = "csid0",
> 
> Please remove the stray \ns between each pair of xxx and
> xxx-names
> 
> otherwise
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Ack. Thanks!

---
Best Regards,
Hangxiang
