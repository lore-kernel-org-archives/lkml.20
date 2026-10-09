Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com [74.125.224.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167C14FC8CF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570965; cv=none; b=FtPPVCDuqdtlnB1/sx6qh6jR95OLMV38YtoVjSoVd6hHnJuX81ViHU2L52/d6s+FBO9T1yFpi8dWbR2AikbEXBWXmDI4dc87q/VGapKqev1t57utomdoxp6ejhGXibaOsy5AB9U9GwM43s53xXDCO5M6TRQ/TyMxi7FN6E77m34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570965; c=relaxed/simple;
	bh=I1z4aPNe1j0jS1fSnM13X27jRNV74YpakQKyGVVJaEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uts2F5X0qgWCCVykvNb+wioBLsNSkiX/dA6NrNr+r4U2QCG/iUP8ArUw6lMzTAofqEDdt3DkZ4aNredFRSqDdk4QF0ofeNmwN0q3clwi8RHpPzgvQfNGYXzVmq8ag6tZxkvWNGd2qD8ZbIqn+tLTsaAmkxut8hxuDUDIgNxwDsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Uwv6hlyp; arc=none smtp.client-ip=74.125.224.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Uwv6hlyp"
Received: by mail-yx1-f99.google.com with SMTP id 956f58d0204a3-677bc4704cbso4632734d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570962; x=1792175762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zgxSyNtrJXDQubY2aMyQqoQIxuV+Slem4S799JPhD9I=;
        b=0YNcv94oCzWeOWOCrfG3teEHrniXDq8f4VoG0FK4AjxOFYZRgHw73kSGZM46eCnt53
         doMsgR/n7fnd5HXUyeYRi7XjgmXLCPXpOAPMhzaBvzDNhDgdXwLA4B0d/i4qt/vKop/v
         Yqyg1MW898MVG4O2tpbhU+Qc8+QKEjNTHCKT57QUvgMYlTUv3VMnBDjUTnLlf0bS+xni
         ywKitOZNFDdXxCIR4oENapH5/7OSSFDgQKhboJvSsuLxFCF8Zb6Qoh1eo/Khwu8IV3vw
         5mgXgQPCTrugVmhlw3GGJLiUIOiDRgwt2Qt1DTxyVUAhozYzkR5c+BafGjk0B0eySSLP
         m3Pg==
X-Forwarded-Encrypted: i=1; AKwUvBxnGfKFVQVuZDRyXr7aDzTFwitDZbq79gXMV9bB4NrUfpmo73GAlzqD5R7VvtRnlwTlAnqSgdurx4h/CIw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa631GoPHLA7fpqoNMYok7EfbvOJi4s0MpDwltDCLnwoabmBde
	9vEbNMS4dBukKoPSnpDMBlDq3naZc/EfX3udAKbIOvOKlmxG1drCMgcgPtPbmj/FhLCzB7EAuQV
	s7P7pbCLKFgg/JFG7Mq8GMJNZi3/XtsNenGAPLob2pwma8EYLPIAXNqECvW2EBbTBIxjcviVbVN
	KzO5LLBfaLuplwl/wDVvb3htd/+goKULF7msk40vi8cQdwhFc98SDAEwuxkPCrVGKetH2yvyGf1
	AIaSXR9gPCy67egeQ==
X-Gm-Gg: AYBFou0uUHhBJHiagYrJPzyVF/lf2ppXEqjSsQcrQCR8GMbGdTNbqS+MBOc9p4S1rcJ
	etN//QZNBtIRQTREZsnqLPyJrPOeML5LBJLWYIjcqfJH8vNd0Ye/bKAQGr0USTcCzKCf4Mn70ub
	kJ3XPL4fAJkUPOYZ8QH/y/B13+lKhznT9tdU6cJw6n/saiN8bTJVMUkUGle1nU7RjIbpQuobe2U
	BTpLLKOrA+5W5VpE/3rZlQKNjcbOivsFsktxfDAK1Nhma6FR5gaQ23YVFDBKgsXG7yHsPR+8v35
	F2l8mq0ziRM8V2EtXs0vIzF8xhULn1exHLlxHey32yPIJTwsILkI+bkpaWbBACAM0AKU0fuznmU
	gxCRc0m6VpDYh/auadQi9rqoq5unpvRcSvi1JqVNWeNzRfhn8Zlc00o609DXa/c3P/9xOqZSgb1
	q+SS2WS2+vyS1bRuoTd8i4NSvon5vwpDM8nmXv
X-Received: by 2002:a05:690e:190c:b0:677:db69:cc04 with SMTP id 956f58d0204a3-679362bd657mr954801d50.83.1791570961718;
        Fri, 09 Oct 2026 11:36:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-679356878e9sm131118d50.27.2026.10.09.11.36.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:36:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso38838a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791570960; x=1792175760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgxSyNtrJXDQubY2aMyQqoQIxuV+Slem4S799JPhD9I=;
        b=Uwv6hlype2h447m9gJUtfgDQ+tFsS16rL2T4nApljToRddvluwF+G3z/bO8u8ygI1K
         ZJF4EdHj2PlykmZMIEPW6P/dLpBnCtHWfCY+E48pcXXJi+pq91dD0SEtItnRnLxVF27/
         nfJas9etmlxg+GEIOqXbjMpWWkDqa1WN1TIDE=
X-Forwarded-Encrypted: i=1; AKwUvBwgdtpEpA/GaM8JgY4r43+QceV6plMNi2z9NxffurOXpA6Bpu4ym/jMLV6KQPa6vTcf+Xszs7mZJ9F7HaQ=@vger.kernel.org
X-Received: by 2002:a17:90b:48c5:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3ab3a7366bfmr2791683a91.14.1791570960406;
        Fri, 09 Oct 2026 11:36:00 -0700 (PDT)
X-Received: by 2002:a17:90b:48c5:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3ab3a7366bfmr2791661a91.14.1791570959864;
        Fri, 09 Oct 2026 11:35:59 -0700 (PDT)
Received: from [10.14.5.199] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab396620e2sm2960086a91.3.2026.10.09.11.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:35:59 -0700 (PDT)
Message-ID: <2b7d0487-dfb7-47ca-b740-178bd3391d2d@broadcom.com>
Date: Fri, 9 Oct 2026 11:35:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/6] net: bcmasp: fix mib counters struct alignment
 with ethtool stats
To: Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Zak Kemble <zakkemble@gmail.com>,
 Simon Horman <horms@kernel.org>, Ryo Takakura <ryotkkr98@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Nicolai Buchwitz <nb@tipi-net.de>
References: <20261008210621.1374785-1-florian.fainelli@broadcom.com>
 <20261008210621.1374785-2-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20261008210621.1374785-2-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 10/8/26 2:06 PM, Florian Fainelli wrote:
> When EDPKT stats were removed in commit e9f31435ee7d ("net: bcmasp: Add
> support for asp-v3.0"), the corresponding entries were removed from
> bcmasp_gstrings_stats in bcmasp_ethtool.c, but the edpkt_* fields were
> left at the beginning of struct bcmasp_mib_counters in bcmasp.h.
> 
> Because bcmasp_update_mib_counters() and bcmasp_get_ethtool_stats() index
> into struct bcmasp_mib_counters sequentially based on the order of
> bcmasp_gstrings_stats, this 16-byte offset caused ethtool to read from
> shifted offsets: the first four software counters read unused fields and
> reported 0, the next four software counters reported the values of
> alloc_rx_skb_failed, tx_dma_failed, mc_filters_full_cnt, and
> uc_filters_full_cnt, while filters_combine_cnt, promisc_filters_cnt,
> tx_realloc_offload_failed, and tx_timeout_cnt were never reported.
> 
> Remove the obsolete edpkt_* fields from struct bcmasp_mib_counters so
> that it aligns with bcmasp_gstrings_stats.
> 
> Fixes: e9f31435ee7d ("net: bcmasp: Add support for asp-v3.0")
> Assisted-by: LLM
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Justin Chen <justin.chen@broadcom.com>
