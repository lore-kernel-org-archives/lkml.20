Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FEC5505DA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932399; cv=pass; b=l2wn3l7VIqg7W5gVwJFiLcVRELAO0sD18ImEp8N8lxrwpsEcT8P7OZaUJLhKk/nfjuMZABvhYEopEbIjNnLhjCOEhkcTd8Ka7EsE6U/yA2ZmK/q+QHVmbWhoAN8OsrW1TP+20NYbNZ3fCBSlIooZAm/u4LhLnjYTD29efiJwceE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932399; c=relaxed/simple;
	bh=xY5cGd/OUwl4SOwi9wDO6hb1GlEWV5WxOS49wEMl6ZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWyfLZqIYN0eSMpukt2bZRDjKFprQwi8rgvhb3TmDAVXzeYKSL0fSxjmnHvH7IDXHhPNGU0t0aPHAf0ifZbqe2WdVgfa3jZFMAEtNU1JFeLVeE6PJot4n1VUUMhp+rjzv1Xv3WWkjHSh48DWZwU3c6Pflp3a7FXUBiqysHjPQx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SZBEnQUB; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SZBEnQUB"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so965701cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791932397; cv=none;
        d=google.com; s=arc-20260327;
        b=stLYScp5aiHesE01OUONa/7VX+UJY6gF5u6WJSX0GbLIpRrm0S7syW9f2plF95p+hm
         8ufdPjZccAb33/s9e0KP7+7uE8UWGYW32m3JI8UdwzdwrErJoYLJzbw8lMGo5iyOXU3B
         NpYghtoOVliLskhWw0mu6oqeBxDx0QjFRdQnkCRz2htoC2HXFPGfYMCakF8X+xLI7IZ0
         ROw254nJBwkCzMkVhbDOBinmjzqXFViSaslLXXg7ScLzMwojwguBw5aojs+iZOCnVl/v
         wCCau+fSFJPo7L8Tqc0zuurjm4ffMVEMPqXcDy5B6bEJbxsob7xBLYkl99Q6XEOQI+Ws
         U9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xY5cGd/OUwl4SOwi9wDO6hb1GlEWV5WxOS49wEMl6ZA=;
        fh=UuIlkVT2VXOJu0edIE3Vln6rw/hfHhjkrjaOuaXjRmU=;
        b=Bh9E34sFh+OFn4CjZLP2wdybe7MSRwQZGS65V0Hn2D6JX2jeyZo018JWDR6z2VCEal
         hmV7Dm96ayGdlkoM3F8WH3epRWoCqiatcRu5F0IqSGMdfH9XsESM4iPhvykqKy4eDZCg
         cKaVwKallJLbQNbfgVZy+JOYZRMdRg2YqRv4QTTSgK7SHhhWui+91jAanVI1fwKES4u/
         9+u6iI/GLPCe0l5FkvlvUaM+RCSXkRBzw47WTZbs1KFRHfXDfZKIpCi0KhLan4wxOsEj
         PXpBfFFmqW/ASnJRSx1HFhTLVdGUJw8fzot5dWwKjxCZXxsphbccFXFlzY7/kbCuGh72
         ysGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791932397; x=1792537197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xY5cGd/OUwl4SOwi9wDO6hb1GlEWV5WxOS49wEMl6ZA=;
        b=SZBEnQUB9/pOADsCdI0j71YvTlzwiYnRIqKl3syiPHqGWmJ2547U7M2SL8FYKs1M/9
         fK7C5Ae2LcyUQxWGAVybLJptgmD104b4YFm5jPCfgzYo5zJbWhGR7ObXN2aPusl6fgM9
         1gw0a6MiuFOH2Jx0uMM3fY9Oh2EfM4BO8o+HErPUnZQZ0K5EGwVVVVHCtcJGdT9HA2qp
         dUtfbAsnIjKwAV/1hnjXS6dLGWgeUATzH3iIw0AAUNqSluQFFK8b+GZ2/mGuFtpS7RNb
         0zIrs6d8oqWPuyQSqlHzX5W87Ij8psxN1MScuX2XdJek8y6u3QC+wNUlHOhfyBfidlSq
         uulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791932397; x=1792537197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xY5cGd/OUwl4SOwi9wDO6hb1GlEWV5WxOS49wEMl6ZA=;
        b=NWeaC/j/vIfbN+0bH2nXknjSGal15o52DufrpIi8PmXGvKUqGzKQt4I+7OZCCZ0htG
         uqOfrBInDFxTLKZ8yBqXqPiaJs4OlvLHSE50jBc5s6VOkqQBnK+XJb3oF4gZ7waJNY9j
         NfG2cuEQ3oFnJlOo6mJhMQaDA0aOimYLnlyGniX9pbyzIvvq+ZMEb/VI4CmgI6GPjwck
         XL/EDJ4rzDUrql1kxlXAKcjDutymtz/UF5p5yU1Vx72lNybVcJhL5zaxQIggAZpOl6MH
         Sain8lA/H37sqtWirVpTR5F8/GUPGYim4NL7TUi1jlGKB+RMfaliqQhSmT59X72Zvm2X
         jx0Q==
X-Forwarded-Encrypted: i=1; AKwUvByCcKgwcAs+c2NBDOybdLjnpLnsvn/tFhSBYTYBkMUiy2MLrfvKQ6IE7SPB96x/8VoKapBQ7AsgbDNfDDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCZjxdfd+IvmQfZLVgHec2rM4yS9JDROFjKMoJPghqoFot43A1
	RYZAL9tH8ywBYR327UlTjSRQmgu588l0ipq2QLaovjjw0ML4dI3bJcqnODo6N9xXZSuO5iiAghX
	PiEqG52aG5Biebu2r/pHBv+JuHq7MTn9JuF0Qbcd5
X-Gm-Gg: AYBFou0kIeISsdY0Xd3UItcz8u+4XvNq243eCs/uC7/sUiliB0tcCeZUjkB59NMvYIB
	VrM6YRPwlS76HYieeaonp5qa3AjaAtHfCowap0TVRmBHsBKXtf+MeEUmDeaxxphH18JkxqAFGh3
	njMNVrgJI9yBO29+WkaIm7zii+vjiML7/X5JW59AXknnmPVr5NNuM0Gpz0h8P10cx5veRS2BDhl
	LqKABXjqFRHvBXtbAd5eDJJLw9796EBxYKwO3QE/TUrYS4XCwqhucYXEPzSZEbPrulDD6kLAS07
	qdZ+KuuaLzC7te26PcnH3UsHVLjQ7nGddte0Y8Hq0KxxUf2ImzRcsYmXGyRm2XQFxYC3ailjbTY
	19IXPougV
X-Received: by 2002:ac8:5c8d:0:b0:532:9003:35b1 with SMTP id
 d75a77b69052e-536029187b3mr1791311cf.2.1791932395941; Tue, 13 Oct 2026
 15:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013182458.1234616-2-irogers@google.com>
 <871bf440-5b43-4d63-83f8-15ba96719fa6@acm.org> <fb2f83ea-cbe4-40a2-bbb3-bf2884ad8e05@acm.org>
In-Reply-To: <fb2f83ea-cbe4-40a2-bbb3-bf2884ad8e05@acm.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Oct 2026 15:59:44 -0700
X-Gm-Features: AclHuK-lBc-qQ1WS9bs-jEpVE3FRQf-vRMZYUNnHNAOM6niBmkWu-IQ6L4u5gR0
Message-ID: <CAP-5=fW0eOoWmN7kRUhCOVKvYsGs1fvqC746_HVa41MzjcOs-Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] compiler-context-analysis: Avoid unused
 parameter warning in _context_unsafe_alias()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:47=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 10/13/26 12:44 PM, Bart Van Assche wrote:
> > On 10/13/26 11:24 AM, Ian Rogers wrote:
> >> Assisted-by: Antigravity:gemini-3.1-pro
> >
> > I think this should be changed into Gemini 3.1 Pro. I don't think that
> > the "Antigravity" part should occur in the Assisted-by tag.
>
> Has this feedback been noticed?

It was noticed but it was clearly wrong. The assisted-by line was
expected to be AGENT_NAME:MODEL_VERSION but in:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/D=
ocumentation/process/coding-assistants.rst?id=3D816d9992d9ed434ec52cfbd6308=
0d518e535a41b
it is now requested to just put LLM. I can update this in v3.

Thanks,
Ian

> Bart.
