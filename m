Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746049;
	b=xu3xI/RUoyHuUWMHEiCSSEGAqLcqjezcn3xVXl16r2RNX7fzJcCbux53EfclXU/56zs6
	 YLeDM9k9ObjZFoNmcW9ZjrCNUVyQOTSMna6tHTK5qa4R0LAPfF0PwIvVABNEjzLZRuxck
	 zcFE5byLPjPG0IfL3Y769r6m1J1RHvNqn0KyYRrSLD0qFwN7KglQ+bAlvwSXopj+cPaXz
	 CR220hehd75MGNxVRswhOI3kDmdeRAgYucZZuZN6c2jL/exhrgx90xXWh5WSQ7Q16+NiN
	 aBtI9ZaDw6bR1fWp4snw7qpuhbZwQieKyTpzEiHoeVt50NT9DWZJbPE51ph+2F33xwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=olwsDETQbMC1aj+aH16sgdfVIUmNZxNlT6I3Dx7Z/T0=;
	b=qTEWI5yL56I2BScSHImrjVexgIOIsYgR+Scow1ZEAzIJ2coybuUfu6oMlWYtC8gMCetr
	 2vC2S5QwkmW6VDqavfLd7p62UXmRIOHAWhIQevKzCEsgUMUswreLJL8iJpgSgsLU0QSpV
	 wzdHuGUxQgdmsubwz4/XlLxF6XXRFvrgPq5w9XK02TG4rIW0FXYnti1YweZIDp+y7s0gm
	 X27JEszbvKPHzPCIZJTH38zmMwyQeZdiZPKL6x/pGSNTpD7H3iVGsjhr/SjS16Zpk+MsH
	 9Ghi+SdNhuhtPHd/5+LlQ5U0fSLcwSDd+ktzPya+SZyP9jsQSJU2TV1njlblJuWi19Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZjrzJkbd;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0A7606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C0A7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZjrzJkbd
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so403365e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793746047; x=1794350847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=olwsDETQbMC1aj+aH16sgdfVIUmNZxNlT6I3Dx7Z/T0=;
        b=ZjrzJkbdiCcqwKMdVzRLVJPkH+oNSvziUtZRGn+Z4mIFKSUBMSW8lyerRXbSyQzgwg
         owAULiVVjm3q9GVZokqj9wJKe4Z/12DVjzdrBG5r2U0T82thhswK41xFnT4cS+QkIIr8
         1tJa1XcMnuN+NCHVpwXd5uER9sTGp09jQX4TQ56CFtVltVSpld1aNeARWphpL7u88evg
         xxwkliPsaLi2wYZ+eI3RY6HmwmyMFqyAob8+mqrZvGfuGLRYBIKtGaUnokZ3ED9gFBdX
         uFjcrgHrnAZkxv2MF0voGaThHXbR9FCratKaZj0dfOt7Qls3jYIIwdnlLXXK6PF5VQtH
         V19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746047; x=1794350847;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=olwsDETQbMC1aj+aH16sgdfVIUmNZxNlT6I3Dx7Z/T0=;
        b=zSbclouzIdWYLYQJz1GGRKElQxPywoE7eOmiVA1f3BQTqVDE/O9GU586rUzFMQ3nVT
         kacNUQAqm8M/tHZ4tdmQuLjaZe81GWOzkS/3rVxWmVDv4yTHhxTlDQ7DAXc/BNWxoRo5
         q4mg4wXq+SI1Z9uS+DbeEVrn1/ixbRWBCyOctX5hSLmlpplgS8lOUk9m5W4579f4BYT1
         JGxGXgPCPL1NW3gAE7jkX56NsiAhUwcDSziBLOV0Y8e7YDCipC3NK/tlLd7TBZUrVx6Y
         sLhS+YTlBJqzQDuiqcSy13IcHotq7vTgGoDKE2rBl5H4m8rvY7WbELyqC0eKrvRmag8V
         8Iow==
X-Forwarded-Encrypted: i=1; AKwUvBxIs3BiBAg/8bJjsbZV6hPhPCyKmwseoW4rrwXKUKUDGGAMcIl7BAaJB53Al8yflUdSuJAC8XimRuvlVVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZStT6XrE/EGfMWy0kDqwhpKFkLQM8+fnb7E1SUP+8KVyeY5HG
	iac/yUuJgIXB7zmF8SmjlzRMZRQXDTP9IPxukoH3XxlWdozalaho7RrY9zhS79iE
X-Gm-Gg: AYBFou3IM6gBfnVpgR3OONXNsHOSLBCUeH4R0/kw+MIzoMlMhPktd8Unn8vt7R2yygZ
	k/dxGwafkwFmjaNqOr7j1VT9qkf4w2pHik1F4BlUU05zGA0W/VNHxqtsBNlFO4h3n7D5Q2KKh5C
	Kq9FKcPYm88CT/qzHTc2p5/DVTQDTEZZUypPP6o04HryaHOfu5KEwdDAvB4uWtEfqY9xRpLrukE
	ktuBTGIOt+psYRsQtYF+fhTWhktHsU66+JX/rYRoIol3QmJbs9cAqmhWEhvubwvExaYrhQ35t+H
	7MA9HPxlBO9USiJwHl4FCSev4CKZVSFEEKsicRTIUVGmGSIsqF+Vy0gyhPvdwF8fBtrtO4p9r6h
	VPGffB727hctPFH0o0iKezou4Jl3yrGMYxxrXL6PG+nGsMv0TXcQWTx3u8WUbBrH8CPErPaxwZh
	RLrO2pJxb+cAvd6aeJR3CqavY5zTalkgQFvxOhBa7R9lnKEyoo+hr214j0F2prII0IotGVXQVQa
	4LoCxuT2RqSLG27h80obyJBKa+KD+pZKLQlP7fZzutrMuicUE0fQ/glQ6Iadnq4tsugMEHnsoB3
	VpZ64fq9mJ+qEfpYh3bpqgbGJQhYXj2yJOF7ZGK6I4wa/OcwuiPSAWdyHol+JYUP
X-Received: by 2002:a05:600c:871a:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ac18d68babmr305434775e9.29.1793746046905;
        Tue, 03 Nov 2026 14:47:26 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c748105sm5831435e9.6.2026.11.03.14.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:47:26 -0800 (PST)
Date: Tue, 3 Nov 2026 22:47:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Jan Engelhardt <ej@inai.de>, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, Bradley Morgan
 <brads@mainlining.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
Message-ID: <20261103224725.253b560d@pumpkin>
In-Reply-To: <ad8358f4-483c-41d3-8fae-e7032c4a5bd7@paulmck-laptop>
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
	<4p5316or-75o2-s068-74s3-6q5011o75672@vanv.qr>
	<6f24126a-7f84-40f8-a297-095b470beb8b@paulmck-laptop>
	<qnrr9sr7-19rq-6rp9-0oq9-5939r07no828@vanv.qr>
	<20261102163448.3956dde3@pumpkin>
	<s2530278-793s-8r51-s5q8-349s35q8159r@vanv.qr>
	<ad8358f4-483c-41d3-8fae-e7032c4a5bd7@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 10:19:23 -0800
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Tue, Nov 03, 2026 at 03:03:47AM +0100, Jan Engelhardt wrote:
> > 
> > On Monday 2026-11-02 17:34, David Laight wrote:  
> > >> 
> > >> I can get gcc-17.0.0-20261102 with no further command line options
> > >> to turn `atomic_compare_exchange_strong`+uint16 into some object code
> > >> that does not contain a call to libatomic, for sh2, sh3, sh4. Haven't 
> > >> tried xtensa or the others.
> > >> Thus, is the patch really needed?  
> > >
> > >Won't that need a big jump in the minimum supported compiler version?  
> > 
> > 12.0.0-20210420 behaves the same. I just chose 17 because that was
> > convenient to try first.  
> 
> Are you also advocating ditching the single-byte cmpxchg() emulation?
> If the compiler really can handle this emulation for all sizes on all
> supported compilers on all affected architectures, that is actually not
> at all an unattractive approach.

What is the 'bloat factor'?
While the function call costs, the atomic op isn't cheap either.
Or are you putting the compiler generated code in the function?

David

> 
> 							Thanx, Paul

