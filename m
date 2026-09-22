Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002C747A89E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108305; cv=none; b=u8/8vsvG2cXc6z0c6seaBHIagxisw6n9IFke+j6UjBiVS7asK6+72vQZEbwsCxmKBn7KPKERBpegCpPPDxpfLScf3NVnpZWBOCEoOg8MqFcLka+e/YVEQHYuZduZCe1cFXkvFGXGoHBeYGcpaOJfS5My88/T3yFLh+wQpVsqQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108305; c=relaxed/simple;
	bh=FTZMA4wlhzxveYQ9dr1FFJi1lEikUfekTPo6NEWsZ5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SW099oeBZND1D7oZUmjtuDh0p5IxzdhZJSS8LyWEhMYRFYy1CMFSBidrqOXSsgqHpgWg1ytzQHgWLjDgXCwl3pKul2aUhyJxMq0V2m4P9EJr0J6Gc0rD4aputsTh/gpFcnismKLRdyMgU4n615CRK5DHugdqL9Gk8c7OLFYg8nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uGi2j3Je; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uGi2j3Je"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e6ba4abdfso1862835e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790108296; x=1790713096; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tn8xXGBVvzcHAr78qZWxVNv/+bJC57XyY04cz9a0UyM=;
        b=uGi2j3JeFQcPMHFwchM1gbRGtODxb89WKnQ/6mNnTS0ntsZpnZS7FVtGCW5eeClz+V
         JnDiOLnOJPqlhfyj+jRAzThKkNu+oqX0qnNnBKznxzI5uZ9WiwvaDWy93lXKy/DSplHF
         sUMpgE2N13/06z3uxU4gcF7fABTvLlilzBZz+LgCnN84uI7WOMBDQ3yAWpjRtBNxG7q6
         /cukMPzDK8vbjY+V2C4XsDTWJ5VL88IfxKUBp7asPZQQW6lWU2VNUQ07Zr5qYmCKJ4yH
         S8UOJ/E1qqhlHWyNwOvSFDqgcTcV3BglPJCEYvIvfkEiOSSjG/9u0RRKQg0DPnNPd8+/
         2vZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108296; x=1790713096;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tn8xXGBVvzcHAr78qZWxVNv/+bJC57XyY04cz9a0UyM=;
        b=fVOqDoMp1+QgEdlI153lRN+y/QC/VZhpVnl77kTUZ4Su5lQ3Jr4hX1Hgtrk0BQVTRq
         /xyNbcvu0oFExRiT2EQ/6fmGj/BPfMOHiYBZcdb66brMFasp8ewggaFXdeQslik67OOw
         x3oSDxNDGiDXe1D/bT9wahTB6a90sOu4fyzAX2QgOUeEc7Mc9mXSkVsbLGub3gQ8OI6H
         UZ37J5+G774R7mbx0qUHENhMaghiBCuuRC3XkVIXzt6C2BcCYD+XxiTmGzferYIvGlR2
         hd1qXtAjjCygcUX74crEBfFT+pMuN1o1onz9BzpVaMOPx/TJfak/S362G3a1qjOSf0QY
         DYwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaLsAQQ6UuSBG9smLamvTvTx4wHr7AQlJSnd5eXr6x41OE1gHtsscVlQTviENrBDVU7jnWhzsbAzHXQIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l74N3L+QNn+JiHFGKEJfcrUINZ9HkW0Z5upXsx+IApaRb4Qmoh
	27vyd2NXKCCNOtHzgBbmbLzRt1IkfMCln2EMMGU2Fykd3cOmbUcKRGQWTMwwO+fxKst07YsWeJd
	k4vsQn9NWMSmQkoEctw==
X-Received: from wmim13.prod.google.com ([2002:a7b:cb8d:0:b0:49c:e6be:fb62])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3596:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49fdeffcd58mr4843455e9.4.1790108295831;
 Tue, 22 Sep 2026 13:18:15 -0700 (PDT)
Date: Tue, 22 Sep 2026 20:18:14 +0000
In-Reply-To: <20260921-binder_let-v1-1-0cfc4c535544@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921-binder_let-v1-1-0cfc4c535544@nvidia.com>
Message-ID: <arLihrQfnwJEDJEi@google.com>
Subject: Re: [PATCH] binder: use irrefutable let patterns
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Sep 21, 2026 at 12:49:28AM +0900, Alexandre Courbot wrote:
> Replace matches on infallible results with irrefutable let patterns,
> which are available since Rust 1.82.
> 
> This removes boilerplate for handling impossible error variants.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
