Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E450F49503F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817490; cv=pass; b=kgI9tKn10NejFmtz82znle2I9EgkSBPyjrX4sjQGbDpbVFA+0bwbn2anlWJ8cArfLnNnDMB1ifhwlYycwG/IgvCLujAy7QYZFiDgHD4BLcC15ANLcDiPvFxz3j/bxRiUqxeGHjd/QWTOeanZWT8+C0zJMCrcazviIK+gM5h5q9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817490; c=relaxed/simple;
	bh=weLDaF45D5gfbSr+gWQVb1K25MVNkySML0rAhgC7w2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POorDYgKmy5a1VRtXovP51vqLvAd+NkqXyrC2w146H70KRT+8XRiOZJVOIWaY1c8lIAnmIdY/U5BTTgaTIaVBNiIakwsLqGFwvCvprLjvG3ItGCtoisf8Ys+DZz6eQyCsFq2PXN8dyqozBBlBVgTaM3Zl7RCv7wrLB/pCKlOB/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2cJcnjo; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2cJcnjo"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33c30fcf33fso262465eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791817489; cv=none;
        d=google.com; s=arc-20260327;
        b=GQY9IF4yza1VWVsMvuxYtyMWhprdlqFoIGhrcloF+vc8lDeeXfh8TGfRSYk16ccvlg
         +4Ibp7A3bEy4wjmxzlFGYLnP0/G5M9pwT7HFv+5WjS32uT4uRFHNUc4jpu3SOGR4XbJd
         qwNpZm07fFW+wyg86mxiLR4oNpMVeg6rl923qaxjgV2kVTwzI+09/jcJWSj7hs0F3fYe
         xZDAeVMOby9m9xGhsBH+H+1TDCc6D0pdpyq5BgVZua+HW2HFPE+/acg/TvH6HS23qWhT
         x9T+XbMCftJ+lFlf/Z9C/xxyZkyUmSgY/UW0MJeSlyJE9a87HCFH/Afu4Wh4fXgMVept
         8QaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=weLDaF45D5gfbSr+gWQVb1K25MVNkySML0rAhgC7w2M=;
        fh=H4aFUEw8gxbp606jkVwN2z43eefzbQJhStJsA4APXLQ=;
        b=bDid8MK4v9aU9lbO+ebPmqtWvSMAEKihAygTXBv1eHWmqQ1HNVJcRBsSqBhxI9q13g
         2/tRZVEs56ZhIuetzRErU43b6uwnBE7PvOh7o9D16DOp1EcBkhFpv/YiIlMDQuAOrOLx
         mgjyLmx9NKlxBI7oWtCgqmzsPnV2CFPma/8EwPwfOzYvTKlVwqsBzBpw9QPFPSka48YZ
         rpWplS9kjktIfAzqWTjPDaVk1ErBhUS7yM48iKsAQ2K5Y27ZF2e3BSV14aurxKx9Zsvm
         Um7JEDtlHdfkezzwtCzxuumtnS4b5FAvxIqsNc9gRXIcqB/ZkTDOc1bZKohSDKbTIUax
         2+DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791817489; x=1792422289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=weLDaF45D5gfbSr+gWQVb1K25MVNkySML0rAhgC7w2M=;
        b=h2cJcnjoK7KPnNOYtTw8p9ogrjKw/aAYzRzXqarHkUxgkShk3UOD1BOvEKTUmvKo/p
         Z0WtF4EJyN//37B69pbySmNmn+xEPLzVLD/kckHT2+pc+iGYmQizTLW6BdGxNOX8+Kp3
         TTOHHTD/zvZq2/fUWqlDy8hUqBA9tDm97Js9V5B1ndQfOfpscPVrUIhPAUas0GD73wbO
         a2CWIsqBVmlsQZiHsgDDB3jvKVx+ehT/gQtj3KrWzlk82mcplXnurc4o6h7cKSiQn7Iu
         lraaZ2cdXktMWNVSUSOTMKipzO/XRnBcDgpGsf28DqW2Af6rkaZCSj/92RLkNF1x9e1r
         5v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817489; x=1792422289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weLDaF45D5gfbSr+gWQVb1K25MVNkySML0rAhgC7w2M=;
        b=nJ6sB+gAJ6szufVrK2MGLGcJdO9mXCUCNWuXWFu0g1A2HCepM1F1ourD4YZAhLp995
         QlHgkAVBzPOeXEaUwWTMByuwGQqO2bzuXmCqgdEZgV7RuwPTZ/n5kUk6KqH8mLFP84ol
         JNOghlg8BAEk4dPxqtBlADNkLM5e82+HkrBo+Js/14+CZIiotiuJ3yhc9OcELAtxkwNK
         N6E5MR8SoNWRf9vYSiCkixsnORHcZMkyD7hFF+2urx7UgEdlWCcH5tLCDwVWL2QhVVit
         lsXA0/5Zfdqmos51TR4kQI+RI23Qq14FuCwPcJM/2564fuJKzc29ecf9INFBO3roe9dy
         hvZg==
X-Forwarded-Encrypted: i=1; AKwUvBzLJS9pdKRalp30YjpXbaSsZTFLqPvmiZOL5Mk4/oYR8l8GfSf0xhqwkebHE1KHutCCIpYjIxTeyk2k9ks=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4wNIfOxWA2BBJRw9Ik0/LUyzOzaKxH99pLM+V3DSbRdtw4wey
	yTZp3iRQ+PV9arkshbv22NjyhLTxHJZXiqc+bVG5K0sV18JOVnispw6xSI/PoUEPW6wK0lHL11l
	IcXErd/7I227qL5zb07dBKa+idwGsDX0=
X-Gm-Gg: AYBFou3GinJNmzwwpSwm6h4nPvtsloSeHvF3dI7IMQkn53x2kvB/nwnfi5SZ5Zli8AS
	uvFzT2+k9IuviZqwBaf1mwnD4ru6T4uiEiGZaRXv0oyOUcctQScIo2TpPR9xicKjR+ZFou22rXF
	11Td+dpqKIFSjhuGrJTB9vrve6f3p9rB0l/G4QSCuFQplohTsBTjtGrfqavcIl76q5IQMQxwxNC
	r7KfWQ7WBL9HAYZfzQwtDNF3M65J2BMcXAopvMR+PtJt3qfx/PSjODZrDgPE/XJKua39mvjLKr8
	Bp9jvCvxUFinSxy7Jmqer5Re/FCpMPv7OjfGAQMEoJ6ya+rtqYoX22YlBYjtNUGCJvHO2vMnZFJ
	MeYOK5+Tl74rZKJNDklOY2EyBooOfPJ5yQ5urCtIlug6TBrFkBIuzcLtzplTbkSX4+CFPC0MNVb
	V0+gpxzL2uXIcI8MvzR0zoHX/xELkRncf0dovnXKF+OMA1b9Sx0to=
X-Received: by 2002:a05:693c:8810:20b0:35b:cb5b:c71e with SMTP id
 5a478bee46e88-35bcb6b1c6cmr1408019eec.1.1791817488630; Mon, 12 Oct 2026
 08:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org> <20260929-cpu-helpers-v3-2-e968ce5ee613@kernel.org>
In-Reply-To: <20260929-cpu-helpers-v3-2-e968ce5ee613@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 17:04:35 +0200
X-Gm-Features: AclHuK9wzT4BzJuJCArQ1hZV1Y7wL2rurxN8icBv3GPL7rh5gvUSjCGJZPgPXPU
Message-ID: <CANiq72moeX-F-XkOWewwSEJHX6F5j+7NxNis7qhPU4aDOFRRpA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] rust: add a wrapper for the `nr_online_nodes` C function
To: Andreas Hindborg <a.hindborg@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 7:58=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> +//! NUMA topology utilities.
> +//!
> +//! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemas=
k.h)

Cc'ing Yury and Rasmus since it refers to this file.

`page_alloc.c` also has the definition of the variable in the
`MAX_NUMNODES > 1` case, so I guess the MM page alloc folks should
also be Cc'd -- doing it too here.

In any case, I am happy to pick this one up if they are OK with it.

Thanks!

Cheers,
Miguel
