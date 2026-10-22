Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659704;
	b=PqVH0py+HeDcAA4kCbv5ejEVv06RehSxgZJi6kNCbRrF0YPmXvGSBvuWd1qzWAVhDT1x
	 ruQ6x/VAw7hmsRK1kJvIYHxvfb9SJuFPzPXLSgJprsYg7cV9cjGcJsbsjwrM/9Q2gj15d
	 BcPr4PktYBlZ+bfb6WOv0vbGExSvWnYNmMlm0QfPDasDxcIk/+OV2VbC3JBHMPdtzPY40
	 X3qKp+01/S8VWWFUp1IEyIipGDTrlu/4hJy+3rPQ8fsBmR3/O9ybD1+imjHUdol4ulVQP
	 eyBG5DlBifhx6nuckA28TU2RBFfimYzbmpylLrxqSnRJHbPUcpgJmoac5C5l2ItGzcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bGj6EN/omX0uE5qyyJLIAN+qlCLiq46+bLn+6BlAVTE=;
	b=At2iSKz3KNT3sK4jKkjqsdPUsPjreZXZ9LQuXnN+FUI8kXDkPj/9X7UpNGJYg0v9BZWW
	 aSZat1OQzNm+nABtHv8zAhvmtJsQ6KZbK4wqIEd/wUADOyRK4AXUn+dhoTvxAfmdgjLi1
	 0aRfSeyvQWRnsUPiPJVwjxgT3R63Zn8vTfSOUQnRDHE/e1fDYvvdCyRLtQQd0K94uKbwP
	 lWD/BABXqvQjEgBi4o8pwIx4xce+q31BlOR03zOQuQcTHxmgcPXm/ZQUrG39bz/9flaie
	 9QmiOq+e416M3aUwIVkcHl72E1mVkAXRrIdhcOL0CTitpRRLod4HbLICY4pBE7TLl4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bq4nQQve;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFB4606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFB4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bq4nQQve
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b060ec084so1208063f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659703; x=1793264503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bGj6EN/omX0uE5qyyJLIAN+qlCLiq46+bLn+6BlAVTE=;
        b=Bq4nQQve9WpfkmCavE54oRtIDUMfl70YbCx4Tp0aRw1ivQw+1HHHSM4oCO2asnOJKg
         K3aKwrDen8sGxk1IRsoG0We6kOQ5Nuxca20pRXutpZl6/wInZS2ARWW/3XQNVFjbKxmE
         5ljDDZQadXLS8kptWZJohh0gOEANdV2zWeYdLxuHLn6FnerKO4Mai+39MiivnSVOUlB5
         3PergsB2Tna5qn7Bfpp83ImepspiuyYOdRXXq9nAKKU6JvEaQ47ELsNqUYrmunWfA5+t
         9WxooZ469J6MGLSJjVXIFe/79RGYV685VF5mNxa50jO/39R5HycsWGe5XPJgbu7OuNF7
         eQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659703; x=1793264503;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGj6EN/omX0uE5qyyJLIAN+qlCLiq46+bLn+6BlAVTE=;
        b=A2xQZ104hjmBJRdsdko7uVRdggldaopkPW2qK9pFckfdysVSoAz8ChQ9gda86R0Z9N
         drU4NPyfsX7GQdd+WKjVVRIztD6WLzHOMnlScfX+YWv7102xf7GUBQ18R+4yr0krOnq4
         y0QTXPCkfRX/Er08EasXVV7jyCp1oOr7Lht4BO5OibxxfggR3q2J1TUm+yHN6dXZGXTs
         3p3vp2zOyT/DY/aUE5rJBKIvEdEqngUJ69pQcuD5Q8Zw956tw1UPMustwasGcEuK+hGR
         vhl/r22uECeS7BYlzxE7Gg5mygyA8P5dcdyMfofZolx2Cqu3zEISL64xIiUZD8QadPGB
         xSow==
X-Forwarded-Encrypted: i=1; AKwUvBxZGgacAePFxciqL8dptC0feZ6RPJhfu0mqGv1EVS1qnM4qR1BL2DZBQ9ZsyFZRtspG8ib3px2oPZTuL8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4Q3832gNPJhufNyIY9lG+gCVtKpAqotkkyNHagtB6pLtw2QD1
	mMbfRSQT5AraEypw8XtiolnsrXpSoUjyHnV/hslGoZtbUVaBDdgM2WlS
X-Gm-Gg: AYBFou1YoyBW/ErWENUJwIHC6y5YJGAkkXY5rs2hmLeCd3KvzHKn+DsIw6rtloowfBf
	EvTiJJTXT1b1OcL+blVcLGGWW2uO/pAgahOPY9LF/cldA5S+PQPH5XeSSVHfsaOsMDzpx1jT4sV
	cpiHmYUueZI7AqiLcSKQHLiyhH18d6xQDexqlRjaxnXrpKFjZog8xRTdAMxfzdgnw8xq6k1AOzB
	SYmA8U/9k8o3opFesyzm8sCpRxP3qTKe/+j0+jT+lURfW8U2rjFka6dXV8ncaTbo6Lm2loTpQOm
	UyGcCwkDMoT3PME6PyLzaEeUWFj1trgwFEbXsKS7SA7rKc5utj4RzTv3b/LRlhm5RJG8DFlcryS
	3pov9FH136AjsAie45djz/q3iEL9SlNKf5itFjk0gkHs2fBLCsCXlg4AfzYDHX0Au8JkOgz8Tw9
	D6fnCgTEXQaJEclyczBKRTz/pOB5qHI72slgLY0J47hSEg3N8SHrew7P8v1iMD+hwdQQjggexou
	LqnVcMf5sLLoY/737CPlmlauOlVpFG+aV9BNg01CfcXrM3AaTpvxLLLjwPDwxFZZg1oAVNipDiF
	XdKDfS6IvBdIJaoj
X-Received: by 2002:a05:6000:2c06:b0:48c:4f94:222f with SMTP id ffacd0b85a97d-48e26493580mr9869801f8f.17.1792659702564;
        Thu, 22 Oct 2026 02:01:42 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581eed3sm12230195f8f.12.2026.10.22.02.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:01:41 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:01:40 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Tzu-Ching Yang <shingekinocore@gmail.com>, Eric Biggers
 <ebiggers@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, "Jose E. Marchesi"
 <jose.marchesi@oracle.com>, Jakub Kicinski <kuba@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Simon Horman <horms@kernel.org>, Maciej
 Fijalkowski <maciej.fijalkowski@intel.com>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] unroll: Make unrolled, unrolled_full and unrolled_none
 function-like
Message-ID: <20261022100140.101ddf52@pumpkin>
In-Reply-To: <0a38e0b0-2508-41c1-bd99-d15c27579307@intel.com>
References: <20261016025613.2690485-1-shingekinocore@gmail.com>
	<0a38e0b0-2508-41c1-bd99-d15c27579307@intel.com>
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

On Wed, 21 Oct 2026 17:02:30 +0200
Alexander Lobakin <aleksander.lobakin@intel.com> wrote:

> From: Tzu-Ching Yang <shingekinocore@gmail.com>
> Date: Fri, 16 Oct 2026 10:56:13 +0800
> 
> > unrolled, unrolled_full and unrolled_none are object-like macros with  
> 
> Because those are attributes. With function-like names such patterns:
> 
> unrolled()
> for (int i = 0; i < n; i++)
> 
> are counter-intuitive and confusing.

Is it possible to make the syntax:
	unrolled_for(....)

Or is that made 'all hard and difficult' because he setting is sticky?

David

> 
> We have either plain-named attributes like `notrace` (BTW what if you
> name your variable as `notrace`?) or underscored like `__always_inline`.
> If you really need to name your variables `unrolled`, then I'd expect
> changing these macros to `__unrolled` etc, not to `unrolled()`.
> Although I'm not sure we really need it, there's tons of such macros in
> the kernel -- try naming your variable `current`.
> 
> > lower-case names, so in a file that includes <linux/unroll.h> every
> > later identifier with one of these names is replaced with a _Pragma()
> > operator. A local variable or struct member with one of these names  
> Thanks,
> Olek
> 

