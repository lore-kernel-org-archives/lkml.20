Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792598491;
	b=lwGFJRS6oXZokLRaByXn167mvvd7/ttVg2Hqnhe2F/y2yTYYeDIuk/xztg+uHOSoQb5P
	 tPproQkct+xBDuZgMOfkpVjmA8EmQfVSMS7b3UytBCaon9zixJxoBzCL2BBqiWKnPK9an
	 Rt1OGYffVP8io0BL7KDeqmXAYJTdHwMcSFZVAvZTQTmanScDm5uPxhdKUIM5oP3AA6Tz0
	 tWd36eG58+Hfy0j1nn/r0hgJ/F8Yri0ZbNFYX3ipr43HdQWXuE4vfejMyempsy/20IHl9
	 KpfhLYDz84nQYZKnCuL0FnsNaGIPkKGmILoSJfPNCs7sXNX3MeMKvbUqvrTeLOWCt0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BLygPznvNDCGhWPjkkO7YV+Kzr/dVFaecnXDSmhqgWM=;
	b=XKjmje6c3u3DW3tSJed71P6/38C9uOTAqUiXLz8jkwFrURo0ff4h8TD+HQFKRL4IsotD
	 c8K7B4P+/sI7lyg4mf1YJVx30IJL7f8RCWkG4GAZUG3d/ExLE2Fqa3OJj2bmK45roAFdR
	 08YDnetEsQLpQolnM8B03XI064UGfGo2v6/lwNzy34yskU6mr9iiSPWdCytyP/rjrHzce
	 EOXYGfjET7+K9egQAJq+vALBvPzOoorYUqk33ZTXEJb3yAPtnaKIG/L7OMS0DVHHXGfjy
	 rdyqb/fPWT7bJYaPVL95alcWnbApifoTU+8UO+DbMyGXpKHBwKHGWiRRzk+EQbI567w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MtamBLQ4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F96606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F96606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MtamBLQ4
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bb5afa736so109005eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792598490; cv=none;
        d=google.com; s=arc-20260327;
        b=L/FplH7Cn9dv26NqSWJ0p/qy/g7kH5SjXlOrvc7yChCW1sxmwbfWHqStFSeKMJD954
         /h/+BtxPOWsv1J+d2JgHaAyoasffLZ7FGYk0x1qXJA0E/LxQ/yGe1pFdTfBDqdTAm5xJ
         TJM1Ki/6GbX/bZYovDs3FqTRlxko4Uqmh7urfUx5r+vP1a0Ui9ErFix8WfeEUeU50ZUd
         WM/iiNh8MDcHKCJ7QwG3Id5JjFAYyIK1kSNS1sa31Q3N47Q0jw4xsQBxN3OGKqVA5XwK
         oPcr1Y+o2GJUw4UQMetkcoX7yRrVsRFoSkpi46IauBsetXyaMbTF9bdaHEnyzOVZPmq9
         H8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BLygPznvNDCGhWPjkkO7YV+Kzr/dVFaecnXDSmhqgWM=;
        fh=yKLNwVPjGNx4OUb4KI1u9isLrCJHohewzztKzfBk0rs=;
        b=EloagwozOf8LzFMV+Ynq3YqrAtWGfaK71N4yBCQsJPB0MmlfiyhaAiziM+TQ/HlWmD
         kgYwUl7SBmloT90P1yqjkC988u6tp3/XeiMit6H4TbpDTyafCZlzCQ4unDnoMZQzMTQE
         ZBoeeFCZmPDvDoSLpqOR6o7xM0FJcJQNC+JNumd0tFvbFOrp45z9KjP36s7fwN3RwLOG
         Jf+Zxl9pip3Zq1sGI0SQ3XBhJC559nHeGh70wXlZY8GLNvQQBDMjhLOVMNBVvDEfIcEf
         jrN8fwxEBJDc3mVhqpqE/w7I2VJO8+xJsESkZFSVNred7RRtjEApxgZLpxTDMloqyK7t
         qz7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792598490; x=1793203290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BLygPznvNDCGhWPjkkO7YV+Kzr/dVFaecnXDSmhqgWM=;
        b=MtamBLQ4vbQlF3Vf1ayIwNBCQnv5anrXyt0vGB64hXVUdWxJYi3lRPd1JaTujgWAWH
         FXeav/csdXu64hzX9sZhzfejNuak0LbZlBGiVaHqCeeJA8R19HyGznJOxtyET9uzA4lq
         hrAyypCIcDzvtAzf8alpWYz4HX/3aI7W61UqezBAx6faw9xZPq+dVsRdnXrrVYw/q88i
         b/XKjYxLYS9OqCM8JH1/jD8NWzfOW8It9qvksoiQCO0Gr/7zcnmGnBmGoNBzzz18esht
         0/oOWWfrDJOuS2fD5QbfZ3Jc8b4Wk+81wmwZxM/6E5lqXj2XkDeU97s7wAgmdO7APA3O
         lEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598490; x=1793203290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLygPznvNDCGhWPjkkO7YV+Kzr/dVFaecnXDSmhqgWM=;
        b=wCrilnmjDZzuU2GdaCUVyOGK+JZ/iPoh55UuxRMa0zBbtK4/WpGes8aK4rwwKt34K5
         I6NPRazaLrObRE4p58Q74pozvWT2suD+wdfo338/sfjXXpV/QUUJTnqRqAwuXabEbxM3
         LZ11Tc0Wa8eoG5CSK4h6zRFkNSeaJa+92Ty6/GPTXB/PPE35c+VYyrCO6iYDXt9YPN93
         FPvHkCeLWV7yN+GlnKJZLlNe3Z+nMorXv4Shlyq5imsYv0hkjtz2V/ESSw3yAm3dx9/F
         7kONlCU9Aga9SpPa245EToElIEOzjnsRhcQkDDsvXW9EdSZMyW0B13NzVbkfcNxb7Rnp
         h12A==
X-Forwarded-Encrypted: i=1; AKwUvBzWF0aImV/xqNXy7ggj6AQwmiqhOtGF7WHtXX0BDh6geDTWdfKxPNXHGfbrDl1aXTjHePHC1FCuEmlMiRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYItrv14vN0FMX+kZ5mVJ259nYJZIdyIqobpUmCrsO3O6RHshgbl
	3dquNncEImd4HU7poBjmVSL3VDYkS7hpVU+l1JlKd0CBn9HGDzsF+I12uQ3a1kDKPXyYWYm25RD
	UwrctFI3ZE/BuqE7zqhbt4PDFZ8pbEjI=
X-Gm-Gg: AYBFou2tLsv52bfhMoatcivqafl4aeV8iB+ChEe7uquFWWZeJ9iP9Q53cYEyGRcLH28
	qlat+MLSONdtxZUo0no1VSN7oZ+7H/2Ucx4XGdMaXx0UQ3TkcocZ3loAnBcQ4JFYibe9IZXrUhr
	WKMyr2IT5MrWu8c41RejXL0fhW2dsed1GPfh1lsR26n5IV5XAbA/4TbA+MDjMuLyFH1onXupOnL
	C1NpYYdlJWPd+scghf1LLkzzgIWCgOoWbhCR/gQSafqqY/KSFCqDEw9C7s0Fsz8Ii6RG5oX6cqE
	7W8DLQ55/wHwTZgfkIyecL+Rs9zi5t3cLapzdpaaU5EDZC5mzm5+7AhJGYx9icnARxCOR6BQjHG
	DGRGsi1tPkjJkv1OAtFETSPrD0tkp2Q4nph8gnQObYxP567P8Z+SZpJ2nJe03rGVKrVmPX3y4pn
	QY+7OmGXR86UlTG8gk3M8gSLanx+8zDXuZwXX9TDrZgvpQKjSe9yuo4fAi0EuO6/4GFZBnRX8As
	a3nM6FDT66i00rBofiTyNxzCbCCHYmC37Ch
X-Received: by 2002:a05:693c:42d6:b0:368:5521:612f with SMTP id
 5a478bee46e88-3685522022emr1029856eec.0.1792598490193; Wed, 21 Oct 2026
 09:01:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atit3cSBFwe9cDY7@sirena.co.uk>
In-Reply-To: <atit3cSBFwe9cDY7@sirena.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 18:01:17 +0200
X-Gm-Features: AclHuK_NMe7TYkrsYT8Zbia7tLLYKdTL0S8C6euBBNsuQv8WglAhivXlWPCE8VE
Message-ID: <CANiq72=fy3XAqXCBCwQ8AhWRNPSruDe4fxDAdzaUhUw94FAS-g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the kbuild-fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 3:57=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   init/Kconfig
>
> between commit:
>
>   f85147b291e35 ("kbuild: move the toolchain checks into scripts/Kconfig.=
toolchain")
>
> from the kbuild-fixes tree and commit:
>
>   3504d1bce9920 ("rust: kunit: use `file!()` inside `kunit_assert!`")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Seems fine, thanks!

Cheers,
Miguel
