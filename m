Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624930;
	b=p08H3xzJhQGJM0ub/BC+66CEQ+TDoqh4sKFFluyOA03BvHSZ4HcknBNjbOg2sTh0y7+I
	 JvlTrTGeLUqFHFCME6J/MLR4jpZFgSUQxHjyKrLPQeAxqmcyTcG1VGcSd7zAPlbP4NuKg
	 U9qDATSLjvyO6rQDENwCp2xj07xFvfaHxYo2xR4ed/iIU9BqU16+EsEt/ql7i8VHq+kr2
	 W0xw8YBDMkti4sm4TfGMSDvL43tpNkfylnOpX5w0SVSn0DPfGnJglpOWSl4FY2uTkb2aw
	 lYXk+ubkmL+4BShfYk+7RPujUepMyGN48ktAxMYRTbrAa42MGxRajRJiNF5Z14u+gSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gCSIudWZX7gMgRZPCCJXakD45lweOzZKZhj3scTS54M=;
	b=f1rUusRAupwjrVVeBgIOiLMmvDt8svPpOJfkCgDR4GT9MJU9GDUQRleYQqzucx8VbsGV
	 Ao43fc42vaXZn95wmsxicYgXKep0uGycQmlSrUOorGXYaNn3bn3xwj26nX9U0XA2E7IjA
	 EQYIGWp0Yap89bzchDRYZW+LNOVZvtlrT0l+Q390R0AZSslHHOkbjfRkCXrZrnWuoJ0mX
	 XdDY9pHFhPc2JvbDsj+4inT+uli9r116Rlcbq3YiIo0Li9r3uVPCFNhnFONBA6B/m1HOW
	 ZUJkVpQs56uWYojbaH3VDmxLJz4g5dCbgo6NvYKyxHrfcGLjHzjufmz2SAzCDGN8FzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZSkl5Lll;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08EC606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D08EC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZSkl5Lll
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso2155131f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793624928; x=1794229728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCSIudWZX7gMgRZPCCJXakD45lweOzZKZhj3scTS54M=;
        b=ZSkl5LllzWVh/snN/qacW2ifgSA582lvODlJLdVF/TgikzFdtTivfN9J0PZ4HsvK3z
         M2SwUwJzB6jI0aZk8QkKvJDI5M5r2cQgrKhetGvZCWL4g2pgCED3aIwSqH46xvG6X1w/
         ad9Im/D6/fb6GqXIjhJv/tBk627Ql7D56//bjqCiRV3tL/ZwKj/It+3sOJ9cOPY8foh0
         RN+erxoz52BiWVSBQ5JpHL36WSjByluaC5y9HLbG1GqCqYEdU/BAuo+yNomf332Z5cZQ
         Fh3CsU0JXLeKmxpEp29wAc2Ggm58ReEyo3T+lK3uGn7hA3l3XMUm7w3oIIZ2+fiDu/Vt
         6Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624928; x=1794229728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gCSIudWZX7gMgRZPCCJXakD45lweOzZKZhj3scTS54M=;
        b=YjHK6+JAcJRutE6IMneyzPhIPWAVaeHAfnyFRXUPTMr0GyGqBvCHGk7cF2wQ8aVx3O
         sO4xk9csTQuT9uj7mgGseKeP8E2J9bXEkD6ljPJ9c6qrp9I5hAjgSqdNEbCVvrVzRm60
         ZSngoipHXpv2W+cQzgfrzLKNNKgar5VQyUtAc1LArKQAIGHxckf5QgqEER+Hf+PrAA2E
         VUCJGR1jZrmGzYX+IQQFNfbTTIwb6OTRwzRA+lvVBs/OY9u6A0tmk/rqvLy4JWZS4rEh
         rjFJm2h0I9Rr8fkaHmlxLjmBd/N+vbAYs4Tgx3LU11bRIPmPQ9Kr0koBB2hJjsv+TETR
         lcwA==
X-Forwarded-Encrypted: i=1; AKwUvBxFo2/QK/V/GATS+F7vdaAf/1IfmIBtOV1CoqJREs5SwVPeVz/l3A86Giulj8aN6PRUB60TJ16FGMYWztE=@vger.kernel.org
X-Gm-Message-State: APuU4Z82U+ahlIeCzJDz2L32ZxRr3pMNrt5B8Pi5UnB1eb5uxbcqC99I
	LLGciH57aYeR6vvar10DZwe3QGbPrcHkYzr0hIIr6RCUcgrTV7LCAEeQ
X-Gm-Gg: AYBFou1ooV+hWBlH8TP3Zk7sTkHrAVIeIy0guRHBrt1LD/smhhZ8p207ItAqgReE0h9
	wsWicc1IodsRxoq587/0i2tna0cOE+MHJfYyXXqQTcrXwZgxAvZdC46DrVw63erwoJ9egdVhC5F
	BqwXuJGgCDSTdrRBYN2VkDM2aFMdtXkfDgjM2+CSp+neQsIEzCzazzB3XbHMzkgss1lqepDQFq1
	fKYCBn4GOYPk3z7IQDQuCSy5psNVVbHHPJPsiUvEvxVwSFcbCn8Kelj4c0s5ve9+4FTsG6jzw40
	3tRk7cJs3KTVOdPnsCji3fIsE+yIBHcavEnI4CPW/xwLvUcFXy65Ot6ZYJDpFGvJIe4Yv0h43Qf
	oMwQPQ7Z3FbTfCxmLare/6QnQkZy/nKKPP7DKumXKGY1ODmlWxvTfUkCRPzJN4SotxaKOotdQ7u
	9i08kRDE0sYHI3gMnEWELLkhyG0+6QSVChGaKVJafSUf7gDUk2B432/aI7l3D1Qk8tdItPXXgXN
	bDQjDBngO8C0qLkUKG4oJLi/oZPnVWPBg4qLBaCU3p02rCFdGKCF1uJhdf3nNLIkWxduyt5UgCU
	OIpRPAoXdZw1mzMxCIBmej8dMxnzBKgASCH96qJmxTOzXEVFMhQbUKyJ5zoTDzbhtgpBJ2Hr9+t
	pmrcRtWzx3h2pWazeaSzK
X-Received: by 2002:a05:6000:1146:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-48e64bba760mr25319738f8f.16.1793624927926;
        Mon, 02 Nov 2026 05:08:47 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm22383632f8f.31.2026.11.02.05.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:08:47 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <1c3ec0f6-6c6b-4731-9c9f-809a047aa2c0@gmail.com>
Date: Mon, 2 Nov 2026 13:08:46 +0000
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
Subject: Re: [PATCH] kconfig: preprocess: fix UAF and SEGV on self-referencing
 variables
To: Ruslan Semchenko <uncleruc2075@gmail.com>, linux-kbuild@vger.kernel.org
Cc: nathan@kernel.org, nsc@kernel.org, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261102090500.54575-1-uncleruc2075@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261102090500.54575-1-uncleruc2075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ruslan,

On 11/2/26 09:05, Ruslan Semchenko wrote:
> In variable_add(), when updating an existing simply expanded variable (:=),
> v->value was freed before calling expand_string(value). If the value
> referred to the variable itself (e.g. A := $(A)b), variable_expand()
> accessed the already freed memory, causing a heap-use-after-free.
> 
> Furthermore, for a new variable definition, an uninitialized variable
> struct was inserted into variable_list before expanding value. If value
> referred to the variable itself (e.g. B := $(B)x), variable_lookup()
> found the incomplete variable and dereferenced uninitialized v->value,
> causing a segmentation fault.
> 
> Fix both issues by computing the new value before modifying the existing
> variable or inserting a new one into variable_list.
Thanks for your time & effort, but this was already caught some time ago:
https://lore.kernel.org/all/20261008164504.3683811-1-lzsx618@gmail.com/

- Julian Braha
