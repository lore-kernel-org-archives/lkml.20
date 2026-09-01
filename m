Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50C1477E38
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255096; cv=none; b=cjHo8fvi2YBGetLKyy8erCoJMzElhxCuJgXbrMx9tnuWR3qLdSJ03RW36sgA5hkg/w9CJu0xtu01QZSfZ6wi6aUf7My0I6TnVL3UoRlKHO6SA4xCQ8aCxieg/ZniQcgoBaDk0QpTHM98cka1QD9znvfvO8md44LaHBh7X0PGh6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255096; c=relaxed/simple;
	bh=jl9D4HbYtt0iCvxNDHgV3gzFDkORtqHa3wmJR3iNSNo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QaldUzJJo+40esqMZY8sg4oh5QrPnMP4brHoUV5jnylT5Ai5vQ1fqEy4LBLm/Mv4uKXabafNiEO0TNscMiUVSM3S0jff6bB6LLtUfPngfy97Mr9f6XZt/qgrvXtuaJABL7BflyyteF4ePk+T9MDLj5vDsL7x0ZCs20KJCzwa+0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YgqCR5n0; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YgqCR5n0"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4955fd77c18so24884795e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788255088; x=1788859888; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/fiWQ63WImRaHU5MSJK0Js7QMO+oBpUYF5cl556nCw=;
        b=YgqCR5n09fBrW7zpDuji28fP8w1S3eHOxZzo4QVSz6U4fz1x+GnNUtF6rr74E2yD5H
         vsrdpoecqPHozyDmJyPWRVAIA51JS9tXUXRyzJttCyZEEK0dW0z4kUT+tN+ajxwhnrFg
         dITmEN/by07cVGJCqb/O0T7G7vlCIUq61hL/8LKR7Z7glwqCoPhnFrmFbR6zaorTs112
         UNlVglqR+au9cWvX7sAbH8WqtrLwhmThapJvJUjwm5P+I1PGL1Vd70Fb7bN4ZwH+qDYZ
         O2Qc8gb0LeakJLqi91CHZgqqHFwthbt2gndvFAvGhdrKSrZ02RQcWCwJt8nU9CB7w3V4
         npsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788255088; x=1788859888;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/fiWQ63WImRaHU5MSJK0Js7QMO+oBpUYF5cl556nCw=;
        b=rauM68FpzaRUyfrSRgvE/CNI2SBLVbmy4X1b0RgxhGARxGAbtewtpozSTOVq9OK6Pq
         +DmEo0SmLdwsylbnYgK+/gYASFxcEz++jThxiR6CDaxzPOn04AMR4SIMKOOqYzjaM6nn
         2QLxcQoDhXeUAwa8LPy195veW1dtvJfm1u27CpZgy+u096iVTPCRApF5s2R2kJvqqgnw
         o+5gMPbLj1X9ifa1HQIrM5IgS7aE8MoKMOyxX6ktwsZ5+BAOv7R+Nmgasap5+EuVgyJG
         TeHP9rAm93vdcf6aMqwV3fJTJIAWkN+uJcoBYXimi6xn7zfES2ONPWprSt75m+mAxNkW
         qCTw==
X-Forwarded-Encrypted: i=1; AHgh+RoEy1uyZ5Q+j9g1lSQ2GKVfM7c9cno8lKrEdjolJqp07TJSfyI70gUzxxzEa3w0wVqOaXOQWtH8OwYrp3A=@vger.kernel.org
X-Gm-Message-State: AFuF++l0M5u+0vZ+1AgaQoXXRIo5fw5R+sxy2Q5dwBohaHAk2cImlCzi
	pvGV2KnY+kZVzVkrn6kwDgjb9SdF3/qSJ3DpJqM4xb7i7suNNlPyFcInHO/7SD013o7kI6tZjXq
	aUgehUsSD99IjINJmLA==
X-Received: from wmpo25.prod.google.com ([2002:a05:600c:3399:b0:499:610e:c4b7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d99:b0:49c:cee0:e7c0 with SMTP id 5b1f17b1804b1-49cdc560282mr146000615e9.16.1788255088208;
 Tue, 01 Sep 2026 02:31:28 -0700 (PDT)
Date: Tue, 1 Sep 2026 09:31:27 +0000
In-Reply-To: <20260901030419.470246-4-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901030419.470246-1-cmllamas@google.com> <20260901030419.470246-4-cmllamas@google.com>
Message-ID: <apabb4vGhNfcXMnY@google.com>
Subject: Re: [PATCH v2 3/5] binder: check vma->vm_start in binder_vma_close()
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, Sep 01, 2026 at 03:04:14AM +0000, Carlos Llamas wrote:
> Certain operations like a failed mremap() might trigger vm_ops->close()
> on temporary mappings. To avoid tearing-down the main binder mapping on
> these, let's verify that the VMA matches the expected starting address.
> 
> Cc: stable@vger.kernel.org
> Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260831224145.169403-1-cmllamas%40google.com?part=1
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

I don't quite understand this. You explicitly made sure mremap() can't
happen to begin with, so when is this called?

Alice
