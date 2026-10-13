Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A6D52188F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912475; cv=pass; b=n0k0y/6sJ12EAIMsSiC+Sea+dsza4w075NexECCyWJUMvRDUSoeSQXubBF48jAuSGf5tsTOsBKl9A4vQv73DbSqYVA9CGzAJ+Ze+k7EoBIAwK6YuvdwAcZrQ6PyB2mizlZiL1F+CsAbusRWtmaUfw9s2a99YlAwE6Jq1e+WtN7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912475; c=relaxed/simple;
	bh=ilrrrujzuhZYUhDmuASneSYXMHWG0KPeilbvwSqwrVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lA9UndPWdQzpO13CNfBgcvQlQ3Xh2MhmXqDZKG9yP3X+kqDDhrt0O8YjrrUt0WshQKzCgg/7+Rjg+IcvYtLse7yZYbJIaP5ezGCwb0dmbIR1P8KjvZatXUGX96WdG2HPU86g+A6oEFiwtWIB6ayPc8PStdclhFOMwswwf1Yw4Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azDQ7a8S; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azDQ7a8S"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-34c522572bfso389957eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791912473; cv=none;
        d=google.com; s=arc-20260327;
        b=N9Dp7EU9c7WnCwZsjSwXM1YFGUWsxGSolD1eu8zVLeOOA5KZct5dMdgn5PCMeJwSGM
         7GXqjEaaTWRow6raXfUyezdgJczTaKnlG9JpmJ1jmD4A8Fz6/ECvsSMWYdLB4ar0Sl27
         EYRiRLiSP143SPZpLGZwDNs3nloIn1RmK870SGCuxz5ksSPMFv0UlUl3OhqRHupdvqlf
         OHs6/dQqOhiEozZD1PPDT4HfGQT4dY6PJ2qMuvvp+YxIjZr8MxJ4hh4zxG6uKG6BHxeo
         1BsjYYIwVpicknSQe5Y5GH/6DzDC9xC69bRCsY+AshI1Ow4YRdh9Tw54gpFMhbsGEwkG
         F/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ilrrrujzuhZYUhDmuASneSYXMHWG0KPeilbvwSqwrVE=;
        fh=7QuxuNLBj4SrYjL/8tWXoWz9saMZaKA7cTweMyrWfMQ=;
        b=df07EXRxDNPMwnI7BNHyLW5IV++FbNIzzc2Mbe6lj8wLx6up4RYeL4/67luwluQEbB
         MBOkLr1F75aXzgKWfjuLk3FtrRq9V/MEN1fknLjhLpqgQn+KcVPZj0tnBRFUUUUmsvoj
         LvAFbW9jfQNUC1fkGad4OHHJKtqHuAFzIudnBl3Uhzkk/VQ4wzTXt472iprwPehFtC5L
         9u670QouffRCY7DG+IWIcHnyXbcnVw+HvsN1aSzvEgNe4Y4wAmRq2eyOOY65496KM70O
         Z+po7ejbLlzTVhHlNDztmye/bYUYpUiO5Qi03hwawjeD8ecmk1g/ejsp0OEKk3mhvQ50
         9YiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912473; x=1792517273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ilrrrujzuhZYUhDmuASneSYXMHWG0KPeilbvwSqwrVE=;
        b=azDQ7a8Sa3twMNqZ8czmJdtWD1HR0weirSAFSvHzEbBpc8M+Rc2WI5pXWiYE7VOXYS
         Kg+YbuMtyUfZTnFNGXEgUm5tkeVkHOKbXGYZwldUZPcyMfNzM3L5VefwAqhIBx7XH7m5
         mdIYom8LmiZU61JB8LqWaMK2S/enl94/IS8HykPaLE1Y+cMNkBEm3DIJLmCCsQ17LfdS
         N1QFx4RO6tNjCtUPCh0mmENBgftZSED/UHrRpl9F63U59cIgCM8dttNdjzoKpa0Qk4rG
         aILsxcV45Svy7Ne7u/3zyfJcwsJa9OzioNrAS3fV8IhwrzEZ1IH6BqccJp2QMkq0ZWkI
         b+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912473; x=1792517273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilrrrujzuhZYUhDmuASneSYXMHWG0KPeilbvwSqwrVE=;
        b=opYLvBDB31eDm5xcr6BjVIzxNu7RKr8lbszG4zWbEuLfXjtUgK50u7ZOA1m6a7AqFu
         akUliJFYvA48/xnW0STne2TBNy4gXZWTwJwQH+G4G4zdSzFYwulSbdfetl5kc0BXdg0a
         /lD/ZgvAfFDNDDzC81N6j3EmDAr0f0VJ1GLIFryBzQGribcFz8gCY5JBHj7dCeBbJNH2
         YxEE6b96mgre9ppIRqLx/oSFLFiQGZE0QJmg+kLBK/YrBpTH/zzPH27u8EQrhXPRqCxh
         /db7WIkEyTJGwcmU0UkXeBEw4NXdz6YrlZdJ7aRY5Rd/ITgPrLpSqmiHxkN3JbTDkIrT
         L/OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTbq0Ujg4RWfK69o2gwRCHAUrH3AlE2ml2mULSrLjyQ2HdekZQlyDdXYABi358O7ElinU5r732HnS4YKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQiik+rsLv0nVTOzmoRn2x8Th77hvsO1zhHf9Aj2lIa37qyCTp
	WlNZ7LLDX2sfUrWrACJs7ruvOalHNvfWdH6zwA7gTBx6XdkfmAW6Y3aTTGskgVPnwI5IW64lAv/
	csKNe9Huk6GVLOsvzRlTxU2EopYWyg9U=
X-Gm-Gg: AYBFou0muadZU92+afYFiSgE5xZqGQeNt8uzgwna19sYyvOk+dtF7rVyROJ6wdQ3wxW
	dDJLrD3QmwlWMmRujVTSbvf5Atu/XLBv1AjHHeQJNSXOH/Y183jQK816ntqqI7mIYQC9bve65GS
	VEE3HWZxssWdgLL2Hp6BIRFDDDaQIotW+iCSc8XehFOrVKsuxSinCuCN8ntF7supDqbOAb28rTG
	iInS4zogb7ieGS+UoYjHdreKhSSZquRBWIkmg0euU+4DETsSMFJCHKLGE9F4L4B6kYM1h+4HNLQ
	HHE1MtlevSxf3YFfIrPIj1MQfTCqNBzAvbA5cCIx05EMokSqw4QaF68zRy0zWyb/zHrC0rOWqcu
	r/twgTV1cMs28Lt6DoDrAEDkKWAt6G1tYQrQU8xxCb5PZhb9R18Xe2Im+XTUgvR/sV0Yd6tRgIQ
	sESncb5DZ1V6keQko2rBmyGrFy7y5yOtXQQx8CPcA7Hoh8H1XqODA=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr22256497eec.1.1791912472660; Tue, 13 Oct 2026
 10:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
 <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set> <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
 <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set> <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
 <TlsfpzyqG6QHcTMb-dOQPUP6uXU2G9urfH8AK0nzNO3j5rY0QWjn2ni9zhJ41CpVeppXhpH2E_yJ3LgUTibqbA==@protonmail.internalid>
 <CANiq72nXsGHbSQ1LfbG1zYaMaZv3X=u0+XzT6vHh=9vxLE8QTg@mail.gmail.com>
 <87qzi8a4ds.fsf@t14s.mail-host-address-is-not-set> <CANiq72=j1nD6Qy9qKwNKjBw1gc8RPr8CmXKXSSNBp7mARv48VQ@mail.gmail.com>
 <N2kT-hptgLwPihxLElO65tqya2Wmnmv46TH2XIDsL2pggz0Ezs4mqNk2iHWS1zdaCIlPncbX20HMJuQ-Blrbmw==@protonmail.internalid>
 <asz-GkGHJYHdhDLr@yury> <87jynmcbb9.fsf@kernel.org>
In-Reply-To: <87jynmcbb9.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 19:27:39 +0200
X-Gm-Features: AclHuK_xYIAnmzYyuYJ5rCjlX6KfUWsXYacvmnfM52-EPolRLAsEIzx29APArHo
Message-ID: <CANiq72naeMk9tUq84ynuf=yJOLQtZYixw2T5AS7TCmESsvp_-w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C function
To: Andreas Hindborg <a.hindborg@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Burak Emir <burak.emir@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:24=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Ok, thanks.
>
> @Miguel, feel free to make these changes as you apply. Otherwise I'll
> send v4 next cycle.

I think at least for this one (#1) it is best to have a v4 so that it
is clear to everyone what we agree to finally, and there is no rush.

For #2, I guess Yury or I could take it already. Yury said he would
perhaps take them (not sure if the Reviewed-by was so that I take it
or as a self-review, Yury? Thanks for taking a look at Andreas'
patches, by the way!)

Cheers,
Miguel
