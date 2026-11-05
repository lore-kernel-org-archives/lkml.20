Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894177;
	b=TzEF2qEwFLmZTxZwuEXJodqzGl087YJbZJ/3rBAU956v2ktTxmePvdAiHWocE/hJPP2L
	 pGYwVb/TC1HeTqfl+p+0cVdQHAUJKVovLC4f68zuhfVaA/FKr464bHjaVH8Pz2f55TNgw
	 P1SWdajyzMWf+yDvGYj/wv3woFBgJ/CQlY0i+OtcUzHywBBEG35Q/qgrifeI0S/32RdES
	 uEUfUwpunQwvWt19mcWS9WqRknxU4+8qGzyjuo2HK/peloZelkY7o4BX2nd1CtjCdgZvU
	 pscBNVkX89mBgyzT2qEeMSbzgZgBwKjQpuZMEa1cONuKJFkppl3b5DhLRcXKy3BQtcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ki7aOO6TrYV5ON9Wr6DiwhdoVkN/dGBtKK68o1BM+SI=;
	b=gWfK7/qM2+icsQ1hW+c1MmZla+jS7t0uW8LVdqkvCvjHd1DkPZlYO/Q05zbgdZcQWe8Q
	 R3OIWCvmox4g2nS4TYgKqU7ChwN+53aIiQW3RwAM4Zs+upTrX1p6tRnItacV6Yf5elzK9
	 rKOpEWR/QlPyzz3JAGIHy0ORiC48FQUQ6uYAfRaaOXe2zEDbqcpR2qPx7gHuV3KN8IWuu
	 Yh4sa9XUFe08stwJbHYvwcK6EGe96Qx+pXrE76IAO4dPP9+U2vt1LzgS7RJ84q/7SlgwV
	 GVtRRSGwv8VRXi074Ux1bi5gcdpwMI1mJo7HHfHjmwWMNz8snBDV3F95jJE2bTwKcXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGBnFV2r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kj1QSodU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D22606E57A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D22606E57A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGBnFV2r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kj1QSodU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EPsKe2081288
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ki7aOO6TrYV5ON9Wr6DiwhdoVkN/dGBtKK68o1BM+SI=; b=VGBnFV2rEK4ucWip
	EowChD/fmUTCxMEcHGvovQsTFk/mw6GNfzfQyRCq3ob0jai2N79faah9M3C5FvNu
	AuT3kNRGuRprGpL/VWoPaeW4WruB02+oul12V1KxW3ZpAlSGw3qGA0cfOApRb4eK
	7XtD2EJYplGqjKpQWhG7Uab5DaXq6wGZA4XPaTa6i5D85uXZZTden856MxEJH1c/
	uNzRD6nZam5vz7rrEvkbjEiaHSDSQdnV+43cahZkERYBdSfQIMeKGqwMnn3delAm
	aL2EKUsPvxmwvPizsvDTj0dSsoKF0qvBAK2a6gsMCKOo2goLbAWQE16hSxJTZ+sA
	9CZAIQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraasae2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:56:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so100118e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793894175; x=1794498975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ki7aOO6TrYV5ON9Wr6DiwhdoVkN/dGBtKK68o1BM+SI=;
        b=Kj1QSodUVuTeyhUZgfsuUeWfint1bplIhadjKIpAlGtCE2AQcM4jpmV0PWh01tQJJI
         DxxhuQLPdbXAXyc4Y873hqE+1uudhOPuoSa+Xd9+nOg63LvlsYUW+3w9MeQ3J35lY5PB
         lyVYr4iH5YEx/kmy4Za912OP8Gr6D9Ms2RmVTFTZ+tshLaE9jZuj9N/e7jJ9WT5WtW6c
         1+mHSv7sbRievhtVpHfn0Mkpfc7zqIc+TGeOOOqdMXNhPC0okJvtBranXgT6xY1Akl8q
         lTNCfDpzGu5JZnBflddrHhM0dSHkphNgRjB2PFjFC0ZehfmiZe5AkdJHqfsN1lXRgai3
         Etng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894175; x=1794498975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ki7aOO6TrYV5ON9Wr6DiwhdoVkN/dGBtKK68o1BM+SI=;
        b=s+oMxmIdpa2bIOQar1NxvqYLpohJ5lHtbmvEywN+BcYdvfamj07kWLkQCkaRZwg674
         aT/FFNzgJYvO9GODLiCvbqU+YnW/n+9Ek+4pqUYS2kMrL9UX5B3l1QNiXVb8PJLwtsyd
         8S7fqD7qBnXhsJcbtVN1MfFn+Jl2iSwNRkC2uCJTmlbZEbm9XQKte5kIOB8JhUMw5ksi
         7+oNk7+rp9XTP997Z8Dwc03HnPzD5jJgxXQANqyCUvJoBkapO1JA6XONrtN2xseCnQhk
         rFS1DzJXqDU24VmX8EtaPOaQRD8VgGNNDqUyU0csIJbo14iR+qFHNCFB3AEim9EAngf7
         CsbA==
X-Forwarded-Encrypted: i=1; AKwUvBx4nGDp0JQdKXiZvjsgMbbAQLt6EilxiF6+mp8kwTzWnbAYmGHZnl6ur1000iv4nD7Jv2liLHo5SGiE//E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kGe40GyWtkghUfEEXtwrdGh7Rq7tfe4Y/zm5WKuf/SCVhy44z
	J9iucHMz6OTBswBI0PjVD/elb3BnWLy4LO9PWDhu0hiJOF3qaP857xYVTrBhPLZbN7tARZRwWgz
	KLqav/p9y5iDTD4Vm7cWvahKxyyEDf/UJg/eap54BD02NHvB1Shr1iWFQkE1B73d3+Nw=
X-Gm-Gg: AYBFou1b9f9iQWo4U63J5vGFEuSVwe5UaA0xQu3F5IdUv73ouah2hVxEnFkZL+oLg6g
	s+lixUPSQFndo2JZ5Yb4sFk00hHs61cys2qECNkIaOsP02MHVlEb2hiY2hHPK4/HRIVecUgtvp+
	zhYpkEupWFVTXdiOMYrtQaaIobVxizvXMAIuEQXwOhl57LcG4yBFBTl3LasVCeXJz5pFftUNz/k
	sgCxIUXduqBpsYOUA7ddzf92p2wnln0lpgRX4fmWFzHblvff/Wsw9ds44+g5ZVODz2RnHqg99aw
	SA7e/N2RWWAj4RoQwOUZ5z1+f0ELhKK4AhNGAG5EQBjXDA/Nj972LE6gTL5win5+6WzAEE9+/MZ
	H3jfSztd1GuX/3OJ2H9+MmZ7Zd7Pxc2mC8lxkW6H5o/lapkBb8awv9UgyZzC/UGmB5C9M
X-Received: by 2002:ac5:cdb8:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec7562c7c4mr8492610e0c.0.1793894174907;
        Thu, 05 Nov 2026 07:56:14 -0800 (PST)
X-Received: by 2002:ac5:cdb8:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec7562c7c4mr8492581e0c.0.1793894174381;
        Thu, 05 Nov 2026 07:56:14 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4422d1sm186151966b.39.2026.11.05.07.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:56:13 -0800 (PST)
Message-ID: <076f0e7b-8fe6-4e9e-a0bc-a80ee83f879d@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:56:11 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_wcnss: Clean up subdevices on probe
 failure
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261105-b4-wcnss_unwind_send-v1-1-ad94209143da@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-b4-wcnss_unwind_send-v1-1-ad94209143da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX2Fu7AkFRLNSq
 Xu2JkWgN1BF0BiB5+0eRJZg+/5TrUM9O8jSpmRAxiCa2/URpd9LWh8NR+v2IkE1JcnOjWADNF0T
 aicM9E0z3002AiDc4Ni1bM+AtYUj1zc=
X-Proofpoint-ORIG-GUID: uV-G81UqokAoDXHbhr23G1Ue-UmXWl_V
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aeca720 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xmF1v6_2wodPUg2ca20A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX8uu1E4+C8TcA
 /K8bby3utKFLobNVRfO7hY/XhWzX919F3ZmRf/vLE0WzMDSJjl2cmwFtLjrw7TNnxr030EAogQC
 wVrF0gs3CSbv5Yg6BZF5jdjC5oxKkiL2wGRJYvH8hCkXUCrl3U4DwDN7duz6Ul9bVtthlalNdvA
 qR9+pjUjtnAI7gSqQHiErANNePho0l7cyyCa8wSQZ67LB5aZInnV7pZgXDUTEF70+Pe6tOEdHR9
 6xMA+4sfEMBE+Am4Gd1kJWf274gLq65huiGSVIXaQo6jnrj5FmI69KKgdaJjBIA4oNsl7wFjwMW
 cpHO75DNwwOkmezshPr7znunP31MI/ZYP/ZoKgzZHS9q3Ruv7W6GJA3ytzF6LWlF7n7NvY/pYkS
 JInn1bEukgfxjo4R6vBbU660DEH7Y82KFsrzalYYe0DzSY3QPOUVRFDJ90xE/2cNLdF6aqp45SG
 CiFXBwNH0bK8fhA+n8Q==
X-Proofpoint-GUID: uV-G81UqokAoDXHbhr23G1Ue-UmXWl_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050063

On 11/5/26 1:31 PM, Anup Vishwakarma wrote:
> wcnss_probe() registers the SMD and sysmon subdevices before the iris
> probe and rproc_add(), but the error paths after them only release the
> power domains. A failure there, such as a deferred probe of the iris
> clock or regulators, leaves the SMD subdevice registered with its
> smd-edge node reference held, and leaves the sysmon instance on the
> global sysmon list.
> 
> Unwind in reverse order of registration. The sysmon failure path skips
> qcom_remove_sysmon_subdev(), as wcnss->sysmon is an error pointer there.
> 
> Fixes: 5a856bc63ce9 ("remoteproc: wcnss: Bond SMD edge to remoteproc")
> Fixes: 1fb82ee806d1 ("remoteproc: qcom: Introduce sysmon")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
