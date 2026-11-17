Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906273;
	b=wsVz/mzpjRUpek8ddyFn2eZO0d5uOZCuzHSQZIRADQZm3U6K3evxPHDuFcvDa8dDtznS
	 vJBUvjtdwcSbh4FV1Osay+qjbECoJlBII1wDrS2hW/c0PYWbgE+1MtiQtEZKd4t2LgKnq
	 tSbjOO7qW2VzwKKZCuyFe+B2uG5lBP9ElQ4FR9NxvpbLVZYBqdQ62O+dJFJoF3mYmEDzf
	 W2NsH6OlSRwfIBEbs+fuOJlINp7oAoBs3bhsai0JqEzF6NtxGt/lvi5j+XRxBRIcme2C1
	 0/wixp2OQyLHbrbRnxHmMpMTs75TzVsyqBQkE1GuDy/BP5tn0hmIleNfi8unoYR2O1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=NFfn01r/I2+FlzODQuMnSDaVkhXc6007Ui5uRs6gM1U=;
	b=3DSBsgeJKBqvrUMPBYaLFhpz5GahMSBo3SRGVgtWo4TXn1ukSuNiAEZzp0bmvpgd70ec
	 Vu4YhuyivLpJnHaKKCxYQr0rnHzvjeLMJ6CrZ4/P/MJFtRvsbKGZnDEr3sjIA9AmdFQwp
	 RhUMp9nFvXwbfEN3q/so+tI5HzX6gRC7dU8NkoMO+Lw0KbOH4NUNaz9uoaA3iErGmlMiz
	 kYler5tQBugXC24B9Wn2BKa8ummCHCqc0yAysytvG02UGYm1SzuLQfTbnrRVMwOsRfJHq
	 uVUFtZShx0cHZUdk6POKkr9xOrId7rw8hiRThXtJCMU5jV2FsghLHWYzNx0XyNvRUPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=QR2IjSll;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BAF606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51BAF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=QR2IjSll
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so4491158b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794906273; x=1795511073; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NFfn01r/I2+FlzODQuMnSDaVkhXc6007Ui5uRs6gM1U=;
        b=QR2IjSllwZCap7dIGsWvdGybMobHzhdf0K6ybXEmYE5E44+iEXK7q1GYERnNlXkhKY
         GC2wvGo73nc1+dmssWwyPDR4NH+7UtaHFaDiGWU2HvBNZCH0755DyexnRvKOm5LXrV3E
         Lf3PKTlI8WrlDJQEfJrk4qRjoMmsKTYJFbpbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906273; x=1795511073;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFfn01r/I2+FlzODQuMnSDaVkhXc6007Ui5uRs6gM1U=;
        b=eXVISsNQsNRfb17W+vX8UTZuhwEuzBW8FH2WUPpL/U/klpuXJm936K90odbhp9PUH/
         8KlDEZnaERpCZ08fxYzGpQ/baLIi8UuyTBAmdDE/spCYYSxYXJd9WQZ7QWdUwFIOL5vi
         Z4LbRQ/XcehJBi32Ii/YNJcqQURSp8U3qxudAb26tpUqhBIbs5Wx89FZn+U5jGnTw1HI
         MogEz9gj2u83fVHqtkzLb73o92r0qNJ3jcV7X821CtyHNRgA3+fdSlusLa4evmsaexRV
         YAtcLOGx0wjJjtVMLwe0bRfHatb4FtrHHWyck3tafuJd75P3yAgEhsW2z0L2fGlvtTI5
         rYjQ==
X-Forwarded-Encrypted: i=1; AL+hErHzPrhb7akB8ht+YjRvko8RHl6+xbfuyZvs9xAYNP57jkcry00BrrangOtdqirouR7B7K7yAbyw+QKVM0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z92QxPVXi1HJ4MQj8VOuYUnMmENr99eLFZL2cmVkOm90UQbNWaV
	Q1vLs7OXNWsepEJKceIbbGWnwFDqVetGpxQamlBBxAthcNsAC7CbTeYtVEmqVAYGGJ8DCXHZXIN
	swKDUzynX0qh5
X-Gm-Gg: AYBFou3Pz6zxSV/laSCxfSicNjhK+KBrrNPyhP7MO7fWNgc4wsmXkedh7ksqO/IJ+Vi
	sMvwiGMo+w53rBt/r/ENyPeTn/pUOqdaJZitWzmWy3UqWb1l4SZ9GncWv/tFCXdH2yX89xIzScG
	znGLGKs+7ulEmajh5A+ycplV7B0Gf7Kbsfwe1+dmc/OG4UEkQBPZkESZC6HiPUh8tivdCjSlJ7r
	5s3eCxA+hJ0bEHZZECF1NfQ6c9jkllnB6rmPNzGvOF/PIHdN1IpaF3WVsECshihQYvkCPjsoIDO
	ZlphOSDr3pBGHNzgWGORlS18GaO7gMTtLV5yI6+sCry7OU+zA0nxRAxf6zooCm6rQeP9TPE7UhV
	x++dDBGzklHhQ0ZgkZ+/2azmjLa8YnqfS9w4rF2CSRmAlKgyMXbjs7TG13HpNeuo8iMkTn/NXve
	21Bo+M9wk5nOiBJQ0qzahX+oD7d9QioXrVrb28WjhxYMdvwpqeWe7EcESDjQF04Y47IIFYrwpfw
	X8AqKHxpTrRQn1taTFCmG7kr4iZNd+4VhT6mT4mFTJcvF0X/oKwikDJ55CB66hpqOhvrDPjWsW5
	d7cHHsA/i8VKP+w+70Vs9Jf60JXY/dmXB6HC2Nk9pJgaboOjmENBXVu/Sx6YSNAMQ8j4kLKsDHQ
	F/AAWbLqUZmCEeColWowxl02OBd7Ymq2c1y3InvKiPOyo6ff9O6kB9k2LscAWqM3xN2bcJKWC9o
	nea7pwY3wAvoviKUN1JwVBSwAYEXWTcDpH/dT+CO5eo4hkdExlxQ39Zx7Szp0jUd8D
X-Received: by 2002:a05:6a00:4518:b0:8b4:b88a:c2d6 with SMTP id d2e1a72fcca58-8beb6d604a3mr11459421b3a.39.1794906272633;
        Tue, 17 Nov 2026 01:04:32 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed20548fbsm5091791b3a.37.2026.11.17.01.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:04:31 -0800 (PST)
Date: Tue, 17 Nov 2026 01:04:28 -0800
From: Chris Down <chris@chrisdown.name>
To: Breno Leitao <leitao@debian.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	kernel-team@meta.com, Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [PATCH RFC 0/3] fs/pipe: copy a run of pipe buffers in one user
	access section
In-Reply-To: <20261113-pipe-pool-regression-smap-v1-0-b0dc69558ab3@debian.org>
References: <20261113-pipe-pool-regression-smap-v1-0-b0dc69558ab3@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avwYnDc2Au4mnHTd@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Breno,

Breno Leitao writes:
>fs/pipe.c into lib/iov_iter.c. The main question is whether that helper
>is welcome there, or, make the party a bit uglier.

Hmm, I think the part more likely to get pushback is patch 1, rather
than where the helper lives. :-) It adds an x86-only user copy primitive,
and then lib/iov_iter.c has to look for it with an #ifdef on its name,
which the patch (rightly) acknowledges as a bit of a Macgyver.

When Christophe proposed another user copy variant in April, Linus asked
for the existing unsafe_copy_*() helpers to be extended instead of
growing a new interface [1]. And in a related thread he called x86's
unsafe_copy_to_user() "almost entirely unoptimized" [2], which is the
same reason patch 1 gives for not using it.

Based on that discussion, I'd think that the better way would be to make
x86's unsafe_copy_to_user() use the rep movs body from patch 1 for
larger copies. Then copy_bvecs_to_iter_full() can be written with
scoped_user_write_access_size() and unsafe_copy_to_user() for every
architecture, without the #ifdef.

[1] https://lore.kernel.org/all/CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com/
[2] https://lore.kernel.org/all/CAHk-=wi1rrcijcD0i7V7JD6bLL-yKHUX-hcxtLx=BUd34phdug@mail.gmail.com/

Thanks!

Chris
