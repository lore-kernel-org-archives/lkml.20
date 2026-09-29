Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D474E66AD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689999; cv=none; b=a1yRXIdvfQ6yieqqgFwqcrzwfe+EsFNX6GGjQvQ2iVsXVZuQYB7w2xKiJb5rqROl++y+ES0n3y7l4CZrS4uwWctVGZ+Skgjj1DoZJOaS0lRGOCEblkpul5zxlf36VR5tReTZRfVk4V/BQ8eIMQ05DfcwLjdpgUZjrlyvAzTi1sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689999; c=relaxed/simple;
	bh=NGcQBUy/y8+mknsQ9ej+7KsYaNPkF4KzJOkKQV5Ibxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPyvEKmFokx7LivhZNTITczrvNrqaWQdEnE9+2Aogd4XVg3dGBMM+54pW2b7K6bI0xTv4kLRQqKtFDynX+hFmCr6YbwpxTvCAeVP48Ni3CgD0gVEcYZwmZdw0IAiIVhdShUyxakpvFkGoySSbgo1O9uBZVUUJftD0wcLfcz9/1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtVSE2VZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeNndwCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtVSE2VZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KeNndwCe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqdxu349929
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDG8O2Xi893kxZ1X4lsNGubwTtFSLtBJs+F+MPecEKo=; b=AtVSE2VZCHpsPd3K
	a2Qpu0EXbIc9jcHhFlbYKAzRZJW8XXTAh7k4AhWO+FU4BPOKuJwejJJYh10KMzfq
	jIMH/fLMm8wq65O3gTxWKEoz0LIeCgcXDfdAJafqULodZtrorCcm17k31AA737VK
	7xSKevuykbRRNqXNBQvA3UQeSscf2zsHKzZnhr3yvopm+FvqFpOtPU5QBN+67uOg
	XrbX+uMHVCWQkgQOawy5Ae+HQtgKeKP7mHDjVf/NbOfL3Uiv3TduWe8zI/udL6WA
	RqBH/e8ErhZlmLBMkIHFOzIvfPAgS7IjDNx9A1bGSOthFePVig6izjFFhlnpedGG
	KhxbIA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkk50f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:53:17 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a45b3f0bdfso7104603b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790689996; x=1791294796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XDG8O2Xi893kxZ1X4lsNGubwTtFSLtBJs+F+MPecEKo=;
        b=KeNndwCetlJY7Lil6unBS3vKFuA0CbOkCE9mSdkf0Gb76hFemG6EtauSWfWrv5VEGm
         gb3lGxn7LRn00a2JOrE1xPiIIy9uhZSmXIwdYSN95u3o56lFVJP6asQpEAwURIsMf/Rp
         tI0lvb+agzlToh1g5wRcw6/txbrOo4CwpPTrcVUks/cWtsZVE3opMBwAOrwuHif8ocBd
         4PQh7+axECjarFJzeFTO0T4jxNFOoz6apTeClsfC78LS+5Y0UWyeIt9I2R/hbAgKHNyG
         7JUWHdLbFrI6TW2ezS18mrssJwjTOqS+ldSo4e4yVpvq7XiNU5C/ZJ2X1TFJOflMYVaS
         M2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689996; x=1791294796;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XDG8O2Xi893kxZ1X4lsNGubwTtFSLtBJs+F+MPecEKo=;
        b=atW18OohI9N7MSqwzMkyjU++TZh34X4Jyur3PeSSZGeZZAbwLOdJ0Xpki4Rqn/+ANa
         FIrMIjKb01r8gwaJPXgI9UaevMCOPgU3yKxA14ECaYsSwFNSOds+gDg7hPHOQEG5ompc
         2sd5CZ7t43yp4mx3jkG9ZtSCAPOunwxd+1UpxGLquhJf14wN/HZHdq56K9MZzte7OoYe
         AFupFqvbBLPvc2MtKSOgY6n3LovUK+XTkNpJfrmquHta1V8vRTRynJqz+FAIjCVWkelN
         AzI2NwIcTwxKEQXfO5eM4dpkhdwtGmIC4KQjkB5rMl+liO58vxVy/JmATmqjagTaUnru
         NXKw==
X-Forwarded-Encrypted: i=1; AKwUvBwaoqv/v08G5AVvr/Nf6y6U5aWj/DHB4MSmrbJzwIx1nrIxsaBxE6hBR0je/HBj9O1H8m5/zECNN7Jwdc0=@vger.kernel.org
X-Gm-Message-State: AFuF++nv3OmNo9XjHaTm1iIYZ8UEJgTvgORTbwYMf3fesazI6gT/bpyz
	PFXnTYUIFPYQ0nDNNJ5DjSgBTZ10aZqMJoRluxu30mTzDEybKPqr83BXz/afN1rEHV8i4QhewRU
	nqRW5tO1OGWJpJR6ik4Zgzm+LwnbfWvANRaCLJYbVL2N1XVAmY/SVHDd64jrQtJG/PEU=
X-Gm-Gg: AYBFou3hlUP84dMeaErlq1ExsV32i856LzTI5DZeHbYbdFW0DcNDKEXjDHtpYptf3us
	kXzOvBt/LY4LDhYwQH7ZiX8+ZdtTdSxtWTZkNIFdVro041Gf4EgzrLm0FXUh34thv/e+byDnD1k
	xJ0jzT+IBwgTN1i/453Cs01h/aAEMXQsi+Dpj5He3YJ7VQnLzUlsdt56S6qiyaKfpdgnbZvwxFg
	YsasSoGpsTz9kBHHRNyocVkFUSgceSW+tJ4UoOpSzMFFOlz90DIgUyXvFe6Y5hS66rtn5KXi9Wf
	C4HGHUVqftwmUNJyUbEUOITNxxxUCQDWBrs/Ka0N8maTZZSC6+563VsRNUoecPE2nZe/MbMdksv
	ClHpUvMRWbE7eZris+v+CSZEjHEwBThu+lzY3teWTsF0FFjLHPBxcbqBtpysr
X-Received: by 2002:a05:6808:508d:b0:4e4:fbfb:efc1 with SMTP id 5614622812f47-4e4fbfbf617mr9776233b6e.58.1790689996288;
        Tue, 29 Sep 2026 06:53:16 -0700 (PDT)
X-Received: by 2002:a05:6808:508d:b0:4e4:fbfb:efc1 with SMTP id 5614622812f47-4e4fbfbf617mr9776209b6e.58.1790689995778;
        Tue, 29 Sep 2026 06:53:15 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ebbbb2324csm4691834b6e.8.2026.09.29.06.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:53:14 -0700 (PDT)
Message-ID: <58cf630b-94a8-4f72-a025-f9db0f2adad7@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 06:53:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] wifi: ath12k: avoid IDR mutation during pending mgmt
 TX cleanup
To: jiale yao <19888972804@163.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260926154824.75224-1-yaojiale02@163.com>
 <20260926154824.75224-5-yaojiale02@163.com>
 <773e57da-a9d3-41dc-805c-cb38b38b1dc4@oss.qualcomm.com>
 <77a815e.77f1.1a0e71f6167.Coremail.19888972804@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <77a815e.77f1.1a0e71f6167.Coremail.19888972804@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX32xJj9XW+4pG
 ByCwt4yWx9cwXYsyxmwF39BQPyTKF1kGj2UQaAmOdz0Cyli8Q98lrFPqhnefUNtl0O7WwtHt0TD
 0Mb5p14pjsvzzlBlyXp8le659cQbA3n7LLTb1ZSsM+myEr6m7C0XfQ13s4XYVzZAd4LRDRHRMXF
 wH0gD6/XFh0VPg2BEzMeTKGHi8Lzz9xf6yxHlqihPoK5Q13H+l8Zn9+u3UTRMPu1nshMIksoHSk
 x82/EWLRGyi5poJaHEZ3mT1Jb3NLDFxJyPIveFHhFR1QRPtSFbiEBKYwwZqZvCDsjkbjEdWoLaU
 +AgHPNNlsbbMG9oAIunQede+IXnTSsKyDz7yweN0b3T1svK3T4e/Ud9vKLNJBvPCXlf6KPfgkVi
 ybJ8Imm7KprADXnWwhRZftfW10kn4LgmvT423qXbHv9oKZVey5Yv9gXrpo06Bcz7/rihqPqhT2+
 kTBxa6PdaH6OEwBRfMg==
X-Proofpoint-GUID: notQo1dc5dW5IOz6sjhXI6c4-rn3c9pu
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abbc2cd cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8 a=uR8-w7941YXdG5CN1KQA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: notQo1dc5dW5IOz6sjhXI6c4-rn3c9pu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX8EXMzIOl4oPv
 IDnKW9H6YXc3V2IBvbry7ZU4Q7iWlkAjByK8GIU64sYlj9VLf3sE2Bq11XSSjz7fk9JTsMDeP+8
 nw2CscgDAyOGY6zoc3PQfuMiAkfhm3k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290055

On 9/28/2026 1:26 AM, jiale yao wrote:
> At 2026-09-28 13:49:54, "Rameshkumar Sundaram" <rameshkumar.sundaram@oss.qualcomm.com> wrote:
>> On 9/26/2026 9:18 PM, Jiale Yao wrote:
>>> ath12k_mac_tx_mgmt_pending_free() is passed as an idr_for_each()
>>> callback and removes the current entry from txmgmt_idr. This can
>>> invalidate the radix-tree iterator retained by idr_for_each().
>>>
>>> Both callers destroy the IDR immediately after the walk, so removing
>>> each entry in the callback is unnecessary. Split skb release from IDR
>>> removal and let the callback release the supplied skb without updating
>>> the IDR. The following idr_destroy() tears down the IDR itself.
>>>
>>> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>>> Signed-off-by: Jiale Yao <yaojiale02@163.com>
>>> ---
>>>   drivers/net/wireless/ath/ath12k/mac.c | 25 +++++++++++++++----------
>>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>>> index 99bf5cf79d10..7695b21149d1 100644
>>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>>> @@ -9166,18 +9166,11 @@ static void ath12k_mgmt_over_wmi_tx_drop(struct ath12k *ar, struct sk_buff *skb)
>>>   		wake_up(&ar->txmgmt_empty_waitq);
>>>   }
>>>   
>>> -static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
>>> +static void ath12k_mac_tx_mgmt_free_skb(struct ath12k *ar,
>>> +					struct sk_buff *msdu)
>>>   {
>>> -	struct sk_buff *msdu;
>>>   	struct ieee80211_tx_info *info;
>>>   
>>> -	spin_lock_bh(&ar->txmgmt_idr_lock);
>>> -	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
>>> -	spin_unlock_bh(&ar->txmgmt_idr_lock);
>>> -
>>> -	if (!msdu)
>>> -		return;
>>> -
>>>   	dma_unmap_single(ar->ab->dev, ATH12K_SKB_CB(msdu)->paddr, msdu->len,
>>>   			 DMA_TO_DEVICE);
>>>   
>>> @@ -9187,11 +9180,23 @@ static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
>>>   	ath12k_mgmt_over_wmi_tx_drop(ar, msdu);
>>>   }
>>>   
>>> +static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
>>> +{
>>> +	struct sk_buff *msdu;
>>> +
>>> +	spin_lock_bh(&ar->txmgmt_idr_lock);
>>> +	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
>>> +	spin_unlock_bh(&ar->txmgmt_idr_lock);
>>> +
>>> +	if (msdu)
>>> +		ath12k_mac_tx_mgmt_free_skb(ar, msdu);
>>> +}
>>> +
>>>   int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
>>>   {
>>>   	struct ath12k *ar = ctx;
>>>   
>>> -	ath12k_mac_tx_mgmt_free(ar, buf_id);
>>> +	ath12k_mac_tx_mgmt_free_skb(ar, skb);
>>
>> this now keeps the freed skbs in the idr for the whole time 
>> idr_for_each() runs as opposed to previous implementation which removed 
>> the idr entry as well which looked safe.
> 
> Thanks for the review.
> 
> The original issue is the same as the one fixed by commit c38b1e19485a
> ("firmware: arm_scmi: Avoid IDR updates while cleaning channels").
> ath12k_mac_tx_mgmt_pending_free() is called from idr_for_each(), and
> ath12k_mac_tx_mgmt_free() removes the current entry from that same IDR
> before the iterator advances. This can invalidate the iterator state.
> 
> You are right that my patch leaves freed skb pointers in the IDR until
> idr_destroy(), which is undesirable.
> 
> I will send a v2 using idr_for_each_entry(), which performs a fresh
> idr_get_next() lookup for each iteration. The entry will then be removed
> from the IDR before its skb is freed, avoiding both the invalid iterator
> state and stale skb pointers.
Thanks, I just came here to comment that my AI agent spotted the same thing:

The patch introduces a real UAF window that did not exist in the original
code.

The window:

In the new callback (ath12k_mac_tx_mgmt_pending_free /
ath11k_mac_tx_mgmt_pending_free), ath12k_mac_tx_mgmt_free_skb() frees the skb
but leaves the IDR entry pointing to it. idr_destroy() only runs after the
entire idr_for_each() walk completes. So between the callback freeing skb N
and idr_destroy() removing entry N, the IDR still holds a dangling pointer.

The concurrent path is wmi_process_mgmt_tx_comp() in wmi.c:6436, which does
exactly this sequence:

spin_lock_bh(&ar->txmgmt_idr_lock);
msdu = idr_find(&ar->txmgmt_idr, desc_id);   // returns freed skb pointer
...
idr_remove(&ar->txmgmt_idr, desc_id);
spin_unlock_bh(&ar->txmgmt_idr_lock);

skb_cb = ATH12K_SKB_CB(msdu);                // UAF: msdu already freed
dma_unmap_single(..., skb_cb->paddr, ...);   // UAF

Why the original code was safe:

The old ath12k_mac_tx_mgmt_free() callback called idr_remove() under
txmgmt_idr_lock before freeing the skb. So wmi_process_mgmt_tx_comp would
either win the race (remove and free the skb itself, leaving the IDR entry
absent when the cleanup callback ran) or lose it (find the entry already
removed, print the "invalid msdu_id" warning, and bail). In neither case could
it get a pointer to an already-freed skb.


