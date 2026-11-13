Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613849;
	b=nFRSCR0oeEhwwOI90SRzOH1/6XenXC0s11cJkkQHViLiSyXxiIyYuQic0f3jSgxYBuUK
	 US2CozbVxSxR8Agu9+WGsJ0hbbweuxrl6jN+aBUXmPHl+exH9mj2MYKvX3/cgojdi1RNm
	 LttS6PIzsRG6BDG84dmNp4coP2q732Ydjf1A44XFD8Lr9bpoiD/fXospRbruDk7DtoBI8
	 fvhQxZTFW740XRYpvTRYgst8koykyyYmjc6dXVHMMISf42SvyHj0PT9HQUs4WUInTBCwN
	 fj6uYjcxnIDK1iO6WMFPRGhOXxHKz/FmijiYWMwgmhrPHfO4wlE7dzE7cEZch/G4j8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=aW4OUjIIQjUPFcHTtnWclyPPg4R7VFoUgK4imjGVz3A=;
	b=zGyfDcLF3iPGMjHZn92mplQdjQ6IgXQNpH4wPOz2EWuIPbhEOET8ROC8aETmVMYq+AOh
	 t5ISZ0/joffx8IUz7WCX4lrUrEVey4vG4iNo7uDXx3J00Q6Xsv8IXsPC6EDfqOsEiAMQW
	 uD49CM+RZ4sHoJSLJ/sZPaDysfgCrZezJ+eHtw2tjJjT03dKyRyGU8pLQwxLnCcp74ZKh
	 g6Ov0ugpinPen0N1kp77nwivsgquFtXLC50c9jZKWFdi/XwQ3T6AWT43WBLgdlzC601Lc
	 NrvbWwOyEhOjJb/UZEVg4Gi1TxoZ0VSpRe+B+xOO3fsKIzmRKmtj9TnY0P1XJt5NJVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2faQj2s;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F0D606A893
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F0D606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2faQj2s
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so827680a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794613848; x=1795218648; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aW4OUjIIQjUPFcHTtnWclyPPg4R7VFoUgK4imjGVz3A=;
        b=v2faQj2sHjPThklo3kvSAsdztwwUVuRSFp3BgLG0TbuqHqTjQ0SRFZfLGVnHzRdt4h
         BPFLguLiU6iNuxLrBySq2qMcoIL3vedz6F9MaXkfKvqUDFhpuaNBtgnmkHiFN/1GspGh
         umudzPDvpiOKqZHDOz3xtaZuVQOO4OQspjSacvFJFWn5Vi5TqLdJZQRqwf36D8FOzL8Z
         JKLL6pd7Z1vDlXZYPL0d4CYDZ7Ev5uVq/MEIJfj5uYrgkG1M9zvh2KIFJ04OGhAwgJJj
         vFxiuvwsWIbcMUERQhKmZu2sg78xA3dM76/kDq8MFXa0ZnoAoeGo8sosWedpCZzi4SeW
         HQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794613848; x=1795218648;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aW4OUjIIQjUPFcHTtnWclyPPg4R7VFoUgK4imjGVz3A=;
        b=PYnMnRMghMflukPW9NiD8rB139rJDG0cnedKH1p+PCYlcrYGVrHp4KhyH5wii6Usp9
         DmUvFmNqzfk8EA5rWadnZxLf+XAEiVA0vbPe2zab16Zi7wALTBjT364rdth+v+Hy6inj
         dvIJkGrvryOb87ABFbyzD7kKwtB+4TvGMLb7OdpEs6xQO5kB4ERKObsoOGQoZplDvE1D
         2iVzADrWu/EanhlmHDrNjv/cCpiF/HfsM4I9V+3wPbaNEs7DgDf8EKYaJeSqPQRJ1Sig
         KI9fQj3bYKmQrFzIDhKnu6BpDyALB/TdLdbuaUP98f8w7//9U8sySPWil+tNNmh8fLF6
         bD3A==
X-Forwarded-Encrypted: i=1; AL+hErHTU2bWPJjyXUc326/OANA2VfVufpwiZfISBxE3Lt3UvCiQxe60K86Frfu7lnwjmbLh+ieUqLv9MuoEPqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8re9yr/D9oEsDpWza7TI0IIeoZRe8ZkzNyu8zfvxViMf/Phdk4
	LbT/LEG2NjgzPZJa/nN8v9yOXTZow6pr3ww2e7VV2w7/VhuaVNjYqcCE
X-Gm-Gg: AYBFou2q16KHRrLuahJMelVBlW3mka6v13FJIdXgasGHy7Id766tBMmPysuSZKJ6p63
	Orw0bDFXwKpddZfXjWziGoQN5dUBTVk+ZbZRy3mAoTXszNJeLAdfI66811otc5d5OhjtYFhbUUc
	Gc5BHsKprx0v4CCAbB8yd19LT+ReUnL1UjW5Gg4mqTC+B1x+VbZBDGMAd1OiUcH24DkliUYJZYT
	UG+/Dk17qAHLmXZ8AEt6IeRlztGWfjsb7TJYwUxNJyoUzDJ9nuGgCi/4rLLiONyR6rgGVw2KZzg
	oMZhNqN36icypUzlsKVQrgItgdDt/oxEJ5GmQFv4PeJvQIkORMTz+c6GjA5ohDNwH0+svVdG43u
	CcjCLZL4spbeNq6ke6mmMUgzQ45EQRiiokfHkCstimKCAT5NJkWnqaY5Hr5Ifc/OjIuXnb3UJeR
	drHb1ivox2Yv7nj0ahGBdBDTMrJrjtWaP16RthVFHPzt/V049yF1z3BJ5G26CKa5GmRz/e8dx99
	JVpEu78uDfXbxglIPOtsSECsAn1O1Ro4emihcwSNMCGHvUbEf6LSXxDKiyy1ZBVrVHNUTnERN7J
	GUAyWN4l8gI3OfetmH1AhK3WzJGcmc+Ud9XCA/UCPHJ16vmqYKqj/IPg7p1G5cD93VE0dthvvkE
	odRVtRrURSeqTqG/vv2/bJWWt7cEWemm2nMc=
X-Received: by 2002:a17:90b:2f0c:b0:3b0:8947:fad2 with SMTP id 98e67ed59e1d1-3b1b0ba0a4emr3788699a91.53.1794613847830;
        Fri, 13 Nov 2026 15:50:47 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm11507001a91.1.2026.11.13.15.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 15:50:46 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 23:50:45 +0000
Message-Id: <DMUHIJ5FC8EA.2XFM7TJ6AH0YB@gmail.com>
Subject: Re: [PATCH bpf] bpf: mask speculative out-of-bounds skb helper
 loads
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <datrujillo@nvidia.com>, =?utf-8?q?Dani=C3=ABl_Trujillo_via_B4_Relay?=
 <devnull+datrujillo.nvidia.com@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "Stanislav Fomichev" <sdf@fomichev.me>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>
Cc: <bpf@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20261113-cbpf-ind-nospec-v1-bpf-v1-1-764ac4c14573@nvidia.com>
References: <20261113-cbpf-ind-nospec-v1-bpf-v1-1-764ac4c14573@nvidia.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 13, 2026 at 12:15 PM Daniël Trujillo via B4 Relay <devnull+datrujillo.nvidia.com@kernel.org> wrote:
> Mask the load address when the converted offset falls outside the
> permitted range. This removed the leakage in the described setup.
> Derive the lower bound from the network and MAC header
> positions. An out-of-bounds transient offset dereferences NULL instead
> of a potential secret.

I suspect you don't have a reproducer and it's all theoretical.
Because if you had one you would have seen that your patch does nothing.
convert_bpf_ld_abs() inlines the LD_ABS fast
path with its own bounds check.

wont-fix.

pw-bot: cr
