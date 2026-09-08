Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914653B6C01
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883980; cv=none; b=hkevOMZhZtWw1lP2u3p2PP92qtV+7iNVwk+JXoR7b4/aMC4VRrGduYoGZFfexOuhKbOPzuTkEe0rFaBLqik6hBwiyOaSkgvFYFVV6n1BF9mYsySGBZWO9Nd9R4LVqCoqmL2K4r6J62uvteFw6ZbmiZEBBNPysafHZTUVVpZt3lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883980; c=relaxed/simple;
	bh=YAG/p2uvViRw+vxyRrhGP803cSs/AcKDMK5dMaKMeyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cU0WcoToqXj4LJp9LYKZOq3c53UFhs/hQS5lNvWZdtHMyerLcxIZWC/9MoaFamEOp5ddhbB8xviq1XleIGG20pWHH14isq+hjtI8OMdwwlnSyELKbrYP+N6efz/XyEUXoPnY/HtYTtHriLhgPhjlMo2wyQYg0yKZntvLlcMkVpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwGHcSSc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwGHcSSc"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b9320423cso54757305e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883961; x=1789488761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbKHtTY9KT87kFPLKh9dpqTp4nN3nypI6GpO1jaX+sE=;
        b=VwGHcSScWX6Kf1sqqNThyQskAlAJd1sqI9uWm+OAizhDMa2qJwyFMRINBP4+M5eUq+
         Rn58p02yPnUSVZ/566dAHB0GLXEYBvMuaQuQ3Jm/hG5J+BTqgklnrkgsc2aW821pbACQ
         syhv3w9g1kUhxpfZgqigzf4GgH/0miLuLFuHapOjYVKPErWc3KNH6T5qNqwYuSvcnd3S
         6sjwMiKGz20T+oSJBKSFzh4qYXhZ0FAplkdvZI6QhbvVNkijowbIrfbAdRYRxz6T1Gqz
         r45rWLZMF+j0Qdgd5el8GLv9y0H3c+OKgcPPLpCzanR16iNoh9LR3MuDAWwag+nA2ijm
         sl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883961; x=1789488761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbKHtTY9KT87kFPLKh9dpqTp4nN3nypI6GpO1jaX+sE=;
        b=kTQTR2ayZ2BEcaaI/gydTc4wMG2ftQ8DV+vBBdL5vC5VBeax5opfhqwZzRB/FyMknb
         vbPv8aMppNyGCyt+LvFrRmASMT6V4dLaOsnSVyQobMvJwfxUAelzXHcEU7O8lxXT+rmE
         aa5FNIg1SHb78ZbM6WcOMOxuPisoM7Xpoj+ZGXI2EvgPG5hGzdc3+54UukkpdlO0JOoU
         iStpbM2TNkKtmRJuiph965yzd+edPjoN09A/5s4EYVvWomaoDj95/a6Vrwo4xvPEjwid
         g8eVuIB8mjI8387q1wwMYXyTkERMVH/Eh+NFmZh5xOxcZ2fj1yYJsU64VX2F/G2GxWkY
         7VIg==
X-Forwarded-Encrypted: i=1; AKwUvBzfU17eQh4JNYj5qYhi9goH0afkdjO9QirEQzs7bOKgnOFE4XxHyuHSaXpJCTC3kT6V8eMBYKzmYgYOHoE=@vger.kernel.org
X-Gm-Message-State: AFuF++lE1P3knW2DOz9ZvM7OFQqAnK/cDyNpHjwVp4yUMx84AkKM/oW1
	vRAWU8Wd24yB/jN4r9v948m6zuHIf9k0Q5gKaREmcoZNxU+ysM84v/go
X-Gm-Gg: AYBFou1IFUg2uELwFuRXKhhueQ/CkxmEZlqBMkN+tDkn6xewGeWudZT8pfB4zu8xYVM
	COR5cBGAzdJqYlhBv7mcMqeQGyP8zc00W6HPzKV4PSPJDq4fCOx7Xfb3ppOEL1vYhP2Bfy5JZki
	hRfCbGaVD3DRpbmlV6eMBLF/X2pgCObFEw3YYlI0bvJ5qpGOL+1Ynkn+oK1LDqsca//0lcchaAH
	665Jbij1zRE/k3mJVFfCM/kJZxliJkMKImapfnTBT+E0oOaGSe5PWPZjgPENObqYDtXkpNP4Img
	p2+/GUP1RAR6UsIhK/Lr8eG9/x78LTA4v+MsNpCCe3Da+AqeSEIJKcXLrLpyD9KiZjW5ORsteg3
	Rnf/3TVrhpkHPp0ruCCpCYWFcR9WflLanyeL0bDCyZ6jOs2kqdVEbEbupS7BVMq5vP+RpVNfgtt
	VW31byQtmtoSjA6/dqldTR0dmtbyCT5LkOr3PBLEgmtehXwnhtehx6289RbkLWola/wQ6RoA==
X-Received: by 2002:a05:600c:4712:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49cf8248cd3mr498749485e9.13.1788883960771;
        Tue, 08 Sep 2026 09:12:40 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm36433502f8f.18.2026.09.08.09.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 09:12:40 -0700 (PDT)
Message-ID: <e6cfe188-c4ce-4919-bb16-9c26175e111b@gmail.com>
Date: Tue, 8 Sep 2026 19:12:38 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] nfc: llcp: fix slab-out-of-bounds reads when
 logging service names
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, david@ixit.cz, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org,
 syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
References: <20260905225211.596366-1-omermetekaya0@gmail.com>
 <20260906003917.627282-1-omermetekaya0@gmail.com>
 <20260908154152.GA40544@horms.kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <20260908154152.GA40544@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/8/26 18:41, Simon Horman wrote:
> On Sun, Sep 06, 2026 at 03:38:08AM +0300, Ömer Mete Kaya wrote:
>> nfc_llcp_wks_sap() and nfc_llcp_build_sdreq_tlv() pass non-null-
>> terminated strings to pr_debug() using the %s format specifier.
>> The buffers are allocated via kmemdup() or come from netlink
>> attributes and are not guaranteed to be null-terminated, causing
>> __dynamic_pr_debug() to read beyond the allocated region:
>>
>>   KASAN: slab-out-of-bounds Read in __dynamic_pr_debug
>>
>> Fix both call sites by using %.*s with the explicit length to limit
>> the output to the actual length of the string.
>>
> 
> As a patch for net, this needs a Fixes tag here
> (no blank line between it and other tags).

Sorry, I know that but I wasnt sure whether to add it since the bug
has been there since the function was introduced. I will add it in v4.
>> @@ -135,7 +135,7 @@ struct nfc_llcp_sdp_tlv *nfc_llcp_build_sdreq_tlv(u8 tid, const char *uri,
>>  {
>>  	struct nfc_llcp_sdp_tlv *sdreq;
>>  
>> -	pr_debug("uri: %s, len: %zu\n", uri, uri_len);
>> +	pr_debug("uri: %.*s, len: %zu\n", (int)uri_len, uri);
> 
> This does not compile because the trailing uri_len argument is now missing.

Sorry, I normally test-build before sending but this
one slipped through.

