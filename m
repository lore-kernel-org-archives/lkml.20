Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965FE4963D4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549749; cv=none; b=tl1dD70AjhyGKOOvkr8Cp7I5ugl5rrbDxwown76HpUmlNtWnZpXPlxFauowLE40DPriLLsjECPgLpttEjXX6lOIDxWz1zCkgqKVTuK/CeMAWxqm6FlakBkJuSsCqeKMbEMeeSmstXyCzIuINSi0dhTZDc9da0+gCxPm7Pfr2sA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549749; c=relaxed/simple;
	bh=nCPgNq6ofGDnq29kyuDTmutfMFXmKfnQpA3tDgnE36o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z9C+xPjkwjF28rUIYmfnfOUrc6GDcrYXorjfQcLrk3fl/KlMrBAo55cNxu5NnIbaJt9i3UujnZ6ru3x1cAmzJH/HYa5BNol0SHAeL2epkRl49Ux21UVReNHV5U+AU6PWUHVuMGF/pQauD6WbyZMjAz/aPTuGpu5sXecgOryB0gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+yCImwz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZlwRevP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+yCImwz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZlwRevP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92gOn2477693
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NEGH+ItwRx1cdWh9qeRSzm3Q0foJqe4lssp6f1PBHQg=; b=R+yCImwzr+hNV+/H
	gKOHT9in754MGSt/ibIZdSHK3bgIsw0nL5eRFDueN1Ze+ETSXODZVbhSOSN9dBB3
	iogu1SzM69nr/7ihORps/siGhnloKF/EMDK9uRirbfSlvwiJg0FsavwqxRLPYrcl
	F/ZaU4lTixZ2YLT2jIjRqy6HIpGc2Lng8wb2/Q2oAWh64Y3uOaLErPIDvLCkBLmV
	DKKcc9Xo3VdeWq1sSJrt3qYgWXAwQTxLmSePDnf68IcegOuv5qyLyj1BlsGXkg7E
	rKuJclBXA9ow66Q0l3TSbsoomtOp5UGnuvWTaMpr/aTJgQTTWCO0vNdTqD5LJ8ku
	3juEyQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksgwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:08:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9393ac4961fso649465285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549724; x=1790154524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NEGH+ItwRx1cdWh9qeRSzm3Q0foJqe4lssp6f1PBHQg=;
        b=FZlwRevPTaSyXJOTRSZIVGQdfB80B/cpqhgYd60yRmMvARRaF7tTQb3Yato6YyXPVa
         /KioO7if49mTxAe1y/4bjP9QSuuskM/D9WW2Pp6N8+uJ+5XRt0IlX0vaxTSrz5c8viIj
         XkjMbwbAkRLABeEmlvX3VWJFXdpN076iSn//j8Xj2zJBqk8RXDV8OXG/8plTOUOrFLv4
         bVvLiki3g6jW9WCMLz26OB7UxfIw/FzD895aAP4UUzhH1nQsuvgcGhGUJoMjLROjiK/C
         oXqEZESHH86JNzlSPQG8cTH4PITrIGq1FeN8I4oykdhx+t+CT6wPw5fK20r0sNJ9tCLR
         BzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549724; x=1790154524;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NEGH+ItwRx1cdWh9qeRSzm3Q0foJqe4lssp6f1PBHQg=;
        b=IcFAz1WlWLHxWWQHB1hoDKSY+EmuRJE2mhmBZ1fNEVrSYY4ZIbEnwhF+mNTpydeL58
         SVouRoz58cSPl8+VOCZmpVK/jDs8ux2Bv0Q1RT4AHdEEbVsNS0KTXFuzKV+OmeuwOaLO
         JBvOvigtzDyK5o+HeYvyBy8cqCGBN74fehb/345sNg0XR1/yDd102SuYsoXp9aRiZrtM
         hGjCCAx1sJdN1Qm4Eb0bu9uXBXXs/JR06BbKmSAXUSsfSNCy9LFNZw8UOFWcO6JK/qe9
         9iSmVMKiR9XTgDGn1MA5KAKLeGJ7jEfwymXHwJLu9RG+OnLog+VHpBV0uapb/9HjPOAR
         8TEg==
X-Forwarded-Encrypted: i=1; AKwUvByKj/uti0OvyrdfAIN3pwQFT2fF0nsqu3BPQVRHB/SuZ8IYUXkcZQhJaXTqhRpWNFhoDBk622PCfXaVbog=@vger.kernel.org
X-Gm-Message-State: AFuF++l2IDf3QJ1dXHtECpUQLu3k5vRqHpH2/0vRc0qxPap1bZt7oZ6z
	52ufAAMd+Iob7JarXYg197fJ1jEPUiKFgZxSUPNrlMvuapavCFdGaGjKgVeKnG5ZgYBEo9J0CcR
	A3mkgiGOlHrlVwrUFtOZMRY1hFtXQVVGEWz1qDFHAFSWHvl9xhvvDjzWzo8co5daeRT4=
X-Gm-Gg: AYBFou3Je8PTs5fK+MxyuBGSaEbGXfi0HtzV54nSPY2U5SQtruSSZicuOneRcxz2QCP
	D7QbYZvnTlNqQ9BatTBcpUSy3HxIe6uWYKRRxs0gCIu1KnqXp+WjGRFNpLogxbuYvdcXIY9KLW6
	fA/zqMK4rV8mVDqxe1CrqwqA8PE7bGYXut6+ZRwjXLnrQp7n91BZMobzxqTrf0fajXbusfzD5Jx
	NvIpP2Vmmy6ehx/GDtvMJp1qcFI+U2hxR22sXxcSOh2BlX1YkuYQ7MIteQWOx81AqoBG8jSiksv
	65Wcb/dOCQIDg+gmK4v8WqZeLztq1md3RNO4DvxCUr+k58bXJirFa9U/S7ZGdGIjHuOelj6SE92
	52YchPXBa13bH1AkEn5Rr+YhS1Ds=
X-Received: by 2002:a05:620a:1787:b0:93a:9d:7b3a with SMTP id af79cd13be357-93bb791aa54mr277879485a.31.1789549724013;
        Wed, 16 Sep 2026 02:08:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1787:b0:93a:9d:7b3a with SMTP id af79cd13be357-93bb791aa54mr277876785a.31.1789549723482;
        Wed, 16 Sep 2026 02:08:43 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dba8f4sm59352705e9.13.2026.09.16.02.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:08:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Janani Sunil <janani.sunil@analog.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Janani Sunil <jananisunil.dev@gmail.com>
Subject: Re: [PATCH v8 0/3] gpio: Add AD7768 GPIO support
Date: Wed, 16 Sep 2026 11:08:39 +0200
Message-ID: <178954971679.6799.11775140203641417984.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910-ad7768-gpio-v8-0-6aaaa15adeb3@analog.com>
References: <20260910-ad7768-gpio-v8-0-6aaaa15adeb3@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX/jHI//NDhBZ7
 d8cNTnu72Z4I7kJp2WrIb43ejnxsE1Bmql+t4Edw7vyyi9ER0IgVDtFzoJrOS9guL6o/y0/ua0y
 ehSPdFxNw/UpdOQyaVrh8kgGU6XJJcY=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa5c9c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kaPqKJIw0m38NXi9joMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 8s654aK7gNb9FZ8ETTZXVggoVYy-Rl8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfXyFCS7wdobyp9
 XjypdMxrdwRDNfx0zceMH53yTtqikr0QtJifMMC8ndMqkiGr8N74yCd91aCwjpRV4cIq5B0hSIE
 Zp8i4fOztJlnTg1WHnlZX1w36uV1Ltmk2al3xN8aRg6thLRgNljW0YVrtf8YUv9kL+LyrYt8i9u
 cc9f542NsZoaS0eB5TChY73+6WlNMin2uCnRn+M3oRAoZf3QbGoCbxso6ukrKsJWcwbVmDdRPve
 mB7RlhQ9IBKVtyZHDZIKDp4rJwUDEq7xTadpa6u8yxo8BYL3CuHK/UNKBRcgXRmZTq5VVmSzuoQ
 KVdz1FiTGKJ+XqOxjK8f+4JGXpWMyR5SglxtcaMK8x/NCLlC8pVLWOOtcy95g9VZqFYzvznSLFj
 KnP3oGrVRqRuyctI5l1bx7kd/6FC16HkWjPrxF4cS1OcLerp4JqvwiUY8Nc3YsgthNdm2TXySZw
 5PMtrDDjbeYYoV2PGKg==
X-Proofpoint-GUID: 8s654aK7gNb9FZ8ETTZXVggoVYy-Rl8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160116


On Thu, 10 Sep 2026 19:29:09 +0200, Janani Sunil wrote:
> Add GPIO support for the Analog Devices AD7768 and AD7768-4
> simultaneous sampling ADCs.
> 
> Datasheet:
> https://www.analog.com/media/en/technical-documentation/data-sheets/ad7768-ad7768-4.pdf
> 
> **Device Overview:**
> The AD7768 and AD7768-4 provide five on-chip GPIO pins controlled
> through registers shared with the parent IIO device. The GPIO driver is
> registered as an auxiliary driver and shares the parent's regmap and
> runtime power-management state.
> 
> [...]

Applied, thanks!

[1/3] gpio: regmap: Use regmap_test_bits() for single bit reads
      https://git.kernel.org/brgl/c/a4319947b59145b95353aabed4db879e9448ea50
[2/3] gpio: regmap: Add optional runtime PM support
      https://git.kernel.org/brgl/c/73748b4ec54da0323bb2ec62b483ea3f60ff657f
[3/3] gpio: ad7768: Add AD7768 GPIO auxiliary driver
      https://git.kernel.org/brgl/c/ea4f5a734cd7625ab161ead75403aded18c0c5ab

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
