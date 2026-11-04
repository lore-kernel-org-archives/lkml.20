Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793770764;
	b=kt3ZO2RPF3FIAnrj8VHRrTjmJuxyBgUNmj3jukhLG5dj/fcsFg+0NoJzoZ4Pi7HAi0NX
	 sq+kXZ1qotYtLZJRZ0R9J9ybcg+D97j8YM1mo/SNOXuk21fuJ3ck57RTsc9yE2uIpz7o7
	 ++74hiUrYNTBP1x4TieQsPeYF+vMF1S2EkyiULU9Xd04T1ck1mbKhCXplQij/HNlTE+lZ
	 jMnpDyLQ/WQoFNuzB3yxVjUcligomVCVtwASD6wNiSfp1S6xQM/Hoof5gA9Vnev+bRpsH
	 2SPHHklYrP9K6de8vtoaqkPpE5jXKY99Vu8iBoERHVZct0K0bRL6qijBKtxgGpjwEfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793770764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kSMelPUMbambLzstY6Q1ODhfgtsWJixz60QR47Gg/40=;
	b=Vfn+7j0Th79igX3NZZq3DIUykoVow5K6c9hsZ1mBviJ1BKNSjROBrbFbsUFIZNvrfZ7Z
	 nx9ut/z71fSXG1K7VVedldQvTl7mCo3kDzJgELbDGOlCjNZAkSO+BnQcKsPpVgIA8Yd6r
	 SN3qPXPBbV9Jvo0DNxKMqq+JCU+3H63oErAz7MPkKpB2f33FNpWP8ZfJwsPdBvfK0BvxQ
	 4E0At72IdyHK1LCRrgRNjW5hXA2I7oqrJJXn7OkvKRoMzFeCQne5Nver+mUaxK9RoCVAS
	 zuzptsy5d3y4LT2CCRsWZeF2U2Q+9G1LVtxZQeJHL+iDsMOlGZE9LaBvM5qOAhAUoGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=XDBhw0P5;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FAE606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9FAE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=XDBhw0P5
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so49585766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793770761; x=1794375561; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSMelPUMbambLzstY6Q1ODhfgtsWJixz60QR47Gg/40=;
        b=XDBhw0P5PAn+jLmzEnpHmHqTrmSgeRshTKNXcj2nGdFd5dZRyjGkQhpfi8pBiqgaOI
         TvJ4t39nEvpMWlryAdJSqmK6F/+kWCnBRcwuJuZO7nH6svuYvgIuWNR8XpmrOTNF2K6t
         H6ayVmaX+HMcghLZzkDkEeG0uYm0DpUl+HDWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793770761; x=1794375561;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kSMelPUMbambLzstY6Q1ODhfgtsWJixz60QR47Gg/40=;
        b=JaFkPn9GZJiR9zmVZJUqPGw2I5GPpj8o9BtAwrbg9SLCIgwIT+Qnx+ndYBOuWrCwmv
         Mv7lXEKed0aZU5VanSNMVaDwFCXTC35Ah0d87X98SkjNl7rrt7xwI/LVoBRcQpLwmQLN
         nWyO+fQf72zA3vyMrLAGnFyMIZbhvMMee0g8vd5gXmV9eS7WaktXW/A3ciTxCUZsfUEZ
         vNF9PsTJKq5GHcwJ5W9Yma6S4MttRbgGoplrzZKpgq2/Fh89XMJ4WE9qqNCEoM1IP16b
         snncEH2J5v07Gd/uAWJZl/65XDrDuGNEknC9Rr3xDrESBJl0NzYyiTgtM3h5aDGvhHMH
         CoMw==
X-Forwarded-Encrypted: i=1; AKwUvByA0T/vKUEuhpwVA/ABfQPsVatGlNT5UiMnkeKP3ZLuD5OCczlG76fLPv9y8jwj87F7QabZdpZe+f45C1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EBDg0Rz8gwfaKr+amqVrm8z4jALpqc8hUn27jNR3b5wroCtEg
	BJKIVl0XEaWnonxkQHRf5pPCfyexbaKKRyOcdLlDknvVK82sYXatn5CMa+T+STU4H1BaLQy8i/q
	YqfdLmZS9Tw==
X-Gm-Gg: AYBFou39onm3LFcoVlS915unZCnHNfLUpl2cjMVT5AuqcfALUmun27rJdJJIeEUmYZF
	jyRLc4/nbRRTNAFyrdGeH3d5x3MmNbQin59Elav50ThNBLmbx56W2BlG6ls5g0v1z582TPHssht
	UVz8ELqKc6aWiw/a1egdL5v3Zq6A8yEqeVnkFgB8LPzv1Uj7Z1UnZOtC8BHFI0atLfou1jHwz+j
	KNayDp7DS5Wsxfce1/Ykx0Bkj+YiKUC/n6wTo18GC7PC/Ha9i9ws5dHgZYS3sq09pBk662MPP5X
	geLcQCOqV58O48vUrIsiCx2TgO4PelJZLu1DKu0NJBEoCVrTyTE6JwfiaAWpv3OSCqfVBBgiRNz
	QlqaLo/cg8TfQweivLpNxw6Fx/jexR0kykkMAPriheckzcRxqrqxsn19tXyKDb9ml11yPa7GVz4
	QuL2VFkoPUi1L8wX12kystWtd/QiKdWvX4rlACLXN5iExK2X3TsFZwzvKzLUMrcHd7BwVRe2ooy
	wFhyA29trYT8VVU28MoTSc6Nr7MJM7dOjvXHNQV8EOn2zHSKw1bydb1rDwZsw9cFqwoUta5SBdj
	KpX4PPuXuQh3J8h1RPE9bs1nvEgpuKvTw6b7pQGXYC6f4rQ+Q2hxz+LkoeKe7OuBwBJK/aGjV/8
	0oQ==
X-Received: by 2002:a17:907:3f9b:b0:c2e:3ed7:7db4 with SMTP id a640c23a62f3a-c4ca7a4f17cmr1365457666b.23.1793770761066;
        Tue, 03 Nov 2026 21:39:21 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5b020sm364246a12.17.2026.11.03.21.39.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:39:20 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso45136866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:39:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy71Glg/DxOj2fEI2hy4isjzeiZnQkLIWGbeg0J7AvsvCXd8vOEL1uN0QSmJydJTgjTSXTFfzdUrvENgWU=@vger.kernel.org
X-Received: by 2002:a17:906:9c02:b0:c4d:f63:642 with SMTP id
 a640c23a62f3a-c4d0f63079amr48032066b.33.1793770759887; Tue, 03 Nov 2026
 21:39:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028154218.1668182-1-liam@infradead.org> <20261028154218.1668182-5-liam@infradead.org>
 <auKshDXKQXt1kvjy@gondor.apana.org.au> <auMbCuecFeRmBFSK@pc636>
 <jfvq7vkx73vzp2ukq6nwnb3v3g2ezdcyppba4oa5lpzmz6ls6t@akc46gonndgy>
 <urkgmijyytg3rrislm5fdzmfggqavzpiry23f6lpkqonvy2tqx@d56stj3eixfa>
 <auaFhOa5EBz4gJwK@gondor.apana.org.au> <xdzcyoou73blpfdlgy47i2ktrcsffnclerzojpgrxphid54gjc@nicdcvzqx447>
 <auqtTjXhD8is-y9f@gondor.apana.org.au> <CAHk-=wiE0KG+jkhmJWifXuAVivtB63WCWtdEpGAex7-T0SHd2g@mail.gmail.com>
 <aurAxRpCwzeyXeVj@gondor.apana.org.au>
In-Reply-To: <aurAxRpCwzeyXeVj@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 Nov 2026 21:39:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgPvbYRcKpQ8WTH-EYZRgMG0KSH+cZxY5-Hyf+X7JjWsw@mail.gmail.com>
X-Gm-Features: AclHuK8dMub4vC2TPpv6BcEahTt6-eYYmVZ48SoCIOo5V1xGWkBIA_qqXcqQYc8
Message-ID: <CAHk-=wgPvbYRcKpQ8WTH-EYZRgMG0KSH+cZxY5-Hyf+X7JjWsw@mail.gmail.com>
Subject: Re: [PATCH 4/4] rhashtable: fix vmalloc() deadlock in atomic rehash
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "Liam R. Howlett (Google)" <liam@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	Uladzislau Rezki <urezki@gmail.com>, Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Graf <tgraf@suug.ch>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Chris Mason <mason@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, stable@vger.kernel.org, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 21:21, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Tue, Nov 03, 2026 at 08:28:36PM -0800, Linus Torvalds wrote:
> >
> > Sadly, the commit you point to doesn't talk about *why* that
> > braindamage was done. Looking at the original thread it seems like it
> > was for kmsan.
>
> Here is the link to the whole series that was applied (v4):

None of that says why.  It only repeats what I already said: it seems
to be due to kmsan doing bad things.

              Linus
