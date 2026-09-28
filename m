Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFF544E650
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588091; cv=none; b=s4AajVm/znxwRzjIwaLkJ4RhvSJ9fXHvFTd+hMDY6o2tzBgLW5B/SUEK4ccesLzcksBQX6aVjd76zdLOmbLrvwvlonnslgbvJZQ6sfbKu0mk+yDOev1j8zDRErfzohZhAZpSS47GhmXbDze7e8rAFdHFpTIBzHivQL0pMSxhSA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588091; c=relaxed/simple;
	bh=aut5EtV7EHnIQnhVgpWGAgLGS+IWWJeo0UTmCPk4f+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZ54MZ1p3Dtc/9mA0BDVNShGzHoroFWOEzBDEXl7jYu3VWSxClE1SCTJ9RpVfRXSBZYMi9Zi3HH8FxYWWTIqGvXdJBkUjtlGR5g8+Tx1T8KXvyzzq7IxvCySIDaHg1d0UmKgcRseImVKdwin/nq5S8+D6/3wbDijeYcV09VZH1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLkXJMxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fABrETRy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLkXJMxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fABrETRy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MQvc547111
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cslUYpSyi91GFkeEotZ13vFtrVwZDY/B9c/HltZgtHA=; b=aLkXJMxXbzCJ6p6Z
	R1DN0vMl5w3AtEV36Um+luOaXUFYzgfWR2zIKCa3WBtp/4Y/sUhP276G4AgiWvys
	3oJs/O/B/KifdYqa4l/M9QEYeYXCkIQaCBsb1f9xv+0qypcfzGc19gHVjZPGahbN
	4fDfnc6Tt8wFluYbpc488aKZpPtjvajURfCEg+wU0zkkOsVJZuhs+Zq8Hu8HqyXz
	M5wCl15K+5XlP6Zkv0rwloBDRvaP+B/N2lm09lneoGQPx5IeXfi3be6ARv9FLCvo
	etyxotJivn6ZbarEhG4T38eXD/9665rybEHWBs3+qBtVtnHp3n+SFv3C8zfOpPpA
	1BGorQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49tu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:34:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3b126c9fso28895775ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790588089; x=1791192889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cslUYpSyi91GFkeEotZ13vFtrVwZDY/B9c/HltZgtHA=;
        b=fABrETRyH1MnGNahDSYgOKk96EZVbU3eRx7p34RvC7Ap+4XeC8NDRyyZ2LRr6oPO3p
         FXzQuJ1r3csBE6YoF9OTUhRB/+l5dbNOsVOULcEAPk6tjnP0mrs2SHR+xM1fPVD63Kbh
         T/jAlpICeJkHSeruwQ+FvglYYKp+GoipJNVrQda+1t+S6Ejbj78KP5mMXR6bflMDoKL4
         IPXCxKoDMQYivH0YNG3xJ7bliJ+CqVtaS8FuiyP+3SHqPDxMqlVQbpVYCcYRf2SbaSh8
         7qJCSgRNHM1aBCqcuaY46aOG3n6ff21KTq1pAQSQDVBKOxKa+GvXWtyee45vFawHMQxU
         ZXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588089; x=1791192889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cslUYpSyi91GFkeEotZ13vFtrVwZDY/B9c/HltZgtHA=;
        b=dnb1V6CWGOKORy75goLlag/ASoZwjhZWL+NNUxuVhLsaPKjJ4yP3jKUdkoIxnXNqet
         JkGxRRnBM6w2Wypx+XtqPFYWH9IbKaFOXIIXyJZ8+/4dRXRnf7VgZGaMsx2phUVI/UrW
         fiF2BtS1j7EMAmXFIHHkmItJwu3a7r49StjFC9yCDyONVSMCuPoeGVRzW5mC+uTAuJ98
         DWRE5LrxixcrIS8hQLaryU/0XYWi0vfHjg/bdgZROjNxRMQtZMfnnafcrhLEqrnu/N+C
         4ALLXs7RVnp2Y49rjekCfb5PK8sVBBb3G8ZzOoz79GS0lhpJyyCn1bHzwJIHI5F3oGJm
         vmiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRSVexmro9gocnLN81271F4V+z7qGdE2Sj89eafqCIcdFvQJL+GDEdQX4fmXd1bBLxpcx2Ma0S2ctmhwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbKTzLTx6nugahgUrT+fpGYlVjfGOs+6kO/mdB/FJ9u+/HopBS
	J0yuA8y3j0lQ2pqCyXriBvpFOmcroPY3FioQJ/pr597Jj6cigH6cpCDLD6iX1AsbNGiGritKCf2
	H/VIBK+KBIEyY65TQe2LnhXg5auqEJ/rnZwVNZvnaQ3X5G9XY9inSGH2Y5otv0v+5jgU=
X-Gm-Gg: AYBFou3NOYB4gYI1IHJYmJvFdBVXxKGyXyTVYT6JksJhJ4G9O3FhSJClmpoqf/b2gPQ
	RWVVNjp7rtGM5VavbM/Gsti9t5FXVsWUi+7dxuB/2LOUYn2Lrf+S0byOdmNeaO2rUdUuMVxlE8P
	UQcTh4noY4B1co3vvt46u3HaL6gkQ0L7ArW/OqVyn/Ip9YZR50FlOGSpzAB+gosl0FIYgq5LxQP
	lQGEhd4UgaJqTCRVD+fYNO6MB+8F2lRnGKhLEv3MXXDQWpvZPrNM6vkVchu1IFya/Am7keTR7kO
	dUQhqI/WuYp+5U99HiXxBg5PQt3uH3DbjnNQdTHeEeZ+eio7gtmXIUvRi1KjUV/VJ+t6v4HNvF+
	po9X5lSQnN3D1VpiSaI3+7v3EAzKWAQ==
X-Received: by 2002:a17:90b:2649:b0:3a0:b223:683e with SMTP id 98e67ed59e1d1-3a0b2236bfbmr8129133a91.48.1790588088541;
        Mon, 28 Sep 2026 02:34:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2649:b0:3a0:b223:683e with SMTP id 98e67ed59e1d1-3a0b2236bfbmr8129114a91.48.1790588087871;
        Mon, 28 Sep 2026 02:34:47 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9356f48sm19867799a91.6.2026.09.28.02.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:34:47 -0700 (PDT)
Message-ID: <bb9b3980-141e-4ad7-ac18-6ea7b9002dfa@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:04:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add TPM support via Qualcomm TEE TPM TA
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
 <aqyZtHynb2nuQT-P@kernel.org>
 <d555ee76-3999-4ed0-be6a-ca07354af6d4@oss.qualcomm.com>
 <araJKqHdeXstD7nR@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <araJKqHdeXstD7nR@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8eS_0o273kri9uZG9rwhSxbcpGxoWvsN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX0ITxXh1OWfla
 Ri+dCBFZHwqTL7ClesvL16o4ipOun+RUqeiTQ+JLJVRWgh2T3D30mbeTSA2mCS9KfKBdIOWnDbp
 Ueo/DkPqmKRVBli5yFuWTPpeuqF4kxXVKvMVTOf6m2JCiJGdSgHrwLaZ2JdCiPxuMeW80ndnGdA
 Pqf0lFtEKxbZxhYFN2/FZ/ZwptgnQrmZJYJKjf1bWwu5oPIBkt6QGSc+IFQuOHLok3h0/lTG0tL
 48WFAMi8Kix46Dke655tXPwUUDGarfpHRNx9iiGjd5VL62wWhjt8HinX/P8VGZW4MkfQa0Az0BK
 n0ResBSK+JiuDNqtzsOqktARWSondQyuK3mbaLLyXHjdIyU+gwVp09XLh14gwvRXc8zTsALOIil
 mePm8ZPfDUTy/S1B/swrwAlo+fSd+3vbHuXtaPb6CZ9DvHHlu5bko5vhvoAf+DNpnOzhkUB5g8O
 TVd5d0HtQgWK7q7DlJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfXwuwFP4DCHVJO
 fu1tQ4WjGOOtC0pIlx2pouyn6bGxRdYhsekxLwzW4Hc+D+Ruu5fH5R1j11Cj4eca2wzAe/eDx/5
 GSjh/QKeLKdugMJLiWkfNdNsoE9rZ2g=
X-Proofpoint-ORIG-GUID: 8eS_0o273kri9uZG9rwhSxbcpGxoWvsN
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba34b9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bi0NzNZZtduFk6DORyMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280038

On 25-09-2026 20:16, Jarkko Sakkinen wrote:
> On Mon, Sep 21, 2026 at 02:06:43PM +0530, Kuldeep Singh wrote:
>>> Causes merge conflicts with my tree when applied with git am (actually
>>> b4 shazam).
>>
>> Jarkko, this series was sent based on tag next-20260828 after applying
>> prerequisite series[1]. Some minor Makefile/MAINTAINERS conflict was
>> observed IIRC.
>>
>> Kindly note for merge strategy, prerequisite series[1] will be merged
>> via TEE tree and current series need patch 1-5(not patch6) only as
>> prerequisite.
>>
>> To merge TPM series, it's better to pick from your tree and TEE
>> maintainer can ACK patch 1/2 for seamless integration?
> 
> So I'm just having trouble following so: what is the best option
> for you? What do you want me to do? Which route you prefer?
I took latest linux-next (based on tag next-20260925) and tried b4
shazam and observed minor merge conflict in patch 6/6 of dependent
series[1] in drivers/firmware/qcom/Makefile.
Makefile conflict was easy to do as seems recently qcom-pas framework[2]
merged which updated the Makefile.

Also, I don't think we can merge tpm series once dependent series[1]
patch 1-5 merges. I initiated thread to atleast conclude 1-5 so that tpm
series can be picked completely from your tree.

[1]
https://lore.kernel.org/lkml/20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com/
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/firmware/qcom/Makefile#n12

-- 
Regards
Kuldeep

