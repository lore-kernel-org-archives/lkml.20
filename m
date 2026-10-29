Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258150;
	b=qRpaFpMMRRzKl52dr7eLbTGIiysqttnSx7CaxIOoSpTCZQx3oqHvBMXz43mjDqXdqsKf
	 ayYRTTSYT50Q6comkbWvq21m1eNbrpw7mLC6lwOgdOwcZE6Wp41vvoCYXpRy20y8slPLq
	 o62aTTbVbNGzfnEl51KOy/LUnxdq5us/FFqL6GKwjKJCwF371hj/+J7L1FHXcVg4rUUd5
	 k+3rrhsDhkHeutqdxfaFW01ObBQ28hWYyw8W/36n89TxVNErwxr2NNK6eTEz6nJrbhHPP
	 fqJStAjgzIv5Mmxkj51Fy8V7MZjDSccIybbIq19GFImZJis82KaF+0oNb1zkygHswxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=QK1MJtOZnTvQLwtzTSOCrMRjmVXz1xBzWs67Kata2lY=;
	b=g1DXbm/5yasAIMAWTykHJ5BInw4498TDs1LhXL7GRMoyjNlSujoFVrFyGMkJ4v7qTDep
	 Aohu9AWOMn1nJXyKW5gFtwywmJDvM8LO44d3B3LOTQ0whY5Ukcb7v8NuOf8Rm539miAu+
	 SrlrqDLCRvvWwdarOTdbIXHJjmYByfnGa9qqeF0v9cwgibIEMk33w+nq1OhoNoy1aMo6P
	 HtqmluAsIP2PXzQk+uokuQJt+AcSawXq9nfbEQpGI6TJuNT3robkZvaxcHb3BPsn0IBbn
	 uOtTOZNC/pCqQodD9CZ4Kyz6I1VCCJ3oBz2g1pXU7Ws+Gq3HO15PgRxuc/akOr7Hadg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=lUcLe++e;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A66D606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A66D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=lUcLe++e
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso773371a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793258150; x=1793862950; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QK1MJtOZnTvQLwtzTSOCrMRjmVXz1xBzWs67Kata2lY=;
        b=lUcLe++eW8TiMI641PxvAUEBDgOFjIRK6nyX5FWa9Akqy8n6oLPZYPbwUzJ77iPq9s
         CUANv4dI1KON3YSwb+FLTSsHuLIlPK5f5e16+HhKvVlxyVHmsvuSED/3v0gbJ4NMlfE9
         ynySfC09rq/Q0UBOcODsainpw2I5hrDcvA7wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258150; x=1793862950;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QK1MJtOZnTvQLwtzTSOCrMRjmVXz1xBzWs67Kata2lY=;
        b=C4r9MJbRMihrqBD1cQ0nKweQp7c4PDPov7QS6sgGnB5uZ1gPBtjRbO4yzVKWCeEfbD
         djh8LY3f5UiWCNzTw7+EWpG8T3JggYeycRDtwvi8drdWs8H2Tm6GLd+C9DjEgOHZMNqV
         uV09sbpY3gttb1kunGsSGcYjVDA8sHPWVHyDTKidFFjV+BQ5zOD6io7Y0lYC08oEFztS
         4VsVqzv5TsdzwgDmkd6t7DUFjec7PJj2FXpjGp6eAIfIcOeMCzcQ9nQ8tCs148qVlvci
         PolMrpfZfDQcLpyZRpf0NZU13/kmZWa3kPW1rlWdY1z2UP64AMl4Tji4m13FFB8K++Kr
         RtcA==
X-Forwarded-Encrypted: i=1; AKwUvBxAvxIjxzQhOcsa4xtYYgMI0xqmiaweWhB1r6GFyvzRkOrZaXGQISE5UQ7SPismYZLJaRQuWFQAiKWi2SE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoC8qPUQiUqG1Ki5tqrV+qS+eO0uIqTeaWZc6bpiCUQHwXK6wv
	94yTg/QXCy96qVpUOvvtsLuSymYZezbvnY6dErO76e/qKZ2HNpqHj4Di9wl6AdC9QVw=
X-Gm-Gg: AYBFou3Lj1UOsgws2mvK4Y0mOLG+xt9DzHqrumlh5vWfPfXE1xR4lhzcaMs49LTCXBX
	edyp8pCWqqRTbJId2a/692n0nGuI2tnkmg9N2IwwfPge+UKGtgGxNeHD2NYT5pR8DFg46+7QY8m
	CY/c2l5L3PNRekQz4KFEH7WN9bi5RwJVtPH/hQZ+ArPWEvoVlOYVhwNrrht49AonRW8pe0a0KK7
	QqU4Kgak2c0Qen/A8QN0ya+DwSawMxeFK1CN0dhkWiNIH8JxjBG06w+nJJA6rQlmXrS04SlP4rI
	OolZ8v1JyZ+o+kuf2rSeOKm54M6arIb7zMd3N4Q+Zd0l7aj2hgpoRVSh+vDhlNDKYJUL1YduSBH
	5E+p1nXhS8MbawXjEURcuFlskzS98WMXT14mT09ANY8el5LzENMY6cu8hUWmUlP4A/5D8bY1rYc
	tcrfCsSYWXincn67E6Gh/jFJqgv6xZRZav3AIrNqR6Rt5482wPdMqKqej1CS/nciE1/TcoEOiVA
	voIJ1cQ/PCtEtfw4AU4Ww6D4cA0xhFOqref9IkVrDZXtRAtvRu3xtzOH87xznxLOSGbH+a5tFE1
	5IrLCVxg+NUgdSsnCa0QKnoXw+7QO1RHPDRc7DV1R7VE2szJOs/YOxM6IbPRiS0uVh4HvOtgpgR
	Y6gHdYVRT4F3owi8ZxgY+sbDMomRVS+0vcnaNjiMWfTKQQpFSsGnJuQQ6a42NbTsfakc4SBas
X-Received: by 2002:a17:90b:57c5:b0:3ab:9f89:e1b3 with SMTP id 98e67ed59e1d1-3ae580dded9mr3262824a91.40.1793258149716;
        Thu, 29 Oct 2026 00:15:49 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ac44asm2857764a91.2.2026.10.29.00.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:15:49 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:15:44 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 12/16] printk: Separate code for enabling console
Message-ID: <auLyoELT68zaiXs3@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-13-pmladek@suse.com>
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
In-Reply-To: <20260929120546.328616-13-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Acked-by: Chris Down <chris@chrisdown.name>
