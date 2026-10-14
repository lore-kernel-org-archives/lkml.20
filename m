Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43223F926D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969818; cv=none; b=mi67MbDlz92vgOswlp4Gbp5iox92e3zBVFeWxst/AtpkeHlOykKGqy0qXow/bQmfgFcZJvEiUD+goVRPczmHh/MctEUDw7gSILDtkpPM6IY3QB+WBSURbaMU49ufVSjUUkHgj0JPzhFxSXnRLAZZrpzaukR+QIDdyRXk5ZdJ3gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969818; c=relaxed/simple;
	bh=u6gJt68ISLg/Q/lSHY/blmq+R/ptxrk0Ef36hoJfBtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JgvPvihohMIhQQYfTdnMYcgLPEMczludDk7eIxCLur5vaNXUrFExR19EkhyiQ8B7SlfXmnioAJaq9lCx0tDaCSKzMlTG0kzC9SFA/IbGOvCVEObKUlf4YxZCUSoNRR3iAsdHrrE2tNco0xufG6M1L6o6dP17cWS5yxTHy82RdAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RfbbcaWy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RfbbcaWy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so32374975e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791969815; x=1792574615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwAvbxpdHB7rTBg456HuEiK17XkREdk4sHLAdbrMzFg=;
        b=RfbbcaWyAEI4lgszSQdm2yDMR1LKRJ7phHIf53UIS/vtTzqB80tunQPWRBwOp5okzU
         +hFTystB3VyTZnKRNwJcMF0rwQmQFFgl4yOfK2mAJtY1Ah5SIRfDG5w8vQzb66WkDd/j
         InjGistHKAWaaY9bZcqIi0ux7xYnfXHS9fOef+UHZdwlWxmRsbm9MG2OnX3bOkI1ta1h
         N4nJwC6wnHaWTwYni/8YxolvVfpNjiF5GCh1GbGsertwqncDUf7i/mRYxgAH4kCDsB5W
         lZAhlJwwXXgkX2peCGQoFAZTmshMRC13R8WzqDJacUHfKQRNYP3f1nMr4/280dJsotJL
         3ydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969815; x=1792574615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwAvbxpdHB7rTBg456HuEiK17XkREdk4sHLAdbrMzFg=;
        b=SxpLACyx96ne4TVgL5EsIJB816uuU42Y7f9uzPVUOfcHINxoDBdtBDjHwzDIAOjU0L
         I9JuyOZN7sXGagzY0+6cajKc6B12ZpgLeng9fNnSkoHgqDmcaK0i6uJIhs+qlLxl9NNa
         aaCsChebwBRDoQsaOa7DntA4K99ek9bfcm7mhej3N7a0esm/WUoY0fAsj4rowR6RvTNH
         iunEoNIZDm7pTiO/cTCW1+PccUMOBnbv9Q8Qr4JmVD4cd5jkdoVZMw/q9FXoQeBAaXg/
         gS4b80v4+xBkRThuFoxlflL+iZ1x9Kg/v9e4Pqsla+36yHrFOpM5HZnXN5+pKZOCkkIs
         uw8w==
X-Forwarded-Encrypted: i=1; AKwUvBwPp5izLgKTG4UtkDAX8HMJi9kITM3+rG3gTLhqMxZKp8LdJ9Kq77e36UOdd7aODhYooxtdymbVgIHeUFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJeF9IOAu3JlPbhiCuPP4+8zyo/43Ych4IM+DQn6bcbxrDt5Wl
	U2W6fsfh6xxiK2e77CQzBqfNGlBYiBigTMgYqKmoqjf+p4FgMZi3mg50YMN9CPF9te8=
X-Gm-Gg: AYBFou3lm926RRJEG2igssdmOotfaR4VFCVvFddLnzWRqJ7W3VjfNd5BldFZ7npBB9x
	Y/ZGINZEPI7l0XMQ5OW9v/iJYG1tG1RLTJaeQbIl0UAWTc2VB2xPT+j/v1ySfgcx1fHq+Ib9p2S
	JzoKhFl4PKSVQlzMSHftizqkOR4AtgafJQDR30Ep/0cl9Tw/sNOnB1kaq3VkkDUwHcEYHLOmsn3
	42xEux86GdDXN6UqrGjkcy9bg7e02sQcuAdad3ldzkgkeIzA8TqhpC+TgmUwTZMAyDF3Kc17aDO
	TrhuSFxZamFSb3zCkPS9VhS4nrG4FbqLwqa3++iN5usWLKyuv0a3g2/biJDq/6CZon+cRncazGi
	ouB8zhWaysuErp1afjw6oDcmdApgzyyHOhc5dNYk+9skRTaPrOa34Btt3waONsXrAisDaN/pvyK
	nW74BqOyFYwDd3wZwkKxsd2rBlGN8nNTdTLSHSlSFio68GJ6NydXyYARRtlwBttfG2iP1CXgowB
	s8uQ4mq52VzHCKbG6rckRxS83iRtvGMvjxyiQE9eMK5f6BmSy2j1um27LZzsvMZo3Ue9a5cNcPM
	vMMrjvOi7SyUrllejPDUiczBfA9o7mEiMbbDCfZW
X-Received: by 2002:a05:600c:a112:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4a1966379f7mr198616185e9.11.1791969814987;
        Wed, 14 Oct 2026 02:23:34 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4f34sm10988702f8f.28.2026.10.14.02.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:23:34 -0700 (PDT)
Message-ID: <ded7205e-3dc4-473f-bc83-3bed6d4fb605@suse.com>
Date: Wed, 14 Oct 2026 11:23:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH module v2] module: Fix uninitialized count read of
 unloaded taint tracking record
To: Binbin Deng <18983559317@163.com>
Cc: mcgrof@kernel.org, da.gomez@kernel.org, samitolvanen@google.com,
 atomlin@atomlin.com, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261010080356.6596-1-18983559317@163.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261010080356.6596-1-18983559317@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/26 10:03 AM, Binbin Deng wrote:
> try_add_tainted_module() allocates the tracking record without zeroing
> it and initializes the fields in this order:
> 
> 	mod_taint = kmalloc_obj(*mod_taint);
> 	strscpy(mod_taint->name, mod->name, MODULE_NAME_LEN);
> 	mod_taint->taints = mod->taints;
> 	list_add_rcu(&mod_taint->list, &unloaded_tainted_modules);
> 	mod_taint->count = 1;
> 
> The record is published by list_add_rcu() before the count field is
> written.  The readers, unloaded_tainted_modules_seq_show() (debugfs,
> under rcu_read_lock()) and print_unloaded_tainted_modules() (panic
> path, under guard(rcu)), traverse the list under RCU and read
> mod_taint->count.  module_mutex, which the writer holds, does not
> exclude RCU readers.
> 
> A reader that observes the new node between the list_add_rcu() and
> the count store reads an uninitialized u64 left over from previous
> slab use.  This is a data race and leaks kernel heap residue through
> the debugfs file and the panic message.
> 
> The race window is two adjacent instructions; it is reachable when a
> tainted module is unloaded (rmmod) concurrently with a read of
> /sys/kernel/debug/module/unloaded_tainted, or with the module list
> printout of an oops on another CPU.
> 
> Fix this by initializing count before the record is published.
> 
> Found during a static-analysis-assisted audit: candidate sites were
> surfaced by a Coccinelle rule, and the reader/writer paths were
> confirmed by LLM-assisted (GLM-5.3) code inspection.  The issue was
> not observed at runtime; it is identified by code inspection only.
> 
> Fixes: 99bd9956551b ("module: Introduce module unload taint tracking")
> Signed-off-by: Binbin Deng <18983559317@163.com>

Looks ok, I've queued the patch on modules-next for v7.4-rc1.

-- 
Thanks,
Petr
