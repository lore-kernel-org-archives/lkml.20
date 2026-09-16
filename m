Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACC04A261D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549396; cv=none; b=Zyi4+znjt5v3IDN9UGxMGTaylKF4atCejhXpqFgDZH2u8L0GIdRDjfft3s/MhLfivJne328PLvJLYHPjVKEBe8HzR7Pij8V6j4nBEgQ1O9f++RrtcEJOGqJo5dA57khyXhGo73muWc+Ny8mVJPnJPSN34KiKT8PHNvMUkPd0oXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549396; c=relaxed/simple;
	bh=8UFeeybC4bmuxiusNOrf9sVTHbKx9+PFb0qkWwY8hmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XK0x2j+nMyakLFrMtmeQsVeYGLbyNjgcagecMfi4jxBe+ztalkg4q+3O6k/pvmxt0ejXdJ1OaJVFk0ZpDFRiRFLcOUfylNguleMkjvjuot3rzkrjqKaXlBYYRmuIZOgj5oUZVuP1mc8KjubWsbgtXskusqSmRK6qbB5bxoWesO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkbt/Ib3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VL5M4AC7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkbt/Ib3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VL5M4AC7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92qk3978379
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3NqAKzdAq254vliErom2NOcRQ+52lRi7cu+PTb9OTg=; b=jkbt/Ib3oZlFP/qY
	vx+fBsJvf/urm6HHBVNHJEfqN+K+1JycMarvEp7bms6ylGjyamQbsxxNuq8dEjQW
	8aCJo6pmz0ThQb0ww59Iu+Mt++3LWirm27pFMU4c/9zi/Stlz+FHxXw/qLaw5TZS
	YMulhlCOH6ZKCujjdwzPW+YdWgFwMjyYTi+MQGYguwylPkYQ+G1X6bFPtG0+wBCd
	/aPh7oS5HERU2ICluTxLftnoFtiaD1YCL1oRzVyKAsV6SryFHcOYkBEZ7ngnstpY
	g3VVCmBTxjoPKuVci6udACnFTxZsq/Ieupa3DZEmwSnYSnpruBwOSruUfiWYQnBq
	EVp1aw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3r3x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:02:56 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c748676f6cso1917436eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549376; x=1790154176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3NqAKzdAq254vliErom2NOcRQ+52lRi7cu+PTb9OTg=;
        b=VL5M4AC7hsBJ7HHuPMEpnYzQNhi8mJUQ4J+fRx3RX04ddN8/AOI6FBJN5gSyPeWVlG
         oe5LX7EypUpYOr6E3l4/IEnJc403o4aZvq709+h6wJibJrNJeevyjvBc0aTI5MODV7lL
         mcPTX3t+m3Ql+ofLocewEceupxEnu+WolM6iFyaGBMMZpvF4mvfRE3kOlS4j592A+kKh
         B6WChEL6Jn6BySBnbEEjX/rw2/yKINJYFk3NhXZMAbl0rVKzCTWmv7WxBkNxzN+VM2ft
         /uwCtBBSkZVRzyrP7NZ/Rc7c7yaVrPdYUu6vgwT93YwYHP2lmR1fmxrF5WYrbHt1J/Zc
         Kxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549376; x=1790154176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3NqAKzdAq254vliErom2NOcRQ+52lRi7cu+PTb9OTg=;
        b=iaEUZfpunXHKgSHtz3D0ih6kBqX8yl6Z0fbZ/C/3NHMfLgxbscJMIBjDNfljI4OsGA
         ftGJNRaO9keHMVMYJIydLHzCTGH1og+cNE8t1EyAL0pmboafq1868IGEc0zTslNfski3
         r2VTNh+Iz4KtDJWlYSZaNZcguDDmBtiKCFf479JTmrTHHN0RWysOOT4t/MWOMgvuN9Mi
         Pc3rvGPluxOmNxGAUATcc/UD5J85N5pzQnvu/ZHB1fnNy3PfERGpVi9UD+BFyQbc6yL2
         d6uOtt4nRcoxJSkXLJtvPia61oKC9pQxIXUm8hbtBNDxCrQD8RIePXjnhZBl/npGs8wP
         FxLw==
X-Forwarded-Encrypted: i=1; AKwUvByy8okg4EjAZF0OuemXYwTciwfyAT1ptzb3wXsS8FYr4VxifgjavNoeZoqGStP1qWlWF2ITSKSfb/5055o=@vger.kernel.org
X-Gm-Message-State: AFuF++kY/UYXjm0PvtfZYsQ555jEe/wnpQyoyY14oYsmdxaYTf8nJX7m
	7exha9wYB2B7RO6h4nwPPGGr21yYLQ+5D25PFncZeGp9ANQR0XpjPRi8XwRZCsM+Ai6Wi3yQVuu
	OrUyJrepkQfmjtfBlVcQWXyUYqGTaBxKLHxJdQVAaT/E8VNiaBV5E32QJodvTBt6F0us=
X-Gm-Gg: AYBFou2MjrgOvIECszqzNHFbK+aYsVBn+kD/W3D3BfzrBhuwVN14O14HfTGTXWtWrOK
	GB99+g9os5A6e8wJNnwZPzP8G+7gCX+GdRLvoePzXvA5RYy7So0rcl4BjxO52UaiHRqByWZtcnQ
	kIb9Uy5BZ27DwCNmfc4afe6cC5ydzG7Vk/zWgQYjcXeovrl21PLf4ZGJgwbvmyixSJkqPCTdQiF
	4WIq/Yvp9N2Q7h0Kl4U9sirGSgETjXTPQJodBkSkrt1038EX9ehT21igAE9yG8v/Zzbq2ISNx9p
	9txPvQQnjljnOh2WwD0NaRLYyiGqLvrMUulm4SNzSwHyEejq7k04oYpeiUvAE08C8W547IgFSWy
	xziaa0qyOnItXBdjo/pbAFbNQA/JrMqM=
X-Received: by 2002:a05:6820:81d7:b0:6c0:e39e:c22d with SMTP id 006d021491bc7-6c7d48ef8ffmr1847064eaf.53.1789549376052;
        Wed, 16 Sep 2026 02:02:56 -0700 (PDT)
X-Received: by 2002:a05:6820:81d7:b0:6c0:e39e:c22d with SMTP id 006d021491bc7-6c7d48ef8ffmr1847014eaf.53.1789549375491;
        Wed, 16 Sep 2026 02:02:55 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm6413732eec.16.2026.09.16.02.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:02:54 -0700 (PDT)
Message-ID: <2e5278bc-5f11-43f3-8e9e-b70786a697b0@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:32:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add TPM support via Qualcomm TEE TPM TA
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfXzVPAMayC0C6s
 cVo9D9O/GuU9+ESGUmnB7Il41yEHFuJzBSnlUMtkqNB1ap9H2XxULpmdkkA6UE2uyaB987X1Acy
 7bZoUwtWlJsNqbAiVCWieT9Pu62F1e91akYMrOc2q/tfS+VJOR/VllYDgnMnKeX6A64cxyGsYs6
 d6PxXzaMZ4JMBf54ge5Oku6BW7geiqV+43PBjr+SYKVcEVyEPIQIzucVPHp5IFQwNBW+Ak52WpD
 UirFv46JBNmNnFNyPnoPAmnR98qEotf1XGxsDF5uJkqfsZoLARrw+YADFyduluqMY64su2ng7oY
 isMAbfOh0H1Fxw0kXEbgNAAemCIOcEIOdC+6HQ3BGsSEkIRXy5mODUJkbYZJDWMDJ0zp83nvCdm
 wte783bpAPTKYpODPd7/6AQLVUcAuLbCoULFrLtzmUnuybGSByCwtpXMtu95mjWR0e2ST99ZCIE
 Vb3mJvWiGkr7BTcJ51Q==
X-Proofpoint-GUID: CkJ08imGOjg_nvom5J1GsxUOJlZr1osj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX8jVA0NbYU+7K
 yPZFTDNGnFIaX69CVrNf000J2zIx1JKPXwEYc+xdUXBPzVv/yNiQzG+1GTSXuLER+FJ1GMfDlJO
 MHW3+zeSkrYyR35HrnJyygWendecxUk=
X-Proofpoint-ORIG-GUID: CkJ08imGOjg_nvom5J1GsxUOJlZr1osj
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa5b40 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QTb_0JKWY7oM6lVZCfEA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160116

On 07-09-2026 14:58, Kuldeep Singh wrote:
> Qualcomm platforms with a discrete TPM (dTPM) talked to it directly over
> a non-secure SPI channel from the kernel. Arm's Base Boot Security
> Requirements (BBSR) v1.4 require that access to go through TrustZone
> instead, so on affected Qualcomm platforms the TPM 2.0 instance is now
> fronted by a Trusted Application (TA) running inside Qualcomm's Trusted
> Execution Environment (QTEE), which talks to the dTPM (or implements an
> fTPM) on the kernel's behalf.
> 
> This series adds a kernel driver for that TA, built on the QCOMTEE
> object-IPC transport (drivers/tee/qcomtee/) already used to reach other
> QTEE services.
> 
> This patch series functionally depends on below(patch 5/6 specifically)
> for qtee service discovery.
> - https://lore.kernel.org/lkml/20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com/
> 
> Tested on Glymur-crd target with tpm2-tools utility.
> 
> Validations:
> - Get capabilities
> - Random number generator
> - RSA key creation, encryption and decryption.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Hi Jarkko,
Kindly let me know for any review comments/feedback so that we can align
and shape next revision if needed.

Many thanks!

-- 
Regards
Kuldeep

