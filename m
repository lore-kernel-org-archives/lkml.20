Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F993BFE47
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153461; cv=none; b=ti8D6VkVC0H2u1XGZQHRTJwXvxka+urGQmYH4wTQplnJYEWTt9djqob934+SWkANMGQ78XGOnuH8tqtMllPrnGF5qS9WAA13dnsCQSIX4cJ9kZOphbTmAw1vWHyPab3yx/kUTjfpraRt005gJvQkIr+uVHpMPW9sd+3ln80SVik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153461; c=relaxed/simple;
	bh=16c8In30yT/bstw6x3U3gn0chGLv6hrAzivb/92m2jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pY6OTfQ8RKk1c2iSdEKLOTaVccjUAnMBq+UEWbj90/+OwQOkd7oa5jB4LWT0RcCI998ZkBqgb3/F0bz6pEprBzmmXP353r2W8ApJdFCoYcLOM3lDmeKJe1r4guSTm8f8/3L0LTsohb3HqmpYcUveSZRO/g/whTf6DFP7oLr4TEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRMRH1g8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dactseMS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRMRH1g8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dactseMS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JMVe2003940
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V81J0//aP7Eaf0ycXsuGgGwagnYfs3gvKKc6hSebF7A=; b=fRMRH1g8eb6sYlWz
	93awt4dhBu5vB5nlHMNwrYFixvGr2Sq9Txt1BlNrRyoFT09KEOGeWXUIPBF5aeb1
	uxSA7vlkEYF1+TGm13zg4/I1FsUhPAVbHZgbIzapgO71QsZo2GxZvMbN9BGJkSJu
	gV5Nsw7cBDYFyH0cVCSlv9+uNRMDs43Ed674G97FIelUf7fphDjS2zY+zTNfy/dI
	vJ4BrutFYw2gvjzY7xAA6BMKKLikH8c+5qR9cAw/UUOtgG9gGR+CEcV1ogv7OUeX
	NqvB/4l6skg2chbKpuUvjmaMbmSbgspMknXV77k8mIkgJDQfrA67KH9TMytu6l95
	EOIurQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec4h73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:50:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8688139460bso665109b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153459; x=1790758259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V81J0//aP7Eaf0ycXsuGgGwagnYfs3gvKKc6hSebF7A=;
        b=dactseMSN31ZjEVuZ6CKM7tRHYVya3aZ4TmkqjshuvLyFNLnWH0vSepiLmseigUtVz
         emgZHkLr4KTahvA/2wEtPn3vvJvcnP4kF/tdLejrtxT/nf0SWNWEPFeODL7V7Lo/RVTU
         1IQaTC+HPbGLWIuXUHkX+DDaHpsXOM9ymDkIkMf/sUMEq0SAwkNrZqnZeNMrPp8n1Z5T
         tsPygeBshiA6UhtLC2gtPEDULFL0FW+Qn00xgsNBUfaW6iNn4BpgBuVQ8CWj33TAcvol
         CH9f1r04jUnx69Zql+tNIWcXdIMlfsvuXTX8TLQeXNpVhRCXUnBXLfEvuIR6AwwtbugV
         6E/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153459; x=1790758259;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V81J0//aP7Eaf0ycXsuGgGwagnYfs3gvKKc6hSebF7A=;
        b=rD8cUuUSNrMQ6/Evk3pN9w+k/PcYck+73HrYL4hIOQFePboRtd5qLs7iwj9I+ZRDoJ
         G5+Y1J6TiKvcfkBhtvp9QRiSEji9plKAnfGqbAW7EUz4xyo2ykR8m77sEMht+bGtwYRU
         znsbILGqx0FPQ3Y+iR9Ab43/g2wQEurBP/lZzSkY22sijeGNegEfHbwveOJRSz0MoEfL
         4toXzlfYFHqMElbaDqyO04KC2tHBVvKU0VL6k1I5ZVdLGLufj2X3RmQ2viU0Yy15CoqS
         VeIf5BGwQe1tB9wL7vbSC7lIssseHRxUmKovlAD15FeTEhV3ck9JKGDYyUag2Pq4Xd3H
         o2Pw==
X-Forwarded-Encrypted: i=1; AKwUvBzkk7tbG+G8p+XhGHTh5b3MBhCGpEgeY8CML1jjHr8q7FbaF4yn+ShDlOVgsNgzbjepFzaZrfGmGQAChHs=@vger.kernel.org
X-Gm-Message-State: AFuF++nm62BZ4Lj65RkbqsAX50VzQIfETTuOlE6OzkRa2qGD7VU5u19e
	iKoeu3b5UIUTwfF8ejkEaJLzODeFilWso7OgmDxgR9EcSMgKW6gOVmc3UWZF8fJ4sedtMcc+BGF
	F7SonmHd8md6FSNxK4JKW7qWTNMkGR2O/OFFWmIAbTLbX+spv1D9X7H4HfYEX85+LeWk=
X-Gm-Gg: AYBFou0lG2ME/APJN8GttgDb96Z+ZhLMKFAB+4RepAYddGLIkmJDDf2I14mDLoHfAOk
	EzbiGNwql3wgzeY/Vp9RrmtHFjCyDQiXpsdAyfFiwHKQzCmanJTKj9Gw7HNHHLR27sBC0QEig89
	ipQ0ehebz3eHxMzvfs4ldxlV+WsA4pPwpzCHXvrpvgSJmNmAIGGCM2/1lkPNRxr7+FmyVM6J1AZ
	suZHDQiv8dJFLSOOQDh8EAMD5Fx6rphRCGBq2tiy9zla3B2TZnm9cjdAG3O+9tUNeZTdjrAj9ek
	UJiPsSgH3BT4X5Zl1h8ppOaIuPzgQma/3SKhuabdt0+eIZXqwMNPCfUyV1xVKWn0B0ZXqXkN7u1
	AE5gNp6j9R8iL7fg9bFHAeW+wgPcYQc+3BYAwLSMd0jHtC4m+XApDOM7g5dmi2EzSA+S9knh0
X-Received: by 2002:a05:6a00:3318:b0:857:73e2:9106 with SMTP id d2e1a72fcca58-87d1b3ace7amr2110664b3a.22.1790153459095;
        Wed, 23 Sep 2026 01:50:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:3318:b0:857:73e2:9106 with SMTP id d2e1a72fcca58-87d1b3ace7amr2110650b3a.22.1790153458595;
        Wed, 23 Sep 2026 01:50:58 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfbfd11sm944539b3a.11.2026.09.23.01.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:50:58 -0700 (PDT)
Message-ID: <16ac8645-3aa9-43da-bcc4-9ecb2225e1f2@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:50:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: advertise interface MAC address
 pool
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kang.yang@oss.qualcomm.com
References: <20260922200643.1133491-2-ivitro@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260922200643.1133491-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfXyXfd4jM+9i5P
 lD7lsHmR717+EW0p0aF/iK60rMHTKvvgpLDgB904fBVzJbNG5XgeXpaN8zclEJPyfUiVyU64fBU
 5M8ANNxdf8zlZcaRGfhF0KKjPAE4vUlzVqsgVpQlzj/fQSXeZQqzSo2ozjXEd4HsqG0PHmMi4wf
 Lbk37h8INTBVvWHI2dyOBUKoMpHfUexN2raLG6sRlbmTr0iqll/FHdtw7GjE15qouHDL52lGgPW
 aPTI6nwRdY/Kb0FbZ6H3OifXQ0EOFTalzpaeuU4Qmyq6II9T4qJLu9FgeGqy7iRyBubrKLSBDm/
 kVNtZ6C7o7Cvuoy9i/XH2hP1VFftJ1sGsXKx9GNV43HD1WJaduzO8nXAuTOp6a/wh4HGIKR5UMZ
 vvULowjhfI93jQF9LgGCFrVGs0OlZuY2WexMDSoqpMFwezW2igUvoy4752wWMmnvYRooVgKvMhC
 IwORAH1VeVa7sgl/5kQ==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab392f3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=m8ToADvmAAAA:8 a=EUspDBNiAAAA:8 a=PJUtwoy5LLMsS-UO4yUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: sQZPdOcsOAiruHMtEo1YAXKNT0IjoBCA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX1JxI2w8WhPqg
 7ajtMU0ye/fyqwYlc7xnf12TQai1nE8ZqS7f6b4CPr870QBy/IRjS1KQwBORU+4VyBdfTVwsDZM
 rS9aNFoTNH8nQRV+kgxIblEglbNxnpA=
X-Proofpoint-ORIG-GUID: sQZPdOcsOAiruHMtEo1YAXKNT0IjoBCA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035



On 9/23/2026 4:06 AM, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> ath12k supports creating vdevs with addresses provided by mac80211.
> Userspace can already make concurrent interfaces work by explicitly
> assigning different locally administered addresses.
> 
> However, ath12k does not advertise an address list, so when a second
> interface is created without an explicit address, mac80211 has nothing
> to pick from and falls back to the permanent address. If the first
> interface is already running with that address, bringing up the second
> one fails with -ENOTUNIQ.
> 
> As in ath11k, provide a list of usable addresses so
> ieee80211_assign_perm_addr() can hand each new interface an unused one.
> Keep the first entry as the wiphy's permanent MAC address. Generate the
> remaining entries as locally administered variants by changing only the
> upper nibble of the first octet, which naturally limits the pool to 16
> unique addresses.
> 
> The cfg80211 definition of wiphy->addresses does not specify where the
> addresses must come from. Some ath12k platforms use it as an interface
> MAC address pool, while others use it for firmware-provided per-radio
> addresses. Gate the generated address pool behind
> advertise_iface_mac_pool and enable it for WCN7850 and QCC2072. The flag
> is read from the first radio, as all radios behind a wiphy are
> expected to have the same setting.
> 
> Other platforms keep the existing behavior.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> Tested-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

