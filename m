Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756413;
	b=oO02Tejw0ft0g9KhZ2GsJSpI7DRravSukZBgfWDp34irH2NBI+62ecl8s8dBYdlvxI3H
	 1VpQAPVqF+4F8K94eHTZaX8jsV+tlMTrVQIZuX8h5iW+l8xvPHnmmbJVW+D+fMwj3wkKp
	 8IDfzVXN1He3zvxKyHJSWY6gmR4k+bKSTaGaFZWPY1NJw8XSJX0WmOPMNZ59M4qFKOF5r
	 Fp4Wv/F2WK42p6+kfqF33d07PSe94Ejqfm2SoIxrD5RJh3sGy3NbAKuW9mtj6IccU/07v
	 w/IGBVVGbIYhEUtMO+xSOTyDnmKukXRy1DZgBT9AIVCj1aEZDGeVJrRkQ/UL3tLmr5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=uLj6FN5zzpYaXQgmzegMg+GrSB746kgYZ/YLy03P7lg=;
	b=XsYVALIYrVp7qsDs6Z/z3EcT/78dI66mCHelDa6d0GhXVenGDGnimDztdQXazVT/48Za
	 h7NrAJuruB42r6P6ep2AOP2Dm3uqms/NhgTt+BYIRjlaW6AC7axZUDgOQW/DkIkHF+GNl
	 Ov7tgBnQz3EdFothzpBtst9eG0o8cJhIjgbxkNiAV3VgOhTtRri74B45zmI2s5SbwLaJo
	 7rOLVn4mD1Hn6mzkvL5bJ6iChLkTL9an/qk+n1+qhTnEvNhbrDsuklECeBegNc/hb6xbU
	 ZumU1KuZzDHqr5Mr3nczYrTRokfQ+tdpMeg3Azg5SaetCw+KyA0gXLwuFwRr3p2XOIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QWU5f+ED;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF78A606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF78A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QWU5f+ED
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a2000d5ebeso6103275e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792756411; x=1793361211; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLj6FN5zzpYaXQgmzegMg+GrSB746kgYZ/YLy03P7lg=;
        b=QWU5f+EDJNbdlgHnTd8YuzV6uiPohjbj3JxCxOniJovIm4LNH4ZNqKwgl7mbkqk2mh
         T1klAOhq1340biDup5vOzhXop9oXcydP12rLp2LHVJ/IGrpHQ2DdVZDr7YAYuixNPZdC
         Y8EyQjJmRKeIQ5vrnNFw/o/Qw1X9byv2MQkq/I/KAb81p7E8R/xgfFeIpwEglwaAAEvy
         SoCSHtGC+GoZCm8+p2EbZL101cgiFCCSpuL+1UvpH/ofXWb+4ZlY/vW+r9lIfGRJ0FSY
         OVrqyRL40+wltOuYWfP/o2Px2t4SBLk/5iMzpcw95cfYNt8rbrWgbGunEoHMecHiuNfr
         ZE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756411; x=1793361211;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLj6FN5zzpYaXQgmzegMg+GrSB746kgYZ/YLy03P7lg=;
        b=V+6LLSOQJ7p4xPFm/ukPTv7ggMW4Gn+q/H62uny+iMX4n0trS/QRKjLrTOvq8gHsKM
         mJmgP9Kkm71/4QVJSFoaFihsC0CV6Gf0SyvK77AMNWcxOE/s3MM5pIp5bhSnFZ1LMF/h
         hoIyFTTjA3HSuknDguptPs8S1tR6x5Buy2mCUyDMAdHwWSBX5u7iwG1mTPDoTL1GOP3w
         /W7zKCUPfJ95tdp0gMRFg7ZFxEub8l7B58fDREy1KdjsszKMbZ02UST7T/VeoSWf0Rn5
         M3VLJ8aK+h8VB04asF/9hJjT4jblhn5ItidXJpOcPcz6d67BrUSAtJCTHo15uRSFDrwv
         dM5w==
X-Forwarded-Encrypted: i=1; AKwUvBwybL/Wn+i9G+iyOWW4GbzJ/rTnebxjCuu2kw1/2oGe1hO/b7nTFQ2ginmLAb8bvPEqhOJpLgjEZ04GXeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0yZ3k5n2WLpBJBuM8EeNkMyJrTDgoDQOtp4SFwTnl3gfzjcYW
	x0hxlaFMyr6N4OKIk6eubYUR+23GnKWjRYFHD8nL6Jz4mkHgkh/fc+X0XKCFh6ZEmNvTGgVNdAV
	DH8PQWVqqcQCAssNZ4w==
X-Received: from wmoh19.prod.google.com ([2002:a05:600c:3153:b0:4a1:8915:6ed2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8a:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a211ee9b8amr34064815e9.12.1792756410725;
 Fri, 23 Oct 2026 04:53:30 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:53:26 +0000
In-Reply-To: <atqh41vrlC4xVtaj@um790>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn>
 <20261020-tyr-ioctls-v4-2-704de77da223@kylinos.cn> <atqh41vrlC4xVtaj@um790>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023115327.1776353-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 02/11] rust: mm: add `task_size` helper
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>, Ke Sun <sunke@kylinos.cn>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 22, 2026 at 04:53:07PM -0700, Deborah Brouwer wrote:
> On Tue, Oct 20, 2026 at 04:25:19PM +0800, Ke Sun wrote:
> > From: Alvin Sun <alvin.sun@linux.dev>
> 
> I was testing Tyr's auto allocation for the user va range,
> and was surprised to see that mm.task_size() is always returning 0.
> It seems like it should work since it uses the task_size from
> struct mm_struct, but it doesn't, at least for me. 
> 
> If you look at tyr-dev, I think it would be better to use Sami's approach:
>   428d71932b6f rust: task: add task_size()
> 
> Sami creates a task_size() method for CurrentTask which is our equivalent
> to the `current` global and then you can see that task_size becomes much
> more clearly the equivalent of "TASK_SIZE_OF" used by panthor.
> 
> This approach also correctly returns a user va range when Tyr has to
> assign it in my tests, so let's switch over.

+1 to switching to CurrentTask::task_size(&self) backed by a C helper
calling TASK_SIZE_OF(current). Please also include `<linux/mm.h>` in
`rust/helpers/task.c`, as on some architectures (e.g. riscv) `TASK_SIZE` is
defined in `<asm/pgtable.h>` rather than `<linux/sched/task.h>`.

Alice
