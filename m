Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BE91A6834
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978213; cv=none; b=YYFae3a03w6rck8xA3rxu5/yNgyv3ScfCPOelPp4Y2b63Knm6x5eekeVAZGwkPOkI+L2anZlQZ6JemLOUIYk9zQ56B6wMxnWaqkwIx0xwQ3drcsE4dAVrKokB63Pe9cnDbOiSIewsClbKFsd7oYYcMd4P/+lqQoQr/nrztRUIZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978213; c=relaxed/simple;
	bh=rKlnqLXl8V6UXo3u9TSsBqyAGh4ks3QBlOSYRYGHoJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDenuAiAw56GkLCAOIhYUTPR9tqaV9S24MBSws3HrY0V+5STmUjDVNtgOY62Ybm73mc1jSwfx/TfMSRiVB6uYSvF+d/VPDFGvaLd+LuXB68PW0uXj9+zr9Fh3Q8IDFVecK621Fn7HrOpimGUUg4Un5uZuGm/iX3c6jXLj/ogi7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMrqFDRe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bg2pKIH4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMrqFDRe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bg2pKIH4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7A0Gk607143
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQXQavybAGc4BtAZ7JoSR+X9Eu5eNUZkOTjr9bp+nWU=; b=lMrqFDReR8779C9D
	AQKv4bvaeZ4mPeMg8aKkm5C31aRWydJhwn8j4C+3oGdFGiLhxEoLIZ+tXqmRPO9e
	eDfIx6jaEt+7vj0fGCamyd2qfTLX8v1XOYDvpomzp5LLpJEdxw/DKi4a70Pn4laI
	dZu/JgalzJ1NqzVnYnImlIaOWX69bt2p/vJbDCZePk7VHgUakFUcNNyWJbMMUhpa
	IngfVMM807+LT1t7mHntTR105mkzcP7ae+uGQEhX8ZiuXKF5OCGB/gWr+Lqo+fcV
	f18dcMTN8K1Kk90U5qaOePRpQS+7hLwh4uZ2t6d9fou1WAUZpGpwDANOGI7ZUtO2
	B+l/FQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtu1eh8g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:10:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so34419455ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978210; x=1790583010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQXQavybAGc4BtAZ7JoSR+X9Eu5eNUZkOTjr9bp+nWU=;
        b=Bg2pKIH4ESzHLS6pu+2BSZo0Cn8Jo4U04kduSPtjrlcvaXWHALehVRgcF1tvifptAp
         WMYSxg+J9Ticy9vzzxumz9/K/bIeQHcntW5PStBcMP/TWrUmQEZs9UKZQWn2IFvH59VZ
         /lR62LvrkQIyTXXyab+6UlC5m2b321Usg28Q3S7/kAZA3cRTYIzzb9zYppMkyPhcG5/3
         TG0h28fMTMUh93KjbnXLEwmOgd+5rF9G57onLS0MA12UIbC3BF5j9t5Wi3Yjbeytovrf
         Z2aEF1wcLfm+W2i0rP3d1VpF6pM1OOqqyWjkU2kd0jukGvPIiwDSO28JhMhCDNzrou9G
         V/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978210; x=1790583010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQXQavybAGc4BtAZ7JoSR+X9Eu5eNUZkOTjr9bp+nWU=;
        b=aX59XVKqby4WYzfaYsOhrfdShcI0wsze3+6qsHm8/xvi65jvgV1hhV+Vc01tEaC7OG
         DkLF5yr/Hr8Pl6yklmGX1mhOUsoYZaho2CNTVhpFEWBCwi35yIOzxBbr7TUf431GZbYn
         HOQ91c3Wge6n1swdcNAtra78XpxiK1uzERcwqN6CaPfh3y34fAAeleyEtUIwRLou4nA0
         yVdQ0RvR/WPWkAsSrbjiGP/Z6wArMrkinbHneSGlVneQBHL5tcLmh/3kbOHu2nUG2G6T
         g3FBHI/FijspJaEM1HZarkC7TxyW/xvvADkiipw90lGF92xqbOouAT/MfrF67Hqv00rK
         zkKw==
X-Forwarded-Encrypted: i=1; AKwUvBwdd6sJaIKb2dy9LkUyZDo/p38N7JDv3XpO/qhUuCem7W/h6tqnPR5sdoRbt+My1s7rYQn5r+A1tFmh5xA=@vger.kernel.org
X-Gm-Message-State: AFuF++lQHvTO1DoVWrd+SWoLDHaFCGIhmXkOveq+8w9dt4oTUK1mLaSr
	4hf54/rWzuXOF4yhEldaYgldt+YdmfjeIotHgzF9Nsu5pnZ4PwblBLH84gdGflTnrenk4VH+Ep0
	10Q5we0cj06/S9Kx7ErsW7obFJypYbTEFo3pcsp6pH1MdvEe1dOmx1ycJR+CvR7Ex/Ss=
X-Gm-Gg: AYBFou2YCb1KmtCh3BgVtYAlPK9+5qQRh50PHfpskkazS967uiy6fV2cxbgxRgBdEM6
	QdyjfuJfriRHynyJJuFcOiN9+9emR9UZ3nWnXyVsLdlXmTp/rBptvJSrIKYCSDE1sOVsd5lbH8o
	Ear+q8HtVx8vsQKUtGNwf039rD/NUU84bN1AntBYfW8Nb3iXF4JxsLss/K5UHDugXYMFIbga6DY
	32fhwwj08U6t/UO4HUhqIgsEfi4GtU4CoIlbXLnqbpZodyXVuHhioipUlRgSldtHs4DV6uqYHtb
	K9dGxm+upXUX2e27JOhymbHsFvUg+ENxhO3jd7JBXrNalo+KvJSi4LRDhtRh5kNKtEK0goVc9V+
	E6xp3kkw/4rV7dnvn7Xgb8ei/oroIsA==
X-Received: by 2002:a17:903:26c8:b0:2dd:c0ff:e72e with SMTP id d9443c01a7336-2ddc0ffe9ffmr83871335ad.64.1789978210203;
        Mon, 21 Sep 2026 01:10:10 -0700 (PDT)
X-Received: by 2002:a17:903:26c8:b0:2dd:c0ff:e72e with SMTP id d9443c01a7336-2ddc0ffe9ffmr83871165ad.64.1789978209832;
        Mon, 21 Sep 2026 01:10:09 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm17124286eec.12.2026.09.21.01.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:10:09 -0700 (PDT)
Message-ID: <a8047ec0-742f-47f8-b5bf-cb1b32f06bd9@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:40:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] tee: qcomtee: Register qcom.tz.tpm service for
 discovery
To: Jarkko Sakkinen <jarkko@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
 <20260907-tpm_qcom_driver-v2-1-71a6b1752da8@oss.qualcomm.com>
 <aqyX3lJ1eNBmzbSP@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <aqyX3lJ1eNBmzbSP@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNiBTYWx0ZWRfX6gSyEbC7/7+D
 3RuGUuZELYZuDpvY7lKHib7rwCkqNYEgwG8tslftNiR0mihlB0W3AkyZOK/yL/NvzUNWADyg7G1
 oXomIcO+MhTtCWFcAHuBRb6PQ5U3TFQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNiBTYWx0ZWRfX/G8axGxjE4/n
 UsIaPYNagfF/S/aeOJRG6L0GOFQsf6bJeGnPwhgVTVPHrJ3XCb+aBKjtnPQMQJRMuvCtoLic4Hg
 3hHCaEfmclJtzQujW0eMJuPvYDe4XEig6TooM+zIPsZYpq4xlexYNX5npTki8PJldqJqAjdz+qP
 1nqI5krD+DTQOPsnsUF2j6nA9Fj6M+p2Id3uou4UNeZYa8ZxbzIGi5FhslwBxY5LUiY0IJBR8na
 ub1OUXJa8fcMsRn6UdT4D7KVB5TzEz8zixukZMYGZYfiyROulHAM4E6SDE0uX7w+F1fKrNJs7I/
 B5hoA81rnajkZdMeRFy6Yy310YyL0nZ3+KLzXDmKQIEWaGD1EoZo7RnEVLaNSPVUWcsSzOsKlo+
 IgqZf6vtUxuC9/EgxwlslR4oDYwpOnae7HqejuCuOl+aMpS/HVbzSbjiooD9R4NWa5/BWlEW0n7
 oZhK8an5QdjgtHrvAaQ==
X-Proofpoint-ORIG-GUID: Uo8WHCy72S5PCw8gjkYnT8LTainG8zo-
X-Proofpoint-GUID: Uo8WHCy72S5PCw8gjkYnT8LTainG8zo-
X-Authority-Analysis: v=2.4 cv=A6r5rKWG c=1 sm=1 tr=0 ts=6ab0e662 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=kq3ZzjkpYTjXZhaqunoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210116

On 18-09-2026 07:16, Jarkko Sakkinen wrote:
> On Mon, Sep 07, 2026 at 02:58:41PM +0530, Kuldeep Singh wrote:
>> Add "qcom.tz.tpm" (QCOMTEE_TPM_UID) to qtee_services[] so the TPM TA
>> is enumerated as a TEE-bus device, allowing a client driver to bind to
>> it via its generated UUID.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
[...]

> 
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Thanks Jarkko for the review.
Can TEE maintainers(Amirreza/Jens?) also review this change?

-- 
Regards
Kuldeep

