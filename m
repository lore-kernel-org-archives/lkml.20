Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFE13E3142
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774460; cv=none; b=nbwQmHOgXe49hNV2byEcIalLRqJxkUQIBPb+frPkrqFSMhTlKGCOzveYSRS9j6QRvDdgZvJ+qX5KlTIQ9tUkmoUfCJgOGpeFRXwFBq113L0TQA4/lq7tld68WEbwBJYKQvWNGgClC/F4Sxk0ASvsoi9rFRhUL50owsZPcAbeZ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774460; c=relaxed/simple;
	bh=6SspYc/M1jCPep/6JTqdwpr6N1VKzLwAITB+4WnMG5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNjIpc05wxHOjOsyiUMvzql8djOi4PqrJGdwZPOtxwT1iwlymgeWbCZ+EFKWGOb/9npR+oSfn95sQ9dI8jTGpbukCJwpSAi6iCGdSCfX8yZtU7hXjEZIbpiUgHrte/zzZ1LxaSVyzjbH7Eqr/cM/Nn03M6Qo8TeLyjDCghAFE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gj+S71mA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoIwpdEx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gj+S71mA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoIwpdEx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bJeF3020900
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 09:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSadxso+8kCU0Paycvkt2KDREp12le3ozz3U7BFkz2U=; b=Gj+S71mAQ69L2o/N
	ZE/ViHnpWzSoj5C+vJFAzglZBg6pRF23n1mPCVVbvTVfPazGvza413Irt38EUZg2
	5SF4plzNgNmKK44eE2SA+zQ0T498d90bHtNQUtpPcZmi52TzQJdLMGE5SSKowxTC
	6EK7VKPDFK96WDcgU8WwqfJ1NHBU+pK1gc6g+OR1RTr+PiI36tUac25r6jyumV/B
	FhVhz+n0vC/gHIfjh7rb098MB73VTjeY3Wj5dc2/OuxRzvK5opyTqXmRZwJffiFN
	oQyH4VdQDkdp5PFSmP63BMTwwrOyznMaPIuqgqTrjt2p2X2EPtfxuufuoE0wbwX2
	OLR6Lw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw20ag1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:47:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d959904658so59129425ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788774457; x=1789379257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSadxso+8kCU0Paycvkt2KDREp12le3ozz3U7BFkz2U=;
        b=YoIwpdEx3ixU7EswbYFJUc1efZ05dcoRqLJ584WFfybAmHflJAc2G1UeQLbJ4GUGyd
         1LkfIGsphPFfqWygqQy/z8p5FPOTunCCCIaBnyAdXXRthVZ1QYBTKZW6YELTJ7Jm+4vD
         wASEu4zIantNDV/m/Upty54MT9R/wllod3VunkUq+ucD+lsX6Yg3bFfJlsRWkWBpOlox
         vf8o6B38C78gIyCdD6TZGa/OjTpiMKhECTu8W081anZetYGKAw1QlUjLE+ypmSTQAnwS
         sE6B0uXhR7bX68aKXb3tZLcedrXTmB7rb3iAGai0auhn+zyy8vFLOgqMBhhfXS5yy+mQ
         Zewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774457; x=1789379257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSadxso+8kCU0Paycvkt2KDREp12le3ozz3U7BFkz2U=;
        b=GjJ5e2/UeQKiYbefA78Nklw3rdT5Yx/2DciysGbFlxZ1Lbu4bktZ2InzJVN2iE8zjV
         Ncs8YneXE5I468HpTX+EE/w3SUhqRUniqBahqU/gXQsVrj7ANBJVFJfV9z7wVSoSLkPW
         FRRtl7V9P5ayxR5hFml5ic5V1wUnstQ0N+8zky4Hm5mcKenIcbQgcP1KraB7SmZyFmOk
         F7vRA7yFzSfge7ccSHRp7Suvqch798i0HmKqS9uKxwB1diK/AinWIT9hjW04JIvKp7mi
         /askTY/svif/9dHX6NTuM/Wgi1WEqwTXSABNlUEOowCXiPy1Hqgn8HxsTq+jJunzS3kp
         aisQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWlqj0Y4VmxnBMK6LAGdHfAIPaDQ8MnXqv5WoQXeuS/EIFAjvrq8jeVXcTYaY1ELKJEbzzoXc304gWAgQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nq5oOS6Uo6Dqs4y6qldn4uKwCcYp++PadyyIH9lQZTYGQFl6Ox
	tdgKNr7sLrrsw1v55kUh6y2TzSsNx7nEs4FwSSCMw5m1MPPU+mMuAwANHhmP3cvJBC/h4ZtTs4C
	Aj7FnMiEz7r50mJBWUKkR0yrgEvvkyuclerEMZSqcaV9h59upPe/6YW6A8iOhXKifKVU=
X-Gm-Gg: AYBFou3KugoZmqGapsKI/AOLyfYO9AAwr085XK5PJV5RQyxca8mCwpSbt/IDI/FclHG
	vFPxzwCMMMn+vwcp0VvzjcdJTK2CdOIJZ8WEtyX2xqdwxgkY+nvudwimmmiEj+4bon9dPdXYAMO
	Rmmu2DlmXN9XszFcLK707SGVcTA2bxhbrMUtOgkHLcmKP5WykSY0zWafJ0ojEJLMi/xNnQqiv9/
	N7jVcYAJE9hLfMYhKQnpytvMEhxwkXqJ/ZhThB95gt0aC+TXhBtHt/kdyJNiTYZVoh3bA14VYeI
	i0/R5HmAu9x6n/Bh85I0wjitLnoqvxclkdKs5qY1MpQfaKOOQUKZ57FFpAcmQw5Vb7i9VhZacby
	0b6+BfW98RhFUI85owAECH5ch6JxuSh0=
X-Received: by 2002:a17:90b:3a50:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-39b26101576mr37063429a91.11.1788774457560;
        Mon, 07 Sep 2026 02:47:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3a50:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-39b26101576mr37063367a91.11.1788774457148;
        Mon, 07 Sep 2026 02:47:37 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm23169442c88.3.2026.09.07.02.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:47:36 -0700 (PDT)
Message-ID: <591315ce-37d0-40e4-8bfb-55206578f0f4@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:17:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add TPM support via Qualcomm TEE TPM TA
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v1eWOnXEo7PBqKfWfI-0uD_zoDwWxf7L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwNyBTYWx0ZWRfX/y7LCNS8HN26
 9NPNxB7zjdDziSHG3VTr6S6U82KdzskDEVVhffnnrMDs6PIZDBTpYhymrY71EwVy5N5QXXpz1XT
 ITB22jNCp9kbnnuOoOY24AX/otvmjmY=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9e883a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QTb_0JKWY7oM6lVZCfEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwNyBTYWx0ZWRfX/g3+rHuWLW4m
 GMhcXcblZx8GK90uOr2Q55I7Zb5W5ugO4ndQrIgctk4MZdtGOsHNTu+yk4dJ0cFxLXm9k9spFnz
 /g+ONwpPH1BNzyxwVKkP04v3ZQUtHQ3BB6P+qMqs6FVCflRg8JcPp2j8F8DIaAL6ox7hJCJnA1I
 5N5jn1EEJsHkT2rq6f32BdIJMqzPtrRYmpKK7oh7iiWkCkEEBkOKr5BiqM3m3QsHfo43J0bzX+m
 dF1cg3iwn75Byuh+yDuQ/fcieiuGmNJkJvfc8L712qd5pB/7PV4mmnSdFodmwFrwk6yRDwtJYej
 Ed2nmGssDSE7DeXdKZ3pBGd9B+f5TTZuwDmIG/GUhDEcchK3o5qo+OoCYkjq+q33HcKNhnYP7ZC
 LEH20GIaXNdngVfVOw7VPsztSQSho/xh6qKT256nQfU/pu/dEYZgF7z6TUkF350dZWyZvxjAC3A
 HvOuYLn8U8qAbB3+QhQ==
X-Proofpoint-GUID: v1eWOnXEo7PBqKfWfI-0uD_zoDwWxf7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070107

On 31-08-2026 15:12, Kuldeep Singh wrote:
> Qualcomm platforms with a discrete TPM (dTPM) talked to it directly over
> a non-secure SPI channel from the kernel. Arm's Base Boot Security
> Requirements (BBSR) v1.4 require that access to go through TrustZone
> instead, so on affected Qualcomm platforms the TPM 2.0 instance is now
> fronted by a Trusted Application (TA) running inside Qualcomm's Trusted
> Execution Environment (QTEE), which talks to the dTPM (or implements an
> fTPM) on the kernel's behalf.
> 
> This series adds a kernel driver for that TA, built on the QCOMTEE
> object-IPC transport (drivers/tee/qcomtee/) already used to reach other
> QTEE services.
> 
> This patch series functionally depends on below(patch 5/6 specifically)
> for qtee service discovery.
> - https://lore.kernel.org/lkml/20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com/
> 
> Tested on Glymur-crd target with tpm2-tools utility.
> 
> Validations:
> - Get capabilities
> - Random number generator
> - RSA key creation, encryption and decryption.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Sent v2 for this series.
https://lore.kernel.org/linux-arm-msm/20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com/
Regards
Kuldeep

