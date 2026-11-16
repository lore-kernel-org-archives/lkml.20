Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812233;
	b=uyJrNW5J25TayrT9pnt+ifC2aRnfqWOL1znva3WmL8oPN5qou3vpxU6Ew00aD7u9zcrz
	 Z4x6wbBtMRq8XBOHx5EI6WbczaSfU1FmmVUi2Gmf/670v9KvZn2fNCY0XYTSqV3wxlUo+
	 TRwHiREmaSoc5H4jXGB2+PEYajdcSn5qR0IPxnQsJPvcRkJt/cM7VKCADakB/GYWAqt67
	 AXIowLbybcJE6rcwiNKNhvcNRW2HAuSH81UiHSWwheKRNieD3HoQrKJkWqxUiacyvVILO
	 1hBxid23AzQZvB1wDRlv7ShPjlUAH2wSwbKLHtHQWoxgdEO2agSygR4lDbUOoYshk/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812233;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8kVbLa2hYPiQsN9qOzj3DO2zSgYLfY1noEtwJGDEPiM=;
	b=P0/SbTl/BLKHGKFcSerqoL8nI/r/8YhYww3JhgkArK9UwTklD9AEGMhxe40CCOqiZEna
	 UAQWYmbG6ypRv9AXpA5JRcLJkYpnSTsAkgQYu0DoKG0tIqH/6VHlNL2L37qhHQae9T64Q
	 xzfj238X4Rn9zaKMJn7Jqv8aHYyqqdUyIh7sXPomt50B8uxSHyZKuU6bdDqGKJTWWLIQo
	 EDSrH5WyxeeeF1BVQNhgPgZ38PanrUPqLsDq6p1SR4BEWjJFjZy5XSjKLe7lzX1db5DRS
	 1K7cChDfeszInUeFhIbNjcY38ezOr74YLJE+DkY8h766YLVyfx9kZcmHIgPgplFuo9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLCw5W7Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDG8ylHP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4215606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4215606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLCw5W7Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDG8ylHP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5M3kC3177645
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8kVbLa2hYPiQsN9qOzj3DO2zSgYLfY1noEtwJGDEPiM=; b=FLCw5W7Q7NkeVCGU
	yuUOnerr82EOmNUhiSOX2nGjnVGRAMsexFpHYCIfr3Ha51qinHKBh8x323+XYXve
	L9f67DnSziCuEMlxEr34fazeYbkYBDMGw9F4qZooZatHME8M02cujI/l4Wvt+hHM
	KD7wzIusA3EAA6SAAaQoMBDlWpxp4Xnf1nmTxGtagzqsvuniB4fb57OCA3fE1LN/
	HgpLtkLNQZBsO95/Fqedn6PPuyi2nfNUOcbg+Vem5TdgG3HJxaLB8b33/bHwisCg
	j1v6fIC6QPjQTiUQrx/pBdPjV3J+kRNcmXAY2s/873c+QJZZBMv9dwCNLF8UjlO5
	L6NKfQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcd5y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:57:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so3681992b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812231; x=1795417031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8kVbLa2hYPiQsN9qOzj3DO2zSgYLfY1noEtwJGDEPiM=;
        b=BDG8ylHP85zP3NraEzlVsFnSt/VhVC2pTmVrULFYefJUmRT4S2rHMjovPPgJ2XuY4F
         JJKlfhpDp+906ZcAbOQm7U/TS6CqfRjMyAUxsyMXdhc7F//V5tWP/GIOT9laFoQt42r+
         jPAwusWs1aG5w8Fc3L+yaQSI/wHl9pDG7Mfzt4CO7VrAZbA3+p7F3fcTl/OUgRlpUt3U
         /+XeownhoeAaFfvBY1nRVUJRYxC1Vv83oRnNNQNSzGZCTWV+xFSYqsght28QmfgwmGxe
         dEVgnyluBOUwYJJJbOrxmc1YbOdPyz0mVyLyD6/jupwTCwMaYm8By8nQf8ZAmNeCJom+
         tWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812231; x=1795417031;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8kVbLa2hYPiQsN9qOzj3DO2zSgYLfY1noEtwJGDEPiM=;
        b=Ix50pwnfdqthVC2sYtgrd2ducBml/4SY6h8iP1Coeiedl1u+xFW2TrTSpZHGbudF56
         qXUbTeDI0K5jXMp8qmtVJu7qVFT9TNadpuT2Sd7JvUBpFiYE7NF2TKN5fafsAGkp/jiO
         jn/d+v7fFgH7oSwJUIpjkI93tH6QqKqFbUYwAcVgSRdz7fM4VSJ1zKWBxKZpQv8ebSv3
         7Orh3TprVmtghQ5CanPNaLDBpmQ/WNymogu79oN4YGoYUsT4HA/hkFDakTcT0DLrrAJY
         zM8GWBHfv9TW7BdeQac9UAnH22ObMeRXRqL97fy1u3Bz23UlvY6eelYT15w6MvhwplMj
         Z4TA==
X-Forwarded-Encrypted: i=1; AL+hErEVOh1HlUtFfT2X0e+zSiVBD+0zkHH4+4cD0BtTPts73JDB5wegVSBaCOd+oPVpAKYsSnsE8QHoQjb5J8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+corp2/hVj0jlPAse6F1+6NTxUz+jpIdMywgvQLDb25CQkneoc
	hfJyh4BIaXi+paAgPjpdiTALdxoHYHRvaFzH2RjjpquUWY26Wig2eNQ59yAE4oamA4TID3ALoVc
	EqriePS3AR/jphdAUAliJNqyFXOWU4In5txGxJeKkduVZSPANg4gSHUFVJWb4XpQf4oWxeQlAke
	8=
X-Gm-Gg: AYBFou2qODlwHRhMUxFcGHnUhNhB6DTgwRqdn5P9yeiF/Q+pZsNW6pabmVt1lC6wYUV
	FGBspYKVQxYZD4sQywKxGJyAZ/ix/h++HQsJbuM+sd+dt5spNl745KU64FhKtXgA6h4e8aKIfYx
	VYoSCifmTvF2YjS2OYC6AUFXwf8LzbxgrAANxhT9Rc7fw+769HLPKk2u8DgwVzBQ10M8XiY0e2t
	7vK+yys6gMZ8sMIvWL/Gv+Pzy118U5pftZCvPzTOujviIbvSdb7MH6tEPedP4xY1PPkomlJdJsJ
	rpnWIsLhk95rHkIoV7O9J86x//Bj6FU6l4kGMsx2Xo5LfzM2t9bY+6bhkwo9+sF1V0aApVg2Y/e
	UKD+dAiUQywfp9c5ddUG5+huTZAmyHoztie9/IZJcnfIvgOGi6KBjbLWplV/S1Nq/2YHMyHhUr7
	TCJrOU
X-Received: by 2002:a05:6a21:3405:b0:3e2:b15d:56a8 with SMTP id adf61e73a8af0-3f7a95f156cmr9720587637.50.1794812231425;
        Sun, 15 Nov 2026 22:57:11 -0800 (PST)
X-Received: by 2002:a05:6a21:3405:b0:3e2:b15d:56a8 with SMTP id adf61e73a8af0-3f7a95f156cmr9720565637.50.1794812230960;
        Sun, 15 Nov 2026 22:57:10 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18c09fesm3754506a12.26.2026.11.15.22.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:57:10 -0800 (PST)
Message-ID: <304e72a9-2def-40c0-9314-0b7413e45e17@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 12:27:03 +0530
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
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] mmc: sdhci-msm: Enable ICE before enabling crypto
 support
To: Eric Biggers <ebiggers@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
 <20261022-qcom_ice_pm_enable-v1-1-f7a84086c651@oss.qualcomm.com>
 <20261024182904.GD2553@quark>
 <172229a8-a4c5-4103-a38b-e4cce3f18718@oss.qualcomm.com>
 <20261113035858.GD1742@sol>
Content-Language: en-US
In-Reply-To: <20261113035858.GD1742@sol>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX786V14s7vF0j
 FUKtAXTeT1zabfJ9QyI6Mq2K7CLdOiVysIRLz2MFkMzzkpauaa9/RdLTudwxxLGP0CDH4eEoIpC
 0K1tDCPbFKn56fsBP2mRVGIjDyLV8Sw=
X-Proofpoint-ORIG-GUID: BW4uMYkoyZlCXGWX1F_-QfAFrNmJMerJ
X-Proofpoint-GUID: BW4uMYkoyZlCXGWX1F_-QfAFrNmJMerJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX3j1UHcMwhm/+
 Nci2RwDrqyjtki3QAEnvEXykmbkm4jySQKaQ2lyVcoBw2dX9X7kELGJ/msCTtTAKAniDUdM4NcF
 A9d/4YXoZFYK/B7Bon/kP/v+ig+eOO1XPYH+iT8KZ5G45oBHLo27aDL+wS7jsS9t44DV69ZtQpx
 y0+I6GooAy+4z66ogE6Le832R4UGU3OQVhsm54iMeu1EsGP8wBnFfZFJ3cFKmZo+C3ybxyuFUva
 G+M7bguuJTnysG/ANaMpSQqy0XXkCwniMPSBZdQNKy+v9Gnw+lgxoXS42KtvJc+oYtAFwTiFT4G
 b1tg5nluo0JwRrb0GJBfD35hIZ9UA6BYAe3WK3LTcF+NGUVLzOeyOdVNhQAMhGB6y1CWftD0HHR
 1eOmzR1lkgOCOQAk8gTKUicuy6YRCsVQdXpu5Q1bzRuRV8JBy+Nx/nKhpLeLcRSH1QpBEgidIGZ
 9xIinbQBnteNBPBoGAw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afaa948 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=AalTVwZ0bjgfRv4LwVwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027

On 13-11-2026 09:28, Eric Biggers wrote:
> On Thu, Nov 12, 2026 at 05:00:56PM +0530, Kuldeep Singh wrote:
>> On 24-10-2026 23:59, Eric Biggers wrote:
>>> On Thu, Oct 22, 2026 at 03:21:50PM +0530, Kuldeep Singh wrote:
>>>> Remove ICE enable call from CQE path, since ICE is now enabled
>>>> during SDHCI crypto initialization only.
>>
>> Sorry for delayed response as I was away on vacation for more than
>> 2weeks and hence couldn't catchup on the thread!!
>>
>>>
>>> This change makes the low-power and "optimization" settings in
>>> QCOM_ICE_REG_ADVANCED_CONTROL be set only once, during probe.  Is that
>>> correct?  Those settings never get lost at runtime?
>>
>> Yes, the low-power and optimization settings are set once and are
>> retained over suspend/resume cycle.
> 
> What about hibernation?  We recently went through this for keyslot
> reprogramming, and it was established that keyslots need to be
> reprogrammed after a hibernation image is restored.  See the commit
> https://git.kernel.org/linus/8b190e9c0b36aac5
> Doesn't the same apply to qcom_ice_enable()?  If so, this commit breaks
> ICE upon restoring a hibernation image.

Ok, I didn't verify hibernation with this change.
Let me verify and get back with results.

-- 
Regards
Kuldeep

