Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257830;
	b=P4lCWt7rk6rSejb++s8hvKsIHhYQ5CX0u1yk7zg24uBgimzx8hoiczhWpaXLsfSoYz77
	 q9cP3sWhB6vhBdrWRyARV5iFWqgQPW/M9cJidV3JPZM0XwbTu21BP8c5P+DXP/OuHWeSF
	 kB9K0nAuCrfA31hWZ/EDXxOzTMyEbTWnGTzoyDcNAwoeFE9VwBcUFLrLFinSccJUaWZIz
	 0Iz/PBwZ9S98ZUAKW3Ab18N2k/ArQP4t65jQBo8iXdSTBt9vQjmTjnssdpwaJEl9YK/HE
	 IOJgjjQ6KrVDTmf/iVm/xHUHJGQzPyHYNJuhLLO8OZgBUNON2qWLEwUBsegeu8PQ3hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=9MKOJg+QjYltEb0wEPfF47Frl1tKSXuREtNDY2JTwQs=;
	b=a1efNUHBV2wYEXxkeDy58YSoJGA91vc8VaA0q6i8dce/MhzA9e0YFhxa0wo4Ar2DFSX0
	 q1nxe1I9YErWXWzAU0kBheWRm+/CKuSAuOYUxjqTSU+U9ODUm+PzWRfxnspt0QOskvWC5
	 4yBwiqqPLhce9k1pvsw8qUM4nCvcUAOwWWsQ10sVtX6DjtqVaWjgnEFcxIebHqFMN2n6R
	 GfOK+KT0aldfAUT3QyCDhdP0E0Ao8FS62z6xfHwDn7VoRoW+8rRYMiH93n/ARPPE94gL9
	 ri+SWMKiPeFjH1tzFXeIGjn5Hgm4HCe3mOkaCKGzDWqvqP2j4Mgdwsh9Tl7mVeEGDuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="kMA/SrG5";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A779E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A779E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=kMA/SrG5
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ccca948203aso774766a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793257829; x=1793862629; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9MKOJg+QjYltEb0wEPfF47Frl1tKSXuREtNDY2JTwQs=;
        b=kMA/SrG5QmfRcoXvpghmiZYxsVP+d/rLSQoRREvBJ3wKnHez9EGmLEgYk8coNMCqDM
         NzW/qnppVmcZ9XEsDCN24q5kxKWdyPR551G/e9ix0EiMs4BXWaiwHRls9360nx1RljDk
         UJrgetln54SF4JQ9GIZ50qjprl1zHZO28d6G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257829; x=1793862629;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MKOJg+QjYltEb0wEPfF47Frl1tKSXuREtNDY2JTwQs=;
        b=QwxQ9PAni0G37SYzD/eoITC/IBHpqIUiPAJVNF/DO4wtbCF0fRNlVS5vdpTMlJwwr6
         IW6a89melWd3Y2C/GEOb5G8RhTTLYH3AYpbVOUGB/du0VoVYggSTbkMFWGStHWsDof5X
         wY3mb35354Rpk/fT484OaLkp1+EJ/QMiHmqFaY/ZKX6GotQMy+en6VnU/dbChjrTw3rO
         wQOn79hsX/01xjW4RqIWLzGbvPHkdHW2FrJ+sz2VhBNSkbxkX6MbDP33omo+UyZubNfZ
         FHIIPNY8LYOepgUL1E5RYsi1fs+TxX4UuZPe1uHvEH1iMvlhlRrpGRvFbiUbOX+IiWHq
         o6VQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2twP8HigqauDg8orNoCy17IU+OOAvuEcmLbEoTS99hBQ7ACFLV8UxvWZxWOKn1buVRefhAKYJGD+mHYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/D1RZH4ojE0hUZ8gqN6I8uNx349dzNd8BbCiRx/OGYnKbdvwl
	84gpu+6c3LE1GrLML+j+3qVNiL1hE50HqkgJiY+g5BqItOV6I4jANJex6kNz2scD80A=
X-Gm-Gg: AYBFou00LNNiJKL0t6NIP1JZQmLBxdHf4XLaXi+93RsaKGHERjPVs1sDB9a4iUy0Kd8
	ZjOeAlEqDbIsbT7VFHHBFhs0lCjWa/W+VjjLO5OrKcpwhoTDJ+/Q+0x3iwqFLXHF61D5CkcmKJv
	b+0axzCeu0oFgcWsN5hYkWg+dbkZTW3LS6AAySrz5OGTXYHBbt6HZKOZEZprvKJQ44mrVdhyWzN
	AMZPW0epsBYm16WyS2J3bKxJfIopGjg9yRNLreLwBtc+ETbFqRtqh6yw3ek0wYSMNRFkA6IPa05
	2ZxG4j51aUg2skAmgOPhJNl7crxaw7qbEL/YvAIkUXy/xsBBqEutrg9kNHs/w/8qzj2wjHhCx9p
	6gzBq1cyw0nfGmWTGFZzN9/f8uCxAXYfoaSjm8AaATmJGjFzrLBqQK/qTYfRqeVMWIEfU83VW9M
	m2TSMyZfSHZbFngOKCpMHC+XPOoWE/a/u2o7V3FPj3W5NvSTjF0xZPkP9AEUqRMSjlBLS6GhNCg
	g/ZSivET2EAaE7VRBODGP0GXwacSweFjDmZGlU/ixL1iPNKSG2HY3QE8u8qS944QI47V3u4Yitj
	2vZwxE1PqegdgslNQhGuV193YQxbbOcXr9RDo13xn60bGUKU8lmqS6xL1ybX2GzH0oTmxL1BSwu
	B+5VjFqViICNYY0ZOiptKvH/8/HTsxfcf8FiPmw5hmNxWffqBWOUUlBi4bMXCqRI6blJ4FTrR
X-Received: by 2002:a17:90b:48c6:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3ae57e07a31mr3254491a91.6.1793257828845;
        Thu, 29 Oct 2026 00:10:28 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57a2fae4sm2978311a91.4.2026.10.29.00.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:10:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:10:23 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 08/16] printk: Do not quietly ignore adding entry for
 a preferred console when there is no space
Message-ID: <auLxXxTtFsxFurOl@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-9-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929120546.328616-9-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Thanks! Looks good.

Acked-by: Chris Down <chris@chrisdown.name>
