Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com [209.85.210.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93B639E6FC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788081258; cv=none; b=RrWS2p2g7GHWcCayjYXbpcrnIMSRu1U157JXkXdcStnPZxWUwqnNumtugHqpgnC59gtpzLS8puhZAzKxqxv/+d8irV7vO4rh5RlD2k9MWJRTSFWQFCIjl9YwQmElt72o2AMDwu2vnzEZvXyJxJXNEtfobD4f906jv8vdnJy1G6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788081258; c=relaxed/simple;
	bh=AqudLIf/iTthiXu19RutYAR2E41lgzFux0xXyzaNkSQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JawHgMGn/No796v3hW+jvy3LwGG5c8wQaNfiII7vdjy0llO6cn3cEzkix41xZ4y6fIcJUZwtltfPIn9bFNLw4l3Wxdcb2SKuL1Ru7FH92WXLlQ0Odq1MpdARtIJQuGIt2n4/PONW/C8SkN02dmB/jR0BRmEE7x7odJvp7enubUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KPT5ojkM; arc=none smtp.client-ip=209.85.210.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KPT5ojkM"
Received: by mail-pf1-f227.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso2191883b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788081256; x=1788686056;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=31p2j+a2MROOfrBQh9qdpbaoRZRWKQkLx8FBZclkpJw=;
        b=dZWa2DQVErnL+48HeBGdEMeBPExyCPVhEoe3D3YU6wKiPB0/qxoW67K10zC8DS+/ro
         a6Rc6X4IFCn2tPvHWHYSzYMtWto6hEhZBduIiW6e5iUOIM/GgIxVtt6GHSHy0VbcU245
         EpaWRQ87CITlJolFGxxztxV2MsS3w/OHbgvDo+5X29hDmjd+4hhgnH1j39Kww7wsG+xf
         9/yIjjuF+b346QB21A6/HnJZYybg2llcaOe4vLy2Oy5i+KiiBP8eUa4xhJL5QfrU8cmI
         bZVQyruEg8NrvrePs+dOpvjIlURifEbEV18pLGIOokWMenTVkprTXrjI4af1iRXPvf0K
         oLPA==
X-Forwarded-Encrypted: i=1; AHgh+RpSYMgaeGC/v1rVIHERwmz2PlV9ePnXpFeVSGfHFd3z3+sjz+AGyMxq02Qg/9DtRfjZFb81wMo0uKdPJuw=@vger.kernel.org
X-Gm-Message-State: AFuF++l7ULpA/UPQiBBQPE3U4KXrv5X66fmDo2rNKnBHMLD+/W84UV74
	FuhLJRte347Za+GQnyfmNIc68DrVIah00QJci7WJhBR9EfwhOgEJDUwMFrg6wdVWfl6kXJLU9BY
	uExyWAUKqkbDPq9JAJu3UbOUw+YIPf5JggVdr7k8ajuZpKoBGprIckg1Rn8BIEN3DZN1rF9gZAR
	gxRFxjuCZ7a2yxaDAKNNjtMIJjL9gg7w2Fy2kQ/sNovJzZXIvn06QvY4aeSrBWlI1xsz17nfnwC
	ep6xToIzG47C7vMqcbf58M2hPaJ
X-Gm-Gg: AR+sD10VmCW1F6FdyDfsHNoI223pmy2uJ3Ryxs6Nd3laRxkwwO6aMSPLfNVRmVMaPD3
	CIBhz+gByDHizbFegrlNln23LCQ9wxVm9FcMt3c1aqT8Hh/x+jowx3UZko4lAme6kILVO41aP/Y
	vD/af/VWdJCaD0S/+M4xF5GU3PcHrlnbZrXS7oIdMnZ4Y96mQ6hdHo+1R1JtM51SztbWBZ7ZJc3
	wDS7az67GTD97TFPY3GRbEVCzwABNKjNj8ucT7wLCb7hQk9zt1HGRBagG8VkzxNcD5gjWtIQKAH
	Z5Ly0GZOYIqy7QqwhQmETRr9j6RNqu+sqDLxkBEoxZLLpVQsmm3pYpkPNlFWn5D7Pr1vPk32/yY
	LSYW42YP5w7nxjwmW+D4kYbTQWemLtTBbx5OAFcQCyWb16Y5hZLRwQ980LckwbCWK9SpRu4MJqk
	0M+Ux5yF0cE1wl/SwTW5XPQ3cNPljJA84Lxuus
X-Received: by 2002:a05:6a00:1814:b0:84a:65e8:137e with SMTP id d2e1a72fcca58-85996706d5dmr953379b3a.17.1788081255937;
        Sun, 30 Aug 2026 02:14:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-1.dlp.protect.broadcom.com. [144.49.247.1])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-856a170c519sm1994314b3a.3.2026.08.30.02.14.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Aug 2026 02:14:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso1365761a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788081254; x=1788686054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=31p2j+a2MROOfrBQh9qdpbaoRZRWKQkLx8FBZclkpJw=;
        b=KPT5ojkM8C5H4eoT8xeyI3sG53c0Fn5+wEAWMzWOEZgCVTmYw7/WNakgVunVgZtz/9
         h1u/jorHHK8HIrw8uWA03nZaZAEC89ogN77KZ2kIkg1Ru5hXzl4OVCpo1DHEb5HvUklS
         SMJp0YjFTToXHZBikL65XuF5NH9yZN/M5jBSE=
X-Forwarded-Encrypted: i=1; AKwUvBwDAkEuxVeeveq/suQ/uvmZntkQNr8K36Y+JWrNZE/d//up5A4688ACDdYicW8HzEkMIT/5iP9v8VSYCOY=@vger.kernel.org
X-Received: by 2002:a17:90b:1a87:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-398da61d56dmr1054576a91.9.1788081253893;
        Sun, 30 Aug 2026 02:14:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1a87:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-398da61d56dmr1054548a91.9.1788081253416;
        Sun, 30 Aug 2026 02:14:13 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm29855331c88.4.2026.08.30.02.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 02:14:12 -0700 (PDT)
Message-ID: <8a866e2b-8802-4a8e-8421-2732da5f5c8f@broadcom.com>
Date: Sun, 30 Aug 2026 11:14:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] wifi: nl80211: add roam offload extended feature
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Huang <Jason.Huang2@infineon.com>, linux-wireless@vger.kernel.org
Cc: johannes.berg@intel.com, johannes@sipsolutions.net,
 hsin-hung.li@cypress.com, linux-kernel@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 wlan-kernel-dev-list@infineon.com, jeff.johnson@oss.qualcomm.com,
 Carella Chen <carella.chen@infineon.com>
References: <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-0-eeab4fda0f31@infineon.com>
 <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-1-eeab4fda0f31@infineon.com>
 <382c3dbb-ff32-4e62-9b79-c6e4cc6273ef@broadcom.com>
Content-Language: en-US
In-Reply-To: <382c3dbb-ff32-4e62-9b79-c6e4cc6273ef@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 22/08/2026 20:36, Arend van Spriel wrote:
> On 21/08/2026 09:56, Jason Huang wrote:
>> From: Carella Chen <carella.chen@infineon.com>
>>
>> Drivers can offload FT or OKC roaming without necessarily
>> advertising full 802.1X 4-way handshake offload. Add an extended
>> feature bit for that capability and allow PMK configuration when it is
>> present.
>>
>> This gives userspace a way to provide PMK or PMK-R0 material needed
>> by firmware roaming implementations while keeping the existing 4-way
>> handshake offload capability unchanged.
>>
>> Assisted-by: GitHub-Copilot-CLI:gpt-5.5
>> Signed-off-by: Carella Chen <carella.chen@infineon.com>
>> Signed-off-by: Jason Huang <jason.huang2@infineon.com>
>> ---
>>   include/uapi/linux/nl80211.h | 4 ++++
>>   net/wireless/nl80211.c       | 7 +++++--
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>

[...]

>> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
>> index 44f2bad08670..15731440c57a 100644
>> --- a/net/wireless/nl80211.c
>> +++ b/net/wireless/nl80211.c
>> @@ -18434,6 +18434,7 @@ static int 
>> nl80211_set_multicast_to_unicast(struct sk_buff *skb,
>>   static int nl80211_set_pmk(struct sk_buff *skb, struct genl_info *info)
>>   {
>>       struct cfg80211_registered_device *rdev = info->user_ptr[0];
>> +    struct wiphy *wiphy = &rdev->wiphy;
>>       struct net_device *dev = info->user_ptr[1];
>>       struct wireless_dev *wdev = dev->ieee80211_ptr;
>>       struct cfg80211_pmk_conf pmk_conf = {};
>> @@ -18442,8 +18443,10 @@ static int nl80211_set_pmk(struct sk_buff 
>> *skb, struct genl_info *info)
>>           wdev->iftype != NL80211_IFTYPE_P2P_CLIENT)
>>           return -EOPNOTSUPP;
>> -    if (!wiphy_ext_feature_isset(&rdev->wiphy,
>> -                     NL80211_EXT_FEATURE_4WAY_HANDSHAKE_STA_1X))
>> +    if (!wiphy_ext_feature_isset(wiphy,
>> +                     NL80211_EXT_FEATURE_4WAY_HANDSHAKE_STA_1X) &&
>> +        !wiphy_ext_feature_isset(wiphy,
>> +                     NL80211_EXT_FEATURE_ROAM_OFFLOAD))
> 
> Ah. _FAST_ROAM_OFFLOAD is not longer than the other ext_feature checked 
> here.

Actually there is a checkpatch warning that line with the STA_1X check 
is 82 characters. So my suggestion please make it FAST_ROAMING instead 
of ROAM_OFFLOAD and swap the two checks to fix the checkpatch warning.

Regards,
Arend
