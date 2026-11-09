Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794229720;
	b=wBaTKU0+Du+RbqVTSAXi52/JRH8/gkPAfG5ulkxoE+O/M67q6aZZi1UZY+vLYlYQV9x1
	 ZfsMdXAfqIbia83eQyY3YS2Fjh8GpLXF7fckCwTqwOW4G1EDKeVxe5poQLCs2eatnZCms
	 Cup/Y0Rrmc2PgH8bbJveb2go8D+nLcOW93Hg+eT7IITm9acf4j7bWgvTVlwztZIHuRPfV
	 FnYtTQfRe4gRxxbQUyyRQzq8nDVMS4hQZ+JOa+6RuWaPkmNE1+0cec9pz2fbDQ5Z2V7/1
	 DJB2IWkZkn6OG+dXxwgpJRedcQyG3eY6B1G4L7Y9P3tHpUJBz0VxP2OVLr/9DGWNGNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OKEddP/ZtNdVYxAML2vua9qtIab03bP2/fkLZgAxazY=;
	b=L0N/jHJbqonccib0ki7OD52KIArp81jB5eqIWyNGmTTyZUw7siBqdolR5fExAAsGMK0h
	 Juh9lkrlcIJ9sAhf2R8LEhlHMfEKaNGgQAoNUyQOChIqPRWi0O0duXdCkj6+n53Z61luC
	 ovpIukRf8PxUTbZLYzprPzapgb8LIhvI6ww7depySsfu/pmOjcG/ZgGQf0TbJkKKGyw93
	 ew+S5Ld+M0qW8oEt9DokLEFQpBCfNB5GpwYO+LlAbfDiYGnUSwWcAGUiv0V0jzVgwUArr
	 waxRjEcmw3o4Iu2hCvIN2JJZqG030vurW+iSH7UN3KSAsG0pYBQGb19riqrtWoNi59w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p4IxYHNy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A11606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A11606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p4IxYHNy
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9d7791b00so6624765ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794229720; cv=none;
        d=google.com; s=arc-20260327;
        b=Vc9HYhz9YqmGd7i90IGME5ArQXHu/5jqMWq4bVjEkwxSf8e8fGMh+2XcmS5T1D3RIL
         rZvu86VFzD0CBkdf8co64g3jL2OSy938WxCVB5YmLE6P+2YdBkKYqlNwsDMDZAmK/8j3
         b4R+SukVBGrPutMTARz+epBX709Zna5XdrdNb+nNqx697yAVD75j9+gdiV/uCjQZEGWI
         /Iz9wQxr0aeixSchocrLwPSLc1gCSJNkh8li5zBiQu6HtTeVFFZ1PSJZrk3J+frWABnO
         q7hsNW3Nf0AxZhrJ3Xyb1hTtpvM8Xtae1OZmTQk9WsEWtbsoyqAbHZQpCHM/2KgKlLpi
         hUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OKEddP/ZtNdVYxAML2vua9qtIab03bP2/fkLZgAxazY=;
        fh=0ewWX540eBzhWVur/1Xp4TiyxG3CDPUcSbmKqMXm+k0=;
        b=KAn1BijE5Prwc6+d2DCcEAoTew0XHs3cZ7PQBBI/qi2tcAh5oQyQu+7Vl5RtTbW7t1
         xUeVl5SedIAWaDLluN8TQK95/4t2rA1wdIz6SHISZABHa+bnmO5FSBZaJuhsIbnGu4KD
         N8NC3LG5W3W2WKN/ZnFFM+9AtNHp/CUEXl094hFpqsr1qxQrlqp1qawezRNN3TuzVoYy
         RmD4olDU0hrabYFe4xKspGLOAbbZ3lyh/XC4qaybMEjcPCg9Xf9ugU93jTnTaBYnEGdd
         eMUgP9WIv8J6oxyLhcm86o5cSff5kuTmpAL4/Dca76/dljWvXvqHRtAPHcbxRc14a9BX
         hMsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229720; x=1794834520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKEddP/ZtNdVYxAML2vua9qtIab03bP2/fkLZgAxazY=;
        b=p4IxYHNy9MYAUzxRA1Ns5JvNBAn14iHWe+Ip41mYevrzh+ZYDSRy8qTiTXh8gb8q59
         vwenErXfWOavA+8b9ARCNbggSoufzK4ehPa8VbSbMduMoEeJ0kwRmWsrg8KwtasfO179
         u04BRIUXeHWJqfFaysiwQESkMmNfF/8pd7pht3Lgx64AFQ9gEW+sJQnAoNN9nhApzLzZ
         nAn4MX9QJdnl2F7b5J14XfU7kHVwtknCsniT8rGJyNm7Oqk+KpRBQX5cio4HmnVfbYXc
         edPPfcGkonxoODDNFBbJ9f7TrfkHb31v4nb947/KgsVhw+nmsYf1isDDmN6+JS8rUwaJ
         oB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229720; x=1794834520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKEddP/ZtNdVYxAML2vua9qtIab03bP2/fkLZgAxazY=;
        b=YFbYVq8HtY1QAIDlEwM34yCPbPvkzk35IySNw8E4zP2lBrQiZVv/C+W9ySQXlaph+J
         7Rl+86OxnVElHGLvOJ83izXC35cOJVllF6aWDEdh2TChUFpLaJCvJPcwIXwe08GN4AU9
         bGMZx0075eUHRDXneZ+UHqkqsFXQBEvf/Ai/FXF6d82ZFy9G/pR0dj01S4gL+4JimnD2
         gZEAthARfqIdo58b4Eqva9x5FUxDQKmzLDtpa9QyGve+a/znpCxDP+h1GWjve4uGzd/l
         iJ65ThFWxKr4etOiQ+N1ZmqifRGH14Xk/6ba0RR4D71KGonB9q6MeShNcdMvrYqCRsPj
         jB2g==
X-Forwarded-Encrypted: i=1; AL+hErFdkXwbvoK4v1ArY91kxXL37m+Rlj1qG7Acgj8BkUhwkgGjrbS2FiS2Dg7BEXQQhaabKbihClVRCqZxuWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nElR0cdh/uujcjq0XMeYb2Exe9tJKVsobmuWTkheHo+y1vN9d
	4UouYc/STKXNMZOidV9fjF9SqJwgnfObWu+I2xLxorMUY/EWwr9+vZ8dZ2TomoLUQ0v9x5PCpTA
	ZFzBSmaUo8cFWqVjK7hs0+B34iPq5JqE=
X-Gm-Gg: AYBFou2NM/HXjex3jNzTQpMj75XSzyA9Vq6aP9iR+PaO8EnlmP+xGnhMBYTaNVsetF1
	ELXKzUAh/Ug8qiXUzAqrwKMl+CRxzHOZCIGHtaj9MJ0v/SBZkQNFepw9JgqZAedbjR1+7CMLzvR
	nUoVaZ4a47OhJW3mlqYfeQnueqWv76FkbQLnDxuTtCagMNf0S4xeKeVJSVkpEFQhCxqAkdEE3KM
	/OO2hGlLvOr7Ymj9wPEv+O1yXMOUXQBKq36TspOl9oo9v75zvxC6jZGhQqwM+OcN1f0GN7I2cBy
	COvLU4nYipPvWlIZUg9HjEjdf12JTkJnMsUeTpRdIJ6hamILAoh5OZxTmPpHqlTgjvL8IREhbvo
	5S5MmxD8Gd2+IqyGI97u9Ta2TNg3gA31zaYqlKg==
X-Received: by 2002:a17:903:3890:b0:2e9:9524:b004 with SMTP id
 d9443c01a7336-2ed83793651mr35834995ad.59.1794229719514; Mon, 09 Nov 2026
 05:08:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109125312.2208874-1-graypanda.inzag@gmail.com> <179422894695.488859.13925819352934947141@kernel.org>
In-Reply-To: <179422894695.488859.13925819352934947141@kernel.org>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Mon, 9 Nov 2026 22:08:25 +0900
X-Gm-Features: AclHuK_r-BhklqLacdFk7flA9saDqgS8hhdjYf5Wqi5mheW7AFHXSdxfF9SF8I4
Message-ID: <CAO7ntTRXoVY11BPcVD849enGM0uEiSD5mZtNr-Gc3fjpyGNW7g@mail.gmail.com>
Subject: Re: [PATCH net] igmp: use the joined device when leaving a multicast group
To: netdev-bot+sinfo@kernel.org
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This issue was initially spotted using an experimental code analysis
tool we are researching, and subsequently confirmed via manual code
inspection.

The bug and the fix were dynamically verified in a local QEMU test
environment by reproducing the condition and confirming the patch
resolves it cleanly. I will include these details in the commit
message if a v2 is needed.

Best regards,
Junyoung Jang

On Mon, Nov 9, 2026 at 9:55=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
