Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DA2466B66
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766118; cv=none; b=QZSqL3KeW/YrWeJbXSDwgd/w9c4pg9wilD+uq4WR8WQ3E+IJmivl5uYNVQZLVUEORAONHqhoC0bB75GVC7sV79NkFl3VQnWkydFXTgC0CFqiTvNoyFzgu41iGKtThj0Kr0DWCpEsc5p0K5oscHuIWPdoZhgHluve64ID9kZrZ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766118; c=relaxed/simple;
	bh=lHCecGy1VB92c25R/o9DvKOH8VGvWZdaFyb4X9KC3lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TG0U/vkRGNxGNpQfBIfK0yIRslYRMVEY/C/LRzQtUXnREWb1s+n+peAtuDc9Bm8oscMrZpwmpkj0tPq0SWfnBWhnx0/TzOQIf9olu587ytTLWgmWpHOUUGJRlHxQ31z5+UaD4TUmoItMcUENrpAfAQaC+EmnWvgPPdnBYG5X/sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1ZJBQEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SmSE7E/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1ZJBQEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SmSE7E/u"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuq1n424887
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DNs1y/XC3g0OnCiOoRpL2o87x4tEc7z7kiM7MFcFVrw=; b=X1ZJBQEI4m7075Qf
	RMJ9LsQNmoixFMkQeZXtBnHrVA6gkwQVkf+E9WO6BD8GhEeurHYQn05SEytvXNE9
	rnJw9zzSbCqyrFhMD5liUDwFi8h53vuc9knw2VByDe8GM1OCNDTJLjGMo8irFhZI
	4xwAMUHQeGHH75vWCdAb+54EJjMY39szLIODzPZiDZ3HLjpL1+Bk/YdchE6rdP+H
	EHhuPETBGl+ULvKdnXyXlOfWfeZaJIFPj39ohnk8wC1E7kDWPhNY5sEzK2vCSDuz
	jJ8DjURpQohW6eZnXkL2ren693FWHP3Iz6cF8dYUm6t2ehfhzHfnn+bIJmIsnhTy
	XIRNaQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqsxd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:41:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so122264b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787766104; x=1788370904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNs1y/XC3g0OnCiOoRpL2o87x4tEc7z7kiM7MFcFVrw=;
        b=SmSE7E/utRV56B+O14023JqK3EsE7WNm4ZA1ez9whN2GHXB3MdgB6wD06Q6WRIT4H7
         0SQUWVYVzB339y29V27mfm+VYA/5X8WXogJSbc+xQmPRUQUk0TTpzr87TWCwFdpZMsq/
         3pIfR8A2VMvJUNwocFL+SqGROdTFFJRX4fQBY8knC1TicPotmURuvksbq82kFP37WKk2
         qnd/Rl36jK8nxzJkqp1QoKRcmzV7WNgwb8SY896WQ+a+LpsDjxwZPryXGLe+J01zyp4G
         W/VCs2/svfrimVw9aRcUNpfXweLJ/KvCbOeUMScEaGbJgVhQ8dmvD/ihOtraYqVP5iek
         t0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766104; x=1788370904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DNs1y/XC3g0OnCiOoRpL2o87x4tEc7z7kiM7MFcFVrw=;
        b=jjit1WfMDCnYozh8ZZR6Kebg9vKiHGsKRrv6plt3d799Vb9Nn94B2NNsepL/rhlnYO
         wcCAEcRVniU2GdmiFlqBgnRoC8/VGrMKkoB/zO5pKtRjZ0285gztvqIKWAPfghQu3uVi
         xi5jcfbgUH7MBL+0kg8fcy1WQKeRLL7Qow26ElC7mr7QP0qUwhzwuvagmgSV2JtJxd2J
         NtU7tRgyZWTbJTMjGEwt1tXjGtEWfwQNazOnSBe7hFI082Xr8hLxSKnXgRvRT/ICjTbN
         Lpg08dh1h9lgUxfYz0YIZsV+xrKH+GR3xl27tgKP+UlRgIrP1Ka5FFYDp/K7cOURobR9
         8vIw==
X-Forwarded-Encrypted: i=1; AHgh+RqzPaG20VoxBQ5hXwCfejtgnxrkCzqyYZYk/lOfyzLD21pKMcplPNzZOAC+99DfrroBm1mt8HmEExH8eis=@vger.kernel.org
X-Gm-Message-State: AFuF++kc/9e5IU5KiP5XW/cFUFKII4LMSlYY1e873aUH3PXiS/gVvrAT
	tDOQBo8XDJ1P+LmH4LLaBJhcb3CrV4U0ZTgFqrN3vThqmjRBUZB4/yBxjsGnyMQ/lSkTnK7xR/r
	by2LVBLYjYrMg5ANypiELyZsoaODUIudynwMgSYH6rvqV1tjwIVj2BY29/4hf2H6EB2k=
X-Gm-Gg: AR+sD13EVFyWSDBpoX6I3sD3K57KvfPTF5JV2ZpmHe1BKGKJNPM0A+lsKkpBz9liBtT
	VBUJU8sg/LAwvaSVf5WtFKAnlWjrO3xIIDHHz0GzmF4PCgHw8k5pCpPb4/l1cjMEs8MgY31lGdv
	IEZEby80TiMaaXngSgczFcacFLbC16owzwC+uE+OacL+1Pdpu3pgP9WrJG2rieZDCRJMnqIn6+0
	A+bOCxJIRPAsnewI2S2LSC+0PqOdhONQmetTwRlNjrCfZx2M6DqbmYNDnSp1AsnWxYfuxe43ule
	vI0TCmBsjrP1NC/FJiyZj43Rd2zvYhh61oq7hBr+yCUzoLEmUbNwqzrygVctBQ5r+Zys8R/gHYu
	Uqr9taDvmh5Pve5qGhy5HZlSisR2DGJyBOGIsAWHP7gSyrZgQ2NbBrEDVAPYSMyN4one4CehiSM
	hB1B64ChdnagzIL0bqJA==
X-Received: by 2002:a05:6a00:2d0b:b0:851:80de:db56 with SMTP id d2e1a72fcca58-854c892307bmr887194b3a.13.1787766103996;
        Wed, 26 Aug 2026 10:41:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d0b:b0:851:80de:db56 with SMTP id d2e1a72fcca58-854c892307bmr887137b3a.13.1787766103429;
        Wed, 26 Aug 2026 10:41:43 -0700 (PDT)
Received: from [10.50.45.102] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535d345ecesm1230693b3a.59.2026.08.26.10.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:41:42 -0700 (PDT)
Message-ID: <39fbb239-ea0d-4168-bb20-07bfa10bc539@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 23:11:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/12] arm_mpam: propagate MSC access errors for
 mpam_reprogram_ris_partid()
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-8-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260807105451.3728284-8-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0OCBTYWx0ZWRfXynD+Kndy1MCy
 zRmIfYW1SpkgpQpPdBaHXmxlC5eIc+/A3BgLm5xhWxBuQoDz0ITInygUyzljqh63iTH6P/cH/1O
 3oB6GLqyUQ7XRX9o6qzxRqB+ylOdP4E=
X-Proofpoint-ORIG-GUID: T_c1EgYj-IRMqrpXa8wtDohwMZjvjjrO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0OCBTYWx0ZWRfX8TtvOBwQyCqH
 1Kl81yJIDbkNOxJ5GsbgHhfjr13FX5Ra0jCyhoSafgEMNSLZulcscgqSqGx26CS2BQVcmgmuye0
 uTtOG0Ty+h56iiBi7xFehMvPml9ye9cr13+Vcn3AyXXH5NoSzbCwubyKA2zUF6l0aMR2V8KcBRu
 8sLEH7AcFQPwtiQbS+D2+4j8EeMDCnOrGwt31QSiYtJdFcMXOHvg0CJzk48cpneqiybUaJGsihg
 Z7hAR92erUZFbCbCf0h9+5JfUV45b5oLEZ9s861kcGyVWuLdlBJ/i4bbYXZUf979K0TVIoTkeV/
 +8/zAL0+7CtYLxhTTJ18oqfzRwOGjshBa02h6LEyv5OAv3bqi6i32D84y/d58ztjGsMVTU7Ep3d
 k1DmsQyUbJhIbHFhd9YcmxuGA0gJBh6r/nib7jSgFHPkeLeGHlajtUt/J0C725XmeCQS0WYfJoi
 yI0EVyWNilZF/yd47pw==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8f2558 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=K_wyc9vDMbpTIRadLRgA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: T_c1EgYj-IRMqrpXa8wtDohwMZjvjjrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260148



On 8/7/2026 4:24 PM, Andre Przywara wrote:
> Allow the mpam_reprogram_ris_partid() function to check for and return
> errors, and propagate MSC read and write errors from the lower level up.
> This also covers the callers of this function: mpam_reset_ris() and
> apply_config().
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Review-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com> # on NVIDIA Grace Hopper
> ---
>   drivers/resctrl/mpam_devices.c | 137 ++++++++++++++++++++++-----------
>   1 file changed, 94 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 96579178f0c3..49239b15a27f 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

