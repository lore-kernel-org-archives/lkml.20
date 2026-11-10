Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326408;
	b=GY387c7RCCG8glj2c6jglOobW88ZxydBCvVhg0jEnpOxXF2r5HABIrag/OhOzFxbkkyV
	 XxSWdwA/u+NIdrxxssedDTBYvpGShZy4eE8LUr5ZG/rdh1HgTagWdM7xLEJr69x7mbWqf
	 Mg/rdvrwQ2EkkK7EdmiV4KWkBLI65ZIjuyZCpWnOOq7CKw6xlTGfMp6D8o6bmMwkgq2Oq
	 MCTO78/c4v66JGCYylHxQXnLtTJwsDLvE4ttU2XFs8LYTzKQqMR47X2VfEMvwmahES3ae
	 WKMVvnY8YmInb9RoO5pmeqLbP1qcdgn56ciGk2SfSBtAqaWmxI+yeEJPDbHSMNg926w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yoTpJiTFsgbbX5VQxcP/im2cD0EvpkANc1CUM3UG8ys=;
	b=u2tX6mxjBvtCu6PAo9SKKDUP2WppNWTlSgnJJK58NaaK3lsuemzI0QuYpt3IVgWxarO6
	 CZtacjgP5HZ6cKMKPuORzlfwA3CU3sSlmUg2WHAwR+1QcPtHY105dlzU59b0/EL/X2UVF
	 psfWcNnibGDNXXDzfZ0vMjtl6lHmfYOSlomro0c0NMXgdQoHeobj9N7VJK8afmda0AOiA
	 9lKSwpIjf9cnVjA4ANWmCxZIq99xwrbr6+M6GYu1sDP1VPOXE2po6xk5hKaCAt/tcTb5F
	 Q1q1G+iJHqex8jrISVjYbIOTc2hmwu1eV5dIzV+viF5GVvY3w0jEI1/AWQLG4RD7p5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DvcIfwri;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAA4606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBAA4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DvcIfwri
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5059958d61so104584866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794326405; x=1794931205; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoTpJiTFsgbbX5VQxcP/im2cD0EvpkANc1CUM3UG8ys=;
        b=DvcIfwriAUUuPjSdpLzsJ8gSloH4OQBZq3Z4ASHrRxFIpkaR7z2V6SqLR3rsW6ZvRS
         1/CWidvtSOgvC6LDNmwK3jq0z7CuZ4zIXtGvTruRF3anLCo1kk0rSQw42CnHkVEcynCr
         Q7tap0STtq0u9NpBSQ7uvzg9XeN0ZFM/MjXNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326405; x=1794931205;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yoTpJiTFsgbbX5VQxcP/im2cD0EvpkANc1CUM3UG8ys=;
        b=2fcbIjmtRwQqILqKpNsgOHAvzu8hrvfnxWzb3d6M5QpV4by9js9VCEJJFhIRhpeiQc
         uq+BZXreJEMpQUWPvHcmWjwNwPN4uMeUsGwwVC5npTxyWdetjaPfgYjYqjxIx8/5Ph6i
         fbYsisQpAkfee6gOw+dSM0pPSqXArcKLefAz3cJvHphxrFDrkrOqIfSTPGj281XdHugL
         VNktn3AKGLstxz0/puWPNVnndEAi8iIA9gSNF6MJMu8U7z38G72UB90lrcXdlMvZF6Hj
         T+Da74H95oz6TgpyPk/dgeu0RtPRG5UtvdCVkNxwMeXcQANhdKTPZhvmiYi2XtGdHDP5
         /o4A==
X-Forwarded-Encrypted: i=1; AL+hErFnFBE2xKLRmmYlOkN7Km53N1RNE5TW21s86F29lOQW/J0D5ysCE8KI3R5n0lFAW9wr3t7Wt3Uix8gTg5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kDSdEgNLBg8h1EYUSO0xinpF0/gXEUlPnGQ/tfPFgo2IhDgom
	/zn2DWTOlt1NnO6aEit5wj76pgn1LTdFmIUE7680plfDoKOgHQK/UfUWgmhpaus8FbmSz2NJZpo
	awm3tjHF1lA==
X-Gm-Gg: AYBFou2PyzftrQH4FbogjqyyKPVd1BC262a1zCufp62afZv3ZD1dLBMVt9AnjPiMpB7
	LL8a7LVP27wDczv+3HjNBIxMipJ7nnj2vwolT6PHzckAt1iiSG3uZBh7lOkpH/gEq8f/znCnRWN
	FcgX6xHuyo0KuKDVERBlbqfaazVNd+WghAYFQK1gVfSVKoQEFyUzNcEqA0nByvscuZUOPBYAVwQ
	L3svzd/cDP6X6Ax0MP3q61o1hRFqVHogwdzzJS9xiR9nJewtwtI5iBbqQ1/Pzw4+7Ai945nsZLB
	uUbWtjcPZBZS/5rOgzobIRvOOS9CNP9qQJRXBD6i/S+WQe55BaZqqhdayrbx1Z2PLbMG0vf3Fje
	RubkzV5tLk720RMNEt1XUYiiaesQ43r9XM/FK7rqWZ6nvEIlPRUT16yUrLufjkXz1sIp5DQMrIx
	JFEwgXMwLCo6kK0EEy+L417lTSnB0leoxFeKnLO/U3Yhyf1v3ARFZ2N9+ecYW+ZIt/B1/riIDDK
	WqUOwl9lwkkJnzzo/jH/MNvbtyM1NdFS71T1XzlqGcg0FXYFqB7IyHw8E1Hkg0tbIKKMhH/RXsR
	qNT4yQM9vh/Lv436k7n9JsoqWyJ7hh0PH6KBrNHvT2bg5j8yfSgRJr3WkSRjsoJED4CYQA/jnNl
	aD+o=
X-Received: by 2002:a17:907:1688:b0:c41:4512:560d with SMTP id a640c23a62f3a-c50631d9dafmr2776866b.16.1794326405291;
        Tue, 10 Nov 2026 08:00:05 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a63f8bbsm124966266b.60.2026.11.10.08.00.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:00:04 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b58cb69927so3466313a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:00:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE4HUTSoh/nLREkMzrvauVPZ3ltfR3bs02B/SohAOyF9rZaGa3wTKimrnQ4qBEb435R9kTSvuFZT4oJZeY=@vger.kernel.org
X-Received: by 2002:a17:907:1b16:b0:c49:b6db:1 with SMTP id
 a640c23a62f3a-c50633ba346mr907966b.12.1794326403910; Tue, 10 Nov 2026
 08:00:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110145241.536019-1-kas@kernel.org>
In-Reply-To: <20261110145241.536019-1-kas@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 10 Nov 2026 07:59:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgPq1g-kt_n4-crr0qs3rBNkat5OgLxLLeMjKirevRuSA@mail.gmail.com>
X-Gm-Features: AclHuK-OUBoi1ZcEDjO00AEWOGxItrkKuC6wgZXx5y_lLM7MJshUB6roN-XGzXI
Message-ID: <CAHk-=wgPq1g-kt_n4-crr0qs3rBNkat5OgLxLLeMjKirevRuSA@mail.gmail.com>
Subject: Re: [PATCH 0/4] splice: remove pipe buffer stealing
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amit Shah <amit@kernel.org>, Jan Kara <jack@suse.cz>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>, 
	Bernd Schubert <bschubert@ddn.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 06:52, Kiryl Shutsemau (Meta) <kas@kernel.org> wrote:
>
>  11 files changed, 26 insertions(+), 360 deletions(-)

Ack. Lovely. I'm considering just taking this as-is now, rather than
delaying it. Comments?

               Linus
