Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380098;
	b=hxMZ737j1S6XCQLwxwaQ/lV4peBlqlWMmvTFxnVzEdXmd2fcmuPx7q8t6COn4aGFIeKz
	 gWHVH9u508iPHBhWrTb+dyaIVH5cEh2WfihbdiU5wtIf+EWSURlWiQ7uTv8jJ1jJh1izE
	 K023DnQnlV6pJYOfe7hOvbEWTo4+olB/YHHXrnB2yT/Q3rZTN4BLKiqZnI8jZyrLJPqH4
	 BY9GyKlC4E+0XkCdMh2+UtS6OtYIKDnf6sGgEQx7dzZKJLCz8ctzkmGnP3wk8S8b7fuE5
	 Fj1D10dlNqFGIgEHR96AMdPuYYo1Oq9TdXsHicrfjqubVYPz+S3CMbWu9aMrczOg3+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=UJQFo6lBsRxUZVqaTAfTugCYtH9lDVXLbR2YaM1dQaQ=;
	b=VycFYsEiDdRVBu7pepg4WfaIrPGQCcRY5MF8EKHGNxpNXtIeQu3J7xIYAg0zjVPudlX5
	 h6udhFA8T7fVWvvdq15dx0sWJClB4MT4p/YeYGojENVINIcbMPQOwziYjJPgIU3BmccBQ
	 UJV2xD3UnTPPpk9DC0/MPMHVi2El1Junl9MVexf0g1BgW6Bd/QTVZ25w8zNXNQaL+f4Qy
	 F4+m62bur3ecYCOiOdy9oRxsSQw8S1XoSh9hjQ16sAuVYPzGZ6IHk6Lefd4x+attMP8Gl
	 MrkWPSyDtWG+Hv7zmoelHJ9RsGBHh2wPIqcLdDWhlTwFfyvbwzd7NePo4ha4MP2M5sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtFuYrJH;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0CB606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB0CB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtFuYrJH
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7c2f48f3a96so311543137.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793380097; x=1793984897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UJQFo6lBsRxUZVqaTAfTugCYtH9lDVXLbR2YaM1dQaQ=;
        b=PtFuYrJHVVjxsD3+QnaSsedFWNS4nLWLqgvQv9apD0CYg5eNqRuNk6eZI0jdSZ6Q8/
         SBwnmkPqnWIk//ri5tKsgwcIul7GOTra7xsgHbKxGtHZZ1hxyVA38OX9DMfgbypyckWj
         2g68t60m9Mg4vbUOrIyMhhks2iiLLoNgOaadCYN/QGP6Q7p5jK0Mf2mxgu2eyD/S3SjR
         pcF/3efkDIquTT4hk1qE/3q9Hts+Gic2hBNKmagf47naDwa5XKie4fsfnogh80rCo71W
         6lcflru1iV7jjyM/TKK/ITzoZTgmQUugv/sRQYeidVrpm6ger3hXQYcP3e1Wmp2emTZh
         DDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380097; x=1793984897;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJQFo6lBsRxUZVqaTAfTugCYtH9lDVXLbR2YaM1dQaQ=;
        b=wrbQyrscK6ko0OmvSwWXCFCXAehf2LohWqH/CKTCbXVesdasZ80bx6HPz9XQtWrK/y
         fIFbJ2KRMNnZm6MuEhl8ylqUaG8Pe7s+K48IzVFboxavHs8b4qHyN3Zw880UsqpJH8cD
         uWzIkDAHaPquE+8vaejc0w6Bd3E6zZpqEim8p/69KLvM4a9sPICFgBbPJgGOpYcYsjN+
         N9szm4qwSCILnuydVMOlZO0xg9b9S6EKyBBiDR4fRGj9j80P1TZPOJonJDT/eu/R2nEE
         6mT0hbfsZQPddTf/GzYl+ugCZJa9wfnDASuv3lKJPW6r3SoXLcoVdMJOV7/cpO6Ese6L
         pMYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ3x5UaEiAVKSlkvd2EQPNXACLci94LgGretlvfVjdcy1jP2JwtKD/VuLUg/9IpJEWPW1rm1rXRDabBj4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCs0tXLBgq+/m2D/t3snS+kK8uTLfJlBSN1k0I8JhRm4nDW2wS
	T6YTgKyGrJj6b7Ok4vatC4aVDZTcIrTvKlqikcII7PKg3VBfa5+hxcm9
X-Gm-Gg: AYBFou29jF2S318F8Fsc6pF0P5liOS0UnPAMjAjBOpKiherRsNTZ87XWxwx22eFkuqL
	RJyGuGScqrpYU+D9YjFFtVfT9c+pEkLw2/36Gd/MOwTRku2LDQsT3H8QCn2JULGbJvwe7m+GB+d
	iIyd21fkPoyNk2GeyUKI26GoHegN8qv+xL8xj+4MaghANVxY/WOoyc/swsZuQI8sMKZdsDzvDV0
	XT/4roqn3IhpKXIqsDnD61XnluC84Bcf8qHnzIIG7panZv5QRiqvJQyrpkV5U9Kq3OAMUN2KFpq
	fQbsRRLTr86w+Ge1PrsXTQY9O4TZ6KjCD3bfbuIuXIC/Mr/qGbnHJlJbwC4atIMH68jbTyJ8ZsG
	hke/weJLXx1f1L80Nut3x/D7byz9bO5O4ediKn727vvAogA/6Lc9/WVdRjgXnJvM0xmCKTLiDr4
	bDHqBDxRlBgjUwZIkvgvgOjI75JIzf+X2uBN9Vbz8RMRmIcBgTsuAs4QOVh27qIleUTnbjhJjy+
	QxJUegl+39USfTzpjuHo+XGOsPjhEMpnotyLmCnoB/nechwmjy1I0nM5Bp9zv9eQQqHFVlkeLeN
	go/D54UPslVbuBa9QTqgQKyqwvi2/TYPSXGY6jN15CeSXmKAntRCXPAR5aD3j9kkDOI/dTm3LaJ
	8IKTvda3AYoMSu+BVygu81Y4g6MtAGvtRpWgoyi/FAJpyfyEbA9/wZetJJp91buoiSbGo
X-Received: by 2002:a05:6102:50a5:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d072bb35d2mr1407630137.7.1793380096890;
        Fri, 30 Oct 2026 10:08:16 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee3a066esm3190273241.5.2026.10.30.10.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:08:16 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:08:15 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Ahmad AG <ahmadag1001@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: kuba@kernel.org, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.2ea2182d344a4@gmail.com>
In-Reply-To: <CAASqGyYfFwZizof-O+Bn3_H85sEFytVr9GapOVQsW9miVa+Zsg@mail.gmail.com>
References: <20261030100504.23498-1-ahmadag1001@gmail.com>
 <willemdebruijn.kernel.2e53c121ad9ea@gmail.com>
 <CAASqGyYfFwZizof-O+Bn3_H85sEFytVr9GapOVQsW9miVa+Zsg@mail.gmail.com>
Subject: Re: [PATCH net v2] net/packet: account user-triggered allocations to
 memcg
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Ahmad AG wrote:
> Thanks. I will send a v3 to net-next, without the Fixes and stable
> tags, keeping the allocations that scale with user input (ring
> buffers, fanout array, membership entries) and leaving the small
> fixed-size per-socket ones such as the rollover state alone. I will
> add __GFP_NOWARN to the vmalloc fallback.

Just be careful that net-next is closed.

It makes sense to send this to net, just probably not stable
material.
