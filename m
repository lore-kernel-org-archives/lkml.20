Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793785627;
	b=OSJds88/4uS0+aEjJOIqE7NXj42OYcVcWa7hcmwMEiaowbOFjFvh5wUKSpNjsT1C6yMj
	 EcP1nx8TClOxSeGbuwR7QSfcVBNYCUNv6DwQIRn536Xi1P46w4/pWN8CrWaBD2l1ep64+
	 vr0r9JRAxJY+tMMidrtuws8d6862Jgad44+L04IG7HCTfi44IzKqIwHISQNNj7ER/UQXN
	 M+pNL63loqp2Sk3+tRvyFDwpjK7N+mFa0bAOv8SV7+mWTRf8kKDmvbMrfC+D3ilvLPdGv
	 ExWvjOCFXLjr3P/LX5hoAo2N6+ddKxAicqQE3swUU6UeJRzvHP6u7efLDgNOQjwESkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XN5Sh2oQBbGY7k0dXGAYdV4jnNut/n5mRreEmSnndEc=;
	b=ooWmpGv2SBKtn93uyETYsTpkRrkNRoHkOPjEW0wgP+vr6doTaUe06YwDGuUArO1ibrus
	 ugpxAfB7C0zWnBNpo5cczSf6CaPrp3IJm1UYeqW4sPimjSumgD0eyvEaJIzCYAjOjtlQl
	 eZG/jpcoHWjFwVKpuyAh3OlqYp4SAWgbdMh7EWkUce8X4VxqkzFSoz2D4nWJMsrJ8hzGM
	 SlOWAYN/PqEQqTl/xJyc5mXb7z3faRVPsYp6CIlu98hhvtNzEg4QWxJXEgZhFIJgTa3nV
	 b7eh+Zm2lHQoFCwKkujpdVa1M0HXnM+x0IxU7cEa5pBB4/7+wjig60CidGRno3p7Ydg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06508606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06508606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3acd523a802so3776001fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:46:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793785616; cv=none;
        d=google.com; s=arc-20260327;
        b=BMwmZAruDCNBk7phFbvpgabbQL+HUwTA5yQnrDXihzmgvFAv48GESx+/GJVY+CAmKh
         V39GHKotVCGiFYQx3YkSkIaKCRths6nE/XEsVaghT2HyX/QkwFCGPjL7VpBiCrWUvNql
         w705psQaZ1m0Ip9GIW+wM+Cv6BbxpS3rybDgvUxwiOoRIzPm0fHJIaFgAh0aiLx7UoID
         DCd8YBJGJ6hIYEcqhX1aX1PL9VrRQ6b6TuR/Kx7eb7aFuN+u1vjZY/3PRtuDDexuLxtJ
         Ad+qWLNXsE1bkq/53nfV0ernWF2S0WBlujO0I3em2S7TnpI363GsZgIQi7PSN9/BR+hx
         4vjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XN5Sh2oQBbGY7k0dXGAYdV4jnNut/n5mRreEmSnndEc=;
        fh=vxgvJNsDSBYjx7N6ArJLzjEjVgIKhVo4G5s36qAs8W4=;
        b=C9H9Azmonsicwe+61C3nxbqDcoISV+rB7LUt1maDQtxatubqFjBZpLO0SMoqpz6KcW
         RNUBAdq96Kcik7yVX6l0xI0blO7wH7jTzdd7I9tqTAhcFnI0Y3MmNrE9yNchj/OIvgVt
         lcBAHZaBsBzeuyC+O2Ms9K7SQyLOZwimeVx9NSEYowhbWeFKQnbATSgln9TeylZiWnYD
         dzJZzdeK7gCnZJmmzfvVnFxbckeXn+W+hGx5MtH41tTk3xa6jRzS8Vg+X7Zs78lQTuGm
         2/sHF5mhMDj9ts1Ufh6CuqVmInhZwCIhsGaJ28Ey43+qw6CWYSYwzJi6JhImcrJcn/ON
         pexw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785616; x=1794390416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XN5Sh2oQBbGY7k0dXGAYdV4jnNut/n5mRreEmSnndEc=;
        b=ueaoezkFWsaFRvCtcWwvBELUN2z1kEU6pSF31Wf0DG1JHxjJdspmttLJKxOmF3XONp
         1y1CdR4CvzVbWNHHVPkh8cPwb2I5Mm2fE6T3sekEUG0Dx6UrHPsnn3/GcpXIWt0V9WVM
         RfcOG6etdiGPzA9yW6C4MwQM8X+kb6aRo0tRP6+UVkBLFjW/MomIfju0fdu8fuBELYn7
         k7oliHAk/xRWeq6p4gHK7cMoyD9/0433dzmmPle8tH2kH/C/rLoSjDDhachl0v2EU5Ht
         nQCZbrZWmxDTmcJYGGNN/ZqeBzCzKWhHuursCmMMCsIO/AbSTND3/ouvJJLAe6A6x1QS
         wJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785616; x=1794390416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XN5Sh2oQBbGY7k0dXGAYdV4jnNut/n5mRreEmSnndEc=;
        b=f2w+wsB73JDBJJbHVarWKfDciwUL7w7qKCHC939jcuJR6VcF8GAKGd6odQDslJqSVu
         YwgvPablP1slzUC6aUAZSopzYTlvYqAY7iIkKt7U9paDM7EMsE4MehN+yQ/aXjkrC5H3
         GmM46HTRpP22YO+qsrbuC/WunYeADBMHSKjrw4ezBw7ju9s0GZrJkl4lX8ENMtosFjmF
         hwgMk+nxlOcjRXZ1RgToFCp3cFLw4OrcuEPmptlzqJOBLipAp1Qq2DNB19AxLNDeNljN
         kdVsSdNyH/vMDMH2ZPISPnwy2Ulm4rGxobAZQt3YN/Yl2Xfu2TuaelSd5T6V5y6VOtjX
         ZT6w==
X-Forwarded-Encrypted: i=1; AKwUvBxnoLSfINQmvIeQELYLbOKIH4zRLh1KtDtZ1MH85LoiUyIgZCWcmLqu6K5qykU+UY5z+qj8JHC4AqeCOPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tNZMDDT1PNr+o+2FCVwa2o6fLXGSYQRPl1n50pRsSgb3tTbnF
	2MwXEaPw4k9CefKBL/stuarZX1uVIRpQtveaYs2ATK6QpwWjt4pqaz3Nbm5ub/B1vuSPcBTmauc
	dlJlfNFhhOs7elqo97JW04I4+3zSS3ck=
X-Gm-Gg: AYBFou2s02OIxEn2sE+jM3tppKZJMztbq45GzL+zRwUTsoWnDFvDjGIvAMCqPSAilcn
	WlV7T0UUK1Z01Pia5E5yi7Ge2WZkGX0efGbpxSN7sdGlF+/f7Ijy2/MP2p8AmhLHwCL9z3mr6DT
	4e2J1jIntkR+YjWXtfd/ETvqJMEIJnl89XU6rmC6VG/2pLI4WVZf0cKQtEU8QcXSML6gFkh6M/W
	BZ345SMh2Jqz4kxIR9sKsMmyHxOThbcJdfTuR0EqtFtjebNSRkfAECpJafI7SnUrKqomWlnOBro
	bipMFXMacvp8nhz9ZQjKSOJ3zYBEEIioltvvI/VZJQRXSx7g8wItem8JYOH8cE5PqICEaAqpRrk
	pGuojn6VIk8Phs20IGDt2yabts+BQMlcJku0=
X-Received: by 2002:a05:651c:554:b0:3ab:2d74:71e with SMTP id
 38308e7fff4ca-3acb7aa68e6mr34698191fa.10.1793785615870; Wed, 04 Nov 2026
 01:46:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104013139.1341582-1-bobby.prani@gmail.com> <750560f3-4c5a-44fe-b72a-0611be383f32@kernel.org>
In-Reply-To: <750560f3-4c5a-44fe-b72a-0611be383f32@kernel.org>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Wed, 4 Nov 2026 01:46:29 -0800
X-Gm-Features: AclHuK_952V20K0MdX2zFJG6-rtCJoctiobjvK9UdyxPOe36f3zxfg36adJewT0
Message-ID: <CAJhHMCCu8ehOU37_4UpExNO3U8YPygjnht+2S+axkxTwY8bx2w@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/rmap: use release ordering for small-folio
 mapcount removal
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	Richard Cochran <richardcochran@gmail.com>, 
	"open list:MEMORY MANAGEMENT - CORE" <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:b|_)ptp(?:b|_)" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

Thank you for looking at the patch.

On Wed, Nov 4, 2026 at 1:16=E2=80=AFAM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
>
> > In an arm64 page map/unmap microbenchmark with 20,480 minor
> > faults, simulated cycles fell by 1.54%.
>
> Thanks for the patch.
>
> While I see value, I am not convinced this is the right time for this
> micro-optimization while we are busy with other things.
>
> This needs a better evaluation: 1.54% in a micro-benchmark without knowin=
g the
> stddev isn't particularly helpful.
>

This result is from a deterministic simulation, hence no stddev.

--=20
Pranith
