Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925012;
	b=puwIAqRYGeIIv0hHG8X5Y5t6v1QtyxveN9QMJN9lMZIjPXBu+a6x42amzArIgAGOxLQ6
	 1QzeymasFc3DAjDLHxuOS901n6RqaD8usM09z25AtOl/Q4hbwqJu6bhpLAOYbJo1xFug9
	 9hTTYG48XghqSQ41ollmzrb7ePG0fao/tWh+6wvJ9CSKj6/JkaGSYwHVZUXJib7WVPS5/
	 ToQiwLFUmU3flRT6tA683n8prni1uIQgEzJX9ZLV71jrWTAW/QP7QupvObrEeEcBKGG1L
	 qIIsjb4ZuYpU+UlqAjpDgEyBqNO8cNJAC/5uUWA0EayzvvwnA+eKGOxoPchohoOOwPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8mDL3N+DirypXyizj73343YIMouI63Jigsdwggl20Xk=;
	b=V0WlQAKxERSlibGBVBFnY9V0P9OfG6cmn89biQWFbG46hXTw5CSBun5qL4LX26zuBHSh
	 dFR0s1S/MFkKPnL/rrCi9VlgfoqJtLfyDlXcXr28+lpA2+VGB3SEhgNHjFeOtT1m0Irle
	 j2z5MwtTh8AScHJoW7zoiEe9C3zzcxRS/2s01NuwsWk7Vgoh3XxdUAWma0lBZIv4r+YL4
	 wybp6y2eAIQvXYy+OCfz4nL0VYeaHj8skDjRWTAUtoiCK2NC1I1OjCTv8Pl80iLJ1d+8r
	 XF9ATTGa3/AH02a0fE18/No+SjRvQdVGwLWCNjhkm1IzurHOlJ0ZlRECIrgi0CaBDFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMY1JauI;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9791606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9791606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMY1JauI
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a204ac318aso20933135e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925010; x=1795529810; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mDL3N+DirypXyizj73343YIMouI63Jigsdwggl20Xk=;
        b=JMY1JauIRJg4BDtE7ceIsP/yqSL31cHZ23/Ik9MkGT4+n2Kw7Cpfte5uB0tyaRX37U
         qsp1cU58hQjKcCLZhOrqKaeF6Pd5DVjJVtz4leic2yneF/nwFopGakk1nE1235R2ZcyN
         6dbc/YX5XFEsQCzCWOt9fThFH6FuSo6wN5Q2p4XCIqobkIng92ewtzsxiUrLo3SVxQkn
         J5XGnM/Oh3R7HY1fs6DsX43BwVPwrwtizcTLumjZPaHLECqgAnZAlECD859fW7BvTFrd
         wFHyqjem/zC2xWWr1NAMISiD/sj8Iw/5r0ZkVdjMJg38L62DK/OHEfGiSGVlJf+TWy9f
         CX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925010; x=1795529810;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mDL3N+DirypXyizj73343YIMouI63Jigsdwggl20Xk=;
        b=SCOem8UzKIpp/iftmZzu1jnRsE9IYO4eUZFGGIEHFEBcujJoCju+ZIVMFuCUcfKYL1
         fs0HZ9PG54nWtE+GVLGennXxRqsKqO4B6SpJ3s/NbLL26kBg7uBVlZR8LZgshy8X/DtB
         Op8AdpXHMwnP/bWMHfrb9MDH3GaUCIg1dSfQv70DX+iPV+0e1Ednw0L18nuvun08p2+N
         wg4lgIKU17r+ku7mKCuiCFgeTmk1djwUarCc1TZP+pkAV05RbG+SLtq2YycPiSlSXG/O
         9aXfTyTPhiX3vBnbSrAc3IP4HeKaDby/jaudzpuRp7w+Wr4HJY1R96db8v9HxvhSOt5G
         HjgA==
X-Forwarded-Encrypted: i=1; AL+hErFtuSsfzQhYxJd76ocQmnGiyYzcUTzX+vzpg76Gyq7DNcYd5/CVOv0KxAgiVpBX2h1/ft/qe0ZvuCtyjbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7Cmc0oLCcOt+J84NUa2KRnnKXqcl7+L8w72c3DDUNxuwGIXpO
	hezNq3GC/Oa1GXONMpuzAiy+rxW2n1yLaLoDLTp6AG9vHHY4NcBkAYr5JfXzjY78ipvsoLpkLbu
	bnY1GbNFv6iCkdRQMqg==
X-Received: from wmaj16.prod.google.com ([2002:a05:600c:6c10:b0:4a2:d3e:ee4a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a302:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb7347d930mr100746285e9.9.1794925009887;
 Tue, 17 Nov 2026 06:16:49 -0800 (PST)
Date: Tue, 17 Nov 2026 14:16:48 +0000
In-Reply-To: <20261117001507.1611984-3-dakr@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117001507.1611984-1-dakr@kernel.org> <20261117001507.1611984-3-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117141649.2991892-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 2/5] rust: sync: add WaitQueue infrastructure
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

On Tue, Nov 17, 2026 at 01:14:43AM +0100, Danilo Krummrich wrote:
> Implement a wait queue wrapping the kernel's struct wait_queue_head,
> with wait_event()-style methods that take a condition closure directly.
> 
> The API mirrors the C wait_event() family:
> 
>   - wait_event()
>   - wait_event_interruptible()
>   - wait_event_timeout()
>   - wait_event_interruptible_timeout()
>   - wake_up() / wake_up_all() / wake_up_sync()
> 
> The interruptible variant returns Result<(), Interrupted>, the timeout
> variant Result<(), TimedOut>, and the combined variant Result<(),
> WaitError>. These errors map to ERESTARTSYS (signal) or ETIMEDOUT
> (timeout).
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks for addressing the feedback from v1!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
