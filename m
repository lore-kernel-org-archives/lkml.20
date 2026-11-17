Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925016;
	b=Wcdu+q8o0Lw4RF+V+bCxK0qdU+n0phRhAtVdm+Sz+0x4LifDRVeimp74o9GAglnO5MUm
	 xjubKTMiFuqhBtf+MH4jkpXMiJcPWLGHTvwPF1tRGT4iPxKYzyfsyxphARLV5fbH9DVqL
	 jBoYugGjpga51+h/bNjFcU8uDDYBmJzkGt74jqR3NBN9Ogqr1nC+uHF6tzT46PjInw2nj
	 VuFOprUEx2LZP3nL+nfENuDreeP3S68aVID8qk9ZaEmchf2kAmCOWALmRFD5P8RwcGTDS
	 Dn/VZnxVSyB8w/QNdyEDLO+Qlmja0hRrIcNemHroZSoQNSb3dUzt3mwfwCi01klsXog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2h1C9uj5tkQ3mEiIvTmSMJ954wLDCZQUMgzTaXjTZV8=;
	b=02ARKwdYhsZco75i7K4zcBb5fby9F+JWJBzX4vKkBI0wDTFnIlsSQWYFI5KAHM4vimEk
	 icDMYbKF3qzHjCGSfy4Blh9apzmfHfcCNthwT3yxQPFjNQl0FK8fw5aa1XqQ9oGkWCKQ8
	 E+ZlWxovS3tB9vI0bsjWlxoiPNlyC3IL+udAdzaHuUmm++sE49Qf7iqGEvUSDXzHfjyQ+
	 yq7iEfnecy8O4pIewW5uSrAOy70ckR+K05kck1AmkM00Drpv3AUFtxvQL444FA9QKPbTk
	 V98isNVqppHfC9Ykz519MEsPu9w+eqX5TBsbFdh+8kWiFWCfjZx7l0R+kZ8A2xfRQrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n2tGsW40;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D537606A8A9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D537606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n2tGsW40
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4b9fde3044dso32865405e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925014; x=1795529814; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2h1C9uj5tkQ3mEiIvTmSMJ954wLDCZQUMgzTaXjTZV8=;
        b=n2tGsW40NbEk5VZiWp6AE3NfHFtiBWa9FaDOLprd6PlkqVKHirPu6IOQsnC9euLMCz
         OdlnymHlKSg0jyaHkfhjRH6yLI1TDvkSFUL88fYP4zmU0h9sR987iDFCf41mQeWcH2Th
         mU7fTlEbLN4BALGxKDkmuEoR5UmOErhmhovs8nExws7GOCnWA7fY7spOySUyjFcBsBmp
         vTgUKdXyYKT0qNHGq7flMwxMRrC71fRecIMjRreqcBuMQGXLUjuyihIul95Cxrs905SI
         Mj9vzoSJSBZxauFx2NmGXymPAOXSgv/hKdOzPEq6zjTBiCZxbvczUtTqcITwfaBFu1Ju
         SayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925014; x=1795529814;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2h1C9uj5tkQ3mEiIvTmSMJ954wLDCZQUMgzTaXjTZV8=;
        b=X+BIIIHqw8pK+PIL06/0E2nYAn1RLOjXxMFrkTCZZM5Arub8M5dThSoJkrG5qDoG/x
         DftTKZr0v4cGIPgXHUpZeilAhhgbTs+4+96s/e0lcmcyZpnK+XQbpCaZks2yvIkkdRie
         laIHwGXqC5jc2UmTBAYpVkmQVsFhYWZXsAy9ChRP+JcEBJwhctY1E9L7YFmsANvcmv1n
         pdLO2p5TaDpPxosAFouwWBUuLSobz3hM0ZKEJg29c0oCf/GfEGt47zq2mToS/JIdJylo
         6JErBkMNJq4m4aYdwmCpo85lUAIfHR1Xn3UwvSM6MABfNH6Lv3Hqe+LZ0+gfGPwSAU4D
         Q4QA==
X-Forwarded-Encrypted: i=1; AL+hErFSa9qs1gLozvGUB0ZqDIZ40wX+bakfbZlNZFgmzmoU102Q8wnrzH3AXgDpAKz1kWSV6krM1J+/RCDNvOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I+dKGOIFV64+GgRpWZLEZX82Ba2ozNUXpJ8728wRhgBh7EpHR
	kS8tAGW3jFZwUcJstputh0Cj05Sk8U1/fGBuAIOMSLoOmrmbnRumbcr9i/0XeYDOqTMu0yeFoHo
	NntYNnadFZ5KMJvZnDw==
X-Received: from wman14.prod.google.com ([2002:a05:600c:6c4e:b0:4a1:f979:6ce2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5395:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb55a95d09mr284486225e9.15.1794925013551;
 Tue, 17 Nov 2026 06:16:53 -0800 (PST)
Date: Tue, 17 Nov 2026 14:16:52 +0000
In-Reply-To: <20261117001507.1611984-5-dakr@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117001507.1611984-1-dakr@kernel.org> <20261117001507.1611984-5-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117141652.2992350-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 4/5] rust: sync: condvar: use task::schedule_timeout()
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

On Tue, Nov 17, 2026 at 01:14:45AM +0100, Danilo Krummrich wrote:
> @@ -122,7 +121,11 @@ fn wait_internal<T: ?Sized, B: Backend>(
>      /// [`CondVar::notify_one`] or [`CondVar::notify_all`]. Note that it may also wake up
>      /// spuriously.
>      pub fn wait<T: ?Sized, B: Backend>(&self, guard: &mut Guard<'_, T, B>) {
> -        self.wait_internal(TASK_UNINTERRUPTIBLE, guard, MAX_SCHEDULE_TIMEOUT);
> +        self.wait_internal(
> +            TASK_UNINTERRUPTIBLE,
> +            guard,
> +            Delta::from_jiffies(task::MAX_SCHEDULE_TIMEOUT),
> +        );
>      }

Now that `CondVar` uses `task::schedule_timeout()`, all remaining uses of
`task::MAX_SCHEDULE_TIMEOUT` wrap it in `Delta::from_jiffies(...)`, so we
could also change `MAX_SCHEDULE_TIMEOUT` itself to `Delta<Jiffy>` (either
if you spin a v4 or as a follow-up). Either way:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
