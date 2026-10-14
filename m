Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6297F5111A7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983858; cv=none; b=QjUglCdzDOcJdOHApXZb+cDE5HN9uMW1Ff0qbElRTiMAa6Hq3IOZDuAk6ad5sbr55YaoanhkKH9S8kk/1eh7/6Kjv2SHzMa/PDd2a6Jy+VNwFWb52E9A6gOQnPOarHPPaA+j5dyr7tV2aoBwocI0YWeQDxPdKapGdf4M/kOHwZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983858; c=relaxed/simple;
	bh=NAhNj+xAYKXjwTf4Bu4MG+U94N39qFYkCb06SSvAYiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TrMucwoPoS7l2+PALiBgF3t1aw5kQWlbvyYaqsWUC1oltHXuXJO91R6eMrKnf7YXLwgeb0ME4+PR0YdfQLY9nN+ATMFuuY+GrYcYI+8inmwntT7n2q9qOFFhsxtQ7lQ+pgRf3a5cOr1DDo6tjey5D2etY4120TjuOiGLHziFm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCdxPO/6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9MCNMKZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCdxPO/6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9MCNMKZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBLv0O2516033
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vmr9fYYhrMz/+NTty6Yb5DMS3qhB8lLFFLzfZXJtLww=; b=KCdxPO/6K+SOR16t
	VvioE/s5u7GQ6HhRNcXzGbSjQ1HPMDslfihNbr9hqD/v7z0JZnHmE2OvtGZISgQ+
	yc0/m7lwjVj3DbV1vgPc1UYX2hTVti7/VyimwojtDshyUZfZ2G8ObqVCT5G5jrBd
	kPuz9LuiG3JE5DCGBvE3VZZqb+QCs/qp9rtio+6r2lOl/NVob94g5Icfq3mpznfD
	3AAshC4ZLiiaom1h1nXlTxI54zlizxOTFret/w1XA0dDbV95RRs9BdCHNf7T7MTC
	c36nVMqWP9f8kK41Nee0oCN6c2KbSny0EH6QIC3Uu/kquJWu4Gr32yngJDjjFmzD
	AHLu0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709q1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:17:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5356c6d98cbso11825751cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983855; x=1792588655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vmr9fYYhrMz/+NTty6Yb5DMS3qhB8lLFFLzfZXJtLww=;
        b=E9MCNMKZtih9Rdj4nmZNXOxYgqH0I4ytmcG5J40MLCOr7lbXGR2ycwS/brxI2UeszP
         9tOigd+bzfvFGFuVxxgWuGFrt5MbOL87eTRevAo/vuZVvkb3yY/rfaG2yPuCkwikfPso
         NGoshtnDodS8vQgmE6aikkjwyMrfFURnx/NVowgqkJbvCJt8mCmChSQFTm5zhj2iXyeH
         q+4zz3uZPOpi5wl4F2eyHTxl2fN0XEaDOyvC3Duz/L7+nUo7sizkFmplY7iyDRKq3uDJ
         OwYsEu1SRswBSBUKpWi39RQxwxBPWEvw/Sd5spK88YJCixIvi2UVukbavhA4YWjZ7AzX
         5Idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983855; x=1792588655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vmr9fYYhrMz/+NTty6Yb5DMS3qhB8lLFFLzfZXJtLww=;
        b=cD2Z67NxkLG+in1JzX7ME3zuQqfqqkuSpK/K5E9Kcgmi9ybNtmJ/Z4Kxke2B+R9Foz
         XUeivfuH86GU8B2Jpm+jXBXMQam25Xb4Nk8TU/vBZGzHBgMRw4c4MuMIl8Gax1ZjY2FY
         tGZ/kCYaMVt1JG0Qz+UyPO+jIKHozww+JhfpnoJCJCs2VB/MJstkvtYOq7xxz14BTCbo
         cAg8DiugTlMTdhINnNP6TAniqPucX3R9cG+y2W4YL8uqBA1BdZSKof9gzhm0FFjvZ82y
         D3bNRDIr/TxuaCsPnAgQuQK8gZWWrPXEbB/A11Ft6W/tt7RO5FNwTlsWgQQ7/ntIL5MQ
         JebA==
X-Forwarded-Encrypted: i=1; AKwUvBw2OcMxvdJM06X0NvT8saSdq9WdT3Y1gMJdGRqGYLvWhTR+NtmqO1MJ9pe+hCiZcjtnGgHy7AVAVNLL45o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7Af8fjSjam5ACt6Hl2Cpp9G0KkmcrZCGoJyEBXXMO8KC8rQKl
	Jn53+R+DR2KKeV5GGsN/o7ilflkWX9BbsUa8HtEJVBnB1txmTinzfqYIEP1KcWggvhuwYcEw4Z1
	AOXB2N7BYQjs8PUuAzxTuTJWEi/o9BShVYqCQIHIs7tkhQL2hMLVDQnVZ6n8WdB7P/Bs=
X-Gm-Gg: AYBFou3ZmvflxHbziD5/29wTtv1mdMrDGGvHN5iyAU2M2kUQSj5bdj85bAmdb1+H7s7
	EyEi2N3pt0JZKQxdN8A7CzjdAl3b9b9gknk6Oj73BBVdh5qe06kFiC/yCVj83NGHopeYaCRNSG7
	nbY2qSupD42FXhgHQdDbDLH0bguoCJ3wVTFzTx2/N5HHTAi+V8G46DGO/zXbxMShG6Q8pOSZvf3
	inpD3+gSrSQheZ8bNkLB0e53J49k/56A6+SLAlsmF1CVS5+Wcyfzq/Q6R6bzeuomsVxuEKAhaDh
	D0cVRhYC9isImIx2owkUg4PyURowOib4zh7rzQKsM2l1k6LSiXZcOEo3rwzX2h7pTYTyebJJBMx
	2plOmZWGi/Qev3Vcx8S75Ow==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2938895885a.4.1791983855457;
        Wed, 14 Oct 2026 06:17:35 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2938889785a.4.1791983854924;
        Wed, 14 Oct 2026 06:17:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d704c1sm632732e87.25.2026.10.14.06.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:17:34 -0700 (PDT)
Message-ID: <230a39d3-6957-4203-a54b-88c871092e08@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:17:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "i2c: qcom-geni: Fix hardcoded clock index in
 SE_GENI_CLK_SEL"
To: Birk Skyum <birk.skyum@pm.me>, Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
        Daniel J Blueman <daniel@quora.org>, Sasha Levin <sashal@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        regressions@lists.linux.dev
References: <20261014130805.48840-1-birk.skyum@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014130805.48840-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX7R5HV1D7AQ+k
 HmDMj5djverIifAdsmtMd3zDYaV+OiH4HsxWgZvi9xVfOWnjoAasO6hAjZv9p60gq3e8NLLxI6a
 z7VjNHZSKwqpjgjnnRK1EKhPH8fKtJ1k+SLFjinxqQuFTxfaYXh6rN8qK6kbDvVDoSrXCSjTLOR
 y65f+qtUmvi3CBijp4MHiEP1vWw71bUJh67VOSAFrwc/g1JF7M7aR+ElQ1de1LhP28Jiimzcm5b
 cd4dZkuhY+wfGWSqVLhMCpOeubqzRHU+GuavvoptdmRcvl0T5EjInae+vHjIfzo03vkGX5Fmt54
 StxpST7r9AIPoCTOl0iwtUrOyCtrqKnfnePKc6ra1E9Sy8c4EhdceVoiBLZNc7DoHCvXDcGdW5R
 zwTRt146/i4rPQ4GuablTlswtsJaN2/qK4+fWUnfmssa6go5kq7AHB63r9DS0qjdjMoRR7gAWdB
 wnFL0nJIbJCBDXPUmPg==
X-Proofpoint-GUID: -l4SifpxnYk5QLSAs0_Q2HJ0r5tZfQNu
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf80f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zjrlJ_9gmUhWjCpjid0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: -l4SifpxnYk5QLSAs0_Q2HJ0r5tZfQNu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX4rouNA/aRQaG
 QcDSbYEdqComb/PQbmBxXgFsoBzNFpFyuXP3gF43bxg16tJnz45PrhWGcCm5RqgNk2W6zU0qxHW
 o43lXSgEshzyaz/yLrtKGDJuJd3+4hs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140052

On 10/14/26 3:08 PM, Birk Skyum wrote:
> This reverts commit cb97bf3d4f91453b881acaf8e9f0cc47bb40b604.
> 
> With that commit the keyboard and touchpad of the Lenovo Yoga Slim 7x
> (x1e80100) are dead, also at the disk passphrase prompt, on 7.2.9 and on
> v7.3-rc7. The first transfer on their bus fails.
> 
>   geni_i2c b80000.i2c: Bus proto err, noisy/unexpected start/stop
>   i2c_hid_of 1-003a: failed to fetch HID descriptor: -5
> 
> With the commit the I2C serial engine clocks read 32 MHz, without it
> 19.2 MHz. A fix for the 32 MHz fast-mode timing is still being
> discussed, so go back to the previous behaviour for 7.3. This brings
> back the hardcoded index 0 in SE_GENI_CLK_SEL.
> 
> On v7.3-rc7 with only i2c-qcom-geni.ko swapped, the keyboard is dead
> without this revert and works with it.
> 
> Fixes: cb97bf3d4f91 ("i2c: qcom-geni: Fix hardcoded clock index in SE_GENI_CLK_SEL")
> Reported-by: Birk Skyum <birk.skyum@pm.me>

(this looks funny because you're the author of the revert but
it's fine I suppose)

> Closes: https://lore.kernel.org/r/179173732257.29426.7905170638383807320@pm.me
> Link: https://lore.kernel.org/r/ae03e7a3-75f1-42df-b0e6-0e64358be647@oss.qualcomm.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Birk Skyum <birk.skyum@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
