Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257638;
	b=UR482b9wFjVj2A9cf3/Z5/+pdZCxYE6fBwlv1WFbrtS4eCrGBHderBf+54GnU3rPsBAv
	 7Nk8mW9Nk9PipnCkbRhuWDLTbDTfez8Yoqh9FOyxUWNvS/BHUEoOWrQbtqvqz86KKNogs
	 kWAaxupnfZyR1KXeR/6O1fMQV9JM63New7nYoIdZr8rgNuIaTiXph76WUX4PqqCc8nQZ4
	 fRMvrlMvFFcpzqFy0h0gDCYXa9k4iLCvnjN8NdAI+MNjdrPoMuitxcQJU4Vv27helr04+
	 m0UtB6CoV9mLVtN+KGdK/dJ79I/dQnq6wwfMnRJzrYhSGoFFRZE78YnbskENJO33nJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=PAF+KDcvN8DpaEiD2jCzv+OykFl+KAyQvYX6P+pWqrs=;
	b=oSR4IMztO7VzMeEv6qk/bzuk5lgvQZmRbDSIXFNMSUQoSxjG7MjQwhOJnPhMVBiIFpTo
	 cGNzroRlq/pgKEy0FbWVu6Ezij7e3OZdhPHph1b3yMzC7wroMzn+bqs/eMSL7jAbQ7FdF
	 FfDgJtCxjMkrmdxXTMDlRfW0ge3rPpFwyA+ufM9deNGGC1CodN2LrJI9k7yUfAUieOLW0
	 cJZIV5TX5jab1glJBACfPhQL1w0CIA/PVtum+IZX4XXxr/vLH+eo9BMbRK7kTE5WBcmmw
	 39kjBi1G2CPHJocbTg5wWNFfuiMM+JLFL0Kt0leDEpzXSIp3HnS50Xj1niv8aDxbh0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZxWpWLW7;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92BC606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92BC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZxWpWLW7
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso10061485ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793257637; x=1793862437; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PAF+KDcvN8DpaEiD2jCzv+OykFl+KAyQvYX6P+pWqrs=;
        b=ZxWpWLW7h1UKgmf8WetvPIMxY4hvSFD+JOOka9V9ldMXugr9I2vcHASp/xclVl3bML
         soLM0gc2WcJJZQ3Lr3v+3ONB4mE6sTH5X2J1nZZArjbVCqFAUymWxYVl+XzEeRoiS1B8
         yea6cl0uKgLDRz3yxaRIFP/jKAiQ9gqWObNnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257637; x=1793862437;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAF+KDcvN8DpaEiD2jCzv+OykFl+KAyQvYX6P+pWqrs=;
        b=lWCzQkI8nn//lVQCpO1WYRWWNt1exXaE9IeMQwjKLPnKMLih+02MY5QPZNidtFtPid
         pBPC8rc9MoMPzhPuUdB6qyUKmmRqm+kiN4iT4EPf/OWH6cgtOaJoNx7pg7AbhaNGLQLp
         T6r7vqO3lOPA/L42K9FPro4sAyA5BRGoXaxhVzjXceli0FAwgsQtBkZxQFwQbfwHd6MU
         EDo0Tt8edbAkQwlOuTIlmGsO9Uo/gCeajbzDbfKlCwlW0e9GxnxYnsZ1Awy5d7eqs5R3
         QD9u2VYqcQHmlQfpTsSO3AEWrIfM6cdOGx0DWlG5FTSthVBeQ/+39kSDBKQgjZXZ++Wd
         Sbrg==
X-Forwarded-Encrypted: i=1; AKwUvBy7gC2QjoDqd6IDpENlRFWp+ZJx+ViMJHACLynRpMVNbSb7GrMLGU7e4tR0Ld28tRVjUr+FsgkoOFXPAB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDu3mJGWvgtCvKr5w9/GPncznpMVq1phgOKzlDttzuVwWLkPmi
	eDVLdLtj0ruxt1QYbfmac+igMp/Nmc2b0f04rKTvsy4ZQ2vzx7Dk/nm+yxY3co1+NGQ=
X-Gm-Gg: AYBFou1JP3qU7QnLmNVKSHPGGU32gaCuuOXGEXhmWKaZXIMm3x8xayT/EEWuqnrRwkr
	DwRShiOEGfNvIsiu3wKQ8P4jA/hKvT5EPCemDGw+igobhL9J8fzjKraeIvgnXPVhLy56h1wOwek
	yPhSfjezgNGUEalOLXc3DvgSwjnlImQMN3b27NIWD8IaYqHQxHGJWPPDFO1UnFPilBz8Vs57P9Y
	NlDTUJbDF9G+u7kv0qgvgbHgLxI63uT3pAl2SKUuGdqQr7cToIXpBq+RzBcC/2sXc9pgQeQdgnV
	njCb3x5SfRwOyoBPbGPPWU+EZ7AW4SuAysKq1hIn8z03nBpGbLOaHsxfmE/jQSJ2IP+rhwjPIsV
	mFFxbK9fA0xA/oVDhXNL00AV6y11dGACp1ZCz3HO1zWyARrAlsZnQXbI/evIdRbfIQAIoMhLFhw
	wh5x5TilM+1JfytGWlrZf8ILetfKlWFV1j7lSlG5WVu84v5ipvD8shJy8CvlXGK07+k+r/Q6qcq
	ejhbvmR4mtCgxXIJV3IEDHdK6Sk0b2VxbahrAZacUYLnRJZ6t/PG1EssSZ7BrGx0yPx0fJMJ2+G
	OD2iBLI1cCk5rvIG4PAmEt/ohE5L7ND8nTiEImzfKaAJsnXdj5ZrTcK3nfcXT5BJMcI4vVDFPsR
	h5WrXe1aOZTiZgvnvp6jZI0gi0SCba5eY3urr9GgDXWE26LbIIIUr4g7opDkIOIm6hyTX9o0z
X-Received: by 2002:a17:90b:6c5:b0:3ac:adce:60a8 with SMTP id 98e67ed59e1d1-3ae57e34eb5mr3932489a91.5.1793257637032;
        Thu, 29 Oct 2026 00:07:17 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb2c5sm2899805a91.3.2026.10.29.00.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:07:16 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:07:12 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 06/16] printk: Check that index is not defined when a
 console is preferred via devname
Message-ID: <auLwoHP4JM718qCd@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-7-pmladek@suse.com>
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
In-Reply-To: <20260929120546.328616-7-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Petr Mladek writes:
>The current code makes sure that a valid index is defined when a console
>is preferred via a name.

After John's stuff is fixed, all looks good. Thanks!

Once that's done:

Acked-by: Chris Down <chris@chrisdown.name>
