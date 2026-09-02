Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF3D49DB87
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367950; cv=none; b=HyteLpMmnPrXNFEl2qFFZdTDRNpZMzokqMnAJKY2rPqgAUaU7bRCLZrcZXsemGOC0823cZIUMGSKf7YzZvG0Rxddn3wsspmuNjUabBY3Yp0g4xTRklxoAEBU0Sj5FHcTwHvQ2HxEQ9nhBFZbBZZwxWTNPgFayshK3m+i94nHGpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367950; c=relaxed/simple;
	bh=HTepwSI6TnoHPNzBE7bLIxxjbSWmhP7fGN3PW1/E4x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TsqpPLI2ORLK8//JBuweN1R3X7GkPvY9uodEdYEFDsD8PnCYUute7/FBx00WCzgES5qYZUUHzFeYy1NXG8mLo03PU/nhKnweAda735s9bmbHlKeJjVtw8M7PcrEab+4DJI9SOvlcEdgsXb/OLMKTqLoG3nCkNucddrW0RGIv6jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RJZPwTIP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RJZPwTIP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2529b3139fso189036066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788367946; x=1788972746; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78cA4AQeDA70xi0M/frc4SpbYEzHpLs5pEaEdAkwgiw=;
        b=RJZPwTIP5gfiftcpnT+NOugX0bbeqL9wuWxw0tCrf5vijV4F8iPABnd/A8AAQ8M0SC
         4gNvC9wZK4q8eSQUK/eO9wtQh18cj5HVBPzSVsG8kx+Z1ocHnJGQMfdkKYp9Vi7ShZ3s
         rc5dCnWYnUv6FpRA9gLZHR4iOWocqO9Z3Mtwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367946; x=1788972746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=78cA4AQeDA70xi0M/frc4SpbYEzHpLs5pEaEdAkwgiw=;
        b=NgpVuelG8QI8Z9GDNWZpHZW2V9wMGRDrkpT1ZI7jG5qCEG/lbPGTqLkybQLp1FKIFH
         U06f1JBsr0oVhstomSvX1ghMunk7mrtAxPTPJEqFUd7Og3PJmxteBWunyVYOF1pxxH6N
         Mpu67YsrMTnNbXQlgqQjCQPuZyU1Fk4wlzmIzeIEVSp9hb8Gl6s8hC87spp9qbyq5DMB
         nXKS60Vn/xFrH/gURKefa1gQpmi604beJPZMgcgfm3ZmWUSS+Nvg4/0XPMnwAIHbcHDk
         k8Hzzl/ysmeaZdMH/m1C67RII6MLrrZUf7YbcfZk0/1c3Mg1qPCTh8tgVT72SC4z1VFx
         OvFA==
X-Forwarded-Encrypted: i=1; AKwUvBzcM7euQYro5An6DxA2GmeOeLJtTCTVXrP8MiMK7vJEzcP+kbFl1QSL0cHAdcGJrgyzU2G7l1VtWeyy4cY=@vger.kernel.org
X-Gm-Message-State: AFuF++kN2u2JLHsPtj+s8qf7Fzk2T6uDmGtl4UVQRhbgT4UF47dw532Q
	ivUhaw0nfY/SYmMAGDFFlRA+oMXn3EnnXSl1qd2XbBEnYz/CgbOmzGRrjJwQO3BX2JCnim8ZNtk
	VSsbW9wU=
X-Gm-Gg: AYBFou2ZSBD2Eu61/Gn/sl00RIFqCHE003e4rPLbZurSNeWnnwBM20WEwvoJ+nicU5i
	XKKqw3lZuj5SV0vyMstVzmBZQvMitTTqPHD6lYl9j4LYmBZhw7XRSPjkT3q4Am4SaCij1u9ebKi
	B+MjcbDLHJu4unT3IovAmJFoDMLATEJ4kaEOiv8xf5mWQLHwvNq2klwQb9eDrVvAmLh0tiZsJkf
	w6s/RbaWniLWgMLTHOfioj0Fi2GomCR7SWh3eW5t+q5wFxtpy5PERDtjSq2+bGYSzm/4XuvkKqT
	jf/MbxPZeg+yTcfehkoJRVSxyiPwZNCSOtKS/9ZLXjC/aPkoFGV0JplzwcGO/OTPQ/0lcfknPBr
	Sn0sXLCEuFM/JnDj2NbXaF6Wix9zxVnM8lE5lotvWo2h+dM7GCTIxzZHZR7NIR+yLJPIoqkXYPH
	jKU2g/ynZcnez7Hk78Dwkp+uVP3PvAt3ottlEDpqRNQJithHfrV9cZ6746RBE/I0VcidtbDvJaZ
	r2FoMHZQkSTEDGNzuDKndvv2GsiMg2WRrA9IQ==
X-Received: by 2002:a17:907:9618:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c25d55b5cd5mr427847766b.21.1788367945781;
        Wed, 02 Sep 2026 09:52:25 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d044d776sm163606066b.62.2026.09.02.09.52.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:52:25 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso2148715a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:52:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxeHwfq/0PU5EDdj/lC/Y96jkIv3BF0MDCEf1BQGmF3Lq8cWkiX3AcM/e8rkqgRoVXIr8byk9Bba3RiZTM=@vger.kernel.org
X-Received: by 2002:a05:6402:4345:b0:6a5:f4e6:eba5 with SMTP id
 4fb4d7f45d1cf-6a682567771mr4624347a12.2.1788367944962; Wed, 02 Sep 2026
 09:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin> <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin> <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <20260901222909.05d6239f@pumpkin> <1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
 <CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
 <20260901192523.0e989b10@robin> <20260902092437.00dfaa25@pumpkin>
 <20260902093644.5b0e8a64@gandalf.local.home> <a5aea1c4-3e29-4bba-8cd2-d4ccbeda008c@acm.org>
 <20260902123933.5c3c8fa3@gandalf.local.home>
In-Reply-To: <20260902123933.5c3c8fa3@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Sep 2026 09:52:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiazFSXokNeQEwHWhYkeALXVfLCAC3jSffXw6zisEFJHQ@mail.gmail.com>
X-Gm-Features: AcwNN1VAcdOkRQB-eJ_prwrHgqBxNxjIzc8st7TQIyskHkVCONnixx7Lued-lco
Message-ID: <CAHk-=wiazFSXokNeQEwHWhYkeALXVfLCAC3jSffXw6zisEFJHQ@mail.gmail.com>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Bart Van Assche <bvanassche@acm.org>, David Laight <david.laight.linux@gmail.com>, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 09:38, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Perhaps these should be converted to normal types and assigned with
> __force. There's no reason to have the value in the ring buffer be of a
> __bitwise type.

Why?

Guys, the underlying type is __bitwise. The problem is _sparse_.

Why are you trying to fix the symptoms and make kernel code worse, for
a tool that has a bug and a fix for it?

Stop it.

             Linus
