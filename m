Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271849;
	b=SqqkwIzBSsntj1VoLnzZbu/wLp9j+yrmEbco43uBbrvY+We9GSlrg+jrUQin+bU8WAaI
	 lRmPFR6WdD0iHo8MkeTQ/HCbSD+XYesiHX6gT7ZKuXvVqJ39lJHr8Sv38ji/Lz0piCftB
	 UksCP0DbjqafzR/gFi05wADG3yVLSHwqz0j3Pe6wi7yi+tsqHnq1DkdwNQAlHfHA5iddT
	 wX/5CsB3VinIdikM/rdr0T68m//sXjwpaY5ZIGaUmWwil3fPYIe/W3FgOmXGKwPD7KQC9
	 W0CHQi8p6S8+egK48aIYaTzRERT+1AiTcuRMJ8cNtR+fyLzahwwVrCTgpZ7axoWLQOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9aUmjjXy2UpFvwIaZx+Kc6emVkBoaRCWFUjyBYUuXe4=;
	b=hfKPmgqOH/D3J7iZbN2R7tcRoD0SsY0dDuqxapDBr5xq5+Ne44Iz5iRM6p4i08jPD+RO
	 mL5SfSjjBATGA3IF9VTCC50oHeuV8x5CdwbugMNdNfl7pu2F17dBl9iLhundd7VSodK6d
	 tywVBgGGohfxO/zy/dPGFyjTG69+WrDFhN3XlEMa5BZLv/v7WRZkyG3VrgsOAV0dwUdgL
	 SqzGz0Ay4cFosC7rqsXgaBdZ0CXV1CBn8ElcgtcqmA83SnIcwokVTtYh96bduYslbY1ni
	 KlYMr6PIiWKjFJcOONHAKkpx6UelpwfvAkQ5lMcJBiq+Fu6Mi/9t8NuGs2xLD2UvD5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rxqy6ixe;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C11A606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C11A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rxqy6ixe
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so1271731a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794271848; x=1794876648; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aUmjjXy2UpFvwIaZx+Kc6emVkBoaRCWFUjyBYUuXe4=;
        b=Rxqy6ixetikDYH4GXTU6DVlNgIzULph56hr/ylPgKBEq0LAlCxBeqtn3zqJLm8xcn9
         /8L8gEpu0FFua1AhJKLHLRbGekFetzUJMpAhLvBkyd6Io4I8yVRJ1QPbOdpOumJxKtNh
         oMHHHRmbLW+xy9nfrbL3O/Y/GIENxUCBo+qprlcK5nHvk8Mf74MAkBQAagwOLqXMK0gK
         01XQLwADmqO9ZRtOrPv4jag12vYH76y4TtBVV6TFN0ri4rMmBiFegEp+AZT1vNUQOljj
         UCk05FbvXMpWSKjhnKf5Yt/0k1VwOGa3C7NyCBNMU6nsHzQkxBdxpMV8/sXi1UpwGU7s
         PIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271848; x=1794876648;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aUmjjXy2UpFvwIaZx+Kc6emVkBoaRCWFUjyBYUuXe4=;
        b=dbKaLR4wwh10MYhQ9j/qCTKFOKiNJtOfo+agODSU8zE95oaIE/wTG5yDPNo5fcEXMb
         ZJH42iwfi7+rl1n5MethA5L6d34Kg5Rj/mDUxjJFlZl7GMbmxKrX7o0XGK8TF8zUzvxe
         0e2yLyB76mOVxvD8FTWCBEWa8oedWMdHCnrn15yMW+f6PrwrSI4EcjtK7eXNK/ivhKq/
         mQCi1CoDTcFob+/ae4htb0jDQi0L7X8BUKRcrCFygxXLIpexO7GEE/x3J8x7btpPC0B+
         jUhaZ3wDS2O7HtssfN8DIyhFaWrzKon7ZUUlv4TItN3SGFpjYD2hwdmzI5jXEziHgfSc
         xMhg==
X-Forwarded-Encrypted: i=1; AL+hErEiuXn1SRybxN0Lpr1CLcOCzaVXC2JE+khZCGAd9a8/zEl+wonwDNWvGYkgkLGngppXLa2+lAF/ZP2VnGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+owNJ5dLxqQ08Gr2OrnRjfBlxpLsdE4WODCjDgDWgjD2mR+scY
	FHX6K7pN3tjGAKU912UVRJrU6DNYZZ5zwwdoFhWCsmGhOes7zQz6PAXIz5MC2XFpx0vYOTVJ9xi
	3PDirrg==
X-Received: from pjdq9.prod.google.com ([2002:a17:90a:2e09:b0:3ad:32d0:ca0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a48:b0:3ae:898e:a123
 with SMTP id 98e67ed59e1d1-3b166cd70c0mr1265220a91.14.1794271848067; Mon, 09
 Nov 2026 16:50:48 -0800 (PST)
Date: Mon, 9 Nov 2026 16:50:47 -0800
In-Reply-To: <CA+EHjTzaJx2nV_9YEExgYn7STSP1Kvhsqan8va8M7ba4WtCiqQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260922071945.693714-1-fuad.tabba@linux.dev> <20261007074037.316564-1-fuad.tabba@linux.dev>
 <CA+EHjTzaJx2nV_9YEExgYn7STSP1Kvhsqan8va8M7ba4WtCiqQ@mail.gmail.com>
Message-ID: <avJqZzKX1ZVAMGr-@seanjc-mac.roam.internal>
Subject: Re: [PATCH v2 0/2] KVM: selftests: Fix incremental build dependencies
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"Michal =?utf-8?Q?Koutn=C3=BD?=" <mkoutny@suse.com>, James Houghton <jthoughton@google.com>, Will Deacon <will@kernel.org>, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 09, 2026, Fuad Tabba wrote:
> Hi Sean, Paolo,
> 
> Another gentle ping on this series. Is there anything else you'd like
> to see before it goes in?

I'll grab the KVM change, but I would prefer the cgroup change go through the
cgroup tree, even though Michal already acked it. AFAICT there are no dependencies,
and it really has nothing to do with KVM.
