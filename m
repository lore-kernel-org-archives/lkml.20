Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530150;
	b=kX3J02CFllHho/yzliyAp3hyjtZrU5AjVYIE7+FiDG4u/7MdLY8/N/89PuArXPT0/kta
	 TH6p4pXMCNM/QSkiVF9jj7SpZRCoHXZOhw/CUvmAKhJnRwqcWVSZifsrqm1VR/N7gGzOq
	 3gXuzPrgfkEMnQPoxOmAuM6EU/6SvlRDApWxwfciG388+N5LnKmBdEK9mjY0jSSIDmWI4
	 gPsQaiDNdO90Z+pbEWLtnOsXvYNyZubiGhRb7RYKXP7B8djvdQ8cicF0PFOv+IyqyVkhC
	 cdAeXxsY8UBpBU6Qa1/EOha+ub/J8JzmxhmKlKnc88QqQf6oGqA/nFCQnaQODWKt9JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TLSoNOX6uS4sPZRd9R7wxC2dIndj7/ZIeTA82tCUCSE=;
	b=eruPdfTjXz9/seAOxb3I9dekD15TtfYwSf7rTpCdhQcNB70vsTtbncjP1mj+IWHCkEou
	 VAMZ/86lkLrJ5l3qmbKVWa0IwcPf3TnohgoKBf9svnOi8PxfIPDDZNX4LVYL4ZyjOwYvH
	 fYFtfin8n5pA+0ub2bsTWFrQGVA/MpQCn+KMJU4S9vf1Z92vNK0G1TAguNboVfZqS/Sv0
	 x2rMMa/i+ANUvON9wBWKbip9D7en8PZRjJMCxdKnuKWehWn2g83YCyqFzhCx+VBwNgQoM
	 kAEXeWOh7Isgsf7aXqCYSNtBQMQoWdd/Rgav0au5Un3kO82qNHp+kpIUwaCEDGq7w1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQutLn1D;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666F66070088
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 666F66070088
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQutLn1D
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4918c2d727fso146045f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530149; x=1795134949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLSoNOX6uS4sPZRd9R7wxC2dIndj7/ZIeTA82tCUCSE=;
        b=SQutLn1D1dZBxdqzOiiO6z/F1uhT800YRF+2C2mmqbLa5RFeLJJrhY16yvxKb7ShRj
         XoFDwL7Ckh2dzx1/uaoD88z16xnkf5XeUe04R6b/IyvSDjYMtyiPoeN53R4D9mhWygaw
         6i2iC7u91yhOgDm1kBBtuw4n5v8nE1NDaqHqZEi/OOKRdNzIuNUGp3ich8K/JmhnFibU
         eWYpUK9JnPl0HjVAWzQ5HnVhZ8v7/W4igGhTf4l0Nzyxqr1h2xeuT5lviEki1cjnW6aa
         SyC9q73O6hkNzWBY7sBtk0aSI8JNDE9k0iT/UL7l7Vrh/K2oA7R69Jv77qtNZ195MJZs
         rLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530149; x=1795134949;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLSoNOX6uS4sPZRd9R7wxC2dIndj7/ZIeTA82tCUCSE=;
        b=TTYkqA41iqKoUHkKambnpYSqsDx4uoEk98BbpFr9n7XVbvN2tlzGesSlhBHS9u3R1s
         xxV+FazxiIncKDXcWylSgKPUs2F8CB1ITbb2oFfXyvqI2J6dgywXdEIv7ZBfanl7glZt
         fqCmt24JUnWjRTEFa7wz21OmVMkqYmgeilINwklnBU2v0i8qvA9vJpuXkDtovq7mo68V
         /kDRG2xJaoSCq9r7ERUDQZegYVYLwjgmx0gDvlC7BMB0sxR7IizTMpKHn1qT7DHw1hAM
         vT/uhi9+zXJCheyoIVUp5R1zTI+zQ+XwgsuZIhhMHroMkWHCXWTnWHENFPqbcBmgBJqm
         5zXg==
X-Forwarded-Encrypted: i=1; AL+hErEKWFqQVIviQ4INB2QPMo06ED5JnRHxVQ+lqzTieoq9enxcuPvalPreq44FE+1iStZhNTlTaPrqkCcBAvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LzmEDGuQ0GGBvpWATWBHyZQ6fnROAlHXAFvj5rGac2gZKFyDj
	rAKo6Z7JKEFT/Qf+mEhXXp7Y18rbUIfXzutDJHnUw4EAbnBHjqHIn1ve
X-Gm-Gg: AYBFou2NUt4lhPexCdZxDKVpPwQy+Di8JjwRtxVr0+iHjs9WOw360+r6eCSSFGo08W+
	Y4s7SqD7KLUPa+y4TWjTdVGly+TE3YH+JDMFmlqtfbTM3glKzzZzLqyejJgB5YxWDQmj/F8z/h5
	k+X+Ugmb6fUnMm/MT+PFwDNPutGIIK8w/7dM8VTfIRD/2vX9hku3iOjMx0B45Y/jvosvLCmG+Nw
	zLwCIrynLqP6Frqq8aeQafXqgtTwjN54MjtzIzSvFrlJJjFffYHLWyAvCHH5lkIe9zlG4CKspa0
	QOvMukOrqdOUDMdARQwQlytfV5hR5fNBKlgGg7Vo6p1fGIThs/Lylr9kvgFLR4vCudAr0+g9Snx
	+iJfv9fEFloT7BksyOWuudR1tHvTkzAPJjJ75Il7mhskwUtAPJbwoUw2Eo6kG+3BbrBihl4cool
	bIZeiV97cjy7pV7xOfFUqkpido8bBagVQcnOt8Nn2tg/MmkvRF1fL0Bc+AORTgghnQ04xVQIIok
	fcgyfkNyzkODlP2sK0RAWLz9KauZRlscUCGtrcoqAvqUKkz+dWV6BJdmmBDCwVs+nlCHLwuuE0g
	iYsAVEHxoZWtnEhoOLdhTjWaYZ8i4ZNYq8d5ohUakEU9OyBaOMqOr66mCfMhWymdIvHwkx1QPDP
	RWpHW/i9Aj0q0zNiw8Xestykr/hglaAIuXZOy8rDsvY9ajMnCdVcaMn4kvfsaeCIOey3hOj8JM+
	QbqaYDTeWBS18fHDBG
X-Received: by 2002:a05:6000:3107:b0:490:f775:b00b with SMTP id ffacd0b85a97d-49c72e85bb3mr2535058f8f.52.1794530148832;
        Thu, 12 Nov 2026 16:35:48 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60021375sm1838831f8f.29.2026.11.12.16.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:35:48 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/24] MAINTAINERS: Consolidate ARM/ZTE ZX SOC SUPPORT with Stefan Doesinger
Date: Fri, 13 Nov 2026 00:35:47 +0000
Message-ID: <20261113003547.3661166-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <f-cR3wroQOKOK55pQOGtvQ@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-2-ghahramani.navid@gmail.com> <f-cR3wroQOKOK55pQOGtvQ@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Stefan,

Stefan Dösinger wrote:
> I am generally OK with that, at least once Navid's patches 1-6 passed review.

Thanks. I will put that change in the last patch of the base series, so
it only goes in together with the reviewed patches.

> I think it is better to keep it ad "Odd fixes" as it is a hobby project to both
> myself and Navid.

Agreed, it stays Odd fixes.

> This should go into or near the patches that add the files in question.

OK. Each patch that adds files will add its own F: lines with explicit
file names like your entry, and I will drop the patterns that match no
file.

Best regards,
Navid
