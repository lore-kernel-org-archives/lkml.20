Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBE72FE074
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791956343; cv=pass; b=FqYBlPPXTcRKU4hinv40OWYT077YqeLtsS5FDLRlt1rHHv1Dh2dzTcdU9qRfONpuaQHRK5jHXwLQLh657ixDwLseF0ZIdOqcwSahEuYj3Gk9OUWxenB8Qr14FpGXKv69gXwr3QdWV0jTGW8T8LvU62ooOmkNFQM6bzqAqzBh4Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791956343; c=relaxed/simple;
	bh=sQnTAsWHq4+55jfadbIHEQA+SgOqiqsLpP2v7YshXgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUrAvqGUbhpmiYllkvlAT/4rvPdyenqrTYGg02Ojuaf5aFXRtwk0oNcBNJAlhYBS6uUezvCrKf71QrXketqn1ebeJ71PyhFpJkSJsn6GPEItyMBbuhWNjIjvqqxn3RAMIxNWe1jJodEbLIjEx4p7b4c76pRN5u5wB36TYxVxNpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AUt9BX+F; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AUt9BX+F"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35d0be18c71so514138eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791956341; cv=none;
        d=google.com; s=arc-20260327;
        b=qsUyuTt4oFABdU+BXtjcfA7Ea93Dj8JzckI2b1/5pzeFknz9mp8Zpz/svLLa9PEDqS
         NglS2CltEFZm+zKTgVO5SWJWvK9h/sDuuQXF6N82X51lGUxC9Zl7YM3Up2LJYxbM4xdv
         8UfOAUxtSfg1jUdu2wjCJXiI4RVZ08p39FI8ixzsmQ0lSuQ5dZgJTIzUamhRjCLbbekC
         bh9R201teS0GF0QSp/PRmqvpjKw4rYdU2A31ILO8gr4My5fygMgxYtRtwYfyCl67/3t6
         EBXIAAfdmL3L6G3Dcl7eACnz9FVciaIzLqvNlCT3D6Di4bLZoPj7f2xWxJzW39XtwHtQ
         oIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x6VJRMtY6hAHANq9F08XUEKM+7gNdB2F6gizUc3NuJ0=;
        fh=JnZtQWqR1FiS7wVMr+MBzWltvQvzMP+Si8PfPQXGHAg=;
        b=hxJsFYbn7O0anFMiCjciSIXd19wvvTth2Xx6iJ8fUSnB86W+WbHTx6codZ8QgIXpcu
         d7y+S6B5kcVPwEwm/eH13qXg3Usrgy3SOEZMeZJVpn7XnEIl2A0HawT50noMbDi1CvFG
         s0+O1TpTp05/Yj7/XZ11mLdST7dWjPifFD1655Hx3Yeufr3fpdw5VivXtzjW2doYo2Mk
         IcaAYz0fKMW9ILz0OFAXptpPSehB+zXnlUtsVEgEBvu9E41KZebiwYM1hlxRwTwGxrxF
         aSPzr4y88dQbS8nPmekzuUtm1OKAuH7B8Gr9/EgcS4oh7NStzWSp4I1+Kh3389VqrVG1
         62wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791956341; x=1792561141; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6VJRMtY6hAHANq9F08XUEKM+7gNdB2F6gizUc3NuJ0=;
        b=AUt9BX+F4pwLcSsUuOXT+0bvdCx5qVwz+nb9q+U9AmGIhxDBXAkwvtzOttvxinJdYe
         ++rFN8aq4CX4s2C9UozB1OOH4oBh6rmWripwRj/igDF5GZDgmmCCmqhUrurn7jsgGvQt
         ZdCj+oMy/x02IxMD3fEantnHg5BtWJ3YWYF882n79PUX0oIpvCsiWSCN1wrGdCwJNfmF
         644a5QIf//KQKOl6TMI1E2grrZv3kcLzBXx4VF89BaQL1xT6yJ3jqbBycxFOXt7G8TFb
         UjsODva+gJ2uj2M+VxafaDsVo1G3Z1tRcuror1UmhNzVh2IyLqGYcDwhtVIA/Z2l7dus
         ESgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791956341; x=1792561141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x6VJRMtY6hAHANq9F08XUEKM+7gNdB2F6gizUc3NuJ0=;
        b=c0W365MzSWY3ts/N+A7KsAeQSI7olPAu0HbClwfIFjjXNv9TCgoKepzJZ4tgoV2Nuy
         RJZ8zOfWTnyKN6aLBVxmnbSAdah9Pm9iXDneNSoEPdXkW4GCEcxMye6TWLQGC4Wvda2O
         9PFqnE0+h7Nrq0NzmfuUtwjY9wgQuKZl2r9vXyExZjiVv8ABXBHyP4qvT/IgX8+rXuE7
         sIwOnx1j1esv6mhF0RN0kLz8Suc/u9g445j5HsUXKjKRabDMG8GhY/sck+3Fd0y90Htz
         3kSi3ZIDewrUrEiRaoqXhalCOk2gAqoc+iH71+E3WBoYs7PtO0flgGiGdtnFkdA2U5do
         /ZWw==
X-Forwarded-Encrypted: i=1; AKwUvBxmgkf5sKq13ciXHHZgiw+5+x12xGMCtC3skprLp7eBj2Ja7W1I9yHqmUVssj6Z4jXmpLuiSQNMAgNKwQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmsgbrSpnjVoRjR5vcrUmD1Lij4mW4xCCRot78QvH5v16Rx7l7
	sAT2ojtf2oy6vhWI/yMcX8v8jXyjIqYVl453RLBNmC84dCKIo9k3vhDxuz3+PB+c2n8wmcoVVvL
	pelWjlEkOEFzeKOTbb7HZYDWpnzTczXA8RIWBjUfK
X-Gm-Gg: AYBFou1oM9NKVJrMQ7zr2BVL5LeUwk/Zmx8cmtss81X6SuF7m7OW9hJQ2c5gOIYv5qj
	Sid9Fm0CToLTRaZsZj1sa4RyuRrWcznSLlkJBfEk66nb7G7nLupWCYN6kkVkmMRwObFo5bB1agT
	FTpC+SImyX0k/cXwBjQ2/UVDPHbeRfGlm83qwWUiOEtv9l9Jg0/h6l14qQkJVhPNY48NNyM84eU
	C+WVq4CrI/8jFdZMxD0JoUJoMqL4FUJOhDGDKF/iN3mi4czDG42ikgyF7Fmo9T6Qf86dDvN86AX
	1I6Y2axCbOvT+p9g0YPDqRs4KwoOuyR3S3pH61rr3Q8p23iw/3uT1hJlhoqL7fbVlhsYoZlwJgc
	EaMg9+MwOK2Y=
X-Received: by 2002:a05:701b:280e:b0:13c:d071:f97c with SMTP id
 a92af1059eb24-16a5b97ae60mr20506478c88.11.1791956340159; Tue, 13 Oct 2026
 22:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013222622.1822619-1-irogers@google.com>
 <20261013222622.1822619-2-irogers@google.com>
In-Reply-To: <20261013222622.1822619-2-irogers@google.com>
From: Marco Elver <elver@google.com>
Date: Wed, 14 Oct 2026 07:38:23 +0200
X-Gm-Features: AclHuK-RqXDABlGb5HhgbEpeIBMyScVO6dFeQyQpd9-tIjzH7Wv_4SxQF0fb1yA
Message-ID: <CANpmjNP=4T4pRpoiW_Y442KQbWyVtECUD3_SYs5ZYrdwkWh2rQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] compiler-context-analysis: Avoid unused
 parameter warning in _context_unsafe_alias()
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	bvanassche@acm.org, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 00:26, Ian Rogers <irogers@google.com> wrote:
>
> _context_unsafe_alias() does not use its parameter 'p', which triggers
> -Wunused-parameter when building code that enables -Wextra (such as
> tools/perf, tools/lib/perf, tools/lib/subcmd, and tools/lib/symbol).
> Explicitly cast 'p' to void to silence the warning, matching
> __assume_ctx_lock() and __assume_shared_ctx_lock().
>
> Assisted-by: Antigravity:gemini-3.1-pro
> Signed-off-by: Ian Rogers <irogers@google.com>

Reviewed-by: Marco Elver <elver@google.com>

Re __attribute__((unused)): I suppose it could work, but (void)p is
the more minimal solution that is not uncommon across the kernel. I
don't see a downside, and less code is better.

Thanks!

> ---
>  include/linux/compiler-context-analysis.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
> index 8302ebc2ea8c..024e303188ad 100644
> --- a/include/linux/compiler-context-analysis.h
> +++ b/include/linux/compiler-context-analysis.h
> @@ -243,7 +243,7 @@
>   * alias as a function argument).
>   */
>  #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
> -static inline void _context_unsafe_alias(void **p) { }
> +static inline void _context_unsafe_alias(void **p) { (void)p; }
>
>  /**
>   * token_context_lock() - declare an abstract global context lock instance
> --
> 2.56.0.385.gd3acb90ef8-goog
>
