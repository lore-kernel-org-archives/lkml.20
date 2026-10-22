Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634116;
	b=5gE7QXftH2+Qim2MfHLG3jLvQFxD4imGyhsX3JIYJPK/Iw64oNksspcgnZcG2dqGQ9gv
	 nm0Nh64XuW7HOHdq6aDTNakKIEfmcXEeiF1kS/4Duc16u1le2bVIooC9lUazff+lqyXL4
	 YjPOYBKS5BgGo8GYK6ow4e8m0pByYILXzaHTICoYJrnTr/tVtkBMxPrNX2NTY29dFFBoW
	 bPWtXm4d+hH7/5C30KtHX9T+GcNTEKGn8c39Mo7Pal4B+MHe4vq6mR5pKbyOhfqgiOfvY
	 tUHnSYFpNNbvcI0hQXmnAuXt7zQeP5mTsv2yVpi+gytElvMeByzwz94khPgT57jbSUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/kyJHXtwMquLIO/WZE44AGG8CwDkp2gKhuwbsZ0JjBo=;
	b=mISLWUgbBZr8czmBLRjZh+QEzdlxxMtgM4IF/hGOI8qBvA7y0T7fdtSBXAhcmBqnzpR4
	 Equ/w3fq1Inwhab2oiSnwJYlYNd2YE/LThdXxTZq1iV/eeow9Wh4KFy2StBLgKpHasTOF
	 ItT0JjPmmmKBgbVSHUY+R0plp1D85fFF1ttrOurNbNY2EvujFPycyXmamx/R6wPlRF+pO
	 7Mv4/JocRLg1XMx7Qg23BUami7hm4fvnQZdR/rANJ630hr075VaQHQg6wP7ohUERrj92k
	 ko2Rer27VJKUQSBGD6nadtxNX8iRd9enCKzuBMq/xCM/h3BvJJVhDrZ+E/ZSqQQAJWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXu1HsDp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKxFyM02;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6BE606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB6BE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXu1HsDp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKxFyM02
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1ikNp2382022
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kyJHXtwMquLIO/WZE44AGG8CwDkp2gKhuwbsZ0JjBo=; b=VXu1HsDpxucSwKvA
	oXY86BlMf3HXMDHeoADE6kXGfdLmNrGr1md8hQTvOjKrkJ6nlsd5WnFWz1m/EOwY
	lebxhpOH6H1qDT6rcTNLSWIyjEfZUkHbClGqh7zHeGM0ugETxJtW6zRcCmoVC7+Q
	YZxiL/Piuselb1g05ggxVZMDtQxlywOnGFnDdhXYs2yHs/4LHa9YCRbiQpCVoDmA
	NuzTcQGhD9XRXOGI/Fv4NKPB52MoX6/KjvjEWmMzxp56NHSFlSSpiESA1PzhR/pR
	Uu9LbMROjg9CsZuR9e074ZUrN/Rf5wbaUOy7MABD8vdjy+jt+mwc/wO9I+T395f6
	fvuXJw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a02up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:55:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac6795617aso1174045a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792634113; x=1793238913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kyJHXtwMquLIO/WZE44AGG8CwDkp2gKhuwbsZ0JjBo=;
        b=bKxFyM02RB4omEtbB6Pdnn0sxOVB+DziKlo1lSPIvEz+eMLCJZ33xp4+HqBID282Pf
         hsWvSn8Nrxde8irF7nxNA0J7G7SNsRET3Ri/znQuuDV+HkXwC00CjfjGA2uFTNmF2sT0
         g0MasbNi/amwgVJK4zdMx8+uKO1o4B/GvBblApN7lsEh1jjAGcytU9d+kHAcgbFxvnHb
         JrQ54UXDM9Lvwm5NAa3KOAHXeI4inYqSLbxXRaZaUcrfvXKx4QUiyYVBfBsBROViQNjH
         vTKGtFfBgMqJXRpO34KtJ/pQeoeK6TfdUmGhihvuEicdhievcbMOZn9uNRJk3yoWGrrh
         L+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634113; x=1793238913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kyJHXtwMquLIO/WZE44AGG8CwDkp2gKhuwbsZ0JjBo=;
        b=GO0elZ/2e+qrsJVnsRhgFFR2DptOHsguo+6wm/ub032gwI/+t6NJAQ2K94hN/6rYqI
         t6G9p+p/GXENKFvEMR/5vIzj9fx0uPwtaTUZ3tvQyf5WEng8w8kfUqOSPF1CTsCbmR0y
         R5hmB6lF6oz1JsLnHQtUqQur4uJ6SQz1jZoWMyhzrbQPRsyFVizWs3yw+3xHduQVG2FN
         6NKEMExjshzila6DuHJLnzCNZjXyWmCl70bcSyalogjsEqOfXsvLlZAjOrKGbgvNFQXv
         dqIJoKCcXC45mcuedPDGJXv7H5V3Z1ulOtu9set8sd8Md1sE7Ewbt3dXO4l1Nvil4FUI
         wB1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwml4AqLDcfB6V26I/Kw48Qd/1xJljd4eHwtt00aw+uzW+V1DkuUhj5Im5/NmMUHIdCz5bfsi1tmxtYBOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMKf+oUf0CvZwncX4mlMYHRLnRFE2/0o6pMA/CFwA2+4BbNkvI
	sHRJJiF2/dInP1EdwGN9PauyVK7nNqlBIixM/Nr/DsquEom15tweohkUqkQMi3zVQlkjLvR7ioG
	6qHkZe7fO40UeCLnKZgkoQxBrc9115bsrxi3hMWLPfSGRuyB0KvmpLdX9IPTm9utalagPa5Ph16
	4/KQ==
X-Gm-Gg: AYBFou0dKj/R91dGMAFhzYjed9lZHHXT3qoa0vCPogoipM++9Wt4dWgcNYXHBBY2VV9
	E7rjLBBYkuUAv6tyChBsaUVscMh8fDWA7Obl1UgNLqJzmwXRhwN9sa8FPOmhE+h1cclMLNkbEkZ
	zlfv0Fiblupq9/Pics5+inV9LZM85jUI8a6jfdg2NzLIdPskwO0vEUbUQTahK0TrkYElymYCXW8
	ZbgydIubuZ1ZvrzAdHWrGEjoXwK8XV6H7vGhTqNLnY0vqogmn/MGlw/omEfXbYPkyKKXXLleGvN
	WSiuCM73jScAKrhpXRz/RDS7ox1F49Ia9D9Vg6yN/SqZVPK+yQroKovzqotsPqRM+s6m70lSzk+
	yuyggMWcOHIdWThzOL7eZyY9iFu2Hy+GXBWNsAc/MhFYatPnFUepB02uhGMW+q1O0mrM=
X-Received: by 2002:a17:90b:548e:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3ad86f23619mr3099479a91.57.1792634113316;
        Wed, 21 Oct 2026 18:55:13 -0700 (PDT)
X-Received: by 2002:a17:90b:548e:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3ad86f23619mr3099454a91.57.1792634112731;
        Wed, 21 Oct 2026 18:55:12 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f9e392sm2529254a91.2.2026.10.21.18.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 18:55:12 -0700 (PDT)
Message-ID: <25cac2ee-7696-4da0-abb5-cde8a21dff15@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:55:08 +0800
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
Subject: Re: [PATCH ath-next v2 6/8] wifi: ath10k: hard-block the radio when
 entering WEDGED state
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
 <20261021-10k-sdio-crash-v2-6-5df80bf16e86@oss.qualcomm.com>
 <CAFEp6-0WLtOCGQbhybo21WWX_ZbE6_nRVQLq-Hqddc-+Vvvafw@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0WLtOCGQbhybo21WWX_ZbE6_nRVQLq-Hqddc-+Vvvafw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAwNyBTYWx0ZWRfXyOqf8RJGOtrE
 SzU9ycBeUaWrtnd+cyOqTM8ibhxdvWfPFIBxy7HmlBe00s8AOVcLGEgCeEKjXShdP/+/NrYAD4t
 R/xtz0riChXprY5PYKEC6E1Kn8qeRDkzRCRKfEQ6CQNptOMNBNrpV+Lg9Q9jRhnQ8P1lIIT9Bgb
 kMHOZp/YrovIVlgnEV9CHyA+KVvT2ygr1aQTIloujZI0VLVByfnn8dMzhrYc4O+oHVXdxY1NQ+k
 pklJm7zsx8GOZzBpjTpaosflnC43MUB4AcgkSuzQ34+6TErtW+W2QhrxgWNvP+N6SyZ76h7z8Md
 K9VHpg+8vR5RJaqkO0fYWaR7MtV0TO4b7zz3DDyZI9IGODKhDoXGbiKtNPwSA0wgmikKt/Tq+Nm
 8ycyaZmwU/AC0BPlfhYEfiWmUU/vc6xNOAyCa9tbnKZugcCvELdESKzpOrHOCEyykb9+sXctEjA
 ulYSntg+03KBIWg+3eg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAwNyBTYWx0ZWRfX73s8a4xDJTUE
 zIiVQl/H30xdd3m4z1Fb4V+zMqyf/ikEZ82xj9ZekTscpAfe9UcswWixeFQiTtDtUAzluhT+cQ7
 qNvLdvIDaBYOhYFxbblIgogo+Jqcj/g=
X-Proofpoint-GUID: pS1-XB_shz4JViweX0vIajHgLYvWhU04
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad96d02 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ygjDnIpqFwOlN7mGrjAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: pS1-XB_shz4JViweX0vIajHgLYvWhU04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220007



On 10/21/2026 9:54 PM, Loic Poulain wrote:
> On Wed, Oct 21, 2026 at 11:10 AM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>
>> Once ath10k reaches ATH10K_STATE_WEDGED, the device can no
>> longer recover and remains unusable until the driver is
>> reloaded.
>>
>> Userspace daemons may continue issuing scan and connect
>> requests, which the driver can only reject individually.
>>
>> Mark the radio as hardware-blocked through rfkill when
>> entering the WEDGED state so userspace stops retrying
>> operations against a device that can no longer operate.
>>
>> Both WEDGED transitions already route through
>> ath10k_core_enter_wedged(), so adding the call there is
>> enough to cover them consistently.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index 6b6b80242cd1..66585cfa6d96 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2521,6 +2521,14 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
>>
>>          ieee80211_stop_queues(ar->hw);
>>          ath10k_core_wake_all_waiters(ar);
>> +
>> +       /*
>> +        * Signal the radio as hard-blocked so userspace (e.g.
>> +        * wpa_supplicant, NetworkManager) stops looping scan and connect
>> +        * requests at a device the driver has already given up on. The
>> +        * state is cleared only when the driver is reloaded.
>> +        */
>> +       wiphy_rfkill_set_hw_state(ar->hw->wiphy, true);
> 
> Using rfkill to signal the wedged state feels like an abuse of the
> interface. Have you seen similar handling in other wireless drivers?
> Wouldn't wiphy_unregister() be more appropriate here?

You can grep with 'wiphy_rfkill_set_hw_state' under 
'drivers/net/wireless' and you will see dozens of related calls.

We have tried wiphy_unregister() during internal review, which will 
generate a lot of call stacks(more than 20). wiphy_unregister() will 
call into ath10k to perform many operations, but at this point, the 
ath10k driver is no longer able to perform any behavior properly.



> 
>>   }
>>
>>   static void ath10k_core_recovery_check_work(struct work_struct *work)
>>
>> --
>> 2.34.1
>>

