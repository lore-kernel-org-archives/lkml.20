Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002907;
	b=AY9ErnuGD7V8E8FvZWYYu6G5zCDg/mNb7/Yy8KuqQqLHuUsEJtcAqwq8mm6lOQR+ux76
	 KQY5wFpyWT8kFknJFiAT/nOcOm7fY3DWZqVTtaEApO0jSGzdzqGObjPSovMhpNzw8UI1O
	 TgFyyRkTiYNXbN11W8aOLuK/LV44X68j3rNtmG649GguycdbusdaI8RKqiezn4zL5Pclw
	 KSl5oCthnO6WnAgvfHEpKyzPa9L6CDzKng0dtIHaG3P2pr7PZ8tx3XQZpaoI80BjY7Tm/
	 Jk2mILPNg4bVdbyLOZXKiMpn4uPRmyHbzWifOL0J34faMMnDHmsYeKkT3QyjLCAa40A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002907;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=HeN8sKTlUL/VwaqkACE76c/cgf/RcKGyONBxScYlrEc=;
	b=LiLC8pVcrCFyzPWnmcGhZNZUDGg5MeynDB6WXn1pjhYXcfqLPrQY8oBW9OjIiqI30mLm
	 iJA50SpNgNTAWRXwVnZmAPvNGk3hVOfTQyE87jOwTdeZM0bj3JNAPlMA8I9QGkvYnBc8C
	 Y/UUJbADKG5hl9aDitEOBg18au7OlIA8EAFdcb3m08T+Dc/2Zz8QN9Y4GKketwV323JxH
	 fDwRkmu10slYpMJ2xsAqfFCwVvy2HEsbJn+E3r9IHWiPbz2eKUEObSsjM8TnnrgYcDWEZ
	 bhHjzg5W3jzppodS0O5S+HTIVz9Onvk4ALkjoNHUjcPz8Rly4kXfOwSju4TlymA8PUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="UQ/DM8Yx";
	arc=none smtp.remote-ip=91.218.175.29
Received: from mta0.migadu.com (out-29.mta0.migadu.com [91.218.175.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112EF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UQ/DM8Yx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HeN8sKTlUL/VwaqkACE76c/cgf/RcKGyONBxScYlrEc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793002904; v=1; x=1793607704;
 b=UQ/DM8Yxh+CE1VqZrT8hgxcAFzevlYys88YQQqzCEG4WLep6seWzB6VSl/ax7ATSgjBLan4Q
 6S2T2KbWv0U/Sjo3XAi1yGpwHmUOxQ1KgWoZGq83/vThAyL/4KUegeAzhZuzVY0fWdkkEZpepte
 uqdPvS9mfAztQI3UCJBZCCf8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aaff8073410f0c67;
	Mon, 26 Oct 2026 08:21:44 +0000
X-Mizu-Trace-ID: aaff8073410f0c67
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8613e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:21:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxtVOpKDuqMSPrHr3I7YEE2qDYKv/LOBzOBUDlqgtxBvHhKsyRd2cVZMJ9i0hVWo1tJVGOP+F6NqrI0bZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg4+vJWhVLjH/eOdUrA8Ld0DhsntduT3oYhkh2LvSIdZFMDap/
	lTsh75K+t6AtyAZKU+VN0yd3COSpEieFJk8WSSNzcxzUM2idudvHDwVUHF4Dddz9QAxFKFezyVo
	0ZZWnem244897LXXnw8QSamVg3E/ocbdpcRQpXcQV
X-Received: by 2002:a05:6512:3091:b0:5be:4d73:e44d with SMTP id
 2adb3069b0e04-5bfb79db1f6mr139727e87.5.1793002898251; Mon, 26 Oct 2026
 01:21:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-b4-vncr-mapping-test-v3-1-7c094a00d46e@fujitsu.com>
In-Reply-To: <20261026-b4-vncr-mapping-test-v3-1-7c094a00d46e@fujitsu.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 08:21:02 +0000
X-Gmail-Original-Message-ID: <CA+EHjTy=bU1ygvgYiwKiWpxP4XTY_QEmkMgW=Bxd1pxyFZ0qdA@mail.gmail.com>
X-Gm-Features: AclHuK9mNQcdy23LyjVrKUw6ZiFaEhEa1RjPtCWEqLpOPj2wxuYrSqZs8yklhYY
Message-ID: <CA+EHjTy=bU1ygvgYiwKiWpxP4XTY_QEmkMgW=Bxd1pxyFZ0qdA@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: selftests: Test VNCR translation invalidation
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Itaru,

On Mon, 26 Oct 2026 03:10:10 +0000, Itaru Kitayama
<itaru.kitayama@fujitsu.com> wrote:
[...]

These are from v2, and I didn't retest v3 since it only makes the
changes I asked for. In cases like this, feel free to keep my tags on
the respin.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
