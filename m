Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D03D403123
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812511; cv=none; b=KUs7mteJHpUo0wlAueSbSNnBCXNhvn39m5gfXNSBrDlkLtvuLZJiH4xu1p7qDfVwtrAkWIaQGv5zXLA40iRZDVEI6yEXgzwk2Y8vKDIznzDoIYPbgmjLBzTRwa2NE0fueGG/Zegs6hLKo95Mb2phByVCJmWkTzZeDmLqNC/YLPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812511; c=relaxed/simple;
	bh=3NdjRWC9Ht8pthui0MYNc0hVgC2vhaLaAMzJs4L1BBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suYzfTvsRP8uK8Emi178jfbHOzNYig1qG+XjO7GJpVOjz7iLRyvjzW8Zxr9Q06fxJwTYU6OVwMkXTZDzH4boBkVbsh2LAzQMjVEzu6NCdaaHiJv7cx4dqC9AH7z8TfTe4gQKl0xzBhikcvQ8vAzI5tF6Mh++5iVoOH2thxc7/L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmXYi8h5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uco+raX5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmXYi8h5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uco+raX5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7rjF702437
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RIU4zOAVyaWw3Nr0469yP5bW
	wVOdg7LcRfJkt1TSBCM=; b=AmXYi8h5t8GxfErVP1Ku6oarBph+vUrmhP78J1Xv
	EbUON9NW+WQkE5BuBP1F20Dkk8/GvH9tgL+3u17RxJhVTuuCfhvgiVLMTdP2CsBH
	4KgepnguyYROoKBSpzCgGKeyuxqRSLnBQ8fbJ0pQmFDamN1jm76ywNow+3vU5LOF
	4VVUWziLNGPEnLTK2//yVSe24TXTXug2HE/j03cYJUnCgP+aH3VkLfMSQLkPePVD
	1ugKGrDh/5G2uyfXdw4+mMakgoyQ9i6yczDXVbPEeZast208KFUFEsRkQQwXGsPk
	Q2Uyg5unh3dYCLyq6TzqhzsxVgMSyNzeirFE0igpJeNlIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86tpj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:21:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93771aa0379so761395885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812508; x=1789417308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RIU4zOAVyaWw3Nr0469yP5bWwVOdg7LcRfJkt1TSBCM=;
        b=Uco+raX5qY0Jg1amCsphJb7BWnw3nkY4+6kDYzXEWmbq895DblSdNMN7qF4CVEX7w5
         nFpDCM2Il+HB3i9oOlVqaEY1fQOs82fRgaVQQOCdduLjd3v+o8qAttS/NOfPeCZWiLFi
         2qvEOYCfSBnoPpXNQVBwQ4DW8eqLGgLLryj6JKrGcD/p3fq5ICtzMA27tAeljnkqn3ut
         ue33ivvzBRIXI8y8OYJaNsE/KW3cdsEtwWamaWxSTKEzMYwZWB9L9oyNWIGcKKvgWZO8
         rYlzrKYMZqLDZaJ8WQkoBOYVGnb9SSgHFQST9h44/gmkHT8wRxtGg8BPEkmEZuZMrMFr
         u5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812508; x=1789417308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIU4zOAVyaWw3Nr0469yP5bWwVOdg7LcRfJkt1TSBCM=;
        b=NsIMA+MaX7YRfo6rtIsv5siv9OZDFZ1mbaqVTHYlRR/nFQ0vlleSAraPH7Skag2tYt
         tkZ9NvS/UXqhyloqUKoqWuONzwdDPYaopXTGyX4nTcfssO5c+TnKPcHve+Wb2T56Zr5Z
         rJGzW+gKfEW7l/RxF//gCNS4NfUuoUKAdcY1qdbxb95AArj4UisQCIHBJ4doSczMR/Mc
         OvPojhs1+87SUxtdccNlYUaoEJNkLbAcxjy0noHFk9SO9bGah8Ctn17eYYJYJ7jz89Vf
         ppnb6hYrkOQ6U0+a35cWiwYXkQPT+vwg/UOiJ0T2UVeko5SKJKB+K92TyZTHJQDbIMuS
         SSAw==
X-Forwarded-Encrypted: i=1; AKwUvByD/8NoC+twAZVx2rGghlkxDjzCji1UULvvPRTwMbLwLQGEBo7j9ge4itfg6qbkStXAbwI3kqBMm635UaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mtegaW/BlbpJYUGzZHVBBmroG7mGHxDJ/XFlElNC3HXKHQGuos
	nZPDYGm6oOtuNHpyGPPD3V5eZGzRwR0s8gR/B2+VxieYKy3kqcluKRNbA4vdXT2F2ptdGF/Tc90
	QQsm3LTsL22CD2beRSQ2JboSPV54AItQ4kO+GyGUQno65qBCvcauG8GPMIWvGbQakUOTkjmbAyF
	E=
X-Gm-Gg: AYBFou0GkaU48hdyykr80gkYQHYx0/8ceOx3F5/4b2Bafm0t4pa7YnyPoz+2vGXf0/w
	1sH50wfQZYecRczy1papEwR8dADe03F3k0fVTLETB48qSra19kmShGVJ5lGgFd9nRleqKW6MTBV
	X9Ec3Oe4CRBz7CzCtF98/KWj3fsm3gO9WoL8h/GvAapiI3hElXUd0BaJaNZcJV68YwsYc+VEKBH
	ebbR/hcDNSbjehfzacJ20TlSWU1mMshlurqinGVqOI5Brncc/HKY4RaIyDkjxikanHGjOn/46T3
	V9KoUMff5G278cd77r2JEJXbSxC2FVIIF//ls0QpwiAO+JuAwbRwhDvubfGBfovxHFALaSfn3pD
	XcORyL0fQ+8vSkQ==
X-Received: by 2002:a05:620a:27d0:b0:936:df48:d507 with SMTP id af79cd13be357-9398033d1aamr3046261785a.18.1788812507608;
        Mon, 07 Sep 2026 13:21:47 -0700 (PDT)
X-Received: by 2002:a05:620a:27d0:b0:936:df48:d507 with SMTP id af79cd13be357-9398033d1aamr3046258085a.18.1788812507018;
        Mon, 07 Sep 2026 13:21:47 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm23868781f8f.11.2026.09.07.13.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:21:46 -0700 (PDT)
Date: Mon, 7 Sep 2026 23:21:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Add opt-out parameter for
 QoS settings
Message-ID: <v2gxqazjoxe74q5364jucy4pjds6gx4gfdchgulekl5mwk2azk@we4ibolioibm>
References: <20260907171729.1735641-1-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907171729.1735641-1-maz@kernel.org>
X-Proofpoint-GUID: _eNspcpVm4CD4hp8UhkWteHwUfDyrGMB
X-Proofpoint-ORIG-GUID: _eNspcpVm4CD4hp8UhkWteHwUfDyrGMB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX2zrZ3FAKtD++
 zGTGKFF8Bm2zL7Q1Jv/YexM6XmC1NW6JA4GQFDOPZqcHXSCRr5nrSqzZTLv5pm+B7QUlKaDRHLd
 LxzbKAw6ZIkHiC4b4vg+gHVuljJNa6k=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9f1cdc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=L658MKht6wu_f2CE9M8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX0MG9wKOmNKlM
 r4QFW4dQPiErdgAdSSqCVaI71SJOzVBDvo9aYGMbanEmIkJwyEkupML0RqSyVUFaMeI/YHi8fL+
 /RkAY+b7yHGNBO0GinPJzgERUMTb+5ddGsrWl2Lgw5Vz7Rq/aPx8rvfYN6fjv5T3+WKPejMpo+I
 i+MfbdYYpAdkGRawdQqJxz6N0vglbhDUgSRQ7naQsZgjm7poppRsSCi2AkrHXHeyRaqyHhN/+zp
 QZES7M8fhj2jydNrieSl0ZeH05rM0ThofhPSi8YDnc2PID/WxOhHUtmgmdPIfDwzNLUi0ziN94K
 GD3DNphgjG3JmW9AdacyRsO4eFGh9QMrFHnWu01aeAjTx2sBksiOZpA2F3/din9fr8xr63qRpTV
 IVzkdXvLnVsDWY5z8OZSdqrACchsWpp2BydU/PU1kPBAhZrGOS0bBhT0Hx3fRdnwbqpA/L4Blq9
 HKFKyyPiRvs/ZwCq29g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224

On 26-09-07 18:17:29, Marc Zyngier wrote:
> Recent addition of QoS configuration to the X1 variants resulted in
> systems that spontaneously reset at boot time or under load.
> 
> Given that this is both very unpleasant and hard to debug, give the
> affected user the option to survive such event with a module parameter.
> 
> Passing "icc_rpmh.enable_qos=0" to the kernel command-line will skip the
> offending QoS setup.
> 

Lets not start doing this, please.

Can we figure out which platform deosn't work and then maybe we can 
add a quirk in DT per platform?
