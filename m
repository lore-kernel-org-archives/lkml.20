Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049686;
	b=1eTi79PJtK5DJIWmjqDIeYSF5Vo2tn+pSyrXWvArzwEcFnkViP/Z7hi908POVBW0ED+h
	 gKBlzuUlRLcBmPEHbEfqvroEuiRDy66L8pr+3aPsijXrkLJtdptHLgwYdiwMvz/YdxMo8
	 4SJEdqVIT0uoyeIJ1qOVXh3yzT2O+wX+TpUvUsH2BMMmSd1Mne+3cM2+VPGCZtk+rvNGY
	 e+Dz12N83PAQH/5QvALkB67CeDviSFqWYEFiO+qfnxFYRFj8vw6EfFADuV0SJMDxnOb8E
	 yuEE5Nl0Pf2p7gU9+uK7Vn5/zzUi7oS41ZObf0CB2TPmXvXo0Pdzae7hqitdf4+lgrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049686;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uHMxSuPF5fosf0Ar0wJsR6O+6GOM6fMKV/qO+7p+q5A=;
	b=vDoXAEMqUrnoSyIc6BdDYlpULQboSztHZr0pkJ/OZO44jgoGWItEaW3CRo7E8fCOkDGH
	 SaTyna5TsVnd7Pq5eiQmAp6iS8BuwtXC9SdXftGBbN9HcgrYF2gOE3BWEJ8M7h+yIN1Ms
	 eG5Tezz6FFOls02tI7xqP2ZLLz3YDcYUG6ACtf+hed8Zs2AC7QlNhGDUKuZscd0/SAW6u
	 lq6rNWralkZMkCE+uvTk7/nWqU2nURbDVWHa4tI2k3MwxLU+XuMSamntPZ1GZfgs1JaaD
	 u4NDcxE6wRobEPvYOaU6SSDVvnJMcnxcALetC5fd6+YUAJWEm0KO6XYLZQuHpnuvH/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6Bwm4fN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PrbMrmDt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693E9606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6Bwm4fN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PrbMrmDt
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIoFpw4131368
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uHMxSuPF5fosf0Ar0wJsR6O+
	6GOM6fMKV/qO+7p+q5A=; b=Y6Bwm4fN1EcU5CyP07AbKPaQ9Q9b4LqWyHpJitmk
	D0WWkNmOZOuIt0eELX85J9JybJC18ERBaZpYBmLq5s1YPE9EYJ2KdAaWwRww5wja
	/yIfSDTmHnxZ24gJzgjtGNu6vhjBh8B+ZT4PGqyTqwX7xFVDA8AUIrIsheE94YCM
	Qund8eg/aCf2r8x5YH25wod5Y8uripAQsGE13aJFOmpDqoBEzpTpzbI71Iabxwze
	XZBUcAcJtE4fvR7ftUHmj4kfhl+/8UzN+B+cwJOCd92x1Mkc3oH60oSFqaQTSfb/
	P3dVqGEyD69kZ9pIN2KjxuDJ/H4bJCP7MptJ9I0aA9PTjw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xswh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:21:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so9423788eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793049680; x=1793654480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uHMxSuPF5fosf0Ar0wJsR6O+6GOM6fMKV/qO+7p+q5A=;
        b=PrbMrmDtJdbNVBsCttKHzSskELAx+Fz7GFPfPKmS98yyNEblWSgv5TlAuInlHJGxFG
         QTFConOoAVEyDWYEjlWDdcqcfL0ezCjN8nd1duL71lLznnBOYwyeBNX73cJIcxWmcgWB
         jcet9bJMB9WlXFDeTr6Z8PMEDS0QRq633PDbhm3D4DVZEcLt2C/IVQxdaa2HEmobz50E
         BmtIvAOunsxOLmiCdTIEdH0PJmdS5kczzIIG1JIsJLBB8koaV6h6/tgFCGzkWlu49uJp
         WTmFQ660toVkOWL0rnhdGiQhcuTYRdz6y7I0KPjnNDTizYWRgIoNtexC0Y1l1QjLDUeh
         t4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049680; x=1793654480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHMxSuPF5fosf0Ar0wJsR6O+6GOM6fMKV/qO+7p+q5A=;
        b=OU6qfqYcqjcXLkZi7wiItOvGgfujh5QGEbyaoATHK3a69AeENTgb/NRP9cJk3NlmFR
         7jdCq8HTX236z1/C8bIM6hrBlYzB1qe9OM123pb9noDi96DSqP+yBfQ9coWMgJ4PZmIp
         Z8RDz0vcaDqHCYyx1n+ZQbePcTNaaSamdWqF724BX1NmgzWMxL9tgCQ5xqnQoOO9RN54
         lOCF4+IS6Xf+iVEUUMUzSnc3cm3Lw9iO9zTQUfq8Wb3HVzuIvRUO/8c+7yA0NXpK88ew
         j3aOoU3pUZIkf8GB/Xz2jmvjouw5rbK/u/hJcL4KPkcZaD3nYfSMAZwOYT/BVA3LKt+1
         vaiw==
X-Forwarded-Encrypted: i=1; AKwUvBw7g7S9RMdYB7F20o7b3wI2GVcURflM7AImSK0BI+QRvYZgW38tUNSvAXSuoCq85xXuNO6UIEwuSVtJN4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOwMln8HK0WI95qvpxGTGozyUSF+P/0zEgisLWaICQga1oZFgJ
	b1qAgPQvz30xEcacTlOopIbT0hyuBk1f8FLgzp+A+4+WPx9iC9petJExGlZdKwxEGphnSCpl9+p
	AS1qGus0GnZ2sU+SgFBSC7FuhEmLbvoZfJJBRnXc1fb4a1ywx0A+qje4bGw9qDLgD7lI=
X-Gm-Gg: AYBFou2q5mZt5w79MKQLOQyKzOd5uJx7GTzCD52cbiPHK8exWnO6nsqtgHM2ey82JEV
	NAjivKUM5X1DAnWaupQdDeDMSUy4zlO6npuSbfVuVVTT1zrhqiqniHYYRPR5Spa9+KnHrn5LYyA
	+2kfFOP+lAkf9R6tYaWAYmlMrshqkcIaN3ZVWuSmdPAZ3mRa5Fo1fjX5QdV3NyQ2m0AZbnRj6qg
	T5CXn+77TNW3dWrBt0ZFI26FjpztDcGa3FqxIdrouJGG/L33Lm7K1o0EJiMf8eJeXhSp4dp+hBT
	8gVbHaM380hh6qMBqLdOqR2WFDd6tJZAbYDnodXdD7aIDcPYmdk52WKQBHh1zczwc1xcSgYB102
	5N2Q1agxo0TNwvKs/AsRI7RY7vEEx
X-Received: by 2002:a05:7301:78c3:b0:35b:91da:7cb with SMTP id 5a478bee46e88-369e850f691mr12863695eec.35.1793049679670;
        Mon, 26 Oct 2026 14:21:19 -0700 (PDT)
X-Received: by 2002:a05:7301:78c3:b0:35b:91da:7cb with SMTP id 5a478bee46e88-369e850f691mr12863655eec.35.1793049679050;
        Mon, 26 Oct 2026 14:21:19 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daa3a8sm34200662eec.16.2026.10.26.14.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:21:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 02:51:13 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Kanishka Chakraborty <kanishka.developer@gmail.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: maulik.shah@oss.qualcomm.com, broonie@kernel.org, lgirdwood@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] regulator: qcom-rpmh: Support RPMH address reads
 and use it for rpmh-regulators
Message-ID: <tvowy4h55xpmava6altmub53fte2zfhv7fyfc57q7if4q5uppl@axc5aeuydmye>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
 <20261023074838.29254-1-kanishka.developer@gmail.com>
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
In-Reply-To: <20261023074838.29254-1-kanishka.developer@gmail.com>
X-Proofpoint-ORIG-GUID: FvJKyj6_NbociCD9v7l4wejNZfTLsqa6
X-Proofpoint-GUID: FvJKyj6_NbociCD9v7l4wejNZfTLsqa6
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adfc450 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Mbw87VQuohrwNmpuYmIA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NSBTYWx0ZWRfX1WocaCUEATYs
 NjB5CbxM99A2aTqlgkOkHu5afCazqtT7XuG2EcNCDUIxcfoQr2L3x8k5F2Ggl3bzTvLzLePeHEh
 wzr1cm4pTGZ49bb+x+dPG8LzkkqYFnTkJYN+vpijzzbAcDvR/L9IZZhG6oh5YKEIFswm0U/B6FZ
 5oU68v1esfgSlmoidOBbRzKFr/c1vVVFAoo9Qj2vjppYNSAp97kWZlVujid11BrP6Gb7D7el9jL
 SlXxK5mjtaABmehIjUDW/oVJ5xQmqf8rYZhBLatfd+VGbXS+Ew5dWdl8ab+KeruAHm+Ul8c7fJ+
 OyDz1LbJdCFI/xH4/oBNYfSYQXWHc4GNcrVHmEcFpKg4oie2vkyfsF1+bZHoaOUxujqTAyTPMGZ
 6P8ScSotVwNFSrUAoE3NxpUEV74RxeWYp6EWVOhAMVfMA6HQq/ScsxaqUKKliBRb5j6C6kVvEyL
 k26LdXX0y5JC8MZlvvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NSBTYWx0ZWRfX4csAS2UT1Ki/
 SaJPyAmeiHDVAMPe7O3QSXG/JL4X/xUNEvpHQWhpG5pLxiRn7+FEuonbDs8eJn6ACUB23xtLgpq
 8d8UwrIkXWkFtQrVDA/K+hBVrRspu1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260085

On Fri, Oct 23, 2026 at 01:18:38PM +0530, Kanishka Chakraborty wrote:
> Hi,
> 
> with this series in v7.3, SM7150 (Snapdragon 732G, Xiaomi Redmi Note 10
> Pro) no longer boots. SM7150 support is not upstream yet; I am running
> v7.3 with the sm7150-mainline patches on top, but the problem looks
> independent of that and may affect other SoCs with older RSCs.
> 
> Symptom: the boot stops around the time the RPMh regulators register.
> The display (left on by the bootloader) goes grey at that point and the
> initramfs never runs, while the kernel apparently keeps running (the
> watchdog keeps being serviced). The v7.1-based sm7150-mainline tree
> boots fine on the same device with the same DT.
> 
> What I checked:
> 
> - Reverting 09d99ff7fc3c ("regulator: qcom-rpmh: readback
>   voltage/bypass/mode set during bootup") and its follow-up 216e8873bc80
>   ("regulator: qcom-rpmh: Fix coding style issues") makes v7.3 boot.
> 
> - A log-only variant that still issues every rpmh_read() but throws the
>   results away (vreg->mode, bypassed and voltage_selector restored to the
>   pre-readback defaults) hangs exactly the same way. So issuing the reads
>   is enough to break it, independent of what is done with the values.
>   I couldn't capture the per-read log lines: the display dies at that
>   point and the boot never gets far enough for USB or a log.
> 
> - The apps RSC here reports RSC_DRV_ID = 0x00010100, i.e. version 1.1.
>   rpmh-rsc only describes the v2.7 and v3.0 register layouts and uses the
>   v2.7 one for everything below 3.0, so on this RSC the read path writes
>   CMD_MSGID without the write bit and later reads RESP_DATA at the v2.7
>   offset. This SoC has two active-only TCSes.
> 
> I don't know whether read requests are supported on RSC v1.x at all, or
> only need a different register layout there. Would it make sense to only
> issue reads on RSCs known to support them, and let rpmh_read() return
> -EOPNOTSUPP otherwise, so the regulator driver falls back to the old
> behaviour?
> 
> I'm happy to test patches or collect more data on this device.

Hi Kanishka,

Thanks for your test results!  Maulik shah has added a new patch series
https://lore.kernel.org/all/20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com/
to address this problem, it seems he also recieved a suggestion to fix it in
the way you suggested to have the -ENOTSUPP for the platforms which do not
support the reads.

Regards,
Kamal

> 
> Thanks,
> Kanishka
