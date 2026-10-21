Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579236;
	b=E2XNZifO5Dt39jCoJGx2gfgZfz1StgwRdpkwrYtPuRmQTwrk9PQnlBU52Oba4fb3jRz6
	 rd7XngzHmfP3qJxwxjn90OhIIhY4zZUpB41G0dH7K7RkKjClpO0KqHND9y91hK2EQ7G9W
	 hjPebBTO0XXBe9uapGFQDo75Trj1Zw/jC6QN+VRQoxr+Xs4KReJe3yjXbZ1i2d7/hFHjx
	 CWALNJppd4uDfvw+GiEErj9GBz5Ddru+gbjL410BvBFdWVX6KKoemaVEDBT8ZR1AltHLC
	 I7rbT5JuagU4CZUr6roblDvd0t9kvG+Z6VGlCoewv7il67OqHe3I1YhLeJsPPBDZMMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P45yLE7bX2jg89Q5FDRZgtsOepeDMPIqgweCApG4q7U=;
	b=MKhCam3arMod/Rtfx38/fsSyP3OqDdp9+AXNNIdGx7KLPg/bGEaVHCqprxRx8kqD4PRz
	 xh6+XgYQPgjmRJIcZoy/2jvV5EEHMVjAVkCNiTRoiYKn+1j2gAwpdCDOxl4gBNVb49kRf
	 wbN4vmVgmWk1IQ4ml1W5INunqtZW4FKmAxA9ezOz6dNCQB8rN9g0W3y+LReSKGuwxCTW5
	 PYUz9fDhpxbLwBYb039QfKZkk7lXERjMZqtGtM+b96f8yNOPp6YCpnJ7OFYdyfXqCeYXn
	 2iiyZvbLAagoFMuG8lT6ctZ3ANw+sYfAc4uG+ryEee5qOsmt1Q/eRZ7bIvAIqhdDRLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BE1da2Uq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdY8FT7I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4FF606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F4FF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BE1da2Uq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdY8FT7I
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5jeI3015966
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P45yLE7bX2jg89Q5FDRZgtsOepeDMPIqgweCApG4q7U=; b=BE1da2UqOx1uy7es
	X2wfqDUEfsXMOZm6cNjYguPfMSk1Cvc7jvPEm7r5UCn9SFD+07zMh2zXOkMksZIT
	JTUBr3xX47T4zQ1Q3kXpvKGb4iz/i3Od8W/xRQBLxIKpM+4ENQhF/WowvLO+WB9a
	U+oFCYYaQ4HsM4rvdRP+wina0FtNf8ST7t1Y46WGQdpAvnhIl5wWUUB2OAdOO2Bg
	oYqFXJwl75HTdEHRPMFYC3lMRdtf8I9XlWxvllqlOg3p2LdVPgRaoDanUKb/I4eI
	QpTC95Nkq8aqg5Lk2fFUFhJeTha4ZwbbpvZXWFk6iyzx1GMefV3KQbWgxu0wc9d0
	Ct2DKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78mn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:40:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536708d1a3eso1758051cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579233; x=1793184033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P45yLE7bX2jg89Q5FDRZgtsOepeDMPIqgweCApG4q7U=;
        b=XdY8FT7IgWR+UsQobf3oerZYfvgVzOCqyWHw9YY9PsA2hxi535zDmmkNiENxw/rP2X
         ffL3s5HcRi9UCnF4TojngshU0NC2T4hEQrSyb+Vj1/iuP6Whx3+2L5VGyJFcoolZBAeq
         T9M2wIklDens5pxiWQWQRdGPIgxVYsBYmslv+jrzoN2qfcQqWg/cF61NeGMZQPNOFarX
         0b2m1HUfIO3VkqSxT3fnwGw8grW4Y1Bi8VR5S0ZQb0qw3tdH7bvpDAaPx9jDnPbXb/Wi
         N7/m3wY0VxzWH104ILdCBhqPH1LFeEj43MHpUvKau5/aLSAnBMUy2nNVsvqV+JW9hQiW
         cPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579233; x=1793184033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P45yLE7bX2jg89Q5FDRZgtsOepeDMPIqgweCApG4q7U=;
        b=rrwBHHFqbiFAqIoFTNzzHWS6DoHJTjM2K2DOo50yI1ofBmZkFW8Tv0CjdyASbGFQza
         vN7+kwak4jxxyx0ZltsugZgo6ZyzZazaXuyefVyRhkfY5Su0ZiwXyoiI/7gEMHGbtqYY
         Z9ReCDzLnaN0Q5ol3cS3o8NVUBJ/mz/xtpZnrjegsMVKAEA2A56HmoGbPIAuOtKW2fU2
         zUvVS0diyJfO8kI/kM6b4hIgnSeyuE0fHW/69ohB5z09bKz5cPBra65Ivy7IYTnD2nH7
         UevZaf23e1JIrV9CfrecUjx807OnIwC3ctHkEKjTWURQaOFxyTa09HdtzmiEkZKKmoav
         khpg==
X-Forwarded-Encrypted: i=1; AKwUvBzen+z1Zz/hpRRRuYrJMfiiS52NyeTbWbvkgEGmIH1qyH9CQd+DhxYWSlEJeR0HiV6/j4rbed9hJhl4BUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJp2AwjyrrrdYAoV5BxV5VqYu41LOnut94RXlxpJvtox1toas2F
	RB9R9WBxCc0wGrR0RT2UyQMUyXjFNrCFebQBc2nJT+OgLnha3bWdPAnoTbZyXpMr42K91xogPBO
	EDNrOB98VnovQOXWioxD1by/dhpMdy7YmO11WjFDPL6M2b1chUngVH4d3x99FSIi3D+2MI49hxh
	4VwyED
X-Gm-Gg: AYBFou23OhUYilLxByvlbKgHNuTTOaJj6MgzN78/wiNBMTkT5KKMDO5qK+i2DuiHlCX
	zkYTBYuoMtE13qhf260s35O+nJqTsSJmTGYw9kSb7SWYEFBbvdNt1GO3jW67lC2uKC1JSk2mZry
	N5p0e0GkHOAmh7v5hS4yWcBwXkCgyXXRl48jLeH0cVWzYZUQzmOBepSJ2JCPg2QBmaA3BRyLlD6
	qEkdnDjC2d3hlDpYD6bigrRI5xch2GiPr+v1ZcmN5WczyL5zbB07RzW7GoUnAeR86Ygw4o/PxIf
	s4BSIESilhMl+Sdlnj31S8LcuBSNAIprrE/BcC7+PTu8CoVwI4BEi0YdPbDhSU5bopqcyfp4HIX
	JBel1iOa1NR5q5IQEod9upw==
X-Received: by 2002:a05:622a:352:b0:535:fd16:4393 with SMTP id d75a77b69052e-5369b900b2emr27770821cf.5.1792579233631;
        Wed, 21 Oct 2026 03:40:33 -0700 (PDT)
X-Received: by 2002:a05:622a:352:b0:535:fd16:4393 with SMTP id d75a77b69052e-5369b900b2emr27770511cf.5.1792579233105;
        Wed, 21 Oct 2026 03:40:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fd5edbsm62672566b.56.2026.10.21.03.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:40:32 -0700 (PDT)
Message-ID: <7e16a0f2-4372-4e8c-b0b2-e906eb5947f0@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:40:30 +0200
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
Subject: Re: [PATCH v3 2/7] i2c: qcom-cci: Handle and report queue
 overflow/underflow interrupts
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-2-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-2-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r6Ea0ZKQrsNB2qdcdKBPlABMNjiOhiSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX+4EaFgSqFEj8
 ClhjBXmJKvwkpWxKPVP3/vKhkAS9cuC+vKZMatPbP2Lz4hux4Vgejf4Hm4TYtWz6quy0mUtCy9K
 DaHcUUnZg5D9jiMohxtIvrFm7pRPFJxk2RhTCYSsT+QCxb3SE8MexKbP4hNW6w9LLMWvjXC28z7
 fKtwxtTGFejxdoqTfB7KsBO+Lw1ySysCNzp7Xwj+XF1vIx06VHueUKMYtJvI9lFTPzygHeI62WY
 0ZqPvd1q4QBzwn7f00lIUS3drM3FqGGfpDC2JHzpMx011qduZK2wQe9R+uhHAdSBpkxMmY+Hif5
 iPNZwiBtITlbY+aCbpLYjABfQSbbv3uk1Nzs0iFDJ58bD0aXMQr88aCgOHDu8Yd8ZIxFVuUhxqx
 gy5FqQnlbSdc9BeRqIb8CIa0f9qBcaU3fnQtRd0KGA1DTgcFWjJIYg/2wDTdF7AGxCAbL37EDwQ
 s7AJNP0Y60NZ3cbgsgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX28t1xkilX2A3
 8JPTQhdUHgwC7jIVcaT4WzjZzweH/Wz6L3UBTTTvU4hZ1VMPnz2FmnZoNoVziriutpBH7GT8hEs
 aiLHl8yXGq157a6+8gR5qwb/C8e4A+k=
X-Proofpoint-ORIG-GUID: r6Ea0ZKQrsNB2qdcdKBPlABMNjiOhiSc
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad896a2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=onP3my_JgYVhs9eJtSYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/16/26 10:00 AM, Loic Poulain wrote:
> CCI_IRQ_STATUS_0_I2C_Mx_ERROR aggregates the per-queue overflow and
> underflow bits together with NACK_ERR, and all of them were
> handled the same way: report -EIO and halt the queue. There was no
> way to tell a NACK apart from a FIFO overflow/underflow in the logs.
> 
> Decode the individual overflow/underflow bits for each queue and
> report them with dev_warn_ratelimited() as such errors are not
> expected in normal operation.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
