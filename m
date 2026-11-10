Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794333825;
	b=gGPsFiEjWo9phgDafwirnSWDMyu4eSCGAKwBz4ziaKAuK+8+rtbs4WBKQwC2Ir+e5NCA
	 Rt3cvV4RVy3r1afVxW+5oJCF5I07z6stgicB651aCW2/0izjkPOM4OJxBQs1YNIRZh5XH
	 lqkzj3G/31L3gmK+9nxOwnCVdUzrN3XlXS+ozVXyOnZdaJsflRH3BMNnpRvacSTUuWDb8
	 LufFeo110tGQmRyihvQV7juGQA1D0c5+8o8GOd/fJNUu+n8vlzc0qbh1M2mrlUYGEw5Cl
	 3uPJTeb+A0nzH66fzsbUDLgygGwN8NnyAuHz6Xf2Gh2pJUlNfsOQVn6kandJZm0pn/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lzQJ9a5l1BTcj++f5PsFJW71LnXsNyCRLPczNlEpe/8=;
	b=Ob2XDUUxH4xvP0gH5y/k7n9Nx2rUJJPwMEx4DE0RcFBkGLjJhrHoJHf1fkYtayy1z6NI
	 mwTHxRC0k7k3yjV/vUjKwTcFHvyvMbaruxUE2n8k1YMYau3f0NpF5Yj6/gEnxdUMRFwHO
	 KuSNXOZvmnnRZs3IxGR3e7DWcfpQwwyuzlq1JT1E/mzdsCSlG0PDcfGKTsW2nExz5vmGX
	 ttUKsRjdE30CLXYdW4vwZNO5qMA+nn3mNOJ7Ea07BRqypcRiNZWa+ZmjJeuKKbmd/GH+P
	 d1+wRksovbYRUOh3EhS+0IWN1QlG9JdowGMt6b/U+0owZuw6IQmTHTMEV4vqicJ+05w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zx2c4.com;
	spf=pass smtp.mailfrom=zx2c4.com;
	dkim=pass header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=ZZwI4IJ4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC7760A2601
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EC7760A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=ZZwI4IJ4
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c505c561fd5so104835066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794333823; cv=none;
        d=google.com; s=arc-20260327;
        b=J202jYj0Cm8ZUa7jFV4dahNz6q5pJKii64pGboT6nw5exhbhKSftFbxyeIC9eISdAC
         BVL74W1xp5wmtEzAnewhPuVOC4ESMbLQ4IBvNU3jJ3/nTqHp8jUlaHAP7WbYfqNmY3OT
         CHSICaAXiR6WB5JRJyX1oKAvGCUbE6VjHk/M469l3d2Owv1IGqWRvCm15HQEySeR8Eut
         ANcvCAxxlt8I0dY+SswDx61geVmw6AcqjX8tN7YSlfqlSpKa4UEirR8kBkUpiZxbQRnM
         cJbnWXQYOs59W8wn/oXR2l6cjWuMWkU38Z7dKm5kMnURoBEbTP49Q1O956vgyPE4D3q2
         7Idg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lzQJ9a5l1BTcj++f5PsFJW71LnXsNyCRLPczNlEpe/8=;
        fh=bixN3ycj596uqvwkNQgklRKDabZ4j4sIZHgyo7nTG2E=;
        b=DsHxpA0AiMrR0l6TMgJ7BubvNSsPJAhFPn/0tPywU21qQgobXU/ZDeV9ioNgB50tdw
         bHRMl9Tvr5L9eecK4vVMWS8knZ39dJQQHLarQBeFtE+dfCZj861z81QEgKBnccH/+SFU
         H1uKi/JqR2Tj39oraNfSxNfum8Pc7jQup2yC7QkS3bezJNp5iSj1nV5M6xDEo4GnpiAB
         fdDBuHKsACMPxN7vDK5GENZlO2gnK37AVE/imtZ6Apw/Omn8kIK8LSabLrlYOLKrJT6V
         DqZYdCAzJn6GHmJd7HlEaUujkYxtv0PJ43GkFBZluHkSMMbK6uWzm/ip5HiRxRFNZHqS
         S6Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zx2c4.com; s=20261015.g; t=1794333823; x=1794938623; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzQJ9a5l1BTcj++f5PsFJW71LnXsNyCRLPczNlEpe/8=;
        b=ZZwI4IJ4aWISIef8lRAv4poXLLKPrWVwkiSlfKdjw5uD/OJZPi3I4FfAXubc1YYgEM
         dG9fkB5ccMhfA4JUCMy2eTh9GuC7Tx8LJ1E1hSOA9RbdAouOvwK5RYoO9IS5x2DQQMDG
         0FqW3ro9FawL6Aff9EKxS7ba2Bya25ZKhy7AOUmbgY1+jtEVGAC3HzhvQ1EBpUxvNTjy
         j5yEmy3iFmLDPVFrUmj7iEU227OLSTYFTeYU5zk4H8m6bor/08jDLO78AkEBenZgkMSc
         tkJf75SNJ2esk6+aHMIfzTz95Fl36/N3emySc2sfrt0HiQnByO/CbOrEjYJDM+XTZEhP
         8GNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333823; x=1794938623;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lzQJ9a5l1BTcj++f5PsFJW71LnXsNyCRLPczNlEpe/8=;
        b=SXX1TBH6JAfWxb/c10pu4MA8i8pUJEHYu38CHjPSxZAuJmeSAey6yzMk02BUnB66Hv
         fbMEJcdjOYbNmrrDRNwIW1JSjaKLTXy6+SGQBWq4SAI8uDIPv31FfJGD5gkG3MZVSIBL
         uiUlEIt50hSwHbI1+0ocZ7EL22hIgnnx0jlS9TKxD7e5hW/xgtETZPR8HNQAQKckce3N
         //mpMxXX7UHCxeKICqFggXGPUgiH2OIrtnLIni5DPSwmyfnsrIU76TvtdFP5uWYj/2lR
         oO3II5CSIWPhxhKM5Tjbd8K1D0Hfr7gTfkzpibQBaf9yhY1Kc3BiCtEMc3fBgFmjqzZe
         0Q0A==
X-Forwarded-Encrypted: i=1; AL+hErFLTcRp5ftRikZPGrXjspgafAblfsXh/JP9iKZ9PaabKbg+4ak13p+Cz2+3jMziQiGH1luO8ioJWtAkeWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d2PCQSG5Lfbn1kbX64uPiwRCYObTmGxA9y+ACgUlq7YRc5Lpq
	unPI1EIsAUpsV+8GsAZxYYvTqIyoz0emPUwsY3VaO2MLdpWh5ETmwQqNdX/mSLEf19BWLces8Sw
	rE+g0z8ELmJdyn3puBYYw++E9LxgaCGf9ilc/Fowmo1k=
X-Gm-Gg: AYBFou3uDjaxcOFXOPJRRlI7HBRliz+Nttj4jMjhKc3b5jSxbasxV9hW70C2CF+4gnK
	oFvvqeqeruPcKhOw8Womrtiy+kEom3oYThIhQmCEHCfk82P58t5VF9xp3880SNcLzH3krJgI5Jk
	O6LP3FR6JLHmaJ0eOP3pY1ljvBFU8BHwer2uRKS273OMIxINRgbF9FPUZwR+ztiGxjHy9ElyV4q
	xduLfr26B3UT3mNNzyYNU6yFwWJFx+LDGSUOUAvwWfp5fxhuMlgX7iIZxD/rq+5H0uqmZA+0rfR
	4Fdh9+mC+JCHouglbSM9DuCrMelw09CQilbJa9YdPbA42ZBQZdH8L9vujJ9d8GpJlXGfavX5DSz
	ycbhrrsLM1tYm8QISkWJ2sNmn4iRDqgZM2oPJz5cdLMNjMcNarcOuy+OXUFP8MjcGorZcl6rbFS
	TrDJgJcVDiZhtQgA1YAatPNw9j1ujBLdf4s7bLtElPYyPoRJh6sj39c0mwLdQHbf0GO6IFWF6GZ
	Rp10Bl2PuceJ+sN5la/BMGx/A==
X-Received: by 2002:a17:907:c0a:b0:c42:3a77:80e5 with SMTP id
 a640c23a62f3a-c5049583e86mr302817566b.29.1794333822814; Tue, 10 Nov 2026
 10:03:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <116cec552f58748d434d4825c6c74f39266b265f.camel@infradead.org>
 <avNCdbpjxM752XSw@zx2c4.com> <89b5e08e2a48c33be4cf2d495266d04a2dcf406e.camel@infradead.org>
 <CAHmME9pWbftSmnJgLawNmWxNHMEqC5evxWPW8TruYkBD18Q8nQ@mail.gmail.com>
In-Reply-To: <CAHmME9pWbftSmnJgLawNmWxNHMEqC5evxWPW8TruYkBD18Q8nQ@mail.gmail.com>
From: "Jason A. Donenfeld" <jason@zx2c4.com>
Date: Tue, 10 Nov 2026 19:03:31 +0100
X-Gm-Features: AclHuK_PdK0XHi04omXe90eJidcgcAUUNUP4KnWXn-FWg3xkjBKoqqaRiccjqWc
Message-ID: <CAHmME9ow3N6soH+WwW+MZsDG9VeKW5WK4dYA6k29Cxi7UQtkYg@mail.gmail.com>
Subject: Re: [PATCH] wireguard: socket: fix sticky source address on p2p
To: David Woodhouse <dwmw2@infradead.org>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S.Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Antonio Quartulli <antonio@openvpn.net>, Ralf Lici <ralf@mandelbit.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, openvpn-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"

https://git.zx2c4.com/wireguard-linux/commit/?id=6d02c757940afc798e0eb294108262c3e55b1c5d
