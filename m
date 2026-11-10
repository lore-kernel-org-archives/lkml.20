Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794271378;
	b=cDavElj03k4iZpDsnsUO1tfsuvXPY2bo27yq5eZm/JDG+srLA1zQK7nI0DUNZaPRseGQ
	 9+wNUrbRIUtB9jM66kZ7Rn7R2t4iD5IOIw5hOZJwZAAyShuPCyhEEAcqgS4Uci91fA0+b
	 LXZaolDRDTXoqGdZTHoAZqEtOoNmJl/w/dkihXwN/oMn0INmLZDbeIa2XTcFfRgbIvt0m
	 f8Jl65gkR7WjcRV+dMZf+5ow44hmdtU9adox5E7HJP6phFO5weSzaM4vMwACUmsxAX0fw
	 TJJKAYD2s4xLxJZFVFq03nV0uvQz9rLYu1k0x5+KRJRUneKELbLXQkobSA6zRhrEYAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=QPGn/2cy7Zi3jVYB5TbulGSrRmUDAng3X7AvBZrHC8w=;
	b=uie8yOaVXXJDnKavZMIQ/jsTKMo96fP5N6B9agi3M9yxAgkwGiDIgEUVK9Hy8MntURGc
	 pU666tD9/6kKetpii6pgqskBzwi/CelhDZfa+AGzMzp2R1Hy6RSTGdCUGeupspx65eAIj
	 c80uOyer/2prG5rq1AkBo7gd9HpYDskk24Z59L6CXITyqhQfrkI6So9hV/VXfG56KBI/P
	 /psyJ2+SYewkc+7fpxgcHpCMq3iJ/IRM2wtls2iSv7PGbcKQC6qtDz/lf7kFFxfxXXRJ/
	 td8vLrfMIcK/ymEfWJFzsVVh5WhXL9ceZ8jIeUMFbnwkuS00O1AfUkkG+kGZGazbkDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H35Z2wi0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E054606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E054606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H35Z2wi0
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d581da0aaso152932166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:42:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794271377; cv=none;
        d=google.com; s=arc-20260327;
        b=cP8tO0vb/weJkQCl2Tfl94BYngiy1iQB9ohAQybeA/sl3q8vK/x7Zqe/iVNWbU8Qal
         iybXs124MAWfiPfnF7Rk3h6gQdHl+MQ2mwf8wPD4r3Whc4bElYi5cfYWjpBxZDFxbwnB
         4HJ7apDvBjQ3WOfMmo3fi8njWgUcArlJxCREaTeW1vadyMc69ACpx6yAn6TxCluGg54K
         1onpHHkeqPw4j1Uxm0dM4+IHMpCqNoplD2pya1b20nqTG78QolTqo4VUkVb6nyLNoPjC
         tZ+/pmaANf80RYEtgdozgZTbYvfrCW8TxNfWtQgFJr5/v3yvGV8rydX5WiiWel9XbsGw
         zqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QPGn/2cy7Zi3jVYB5TbulGSrRmUDAng3X7AvBZrHC8w=;
        fh=MG/JvdqU2NRQGXnvLOdjqAMNyK0zt7UnwHzKKWSw/GQ=;
        b=Kl1hTc3156H8Sr6tYFSzyU7YsEwgTgbX/odwAG3sRm4RVOBer3zFZ9g9oB3LMzuFon
         zdI2mDI9+pFpPFyn6hbnJaR5oxF1360GSRwgG4qwkWvAqqFCfUHufh7wwT7nUuoC0bmG
         dbkOHa53CEGPSl3FhGdy0ydNw0s69cVx/lY4J+hgP5P+6koxwwZJ/u+eLqlATCg7GK+r
         hKjVTKxHGDTH1zJZVb7TCxzSzmTmlccTdZyTamBsUwve1r/BfIqU2uZgF11itivC3LNS
         euIsWdUVLMAtjVR/wtQz7F/a988qInwyjjuC37Y0sRojIKh3w19tk8yKy/TyXCP5b3Rr
         XQPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794271377; x=1794876177; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPGn/2cy7Zi3jVYB5TbulGSrRmUDAng3X7AvBZrHC8w=;
        b=H35Z2wi0GAXSSTwQzZyXKJggQcNY/VUbsoffPcdsQH1+oW7XAU/kNN9vpOzQl6G60T
         En4AUb2eEP0yjc3Db/aar/j7NdtlOGly2UDVGmgvWYT0SBTIiyd0FUU9nTv8pcJl5shN
         h+0ZsSQBpOflLhDo2wrgLhz0p8HwSS+0i6kh4N5zY5qc458AIQHFX9zk/gJdAYL/9Ouz
         A6UNQq/V1dr+fcXADCRz9cCKLVH+wigmwqjJbj/mQq83j1wM7edAD6PTbda4R7fPbxkR
         6GqTNTiZI0Mk+mxY8N0P1W2Oq6AT4ErggHRYN5IBTvr4PJ912WGiiSeFejeFNHTb3isU
         r8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271377; x=1794876177;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QPGn/2cy7Zi3jVYB5TbulGSrRmUDAng3X7AvBZrHC8w=;
        b=nviTR7yD+2Lw7HOJn0BOalIPP8rc3s6MSE5h400HxqyTEdOAxLswmQrvTQsT8fZpvN
         a/J77De8NCxE4ARjbrevwLwJYr9EBLJ7VcoGl0B8RWcu17qMxBUXYQ6OwVjCwBZF8k06
         J36HhW1SGyEY2qxEB6W8LlVPelFdQ7zNGO1DAfh36xmI6fyxkSrHMCCNWc4uQql9OQzG
         6AzWMNFKQUH8eBGLIMoZJvuGi50xpj3ddKRK3mEGrehlbs4CRayy20WH2azY5KsYa0Hf
         IqTfTL1r2O3wcpAtrVgl2e+VdL92jbPo4C/M+0qOX2sOAKpEfgNFF39gUn8RjgdL6zaM
         vxyg==
X-Forwarded-Encrypted: i=1; AL+hErGYzRH2pyRfwrQzuaQJssMvboP7yaJztxWc1ztuM/ClaKr8FiARzapJxFP3nFPmb4AzpOAofz5ibIiQy+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wqjsmD5ArYdz3p1H32BA06+3P99qGvlrztrAKMaNHKwcpRFWM
	5ty8T96SYNlakys0HAi/fOgnf09DNSmlSyDiMMmSniXspQAkHsEDhdQ6Xa1Uzb1mUMJ+eylAsIA
	7cN18eR5vJotsNfI5O7JgkTyaVqOVQw==
X-Gm-Gg: AYBFou1nzlSd7nMsQxe7dnvCZClAt7dR02Ae3W7vq+QrXal0izt1qLcaO09e1I3LNJg
	mxJGK2lDY3n1EEGtdqONVQe9dLJ6Ig1gTvOiHlEFnw4oEAiR/HeIUqv+lovhdrUDCzB4gkTBxjb
	WnJtvSNHYnBfG5au4k1vMBCR8a9q2hAdw3lyGf2atfgTTL3d3De7KKhgcnWIu1ttPYTFvzot7aL
	MYNfhupNrOt3I8vGu+w9+bVgsfW+E+7JpMbdcT7FGwJpryPAsHeWW8ERbL9fuZHi/3AItRlcRiI
	rN83d+wSNZxZAB5r+VOU6ZoyXE/hT9WEbTipdBLtSd8vuNLwT3djJKr8cIEDv670MPxaHiZyBU4
	jfr74IM1QTCs86do9YpZJRVJpq6/uJUy3xSw44Qo1GOyLXHnhspIVzauy5xpj8H1s0YScgFgztD
	wsMKfw+Jf3H3o7eKQSqx8wH3urY5PvMi/f9DfqbefjSB7y
X-Received: by 2002:a17:906:c112:b0:c46:cc9e:a14d with SMTP id
 a640c23a62f3a-c50496b04demr61764366b.49.1794271376660; Mon, 09 Nov 2026
 16:42:56 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 10 Nov 2026 00:42:55 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Tue, 10 Nov 2026 00:42:55 +0000
X-Gm-Features: AclHuK_Nbr-5sULo1t7fMr0l5xY8-e0EITNYi6BiM4aUVU01eCDOgyeriNaujDc
Message-ID: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
Subject: [PATCH v2 0/2] dmaengine: stm32-dma3: fix provider and clock teardown
To: amelie.delaunay@foss.st.com, vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: Frank.Li@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

Split OF provider teardown from the managed clock cleanup requested in the
review of the original patch. Patch 1 unregisters the provider on removal;
patch 2 returns the active clock reference after managed DMA/IRQ teardown.

Keep the existing remove-time runtime PM disable barrier. Check initial PM
activation failure, and let devres handle later probe failures. Remove the
manual IRQ-free loop from the original submission.

No hardware runtime testing.
