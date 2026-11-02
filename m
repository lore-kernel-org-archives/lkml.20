Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638598;
	b=s2WSNtiiYeB6tvbuJIEqIcR/uR3nC+g0lkpW2SjNAr6+UUGpCo+zhmTA8huTTysPTBS8
	 G9TolskSYGLcVIDZcAxGsxgMlje8X7YhQ/V5pQKkRXrtbYMcM67fSw/R0dlZJQh+Y3ros
	 g79YsombsuNxotv/eA1Hz9kVdJ1xldGdiXYefuUSqu6sXNV/1OC2fY/qEYQjbKiRhfQB5
	 qSzHqiFsdPgskDTtF2CKU0j7jB5mgXYW6G7nXWMDyJNhYANxZtcqCn+/Gu8l4QKWmj2kr
	 yEI47nAEw8cMoxauIhoDvCWI6rwu8Wb7TJfELgsPxe2myor2z1FQRB2RXfGWHaAVQpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=fwjIWZZN+Xku/wuznq5Djc9dY6oT6GSmRAkG+xrsrHw=;
	b=4kdF2xmzG9FV7TmalothzKba2fUvaJn4UA18g0Jnjo2S6sZ1sAyOC712BDZ03DNhRzuQ
	 Gku7xcyV2KWjM+6IFxDiXANpjks6l4IEb425UXjielkfhtHnARRIDb8D2AD5NMvl46EJO
	 ykYw8PwG1cqke/ZGUQ4Scvquehx21eqE38Ob76Io6JFoUWrmI0he59wbNaed69k1f/ji9
	 Fg+VqfZ0qU7q/m4meOrtMd/LnYtEXpGJ/TcR0IJJtaOMGlzlKcSQco4tgjo3T6ZHHf1Mj
	 oPhS3uX3A9ZIVu1Y2aJPsrmznRRc7vFe1Ahfwn2SRh9Dh0lz6TklB9NWN149OAOFpJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gQPBCdN0;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D13A606A580
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D13A606A580
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gQPBCdN0
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so2160149b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638598; x=1794243398; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fwjIWZZN+Xku/wuznq5Djc9dY6oT6GSmRAkG+xrsrHw=;
        b=gQPBCdN0ky7g6NTtQ3EStf4AoqYXYe0mvkYYWBdgWkEBAAYnEd9QMLgNWRc9w4B4U0
         K3raciejRcckVb6b/RpzthiCzmLRJPgBw7TcktVk1pzWCQYoHoTFP6nE32OkMzCJ6vW/
         40PmJnMenMr3LD94LFviVg89uX0p51VSaHPXIOA9k+T7X9D+DaMg7AbPXuBp6WJDlUxx
         1YjjOmDZ9I6qjaONDe7tdvrT0hRKbXGDb+zzYzRXvjGX5swDjiMeMJULBwNkBlGdL7qi
         BHpTjztF2qgxLxOz1bO1pctvkcD/mXDaRcY9CBbEl3Kc8iSMMjDo+q7At8EfFywjycZ7
         PJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638598; x=1794243398;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwjIWZZN+Xku/wuznq5Djc9dY6oT6GSmRAkG+xrsrHw=;
        b=zBd9wsD42ASkFSiAoN1gzbpNULdMgGHojbPgkhXLZZvlFalrtIAVrPiWKrDLPL39I6
         FyJjCw9uJgDeeGEuILnhG3XYCmE2Kkv0DtUUtWRyqIsRSBOAiGE9P8D5JVAfPgcRUgj2
         vR1zWm/Uf9m1aiWeGiEg8cHmASqauym7V2OzYWeRNY06vfI++r0Ld89h5Eliu7unw+0v
         zUzKheGQaG8r9HsJyHVyy7skW5kw1A7uNkO7/gbya41qAo6z/YO3YUckhXCJtvfiaDOo
         eAe6A0XwuFy3AbGkQITMFSwJG6SHYDmPRwCMD5rU4T/fIJbQd5+yOsltNcpKDQpjLN8N
         iSMg==
X-Gm-Message-State: AFq9FYJxwp+NnwaQ0U49p5HoVnREvBECU549eZdIqsfuWyKrtMbuUhXc
	ngIdWOX3zQ0H0wsicDgMv53MZHzIbKbwhb0u775CLAYg521MmZua0VuI
X-Gm-Gg: AYBFou3hl8rq29V7dDBPa8Ie0C23xUF2+Cwdd+zLR2qUOl6MuTIXlZsWaO0w2qp30Cq
	oFdUAQmFK0IWUnrFAMsw8Y6GwLWqW2Ityl8edFTuw4RRYnIXDYE5OSvbhwsG9GVe9tc47Xnv2EB
	Peh0wBpm9HB+DyFkpHTGbHKXfBys3wZw+RfUN9NXta3FvyiWKSbOxq5VvuZWWBd1ImWQB6DmURd
	Tf1viHmbeD0cQ1RGR343zJL/TtmbgQ5t1hmjRQ0fxxb6LmSud/I8ywdVYw1D8PL6Jt/FvpOotGh
	MipxmUkCNbJrk6tlMd+W9XjM5IDLPxY0wCG0cunB7R3ir4qGrrhVyEhs5pGCGgWeWsqrGob554t
	g3m6kLdB5gx7kzk5J/dsKfRNlubbCAvjtj3SHsJhyIsZC2NiqSXYMig7/Wy5Ad2VYMlNYi7BHXG
	5PMmjVO93Mft6ogWWjF5QCjrgEbtBwm1ntim/zjQ9y+Gt8g1n4CF3cbHkAdjlb1G6mHCAlqTvY1
	NRRROAuQZSEoxMBnTP1KpSj+AkmTGDuDNDnuf8u7OVgRrM447fPmmfc1jZjX80oFZ4O1Sg6S8+4
	d9NDHCsa9J8hhcD9ov/uRKV/FRfZLerO66OKNu+qsHAczsPNOPoD5L8ZjDnq0suGtxIxVohuNz8
	nXraP0O2I9GxPHmrr4v43jM/r2SXMMjqa41PQselW8WZrK9491kPUFXRR
X-Received: by 2002:a05:6a21:b91:b0:3e2:ea7:618 with SMTP id adf61e73a8af0-3e928c5ffd7mr9018818637.18.1793638597595;
        Mon, 02 Nov 2026 08:56:37 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada6c2c28sm2229529b3a.43.2026.11.02.08.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:56:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 16:56:33 +0000
Message-Id: <DMKVTEMTLA43.8R6RXYD1UMWN@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
Subject: Re: Fixes tags need work in the bpf-next tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Eduard Zingerman" <eddyz87@gmail.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>,
 "Networking" <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <auiZYnNYLEgcR6TT@sirena.org.uk>
In-Reply-To: <auiZYnNYLEgcR6TT@sirena.org.uk>

On Mon Nov 2, 2026 at 2:08 PM UTC, Mark Brown wrote:
> In commit
>
>   b73855c31c7be ("libbpf: Enforce program limit only for loaded programs"=
)
>
> Fixes tag
>
>   Fixes: c9b2a0975c39 ("libbpf: Reject excessive program counts in genera=
ted loaders")

yeah. it's wrong, but it's too far behind to fix. We don't force push to ad=
dress such mistakes.

