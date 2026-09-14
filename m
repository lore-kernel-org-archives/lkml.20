Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB1A3CFF4A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366602; cv=none; b=XWaDxqlXc1DI1/cu1kwQ/oCCfcl8WdjgTpbbZEY/Gi7T6MgIvXuktfW2vKlelyHMUsuW6q90jU5VO9kz34FMs2P+LczZ+A/Uk2c38KH9TMonhVL1J//xbzyhNCATuV3Te2Nn/ESlwGsv2HHsLjf5XQ6eOabGwJD5cAKP3jm18Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366602; c=relaxed/simple;
	bh=/XPZyDVtW0FyskQoBI95DtRJ8HUoFeRyY9lxEGJfA4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIxtzuoqCh6nUu+BoZo54Jaawm/lgAldNOqw5xGhdZV1PAunDHuzNR9dBYkLPych/TtbKrbTp+KqHTJjhY2nsNs52jIct7KhDYlJQ1trRkRo2l4O4d1qEGupYdIqOAw3cJ02SKtMZ1NydWRTw7Z8K7M619s1lVP+g+voo5EmBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W552ZJ6u; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W552ZJ6u"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f0d37f9dso590945a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789366599; x=1789971399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9l6TcC8yxA6i44GPZCrTXq0qAIOnsPIUcD2ascLJ07c=;
        b=W552ZJ6uST3QspZ1bSUIlGAs22oYWdsHf4HZfGTiEZbR6p3jvfrscNac5wZpvomqeT
         VKBCS2RBpCQTU2NDGnsvT6wDaEQEzAoxjrqg6QywnEgKb7fjQmKNuVYK6tAA/iU15z7I
         xh9MRObLat2gr0O1aUVsb9ausENcR2N6ji6uf1k1j1paSq7dF18BlBF6kXqBXeQ3sBP8
         4lp762pmqKnPIp3+CQqBwTAIHJoEVxFB26b0HL6J04y4dECqmM26NoerTqf8BcLTxLiG
         qFRhjL2crCl0U0P/F5/1DfZGDRVd+lwQtyKhXv7RP+N2OMVzGxiDevCnc44yPZlzM11D
         mdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789366599; x=1789971399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l6TcC8yxA6i44GPZCrTXq0qAIOnsPIUcD2ascLJ07c=;
        b=hRn7LSHvE2rN1xfgC7VDKLcegOVgO/iSm+ddTzZ3RhSbjg8c+bFjIc32HjJZkn65gW
         rYywKqzN7zX1Bfvx3pAG7SqolZClfmYxbhEjjvgzEZCcvzXLIjek/XgU/8ag2ahIQy5U
         eDSREoY9QSL0kPF0oNYRsduoN0zvZovnnw09znFJsf4iDi45QKHazrAME54DwAceHCoI
         tT7IMjUk+YmkADuUCaZBPs48E2BStduGrS42a5Fim1kDOUhedVG76d9nD2M3xfAwG85Z
         ETNVxXC2FdO6wuTmrihAqZ78LebxDaX+NIOXNox7CIls7froyw+GlQhGPYGywTHgQtYe
         46EQ==
X-Forwarded-Encrypted: i=1; AKwUvBy12Q3MiCLqi4fp/r/NVSkcnPQ7gsVwCQJASdgOpgfpNKTUEp9n20ru2HD5vEEr2Ko4o6tKrWRfsows9Fo=@vger.kernel.org
X-Gm-Message-State: AFuF++mqFaqfWMntGN7hEKwQNvbcXUpXzA0uc+1989P+Mz3RItcD27BY
	9+gdUzWqukwvotzEj/fNmAae+fui1jlF4eq7j71HMeNUYj2TQjfMuQhY
X-Gm-Gg: AYBFou3LUjeY8c0hh7b08zzuQa/kSNDdRUUrHp8R7XXru5pyWddHP24axfKzSgpDr/v
	VFMOvXUsvsA2Gu+3GB/SkYlLV0wtp7SUZ2+bBkVUo6pNiIdISIxI3jV1yf4PAoXfa6CpleuaBeO
	A5ArcfCYkvrMvwIV0Lft0fql+GQQ2h6IbE/luj+06ZhgqozKpfivTgM5GU9STdv1h4Nk+Fofuv+
	umVnG/92OPY+Ryzz5HlZ4Yf2a6Cgz4Fy1/6e0hRYDGQYcUlCBM55jSOhs0y157ysynOymZnOOgx
	LONFf8PBoPlUljMuN35ruWYHMFRe6hRCo84Ojg/CY3Y4mqGudqhcbg7GjfztS26er5lx60ndB9p
	lHBCSXJ8KEWuULOoEPPbSsYlfQg4oJRPz+GVed6su6NJG3kDmkCqK2AIIJP+yEIXKvUEUayKm7v
	tIVKEE3HgUhfoYhtyQUoPeDLF/fzjk4FQCS+dlT0sAGbRbkW+N9cIDKTw+D7QToQ8hjhTAe8Mb
X-Received: by 2002:a05:6830:4413:b0:800:a53f:707c with SMTP id 46e09a7af769-80897094151mr638955a34.2.1789366599490;
        Sun, 13 Sep 2026 23:16:39 -0700 (PDT)
Received: from [127.0.0.1] ([144.24.58.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f5ffd82bsm10128992a34.11.2026.09.13.23.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:16:38 -0700 (PDT)
Message-ID: <da053ac4-f4ee-4f1f-9bcd-b2f04b13f407@gmail.com>
Date: Mon, 14 Sep 2026 14:16:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/12] tracing: wprobe: x86: Add wprobe for watchpoint
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org
References: <178875277830.93794.14247844688761142429.stgit@devnote2>
 <307d6fd5-a8fa-4777-b513-9a8cce46f38a@gmail.com>
 <20260912223658.c4495241023f72e3cf48bf0c@kernel.org>
Content-Language: en-US
From: Jinchao Wang <wangjinchao600@gmail.com>
In-Reply-To: <20260912223658.c4495241023f72e3cf48bf0c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/12/2026 9:36 PM, Masami Hiramatsu (Google) wrote:
> On Fri, 11 Sep 2026 15:27:41 +0800
> Jinchao Wang <wangjinchao600@gmail.com> wrote:
> 
>> Hi Masami,
>>
>> I see the watch address update currently goes irq_work -> workqueue ->
>> on_each_cpu().  I would like to discuss that path.
>>
>> The race window wprobe may be used to watch can be very narrow --
>> sometimes it lives entirely inside a single function -- and the trigger
>> does not always run in in_task() context.  The current path defers the
>> update to a work item, so by the time the debug registers are updated the
>> window may already be gone.
>>
>> Now that we have modify_local_hw_breakpoint_addr(), the trigger could arm
>> the local CPU directly and use smp_call_function_single_async() for the
>> remote ones.  That should improve the overlap between the watch and the window.
> 
> Hm, that is a good idea. Maybe we can check the current context and if
> possible call modify_local_hw_breakcpoint_addr() directly for current
> CPU core, and kick irq_work for other cores.
> Does this make sense for you?

Yes, that makes sense.

> 
> Thanks,
> 
>>
>> What do you think?
>>
>> Thanks,
>> Jinchao
> 
> 

