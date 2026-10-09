Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B454DDB49
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546384; cv=none; b=iEGgEPAQ1J8/XNaE3pUkJufjyxQP5o770daXTzMF2rHVprAIr6EL/pNAFaUCO3+1v3sH6tK4bbx4vDDdj66YtVlX+oI6u7bIpSTMUFD5sREniMhFz76Gsib9mTUUYRb3TS8eW/ZiSGX/EHMI2K6nym8IMYszknmOgJ1z8BsfqJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546384; c=relaxed/simple;
	bh=qfn6Chi3zQPoGrRKHUmzBsOFSj22hZyuE74D1Bo2Iiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDEHF688bWcjcwRvKU6MTb1x6nZfT2RyUtxPFefJqveTjYwnjAEBJmn0SDOcleHog61noN0EDmPKLKleoSuM84LXuCzQRwiL/LINwwCv6SzMO03ZtXpqlFZHTbjsjPIefw9b7XjDnjR5a+NkvT8VxibGHoLqiPPW2t04/VsIVzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aRcxVCoV; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aRcxVCoV"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso2714666a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791546376; x=1792151176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BQ6/HQ3rrLrwxJjtL2d0lIbMN8Q2NnassUE+UKdIN9s=;
        b=xtgwQ9vgQf6lvx0apNju78EqBqFolcrdSb905D1tF5uPQY04kJuiOZfTxaTWGpdwQy
         d30CFEleDEtieajt2hC3mN8SHAXFB10OQcChCzcOKXPdMX4ZJxsuR1g9TLWb/JFzkgsr
         KAWp5fzxwpykmUJJSrEx6X7u90zjFfpN9Ma0WqoxPTwiS83d1hoSSYD0kB9IlT7il8dq
         anbsPHmpg5fBvVfCd7tyBkvn/d/FhIgbBUAmMp4VT0d2EZ5wyFzISvvGjIGoI/s626vC
         iuVjXrojgJ1Do9sKle4RFnPOpqXtFlWB1TJJ7KP0B5MMgFgUoas015pJnFj74teia+Ew
         OCSw==
X-Forwarded-Encrypted: i=1; AKwUvBwCMRKJx3521QcIgXRa39EzWbkprF18RM3A+bVsXzMDJ7afQSdapsqBG9b0bUflxWz2pvRFlJsVw4eVbW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9j12kXx+pXE5vYLVqbDrf6VA6GwAO5Psq8ujbRhZPo5khSMaz
	aWzUfcQ43xrIkraTZLUTs0/rDfpY3Kl2v8mXUTCBNy+NUlke3V/4k0w6AwmSBLC9IEDThNDmCYZ
	EZyzUhnf8pmKCK66Kl33oWI2mAXI28qjzM3w1AfYQLzB6Nt4by4qhDnMkUjXvhwgSmNVhbObYtg
	aJrNOwD81e4QFVKDMb+tGhcrzxeFDqPjOEbD8xHgYip5syaZWMM+DY5Y7OLU3IQuHzDVGQsX2QE
	4bL/D62cBnTXkwZBTAKWB3Tcw==
X-Gm-Gg: AYBFou1JywgUBb7pCbbUakeB/znm4b2K+AJVtqE4+EGwVaC4eIxjBvG5EpTNjcsng/E
	YjP0tiOLAbIANb7GfNzUyXwjMIziJnGmAwc1kIpSTqHIVaWxpgf838LHfptyp3iCcqpby+ZNsco
	VrQGQtmVPCbweDyqqFDdCC2vZcTFE42lfNf1NT9WomshWO6PAiVXsyi/lScQcRBcZUGKLnO6hwh
	BUE4eJbQJie5w+KftJ7iEGR+I9WwYRa8rnzfcGAp0Ue87YrLsgGZ+pzypx+YqPS8GS6XJToxm2g
	yqAZuHsh/HcWR6rfn6IFYhzeYnfY+/7PHNYbJklchPw0saqBDp7aaaNINm3vqqGUQxWPXBOYCcg
	7t/NkQMhlXyA0M2RpV5a5gCLb2WtEOytvT2wWhA7g40vKpCzEwwjE3gSzK4qHjj8MsyQkEWhoge
	R45sfOLCfwIiluwT7b2eIxMnbRDMtCRFm2dbg984UCdg==
X-Received: by 2002:a17:90b:1847:b0:3a4:f6b0:7de with SMTP id 98e67ed59e1d1-3ab3a90e800mr1555923a91.22.1791546376229;
        Fri, 09 Oct 2026 04:46:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-124.dlp.protect.broadcom.com. [144.49.247.124])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ab3382cffdsm571918a91.1.2026.10.09.04.46.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2026 04:46:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-151ba226e1bso9416170c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791546374; x=1792151174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQ6/HQ3rrLrwxJjtL2d0lIbMN8Q2NnassUE+UKdIN9s=;
        b=aRcxVCoV30TPCjd3pumAc//8aV2bn3Li3hv12I5s+yKPDfsdyTtnWa6GpUfijnH9Qm
         V+2xRzgJ53sAfL5VOWbWW/kXhfOrSzM3Q9cFJxxAtWCpPiz/z2hAzT+l/KmRWWLdPy85
         SEwMUXFnGrsvsg3PF+u5KjtISXbYyCx6BRCkM=
X-Forwarded-Encrypted: i=1; AKwUvBzoFAK9ahhcn2zbvUxjYeXpz1bpAZ9ns+IEVGWRDaG176WU3TalRybtNEC+VSU5qIvvQbBpwkzcqrlD7pg=@vger.kernel.org
X-Received: by 2002:a05:701b:4583:20b0:151:ece6:b171 with SMTP id a92af1059eb24-16a5dcf6262mr2016589c88.14.1791546374198;
        Fri, 09 Oct 2026 04:46:14 -0700 (PDT)
X-Received: by 2002:a05:701b:4583:20b0:151:ece6:b171 with SMTP id a92af1059eb24-16a5dcf6262mr2016563c88.14.1791546373450;
        Fri, 09 Oct 2026 04:46:13 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm9791902c88.18.2026.10.09.04.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 04:46:12 -0700 (PDT)
Message-ID: <448913a7-809f-4ecb-89cc-3aa3bde08c5c@broadcom.com>
Date: Fri, 9 Oct 2026 13:46:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: avoid sleeping tx locks in netpoll
 context
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-wireless@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, stable@vger.kernel.org
References: <20260930185417.61865-1-kmehltretter@gmail.com>
 <20261004122910.1392318-1-arend.vanspriel@broadcom.com>
 <asR1TaKQJlPFqEvR@gmail.com>
 <802a092a-314a-4f77-aa1d-134b3d020069@broadcom.com>
 <asiX75kRueyFqWuO@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <asiX75kRueyFqWuO@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 09/10/2026 09:30, Karl Mehltretter wrote:
> On Tue, Oct 06, 2026 at 10:27:27AM +0100, Arend van Spriel wrote:
>>>
>>> Lockdep instrumentation in fcmode=1 and 2 confirmed that cleanup enters
>>> without txq_lock.
>>
>> This is an observation unrelated to the patch, right? You mentioned in the
>> patch it only covers fcmode=0, right?
>>
> 
> Yes, the cleanup observation is unrelated to the fcmode=0 fix. I
> mentioned it to explain why I kept brcmu_pktq_penq() for normal calls.
> 
> I'm looking at a separate brcmfmac FWS-path RT/netpoll fix for modes
> 1 and 2. The prototype defers IRQ-disabled transmit to the FWS worker.
> 
> Are modes 1 and 2 used or recommended on SDIO devices? That would
> help me prioritise the follow-up.
To be honest I ported the whole shenanigan to brcmfmac, but I do not 
recall any projects used the functionality in production. It is mainly 
intended for SDIO devices.

Regards,
Arend
