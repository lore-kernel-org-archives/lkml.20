Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B863BB113
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788807000; cv=pass; b=nAXrtt50xBjw+Mtxjz6dXWjXMCUQYwfxpgbY7FYCNyBUbM5wuMQ73pnKsZuY0EOtxPw31npMlJxEIZ6cNIdqXPXWHwmZx6ie3Yew5HcMxInIDx9v9iVsnlkwyKBrIODf5HHVgQxnZCUgxM908DiyW6ZeGwWRoJVf4b0NhBcfFC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788807000; c=relaxed/simple;
	bh=JxSYqjpXn9L3rh86fmrKHlYewJDED4m/ZxVyWxEHBJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaDZwZ4l/hhN4lmG1qkuexEKaDeVkwovH8xOGZ4ylHnDBvN5bt+sOoSUvnFgd9ZjflTb9QNspdZVnjgQYsqQe7ZoA/lXyQlh/I9ur4PWnOeEshPooIpsifHEepnubq82h1KbYXEpFRz+S/EbPlbJX4SqnO4IoeT1UwbBrCzTqpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8F/bT2i; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8F/bT2i"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so75065a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788806991; cv=none;
        d=google.com; s=arc-20260327;
        b=B1CfpeFGsPUPli+XauudwgX++r+hWGHwz/6Y0s90FCRtgtmOYDJFd/7900e+FQFjQ5
         qdBkzJ/XiNm3GHgSPcuCTs7f9YkXpv1EpmFlYjDKjHPZmEaCcMYUu/to1IkinJnIy5J7
         Sx6psHM8BRQNmMw4oHPTMnD2SEsvny2zfXkfXXRQkpobdkcSw9+7PiiWwCYNwO76TX18
         EdFNked0hNxeAMJAf1uPrS9YXqdcf9bTJBE6e3U3tCpyYyQrvfjdflUaGqdjmLdx/HDf
         jDIZBtbxspBMYILPkzHHnGRz5TeP4KHMBl/M7X4RQcvlQocryaJ/q09NIqkWrtbD5/4H
         FcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JxSYqjpXn9L3rh86fmrKHlYewJDED4m/ZxVyWxEHBJY=;
        fh=9ynKo671uglfFd/fr8JlH8bsiV9yIV9shujqJR14vwI=;
        b=Kh+hC2JqI889ijlILYllECjJqPlEaQxSA7k1rroLMqTmz+ZtBuH7JsGD5QYb6sI3ze
         dP4hHgCfB3gEETlnl8OJZ+pUO8XfrWxXaUao2n7T9I30ZOVMkrQMuM6n3fv3Fq8tnujK
         PbXcgLXBvEfXoh98GaKNRQ+1hRte7NZd/BvYh9vbksiw0kcq8+EhzqY6pWEgO3tVgvDs
         2IFSQ0OaayJSxOw1toDNHFj5SGoAwCj79pqz2P+7Donsh+uNx9KNT5fli1q14K9WwlUT
         9ZIF4Q3+VIANpc8euDmdI0Lm991bCT6NUbcT/73UBQm5JbHBwBTNXQHxDqjDFFuYQsLw
         V8lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788806991; x=1789411791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JxSYqjpXn9L3rh86fmrKHlYewJDED4m/ZxVyWxEHBJY=;
        b=U8F/bT2iAgatXCDaxRWJimuXZFd6qj36FZLkafX5XeNt3CraQyeg1qPgTg0ZTQWOU0
         Rd15N7i9wbKoW9DoB374WgVvFrNOQw2T9JbadeIEq7KYCP6p5zYWIlgPB/vYpQA5RMgI
         h254YQl5mtncmZzZX0a0otB0QLWIoBzrFlrA6EaJ7Dbifb5gnXk5dB1FW1407kZhKTKR
         zQ6L2EqX6o376I7wiZ+b+UdCcoa5WIknDnZvbJru/80tLeQJVOCDWnwPuswxyrqaRkvE
         YE9Ka5tNMufOwq0bJc6AZc2qK90rpY6vNOmavv5jmczUD6etIZgAP7khi4Ud6TBTyFJx
         o6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806991; x=1789411791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxSYqjpXn9L3rh86fmrKHlYewJDED4m/ZxVyWxEHBJY=;
        b=doBtPIQdQFtZ6s8A4S24BSVV9DefxmGkcNttAoOE7NTSooF3Jy1CdjGzp1uMcZbMiB
         RGJtmsGWFJmacgt8pFrY12PYsPe9Vyv3Gk1qXtgz9zoH1upgvgg9XsjGa5jbKgA+PuuM
         hR6AVV2T+mX2iP9TOHFB/gzbR0bG/jA2nIuLnqARfvpolBnQo8oPY72mie+k2NSqVF30
         yfJUncAHF8A92gGhSZAZXyO9QufDW3TOV6zlw6/SBfxLa0w/IKwxdskVCjV/cw5cFW+K
         CYvBucFHP3cuHgrkPWoCcu98OJnI9PyLxF05RQ7Xs2Od2A0foO9tmXhcbvvBPDxldPBo
         WqJg==
X-Forwarded-Encrypted: i=1; AKwUvBwuoJluLot7zo1f1kZS7iq0gAMfgA9P9GJepPfw0yg9erio+eDNxJgOOsCxeXi8TxBOtou5u0IdPKA0zhE=@vger.kernel.org
X-Gm-Message-State: AFuF++n3D+nT2pQTCvo5PwVhPBSvhNF6wF7N9JW7Fq14EaxrleEayprZ
	K9xgKbwEZ+yAzhqmXg9DjKngtBWZZNP8JvIL9gegIkV2VV0Ki+qzrt9RzBoz8BwgK0fj3MBznQg
	72DC0vpMCgiyEFPe46utL21aJlXkrwLs=
X-Gm-Gg: AYBFou1GFoguXmfFeVkfbXDMUOMaSUhaj1hexE6NA/j6csalexhfgIAxR8oBsbZVqWJ
	ECexiOIyJlAWHIpAbGpmilThlkA4CuGc65nAGGp3u37VTNU9sUgityha4GSVU1TtH0bZe+24MdI
	upSy2/XwQwj7x+uB7yw453LuDLCtCj1A1ICg+ZZSfbXxvAzPPYw+NAX6fEfIgQ/bS3E7aihucBU
	EcnU7nQmE5WBLLKPJ048LHAeMcQTm4v1kPPkHJbYDSf/hoOxiXv0c3ubfdmrKJXqFo5EY34Vtor
	LlbbzNSnJRUM53pNrDkDMtxWyVXggzxpdtAtkf1bautTnM97x1H/WKUKoLF0M012Yi98WvrS46S
	C1y2iLHZrmrLVTuj06DjT9HZKU4nAY1600mOoTxo=
X-Received: by 2002:a17:90b:5743:b0:38e:c232:9d2c with SMTP id
 98e67ed59e1d1-39b8bc9422emr2061387a91.2.1788806991520; Mon, 07 Sep 2026
 11:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907163726.17104-1-will@kernel.org> <20260907163726.17104-3-will@kernel.org>
In-Reply-To: <20260907163726.17104-3-will@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 7 Sep 2026 11:49:39 -0700
X-Gm-Features: AcwNN1UCBGzNBkKYzPqBLzfBywiT6dWM48M5nh8JX2eYcmjL_a0phc-s34IGjM8
Message-ID: <CAADnVQJN=9SMCoFyG1-hLMKyCdZ2mf0Xp63VZDNE2oddaeifFw@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] arm64: bpf: Remove big-endian support from the
 JIT compiler
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 9:37=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> Big-endian support on arm64 depends on BROKEN. In preparation for
> removing the dead code altogether, remove the big-endian-specific
> support from the arm64 BPF JIT backend.
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>

Acked-by: Alexei Starovoitov <ast@kernel.org>
