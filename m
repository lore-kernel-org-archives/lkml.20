Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794576308;
	b=GTjkupokRis5kjuO8Qf1zfCiHv4M0o6Ky9zy1Yol/0EuZfvaR5WUjTRSalOpKWJoOIkk
	 R+rVGG+/UXJGBUlsZhLHgjnsgj+Db33NQcUG17NtHN8pvjlnQ6RrQ9j3vrpMCIMcCgkoa
	 4NZYkpuZRMwTRe96AKIHgXtZtac0N5eaZ8tRm3blIijJeUNOUA18B36mpHxlbNuOt0LAI
	 0D0UowId2aEDNqlnuZczj9SvIeKWYpMAUC15umHSg1YlAMlVBWk579dWYg/ZUiWNAdt5R
	 69Azoq9CUHxABti8KKkxRXjm/oa+vaf8thUvX0Z5G+9yietnHgUeR1j1A53JeMy2ORg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=I7/mj3A4GX0Fnjufd1AYb3hkH0efHKhQVdz09tQZfZs=;
	b=EWw8Ojhx0HlmlhpSGnBNsnhXNA3txLz8stkHAN4X8jGABwTtbowew6HzMsw87a5xtI6e
	 GgPd6kxBI2Yg/b+tn3l4457VmK8tiF2NqooQgSzWLoJdFKW0i0qmeRYk0QyE2fAHfkE/e
	 srEr5Ezv0kOtur73iXGQPkyMx95ZbYk0gGhc04tIDvuvEiu6kXDCp38QrDjYiuuH2sQ9H
	 P/mPE5mF+9VYh7n/Pqm1nyOXki28QUvG+nAPr7Pyg50TeqBFI/dZHvec+5bqg7HpbgtfN
	 AAlbnUhoWlRaMrjmAFoeEOQsxqWcuFl9KhspqhD/iZx3knyP8O5i97LgFIop49nmu+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPfUO5Uv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F52606B577
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F52606B577
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPfUO5Uv
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1239274a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794576308; cv=none;
        d=google.com; s=arc-20260327;
        b=cYAe24JlUeoYR1mjKll95Uyi220KjB5DYVJIoOnY7DA2Dn/hgszapCIEz+J7b9PL0M
         fG/9p3lL5SsM0vYvQcpnicp9grmn1uIKEkqK3o+fi27NoV3baz9CWfgoR8GpwCCI/X4A
         fLprBT9KI7d+0izur8LGpzrOMuqtSlu8wHMBHqlJPnw/7406422fq2/mJgPXf65Qv9gG
         HXlW49t6efIo/vpjzoMOHOvh3gSpInmJjPTC1TfG2j7Ond81aeZfCiTgUDYdpMS21BRE
         qx0tMSHFWQObapP3KhAfLiK+01M0r4rMovVFIrqsda+QZHafLabn2ttefBMfWOlzf3af
         xbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I7/mj3A4GX0Fnjufd1AYb3hkH0efHKhQVdz09tQZfZs=;
        fh=ZfB5GSNbSln6yGRJq7rnmn/UQTd0Oufoq0SveZ7kEbA=;
        b=MoGyvGoIuRicmDwfMQ4WtP1eJFIM6SAFSzdCRgYtHYH38AIm8XDVX6LEGTwl88tBWL
         JbkebjENfi6+JQGDBQRsm3gSz43+XuyG7U87hDxj7/mPAmJbGDpt/BBMpR/DQdMXRRJn
         +uVPu75oBk5DSlsUvQo5GWNDbQopgUY/E2Rqc1a8l2UnWmC15mwjAC1IzWMl76+SSj/d
         TDLAgWU8wbX9vqXn2XEEpiu+kH/2kor0RZeoitESLEPXK9yAElTo5l55MkXiEm0GTy1l
         dkBoPfApxHwUbXunwkRcqYw+GEb5cacBye4NldpeDgN8T3G9Q+4PSpjRBK/kBsyFLybW
         6bQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576308; x=1795181108; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I7/mj3A4GX0Fnjufd1AYb3hkH0efHKhQVdz09tQZfZs=;
        b=zPfUO5UvqcBR2FNacPMuUTq26YY2GRrlBt33eHQz1ImceJ4LHszUfOGyIjlhgGMDFt
         61Dg6G//C3CGsNm8Jwa9C5sjLsY9gCBJi5jtHBTSMTuKLsRD7igxfV/F7lUJB5JLMbg+
         RcFGqK2A685ZGpZtAjqSMiWTf3S9VTCBJ/b/Mek61mqMh7gz8piorIiTUC7EBdlDlTqk
         gXt9p4RrIUpyleZxfwzjxNOL7B4jOj5ufcISHVmIifrTZ9SrSI+r8NoPs9re0uabg25m
         7xpt8j3uzsTU7fNSm1OPj0u1UacP5ZxKXh00fPThuzwyvfsLCQcSKVJ8n7EO4HMM4yxi
         QIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576308; x=1795181108;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I7/mj3A4GX0Fnjufd1AYb3hkH0efHKhQVdz09tQZfZs=;
        b=WAbbof+kkVHLH6iGpOTsRf3RQ3xdgAAhvsgrj7ZMyGW1fh/b7cPn+kPQPWSKynNzSS
         eRdP0bRDjEt6arolrIrK1E2PhBFUM2sQIt/exVEecus/pOeKIgcqbk44Eaq6QOroD5Rm
         6i1jcdsOso+rA0xm1WgYs4cfBGgGMrQm7t7Ciu3KVdsGj/2Ei6cQiUX56vv7xxwknRJb
         uh41pBL2P0kRgXCjx0UTe7xGX2K3o0+ItsP7OSpfAWV03Z3RDkji07YYJwWkF2NRL9Es
         Ru3lnujc75OvrgGun89stIfWfCZr4tIIAYf2KfY3w2P75Y9i+HVdouUjvUMf7+oXtHV/
         qz5w==
X-Forwarded-Encrypted: i=1; AL+hErFQ9Pz7vR38M8vtTjlOy+Ue38UWV2fScqNohq2pNqbNJ9ulWx1RJlIL2XKRLlkR8dyxYBKLydZlg160PSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dQHcd19FvflRT7Lg55rLxUDeFofHR2hTIwE/Ppd1rSKTHm+Rh
	1tBxDgSe6a1puudFZiot2aALWCnN0X8PTV0kZjgeHj8aTndsz6G/I1Bl+XzzWLpjbFSnQ04RJjM
	KDKpDAoV8dqWtYoSvGcCZtA6Q7DTmaw==
X-Gm-Gg: AYBFou1nCDByhe/9RHsMUDKlNZd3PsRFNzds9c63JT44/zwsIv1Gdydbk0MeytM7CT9
	1WHpsLph+VGwSVYaqPOhT2t50LfLTa4q2Iw3fuUE8BwxZ4e7b1RefEOE0Wgls66mc1dNMAOfFQF
	d7yTmiqUFDxE8wZx6XjIBcFBBpC37fskp831USin9jeU6OtYyov/F481tVZa7gqndAKsf8NFu/G
	TVu+Wzz7KlaX3MTRB9rIq1I1vwtvB+Giqd4AfQoCWYJZiB4jO4SDx4X8dbb4sYELJSi0XI7IJpB
	iWkl1+U3B1YiUwJWV3GN84arJleLWEEL3VKlCPvLW0aCYwBH9vAoWqnvDjOIrAlcBTkRPTLwhXr
	6Rer26DfT4m7y6CG5WvT3aTxIjvvWCzTUySL4
X-Received: by 2002:a17:902:f60b:b0:2e9:5c29:995e with SMTP id
 d9443c01a7336-2ee0dc2bdb6mr25549575ad.41.1794576307662; Fri, 13 Nov 2026
 05:25:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sm5714-fuel-gauge-v1-0-b9d163fff6ff@gmail.com>
 <20261111-sm5714-fuel-gauge-v1-2-b9d163fff6ff@gmail.com> <20261113-fuzzy-awesome-shellfish-2d93c0@quoll>
 <CAARotke5983-NFonNAnLbpzhEU2QZ=mt9CSNi=CdBxVshcpD_A@mail.gmail.com> <b72ccd2c-d26a-4559-b09f-1a0a2207add8@kernel.org>
In-Reply-To: <b72ccd2c-d26a-4559-b09f-1a0a2207add8@kernel.org>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Fri, 13 Nov 2026 15:24:55 +0200
X-Gm-Features: AclHuK-uu1jJJ5-OWPL6fdC7q-L5bATE3bIoG-NpwgnpCOGdUy-cDFX7oyzGFms
Message-ID: <CAARotke3nDJfYEG0Qskrj0uXAXCGyTE7rq-y8mR7daPFdCZjDA@mail.gmail.com>
Subject: Re: [PATCH 2/2] power: supply: Add Silicon Mitus SM5714 fuel gauge driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

You are right, sorry. I missed the series from Nizat Mikayilli posted
on Nov 8. Please disregard this one.

I will review and test Nizat's patches on the Galaxy M52 instead.

Best regards,
Asdlerto
