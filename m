Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529B04CA78B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158883; cv=none; b=nqKyItwtDbO9ymxpZhKqsr9iGUF/jS1G78u/zlnu2OhsMNO2FJGXXjY/SDYMzCWBIkav51a+QoVQh2Z8Eh1Iajbsxzbmt2emInKVslKoFzBhbXUcIFAd1PvqAt7FIyBTywnIkmxAjws3rQqCCXyra50FHMDscPDHxpcjqz9XYbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158883; c=relaxed/simple;
	bh=pJ6+d3a1HLi/s62noKNGIdAvZy/I9ZvUQt5ijvaKBoQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BEQcS/AjWHdqra1kMUJYxzwhYJIPxaeTa+8JJgbKW6FOhEKPh6wbmQxu5TFKh4vzfhLpZJJjodCWkayOFZ35f8jMNA0diEa08FzP9sDGHo727B3x+KXlfbcy641EsZkHmJnBMUeOXVRhgHAdMH+1VZ4NW1wWJWZ/9BZK4dPvO+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IKCZygrW; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IKCZygrW"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48dfa054f26so1122994f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158880; x=1792763680; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwy80ECHA03ZxNI6fxFklBBGHCRE1D2wF/JjDhNvW1s=;
        b=IKCZygrWBcsu688eZOBBAwgdhQzcmYidi/mvQPVTxZ6X51PbhIUoEVYkCrARG8Gr5i
         lgPPnOWVZzymp0T9dnNS202hzM1rs44dht91K2yamIrjDsJ6f6JiIA0aWs/STxFM/Oct
         0GBY8UoDD2W3I8bgfSrlF6FHuI4hsNIBY5JlE9TfWHMppMblpM5n6GGrqEt/npL1shQN
         aXf2eQNHInLJK5etPQsgvdbbSuzezyy2w+Mk56p2V5Li+ivHUuJLr0h2p39VCPpfDoK5
         zj7lohskoU+UFaw8sB1C9o5Y7JhD3OQ7iSAaPao1u1vEdBPlYhywTrGQXV02gfN4Uw56
         ydiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158880; x=1792763680;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwy80ECHA03ZxNI6fxFklBBGHCRE1D2wF/JjDhNvW1s=;
        b=0VLS5G07P5mFeW9GGMADcRJidfhuViQWFvP0HXoV5/k0zccr3hFum/QZFIGAXlvvBo
         YdZirprbglhEwDmcf+7qKXGPp0hGohg4O/ypcV0fVMZHmc4vOsmJhgfWpvi3XyZPKQLf
         yZ1uassV4+fqyBKIWLey0bvw4n/bzMW4qQM1FB9VUCn3rgTH2chpMYKm7EY0IrmkwVK6
         2Ssrb3alLTqzFXq6jUylObrpSMKMHEgo5w7U/gNX4rNoU1tAqd+PIgzWV59v2j2cT1tA
         zR+BNWj7N0jr4jwQXtimYx3h7ChHW2g2QRX0Uv93mRqGRaW9BRPgpYgzbrCXlScoHEjP
         Tu1w==
X-Forwarded-Encrypted: i=1; AKwUvByKNeCO0U6CozWW6OmpHEcb0pzDGPtO8OlhPu1e1bJ5VXLmTmNfywbL5te84Ok6gn20LmCSuSzBK4u4JAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjaPH9iQAYv5g03TgRiYet6Ww6A35kaHa8u4YcNhM9o1FJTSQN
	te8mTGrbe5x8csKHKi2UTjFHIP7KXOIkne8dJ1qiWJdFnvT5OaUVUPbPm1iZwPuyp+lTFUeUpg1
	532RZkU9jhmIn/pf3pg==
X-Received: from wmph24.prod.google.com ([2002:a05:600c:4998:b0:4a1:9c0f:883d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c049:b0:4a1:9a97:c88 with SMTP id 5b1f17b1804b1-4a19a971118mr271601125e9.5.1792158880287;
 Fri, 16 Oct 2026 06:54:40 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:33 +0000
In-Reply-To: <20260814230923.1292966-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-2-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/7] rust: drm: rename Ioctl device context to Userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, 
	deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2026 at 01:08:59AM +0200, Danilo Krummrich wrote:
> The Ioctl DeviceContext typestate represents a device that has been
> registered with userspace at some point. This context is not specific to
> ioctl dispatch; it applies equally to GEM handle callbacks, mmap,
> fdinfo, and any other operation triggered by userspace on a registered
> device.
> 
> Rename it to Userspace to accurately reflect its semantics.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
