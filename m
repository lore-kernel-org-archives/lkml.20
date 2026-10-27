Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101140;
	b=ssvpCvJJnugOR+lI6O+mNZNv1K76ePUJhrANI0XFdsufmBXPCO38pNsBCAslLcK5NBCF
	 C1IUxBr0V+lC6Q6XvxYugyWhOZ6WwkcXU2KGCGQLugiTjJklRIlRPtekG8b1pdUHToNF8
	 zbA4chvApjjXRaxGOiYM0L2/YeuFQZjBJI5pHz83GcF584+Soc7IHBy+5laOs7DsjZXb0
	 riYe/Uw2J21/37a5BZZ7sLjv6neYo6ftwy/lqk9b/0E0ASiQ6BQKVtDMv21nZNyi7R6O9
	 xGGDgEPkZkL6jRFm9ki1jA+fiqDgjmixfPzhI9a6nzT5O8a7LZ8UYYOoINAxZ/bHS3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=H+Atfl0mBNQeM06asehTHilVxLKDUF0di9X4yTUCxIk=;
	b=s9zC0Ppq3H4NPGmdhlOaIxk9oyaf0Em6yI8rhpvAuCIebtocq9XDcmjApCFEdrBGqYki
	 Ld81rHTQAnchht7AeiUsyrnjUl9w2gHIwJAlUCK7zxAVjCqCxTZ5SvNKjoqS3xSJcCU+x
	 Rh9dOUf5FtWHRVrASOlg5/cpzmcy6GZQMNTBYNSgy2L6BJffX/p4LM3UeNFg2vTy5LbHT
	 NiZ/o3HKfnVDexI6qAtOyc64IaD/Dklsif6ff5WEpI/xGkvelCkb968pXhZHWQ3U7SDl0
	 REEg0g7uZlMZZ7ueZPBJxZFGx62HVsIZmUXN4UwWcMnfUAvbfkUnBkmemqbxx8yz4vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ldntUstH;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB91606F354
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADB91606F354
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ldntUstH
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f20b304c0so383625585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793101139; x=1793705939; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H+Atfl0mBNQeM06asehTHilVxLKDUF0di9X4yTUCxIk=;
        b=ldntUstHHW+UQFXixXG083YxYgNPdE838z80gKKbqaGiCE+NyhXhow2sD/12XHMCUA
         cuCho0QrwnMN/KRv1bEpyQEUDnThPURG++B2+tnkjHd5e8UaWrAPdtI7ovC+MIWDI5Tw
         vDE4REvTeOxeo6jwPMTgYGV54dnny0j/PZUajLkrA4vrLFlEENrvLKzl4fS31DQ1deYs
         7gUoAZibQp6kCErjCUxMrYyzZSugWrCl2RQVAJoNxyXo9Ctto2SahM1kUs2kq7z31HUn
         0V+K8YSUxOZQuwSKKWwPgjA/oRlidrZAOCab3hoFw43J2AEVRkQu/6azAg9UoUS2/DPV
         PEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101139; x=1793705939;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+Atfl0mBNQeM06asehTHilVxLKDUF0di9X4yTUCxIk=;
        b=M4/czpTzIbGz/xuneVVkjY/H+BGTsoUW77BH/bx9aBajyzAkggDKu+jtZlfGWloXlJ
         gBCcbtv6xgqqDX573dvUVlXVU9gJ2DxoWeoPJaus//X2cJNpHdMahMZKBpZGRLvcuf5r
         yNsEafsLFjDlHSZx0Z8CRiT3tinf/tlQ5003cjQDosKVEdkk1HbnQHOahwAYzMM+6gw4
         Y3tZBieTnjDV7rucmlz17BupNk/9oEkIBCN5XbSaQbLsfzHda1JQzlqs+3buIdF3piol
         8M3bzGrGAHG2YShAb+8TBgSdWBoBPWFtI4Pgwo8TdnGIcsgKnWws0jjqEVdGtGiOTcKG
         j8ug==
X-Forwarded-Encrypted: i=1; AKwUvBxH7M/LXsdZ3dr3YYrAmbng3knX/GB7j+diW+rseAGJvxLyF1OrYFWq/HPQiN8Uzip42KRR+4DyMzizbjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9UzBhno6QmeEDeqp6uAqxSxkIXL370Ak9RsmqdaQ4CsJuP8sG
	CMtsjCUyxH3PzopPzozOCqyPOK6+3BfxdbSwVjcxvPgYFdx8Q7kD034q8aqV17SJhn2g1g0qjtS
	HOsKKJcU=
X-Gm-Gg: AYBFou1CAZmbiLez7gH2STiniWOVJWTHx8owT/lOZ2zZvYVSAiXAlykq4LGrvwRjQUC
	zjfA8+QL4lkkptzqjhPLVQ4kKimtBKaApgPguGWrYqBaTghfvLxbZXylvevukTtaRhX6ZwJTPLW
	Hsq55HU6gPSo9BYTL6HWsMq7bWYZDiuM2PYqEn8rnK8oakYD9Qzyic1VlfIej0ExkHI1JxUYAJq
	cb2G4N3X7414RMQEhpXbazHstpxNU6YKT6xYFF8SmcZ1HyCykKypCXXrDqeV2AkguTd1nX84dqG
	YPgMgfUqHwb4Lvd+IbF/1SGoIxayQEsp8jaPK2WJkFwtWjlh3pzL5vNilFjc9jAfr2kag6pBXqh
	M1MFcL9YwZd/oJpVjXZ8+M/BIDUtYyLw4+5BFoQcQqtgJ2tsGxprv39qDub0KR3Tq7PVCGMkV/m
	qaDVuiMmEOlGrHEi0GptVMMYaZwptUgSKtL2ZQeNAxuqbBT5zZEXeOjImoBob0H++40wA3zmc2i
	NiEBvQKj8c4b8skfchYWE7m+SQTLiLdvqe4MzJbxhZu0bIFBQpMuNqAo1HIrkQsMdJMPXmfbvDX
	Y9Sqr1k7Y3+/gD1ipnJbftGSZkEwMWQKoBov3AdH8ADZ4NIT
X-Received: by 2002:a05:620a:271d:b0:939:31b5:4e08 with SMTP id af79cd13be357-940ef6833d1mr1340746685a.0.1793101138749;
        Tue, 27 Oct 2026 04:38:58 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05b1adbsm951301585a.4.2026.10.27.04.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:38:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/4] mm: avoid losing atomic VMA flags
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Davidlohr Bueso <dave@stgolabs.net>, 
 SJ Park <sj@kernel.org>, Kees Cook <kees@kernel.org>, 
 Colin Cross <ccross@google.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <auBh08P6GPQEHPCh@gremlin>
References: <20261023-fix-vma-atomic-v1-0-8ff4fae1fc85@kernel.org>
 <179306587687.1925990.13855179558376532702.b4-reply@b4>
 <auBh08P6GPQEHPCh@gremlin>
Date: Tue, 27 Oct 2026 07:38:57 -0400
Message-Id: <179310113752.664110.17071676524925981820.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 08:34 +0000, Lorenzo Stoakes (ARM) wrote:
> On Mon, Oct 26, 2026 at 09:51:16PM -0400, Gregory Price (Meta) wrote:
> > You too get to be the unwilling participant in my schlopptesting
> > experiment - but the good news is there's no issues and you win
> > tags and free self/unit tests.
> 
> Uh oh...
> 
> >
> > Tested-by: Gregory Price (Meta) <gourry@gourry.net>
> 
> Thanks :)
> 
> >
> > Might be worth taking the VMA unit test below.
> > Selftests... maybe the non-race uffd one.
> 
> Lazy-lorenzo, but could you submit your test schloppen as a 2 patch series? I am
> behind on test-writing given the surge of fixes...

I'm collecting them for after the merge window, but it was worth getting
a visual browse :P

-- 
~Gregory

