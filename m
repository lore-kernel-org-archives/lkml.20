Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606583;
	b=uAa6AQ6D3QkrVXb9kux58l0zdHmidupiiW7UYvkXUvYGNdONxJ6bKqLYLiomXaGB5oTC
	 I5Z10URqlcd/TIs+QtnLvwfipBYnHJT7Z5krX4vcoBKLIC5C/WAkczSBGxFoLZnGVdmZ9
	 eyd2zPAFTHnTcdjsEggL5bT4YhqWu3HmF/kC39POH+DxjhoW5cLBKl3HBaAGfHL2aeWVV
	 gsQeJdVuiootH06Pr/4W03neYjL0VrnfIHI1D5J/niklPVwehvk5glS7jN74zHnKWzy4X
	 gzODduxfiDHBjl4zxHTQ0mChXu7UAFij6VaX0nydxK4ml1HlEOYM21xShBNYBTJtddA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606583;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GBXtj47H1AmrCrb/cFsvOivhArZSKH3hpZ74KxcsUDs=;
	b=EdvkXU5mD5PwZWgjjBEQ+rF81xo2W8D6CDSNqUG+SAFJKa11VBqbe4Mra0UgFfeFd/PP
	 deY5vh9WTn8ciMHw4xpNZbPUi0kWIvJHTqi8izjog8y6/RvY1482mbxtteNS80ToMtZnt
	 v+4+gAPrKJJwIqsLuncKYtIyUPjxclhdUlBoeuiaD0jGAnnt6dCnQO7bwyVAYZWB/JnHR
	 AjH5lQDZhFZRCFLABiyi1+8SQ6gdsCoipwwW7+AqcFykepo2VgsqPJpFxiAzHNA/JQxNO
	 uogOGqVWOArZf8zMQLnnz2gLWb85RENBMoW2ieNQFqxEpa5dhcoEFcEuR/ZeR4Bsc7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MRh/OY9F";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tc0DxnUg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43063606A336
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43063606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MRh/OY9F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tc0DxnUg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24DKxA2433769
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 08:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBXtj47H1AmrCrb/cFsvOivhArZSKH3hpZ74KxcsUDs=; b=MRh/OY9FT5UJBspw
	BLi3nxzPJ5B78cgCaFdVqjMwS3VwIwDYR7pu0Dqh4oKeKEDRZWhiReCqfBFK0XD0
	cxCpKDfr79LXqAmWgQqxl82nqHhSykSsXyw7Hibl2xR3raia7bvarLaQZ4R94JpE
	TvqCmCNouCEDpOGoYZgC6WPbjdnQjzxJ1fBi4CK0N3O8D4xpjY8qMNADBlyrz3G8
	Hpqw8lKLjmBD3UUIiGEcK4jzcdiuIlDcEanq/Z1vtL6nfDfDd7XjosjOFvzxsEi3
	GiMBVdEBN+TfENR8l5yXZE/9xiEf/dwxhhfVtknkEpNVRvr+34PCH0mCjtYjzWgi
	tLFTXg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka60r6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:03:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0589ff620so1769703b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793606581; x=1794211381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBXtj47H1AmrCrb/cFsvOivhArZSKH3hpZ74KxcsUDs=;
        b=Tc0DxnUgXrTsk9TolDnEvcW6pBlw3nKoub2LIBGbl5mikNVOGOYfkGCaHNAgnvulRw
         MUf/oEfhsH/rW8pOleezRK6B06+4GN+SxQH18GkO2b4NWPmIzs+ewmahwQTaq4qqxV9C
         n9WpxqxBhYsjzXUwi04pvlsSbqO2s2LWyhg3VWIPUbLzmCRvcpmtIA879rnRRAT80mPw
         v/p4HLeRCXGBFPkLMBut89JTE77ogg0QyE8Ab18x1miuUTo3RKtCp+uEL0cWqrM+yFKD
         G+WcXjeWsRSXRW91WOilfcyAZyswSku7eJLR2Hv2ED4RsKxF5E8nCsHjFPz9BZOXSV5/
         X0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606581; x=1794211381;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBXtj47H1AmrCrb/cFsvOivhArZSKH3hpZ74KxcsUDs=;
        b=o2cDs/BpQ22goeoWLL0MTez7VsDl+T599VbYGl8dri10GdzKbaARK1SJg5uYeo9qUL
         +zZ14zubnWbzasHkHH6+PEvZMPKkd0/LbOvGK1GRFQnXpTG/qeLtGMGrQEyWuMS+3h2Q
         9n+vqclfd3/iLfaik0/5MnFLFwNpYFId42QkuOZVyDLzPZr3xEv2P7SVsTo3oiKMvBpl
         Ke+ruoMi7+E2RKOAsD3DfEZZQjYGxhYFVquAJtyZR6XNQhTx4HYPJ4aPC+iMDallox7O
         mLEPm35vm05SrgoUvVcP3psCJ+7RSaRhiKSRazRgS/f1+SQ6yO9KPJdV+sQl5R2l96NU
         M/5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxupncNX4sxUOHt6MHNqHwZ9sMIuUtrSS9X/FuUbNUviI5lZodmP/RLUmfCLaomQfJPPrkSyM9n3fbgLs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0aVenoHXXi3XSkDRIF57VgYY63hLfILhrP3Yzs6ujk4gh2ZA3
	S6JKtIep2BVoDOGIIGYFeWJbardMkGZP3sO5LYWKmjpIF2boix4jJsAByfp8iMawLG4uk79U/0o
	kBppiPUlXdzUCqgtOqxrvdLGcXg0DvFx7AJLLYa+b/f5v/Y9cyd53mbwoWPXF+f1UXiY=
X-Gm-Gg: AYBFou12tCxHEg7/CzmobmC111y5MsTQkG7o5GJZ5EOgMivBVrRF2Jy/ttqrgCPLC9m
	6tqrJfdXbPCM5HJwazRC+THl/sjRn3uMTiWwpmpE3Ln9Ku24lM8fBJGnsYB6BMSOUmu9S/6kA5W
	csyzaUWcQxdSVdZfLU32NjiErz4dYegoev4KAUX697uUSsy4/aPog1nZT55N3QoXTgsuQ1fgV3C
	L/ei3b3U6EiSjTgGo4PwA6+Oi7nr4xFPffnDZXRLpQGeyBmEz6rDuiUhRgPFuu0N7JwAFCsnqSc
	aSh2JFEQZFD6ajb5yVWgTGfaQnxa/jk4sCmTNK0p8PtYh9CIWeOFwY881GQzsgw9U2/IEZLXfbl
	K6kv1ZNykEXZMleJS01ZnHUkIjYe8PJvEMGOzaw2JN30uCP3XBuWzxcOUO6kEDtfXCcM8NSVz+a
	idivbce88oMoP+g1yZTPwPARTlMrSUakXGg25d21kNi/bz
X-Received: by 2002:a05:6a00:6988:b0:8a0:8848:8c28 with SMTP id d2e1a72fcca58-8a9bb0cf0f5mr5846942b3a.2.1793606580965;
        Mon, 02 Nov 2026 00:03:00 -0800 (PST)
X-Received: by 2002:a05:6a00:6988:b0:8a0:8848:8c28 with SMTP id d2e1a72fcca58-8a9bb0cf0f5mr5846925b3a.2.1793606580450;
        Mon, 02 Nov 2026 00:03:00 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fcb8dsm1710896b3a.1.2026.11.02.00.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:03:00 -0800 (PST)
Message-ID: <492ece60-a670-48f4-a808-f09394b3db95@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:02:56 +0800
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
Subject: Re: [PATCH ath-next] wifi: ath12k: fix MLO 4-way handshake timeout on
 QCC2072
To: Burke Cates <burke.cates@gmail.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: jjohnson@kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com>
 <20261030041902.2740757-1-burke.cates@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030041902.2740757-1-burke.cates@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AldcVorfDxMK7bU52k5wUsQN5EZ2CjuL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMSBTYWx0ZWRfX8mdfQvWc935u
 lZ7h+l53YKik1P8Ya9y+qV8ixPEwsEiO/5S0vau9fPIOt2BCDGYSYqn2nP2ardDurryxu9QMLs8
 OC04eG5ywGQc5+s9mUpUOFhZD86FnVY=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae843b5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=_XthKnSfGIqTua6Bb7wA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMSBTYWx0ZWRfX9bX/9LLCvo9N
 BYaxEuRARm8Jd+uV7cLC7jZTDtCiGJSWVOcjv4Jgvnf3GA5KiF8TEkgvw0njSQvrO4T88EcaVJR
 qF8sQGPXEfobJ+8fOpUnZ/0z8/8gPYKb7JUWi14sIB2w6PWL9uClOR+K1TdV106DAIZj8N2PAWt
 V+vMOTqhV5l6QOzQy3tGtEGhJF6Ae6tpDk1Xqi6YWizmAE5i2QBAzRHb8ONsPBwyAOawR0yj+VA
 MNICxPnRr68cOVxYmp5/nuspJOIqcOn/uTOFxMyLSbE0iyMDA/a1CMG5ocxHl9/0hYE3Cfc0GXn
 LL4QyOcgHV1hj+ImjRdaIR5zpoxvoSdu/Hq5PqkEIPwlraCJwoKhtZFXjzqmz4lgY1YbHC1lIF0
 W0x4cfGIehLVc3B8/fFiTzyyrV2TRS1mVU9aDY/MDy5XrdUex3ai5rZY/F0w/4L2xAkcQVRsvJR
 sSmrU0/vPXLgWvSW/CQ==
X-Proofpoint-GUID: AldcVorfDxMK7bU52k5wUsQN5EZ2CjuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020031



On 10/30/2026 12:19 PM, Burke Cates wrote:
> On Sat, Aug 15, 2026 at 09:43:29AM +0800, Miaoqing Pan wrote:
>> This is observed on QCC2072 where EAPOL M3 uses the MLD address,
>>
>>   deauthenticated (Reason: 15=4WAY_HANDSHAKE_TIMEOUT)
> 
> I hit this on an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite)
> with the on-board QCC2072: Wi-Fi 7 MLO SSIDs (SAE, PMF required; one
> 6 GHz-only, one 2.4+5+6 GHz) failed with reason 15 whatever the
> association link, with M3 dropped by mac80211. Non-MLO WPA2-PSK on
> 5 GHz was fine.
> 
> With this patch, applied as posted, both MLO SSIDs connect. I tested
> on v7.3-rc5 and again on v7.3, each plus out-of-tree Glymur
> platform/board patches; on v7.3 the tri-band SSID connected as MLO
> (on its 6 GHz link) and rejoined MLO after s2idle resume. That tree
> also carries your separate dp_peer fix (8b6b871332b5, "Fix failure to
> create ath12k_dp_peer on MLO reconnect"). I haven't tried the rebase
> onto ath/main that Jeff asked for.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
> 
> AI coding assistants helped run these tests and draft this reply; the
> results are from the hardware runs.
> 
Hi Burke, can you please try if below series can fix your issue as well?

https://lore.kernel.org/all/20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com/
