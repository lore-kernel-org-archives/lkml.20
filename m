Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F763AFCF7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806985; cv=none; b=fvT+4U/ltSYP+xEYhOODa9aIsv1Js1/Sl+CgRBMTpTHKnsDlV5NN3GXjaEVHC9/U+Sd/rfTEaeYEN80jKGnmdKdfJe1UuExIKCn+6Nicd12YgjJhB4vLW22RAPxSebKtD6C0bGGBGD7t9O+hTA7UQSKIumfNvzFI7siH6do7vkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806985; c=relaxed/simple;
	bh=j6l5bzYJryaaxbDUBR+bhu5E7GPmbfMXb6+qMF/zaH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkIdX6R2Ds1Vhl8VNhiEDPhBTscO1HLZRyvaXwc0AWFuBxI5XwhU3rBfUR7abrdZCYnxQEcMNMOKmn9Eqzc3pOJ2WkzLqUeAIxgmObnLkN0tEXdjDHcEg5OmVf4wSddfuaoHjij22hBYdzkgz+QQeNsHPQ8Cr0VmPwPFFLThUis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSmNVh8k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmz1ktWW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSmNVh8k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmz1ktWW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UIPIlg3881862
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piLUlAkUIFGFWUCpI1nShR9BGGKE+Fd0tpbM9xTnfhQ=; b=BSmNVh8kPGYRp7ax
	prHisYIdQ543QTXH87LnBA8i3tlQjGy04Wkjwgb9qNY1ifll619Z3QBtZzZ/voT5
	z4Dt2FW8uUvWfl+zwHIeRujN+h/k85PVkD2W/UJ7j/w9IuO5ztu1XhMgfDbJfEQZ
	ozp9+/8BaFRMut1F+83cpARLfNURo2ZC/pptrZ7EVP31ufeXjHOdj2leJs87d4PR
	bWCsad5Lmxe/+zBYh9UBDqKvXw8pHS4ZPAr785TDPGfx15RlKkSQtijgcc4PWH9u
	AmVQIaCyhxLV3LX3AwYj8UFjdn2NnCNnpDe0oVVGFQw/H+Kd/+EoLKXRSRYY17h2
	H3MnUA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pj8v1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:23:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438fef603cso12722207c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790806983; x=1791411783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piLUlAkUIFGFWUCpI1nShR9BGGKE+Fd0tpbM9xTnfhQ=;
        b=bmz1ktWWbwR765Dr4cVTExIOmJmTx7heWaE3/6D0VvKtaMiYOwYm8GGg0ykVODud5+
         Rn1K5ug3g0wM5IMCGFsnT3LAlAku09CVjf8IzNbW9aL0ikB4lv3xMBRgeJt9cyhj0Ujw
         fyiAvBOK2cjWzWD38c1ELKPhm8Efxrr6cUJs7Zhrma2H4FCDTJQJbjPsfjr2Vuva/ISy
         Uk9qPqJW/1loldB0e+wv8FXvLKl7wy6fAh0TVkm3H1t7zAM676o6MR3qbn2lzSKLbLe+
         DsJANTIea4qrQKBUJKw7Ok+y8anJf68PLzTa6gqABV70kCYgHMpY+78hIuQ2mtieF0aj
         rIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790806983; x=1791411783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piLUlAkUIFGFWUCpI1nShR9BGGKE+Fd0tpbM9xTnfhQ=;
        b=HDwFm5t3wbwikJd8Iz0RYFZ1sp4GBD8m0e4t4lwVDnO8c9IFWn/jlWEQf93eb4vOZE
         Ipm9zl5+mbuxAbhqezuceHnUjjwthM7yiuURIkJr2f8lSqgygPR94UQY3OxhV1sG2y88
         FuvSKf+cM4k2FO6QzzCGhAOgaW0AF+B2FX/+v/4/k0zSQhy1PAajrBn4Vq7p/uL7iZl3
         TPZv0d3dZQBOMJ5j9wRs0Z986SjEgB9Hgoe36xezbUr0hSEbhOR3tQOGP38iJ5JUw7xD
         2eXPKRMeLrqryW7t+sqN+ukNMobj5u9jdg0mOIWMbaQfWwTQ86uX/i2ybOWSA4W0vRbr
         Myrw==
X-Forwarded-Encrypted: i=1; AKwUvBznwDyDPQZL9OaJ0ubqG+GgTUxB/qTD0ZjxESg+n81DXjlrsJ0XHKPu/fv34vmLpPNzS1envxM7yoE5V74=@vger.kernel.org
X-Gm-Message-State: AFuF++mNcpW9ziNjD/4a3q5HBTXF2qeB9WddXruZc/c8EnJ9vENi7QQb
	iVJne4AjclC/OV32XgD2rZhlnniIHoKZg+46cijfSqAescvaNRV9KTMG2WvOnm2tqjFK+6y/QBl
	pouddijl9zHURpx42P1Mq2JVoA5i+fiNcx/E09xacLmcjAqhTX0METykuJ9JTSJ4MeH0=
X-Gm-Gg: AYBFou0X8fO9Tmiped5QB9IkDgKvvfAEi4r7W9/maL7oIsxluPV5Ae4yuCWDchQPeQW
	0MIJaVobRyLRts0s6lBRNuaFJCJelgKmQxkb5QkqiAaSe/vcYggQSiQrOnMu266k5/9AoE1Kd2y
	VPgmpn9BfrzEIi4LmjpUN3xjIU9ypQdwuSZx2lpRlpwotWf1q5V80qSCC0D5HHmelhHhSppD2Sm
	P6W/cmItORx+bPbyKPY7S/y45uhxxbp2hXyz3pKKsvjKNw4VVmcBIQrfo3Vr/5wzlZqiDtnnZa+
	HPCB8R5JyDl81UW+wcaGWkTyu+5dJZ+0v7J+GG1ai6rw0tFqAR7XkKKUcHNPFFZHzm5vrtFAYdC
	KVUOfnbCUPA8t9vibAEiyDKOcG2sUFg7Xdb+JRRZ859dRKQ==
X-Received: by 2002:a05:7022:3c12:b0:138:12fa:3788 with SMTP id a92af1059eb24-14d35f360e5mr2359735c88.23.1790806982336;
        Wed, 30 Sep 2026 15:23:02 -0700 (PDT)
X-Received: by 2002:a05:7022:3c12:b0:138:12fa:3788 with SMTP id a92af1059eb24-14d35f360e5mr2359724c88.23.1790806981780;
        Wed, 30 Sep 2026 15:23:01 -0700 (PDT)
Received: from [10.73.194.28] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df47ce61esm1418193c88.15.2026.09.30.15.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 15:23:01 -0700 (PDT)
Message-ID: <d7ce8b23-64c0-43dd-a8c8-268224b9462c@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 15:23:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add larger page size support for USB audio offload
 path
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abd8bc7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=Sc2N9AbJxcu_dAGTm-kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: AZK-mv5N2ojKW9ffqeWq_X7taf65_GVg
X-Proofpoint-ORIG-GUID: AZK-mv5N2ojKW9ffqeWq_X7taf65_GVg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA5MCBTYWx0ZWRfX07k0af4mut01
 UskfTkXQdWkKySK580S8TamyRBBmsUR3u/6fkVRM2oAlI8CK2CXUkIAKlYmTOSbszdAuUjKklKe
 wrJDI1alAnlfmRGEXemxveP24f0lYq4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA5MCBTYWx0ZWRfX/xLItJTxRapS
 Y0IMzCzAFpj5zDKxC8Ftgz1xzFEDASbUdGC0VzfUR4oGZE41w0BOS3ZWlysYJY4sNl2EFe+GI0y
 dj2zkMa0gAOMYizOSb0hlS6je2vbG+SNc14L4X9h+R2m55ioq+cJR1tDO2+S+zgjVa180+4GleH
 hWIfQhP5lZcOz0XxgbugpOie7BSq2AHasjU7taKBYQkEbYXfBsSAK88BFcmMmbL4ge4hkPcECZd
 yl9wyCIy1cgkD3TbNkgEss9l2eoQ2ggh3HPdc6VvIuDWORmlkQcIsGs7UdKNgOrpRQmVucucK6a
 TMtJnG1pxiGW0x2VLqggJIaHJhPFRU+sYs5qhbcfNqYSag1x6c8YbJXrWWhJSj9Mo2ocqVqPTE+
 hs6vGzFbvPoiFbNccdDqzHbchlqN7dNdnojzn9sJ/3/Ba5mdCbE2jUcxaVDqE2sAknWzTN/TpGp
 VWUy5KgyQtf2KElLsJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300090



On 9/9/2026 6:50 PM, Wesley Cheng wrote:
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
> To mitigate this, this series introduces a separate segment_pool
> associated to a sideband ring.  Before the USB audio offload path
> is enabled, the USB audio data streams/endpoint are not active.  Only when
> the class driver issues a usb_set_interface() call (done from
> snd_usb_endpoint_prepare()), will the xHCI allocate the transfer ring
> resources.  Which pool is selected is all based on if the sideband path
> is being enabled, and if so, memory can be allocated from that pool,
> which expects to be owned in conjunction with the audio DSP.  This
> concept allows to keep the same model existing in xHCI, where multiple
> 4k segments can reside on the same page, which reduces potentially over
> allocating based on the page size.
> 
> Likewise this mechanism also allows for the offload client driver to
> determine which SID is associated to the segment_pool if it decides to
> map outside of the Linux subsystem.  The new ring allocation flow for
> sideband/offload clients will be as follows:
> 
> qc_usb_audio_offload_probe()
>    ├─ segment_pool = dma_pool_create(...)
>    ▼
> xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR, segment_pool, notify_client)
>    │  sb->segment_pool = segment_pool
>    ▼
> uadev[card_num].sb = sb
> 
> handle_uaudio_stream_req()
>    ▼
> enable_audio_stream(subs, ..., pcm_card_num)
>    ├─ data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint)
>    ├─ xhci_sideband_add_endpoint(sb, data_ep) ← ep->sideband = sb; sb->eps[ep_index] = ep
>    ├─ snd_usb_endpoint_prepare(chip, sync_endpoint) ─┐
>    ├─ snd_usb_endpoint_prepare(chip, data_endpoint)  ├─→ xhci_check_bandwidth()
>    │                                                 ▼
>    │            xhci_endpoint_init(xhci, virt_dev, ep, ...)
>    │            pool = sideband ? sideband->segment_pool : xhci->segment_pool
>    │            new_ring = xhci_ring_alloc_from_pool(..., pool, ...)
>    │            ▼
>    │            xhci_ring_alloc_from_pool(..., pool, flags)
>    │            ring->segment_pool = pool
>    │            ▼
>    │            xhci_alloc_segments_for_ring(xhci, ring, flags)
>    │            xhci_segment_alloc(xhci, ring->segment_pool, max_packet, num, flags)
>    │            ▼
>    │            xhci_segment_alloc(xhci, pool, max_packet, num, flags)
>    │            seg->trbs = dma_pool_zalloc(pool, flags, &dma)
>    ▼
> xhci_sideband_get_endpoint_buffer(sb, data_ep) → xhci_ring_to_sgtable()
> 
> qc_usb_audio_offload_disconnect() / unreg_xhci:
>    ├─ segment_pool = sb->segment_pool
>    ├─ xhci_sideband_unregister(sb)
>    ▼
>    dma_pool_destroy(segment_pool)
> 
> Similar logic is added for the secondary interrupter path as well.  The USB
> offload class driver calls xhci_sideband_create_interrupter(), which will
> be responsible for allocating the secondary event ring.
> 
> There is one point that was seen during disconnecting the USB audio
> device while audio offload was active, where the offload client driver
> was pre-maturely freeing the DMA pool before xHCI core was able to free
> the DMA memory allocated for the rings.  This is the reason for needing
> to explicitly call the ring free during the sideband unregister path.
> 
> This was confirmed to work on the SM8350 MTP platform, with the
> CONFIG_ARM64_16K_PAGES config enabled, alongside tinyaudio binaries:
> 
> tinymix -D 0 set 513 1  (Enables USB_RX multimedia#1 path)
> tinyplay -D 0 -d 0....  (Routes PCM data to ASoC platform sound card)
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Hi Mathias,

Just checking to see if there was anything that we needed to account for in 
this series?  I think there was the discussion that came up here:
https://lore.kernel.org/all/TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com/

But, I think your suggestion about adding the sideband check in the 
xhci_setup_device() would mitigate that problem.  Esp, if we don't want 
xHCI core to really know about sideband ops.

Thanks
Wesley Cheng

