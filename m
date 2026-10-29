Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258268;
	b=kmPe0OOKDHt8qxeO/zQnCtDwjU2YUTbsR3pnNVwLQxS0G6Wf5tXIgmYwXAECY3e86SEb
	 k9W1fyFJb63+fO/2Wt9yfsJLI8Ig2JOcM7jFlLbncntpYoUkf36YHghIAaVpXbkBPAZjB
	 ghZ1E622fxKQWeLBf/WLmVXfoE17TQ3aQCea0Lzd/VJ7we2oeJYRS5MKuxRMBQpmzM1/S
	 4MrhgPJrGHb4eV/ylBdvW9muO7YnLaJ+3m5o6psBsDAMQ4VPpn6EUXR3m6PGzHC5CQ7nN
	 AiDdeDB62u1j7qAYdEJOikdo3eIPmmcY5o1pg9/fo/f+rigOBntjOgeLWmK9hYjGi6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=Yb6gnzqdkBBsBSd+UpHkXdLbbR2C/5ErCbdnEkK4n7E=;
	b=hHwsGT7nIcbEtYEhIoMvsVFCMYl9KiS8ypfrYReU+y7vIWMVmraxrPGGxqImwL5S6Vbm
	 1T/r9BfHajrcgNpIEpv/wjywi09GwTnP+E2KYDqSNtU0Ni7TqL/jA4kbbG9sNDIhgicT3
	 wY4KW4zvQ5q+UXZ4XbJVMyRrEGp+ie6A8xW/OLTEcmfGlfC0jvhOBri1gvwlTCDaC0qdH
	 aRsMZtL0lN4b0x7GKTNQOXqKL28xMcQuEjHMxUHo1KiJk5d7MbvEJqTlVABv97+n6aSDZ
	 vehu53HfjtiqeKXNCiXU4+emN9aJp+n8NGx1wN/E41ykKFs39fBND7Gykl5ERocTOLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sidyG9w+;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA7B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sidyG9w+
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so951928a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793258267; x=1793863067; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yb6gnzqdkBBsBSd+UpHkXdLbbR2C/5ErCbdnEkK4n7E=;
        b=sidyG9w+YyEKTrAjyjJPBUkzg0e1B5pwEPYWzq3ptIn/wtgRCIw0JLXVWVlPXv6mcq
         4Pdtk0G697rVMD6KFlXhWcipg38cHZctgLk2L7Smv6nfsaKODNXwba1k9W9ii0VziqWM
         jkvBBXAVqMBSAQtqrgOkKfP4H2akzvJK8rqdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258267; x=1793863067;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yb6gnzqdkBBsBSd+UpHkXdLbbR2C/5ErCbdnEkK4n7E=;
        b=KMOtraCD34mWmz7xuCveC9kEjwndKCUsmlJ/m/xBsqxyZLgAG1QJ2w5u6F4xXRLf1L
         QhqfW5GEbwW+pcesymEsbSCp8Oa2sETZtpFijj2JpgISzAjeNt2nOc+tRQupT5KeaHH+
         EidXye737mocy9hEYiOPG1VU1KbxaiE51ujWnNh48KrUiOlSGHFpJadH2aKHxIYDoqYA
         l90SyHyW9bg8D+v10HBfG0Wv/glpa6SnKnFB2IKYUrlm48Pn4MO4b7S9KAxuz6ROHhUr
         PFORNciltW/FuaWWASJk5hnDLCT9c2NSNM3Gf2JnFdZ/BQkak5ZcSjXCj5FtqQByrJGX
         VR9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxptpgLw2YfnUkF+Mik/Qi1PYldkW6ZfwcSHGdcytJmfWszZuxoQYqSQJnApEw7hjZ+PBJez+HsSmIku20=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD418paH+fHxOoU8OKb8iYuEtX2ujLDTfMJxcrXnLxmvMFzJFt
	2nZwxGtr0g9XuujFsUWpT6WRbDMRm9EyatiAuVwq/dfEhzBBP8mKvY3sAxfMYzSnP94=
X-Gm-Gg: AYBFou2aqi7pq2aA2uuRIQCTmSoAOtpgU4gh2zxWXKfO3wIaY/Hrcxp5y+in1QlSLmY
	UL+AYFRHyg2e7EFuGOE3Ez++KVQxKs/BUfm+8gXhGkopILQ8z3YlLsMIX8R4tZJFcmwECHJlJeD
	UfJ541rlnseuRIbagpRogqo2aHwNMAUEBmNSYZ0cdB7Afakd0u/LeMfKvy2VGSgpbwf+KdgxgjF
	P4jfDe7+FQ4wi6xAa2FQv+87Ig9j45zQ395/yiaUzPh5P0+MDgBY5oocMVfCqsoYGahU4zuM4ZI
	IH5MSND0UIY5e87SjX4X74JJlhqxTpEc6BD3boXb/Tq+TSmSz0WJKU8n/OGlY78j4UsNdGMWbIj
	JqNpbCKGzHoUEC9cRM0rJAotHKUY+fd4sv41sCb3EpFLYVgaTT5nOfyppyCuHWcGiSGHxESrvNG
	hQ//lBomUxxjYS1AHzqReM1Oh5FC2kWZISy5T55CU20UnSmO0hsZKnv7pzZBThznNr+/sQxL0Sj
	qwVjjTlOFNrLSIrwfShMf54jchmNnDIlOO8+9m2S0S6ihzFv0ZbYRPEpUlKEhbnZWGT0veECtZD
	4oettsOXrhxqfHhX08Xogzig0oLBoEtbcv//VOfvJf/R+PTIGdu+4bv7Htl8b30tT4o+WMWIUSL
	SMyBOtTFsYtekhFRQNgbAuym31hEc2Zgwuy+EUcu9wwwoAtN3Zk0OP5y7jH4NKLm14BmaC+G6
X-Received: by 2002:a17:90b:4d09:b0:3ac:96a3:77d5 with SMTP id 98e67ed59e1d1-3ae58154d35mr3206654a91.36.1793258267265;
        Thu, 29 Oct 2026 00:17:47 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e806323sm2866239a91.9.2026.10.29.00.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:17:46 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:17:42 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 13/16] printk: Try to register each console as Braille
 first
Message-ID: <auLzFtLAUEYKvXIO@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-14-pmladek@suse.com>
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
In-Reply-To: <20260929120546.328616-14-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Petr Mladek writes:
>Braille consoles are unique: they can only be enabled via the command
>line and use the preferred console framework for initialization, yet
>they are never added to the console_list or associated with
>/dev/console. Because of this, the preferred_console variable remains
>unset when only a Braille console is requested.

This also changes what happens when the same driver is wanted both ways, which 
might be worth a sentence in the commit message.

For example:

    console=ttyS1 console=brl,ttyS0

Here we used to end up with ttyS1 as a normal console and the Braille request 
was silently ignored. Now ttyS0 becomes the Braille console, and every later 
register_console() from serial core goes to the Braille round and gets -ENODEV 
from braille_register_console(), so there is no serial console at all.

I think this is probably fine, but just needs clarifying in the commit message.

>+		 * @try_only_braille and @user_specifified define which

-> @user_specified

>@@ -4033,6 +4061,24 @@ static int try_enable_console(struct console *newcon)
> {
> 	int err;
> 
>+	/*
>+	 * First, try to enable the console driver as a Braille console.
>+	 * It would have metadata in the preferred_consoles[] array.
>+	 * But it won't be counted as @preferred_console because

"@preferred_console" is preferred_dev_console now, and it is a variable rather 
than a parameter, so no "@".

With those:

Acked-by: Chris Down <chris@chrisdown.name>

Thanks!
