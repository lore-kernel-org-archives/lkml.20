Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8532B34DCCD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546134; cv=none; b=lS3H22zWrIIoGVVH0/v25NcdyTimk4jyVEe4uo5TI7/AOsYgw1MmXltAJqYM/+PpF4Y26m3lnBesQoZmjD4SrYeT8z0EeCD9uuP0oRMVA1UGoqoMIA0vt1rkfPwnPSVjfTcxxUdGjAr3U4TPxHXLq78y2hPoF6V3gsG3xEsyGcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546134; c=relaxed/simple;
	bh=943gMq0BMbPHr5dCslSjYZdPHtFlsW43S3/CnAMZUEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZcT5lxRW6Ud37b+4rnbCxzOzjb2y+BAEMw4HXbeLRt5JFQDLEo5ACqqSTi6EG1riqzin18C8AosKTi/FtyZVXsjM0NbocH6d61LEezQZGRUCMCUiS4QBZ3PJArfX67dggAgWTF1IboaLzCKws67j6ALGBqNhHR1aAwvnjov5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMVdzHsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebmoougD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMVdzHsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebmoougD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G699MD1830717
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6x054kozMABn2+nc5vjBNZSxsZQg2BTB9VQffNNrUXs=; b=BMVdzHsLpfDMo6Qe
	bf1RZ6nGVGdwHW38RL6EgtCMwVb2g0jMAp5We10lqOY1yL2hQMPX2McWf3SBApOs
	LalF4Zto4qwnd7QFVCVSrMqWI2Mb/i4Wr9p8eA6mmRp5McEqhb5ITMgUxEHL6IrN
	s0u6HF4Dt1adetsCTwiPpL5xkvWp4Nho9aY4Fn7Q+xttCScnL5J7zRjzrNwbNun1
	AxO0tt1UF//abEYDm7B3wQ0nQFXOB5jlsLBXOSOHJ0OtkVs+U2Kp5nsAC6mJf0It
	JLzF+ILtwszDyxRN0bE2D/BRXkzQDJ6QDZ4M7BXTOXlsYqusO9ZPYHcHzpK0Tnhb
	vMbYWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9u6et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:08:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d0caso82592385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789546120; x=1790150920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6x054kozMABn2+nc5vjBNZSxsZQg2BTB9VQffNNrUXs=;
        b=ebmoougD3cAR0FVU641ww3caNSqok2N/hmyqsQAhIRFBZhiW8k6ijLmi4GjV3mQZfl
         89qIU9ObleTwcp5AJwMDzy1llMIOUsES1sQC7ccZpjuZKN8f71xdPPOnosV2biTM6nJ7
         Q9J0qlUQMAdyy1Ix2LMm/2wZvz638vz10t20tCUBeetjtm2iSYTGEHlUbhe38fR6hHuB
         Va66dlMyJByQR+mzfNwiY/WmPa+uK1uj7eS20k8ytTnaNNEyBigLMb7C+w+nJqIo0zDO
         AM4A1K8ykwW4n3xfG6mTIca6ojuFQY2IOiSJb1znFktMo981qwxOXIg5wfEmG+3+sggJ
         0V3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546120; x=1790150920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6x054kozMABn2+nc5vjBNZSxsZQg2BTB9VQffNNrUXs=;
        b=zTNvf1HbXBG/ULyFeQfCgVle4ejIe8pQvId6LU2sopgsyvDdhKYntrHdafGqLuPXMY
         ZpJ2owCIkwcRvUMCi+a4LxlLQg0kQ0d1gOKcZHjz5u1GHXkQkbfG7GcLlrDHUHplhiC3
         3fsZkz+POES2mrJKo1TMykW82Vo+1Aee9uhjIH19DOBuyks2RHis7/ruYzH4iUc7Oc/U
         nV6vhD1To9BqxxDcxJQNP+RjtuJvIdKDxgbjPaKo3ornqZktr2uqPLsclvaEO2CN3oPa
         TwefthuQm9dSW8f28LDbUNNDa8fmlZhswub4O8BpS124cF8vJHjxOukNz7cCki/II+RF
         qmtA==
X-Forwarded-Encrypted: i=1; AKwUvBymYqgk8opsSkXDXMnSQaSk/AE7GvxytflX3oyFZFMWDomXfEZLbX4jOz0N5dUIbcbhCetgKSXXlQn4rv4=@vger.kernel.org
X-Gm-Message-State: AFuF++nIAsMpBCg0NrQNm7BRSXLAJtdyH/r7bz2gfU0B7+aBM5jM7wd6
	lZW1E/byUY22BOXnnYfyKMwafxvC9gMSQ7skx718xKqQoTahaMalsHBKYuvW/BSZeRdnROrVq5R
	aAqbCWQYx4ImN6+B57+6c+zIuHcM3ENsLIu2d0LXq1GkYsBPKE8KOvDD/xBNpOL5UU8w=
X-Gm-Gg: AYBFou0EH04FM9m0xl+txgBXEpWY5YMFb3fIyPNA2Fpt3ez0uglx8DrtKIgw3sZk38T
	eF6ssbWEemQ2goCjzaBH5AU/O58f8bpfbVCK5w6ZLor8xXRzrZx7/Qve4M3u72rK9dbamnnEf0W
	HwZxo1vvG+3p6Bso2q52lqRsS/T1bWwt7hhBJ0Z1JylIP9GuBjMNiuOC4T+1gj71A4fe6y7MdTe
	jPeMLjPJiQyrJXlNN4Tf8m1cOfCPkTCYsDu6/Ys32jQOFPwYNPpL5f4FRTLDG1b0Du2+81ZxzBu
	wnsF+s0RVXvTpfa1iEz117fOrgw5F3axFtJcoxu+O0EsaUT59b4DBAAVknntaEo0svZxIm0tLgO
	2S5osvuwZXXCF4PYyQWqYCw==
X-Received: by 2002:a05:620a:d85:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93bb7a47203mr204549885a.6.1789546115265;
        Wed, 16 Sep 2026 01:08:35 -0700 (PDT)
X-Received: by 2002:a05:620a:d85:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93bb7a47203mr204545885a.6.1789546114854;
        Wed, 16 Sep 2026 01:08:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de68fac9sm78377966b.57.2026.09.16.01.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 01:08:34 -0700 (PDT)
Message-ID: <9b22f66f-a988-4ba7-a561-b40e38580512@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 10:08:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Make PCIe NHI support opt-in
To: Greg KH <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
References: <20260915-topic-tbt_pcie_optional-v1-1-47c4a3d129bd@oss.qualcomm.com>
 <2026091611-backward-monogram-82e7@gregkh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2026091611-backward-monogram-82e7@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa4e88 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hZJKpjM1h6w7ISo7GGAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 75pQkFHd4LDP60VQPnjGXAyr102TTml-
X-Proofpoint-GUID: 75pQkFHd4LDP60VQPnjGXAyr102TTml-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEwNCBTYWx0ZWRfXznfzTbaj9HFt
 C+s3b5pK8Dpu/JaZBv3Z1JyhQ4+4Qwq1Pc0KlGff5GuJy0+2nSLMAYuCshqbVXmG/gy1KAUZl4U
 6Srp6w9O1N68llE464EIB/Nme3/TX20KYtEZJ6smSp0ovGrA5UwnWaJkGZ5PvZ/DVnvQ6uEyOzi
 8HRUZdTapXvoSfu3VpozvETTt6jJGpg4cwKHQHEhXd+5Nwp4j8UM9FKY4l+XVoYcC7hVH/zbvfP
 L0SQkyUiD5OINJPQxs3j2MIFF6OPPzVV7mnmji0ktg+ZeNDFbfV6DO718jUalRCd44P0gb6He0o
 nRn/AOy1DltFOGO34mMvLJf2VQ7631/YfyPhPukQPIyWA0iBBSulrM8VN76NmipTPYquctTQSGc
 9pFEzhUeJbEa7MEzrloX2vk6uTaqpzO9Qvc9xkyanBeCFQn8ZNII0we8ZmPBB2gslepj4xu0ymZ
 MDhnkmBQyY3ctKnz+MA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEwNCBTYWx0ZWRfX+U2NiI20FLxM
 gg1BIDv+tus3PFoluZbwyF1wyGACp3wuHwXKqJ0Vmt0a3H2wf7CUjZF1fPvOag7xHZ02Ofbui+Q
 y1J8S0oJjfrL6Zu5KmbLK4FsSMVP5Ak=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160104

On 9/16/26 9:11 AM, Greg KH wrote:
> On Tue, Sep 15, 2026 at 07:04:10PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> With more implementations coming in, one may desire not to enable
>> support for the PCIe-attached NHIs. Allow it to be built as a module
>> atop the framework.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Why would you not want this?  Can hardware not provide this for some
> platforms?  I thought it was part of the spec...

This is about the host interface/controller being attached over
something else than PCIe, not opting out of building support
PCIe-over-USB4 tunneling (I believe that's what you interpreted
it as)

On (at least) Qualcomm and Apple Silicon, the on-SoC controller
is an MMIO device, the ASi driver is in review and the Qualcomm
one is soon to be.

Konrad
