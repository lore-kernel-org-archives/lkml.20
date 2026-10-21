Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560464;
	b=BJ2LqM8SOYn0r6TyH5lO0+Dx5z/2lid5vjzKDXUD1jgjUM/aNA9M9MBml1bJ1/0fRH3D
	 6PaYhh/UJD6bFpZ4Bp2HP2ggatglIA7uEBuvlG2UtjYCU78Hk3K7gwQrun5ohIifkYZ0B
	 0Li21kiP6QbMvZLXXsSES/XjY5SyWysoWopGsCi42r04BcrtIZUfgBytBSIa8z5suIi3a
	 vvb8aaTx2J7XhPch7RJmbD1YHqXGzOOc907HJJXuE/CEk80S5whw+BYGZv9dg4KU764in
	 4F0gTpjAKkaj1NRPk6XNxG0ROOZ2T3WrFPkvkGJt0NIVXLUUVvSRTRvQ3L0YtB3milg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E0J+zBC+eUWxbZgcBnl0PcuBy4H53M4vl5AH7OP7Ph0=;
	b=hI8RC6fNLb2zAWgaBM7S+NXmkVvyvXmD2iHkTqw83rRa6dimYWyEkuqgGANNxJTLH8a5
	 HiH1F42LVWnBOR10eg2mDJHdFYiVBiOkhgbHk6HzszoO/qQX/rPFnHHgsgCwmPFSDDiBq
	 ykf83buaF3CAPc3eE4wTFabiL43dEKP6I8PIas07frRf+GfRgGjPIqnSPIo0m68xaflqa
	 BfF0QiC/OkkDZr+jnm6VbOqGb9OGu0n4Fttaq0OlmigVtvwnU6WbMjFiwtVhEZkfRLH7U
	 Z3B48HvjJ3htW1nSBiA+F9xzKPQYcinsWf5byO3F3WuhhaGx+Z2+ilntGlIYyBowAkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI2HMskx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JgumLhfR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72FC606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C72FC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI2HMskx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JgumLhfR
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L4pHR03760500
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0J+zBC+eUWxbZgcBnl0PcuBy4H53M4vl5AH7OP7Ph0=; b=pI2HMskxRT1GNUqj
	g7QTRwzmFvczF3NswYP5+FHFRSdqLbz/K7H76B5fnvwzT/fWtg89gynspxrg+MCL
	XCyRbZHcx/X1P4z6jBMY7ieN4Up9yH7zy9K3dkfJzQmMpuvpSUR6FRwFrzieX9IS
	A8YVCLpCsrunBsigynp7PlaTI7Nw4NMhvYAZo9ROuqhHTZcvOGVkYNb715PwdIGT
	dSkQ3+6zYhkkBC8gwMiprZZ7kgS2WUWUSbfxWqH2wykT6vWUkl8T0rYDFz48qO9f
	T/zbOPfRxuVN6r7G6G1vHNIIODkLLm9L3DTiOZ0zxV9JWRCEBVw0ExMGFn0LN7+c
	rySxtA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r17ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:27:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dfb24dfedfso3464495ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792560462; x=1793165262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0J+zBC+eUWxbZgcBnl0PcuBy4H53M4vl5AH7OP7Ph0=;
        b=JgumLhfRIQjHXW0O7uPyqYgmOE8XqCtd2Zmj/LENvuZZ2WWC5VmB7QpergINqmR7Bq
         7BClnEoQIBYMiEID1CGZgkcW2/Ym+cMwbYPzWtMQexuoc+C/p4B7TDYSo+2qMQDNOxwz
         W1aboRKmglhCqADLxICxYHl7IyhHkIwtO5+l2x1M9dpD7IHSb/e3HsOqFYJCXuFQeA88
         QIYKb3zH7gSnRGn8dki0UklSYbZcGZZHLXh+h6sE45WKckDUUe9Yf9saiTj51M+H1QdD
         c5eq8f5bRHpsdgvqerQN4tf8YzgyRo40XVdplmpO3DmAaaZhlVRb1GH/WNw/Aoz+tYbD
         zjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560462; x=1793165262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0J+zBC+eUWxbZgcBnl0PcuBy4H53M4vl5AH7OP7Ph0=;
        b=B6kmqvflg4/I3P+12x3Y1Ih1kJSNy2PgkMKPHf/87jrlugL14Q//NSV38KLjeG9VKS
         CzBUXa0hmK2fpuY64fBlnR72FBKYDwnkL8NMaOQYrcbTxKb9LU3oIpCTHdZkQkcRnIik
         SwErjhKaEEzVOqhTXxWLQTq5/SYIB5WuYAjwygKLAmDKPE98jy3os0sCC8hVGQn0Gt/T
         rV+/QPEs1BXO3OH046B4ihYt55OdpSTIo5Zv53SafK5IVKEIlIZG/Hi7YR89D+tpUAqw
         phLNKUA9pjaae+bvgPkg8AdWT6cZhW4Usdcda3jrf7lPaLLOFc7qO1z6XkdDz8+bTeCG
         imvw==
X-Forwarded-Encrypted: i=1; AKwUvBwIVdpkyWQs97YF4tWF9nPAkso08pHO3ehsVO0HRjXZ1ius9BZr5lZDcivYFoTteUb4MSlfVhvRQzjro5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwu2wzYX7hRNVsHMmkhL4R7VKz2h3VyRcXUBh7EeIhbgIcGwAD
	QQ28J0AYqAf7amBOXRgYLempV0sNlxoXGQMgktCyqb8CjVGeEji1oGFPr01b55x87AK9R68GHi2
	UGUZlSb8W+nGjeJ+uy5YyI0p7sRzF6g95mSTEOFgv2gs6+j/J1LEf58wRFoG3IWIhgHc=
X-Gm-Gg: AYBFou08C/+ZP5pVPM1qGQfRqz2NWyvbptVSW9P4PlbBYSj4sSDDGZB5e+BEhXcEVwE
	VRBCURtVWNLYYnXuyF2W6ttiVdKCOwOykIs3H9rw6DFvzJT7KEoXZbVcMkyvOeA3w5w/uoJpQ/F
	XtuWx5coMiFOvne5ht22CLHfkFwqwPPZ56qL1bfmrKm4iadsEnI/LOOMxnCsRvhtjp44PVQve/h
	qf0tT8BZrkequBYCniRjy5ToIqmJL4iCrjh9bPM7mW7mv9aOhF9pUtGoZct1sxMc2FBe2SovxJu
	cP/mdp9g5nnn6d2RFH+JNmS84H0I4gfV5RED9HqjDrmXPLvZvWR9ZLv3+Pgtl0zllv2j8DVmca6
	MLySMLnGNBAkhtCHFs0wFcujYLxB1irq4dw==
X-Received: by 2002:a17:903:228b:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2ea43c62ce5mr8191825ad.34.1792560461604;
        Tue, 20 Oct 2026 22:27:41 -0700 (PDT)
X-Received: by 2002:a17:903:228b:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2ea43c62ce5mr8191605ad.34.1792560461167;
        Tue, 20 Oct 2026 22:27:41 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b49caa7sm5949415ad.69.2026.10.20.22.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:27:39 -0700 (PDT)
Message-ID: <4dbdf8a9-8a91-4a95-9d53-b707666b28d4@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:57:33 +0530
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
Subject: Re: [PATCH ath-next v2 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
 <20261017-exuberant-benevolent-gibbon-86a45b@quoll>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20261017-exuberant-benevolent-gibbon-86a45b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad84d4e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=86XGhZ5msFO19tOyMwMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Oj8fH_7h4JhORqckls-XaFWgzYIh9I4h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX8whPmSc4FRaP
 31UyCps4RPEbyO/oYvit1DvFjp3YgVXnqY+eeqBpllgcskounRzAXxGNBW6SMqNV6swkL8FXQMH
 btcHt7Fs75LTvCX5d4jJYBkypsDTXodIPwsJJjeUzsGyTkYGaFcAmHmzhWHXTyTq7b3lLKmkMZQ
 YFrrZA/Hl19ZyKXbqbKJEaOdSc3OgE3fN7basOLKG50c5LCMiwv0vdgxrPVAP37rK6u1zrks5Gz
 b0+fHBRwiuKNu+srONJ4D6c+9DkGwZfBQDxNNd2phl/a0XE60kwXyfmWdbS1oBoINYVYu7kYASl
 Vm8ZwlEa+rbG8iV/Gck5rW7wUQJx5g4en1cf7AFamI0W04fWSBMw5cLwyd0/gkJd1ZNqJwcvvG5
 lbE5YOse/uDG6j03eA6dEyvWRr4mgqgKQCunWQWRTHo2fSG4f7rxSMZ/zWaEOzVMHt5RG1kE4Dl
 iwOKhBCRWgTPfOUZetQ==
X-Proofpoint-GUID: Oj8fH_7h4JhORqckls-XaFWgzYIh9I4h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX1Z+PH4L2jltm
 EPlxeltyw2el5RYtqye88oa4KPgAi+cQ9He/+bSoxuDDdmqPR2O5clTzGOxx9C2ZJVVlph1Tqj2
 7uewjSoggf5MQVmD2yMUIf+9N2QZMeU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210021



On 10/17/2026 10:31 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:51:38AM +0530, Aaradhana Sahu wrote:
>> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
>> wireless device.
>>
>> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
>> platform device, even though the Wi-Fi hardware interfaces over PCIe.
>> Document the compatible string and the resources, including the Q6 remote
>> processor phandle, MSI interrupts, SMEM states and memory regions.
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>> ---
>>  .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++++++++++++++++
> 
> Heh, unfortunately need to retract my review.
> 
> Filename must match compatible.
> 
> Best regards,
> Krzysztof
> 

Thanks for pointing this out. I'll update the filename to match the
compatible string and send the next version.
