Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4D44503E5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390488; cv=none; b=piQKyHeax08i79LwzYSSeoCkDtU9FUwD273QCbxZIvcWmq5yNv5dgTdBq6pkSqZXXpH4yXJPW1FSDbvrOWhA2tY+h2PkS1zel6Vf4XCiykhCwrL21ALREJOZDhz4fCu2Zk4hDAgcmfEQFuqynm6OCSzKcGt2uZxu4v7osFC/fZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390488; c=relaxed/simple;
	bh=h47G/FS2Qywezd6HPXx1AIE+WjV/6RGHPrgzLnHLy9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8HNbS46g5ZJSIvcT4bymmpH+BhPdwk+ZSatNp4xIjI58iN08dpceyaSLe1iOcQy0OgPTWLp+bzlRR0AZmgG0a+1iK0qis8Tb3SzaRstqKmz89MgESZJkzJRxpLLFF6mamSsrfPnVJE32qKsxZkPd4wV3a9LaZPv309fqU9WtOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NElicHGD; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NElicHGD"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1c26d7e951so263342266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788390484; x=1788995284; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqvpYS2Oeq9tl7pX+2mTneFiCWe3j03isFhcGTo92fY=;
        b=NElicHGDfOYCUfs3lfukcONhFEZgG5WmbXUIbGdkyBIIZppRM9qPA0pNbclmaujRt5
         MZ0S/pVpc/mmXiiCdt5RND01pZ/Nbzpi3IuXfUPc4A6JKbdWIaNli5wrACTjUy5nkxGj
         Y0Lf2N10iAdIUyk3aKLHGL1tNcVU2G06YZIYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390484; x=1788995284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pqvpYS2Oeq9tl7pX+2mTneFiCWe3j03isFhcGTo92fY=;
        b=LhGNx4VtO2Q6iKLUqWnMQVqQsDSPqiKvD/OZLv2BvmUzi9SNeQTfSkES4aMFfTJLed
         twsb3RSlwqBJ9r8/wv4SYx1unDsqdlIKEV7McaIRaNFmppkKAEI7vyROfkeTBTXla0W+
         QNyRHViyz5MrHQLtxJ9W+1ARx4F25N/5IgziqkbNUVJyfKxZalIJRaDGT0B7UeZmfW0B
         dHYEmLtnS7y9+Os0PflWUE/cyeUkLxs7TxHWE/MEiD6yOMZa1CbBs3K2NT6ninBcz4h+
         BtkbNs/+ucl9C8xJNddrIqjFR1KpY1MS6dNQRLJkyWf/IAbiSjIrK3pUE3VYBNgNZqfT
         vpmw==
X-Gm-Message-State: AFuF++mq+GDHcOz38d2Y0D+q3M4yhB8HPoYPSw35n4he0rKqQ0+SkxtF
	EI9nnbbvo1Rg/f69SDCUNH4um6VFYSaqLDS2DQBQXG7qj4k2U5OIujD+yCOpgxmowDzVxKyK8FP
	3ORz0qsw=
X-Gm-Gg: AYBFou3fwCbPe++d2aDrTvekasaKCiBHb07nDiLLwUsUjVPT+rIpKIegrfhK4EaY1PD
	7tKMKAwfOE95N/Gv9eJv0RvMVA3csO56ArkyMAdGrWAbSzS1QWXuOwFrBnHxfRg9GpDokaPJ0JQ
	VMZW0hn6VSWfaqIQuAkcVjBXLugkmzY924V/um8eRpLx92VPKg0wT2XFrqik5UGbcU81g91Kvac
	STZ2qmCmPKmVzBJjqOxjidnExe9qNuPkdXKEyUG3lzRaCCbPviRB30ok30Rrhso63JZte6mtWoK
	VfzXZqPTo+OaGsZG/do1QuNElRgHjpnUuwvMr/YalLl5BZCB2byNQShybKUP9w5nd7Op2ieThKE
	SXUGI44N66oIpsvU32JuVj9VCPBIIxwjLrz6fXr92edVxjyzmVWvH+SyPNNioi15K099Oit4ysB
	TEvC2TdjNH/cWXbN0A4Y5PY0vxMq+aiH2mhKiKrWh5jLa4UYcJwjDh8+GcuQ4GoAY8vNXVCmt3A
	nKvK+opQE8qxsS6C37XsM/cr1S/ktx7rvzhRuX6BSNGizsfoLs=
X-Received: by 2002:a17:906:6a15:b0:c25:9102:fa with SMTP id a640c23a62f3a-c25d53e1682mr489958366b.8.1788390483776;
        Wed, 02 Sep 2026 16:08:03 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3eedfb1sm21392466b.8.2026.09.02.16.08.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 16:08:02 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c207cb16cf5so237613866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:08:02 -0700 (PDT)
X-Received: by 2002:a17:907:6b0a:b0:c24:469d:5653 with SMTP id
 a640c23a62f3a-c25d554a2c8mr561826366b.21.1788390482680; Wed, 02 Sep 2026
 16:08:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202609020931.48FF902461@keescook>
In-Reply-To: <202609020931.48FF902461@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Sep 2026 16:07:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=whZQzNuBZdV1b1TBxRf+asBGtvnC=Ggu755GaOg_TYXgw@mail.gmail.com>
X-Gm-Features: AcwNN1UfTwtEJ6x63KcWqd518OjHYZyYITmW_Uqo0nFAfBUk-fzKnutJadkuuuI
Message-ID: <CAHk-=whZQzNuBZdV1b1TBxRf+asBGtvnC=Ggu755GaOg_TYXgw@mail.gmail.com>
Subject: Re: [GIT PULL] hardening fix for v7.3-rc2
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 09:31, Kees Cook <kees@kernel.org> wrote:
>
> - Default randstruct off with rust for better allmodconfig coverage
>   (Mark Brown)

Should we just default randstruct off entirely?

It defaults to off for any *real* build for good reasons. I'm not
convinced it should be on for build testing either. Maybe the active
compiler bugs are gone, but this whole commit is just an example of
how RANDSTRUCT_FULL really isn't a good default - not for real life,
and not for build test coverage.

                  Linus
