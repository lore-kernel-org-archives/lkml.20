Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925017;
	b=uqPDSuOiljDexmyGfheU8xxJj8noI3IbTCu3Hd4pmucAANoRs9M3BH27Z7wo/6ULrAza
	 ZyxXotohDR8fXef9yRlA+eB6HtWafGjEQEKlpX6HIW9OcavX7yN7IHH0FimpXWlK4WI9M
	 b+v2OIx+nDfmvyxNDXUv2SVSp0cPSPzHSsxJB9CM7JYeNA8Y/KZk0iIq4zYPs0nI9CbE3
	 wGv2XhZnxBjr8aitvpU6+o2E9MY5TzW3krIj2UBftE3ZYW7w1WLJlXnh4np4QavA5ryV8
	 IwWE3xJ+YkqumUQstW1pxo91COBkLEWlRUXh6IGFs5kFUJaL16MGIenejYl+te0iSIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nIl3+ZTBmWuTNVlAHNadUfeBQic6MCWYrW6NjuO/0k0=;
	b=BbN65KbMICSyvB1HDgLJg+ICgyIxaJqBxAp25bJBoKXETZFaUcfdZ4lc4tO31FZt3UOq
	 TKeQ1U0N6eblp7xx0+AVrneYp2ZLH5MVEQhdQ1KBot6ARMzkNEqiLQPk1CjsJNxseLafl
	 UrMFkPUCp86kScKY6TDN9sEWPTBqxRef2F0sTRJskCOG6r7gb3KmhJ54hO7Okdv2st0Ed
	 ZfsG8Y1KSI+vaMa1RrlpNknFkhMYRJKAXbirCL8TSzhNpVln5Jk3611Wz6ZkI+BIuHTD0
	 f08E0HyhXOdw9KFS2N9ilWIvBxrug7SaO/Ei8VxMbRYOoD5r2z9fA1TxC9xpzocFr5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="QeX/dnxq";
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B761606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B761606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QeX/dnxq
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4916bd6e3baso3898584f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925016; x=1795529816; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIl3+ZTBmWuTNVlAHNadUfeBQic6MCWYrW6NjuO/0k0=;
        b=QeX/dnxqEc6d43KFqTdsCS1WhoLlgezZSBEfKcG2LIQsVC68cUqt2AHn+gKi25tHvq
         mOhVO1IrX/jefeUYw2/kFd66WyaT/G3vltXAxnI+LQhvVoudPj7LZi4Fh/M0C/uvZv8v
         X23lcpxNncAR4NOsHHBF/C6aPdma1ynpuItVNU4ArcHXGI0QDxggiM+wxlauKNgtJDi+
         V0PXTJBdqGMjHAqlEPDF6TTXRy8RvKzJM3Wew9OYeH15hjtg/ry1vMbj/EyGVDVZhO3g
         LEkMt0gBF7nyEvP4+oEyuG3N85lASqpCdMWA7gIRWx2MifesyErezf1n4jbr5Ze3V0zT
         5pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925016; x=1795529816;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIl3+ZTBmWuTNVlAHNadUfeBQic6MCWYrW6NjuO/0k0=;
        b=nJjbuefj3VgvRIPxOSXEgyoAlCtMV0eKQ+FaiB8k7TLHF0UjCIEUyTrfWw6BgLPJM9
         rUdMHxs+GTPw39rqLWlcnsma2mbWkRjg/z6+GzH+MX+GFsu0jUx0BucQ7bz7Lf1c7k++
         FlV4DyVPlGKEaxxjJGD0oWhucgTzmmxonkgfIzFu6M+AbgLm9ktEUPJqOGQp/4YNyL9/
         ip/uWOH6nf0vvu7WxmSkfkgY6r7j8ekIULo9HX0IvKn3PRffheCA71I77C/2h99M4MoR
         RkrxbVRl2c0Oh3cGQFXG5P1PnOyAI1EJLnE9URml966leVAZIXMOD4uPrTFlaWBfrF9t
         dCvA==
X-Forwarded-Encrypted: i=1; AL+hErHk0FdCFiazPtWn0sedImwkijtux9sD6CJ04o8pUKAlpvyO2/g3y9+ZTS0neL6loRr+qp1lZ1D8HxbKjSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uVSUmyMguAPD+EIXOSnJwxFATX8ur4Q9/biRnPTsWXwYrHJXd
	YAOGQu15aDItV6oPlFohfIVXjgoEqJ3CcBvcEr0LTYYLbx2vZbWNpOVEEOPAtboMYqm6JERMG96
	d76IwwFI1bf6NRnvd5Q==
X-Received: from wrub10.prod.google.com ([2002:a5d:4d8a:0:b0:493:d140:f479])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1445:b0:48e:60ed:b012 with SMTP id ffacd0b85a97d-49c72306b93mr33480234f8f.57.1794925015465;
 Tue, 17 Nov 2026 06:16:55 -0800 (PST)
Date: Tue, 17 Nov 2026 14:16:54 +0000
In-Reply-To: <20261117001507.1611984-6-dakr@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117001507.1611984-1-dakr@kernel.org> <20261117001507.1611984-6-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117141654.2992573-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 5/5] rust: sync: condvar: add non-exclusive freezable waiting
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, boqun@kernel.org, gary@garyguo.net, 
	lyude@redhat.com, daniel.almeida@collabora.com, work@onurozkan.dev, 
	ojeda@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 01:14:46AM +0100, Danilo Krummrich wrote:
> CondVar currently registers all sleeping tasks as exclusive waiters.
> Add wait_interruptible_freezable_nonexclusive() for callers that need
> non-exclusive waits, using WaitQueue::wait_once().
> 
> Document that notify_one() and notify_sync() also wake all non-exclusive
> waiters.
> 
> This provides non-exclusive waiting support for a subsequent Binder
> conversion.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
