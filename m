Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700897;
	b=WFQUm5ArwRwq0pfmSkrKv8iwDghZkOvVhZGDfm/NrPTSNMIIcsM+pvxjr7YU/dAFXxz1
	 I0n8ZoXfQMSOnVxLsYHiFEfzJKQ93GtUh1cwbnyROJYB5fzpM7r5UhcvXRs2GqumfuV0I
	 d8a3eywf+pKlHPH9MVTX7NCcKyV7ZrgGuRdw/iqdBN4prVz/islOIXyTqb76FSHQ33h6x
	 os/ApsIF7mXm65wHo63eA+YYCgJCgQvvrTicuj+Lccmj3c1CJJAF1osvTFwotG3wbU03p
	 brEz61yAzuuwXZDFUdW5tsrY2Aar8jwvr1e4y2xNKdOeCkHlkbcKLtFVNgCAucFEcsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700897;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jqwECtvJ6u0WXCetJHRwIFMx9iKDN0fT5jXgsr5loWQ=;
	b=n4GnxaIJnWpH4/w9ufyVKlGanZW+3Im+5N140/hnIZgvxa//jMOvgeMpDov1NPAr70kX
	 W+kwGvXIO5LpgZZPdoW07mrrkTJJ/7XOXbcwW/PQI1qNApu8cAx0LCuDieC+/9jO1wPSm
	 0bx0P5VTJK2PFCw04DsESimLiRkDUHguHeyBtWq8FyMdN+vmKfz9OWrleCVA8NHEmMw7c
	 Un54vbesxG3gEeG3bVO+df1HRdtVTAwOMjv2yNuphHZ6SF/RF0rx6r0ks0itPQgpgGYyr
	 cTnQ6YDohWoplP2m6kpsyEdJPsxu20besHTkUoUOZ5Mg8NxA2aRsTwPH0lH2s/jEQzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARtF1On4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E193A606BFAF
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARtF1On4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5981F00ADC
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793700896;
	bh=jqwECtvJ6u0WXCetJHRwIFMx9iKDN0fT5jXgsr5loWQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ARtF1On4Y3++hq+BvsbtHb9HfZ2OJj6B/TvjM1lge8G9PyPscyMjkYiubFnS5tI9S
	 Xr03vbGBjVYXG+7PnPlB62hQRupMEEiHFSXEyfyBPlo+KJyQbj5Z+XtptO8OV1t7xB
	 0qHgmAuRpmxZAC7d/NrggXosVlnpk1fwAhZmo8pqDu5cu0sA1Cj42GM3c/ONn7F7xQ
	 8gMSFdXiGrl1nMPgI0CPsFQLVfK7vc1B4Llq4bTgArgSYDaQOtuPm/jU5brdnN+NU2
	 1rG+zZrVX/XiRfuUYwf9AuAEVYgERIkMruNtEV+UBO/CiMy0J1JFAUcJWz6TzxBQYK
	 c1XEHAhwQDkTA==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e7ad9f78dso505105885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:14:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByBPEmmGju5qFPMVq4eKl1lCzFJCPKtOjwGQ6cjFGo/FE/XYVw5ADSc3U8ADxU6o8BQG4rAkBvffxI70O4=@vger.kernel.org
X-Gm-Message-State: APuU4Z85ukh/oH/bY5wmpsf6s0MG+fXVvNqYWEKMml6AlpxF2oDXsb1l
	t14RDnAfHgkZYNRj/tMrG3qwkWrxFhxfu20XEsKwdADsWJTOPHKPSLdcKh2hj0Nesl7Mx1cJdNF
	U3JPlLLnWc2xnqDGUkfnVtvcFOYNfRRQ=
X-Received: by 2002:a05:620a:8395:b0:93e:ce12:aadd with SMTP id
 af79cd13be357-944217b270bmr1858889885a.58.1793700896121; Tue, 03 Nov 2026
 02:14:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012205447.2717801-1-max.kellermann@ionos.com>
 <20261012205447.2717801-3-max.kellermann@ionos.com> <CAGsJ_4zQh9HrvgaqD32_A=bSdqmPqP4oV_SxMXMEDBrHe4jjhg@mail.gmail.com>
 <CAKPOu+_coR4Z=cbsWOG6zgbSWGvmp4=9=uUphkC3TWTTGn0Pqw@mail.gmail.com>
In-Reply-To: <CAKPOu+_coR4Z=cbsWOG6zgbSWGvmp4=9=uUphkC3TWTTGn0Pqw@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 3 Nov 2026 18:14:45 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zOnfjsM_jR-hdeH4YwqKgRYNwj5pv8sFJz-0sJQqojEg@mail.gmail.com>
X-Gm-Features: AclHuK_R4FODI0ZSMjhFi0nwMKEXiaxVpKfhugt2bmG4DXnFW2ixLEichw0jm98
Message-ID: <CAGsJ_4zOnfjsM_jR-hdeH4YwqKgRYNwj5pv8sFJz-0sJQqojEg@mail.gmail.com>
Subject: Re: [PATCH 2/5] mm/vmscan: move code to lru_gen_{add,del}_memcg()
To: Max Kellermann <max.kellermann@ionos.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 4:27=E2=80=AFPM Max Kellermann <max.kellermann@ionos=
.com> wrote:
>
> On Sun, Nov 1, 2026 at 10:03=E2=80=AFPM Barry Song <baohua@kernel.org> wr=
ote:
> > T.J. series[1] removed MEMCG_LRU_OLD, i guess you will need some rebase=
.
>
> Aye, will do if you decide the series is worth merging.
>

Having to find the TAIL seems quite inefficient.
I don't see why we shouldn't use your approach.

Best,
Barry
