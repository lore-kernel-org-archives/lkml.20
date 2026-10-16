Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68AA3DA7F3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152366; cv=none; b=B8Hl+S+08l4CYLLKUJR9Je9re3+OzHh3DL16TaBHiY5ew053hC4qZiismEHxn8fii9SY/CF/Bi76HyiQqH2euuc77bOBof5IGsmnp1Ue8+d50AfqDsqprXDoAvGPypq4T+dSsQTiQlHd377jBnKv20/ASM0IOZBXgNZDlHsCNxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152366; c=relaxed/simple;
	bh=But6DdTD+w1AFKmLFPaiVXO4CeibFjccHZ1CQcy6SIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bi8e8+9B75tFkgGBOBZK+WeSSN+6KERJJgkqXRjJJtEPmNd82/16uEjVPzXS+WgsradXn14LYgv0gfhJT43upsrYanege5LNJydm3lr3uluUOfYJ6dqj6ApCOqQDdv1mV+y6RzORt6nK+/59156pCdfiVoep/YfF/4oTm2qtBOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfcN2dVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpbQkWdq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfcN2dVl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpbQkWdq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAvOTo1504026
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWzg8bctVvqRGEewiwOX+S0Z7/Ay3Fj1IoRNJ5Ddqeg=; b=cfcN2dVl9jVZL7Tl
	kI2ddKGopHXchsnI6OpYS1SnsqYeK6z7CE4q/sMXCGbfe0cS2hqrg1eDVqcFADSI
	yAt+zBVO8HiN/nvoN4wvpIy52V+kj0mupei0pNwySdFKQf7IcsC+MA2n+Qru/i7G
	beJyo53oQKCBh6YB1fYJfM5wHnKBeAwlUFpQvB3o3a/JMmymMIxgSc0pytg+OdwL
	O+tCpulwNwGzaqb/AiTszZs0X+XlvrqgpXLFdC5swEUlq6xD/Ew8R8WoVJWT6Er+
	BchFOkDG6ZmZ6G0gDxOhvgN8ICLPmSsnVfuRHeH0wOqZ9Oj5SWC3bgnrzzZgUOVm
	nhxGYQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf876j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:06:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5356c6d98cbso17372451cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792152364; x=1792757164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWzg8bctVvqRGEewiwOX+S0Z7/Ay3Fj1IoRNJ5Ddqeg=;
        b=gpbQkWdq49L2oQE8JDuTzbUHryIxK+S9QyIdoZzo43AQrsYk9B8uCZjGwQAZi/cnmC
         HvjNbexfL44Po83BYMMQEShm0QVTqH73WB4Wq91s+L8QCl4+tK+YsKLSasJpPBk5hksU
         geE9QGQREK7g9l/ADumevCeMByr3Cc33UhXMDBQ4fulZOnmdFdGtW15TIP4t5YDR++9m
         vnh/KmpA1Jpx3uWiBCylnkUtCT1+XmPNWTmg0EE+JZXgBxTwo7h0j5DSHj6doq3p9uTb
         Z8bAFb9/yUUI37/NbxKeed8xJv+GZW1lO7LiJI16n3+Rp2n7xYBQWJpaqYIjBoWi2bFH
         FNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792152364; x=1792757164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWzg8bctVvqRGEewiwOX+S0Z7/Ay3Fj1IoRNJ5Ddqeg=;
        b=QTdBxoMZgovoTRJbhbkLCoTciGf+CM8WyzSoNhXuBeRRYTI++lDVCru2LBkCWyMu2R
         41E4QQ61T9gwikgAWcjkwU+kao9E01mmAJg0WEtfYhqHy/YkS/WlD2fUtTrxiFGg9xho
         HV4vCb/5ssSl6BKZMDyepJbkz8TeRkfHw9sog2pM9rK67ibMVM9FIJX55765CTvhq75V
         aZqb3I4UOfETSFlT5gSq7CjM/LO7DV5hfPGcCYwP4Lx1Vnf6yXSZzILIBmQZ3c4iMpOn
         DBi+YIyp0wwZetUTBLg0a6tWVi0B1oy9Q5VTGe+leOTNaGFF4f5DAgTGn2BJbN65L/G7
         KhOg==
X-Forwarded-Encrypted: i=1; AKwUvBxWxB/BiRxHv+Vmj8CRMtgg5Vqy+Fuam2G/sYWk0PCXg8wK0kdE1Zf+YU3OBXurAzbC6tCnIeuOp/JkNbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjbbgyn3fEQSjpy2LYjcDU0vhGfr/cAJRjV9D/ChSj522/LJNl
	qVEvI4/pTH8RCzc7BGc3QtzLWIYvJ0Sc3F35SbtFWK9x8eH6+czkoDtaE34UjnzKcPmrIH6tC1o
	Z+gBW5lQcz5euQrLmbpsuf0fvqYSZmGK68IjofTRlv3voH7E+STGBaeepvmKbWddRWM4=
X-Gm-Gg: AYBFou3FXyXNRFgYPPIvGXviMUbLAf4X86bp8yD6bN7uWr9JRAd1CPiB25XlFhitJh4
	PrEVlY5FAQ3aQZJgiZ28yvtb+tKiiIQCcw/FsOd1hUxd7rfvmNgA2RmDUvyyh3jYG8w9B9F2aHU
	HMx7Yl0KcgUHq8Ae8xw2g/EdMutsuv/S849W4MEWwawavIpMdTP4fNaH4+5tdL55kMG3FDlDDzL
	a8GbViIPq5uwpv2vFiMtkwC9vBUuWNBPYujptPCsj0Sdiqa95MvOqKSod1wpJhpJDyEt8sXU6Lg
	Edg1mXn+9P80g7AK/QX2zuL5PZmRMyfNIZ/PqGVFE9ISiXeYkmD6Qd6vFZH9xvfM2urJrOqSPZa
	V33ZKuGJzkgSs7F/FfDyLFw==
X-Received: by 2002:a05:622a:453:b0:536:3519:de44 with SMTP id d75a77b69052e-5363519e697mr17804681cf.4.1792152363647;
        Fri, 16 Oct 2026 05:06:03 -0700 (PDT)
X-Received: by 2002:a05:622a:453:b0:536:3519:de44 with SMTP id d75a77b69052e-5363519e697mr17803941cf.4.1792152363002;
        Fri, 16 Oct 2026 05:06:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c615esm64286366b.42.2026.10.16.05.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:06:01 -0700 (PDT)
Message-ID: <80314471-1913-4dbd-b91d-7b25bf4b3b14@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:05:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/4] phy: qcom-mipi-csi2: Add C-PHY support for
 X1E80100
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, geocausa@gmail.com,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <20261016-x1e-cphy-rfc-v2-4-377654253193@gmail.com>
 <010f8a27-e058-4c8b-8681-24df30c29853@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <010f8a27-e058-4c8b-8681-24df30c29853@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: H8Mzuuigj17T8hUCMowhTisRqlvwhgsD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0OCBTYWx0ZWRfX6YTiadhLmPts
 CSkt9hEfSKrQ6O1jxDd7dZonUsHKUzZPCeEoI/tc7QRGUqT8Ih2HrnlinEiuUCIaLjObyJCHWCP
 Pq0/GMZ2Um6YzZCnzDqSB0AkxoHuTT8=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad2132d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Nw1dH8mji9hsHjV9vaMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: H8Mzuuigj17T8hUCMowhTisRqlvwhgsD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0OCBTYWx0ZWRfXz4lO9aSXF0aV
 S4fIil/y8tZdofdEGGo9HwIF4mCKhg1jZINR1LPPPWOmdvHPvqvuw/mUnxVQYn6gZpPMKOxt2uz
 Rzlz1PTjEZHDGR+xo2b8zifHDbn9S8tbt/xuVXu+RIg8RmPRmFMETBZ4VbcHVZWtsFUHUuLeO8R
 iM/O8bhzhygchgnSDvWMYhZO2VG4oEE0gE+pHcAg62wfypKp+olCfbmHmWKC26yZFKNNndfwABU
 gynZ5zCeTLRVmFa7qQAjrLbUgwTK5Du082wY5Z8ycrqu2XRzxqTOI8LIKvcYzAldkLdItS4KoSx
 NwmFatSNLV6WSxHK2jciGZW24NxtTASfCw1kcNQF9Hzu4jD5OATp7tUDLIbT7HF685xG4x/jj64
 1R9auMhe83t9rER2hWQ/AQ3KbZFydW9VqS7X+oQELTmoLURlaPJoEoGUPoUU5n5JXvdAGW9ez9Y
 vbxLANLrYGYRfXL8VJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160048

On 10/16/26 1:35 PM, Nihal Kumar Gupta wrote:
> 
> 
> On 16-10-2026 16:27, George Neacsu via B4 Relay wrote:
>> +	{.reg_addr = 0x0a54, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
>> +	{.reg_addr = 0x0a40, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
>> +	{.reg_addr = 0x0a60, .reg_data = 0xa8, .param_type = CSIPHY_DEFAULT_PARAMS},
>> +	{.reg_addr = 0x0a84, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
>> +	{.reg_addr = 0x0a90, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
>> +
>> +	/* csiphy_reset_exit_reg_2_1_2, 3PH */
>> +	{.reg_addr = 0x1000, .reg_data = 0x0e, .delay_us = 3048,
>> +	 .param_type = CSIPHY_DEFAULT_PARAMS},
>> +};
>> +
> I checked the register settings and they look good to me.
> 
> Can we write the delay value in hex as well, to keep the table
> formatting consistent.

I don't think delay in hex makes sense to a human reader

Konrad
