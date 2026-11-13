Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794540355;
	b=IrwH4Ytt1jJNFAHMoHAiigfju422LFjGaab5RbgxEgiuDFVDr1HNq2QueU23N3R+C5bD
	 OJjpyt0WtvOyB8MRNjG49t8kE687r/k1pZgSamJLhyTGhQwWDcPkcpDg7Z/DqES0JKsW0
	 rcQjODdzGCLRwGb+nzin+M23+z508DdrxNv4P+7qxw5lsN9czVMc2ehM7e0T0aUFnzVga
	 F9eglqCwVPtpNFCKVhZaIFr1RjA+4vLn1evYdCkLoEfOBCHsitLYqXYXVtlO7rRZZiosc
	 2F2RpJk4ssw/mwj8rnHZdDenA8R++LnANVHMWuPpjf5JIM2ncYMS/0DDJp+uZLJ2g2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aXCJsCYj0PyBwLDRuwVNDFBGr1fh79IyzXO5yeZz6ng=;
	b=wKFZhYEzFnO3pSwhYqgq82I6obO4zgKog06T1fDkdVyyP+4NP5GhAH1IHuair6QqGVed
	 29jouAbRxhFHXfR9DvKKKqT+qqGIgjA/lQRBtuiqVYRbRCc8Kl0WL3ndCKbGY7DKzh+yI
	 wVp6smtcGpMII7L7rytI1+ULzoIpFJaztsCRa8rA3aEcJ41HIhwOZ8YqVnjl7ZVhNXUDJ
	 as5EsKweWU2ofHQvjAcTVDUP779iBypWFGNG3CCG9bVn2G4JiyzFuanBoqhC3oyPxwX09
	 cDcm9/vORhw1ap3HFtDwX6MVmugyt94AKz7lwq2YtFUL7vDSg4XbFcL/ojd0O4zS7Ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWyuZh9n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10295606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10295606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWyuZh9n
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67583c777abso544040d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:25:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794540354; cv=none;
        d=google.com; s=arc-20260327;
        b=CAyjUdjUjx223jqWSdoYLa0t2miKxVrcl8d/xWEGR14iC1vNLheLi84ACvcQztB9wg
         ftuprFu0yk34aO2VY8ON2kDtv5L9kxKS8olX1/OVs8wq4oIAuqhPX0iTzThoIN287rY0
         nrQFncOESntDGaylTGoFPieXDUpSzXy4Dd/fnhCDHQ/64BYbH8loQ+t1HGstT2Y9v8JB
         Dr0MYJKHDT4WtMrSmFFsmrRq5eSwjRVHO2is4xwo5cziPRjw1zN4Xia2VsA6rDwczO4J
         YT21BLuH3B4OhRbO/igT+Vx3P+94hANfs29kFjRNpbR0GPK2XbiRbnNoJFZeKM0g4Nkw
         bjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aXCJsCYj0PyBwLDRuwVNDFBGr1fh79IyzXO5yeZz6ng=;
        fh=TRqLEX9Foof5mCSe/LrIYTd9nM4QLOYUST1eoVjKKG4=;
        b=EVWNAlr6VYKcF2PayjzHMDXoVuzxThzy6svzs24a1Ke/JaUWNLRNPT1DZqIrzl0mey
         5htNl2uIEytRm4KETn6pTgnoR7vsYQ0C9EpbGSlbY5SryeOG7SleG9I064gDgGh07SDP
         oiE02NYEj6v4zSiQKDhHdNXzi5ocqh+B/j4uodmMbi2/1cJ4kinWuyozcpElH9NPYjjq
         KITod7oei8j8L1iSYCzp34Xg1sWeVeodpguO9FxHNQb8uItVMi0lRbJlAuY9mmbpjoaD
         Mi97UFVJCndzFrbzpUP0eJuEgEpnXCtROIomvwVCM+dQfGzwjjR9GTDBFhX3c5u1CtJS
         lZsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794540354; x=1795145154; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXCJsCYj0PyBwLDRuwVNDFBGr1fh79IyzXO5yeZz6ng=;
        b=rWyuZh9ncAL9UrhsASQ33vhsC9Ry4vF1V+wyYFaYkPdLxpSxFJT5vlO1kb2cmssnUI
         +faioBCB0OiH3o/HudNp3OTfkizChiyGZyGzBVvYLXsg22Gq4vrSVZEGAHmQH8hD4vhc
         V07kQEQPCQA9sJS5vKD+3KvPKRBDBZXDDO3bema3tcoFKeW4U2Ys7NVZ1EZZ8+tjnzIX
         4tsLv0VFJrV0XC6WtW//Uy2bVQcjI2+cASO5GvUWtpyws5pFR8KqRpiGdmVqcL1/bKIi
         olv0lPnC5BhDkUSceZxB9PL7zYP3cY1CpwmqmE230RE/mdwWfpU2tl260lHyw3yKC0wF
         p5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540354; x=1795145154;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aXCJsCYj0PyBwLDRuwVNDFBGr1fh79IyzXO5yeZz6ng=;
        b=XLrhqo3/aMwYI2rV4WwxYWaSfAM5H6M9xp9K3JbqksLsI/Fa/mOrYx/H/HpGoFQkfm
         W/qqsoQgE9+trQLPIWaZM2YmR3G2qXLpDrDugtsN2xdGz7W9Sl59PUHh9wHVCGlc1Y0r
         x3KXuMoSWKdvA5OehyIQVCrU7OQfXlQIzjKWym2KcxfOXforUhSER4ao4ds/pjT/7ROz
         DKXaEQvXd3Zg3BWxRl986ODKM4iPLQ8amoSLnRAnCHOX810XryG1QdECDrFzUc5SvzUs
         /4kJ2nrOp3tITXsTIiC2lgM8UfyqlpMGEsmXS31Rzg/iEJvwU7r8rVtdGEB5plYRZh2P
         fadQ==
X-Forwarded-Encrypted: i=1; AL+hErHyJpl3m9p/xCGoVueYGjH5Yk3x8B0fow0kMVp/IhGZzBsHXx5XDdp6XryTP4k17TG97mC+XkbXoFjFbSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yPAfh51hIFTICqEqSg3eCubG/3COIF7/9qKkYaW0v1jeiMcTu
	Es40wyHprtDlX9EsyBneqOozF2EGjL3P/OklunTV68ljvAJoil3lV+/e72EXrzroKou6+1kzCjs
	joAfIKunxHYlNWZpCus9DAoynXAodFOA=
X-Gm-Gg: AYBFou0JIW82bRL1dPRX2tBogeAmg5AWLwxiGROa+83+jP5+LUca3WMZvtb0rpymb0R
	zgvvpA2cdbHYI9rDRkMCiq2ZdJ3aZ60EGmvmZYIrOTaQ8YwTuvdKMjAwHjf8QrWHiTtqQWvLq3i
	dclf+n+xmT0QoGbWUvRQ0++8IpAF5gYPh7WM2hnPDzRbmgtaxxG590tU6cghs9Odw0C0ju27Jpp
	UBQ3rOC1LW8iWrEmedMDVBZMR2qpmrAv7q8FNa0K1CEQMoiXg7GvyuWNQgz5SSRZ7pBuoE73MKB
	NzotNtExXUFYzQnjLNHQk51G+msJJbUnCYLeZwhRcsYEQ3To+LYysCaI/+HmoDqWhpbM5pGSAB9
	Kgq+SoRX4I/rEfSb4wqdMWANVDhE7uMZSWWeKtnspPH74sQc1ZhP+W4R0iFs=
X-Received: by 2002:a05:690e:1697:b0:67a:6b2b:b851 with SMTP id
 956f58d0204a3-67c7907e144mr2968859d50.40.1794540354022; Thu, 12 Nov 2026
 19:25:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104133158.3187525-1-luolongjuna@gmail.com> <avZ20mdxRnzTPY4c@jpoimboe>
In-Reply-To: <avZ20mdxRnzTPY4c@jpoimboe>
From: Longjun Luo <luolongjuna@gmail.com>
Date: Fri, 13 Nov 2026 11:25:42 +0800
X-Gm-Features: AclHuK__CJ53_9mRKoHEMyp5nR9AtpphyE9a9Wbd0i2YCf9S8k8HQ6zn3MAuAnQ
Message-ID: <CAKL4jwXwgsjrA2d64bh1iUD6nZAwy5NoCyL2i+EEmBB=dKu2jw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] objtool/klp: DWARF-based cross-build symbol correlation
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, puranjay@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, live-patching@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Understood, I'll follow up inline on those threads directly.

I sent v2 out as a new series mainly because it covers the next layer of
the design: v1 introduced the (source, scope, name) identity, and v2
builds on that to do the actual symbol matching using checksums and
reference context.

Longjun
