Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258128;
	b=sr9yHzmKMcJ1bAfqb0oo5pAe7LoEQx1dDkzV0vFVOzU+H0M0EObTgQZCJyuIve8VtIve
	 NIHqzH99l5s3kB0c7sXa/KsX9aocPZyEH1pWdUzWY6zBLo+5GgGwJwWuP08H0WYSVBXwx
	 d3Y9SokzCxkqWhhtj9ontpwUpp3Dzmov5WBcDP3aSUsgx39+W2DBKtfYWRknr7azrmDfu
	 JeL32HkLGko6ixMms+kas/fgpQiUfTBGhRzD748+E/DWkj01RUx0XL2uX1r0FgAGuTXzi
	 xNELj0fB9OXpLt01w0y8i0sakJA7GA9Og+L8ytL9reMzBf2sE2sQwA5rua+GnEm5q5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=L1zaDsbgSjNpdoGtxbVOr2Y8p3X+7tAd8dPf+yYSu2Y=;
	b=p21+yUoPbFmfre0ch7TfDJilxo0XKNfB/S/EGTpq04CBWqwrFoKyEJS+4EZ+gkx69IP9
	 StTdF+20YCBRYQlLRLZQLvUDuJBN1mYunEsF0fwKVnEYGdzNAKHfBbsGJhrWwqIhZVUId
	 uaf0UIyfuFwl0Sc5sT+u6F1X4Or+kr3D+U+0eTpa1jcBT5F9FZjdhnUT11e7QNApYlA1p
	 rBMCcDk2rRbwBPMCrufmJH88r52pvPrbvOK1NlQP318MffwaXTvmb5wb4DkhlEE3pMbtM
	 nHov0iF1byxsDWuGpSMt3a59NIA2lqAsj0ng2NIL6FFW1LEsuK+BnFAp7JEKFRKPdrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=LVjMswA0;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC793606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC793606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=LVjMswA0
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd69954c755so1283866a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793258127; x=1793862927; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L1zaDsbgSjNpdoGtxbVOr2Y8p3X+7tAd8dPf+yYSu2Y=;
        b=LVjMswA0QWYALeKUNhXOEx5pGjU+fhsJOtnA9PWYeRYvoe5m2On881kg1JyOxja/Dv
         64HSRu3QXd3IttEx04MWtftWEBKEuffLR3zNVntOLLBS182C2p3J1DCTxeb8/S46Hgfa
         2mXwrqCwNeIWWP4OBa+OAZBdli5NeoRWI478w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258127; x=1793862927;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1zaDsbgSjNpdoGtxbVOr2Y8p3X+7tAd8dPf+yYSu2Y=;
        b=l7VhTGTbj4Pt6sEeRjG/PE/KTeNMnj9f81CSmrj7zLr4oHXUDXxfykK3J0hxXgiK24
         eAaDhNp2T4ueZgdEbGvEo5XkdYXF78tK3QBEaEyxRq+5TiUCaFfl3Dg+j08SefAwqRO4
         foG0wjBjZpBT5lNvIuz/9dJ0AEFb+oXc8loHmamNDctkF3lY283A9Vhg5LHINFKUbJ4O
         /Vf2ejXcfB1a07Omz2qpCW/BHIsmke5gE9J56n6qWcfF8ORDaV93e6cZ5rzTLIuLFc09
         P8PFap+/TePZ59SULi7pqUcOn9AKP9HwZh+ox/Je/psllCXtEPS8JFVEspsfvXxHRmqg
         FqKw==
X-Forwarded-Encrypted: i=1; AKwUvBystZCf4QnhIpSx9jrQJ1Tktz8lOP+ySyhbczTFV2FBnXWTdRtNHsbdED9hX1stx2gd9cSpuATGzUPqV18=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0kZpAA5mqn4SJSwSTJIwkIfmqb3mkEZc6GyHQxaUjiTeAeuKu
	Er4P/rciDep0cJWLdZdolwJO1PGzmPjYJbFXZd06fHk1Kh02g4BRF1WHDCT3ljWd4LA=
X-Gm-Gg: AYBFou15M3sj8KCeVXIxTChSou118uojCqWc2WN7Fwu6p04ElateGlekwI8DapzP6hT
	TYrT3pxz41XGHBnTk5phUFjLrrKGwus0JLDbH0KsJ5tH+jzBXx6we9WYLNlRgJA6Ev5tupYQGZ0
	8UmZ9JU73NawEOQ4Q19K5rj9VN+Q2RAJm3Hhu3Lc1kBHLZOuC8smIxd72lWM9h7Tz1R6nfbjJha
	vBjq5zwLFsql+rG1DpDfsIyjvdaAll6J9MUEnBv/xudOQiFJKIa2X0VbEa/O0C53EMeelXXZAfj
	u/FJ36M+gkPdszlyf5tg9fxDmXhJ1XuPH2Rm/Lrtf1p4tohtoCtEiex4ZWail1AA5vVnWpgihE/
	WKjIS4wq3bn8YW5SlZbNPGMPdGdc6u/rUdHjSKIl87bMv6G9gdiY7qFXj+e6SL5yFzDbzpCsjxO
	6VO7FCY+fW8isXgjCem1mGiD+e4MWTKfLjGjZwtIDmXRRGxJUIOsq8QDhpopvOyld5mHU6PXb0o
	hsCoOZwN5Lq/ZRPK4xoh52hx+2KXNFzTgGGVoABqQKNfXww93weECLuqCWlSvz0TVqgwA5dHqEy
	9IcLQoeJqM8wHJpHu9TEj0/cNfVz758NsQKIRGa3kQ6Op0+98t05G8r1XquYbZ5GfZ9q51frbii
	sLBQu+6Ef5Y+pFl19+0+noiYzxS4Bd28vL+q0/O4oSnaK6vHGNrCA+j9H5HhdC6njVDRQthgf
X-Received: by 2002:a05:6a20:6a0a:b0:3e0:f9da:3952 with SMTP id adf61e73a8af0-3e9025d050fmr4630714637.67.1793258127238;
        Thu, 29 Oct 2026 00:15:27 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6cfc785sm1883413b3a.38.2026.10.29.00.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:15:26 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:15:21 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v5 11/16] console/braille: Lock console->setup() call
 during the registration
Message-ID: <auLyiUrOsr7W8tuo@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-12-pmladek@suse.com>
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
In-Reply-To: <20260929120546.328616-12-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Petr Mladek writes:
>In braille_register_console(), the console->setup() callback must be
>called while holding the console_lock. This prevents a race condition
>with a possible active boot console that might be using the same hardware
>registers.

Acked-by: Chris Down <chris@chrisdown.name>

>index d780f6de303a..11d6b854ee63 100644
>--- a/include/linux/console.h
>+++ b/include/linux/console.h
>@@ -699,6 +699,7 @@ enum con_flush_mode {
> };
> 
> extern int add_preferred_console(const char *name, const short idx, char *options);
>+extern int console_call_setup(struct console *newcon, char *options);

Hmm, now that console_call_setup() is global, a short comment saying it is only 
meant for the Braille driver might discourage other users if you want. But not 
a big deal either way.
