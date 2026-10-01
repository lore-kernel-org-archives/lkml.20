Received: from mail-dy2-f23.google.com (mail-dy2-f23.google.com [74.125.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F099A493D2D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790885725; cv=pass; b=CZFN9ir7ZwrDJ5FrOTK/yNsBznpPb61d3JSMWg/Qj/og0vTEdM0aCyPdrTAKd4Fb9rfpf7HV/loJhTlN4SoRJCIqltQijzC6y0SSULW4iSVn3RhC2BlRCYxekIt6NMrdYGqmbhuc6j93HPXEINM6nAgDnsHR+v1WLD90N7nJKic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790885725; c=relaxed/simple;
	bh=xdsuKJRUPTMCYHnn44lGREsRwQPG7jyNO7dEeNDGY8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CadnvCWXUCMgpuxazlJViKETcIJ6Ec2qvMtDLB2ZEA+F2CnxIdW1/N5A48ZUwJGz/EVtvgl3A2rrBrQqt/1fPMdY9zopzaiUCBpu24BC8rn5/c2+vg222mTK+z+uV00y/VHIWlixOlT7j4wOBdYv6+kIJu+lp00AyU+rUNCw+lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/RD/JB5; arc=pass smtp.client-ip=74.125.229.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/RD/JB5"
Received: by mail-dy2-f23.google.com with SMTP id 5a478bee46e88-32be7127c64so826780eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790885723; cv=none;
        d=google.com; s=arc-20260327;
        b=TzY8DJlgt5B16kKDhD0+vkZKfowEJDyDmzN2WYs6ltSCGi8a466oVtGSF1YH263BqS
         2YgpEQ9OdG5rtxNTknl2dZKVKZPcxAa9ZMj+qPe5GiarJ6ma0K3kqtb2jc+VOJXfz31e
         fcQZeRARkbCbNGvj5pR+QGiS7OiGwAu0ywHgaEnbYKtC7RmHM/7/h3cLiyYw+zUV+mGB
         BoZgi6iraAvhLcdR2882WM46PawkWHGrSHoB7mEbTKlaeFnNKb4Bze1rrMfL3W8uCn7J
         ZZEdLhfnOk9ZDrQAF4E+YYInhHClWr/3tU0MFAmPRaL3PbpPOSUO1BneE85JRfkW4Ajc
         P6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xdsuKJRUPTMCYHnn44lGREsRwQPG7jyNO7dEeNDGY8E=;
        fh=asgO6d1+7QlpRpm1S95u3L5Q5V0JYgRQ8rJR5HnopsQ=;
        b=YMPIBa7QTpYPWpf0XCH1zsCqsQLjBELbQfNSGXQzHxlFYR0j1dU1mnM3sog9v/RvC/
         9jClyolXObBgBaZ7ORuuZGnaLsOhdZ+//9Znply5c1SQ9jgK9c7Zzg7smp5V3QnfehVh
         18ct8/3PpRv9Mu7AY4mr3QMF5qb+emN2EBSPbE9U1F0NFIoIJYEvQd8GpE2CmSskl1By
         +3OHQuKDrjzSgB+IjrrCTQh4VzwMM2NJlKknmRADtnjXcapAlbwbh5JW2ZQ0w+cYSTXn
         KWrRLKvvi7f2bESJxWGwfg/VSGzDMAXSL+qnR9L79szU5EvMCmxOVZCHV6BjbcX1G95j
         XYXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790885723; x=1791490523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xdsuKJRUPTMCYHnn44lGREsRwQPG7jyNO7dEeNDGY8E=;
        b=O/RD/JB5sjvwoLnrSrxhQx2HChO8ZkGmT+DBAaE6QI5RIZjOl5RYbHFxxGtf4TZlGR
         /FsqMAFZ/ByWS7CTjucA9/Y2T+5UbaFJsjSFtmXzEp8CTD9/uoBK0pNY27LAMv1QyuLo
         E1lvi/y0sHrriLZN8x+cAM5IhiWPG4zyP46b+06WrnpkHvz7tOo+Epl8ikzqWjUEXR1L
         a8LLvMwcxeVqBKCe8UQ+st0CUmlz9oWT4P1gVeIKlbERso7WYEmIPMCUpKsyv8I3UD4j
         H7Uwy35LUi2E/wx0oxhgII9h6W9TkzvDVUJisZ456ggmivgoQSlsTOB133d4pG6pfA29
         CWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790885723; x=1791490523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdsuKJRUPTMCYHnn44lGREsRwQPG7jyNO7dEeNDGY8E=;
        b=eluAEepCJCVFkUof050b2u8x75jntOLgrHxVSCcuafc8AsSfE1Ro25t93+5ZEM5yBN
         GOCz5cWXPAsTE3JvvCaW8VI1z+OUafQ0dnbbVe8jbB2+ZDcOQBMcjKKo+mpF0Xy9pBsF
         y5+valPRrQI4i9Tx+u5KiD++y0aNdzDZFsYLCshwWx9V1wskvnia+yfDyOktTo8mVOfp
         sVvt3cq7O3NAqACZ8UFMqe4OaxUhO7wyB9lr1Lx0KcNDylW8T08F3JmDt7RBGDr2rR9W
         +SsibmyJU6lzR1WeV3rgavlTf4Hfl5BebGE1IRcW4tGxo/97JGQhxhng7A4SiT6dhJFp
         rdWw==
X-Forwarded-Encrypted: i=1; AKwUvBwIC6BaCg9YsSFfPYtkEVuqzIxXhROv25rwU0969434eY5evJ4r4rjJ6O1UZ1BNOekPqZ3ZkNDw6QVUsZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDpKfzN/8Oz0+W7VICwKZvQMGU+WIdQzUtLEN4AbFBoDZKp4tc
	97Yj51KElQ1/nvIfB0QvXQoSmtURmaZDJyKCzhNUDXi3OqnARDywSV2T0x/2tqKyikkkdCHAS1F
	o96E61Guhgx0x5/BghSiQw53hUpEAB/o=
X-Gm-Gg: AYBFou09BAvJdKJDi0reW7JHHWbLyVQFk2u+s4eGgV2iAPbyAVVYOXCuTcBLsbOO3YI
	hun/gaHzNKjPS+nxRflBJCdSgEvEQsaZW0gf4595CQw0bO8euiww/U+pJPjRPuLbU3KNUBlNsOl
	74TpYkCEPGtFybMjOEU0L73//3Soa6/hMCQYI0d2EaVaJsJXRfHVYuSmhmJAn0ML4g6QJ/HPlHJ
	sYPmrCUTjhTtu9RcNY3Kviw4XUCiAestdVKfFi2KZRCE5yLvfhB5ErM02OGhGyD2XfcVFyQuPNs
	aiftqVE6wBeca2g3LdE/mUTo9gaJsj44ftnk7pg5hyHZyYUcf6C2aUfrrHgNN0XtUCSbBrbCto/
	CgvFEIzDmOfaxrQ1/R9RMwmV60d3ToHMDO0DxkdFRHzjg9mo73q8Pyo0kh98PciUfCbaLvgz1YD
	jdcdxL3QUH0GV5TuiqAQ1Cvxvo1pDc3bGs4TaIzaq3mmYuR92ZfG8=
X-Received: by 2002:a05:7301:9a83:b0:34c:f181:85e4 with SMTP id
 5a478bee46e88-34f14ffa69cmr713853eec.1.1790885722936; Thu, 01 Oct 2026
 13:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org> <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set> <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
 <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set> <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
In-Reply-To: <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 Oct 2026 22:15:09 +0200
X-Gm-Features: AclHuK_PqTgVixaCB2jBczKY92-k98QEC3Sx8f2chA4JCjVJrl5imL-InuRiNGY
Message-ID: <CANiq72nXsGHbSQ1LfbG1zYaMaZv3X=u0+XzT6vHh=9vxLE8QTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C function
To: Andreas Hindborg <a.hindborg@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Burak Emir <burak.emir@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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

On Wed, Sep 30, 2026 at 1:38=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I can do it.

Actually, `cpumask.c` may be better -- that is where C defines it and
that helper has the right `#include`.

Which in turn makes me wonder if we should also put the Rust one in
`cpumask.rs` instead, rather than `cpu.rs`.

However, we do already have `nr_cpu_ids()` in `cpu.rs`, though, which
is however in `cpumask.h` in C.

What do you think?

Cc'ing cpumask.

Cheers,
Miguel
