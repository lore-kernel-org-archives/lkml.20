Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903551;
	b=Kbd/HCXOhC5SOC+jOSHnSztSSWmR5U0ICdp57SUNFRHgObKQJJQa0vS8bKiKlVkH9OnG
	 /lK06zI8bImNaY6l7ORYzLQB8Jj/Vr/EBcWVvLUW8iJEUy5Qen9pqcyDwQJG3PRbkyxLX
	 RnsYZlcGwCy0hf/cmGS276pMAS1AZFhp4rVp7HNk54yMtevUVUmBJwnNKQnuEMG6ERaw/
	 7lUkTEmSCVCSuvqyDwj4axkhwI+99VKbfVh7iz4IeRhBg0QuHog30vrBVMoD6K7chMkHv
	 WGFMr2c4wU89Xn8tnzo/aTgEXTZAxms96IYkDHOhODz+dIAiICIuRBgQ3YspPX0gtAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SI06mvofhXRZg6+BWCeYj7tpzdX2vW9/vYd40XqO33k=;
	b=spSJjASrTGNchUoGHKfna3RqiL/etkiNouNDETjx1EUzRGdJBOrlcunGD/PIFHJ7G5bB
	 TThMd0fjpUVsX0WtvQBTDK6bg8PSzIE5lV7MYTqrL+IlmPCxrUUziGsaFMoatBs+WUhTI
	 FgK5LEgeDhgsUTMulJ0wYViU9y8uGyJE3sqxalHGHSFQCKMRaoLt2khYj9IUdXCF/dvac
	 51BvOBMM+P1i6AScpPX+j/id2sacXKorBUvHAcMwyb7n2FyDGRNGhOrUAiqCiddEf0NsS
	 piNDEa58ksJDgVT+YK5N4WdPIZMJINd/agyTRBxOgHE08KZ9pjeR0L9gE6ublIHPrBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHZGUf2p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TKOrbTZI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE40B606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE40B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHZGUf2p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TKOrbTZI
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aPfr844321
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SI06mvofhXRZg6+BWCeYj7tpzdX2vW9/vYd40XqO33k=; b=JHZGUf2paxYzYRD8
	3IRgYDgQDh1ETHF24DfSjYaCnkKVRtZglxeHpj5uxZ2xz5HnaSbG9YdHmC9NzJI7
	x11hKhWjnpCU27JUdJUU6fc8BigqcgDn/lpKBSdLjqO8hfkB+KCq4pEG2dfxJK4S
	h6NbeciHn5RXapzceCUlUzMunF5RaZp9ra1KDIWz/917PVAILQ9qMqn8WCVWyQtV
	llsbxrZiPt9v0zGPsEWD8TSDtvBdDv+rMhhE/Uo6NR35LCd7mzl7iXPwNN+JIcXI
	RRwzLpBxLOtjlrQVs+ABKOvXvbapdKPHU+ghOnOJ8KMS9QenTt+2C56DuALiL6cj
	W7gRXA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h1h2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:19:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a08903566dso545035b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903548; x=1795508348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SI06mvofhXRZg6+BWCeYj7tpzdX2vW9/vYd40XqO33k=;
        b=TKOrbTZIO3rlsAKlnkR6J9ZJNpFTIBmGeRZMTN3EWbm/f8RgEphImG4Uv7NVlNnKf/
         QXq27j3nX2teB7YVjEulLto/ron0gKZfynKVvRZLWUGJUTa4VRlrmh1Z74Y+2evrzXQa
         tKPFY6EluG62mfMYbHKHUpyY5y2SpGKFuCCMlMIUpjk8x1dUg0KlS3b7vljgLJjIm6w9
         Kz2GECe2IXKvphOV4BuDdU4Lm6CPP1Wow60Jfdu12aEmGPR4qbgSH9iNXS1wnVjSztVl
         Ysjf54svOCLqyOHvRZ9pG0kyZ5ye8cgqeqvaMs2LwIIr45d0PAYXEgoiqDQtOScIXXRj
         moag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903548; x=1795508348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SI06mvofhXRZg6+BWCeYj7tpzdX2vW9/vYd40XqO33k=;
        b=Trk6pHCJv6eFKuQ1a3Ua6WZHrg0u43pN4AoquXqKhrL9gHlr3BpIoH1kNfSi/+9A9E
         fwaRr0TLaLRPlqTVnjHi09s36ROU9LP8iFfkuSJ79oC1VJN6FQAidv44HXZ1uLyMYL+w
         wrWevcR1tAdf8sel0wYCnzxxWM3cQnPy11Trxih+GuGnzmxUYQ2/tJIorTHuwugsmqJV
         pXC3qYl6xwBOc5ylWV/rj6i5DUX+vlW1Mg/kGw9lWejRCni9YSUyfqjxwA1zAakOYeRC
         0j/9th/ZniNytm3mBE5NiI84N2C9T26WERFC1UlwC4rbgt+6zVUZXvD0B+tJWpRk3R0f
         ZENQ==
X-Forwarded-Encrypted: i=1; AL+hErF8J+oaXx0qKJBgz8TPcpDx7BsGlHEYAFXLhoWOoqge7t9W/NN10WbNtI06VQt9sIxrDLh01Jd+xSnGi/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8agoEeM51YsM8gV+2BXDCWvgEeDvUdire6NJ9WT2HviPKhR7p1
	6ckNuKZKFK0Yy1SeQi1fS0Y+3ckXv7rVh5g8R3f1qDGn01nB6D43giRKz90Z1fcBz4g1uXn06YM
	W/Ego11WOalAjdW0gWWvHwfCaOZ7pn/5TDBok8P0GMPzGDCwO0yolVBTb6f9FternDhg=
X-Gm-Gg: AYBFou2/jGC04zrSqRuuDNpw6IxM7yFPMFp5dQtiL+CeIoYAlYcTG8wUxFdiau0Go1d
	1Ys5xAuDeF3BEgulfmpCdNQ0p2rBdQvrBsLSPM1kHF7TlQaNxFyt3iheCU7lRMucFrXhkuf0pHK
	XjeorveyaeQje07CxaScVys7QQK0qCTruMyZRQaYVRBBs+SRKstyfQO6WKWy8JNiJPI9HXSwnyp
	RvEN7WIuClSOULshJhJJPaA2AzoefNE2v4JzLUk5aFAsLfdq7sfjWxgI51euBNUfurpuK9yLJtj
	pyyxGp+/lWCKKS5i46RlipQzZx2ZPBzK7kNDxZamxzYyH+YQtnPppPv+Yjzf9HhSmIpc26sIwmH
	5M3zkmmhlgF9FXlAF4EV+PE1D1q5F6x4GTgmk0URUvtfVsBd+bWfRH4YTwWIVfoGymKClr9Rf38
	STh9c=
X-Received: by 2002:a05:6a20:d090:b0:3f8:9fb1:211b with SMTP id adf61e73a8af0-3fd2a5f42ccmr1450188637.11.1794903548395;
        Tue, 17 Nov 2026 00:19:08 -0800 (PST)
X-Received: by 2002:a05:6a20:d090:b0:3f8:9fb1:211b with SMTP id adf61e73a8af0-3fd2a5f42ccmr1450168637.11.1794903547880;
        Tue, 17 Nov 2026 00:19:07 -0800 (PST)
Received: from [192.168.1.26] ([76.167.124.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2053d26sm4729678b3a.36.2026.11.17.00.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:19:07 -0800 (PST)
Message-ID: <a38e874c-4685-4892-81b4-a6aeeaaeddb4@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 00:19:06 -0800
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
Subject: Re: [PATCH v6 0/4] Add larger page size support for USB audio offload
 path
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xVcy2CRYJ1TLSB9Rz-qY5Jw35Zf-WHlD
X-Proofpoint-ORIG-GUID: xVcy2CRYJ1TLSB9Rz-qY5Jw35Zf-WHlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX2e3aAa5NHrCf
 N2h8k5++D5iEgLcZjeWMufsT1LGDaxyMY+J4phInkvUDzbmiTTxoJFSBteXdkAhnPjFIAZhCtgo
 Uj22LULEHB89Hf8inJee8GJwqzJSD2IRglSU3X8HVOY0HP4/eHpINluZrATQlRPawqXZID+EofV
 9Jl1NMmu0O6PpXngvPObilkr3obGoSzSjL9aO7Zz8qtJG2dI5O7HLo0FKXDxcNlJus5AIY/3F70
 h8V1SOgRpnMn8pC9VKfpYAgA6DvRc3i1TkkljZv189ywIhdwukVllExCc3WduW31SVq83tH9QXv
 HTv/8bEmpezUSTYcA5SVIun/AmjipL3ikQQsUShI3W1GHku5sZ9BYPmK5kr+sJWpymDLEPfiLzm
 Ub0Ze3xmYdIIH0jC9bd3IdyDD65MnnijYN+wZAsghh6ynopLn+P0UQ1VzF/Q4WyoGZdoqw+TWq6
 aqNUEUXvZlQLFqtHm2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX9u8MwKODWy3y
 GhDeg91Q2xB9FM1idaufagdsEDI65CzdZ9uCUmJ2IMDKvsPclG7pQu5HZrh6GI86e92JQHvZ1jK
 AYe/sZEOA9r0BjofDQM6MPKYFe5Eb8I=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc0dfd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=jLiqPQF7yFVFeg7DRIoZ9g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=oWt3uI2Zhp6YPFwEOV8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170032



On 11/9/2026 6:38 PM, Wesley Cheng wrote:
> On some environments, 16kB pages can be enabled from the Linux subsystem,
> which manages the IOMMU mappings for the audio DSP within the system.  In
> the current design, the following assumptions break when 16k pages are
> utilized:
>    1. xHCI ring size is equal to PAGE_SIZE
>    2. Ring addresses start at the beginning of a page
> 
> When the USB offload driver maps the rings (w/ the audio DSP SID), it is
> set with a 16k granular, which is a problem, as several xHCI rings could
> exist on the same page.  This is because the rings are currently allocated
> from the segment_pool.  Hence, potentially mapping non USB audio related
> rings into the region accessible by the audio DSP.
> 
> To mitigate this, sideband rings are no longer allocated from the
> segment_pool.  When PAGE_SIZE is larger than TRB_SEGMENT_SIZE, xHCI
> allocates the segments of sideband-tagged endpoint rings, and of the
> sideband secondary event ring, using dma_alloc_coherent(), which gives
> each segment a page of its own.  Before the USB audio offload path is
> enabled, the USB audio data streams/endpoint are not active.  Only when
> the class driver issues a usb_set_interface() call (done from
> snd_usb_endpoint_prepare()), will the xHCI allocate the transfer ring
> resources.  The offload client driver therefore tags the endpoints with
> xhci_sideband_add_endpoint() before that point.  The new ring allocation
> flow for sideband/offload clients will be as follows:
> 
> handle_uaudio_stream_req()
>    ▼
> enable_audio_stream(subs, ..., pcm_card_num)
>    ├─ data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint)
>    ├─ xhci_sideband_add_endpoint(sb, data_ep) ← ep->sideband = sb; ep->no_pool_alloc = PAGE_SIZE > TRB_SEGMENT_SIZE
>    ├─ snd_usb_endpoint_prepare(chip, sync_endpoint) ─┐
>    ├─ snd_usb_endpoint_prepare(chip, data_endpoint)  ├─→ xhci_add_endpoint()
>    │                                                 ▼
>    │            xhci_endpoint_init(xhci, virt_dev, ep, ...)
>    │            new_ring = __xhci_ring_alloc(..., ep->no_pool_alloc, ...)
>    │            ▼
>    │            xhci_alloc_segments_for_ring(xhci, ring, flags)
>    │            ▼
>    │            xhci_segment_alloc(xhci, max_packet, num, ring->no_pool_alloc, flags)
>    │            seg->trbs = dma_alloc_coherent(dev, TRB_SEGMENT_SIZE, &dma, flags)
>    ▼
> xhci_sideband_get_endpoint_buffer(sb, data_ep) → xhci_ring_to_sgtable()
> 

Hi Mathias,

Was wondering if this design looked a bit more acceptable?  Was able to 
figure out a way to achieve what you had suggested earlier mitigating the 
dma free problem I mentioned in my previous email.  If there are any issues 
w/ this please let me know.

Thanks
Wesley Cheng

