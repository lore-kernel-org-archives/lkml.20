Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436405;
	b=2I3H7nbjmAuKtzQwx7j4+6icufBDvWMK7OdqcGHLtpR6kFv92ahxmhZTYumKHID1tS/D
	 yBXeqA6wxDzES1QVSNj+PFuuPoPfvJ8b6gqC4DUfsbBrYCEWKEnKCnrj+hF+nUkhsd8rm
	 N/d+mres65e/MArnXrITZI3t4Px0B+hRZ4jsFuNWygMlv9m7WVVg4tWpI422x2YAoqzl+
	 5anSSboQpr8zMtpgp81NqkrJYLPMpgIu5+TPxxEn/+4UZIDtslTop8QPr5b76hDLT51zD
	 BgEvgbzgBOhg7vClQEbiio31pepbgGYgsxgnY3PEVPNV6ZJvm8on12X+YWOffjTOxVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=ADFJourLj++R5GH+t9pIXonKOLiFA6JXJ+zYJJ9JLn8=;
	b=pVyFpwgdaqRgYLSiXM5tekLDc0UuY30Q0sPO2uAPbzLF0lUaArTRKjjq2CsIUmOiXLnA
	 G1jOZVOPv0fxEkBzXDFSi2pEBvz84zVxsubAE2Ke+Ko3Q89RQ4pKulhjFesqjtuHTDbZa
	 1I3I6z8pMcjLCJpMP0IsPVcJ8ERGnyTH9qHl/k5QV7IcmY527quQu6aIwgfy9AQl0aptQ
	 JHMT7gfkkoEfzt/AkJtFK6yAJ4SThXa188sQYkKtZOizeDR6RNRtMOwybLwUrs617c7I1
	 4ixq1IEH+09QwpNCvsJmpDPt0Ba8Bu1CkObs2ft20jwNkV9QdHjQXbtJlrsj9CDRi1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oOJ62FCQ;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03FD606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F03FD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oOJ62FCQ
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c1c8so5758125ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793436404; x=1794041204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ADFJourLj++R5GH+t9pIXonKOLiFA6JXJ+zYJJ9JLn8=;
        b=oOJ62FCQ2LNaqHJK4k6l2uTtYPCA2hD0PEmRn3vdYi+Bo2hnnqDBvJw4z6fEVaOauK
         EUnyNf8Cc2OIuzJOqX70/vOLgHR6YunD40orkxbhK7UNFIMMjL6h+qhKSenSxjKqldbI
         LQh+FAS8m2gaUtaaYfn3CTpCXSry1bo0LnmuaNogaBgT7D4KIMbKNcZQZf3L95j/YHIl
         7/3iIR+Ee9ZymPwZRPT9pjrVxYlwcq1ZoM/HlutTVoKVFun2S7ezykfiFEXUk7qaDZgZ
         2IIz8Ti/yhWyDCwq35CpW5fedNk54hkQujwwnyQKQ8iHS/4n7vxlsn9coOlxk5F+xWFI
         FDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793436404; x=1794041204;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADFJourLj++R5GH+t9pIXonKOLiFA6JXJ+zYJJ9JLn8=;
        b=yB5ukfKdB22tevIYOroDo5/zJB6Shq4sgK0/XgfbmmZLiLjQoxOJ3Mst/1iaMPoOYp
         NMxJuvLTPTU9nJkEonwwI/2G80bWsqzXKmJOinqBuuehlI1WQ0d4UjoTUoHK7TnSy3eB
         rUHBpFrkYF8jfkANDNQ+vkzEKR9klhvpYL082Lw3PvMBab5hQC/ZyrvhsuiOEKO+rSkT
         Sk4yGIkw+7N1HC3NLI1vxtReOpPQwkKxqx0t98c+ecLVisXDXTd5djctVrnQWCEPmrxj
         Kie0/XYrVm9zB72r+/IswsjFxJwU8QJPF0cX/dRu5UwWpf2ijoghPs0aj9gCqBqeOu6M
         0gtg==
X-Forwarded-Encrypted: i=1; AKwUvBwE9xhq5Mm/Cpg6ROHrD0CcwoSZRd8Ld/3XL2Jv05Mm5mKxNZCh1MWkpNi4fQl+qjC5/QvXn3cVoK7F36I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwZoK5sNrvrRk30BLLcHkGg+ur69CeHQDQd3B6xT1dPfELK1WA
	W4pztnW/i157NOTCe9NmEDsTrFj0TIlID4dv9lci1RHzV5oW21l2J71u6qFs97BZnQ==
X-Gm-Gg: AYBFou236JBm6UJybE6d9EmX9VfaUsnlDAOcncslODQZTEbG/EkwzrJbERq16Z/dMnO
	ysiWT3hah5aDwbHD/wT9gm80tCq7n6i8qfqNLHciTW+3+qlAGA8DIyvZHDz1tMILD4zvpLw0HXw
	Mr627HYUf5/dWZKAHvHKSLCI9SMGt6+kk0Z2+C+z4uLElJC1MYSeuoiHA3kw/Or0KwOk9IhGNjU
	PYWlET32DETb15bd3AsCb1MZ8e+zdhVCHlyLD50oWymzYBPH39opSaFLVXH7cI2Ba1MxwtPdbVh
	wazq+oTt/iuI119nT97TOdW7Ywo1djhE6Wv5viLZ2D4ZDj8s/dG3KqlSPI0IX/uV/7kCaZCssH/
	7vrR4Aa4Y5/0SIqS5mdbiNNlJEfgMzGQPU/QMUpGWvekIuJsRJm1JvYeM9mNmHeMjyX/JaWt+Y9
	6wQgFHjm58upwUuDfDhHjvmwrwn3WMFT7SW1x9PyQ6uVe/h5isH1pztdnkhDDQCUNxlV/3NRvW5
	quns4nq1Uz1Pg+beOe7f3vrTq85sIy88UgayF4SpEDmoP1XNhjlPXXgQxbavOY8iFYx0dnBg7P9
	GChYXOmHlnlsomAKtLfG+aRvNZshZE4jfPZ9JCbzG3ywzWQ=
X-Received: by 2002:a17:902:da4d:b0:2ea:4c42:573c with SMTP id d9443c01a7336-2eb364823cemr42643475ad.51.1793436404146;
        Sat, 31 Oct 2026 01:46:44 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a06:a005:87f:ffff::102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3927ff6bsm14261305ad.52.2026.10.31.01.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:46:42 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	miguel.ojeda.sandonis@gmail.com,
	tomo@flapping.org,
	georgeandrout13@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 2/3] rust: time: make Delta division and remainder fail
 consistently
Date: Sat, 31 Oct 2026 16:46:28 +0800
Message-Id: <20261031084628.13273-1-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87bj8goc6x.fsf@t14s.mail-host-address-is-not-set>
References: <20261023130413.178487-1-chenhan0017.work@gmail.com> =?utf-8?q??=
 =?utf-8?q?=3Com4kxbW6RonEr7EJOnn5nizbkBZi1B662AdSPv=5FiWS7XNJXuPCDAsOeWG0SM?=
 =?utf-8?q?SeK7XqoTrwOPzwMC1jS2nKknXQ=3D=3D=40protonmail=2Einternalid=3E?=
 <20261023130413.178487-3-chenhan0017.work@gmail.com>
 <87bj8goc6x.fsf@t14s.mail-host-address-is-not-set>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andreas,=0D
=0D
Thanks for asking. I should have distinguished the non-zero-divisor=0D
requirement from the MIN/-1 check in those comments.=0D
=0D
> Why change the safety comment here? If the function is always safe to=0D
> call, the exclusion is not relevant. Was the old comment wrong?=0D
=0D
The old "regardless of the input values" statement is too broad. In the=0D
generic 32-bit implementation, div64_s64() goes through div64_u64() and=0D
div_u64_rem() to do_div(). The latter contains C division and remainder=0D
operations which require a non-zero divisor. The kernel's=0D
-fno-strict-overflow does not define division by zero. An architecture's=0D
divide-by-zero handling therefore does not establish that the C call is=0D
safe for every input across implementations.=0D
=0D
The zero-divisor check above the call supplies that precondition. I have=0D
updated the local comments for the next revision to cite that check=0D
explicitly, without grouping it with MIN/-1. For the division call:=0D
=0D
    // SAFETY: `rhs.value` is non-zero due to the check above.=0D
=0D
The MIN/-1 check preserves Rust's panic semantics; the generic=0D
32-bit helpers use unsigned magnitude division and wrapping sign=0D
arithmetic, so I should not present its rejection as a necessary safety=0D
precondition of those implementations.=0D
=0D
> Again, was the old safety comment wrong?=0D
=0D
The old pointer explanation was correct: the local rem supplies valid=0D
storage for the output. I expanded it to make the validity, alignment=0D
and writability of &mut rem explicit. The signed remainder helper also=0D
reaches the division path above, so the comment should explain both=0D
the non-zero divisor, established by the check, and the valid output=0D
pointer. The updated comments keep these separate from the MIN/-1=0D
behavior check; both runtime checks are unchanged.=0D
=0D
I have made the corresponding comment changes in the math helpers in=0D
patch 3 as well, so the explanation remains consistent after extraction.=0D
=0D
> Once kunit supports the `#[should_panic]` attribute, we can assert the=0D
> behavior on all platforms.=0D
=0D
Agreed; that would let us keep these panic cases as in-tree regression=0D
tests when the support is available.=0D
=0D
Best regards,=0D
chenhan=0D
