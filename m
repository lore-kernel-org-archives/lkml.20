Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766966;
	b=kIubvIgKuVj1lvqokHAXWOiZ+0mHQSOUuX4YZGR4J/ttRiL3DYfKnRNHmLrpHRk6WCEn
	 PxOFvWhOiicyLVgSbzC13ymY5ohQDWhsNRe5yL56VRqQqpFzmx8MxleK29RMrdmT9vItw
	 vh+5udX8+l97GI4t0C4z7SN4OmdDb3K59DjmX8QyYSrePOGeNOaa1m6X1FCSI62pCkioO
	 s4WhLhBBwE4eKdMq+jRLQ2n3TJEuJrenpVrdhBkiCuRSvjPaUAFCAI0RPV/liyy/HVbup
	 MPxtjz40bqRrCZGSOikoJb8b3z/k12fPBGop54ecqdLDBXndE2exVyCIPlKijnm+f2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YoT0N3seRwZx2djffCaiAALCN3DDAOTgxnkps9J0Des=;
	b=cmR6Nv/ivv1osUjssAz8gkZp0grOLIiLmI658gOmweruAsUqDbdFBIGIexUpwqkcxBrx
	 nyvI4khQMmdeF4sZdnE91DaSnOaylDoHZIeqP5BLmA0zr7yfyAwR7vFMtRFTgIeFY6aH4
	 tMqP2de8fdHNEx94m9Ohq8WK0xCGO/p/yHm1cvH4Clg3GwvhChPQSg0RaR8OUys01C4pD
	 Af+ed9ATZ5M4mnrIi9th6QiSUbWpQzaalM08iiqC30fpp/Cuc2LbH4BEx/ykgyQhL1jfQ
	 Xbwl2RfOM5/uAzvKK4CV6UfsowqdSBKB3ylvrlIwvqDLiiv0mB7Xkqk3rZP86kaMFhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HnXHksAb;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B60C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B60C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HnXHksAb
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d0so2722651fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793766963; x=1794371763; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoT0N3seRwZx2djffCaiAALCN3DDAOTgxnkps9J0Des=;
        b=HnXHksAb86Hzy/aUvVOSz0sTtTWWemAD0rms6IvK+7BwAIGsII3xX39m5aJdINumGs
         5ZF+YOpdKFecbIfLnz/mqm1KCARvFKPE8gOjBxY/YAgcD45LEyk8S++Md6P+vNIvE3QW
         bt1U8W5ZyN82VRbn/lFCoRglnmbZk2y4pW73U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793766963; x=1794371763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YoT0N3seRwZx2djffCaiAALCN3DDAOTgxnkps9J0Des=;
        b=Hgk4SrhVSy8JINVYkjkjAuQtgEHP/Bie2rKOVpSSa6zabfBsstbYEWSxl66J3dsVus
         LzvIZGmmk5HZuFjhyBA81HxICw/B33Q+EBelbYFWXTQvBuIpNijC7EeHtr+CAEAPHBqI
         I9GCZeQe03eiYJhYqaf12nhCd6WbS0HNV2ucwJ96wRLK4LHX3utaz9RfHIstd2f3l2BW
         V3awyv0W8Ds/Ll+zBZhrSKIV1GlTxUAv7n43R8kMzu9iEoLwKO6uL0TcqbNM3Sir6KZV
         NuzgwveloiXORZmeepMcmC9sMm+NPJEvSPy5R8E5mu/pOfq2+LmPctUyWvmzu+FH8MJw
         DNEw==
X-Forwarded-Encrypted: i=1; AKwUvBy4Eg+neLl+6Ey7CVblEEsbx/wZbwQITOdqMjZQbQ/R1dTsc+GOneVU23CZIJs00JF0ZfGbsYu51JhgMZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IhBTvWgDdhpHc2oxg2g1Xx948s8qlPPVXn8JUUdHD2UkdE0ph
	tlCfJqPe1TVs15ir21ANgGITdyLicp9BIhrvJtdroz7MaXuu+wG36e6xYrXnYsGjxTmmV5y2ZhS
	ZbapjE27xaw==
X-Gm-Gg: AYBFou2XYQv2P8qR7JZnnTDvsC40PhAJsCJtMqOcQcmhDdI25GXeLVm+hkxQjvds5Ny
	XFs9Zz672br3hYM7YjNjL2cQfidS6V586JC31NiRFrdOPFVKYhiNRHYxslUYddrUQ/vf3b+SkGi
	+MhPeIwXeohM5eNZIXCZPUlJWS8701g+K3cIqCjfUt9vCU4vduvFfeKEcT6PrzUIYQmgrF7sxAi
	bxvhsNlMfwupETlEQXzfi+9gQRTHzwdd3BR81Gek/YzIK0xWo93ki7EpR/PMg0P6cn90CAfAO3a
	rk57a9G9IzGU3L3u/xDZqQLZgJ5sgGgUMlG6a6eijC4+3DNsSBXIyGWejJmHLSZ4J/ZSif+bO3Q
	PAbRTWvWn5i6ix88yyNIt6uwUDq5o8c6EPLOESc3p0ePzRcuoGWBkbUURruhslbAbNbXxZ7CiAh
	yrhqeUkUeHV64wVlnI8IKW2UT7+CnRLTHxu1rq7Z6QLP38XKTF4ByDfZq6PLWbLK5Lg00Xm2E7k
	LtzskodjWWtq/zDKDL1gLnwNODFIcGySrkz4XKvxDOR1BGnrnkdAUlFfdvE6v5o+cfIaFOcphFi
	ca7eFKzqqXKZyi1EO3ZpIyPLH4oMkHYyfoKPV7hZdlztgjhbntQb3TfOBehOfd1bomgYbKamCg7
	GXA==
X-Received: by 2002:a05:6512:130c:b0:5bf:e7d5:c22e with SMTP id 2adb3069b0e04-5bfe7d5c338mr2883768e87.65.1793766963285;
        Tue, 03 Nov 2026 20:36:03 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38c26aasm202234e87.58.2026.11.03.20.36.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 20:36:03 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so315796e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:36:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw35z2dBXJG1x252e3U5+d1rEzbDglIvnnNFl4ZxQt/aijPUJ6sqhrhOkBJLLb0V6zeMC12PF1dQGe8TDA=@vger.kernel.org
X-Received: by 2002:a17:907:3e8c:b0:c31:8984:7fad with SMTP id
 a640c23a62f3a-c4ca7a4bdd3mr1249450166b.15.1793766533308; Tue, 03 Nov 2026
 20:28:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028154218.1668182-1-liam@infradead.org> <20261028154218.1668182-5-liam@infradead.org>
 <auKshDXKQXt1kvjy@gondor.apana.org.au> <auMbCuecFeRmBFSK@pc636>
 <jfvq7vkx73vzp2ukq6nwnb3v3g2ezdcyppba4oa5lpzmz6ls6t@akc46gonndgy>
 <urkgmijyytg3rrislm5fdzmfggqavzpiry23f6lpkqonvy2tqx@d56stj3eixfa>
 <auaFhOa5EBz4gJwK@gondor.apana.org.au> <xdzcyoou73blpfdlgy47i2ktrcsffnclerzojpgrxphid54gjc@nicdcvzqx447>
 <auqtTjXhD8is-y9f@gondor.apana.org.au>
In-Reply-To: <auqtTjXhD8is-y9f@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 Nov 2026 20:28:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiE0KG+jkhmJWifXuAVivtB63WCWtdEpGAex7-T0SHd2g@mail.gmail.com>
X-Gm-Features: AclHuK8Q2xxyDr0nTOpQBX0hGVCNXuqdZQKlHZIGiyhVn_ThF61kvu3f6cKlY_8
Message-ID: <CAHk-=wiE0KG+jkhmJWifXuAVivtB63WCWtdEpGAex7-T0SHd2g@mail.gmail.com>
Subject: Re: [PATCH 4/4] rhashtable: fix vmalloc() deadlock in atomic rehash
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "Liam R. Howlett (Google)" <liam@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	Uladzislau Rezki <urezki@gmail.com>, Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Graf <tgraf@suug.ch>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Chris Mason <mason@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, stable@vger.kernel.org, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 19:58, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> To recap, kvmalloc was modified in 2025 such that it can use vmalloc
> even when called with GFP_ATOMIC (commit c6307674ed82).  Unfortunately,
> it does so in a way where it has to wait for other CPUs to do certain
> work.  As a result, if you call kvmalloc with GFP_ATOMIC under an
> external lock, this easily leads to a dead-lock when other CPUs end
> up blocking on the same external lock.

Ok, so it sounds like that change was clearly complete garbage and needs fixing.

The only reason for GFP_ATOMIC is that you're in a context where you
can't block. That's the *point*. So if GFP_ATOMIC waits for something,
it's just fundamentally buggy.

Sadly, the commit you point to doesn't talk about *why* that
braindamage was done. Looking at the original thread it seems like it
was for kmsan.

I didn't actually find the kmsan use case, but I didn't search very
hard. I absolutely *DETEST* it when "debug infrastructure" causes
actual bugs and mis-designs. That's the opposite of debugging.

IOW, I guess we do have to split those allocation cases up, and we
damn well should remove GFP_ATOMIC support from vmalloc() again since
it's clearly buggered beyond belief.

              Linus
