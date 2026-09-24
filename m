Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A8947669E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249204; cv=none; b=XDgoE90eJkTU0Csyy+qqFStfNgDQuT8tip3hFQwCbQbkixrz7/0OoYIMGi9xwuULmcZETCZb2BpZUpIafde/09nTDjAZPZlY/G1Xc1vQ31y6bo6MJNtbqYrn8H5T8P/2Gtq/OZSMP5BHtrul/wXpCTR+WAVQBI6lJmaglxXwRnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249204; c=relaxed/simple;
	bh=uV91OIdoGT1hJro1OTQxii5/OoY5c2o+jAR2m75TEWs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaTyNCFPaYI4nrM8u7dZvQTXSiJww4jU3Zcm3UlmS47BHykI50ZdsIS3/tKv2vtCHuFxmN6rS7+4K2GNRjNHL0lG2xKkBrIgmxLsLyLsWXSwm5YNbmvql/pL8l6mYY9J7Qtpwc52OikNA0paWQpw9hKNistsVAE6WKtCvpQWauA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DafOEmt/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DafOEmt/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so11029435e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790249200; x=1790854000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wOJC0I+fG63bz2W6Hzkg61w6664DvUwJdI07aaUCw1Y=;
        b=DafOEmt/RUdsdfzhek29Gaoz8CEt1RMYBCAlL9jfFQ9tmoETEnKpaEQPnpM5juq4/v
         4ftxpZmcoe9DFVsIlPkRz9JTOM9A8h5JZDuU+m7lFmHCtXjI56oX4N/l4vROJsjIqODo
         DVfU7QMp9F5S1lSCNv5D4CUuqev7aqPQALXi0vPhoqptoVh765ExoxNJsNacJQXNzord
         BYMHsFxxBu7l9YDvg6jM9yV9IvY86ljFoUVqwMkw3MWkChPMBOOk+TxeJ9mJUsxXQgA1
         T34wgJnRxoHgFRfaImKAmlAf4E7IrEDWmwURADk2/re9KAkueVuikW/dhhqci9KIu3wr
         Sd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249200; x=1790854000;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOJC0I+fG63bz2W6Hzkg61w6664DvUwJdI07aaUCw1Y=;
        b=j5ZXCdipUNlCt7jONvBghoxWEkf8EiDZFQ02XZ4Hw6QbiVrZjtTWRypTyVOGqyc8zy
         c7sXeLJEqUrG7yZMm8O1i/Ar5F8LUyAV0wd3s/y5xkHmxPzTK98rLTQOgRyoJOYfL5IG
         FCcWJbXuqL2l7JkLs7+FjvE+sEsSIl+d2bvwux3NH7x5eN9o/2TdH6M/n1H/bNoOMwZ0
         Y26H/qiHvUtMEtmKL8NTrOU0jXXoLHwdMPXVl9y/rzZtINA5+KTp6dFftnTYZrwX80A6
         a0jjkmqUllfu8ynXa2ElbzyoA3ssDJ82pyO95fAn+B5CifXBrHj6TYVhJJnlKCJDXyY/
         tomQ==
X-Forwarded-Encrypted: i=1; AKwUvBypwjTb804DURbxIvYaietRjaTfdx2SV11Vr5JoFdIhG9SFrFGac2hETV6jumVmW0pbs38rZJevi/+Njvk=@vger.kernel.org
X-Gm-Message-State: AFuF++kb6YfPJdzKwRvUw8QCMC6DOAmrJXzIP1LAbyZcTT5YooaMfWvz
	ZY5PRfxto1Sv5GVDFEhgZNSuXKNDqXKqKbZVslBE5WPgZAYlLCUblSSQ
X-Gm-Gg: AYBFou1EgN0txMfhlK71YuOzJit8Q3nLDF5QS8uYwoFN6qvq2//X7sPV75moWXIadnK
	baXZwL17pzSxzGzMWg8hP6h02LcTcb2aK7m5+yXaHgkJ40G33SNBRIUXu0cd62DgPVOiZN2iTpa
	eebdMQY3tx3z5LiEZsesNE4RF4Of4xQ/+jWScDxK/Osi3LYkptVKNjCqfEgRy1VwnrjZKM5vik7
	nfnqE5CBGScONwPTdWfFcu0cFLE5AAYKlhzHkpjN5z1fu4Y/WOlfFrndQISGCX849Vsht6woDHF
	njBK3EgxCtlccYWWGqn+hJvHCxYRuZT0Vn6T8s+kTNdgSL+Frfsa5lNn7auHiSynCmUjTrzy+oO
	iuvh21WEk0NPwRqmGAyuPN9STNiTzDoWmx4Ihvh7CB+hczajH5hWjq3cWADUT4vOIP/KpgejTAZ
	eYI9OaunX8WT8nHxIrPvPE/AsKbEAmDskG7QcJwyRYrLXyjiV+Pf1Xvx2hxEA=
X-Received: by 2002:a05:600c:4e8b:b0:49f:ce78:356a with SMTP id 5b1f17b1804b1-49fe66fb018mr35842225e9.27.1790249199969;
        Thu, 24 Sep 2026 04:26:39 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cc90ccsm98428825e9.10.2026.09.24.04.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:26:38 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 24 Sep 2026 13:26:36 +0200
To: bot+bpf-ci@kernel.org
Cc: wanjay@amazon.com, bpf@vger.kernel.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
	memxor@gmail.com, alan.maguire@oracle.com, martin.lau@linux.dev,
	yonghong.song@linux.dev, nathan@kernel.org, nsc@kernel.org,
	linux-kbuild@vger.kernel.org, mcgrof@kernel.org,
	petr.pavlu@suse.com, linux-modules@vger.kernel.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, abuehaze@amazon.com, doebel@amazon.de,
	jay.wang.upstream@gmail.com, martin.lau@kernel.org,
	mason@kernel.org, ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf-next 3/6] bpf: fetch the vmlinux BTF where kernel
 types enter a program
Message-ID: <arUI7ORFZCegI5ep@krava>
References: <20260923053948.30617-4-wanjay@amazon.com>
 <39f6151d364d966f70b7802cfd4bbca15734a7945478265ecc681f1779e50abb@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39f6151d364d966f70b7802cfd4bbca15734a7945478265ecc681f1779e50abb@mail.kernel.org>

On Wed, Sep 23, 2026 at 06:28:43AM +0000, bot+bpf-ci@kernel.org wrote:

SNIP

> > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > index 195f78db9bda..c022b2877f0b 100644
> > --- a/kernel/trace/bpf_trace.c
> > +++ b/kernel/trace/bpf_trace.c
> > @@ -1015,7 +1015,8 @@ static int bpf_btf_printf_prepare(struct btf_ptr *ptr, u32 btf_ptr_size,
> >  	if (btf_ptr_size != sizeof(struct btf_ptr))
> >  		return -EINVAL;
> >
> > -	*btf = bpf_get_btf_vmlinux();
> > +	/* Called from a running program: only use the BTF if it is parsed. */
> > +	*btf = bpf_peek_btf_vmlinux();
> >
> >  	if (IS_ERR_OR_NULL(*btf))
> >  		return IS_ERR(*btf) ? PTR_ERR(*btf) : -EINVAL;
> 
> Swapping bpf_get_btf_vmlinux() for bpf_peek_btf_vmlinux() is correct as a
> sleeping-in-program-context fix, but does anything in this commit arrange
> for the BTF to have been parsed by the time bpf_snprintf_btf() or
> bpf_seq_printf_btf() run?
> 
> The compensating verifier-time fetch in check_helper_call() is gated on
> helper_uses_vmlinux_btf(), which only matches base_type(ret_type) ==
> RET_PTR_TO_BTF_ID or base_type(arg_type[i]) == ARG_PTR_TO_BTF_ID.
> 
> bpf_snprintf_btf_proto and bpf_seq_printf_btf_proto contain neither: their
> arguments are ARG_PTR_TO_MEM / ARG_CONST_SIZE / ARG_ANYTHING and the return
> is RET_INTEGER, because the BTF type id travels inside the struct btf_ptr
> the program passes by value rather than in a register type.
> 
> So helper_uses_vmlinux_btf() returns false for exactly the two helpers
> whose runtime fetch was just weakened.
> 
> On a CONFIG_DEBUG_INFO_BTF=m kernel where the BTF is present but not yet
> parsed, bpf_peek_btf_vmlinux() returns NULL and the helper returns -EINVAL.
> A working bpf_snprintf_btf() or bpf_seq_printf_btf() call silently starts
> failing, depending on whether unrelated activity already triggered the
> parse.
> 
> The changelog frames this as behaving "as they do on a kernel without BTF",
> but the BTF is available, just unparsed, and the previous code would have
> produced correct output.
> 
> Should the fix be at verify time - teaching helper_uses_vmlinux_btf(), or
> check_bpf_snprintf_call(), or the *_btf protos, to force the fetch? The
> forward range 90fe51b6b36a..2f5aab95d2b8 contains no code change for this.

seems valid to me, could we just check for these two print helpers in
helper_uses_vmlinux_btf ?

jirka
