Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793421655;
	b=zNe/DZIuJuKXQtmQp2yzPTIjsOGg2GS7hJlUFblk9OaAxItca0w6CYxIusoPxeudKf1E
	 iiYGSoiMjrCvlY69GX053bRRNy7o+VqLy6k9zqN+YPgH+4MAul0F7jD7QuUEOM72XqOp+
	 eOW8kT5OVoBg5d3JUTbZRW2Ma9SVx2jnYcv5NhCOhutG/7VwQDkcDtjv6+T++jl3Hehnb
	 VpHHbo9vjeDF/a3x+Aygmwa9M0wKWB3+RDUafJQKOS25SNkxkZ9lidESqEEe4lKfvEYKl
	 SDw3TZDdnOBnY2dpkNb1vhw11V8hvxsCR00kz1brcGKToYlxkJvOwByhX9dsKksbhmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793421655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Message-ID:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=mYAG5OYgNALKbmlFXyHbo1nyH/Yr5PiBp4YedVqYig0=;
	b=1Wf446GThOfJ/Qn7vV4HT6ZZwJBxah8yE0A6CUx64oFfoxku12DEuKYxDDuEqMYkhBqn
	 7+YBXgFWg8b/CZ1MUADI9BSp348ganmVz51HI0HMg+z57iX8UcYMbbjXQcVUmNTDfZMYG
	 qwEByEthEYhlforV0zM7QsT9oiCXLpIzPGmihuUVkvJVipJAoVRm/73e0IHEfP42TMX5w
	 jVee4iDut5AMy94N2yIz5Xa6e7Aike7ys5DlkBBD5DCQbISTj/4OBMcz49y92BRp4ISce
	 joqwDqzXPzyAIPJncE/m4OBFCDYLy0WWGuzH6k6anSqrLDzmiCMVp5T/eQ7qN33kW5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MuqU8ms;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B93606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MuqU8ms
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2e987949882so10673795ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793421654; x=1794026454; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYAG5OYgNALKbmlFXyHbo1nyH/Yr5PiBp4YedVqYig0=;
        b=0MuqU8msUuMjk6Fy0H6HY+5EGDhuvjm02aDxiDND72+Qypl4R8QnYelvuub7syhyh2
         asbeLd3dxjqdhkNUSJCYbwtbaw8vocshNkIQKyWCUjWAVTPP3di0gT4c4byR+RqBBJYA
         Jxcv3zPfuBcV27JDiclpuu1Per/oqw3zpat7SLV+6gCrfSkgldx7u+NdOQMBj+M/xQGs
         dQqDotJ6YqGl8D0TSEJGO1fGRX+NMvxrBQON3pYDDuRGIWvukbWnf4CKtmjBr7Ohg7De
         d74OZDQbc0Ij+AWY4CxQJJo+VJ9RoImBJraOGGtO7VWpsQUC24ESVZgRB50Uzyt85P0e
         QDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793421654; x=1794026454;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYAG5OYgNALKbmlFXyHbo1nyH/Yr5PiBp4YedVqYig0=;
        b=x9t3pGlgZJ5nyBLdr0PEiOZGBxfQCDW4O9TebU2r+C1n+wHRnavlMfSkvXJxJviJ4Y
         z4cTwYaPENqJwTi8ZigI5A2yewAF8/wr/DUwjRJ6EVdKJxasaJOGhs4JreoLfAHUNuws
         3x9V39ELJjCoEh0EhcXdlrzHlX3VZPmog3yb5yNetVHwNrRySDn/CRzrwFGI/oEY2eia
         OEoXBtldFCsQPSrTArZqVDep0I7mEnD8EvC3z6h0PPXf13hrwUfl++JDga633muTtC82
         IZZSNqlz8TnUunri6KwABb0UkblKAAB5vaHMKJjRvz7n4FT+bMcrONqOHZ8gKZg8CWH/
         /yrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDLcf57+3iWr4U6tV0CJ3MH1R4hufmdk6FRDW71AjHVxQGeFmllVpMsXWP6n9zagkZqhqOvc+GrEGRtoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIaSTENAxwhe3P12ImFAFo0b8/330Z3kFEUiICILM0Ei+F9mgF
	+bBZqFjfQAudAOTBZa5V7rmajsyUw5RZkwyHWt8drvnsCuMFuDwauDhJc2GViR1haEvEng==
X-Gm-Gg: AYBFou3xWjSztLF+grL4iNf80t5V5hdYrl1iNBzUJ9o+JZSZE8PfhHH/Sd2mfmdLzIi
	NKmzMeOefzhWf80+pIqAEtL3BG1RXo6emQSLlX10865AiIEnyEYspDntl4ubs9mz3EgHkDQT3Pu
	MfnIgRtTiPeJM+BZ2xdZH1QI9PUhU/g/5nhj0IgPgGrXjEupeS+BtDaXC0j0x/dPLk1olJdnoqE
	Ixiw3TNCW8N3vw4TfCZ4eSxvfTd+fDEZif08s0EDtZsx/I61ayZZ7pV0ZiLGgULHm8tTkJp4G2K
	io1JyFr9Pk1DwRQwzt2wW9zBIlvQzA6WxJqOwOomRwdBFBvAd4MRouNzJHiRsWillqrLCz/YY9X
	FgbB3Yey6ZFhvWZsx+IlQFd+zciqVDaS90HzJMHwsf8oCKvIhtnF9+Y9X9PcsR+C6uL72Phu29a
	vWh2/0BIKvywHSX+u2+PxLtuzM44H07XzI4Iy7/jpd6pLekERc54wFIcvOMZcH8Sy/jok6g11aG
	E0hxj9RpyY4/PdKxZSmzBu7OBij/q0ZUlwS9mnfCccIYPYqDcfK0lwWwA20pfzitJVJlOsYEvDg
	RsZk2MchJKnmlEyuHNiaQhh/aenREJ4nFDwQfPUZRYl0CGX9SG1+a43sE7mKtNb59nKHjFqXo8T
	4xz+lW8WeQUWvSdcjln8kiUhCtMddtquhMjo7R+iE+6m4iGY=
X-Received: by 2002:a17:90a:c88c:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3ae8984cf7amr3599348a91.61.1793421654153;
        Fri, 30 Oct 2026 21:40:54 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8454327esm6093012a91.4.2026.10.30.21.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:40:53 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 Shuah Khan <shuah@kernel.org>, stable@vger.kernel.org
Date: Sat, 31 Oct 2026 15:36:00 +1100
Message-ID: <179342136087.2.16978105493403840270@gmail.com>
Subject:
 Re: [RFC PATCH] selftests/damon/sysfs_memcg_path_leak: define ksft_skip
In-Reply-To: <20261030044643.157105-1-sj@kernel.org>
References: <20261030044643.157105-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi SJ,

On Thu, 29 Oct 2026 21:46:42 -0700 SJ Park wrote:

> Define the value at the beginning of the test.

Makes sense to me.

Thanks,
Aveline Noir
