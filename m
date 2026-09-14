Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F444CAFB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388630; cv=none; b=gjHxQeBtUwsM0IQVXHyK8yogejdWfqbqey20RJs1DOPribxfH9vOweOCHMK0/YP+kww1veEgkWWarOMcAO9bUu89GH5ZwelniA64KV3hgSRAOThLW/yBQwoeeyd+tTm/m65rvqtEmK8xUVEjjMin8LDqHlZfSKjHvFB3DbavHJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388630; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+CeYx3XVnRrkzxxDXXT71ZnoAr7dGKXCQHj5gVBsh8H0/X0XCTeGpWktArSUY4DsjDCFcn7rrYzQkP9QNcDV3CfusfIxGyJQD+avCOsFHGrK8DorDqCOKUcvW/y4Q9y7SlUUiM93MYu8+E2Yj5rMZwAVMEefYC2g4yDMaax6zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7+c01c8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRebTJgg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7+c01c8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRebTJgg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRdJZ407460
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=a7+c01c8q7bTPKCI
	G5Gt1FaLm7zW3aMHTDxF9VwuY3dGCOr8rSWw8UazEJczKKbJBvc8zHCypnqNOkpY
	gVUV9pJ7kFBATEpjedi10gGKVHMaXriQENOAoJHWFFg2BK6JAegUHgyT8ZPJmaw3
	164Rrr4/eAEi7BiP07eWud9pqQcPxGvKk3aG4EGyPYQeltlDOgG88Gdh+BVIBUbm
	UzYZREvi0+XCe8D8vvmL19TzO0UVoT2YqRGEeP4sw0O+Ptb/O8wUVSdoGToXXocZ
	1O5K2PS7rzD3Ba+krb5Ehd0VqVhczVKWph2VONihnKQBwXbyH8EohO121/CMaHww
	lbjzfg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr5fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:23:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-74ab6065f97so56159137.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388627; x=1789993427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=gRebTJggtjbqIyOzNDEZKYWhag38JqPtHMGN2kFeDM8j8QHHQAOYPSKtbOjd7p1sGe
         nKlFrdy+DnKtuQ9sK3C/KK4P9p3S8Ym/LqyNUKt2A/tXZ8+O4uqZMJE+DsRupmTuMBHo
         ZurLVk2Llb8OVhbObVaZYO8LrFp4JIx1monBY6DN1qXdQnVAypFl+ak6C1hXC04ay/iV
         gwTv8/wUW1lMRZUYad5GTB5YSf4ehygyYyaQ2HOkmbB/LRPfX5vYIWBBlv/oTAse4LMT
         3y8ccOBKDuniQt0TlQpffG/5T8Hqd8oREfHapKukY1IyKoqXZISpUFbL7Cdm37wpjQ93
         5OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388627; x=1789993427;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=qYORfcalhsl50o0j9hEM8J340ozQmU1/Izj/A8dom2Y4ijuoD575aQXummWkb3Kftx
         3HiPkPpzKJ+K/G6WvrxdebcIcFuMiKlh6g0uyb/65CQ9tsiCUJD8kf6Qv4DUea/eO8p2
         AteFLHklRNz7ZfRCg2FYKF+7C21G8FfnpFgvYwZX0LZ9QL501NSlVuz94htIx7DrweHP
         7aUKIivBkfVRTtMaV8cjZl48CtlgFTQrML0ZqjRG0bd+2LA4Efk9WPlIykvXkBQe/syN
         ff5OjSR+3luMbVZgm7hJqglfT4U2PAYdXo59u6SOhXYzHffO9Dl7FezXUERvrYyAQe7k
         2hpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXkd38OQ0724/HNKTVR/SdTe5Dn4MuFx6i8Ooi3/Q0BTXNGf9t3M4eYAdUznjzq68zk8V0Q678aeGGPY0=@vger.kernel.org
X-Gm-Message-State: AFuF++nbrjCRtGn+Dan7bkG4hqzpKUyFFF3BGnZ+WS/NELZ1agJQBquH
	ZGfEBwydtBRHsEq77ymEW2Yv2Z4vIgcCGee7ZiUbA3gYVj91n91sZmSiVEpcvjih8Ebwq2tD7vy
	QnanOEf/ovzioAtNK9TX6KWDTvQZNveelySu2HzCeZ+++eWnsMSZJnBV1xlPBuAMRHd0=
X-Gm-Gg: AYBFou1Za5Taxvu28kMbWUwhMsL8hQUnw0fHkUyCXlCww7dcclESpnF9CxglXOpUG0Y
	jH0FwD4LB7cOpu/mGf2uBvPBrZaQyonfokCxeMTm5z2cw3zbJ9lzxF1f2rrd5H49/5buDwGUuOK
	dETBuTpth95fIb51oO00AOYwnzZoxGgxXXqIR+jjrHJNhzDWdOVwrNYkdKXs8uVYpXSFgxVjosi
	NbUKMQHXBQARwsPyySL8UE+/svyd5jy6QV5CwrygWApAG282zmZzF/53nBCaJ7VsO/f1BO6pMYQ
	KN9j1I1QXSM+Jgg2dPbiDeNfDSTZyigKgSPOfneFXOnJrRysqcvLNevvh35QrxZYBWMru4eE6Io
	6QTcvLqZTL60aZuJkb6dkpg==
X-Received: by 2002:a05:6102:61cf:20b0:79b:b389:d6dc with SMTP id ada2fe7eead31-79bb3a86286mr219127137.2.1789388627428;
        Mon, 14 Sep 2026 05:23:47 -0700 (PDT)
X-Received: by 2002:a05:6102:61cf:20b0:79b:b389:d6dc with SMTP id ada2fe7eead31-79bb3a86286mr219117137.2.1789388626970;
        Mon, 14 Sep 2026 05:23:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046c5e6sm2399386e87.54.2026.09.14.05.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:23:46 -0700 (PDT)
Message-ID: <8589d677-5c60-40df-9b2d-6c6e6855cb28@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:23:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/31] arm64: dts: qcom: sdm670: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-8-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-8-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DmNMh3l2j6uDp0vrniFBWPv5G4KWZ9An
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX+lSaa4nYIfFx
 ogcxfYZv0ZxIWgWa6EhBFIiREuZ4QjXywzYIavoo9jo98i8yqCoAsZBBN0zmOtdqPcTd3rTRoN1
 Ege2y+PkiddNcOtVjtqJOJbchE7SdioyfSp/KEqcpq3JzdwnyJNwWXIr6ttpj7dJzhkxHYAKRDV
 eVN2jTqs9WbcFeCK9fdk57idAMuBY1x/NwgKNC2pY2cjY/7u1E2Y+RSbx4kQAzkTqfu84yPCUe5
 bEZMLD20kiPXQ25QpZRr9obu0peWpIcqDRvmfCeJuRe9M+9jo7K0qvaC+Y7mGfjm+89o98WGIK+
 yRlaS2V/cgE2IG2IStYbgaAAumd4gPwYppXFvDXEdoywYqdCkUi0MZEYrWEZO19GTvHFGz+VZ5B
 UqkaVVzvfzuyoM57h3AM69SHLOJStvEukLn/VQ+fvRZDnknbQutGFCn67RfGX5ovASsMitqlXIO
 WSOK+QtNKNHMF6jj2yg==
X-Proofpoint-GUID: DmNMh3l2j6uDp0vrniFBWPv5G4KWZ9An
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7e754 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX+0KWcdzYCtfK
 att9D/r5NsCVDqR+h2fvsJhFdSNQsRWCNGmyjEFcux8RhZr6VSJ7vUVZHax5wmcvGrT0UkyZIm5
 DlOH2nRHPF6wtF3mCHpHjVB+yE1/uwo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
