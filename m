Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039387;
	b=47odl/ipFFhXhDjCINR5qW36q1knEhleHKTaVtHd7DcnYCRnbJh/t9BKvqTQmXF0X8kJ
	 WpIKUsSQsELz1iL3h8xtLHxyd3yf4eCtu2Il75KuWeRnA2/Sd9W4ypbl3Kyc8Mmtd2zLS
	 v+IVIvB1JBKNxUM0nJfKysbQenwZvCWxFRuEaGmYOPOBOwETp9kJM3TOvfVaNvYg0bkbd
	 nElqIEGSiHWnhQNW5VvU+pSFvlGK2NppqcytTpuTu8WlnXMVxoDUV9LlyFjub5JEUMwXS
	 jheaZMjmmdnpGfBS4R/crrPb/MPRav0h5bVnub9phGWUUCsffsIlELXwSaoKd3mm1wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=GRZSNFEWbftVAvpLk7hELzG7uAWoQX3JdWqOw5mrmdc=;
	b=3lxJDOBaJCgZkZhBcQhJAqjVCdcF6VaFEOLBxZGnRJkq1p9hiK2ZHmMhtnYBiQSz17Cw
	 xsNAXFH9CLhtYC7aMVCUxckFD2IKeYoN7V6z7PhZDWJPSCHbX2Y9fzlgdgGGelj2GXjgp
	 1U8cqVsH1D3HuriuXDNkWpRdX05doWyobzR7gcFimdjrUBF9UiqXMi7dDB/MgWkUvaRNO
	 eVJ8StFJiYjTHg+QFblEbmb7/i6t4BHL65qzYNTYzaMSt/nnoT48/Kg8BpaIS6014SC/B
	 sZYLN4nZ2HJZQGm3KShOwBgVlpIMNy+yhkMeqvQ6mnQALjz64a0ReoOe9ArRXGOCkUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ew4KQ2CX;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7980606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 08:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7980606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ew4KQ2CX
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4902ce85f72so1458700f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 00:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794039385; x=1794644185; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRZSNFEWbftVAvpLk7hELzG7uAWoQX3JdWqOw5mrmdc=;
        b=Ew4KQ2CXWb+U8Tbqm3xs8FATOML5PvhAbx9CqsClnU4Kd+987qUpy+nrGndsrP4uxz
         EKsx3fKYQqyCGBbXQ6Z/+yHxUnj4dkY6oxAwhHOpxggPsv5ry5ObKvDUwD91/HHt12cq
         mACJRCQVv21Sm9RuoBkcjCwXx+t1oDu72DtDxFydNyXZuBfScuVrqU0TTk+WMATxP2rD
         KQRn+U3aOTddYdU7bktFx9SYHspMfsBuQbaJqjBfta2ztMh5i3jU2Qv8Skrv3ZhwdnMl
         Aep0DLA7nI5iu43q8F2QQByiuQK/wy9YTR2qjgVGKTAE94ZG2HatMc967KG2MwGXr77m
         ly2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039385; x=1794644185;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRZSNFEWbftVAvpLk7hELzG7uAWoQX3JdWqOw5mrmdc=;
        b=VgrlauKML8V8++fYLKfxIHc98GEAJZjXcxjx/649RJad5/6keNdu/L0U1qtrpY7s/J
         D+iKT1egqgwEQbUSfFkwU5fe0hHopgVb341MCjz4gik6bwV+3xYn1+q4iVWkJ3iYGBOV
         A3dRic7ZUBCe3EK2WjqmDDOeGbvYpFCqWAzFmtHz/WfQXo65JE8huBW5XjRkbtUnf8Lq
         MPTmW7i2UdF0883U0JfWFbGIcNW/MqSID+pwMvXPZF+PCPf5yZ0mSAkaLAQHddscpF+p
         HYoGrtw4PplAYuWqV4VIN1fUC5XkBYiCPyc93j48Rq6AytkPu2WYVqxBxBRRSpHA3EZ4
         8RSw==
X-Forwarded-Encrypted: i=1; AL+hErHxv0rgftqXFgzCNZ0lsWDRk8S7GwbAuK6fS3KwPQLJmPrPLiXGbIR4yAcICBmnBODVt32GIULp1oo5wms=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UIW7hnw2HkPGMDyu91WiWQo8nBg/9elshqpnD9yC/ED5qVLSo
	YMFuVW2PiH76KQUsAVbk7A66ubloSz3N3V9X7RYo3x7OQlbET/2c22XanwZJEr+uKYaT72u/j/F
	kIkNQgmv9x7RO9jHpMQ==
X-Received: from wrtp5.prod.google.com ([2002:a5d:4e05:0:b0:48c:44a2:fe52])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25eb:b0:490:421f:1555 with SMTP id ffacd0b85a97d-49275b1bc23mr8281265f8f.22.1794039384637;
 Sat, 07 Nov 2026 00:16:24 -0800 (PST)
Date: Sat, 7 Nov 2026 08:16:23 +0000
In-Reply-To: <20261107021427.2105374-8-dakr@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107021427.2105374-1-dakr@kernel.org> <20261107021427.2105374-8-dakr@kernel.org>
Message-ID: <au7eV0D_44ipe3mw@google.com>
Subject: Re: [PATCH v2 7/7] rust: drm: make Driver::File lifetime-parameterized
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, lyude@redhat.com, 
	j@jananu.net, alvin.sun@linux.dev, deborah.brouwer@collabora.com, 
	laura.nao@collabora.com, beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Nov 07, 2026 at 03:03:25AM +0100, Danilo Krummrich wrote:
> +        // Run driver destructors without `filelist_mutex`. Take each link before dropping its
> +        // allocation to avoid recursively dropping the entire chain.
> +        while let Some(mut data) = files {
> +            files = data.as_mut().project().next.take();
> +            drop(data);
> +            drm.open_count.fetch_sub(1, Release);
> +        }

Instead of transferring all the files to another linked list, how about
taking them off the file list one-by-one? If you release the mutex in
between dropping each file, then we still avoid deadlocks if the file
private data destructor takes the lock.

Alice
