Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258025;
	b=mqACI1rWvBm7xMiZILUM3IZOFg1w/bQltGC7mU5Ixn96cCytYNjnzRk0Uj3TOGGScffa
	 zr0ZeRoTYsh/FQJRBpZ+jyrlOpiu46cjYk5BQVb40ozNiTLgBLb9VufLeCjIh6WPf2t1V
	 j0070IxmMEQ2rxteVeo7TWrsJOxy1y5jbaY+4YcWtKmAgCqFVaqCmAinurNg8htIvlQtI
	 xQBLLAlGLQLDqj/3aB7iiWHf3nVE9weLZtpvZKnyqSeRy+aitetsUm9uBGcoWAjGVSh/y
	 9Nr1GYj/PVwzCNprvgEhaZckHaYVcBnHMHHd/fxpV124xLlv9A5oanznVcOxxjW8WXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=FTTD/S+UNPlifc6ePjk5iJlNvpEw1FV1wU8LTRfDAVQ=;
	b=ZyC8ot2GW3eQnIhHdreO5HIXqYxmk2Gf4OFN7Wpl6IKWuVDjPIGIWUfQI+UVFQWKvLmv
	 lykCeRmIt4RVQ/NZ8fCzwW1v8n3eu/BOCLtdt0VcLMXk4uYLkZhRWukfbm9QOtgmN/w2X
	 YJnHRu+JbUqiFGoDjFs2f3Ig9fvwcOWQnd8B6QUpDIy+e6j2ktUUwGgksFOTZ8xSGDuRm
	 jL/SdChZZgzaN1ry+rUtsUcM4eK7u422bf0e3e9QoOosNStZBNXuo5Q+Xsn9iIc2R9wj4
	 1kodbchBxCDMa6uUWEl2hR1ptPQIvZxhdSy4dUxvze9gi5oR/uRNe3dibVP5onJZCOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=kOnSmpGO;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA6D606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA6D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=kOnSmpGO
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc758830601so1183754a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793258024; x=1793862824; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FTTD/S+UNPlifc6ePjk5iJlNvpEw1FV1wU8LTRfDAVQ=;
        b=kOnSmpGO+B5tLX/2h7y4trSWDUxuIpd80qFqaSGDnU5DMayY+69VOv5eU9Xb6++aAY
         64T7PMqTVga9eMIokUprFPOPm5VMLxY8t4npEUkdEgfyaELmVpdxO9fMgFM3V/zyw9Hp
         B6N6Ir+Fg+H3izgZ0XIDnOCLKDyeld3OBwDqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258024; x=1793862824;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTTD/S+UNPlifc6ePjk5iJlNvpEw1FV1wU8LTRfDAVQ=;
        b=JqOJ8Na640hcp1AJ5NRtnKT7zz10BhCZX9g/RkJS39CEQ65Nx5Jyek7koEERYoDXa4
         pBG6MpjwNR7DqldDcI36JkpW3rhOQZvS8PkVgeczT/jLQrbh0394wCxSdbS/YtMTNDFc
         UlW6RSYi49kdOE75AZuJeTkULNETLdeU+VHLbuKFU4oWTv/BDlMo0xhhdRiGFGIkik+3
         jOGK5a0HFb4CoFncyy36wv/j9CtremT2xtweJ7qIBK1HLyEyyW75wfo8P93dwEiR39MQ
         o5IOkXJLe7UhzucWWY9h8Omy9y3r+gu8uHHosynfsr+v4oz0woxZB1V34wCqn4xQT+fX
         E83A==
X-Forwarded-Encrypted: i=1; AKwUvBwzyfcUSmvYOhmX2u6W2e5AcFfAn9eC/c7fexxZrZBE8u3lzBAG6cO0YrGjVIaSfMMFKAZzjGVeKw+az4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs0479Sc9VYJrmEjfrneYP64R6tNWafiHQCXan+elmiPx9ecK7
	euf8CI1MH+pnCt8ePtV0hvFAnwsWXXnCaA6rN60dV0K9Wxk7VAU4+YXljY/L1eEZVBU=
X-Gm-Gg: AYBFou1KQIjE6yNePnUjSt4hTJzd6dBWX94UKY6bY4tDh2FaYObWip2K8gRaF9/jjSl
	gZflni5+n/Xm5R6yJsLP6aQ1qgg0ExDeiRA1kNV8AZYrLtOv86Mvj9HcugDuG0Xqfo3C09V56ZT
	gc/Z1Ia5AAqiNwoEhhq40t0psI1/eHGLzaXKSdmPDxJkh0pRnsjvIe4QdCgjb2nEhivBtiEJxXh
	hzOoX1FLjA00rHk5HQvxeh2Joz+3y3NaA5T4AnxtXaQtvisOP/qjP4xUbuTvT+m0WXNF7IrRXKL
	2RqqhkRRojvAun5trg9vdK8eQe+2kylG1VreBt5GH72qqEifFjq+84zswEC5AN1pm7+oYUy6rjE
	yyWge6xM1V4gja6YUhIpmWM/aWmsDMGlsDvJQBRqLHrVJcCmIWJnQTuJfAVxOB8MZY/x7BW2oaz
	x/xYt0YfV4X6Jb+N6S3dGi3PHiMPFY/0CpHYjaAYJFDsZi1KaZGjtWsoM21yZI7tL9boJevFIT6
	X3t9MXpWk6DRpbKehrj+271hotcKNn3S15qjP99GWlfjsPAIGDaelmnnJEAjQF6PvWAd9ilrYL8
	O0jhBHgJxe2WGlc+wsyRz/vR+f4MlJdNmO1w3UMmnnYH5wxWP7G9Qf6Pz46nzaoLgBkXcW0HsG8
	/XagoKVIxKRDpzP0PJk2WvZQsYHQsOnFd/IW9szdO3HjIYhobaULu9nUyhZXk7XhcyOoVpr9ihU
	bnYK3gJwYu9i6HwxqBMg==
X-Received: by 2002:a05:6a20:e211:b0:3e2:ea7:618 with SMTP id adf61e73a8af0-3e90226cedcmr4132727637.18.1793258024584;
        Thu, 29 Oct 2026 00:13:44 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccccc399sm5079182a12.25.2026.10.29.00.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:13:43 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:13:38 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 10/16] printk: Allow to debug misuse of
 add_or_update_preferred_console()
Message-ID: <auLyIqu49XvqFQg0@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-11-pmladek@suse.com>
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
In-Reply-To: <20260929120546.328616-11-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Thanks!

Acked-by: Chris Down <chris@chrisdown.name>
