Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794846577;
	b=QU12FFl58JUCXA0jzykpwO4L8XhkR5kEiyz7z6W2yDaDjdoLZ9OiAlWmL0h1wtMX7MLY
	 ME+pEaTgv9nma7dk9TIBev0FKicG2lS5UYBMpBqjuCo1kkA+RORSky0PgNPda1JTS7RA1
	 lGObm2AtHCzXgUV2Nmsw3275VSv98XadP2AU3cJE5K4TjemSVKmVVuqhoF5itr1tkGdHW
	 EtvJ/qZ443aQFQMf2E1eI0kWGRV9bEwunPIa8ZD1CtTCnDtmzQlCCX/g4vWFxiv91u4wG
	 PSHMQNtG8YPgyiOppvZciAyDYo/sD2KKUxL57MWTuOZhh6TUCRJePUWRgZx8M6sEOWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ShKIQFI3uGIhr4DBTVUmVEiZQKVcNYjQ9vNtabc3Rxc=;
	b=GkuxDM8SCe8yYdKBloyQFcrLZbgVAkZ+0cxR3yFy0Isxp7jJKqKwBxomQPWcIbtx8Eco
	 Vq0zwx+8zqrCp23bVOaoQKj8A6CILBBG5urFpz4/4mEoyoT0iZj9UwmXvGmrX/HrC2rAf
	 ViGMTkxYfCzprqqobxh6D1CHyb/jIlhPAHWMGJmf2cbowzrDMcSpDMHyYkG40h08oGWnb
	 43o9WPVYOLlhAoiNaJGbAMcYBCqFGMF609drWbY9I/AKA9XHPH8he+s2g8pL3WM2hTHii
	 xeXX6jQshlt95iRa8I0biZlGqHi8l3Ns+ScA7UfFchd3MLojp/j4AqhkC2Ca02SHWnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Lzxl7IrK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3368606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3368606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Lzxl7IrK
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c247f6687dcso660693266b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794846575; cv=none;
        d=google.com; s=arc-20260327;
        b=GQWpbTRnOmqoWhCJ4h9ETVFPgEK/q4hjpqnN4SUsThCnsQB2BrwWnF1AlsbUyeFnwW
         XaImLucUEvQbECqUfZSa6fl0xDDPmZyiDi6uoyQ0KKopUCPnkZJ8ZNPCSVN0VsCLAE93
         K/0v71+ACw7UsS8yP8bym24oFWhdhHErQCYgTUlRcAhj2r6aOtqnRbIB9SyiVsQXhOCP
         xaaBjMcou6kyBBEuLKAJZCGvszbU7Qdm+j44G41aIMjDnxLW1Y4MmTaL7F2O9kHhyvnY
         IUWFayVyn53v70aSqZ2tYIB1/N6B+ooO3OBUSrYm6czHnGK6FX68KgUSYhGoRW1kKirW
         lvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ShKIQFI3uGIhr4DBTVUmVEiZQKVcNYjQ9vNtabc3Rxc=;
        fh=zlw9j6lj3hVzCuwItEx6P0WNK83CKKcOQRJI3Qn0vUo=;
        b=U5RQdZcsYk5ii6dvE/geRzidypvvPiSnuDejCqwpwiRMhpxnic5EeiaepLpgz1UcIx
         LhNrW4oSfu9KH9Lvo222PE3e5LuVDV153KQsffxT2GmrhsUiy/nQB50fIKlZAjholH5c
         69w0b+qH1rKCHm9eTFdnKRSP2GSvepf9VQoHMgpdlFLeAqpBMeWo6dI+d0RWEpPJimfF
         oWBtVW1ZfIvslincxAcSy6XdBOlgKsBmpAOc3jTcMZNcYtC4ST30E7/8dgJ76RlyJ49R
         PMpk+0/HfbpX/0sr3IRDpvHfSt3ZIM4/nIUUjGTG6z3VXFM4kDLdO8rJ7R9lf91hUG8m
         JN1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794846575; x=1795451375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ShKIQFI3uGIhr4DBTVUmVEiZQKVcNYjQ9vNtabc3Rxc=;
        b=Lzxl7IrKBnOjWRIlFbpbgmaOzwb/Tt4Q9mmVoQw5uewTDrJaxojWYhYJQuLAjF4MDg
         0nUjATIixH6tF8AV9p6rvqcdNZOTOKhTL6wCPqWSZCUa0Bue2qr74R0LFBQqS+b2a9ka
         hTlCQNy/cboNjjpygqP1jiyeVlPbqvcvVIC5OPo7uFbKhIQh6aSTzHcSXG/jEHL+Hs6e
         TqkT84cp5v+Q+q14/8HEzfm2p+IQylYQNZ3xASlO2baA8S9NdmR93n5v1IeKptJz97Es
         L6UAB1tmwxlBpg9cfXKQm9cxe4EuvBZTRHtkBz7QJeM0b1r7jzqmEfLUIZTqmvx31tt1
         QqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846575; x=1795451375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShKIQFI3uGIhr4DBTVUmVEiZQKVcNYjQ9vNtabc3Rxc=;
        b=GfokPsw3L+cSjxCwgoq8L0ZeS+O/kDhKV+GA2RdiZNy88fwwuh+/PZ1qbDNmGauhLP
         j/SOTeNE5A+ASnqaDOmn7i2iHhzEMPQgOYG36c1f+mFGrNbARgZ2NvPjwpfTnwdnwhhj
         QzTMX1Z0MyuRW3LgCbR3PhiGpRtrFXqJNBFLRKHSOkKr0mg1XbvOGYUl/q7RxiWa+aN9
         PgVHy1+IfZP7YUP6ZzOe+qbxUfGy+dtcmhZL+bivwJor3KqouhAwNzGGGAHB0ycFJz/L
         WuoO+6AIiS9U0u1J62gkOGVA1L9HMp3eoM5F6c8mfxQ6ms1vkh7zNbkfjLFa17zIEbp9
         nuNg==
X-Forwarded-Encrypted: i=1; AL+hErG7L3lE+peYjjaE1mLFgTFN1snrwlqIdjARldw8k+hvGrTCC1ehSNBk8HSSuZVXq0NamGp6F9Oq1xfEiFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8klvYrckpQzf7IgL7vKOQ8M/4O8CrkDotrSkbzvlu7VpahIybx
	Wbzpyhlvhpf327ZTCjyynyOVXaNStLf0bD/lhk6rHWRGjKRt7OsRCKkYNJ1BHm5jt5oKKxZuOfd
	89ARuzuOqLh4XdvotTDEskGynqDdG2L0dyYyv7uEz
X-Gm-Gg: AYBFou1HPcAGNHc70PJ3Tqe0n8arAjl5hDFKuC0DLlQAR7A8jjxgnJD4edLTlzf/NO4
	mK8wvnkR1JdjC3g79KjXX3Uz85Mv6EtefhGekzEqif1qi8huwWkD85egDkc7wjUz/ekW7jQH7ka
	DRWqd0DT1jf/RJsIE7JRrJDNpuYPWRUyHUKyzqJiTcowHjJy6fvXBZc6RwPVbFmoUqh6WRuNf/L
	T0H1jqgbwcp/yqH0EQ83I5iQJ0nVwgfOMWCPlnakgP19g3Fp645c9KmU4qI3vI+MtQPTFi9kKtH
	hg962qnLPKZqQ7sE0Cu6t5HSCMcyLUz0pqkYsVsSkO/E+kosjAIJZm9ARINcwmND7uPf99Vg5vC
	+FB7VEsUsg7dPoE8bXzNG8La90E3f/bxYe/s3hOTqRMgHkLxb2OwqeRde4Q/eW0hptw7C3XSVH6
	hv22TnTSIg/wGON7chSahGmUVMXC+M9uOsyxgZWUPp8cFLXSXg
X-Received: by 2002:a17:906:ee85:b0:c4d:906:e979 with SMTP id
 a640c23a62f3a-c50961992c5mr881499666b.3.1794846574496; Mon, 16 Nov 2026
 08:29:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <491B482A-8177-447A-8CDB-AF83C13A5DEE@linux.dev>
 <20261021212738.321547-1-jthoughton@google.com> <11457D37-5AF9-46C2-95BC-CAD4B22741A1@linux.dev>
 <7C857138-E17C-40E8-9F72-6FD3E3AB493D@linux.dev>
In-Reply-To: <7C857138-E17C-40E8-9F72-6FD3E3AB493D@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Mon, 16 Nov 2026 08:28:57 -0800
X-Gm-Features: AclHuK-zpZUq8W9nNoH-Fxmelqg6hPrcZtO370EgGILVe_jjsPQzSM8Wu11E_Lw
Message-ID: <CADrL8HUkUJHW0oT+tPhhyYdx+5+boSb8QRk9Bwp4mzVGpgRg0w@mail.gmail.com>
Subject: Re: [PATCH v2 01/20] hugetlb: Don't restore vmemmap of non-HVOed
 folios on bulk restore error
To: Muchun Song <muchun.song@linux.dev>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, 
	David Hildenbrand <david@kernel.org>, fvdl@google.com, linu.cherian@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, mark.rutland@arm.com, nikos.nikoleris@arm.com, 
	osalvador@suse.de, rientjes@google.com, ryan.roberts@arm.com, 
	sunnanyong@huawei.com, will@kernel.org, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 7:46=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
> Hi James,
>
> Could you send it as a separate fix patch so that we could merge it first=
?

Sure! I'll post it today.
