Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794318431;
	b=ODtM01a81GfmnldHkddvzIf9VnkcWaNAx74kVxWDhLcuhckpoquFoHwm3FGhUKsYUI6A
	 Oe93H/hng4CLf2lLvRcxK39soeIoUMjR9YmCPwcEUZjKocGN/KE0sjmWcWPx5T6iI7qZH
	 GZv3/9jHmvtVBtLIcjMrw1lV+tciSlys2yOsQQGiYjFCLPAWbHc3HgYg5VONUjXk8gGJm
	 2jVixX6o7aueH7WC4Nd55Z7aoTtkhknp9uqSK/xaIq8VDlW42wqIvS6EDYzmWmfIoxLXt
	 25CB7eOENgKZ6t7lJk7ky9gGKn9730VnuFrT1/nlii+8/+QVhc9CxkmYFww11zQpQAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VULIAJGgrRJMFuTT2lfyB5+2UCASsfPHnc42/y+6eV0=;
	b=5daldsaPeaPRaDkIthbMJzIqLEgFGxyhzT7MA0zVxJ5zuMQdrSIOQyFljMQpn36MBES0
	 SfYbqtotQkzqtmvQoZN2KVjDRwheVoPeQzVdLRlRZXVjO0fYFzgwPg8tmJR9XCpRxlaSG
	 PoYesXHvySQuAGTcjxgDzrBac9W2MI37uVjz1sudNDvD71bhYsnzG2b7eqnA/rppdlZfz
	 nb2pc2/W+TDMA/aEhyc5LZizmTCSEhvYt+PwBZQBLXkJ3tdOEBKfx7RktkTQv69Ny7eWC
	 hwyvPwCPkvC9lUZp/GDtnRxDcvKotay6wdlUIKtsqGdLdN1Fs+nCzMoIMn81R9mHXyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE8sN6Ut;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309A260A2601
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 309A260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE8sN6Ut
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b336de3d38so14897007b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794318430; cv=none;
        d=google.com; s=arc-20260327;
        b=Ivuy9YsFi5tNsET44lFhoyJrQqmn99zIraeH+Zj/RsLR6sg5g/zvf0s70+VYAju5ow
         CUtbFpUU9eqzg21hXKBFlW3k+hyb+SOKiZeZWnP1hWf09JtPq/hBRYOzpQNztPLU2YDD
         gVmIek4apgBvtJ01gX9Dukq2tSGpeUtdGDMuZO0qHrYaEM1QwMs5saCFDgpU+0yo4WeF
         kPr+nEosrFbtkAeT71otbiBX0PMW4iA9w3TKj+sYGJ8vyEADy+Sau0oQZnibZHRpsXdL
         1MGJuydw9a+K3gk7Oc3ZIWsezW1ObGXDjh3yK/7GiEGLXTos3C4XTjr6FTRQ8PpT+BRJ
         VC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VULIAJGgrRJMFuTT2lfyB5+2UCASsfPHnc42/y+6eV0=;
        fh=EIlRcfsOgSlIKJ/DnPHEfHyXsEIbl9Y/jFym2yGo7JE=;
        b=VtUmpFdRMh9K/qFL9MODgar5D757hXdBGK8TV0u5dJDgyZxDQhUySSfM6v7LM2652s
         MUDbOnwNAJhgjQeyKO+ZQjZ4siQQZwjRrnejQQJBtg/220xEtIpT0l8/c00WrI/yHR2F
         VH8x/JwcXcmeHWWFPZgPPNfVLEIxzHqAKndVsrMK0PJ/OImusC6GdnyvYhs0RbMqZB1B
         nU3F8P0VzMaUAT567+9HZxdqtoSTSoT7KGF3YCv9x49pdHYbmuKbHhymg5Li4/SeKD8y
         CjGgRyExWrum8Qz2NISn3ctfEh3GjGoHkAnlPpwYqYNmZ1toSeEi4CxDEiKjSr2X23CM
         CvKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318430; x=1794923230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VULIAJGgrRJMFuTT2lfyB5+2UCASsfPHnc42/y+6eV0=;
        b=tE8sN6UtbnLK9T824CuHAZRmFIpT5Ylywx+1fuBBFE0es8VuFROFzbnONKd8D+2ubk
         slnwcMjiWNoIADseH2Nesv4w943hikH07eQhFtwV6S5JTO2gfu0nS/5qjp7jclYHi9Ex
         BnxwIXrSp7jFahnc5fzWF5dwIUlVIwnlcV8QYzoDI9Aem3j47vio9YBA6jvYYsEejVYV
         WHsoxP6VQjJu4m8w1leZe272Yx5iFj+yc5fnVVveKZrsH0Sbzoo7mzQiz22/Khe4bTv2
         GWV3H0ah4+FLki6XQMW20F4BtgcwItwaY4hrMMVbMspeh1bQeWwrX5fqTwtVVd2uzjZ7
         Qc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318430; x=1794923230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VULIAJGgrRJMFuTT2lfyB5+2UCASsfPHnc42/y+6eV0=;
        b=XZXDUHoYcJ+6nRYdLvLQ3H3wD6oymwG3GqFLIh+Rvr0icB+BX+i+5Xs827f7L8lSz2
         r3HV2OWwsEOpM+Vrfj3GdR0jbDzNxocc1RIA+JG7rO7zdXCeKTllCbOy9W+wgu0SycDT
         gAdfjt8iAZDmDLzMaXSbG1+vyhnY89HsvGCmr6YxLjHNwy/Pt6m+uuWoUAOZAfQmE+Oe
         2zRTrdhpl6Ao5PSxdSsAWrIEM+u6nj4kob8nYoHw/hro8a/W83t2jRcs2uZr9ccMmCrA
         o0i6WR3gTtDlNUictvyLMTroBprhpf3S/kqgMPHVo2Fe5ZBUR9xkJYtDlg2Gz6FVF1gy
         G/Nw==
X-Forwarded-Encrypted: i=1; AL+hErFUGv6ZBQkimNCfxLL6G1xq70yRnQoO1i7v4fovU7/RUxX/AKaUrZwF3dBimWy1+DqArqFs0ErT9rFxEn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9raVVQVn1OdjPu6lktWLBZHv7CMdnhQRApzbMA8ERA9inrSfWh
	VV9+Ng39zJaio8oasIubU5p79gxiLhUmXcOtNN2mIovfnjLqXRd5qj5+pAkaLuMHNvGQyzI5DO0
	jlG/2S8STnPOEHhOIYdltIxmYa9A+1vk=
X-Gm-Gg: AYBFou1RfmynuuIO0NuhxWG8BpG67229jMbrke6VtD0LvYyODifyIKujz79z7R74DfL
	yKHCYMa2XX2iWKlJH6EFW0Uf7es9pc6/RIJIrogyXli6S6fOagy1cREKpBqzA5KaTXT7Z4PcwJi
	e4Dhq26DO/A3Mlo7wmERbkqezQ/6bDxSJ/sc/dtBOJWFYr+0jt4cZ9qP9PV6uHnKLLmmUJvkzf3
	I0G2jDNx+2rKnY4XkSVqrNvN8TtvAJsvBW4ZkEh1LkT0tALfRULfiMOphgyx+4qTFAr7+N+NIKf
	ygrNe4DBD+qXbfOIDWwvvMNl/vt2ysFKgGIbTlP7MRxqnGXqgRsQiTeQNeZocis4IgZCrdn1fRl
	gZB0/qRc5tIautRtwhLa8FQvqWy+/RqmZJNbhTTesMaX1uaCB841xZjbNL1xd7Hy6GKGSlUsIoR
	1rzEbLNqX7YSbNsrJ+5g5xhwBJ8UUbQqjMQr8S7563OHJepxi0TxWm4BSoFKwe+Eq/ENea7adJY
	XSJBLB5zHKZvsEfFil6jNDV+ScCesbEc1AdcWlaj7Xce+34JqnXdA7/8erhTQ==
X-Received: by 2002:a05:690c:82:b0:8b3:150b:43b7 with SMTP id
 00721157ae682-8b392a0043bmr15689387b3.22.1794318430086; Tue, 10 Nov 2026
 05:47:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>
In-Reply-To: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 15:46:32 +0200
X-Gm-Features: AclHuK--urMkAZ8a1GYQVxfw2ZUUBbdPOWGmQEwXiTmVu28rFGKUFoTFy7m1p3c
Message-ID: <CAHp75VcaoGMkUXX6WqpfmVsudOZvkS2bbotqJ7oatjkBJA8=pQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix spelling in hmm_bo log messages
To: =?UTF-8?Q?Kincses_Benj=C3=A1min?= <kincses.benjamin2007@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:58=E2=80=AFPM Kincses Benj=C3=A1min
<kincses.benjamin2007@gmail.com> wrote:
>
> Three hmm_bo log messages misspell the past tense of 'bind'.
> Fix them to use 'bound', as listed in scripts/spelling.txt.
> Only string literals are changed; no functional change.

Don't be a meat proxy to some tools. While grammatically your patch is
correct, I think it will give wrong information as the used (wrong)
English word "binded" comes from the definition. I haven't checked if
HMM is a HW-related piece of software, but if it's, we can't change it
without checking on the datasheet. Otherwise this needs to change the
constants and the whole usage of "binded" in the whole driver.

--=20
With Best Regards,
Andy Shevchenko
