Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE6047F791
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473031; cv=none; b=cDQcU+ytc1A0uMvx0QBfXk+Gaj0gviXxC1+BOb+dobdt24Ame3ZWFXvW3PjC0Y6yyGHK5DX9XNZn4syt5Bl5PynZA/ABmMiQshPsLR2FaFhmue+Gy5w4vzxwxttTTt1HkfGLAoojpl7uFvnkVActKHWNTBLNuDLWdsf+VEokqFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473031; c=relaxed/simple;
	bh=d8eY+N67prVKWYXmMJH5sh95clXQWjAYYw4e1bbTxVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfG0C3HzXQowLd1V51I4w4SbiTfsBITMhbF3W/02IKbBKSgXUl70KAqYkjWb083C4LyBqfcw3Ofj6tepYWmOCczlkKSI2VukZ7cUWG85PJvCiqhBZ2oDW2qIGiwh5vcu3pWoisLFaac+0oj7ph9y5LeaO301XwDS0x0+V5PpRDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Clx0qpw3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wcm97qKD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Clx0qpw3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wcm97qKD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h4ov3415761
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vAnE0uUAXuxlA2XcXnWd/0pxMeNaHZsw6FNuM2AnKN4=; b=Clx0qpw3J6vrNonh
	hpv8evw1N1I392+IdDs60nMfRYSw2Z9w+udKqycwb6Jfad1LNbmm4cHY0bJL3TOU
	Uj0HAV8N802PRy/R6KEA0fkKEmALYCKj9uFBH5+XiQn/hJUwWkA7FgH6v4tbRQ4s
	oSMrGT/vcUqF0eEa6h1I6FmAkRhc3PyHKLJgTuGDoxOo+tWJwv0FLL/CYoFYgnOc
	ZVUnLf4Zgwf2V8wC2WGtWKZJTkHAmVwmj3yNZFBk/BLFn/eDcvU30F0t/02HEdhl
	lMLibdWoXikWTwc46tGNBZOaGTQkBZkOEjN+dVMeKKHpTIg0aRkAH2J8njyICx9Q
	R7EClQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc0nmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:50:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86261e66700so3904141b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473024; x=1790077824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vAnE0uUAXuxlA2XcXnWd/0pxMeNaHZsw6FNuM2AnKN4=;
        b=Wcm97qKDGN51sq5d5mZsM2dFmCOajcUbBPz5qzc2YqiqtGk/Q46ytPaFN1/1XrI6sF
         ZmZI5q3V4X1QxqYvZBgi6f/xWAROEPRxlSLq2R8ZLrYbk/CTA7WKN0hGjCk6c5YjRZ1y
         UqrulqrHqx0ip2aKGb8Zm/VfqkZcEAqninLe6gVzh5fIUmn8091y5VJ1SHinP8xKifqI
         3Qn9pJ7aPvh0wsWDxGo4BxY7rLJc90bA0v+etOc7RLOZO/RFR6aCNrWeFQ//Bfdtzfar
         0xh9ttNvgMxasMVxMHkCe0vwZlKftOE4ERiVjCaD2pxwaE6G0ChbowjjIVnQ0AbAKE0I
         8UYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473024; x=1790077824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAnE0uUAXuxlA2XcXnWd/0pxMeNaHZsw6FNuM2AnKN4=;
        b=YLt1oc7XEIcjYlB+x7DdPhxyJSJkpPkXORiozHnyCKZSCBhn/34/fsxYqACfuCYzyp
         leflvR+iBq9JTM2E1jD64MDUxGQb6D/fSebytW5M2Hlty/V7xFNTs3kDstx0kbcXqxb7
         fPLVqQSmeIOhCVI05eT/7HIafvPsPRMeDnGMdwbdDNKbyhaYdDk8nOrncgZGX2B26NxH
         1P8a28TWuEuasyMSipq/c/NPNU/S7MZqzg279LK1RVLfAYvfSXrsLGJOzclMTU0RsHup
         F4oCsXDPB2VzLdDvQ8RX8LeGrtmCcbmwvZYiCXLejcXSqA9MvarL45nr9XhSaFn1z9a1
         l8yw==
X-Forwarded-Encrypted: i=1; AKwUvBx70cbtccJ+aI47GoNj8yNHUcgOUNglRLOSVQ+LfeZGpabUIherZubW4eiScfPNy1mqvubcQQ9BbTw8Ruk=@vger.kernel.org
X-Gm-Message-State: AFuF++kZqrQIBh0pikuqI3PvkTCERQqdd7uqyNGWWS/RAkaQLWM54pXa
	vBjJhgeeNxw0TXwXUNf52kdCKvw07Mq4OFHlhTASqF4blgXuqvNpUhjK6QrD65l1+f1UmMpaTWR
	qeVRy7nRpTLRzx4i2OnC1Poi0qlY9vfAlRq9Pmk+qRyQmaAQisGErgSJwiyQW3NwYCAvxsZljqs
	Q=
X-Gm-Gg: AYBFou0GXIq1pkOo6ClaDAiptj3ko0dBUgKWJ+ts/KluJ9yT2ScKWRKyp3yxSLFSBPH
	4kq1MVEKTMt9XGT5PWYEGDp4AVmFg+vl3fIJAwmctk0Bwk5B4MF8J3C2HpPR9ClhY4IploH9Oy+
	OPXRQyJflJXYiCf/o/biE5po+jiLxLjqRnZWX3mC99LyJYcHnKoCGvp9vKhWfJW/kZK69se/90s
	MxPa7Z1g0of96S3uh9fyNuh2N3OvGu2B3JnpaOLYew8tFAiYHekLX5aGM7UX2AdEiEnYWVz7/bC
	WvAO+2F4sP52UhaYBR8hvyl7xElwk7Pk9a3gnLDqNs7ZzRI2pm+iDn9ZzTu0U/d8D4Zb+fNQjqC
	ipvfBaRiSrvJkKk7zverqSmlZ3KCM6K2z
X-Received: by 2002:a05:6a00:1828:b0:851:8394:1696 with SMTP id d2e1a72fcca58-86f8481eb00mr13328384b3a.12.1789473023517;
        Tue, 15 Sep 2026 04:50:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1828:b0:851:8394:1696 with SMTP id d2e1a72fcca58-86f8481eb00mr13328323b3a.12.1789473022970;
        Tue, 15 Sep 2026 04:50:22 -0700 (PDT)
Received: from [10.249.97.198] ([27.59.63.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b5674bc2dsm6188135b3a.59.2026.09.15.04.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 04:50:22 -0700 (PDT)
Message-ID: <37ce680d-42b1-420f-b42c-1ea4aca424db@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:20:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS
 RCGs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
 <46c248d9-fc74-4f3c-85b7-8b678ae3c723@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <46c248d9-fc74-4f3c-85b7-8b678ae3c723@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9aaHVGOM6fwIdHYp8TFYcaegyLLe-B8D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3MSBTYWx0ZWRfX77Wqa/57k2Bt
 olfcti1ugIoUDIFf7qfPgb7lh9vOPQb7jw+XXzr1uN0ZFqTwcsGG2st6nNL21kxTtGjhpHxsZaW
 qHfvA1SFIuoAzyxzWXQ3nu6eN3ebPhE=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa93105 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=blbtgvcJIiEadBFJWCYS5g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZpEcStechgvjzwklZV0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3MSBTYWx0ZWRfX43CBvfWhHYRx
 mvPD02ws8A4tdwY7xZH8zTTa3JHahQxBi5Wq9U3BhqmtKD7KvIFHDaJLmhFstEqoSIWtAVhJsot
 lHYZ3oK06sAF6vWAqIvJ2WTQL3UdiDTXyDdhd+5+4caiXBBSVccW5HFXy4zXz5GZZ3Lzqt3DU8x
 hqzzAOp9XaiLLemF/rC2lHquQMPVlXw/Xb+LvPSwOsK6/fciO7t3vp18I4RhHuV2fOH2pXrXBuW
 6fQmwlOfzxwfjT5lo/m71erD4u1xZc2kHj5Zs2g6L2NxffmjPHkflU2s7ouTZGLimeJ4zDgzR/z
 NeOFEsVqFiHXj9Aym3r+JlDYNiiFe43M2ZO+m+x3kAr0rEx94QrlOtJ0gjKSDYlig2JQL3tcGbo
 y4FUhz3PWpjaI9XbdUYrcNkDbS0ZgIMvOMeE1MQnP0bckZWCzkVnIQOnisnaY9RAMsrv170G6uq
 Auh63kHvic2OSBZlklg==
X-Proofpoint-GUID: 9aaHVGOM6fwIdHYp8TFYcaegyLLe-B8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150171



On 9/7/2026 1:32 PM, Konrad Dybcio wrote:
> On 9/4/26 8:50 PM, Jagadeesh Kona wrote:
>> Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
>> during clk registration.
>>
>> This ensures the RCGs are connected to a valid running source clk before
>> the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
>> sequence.
>>
>> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
> 
> Is the no_init_park variant an actual problem here? When reading back
> _CFG, is the parent preset to the UFS clock (which isn't running)?
> 
Sorry, it is not the problem, these RCGs don't have UFS clock as parent.
I have retested and realized this patch is not really required. Will drop
it in next version.

Thanks,
Jagadeesh
