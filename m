Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D3333ADB3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841774; cv=none; b=XGC4exicOhPHM+9WPw3FEnO4M9I5K3ePhKhIXJqgBeG1wbBb0riNWcwzr6g0slipTg8j8J+Cj7VC9x+Y2Y02zOyR7aHWUUC469kXdW4TGoHOD919QuRydlkV7DGV9L2DtGq4AS75QL/FtzfshTLZtDxde3hzfTdYMmGL7269Muk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841774; c=relaxed/simple;
	bh=1ikHomWgH+UponDHIhemDS2OV7lez+IwhkQn8e53KEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKEe9bDo2e5z9BLfXcscjVZKN4IPfKAO9miez/KcHBzynMR0j49ibfo4XdF/Sg+pzQpe+TlizwXmJlA88GTZPoZQu/yXOoTaJcVo40NMOyx1vv+AEY+yVkYCuhduGOWl8l7VzGYTuoPYw20oUk5Pu8HLE2B7aHobCMN4razjUNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H77UYuX/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H77UYuX/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so5916595e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787841771; x=1788446571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y3f6zBlmNQlRLONz4SXWdsjVECFDgl+lzqa1kODqWpg=;
        b=H77UYuX/56r4sdWtu5U5Ex//2xyO+bcFSzYtn+3ubZ2Q3oaIzEjGbidh7CjOs8p2F1
         DWZelorMOlytEtUJyH3/GHySVIpvmwZwwGc03bXyztUAyBCaJ6OSskPfRBIeqJEzG7od
         bPHhWwu1lmaoHx+CCi5OkAchlTuJqgiqkrgGgyhjl3Fo0egr83tFZA8o0ihTpN7AAYVm
         bTH7rRIJslQxbVkW/B9IRgt4dJbN3LjpcDl55OMib/N3Mbom16fBSJwh3ntGWd6H8OBX
         rRwF2rEK/0w8dTguA7ylB1mmi8cxHU3KdMUUW7a00tSlFZdLvz2KHVbHGogNH/h+kuTX
         568w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787841771; x=1788446571;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y3f6zBlmNQlRLONz4SXWdsjVECFDgl+lzqa1kODqWpg=;
        b=oYixZUghOfKKclU4IugNwhzsZfndL77iVcwpl8SryqJTF0FgWY+zmcFZ3PndOsf/J5
         x5pbG0PP/QOqQB/qbmydW9k0oy8S8rXuEUP3q/Dmj2rkgPd/rvE3IFUj94mBIPyj4BAK
         i6FaD35KZZX570vlN4+krKQ3SXHVOrbyPAgZC8aKuzVu9ScPgepU8DwY53D4cW5fOjPs
         jfHO4pIVLyvPSxz1Av7PGzsXpCFnJTmdaITfA7xhdtprvWzYtaH1RCS7Var0w/3QBsl/
         xsq0yl9cgUZyf8qdP1tNzNxDnSDLJaniMSo29kO5aZ4brTrG5Z8/2Yg9Fi/lB5nMUgaK
         O/4w==
X-Forwarded-Encrypted: i=1; AHgh+Rq41inJ32s3wlEztkGM+tnDiuSgi5EPpdnIiS0+BkHMwkynVKibw70gKIWAARDKrGfNHo+G6/LBcCFd9kI=@vger.kernel.org
X-Gm-Message-State: AFuF++nfxMS0+1YEUs7sbk3GFR2JBNFwiJv1Uyuhk9lDzdW/guYrDAHi
	FhUcalsO4yfjFMK5HjirnNIgHhd1Bl0lQ00Cw/1yjgSqucwZTwHJDspDtU2AkbroU6V9h4gTbex
	YNlT3hcQ=
X-Gm-Gg: AR+sD13y24T5RcQ2vdVGkj9NLrfa9geg6cKS9BRZxJVewl0TnWzU75wRn19G1F7riNX
	ECnrlC6+kreEnC27XlxhaeAWreYOjsABymmoI1ssKn3SgaBU3pq3G7VI2G86Zy6FQEiXgnJOIwF
	LEvurE/m66kkqtt61VwaVhqr7R/ApC8HqpV5PNVgLicHlCDJpCy+daHOh2bryHiUUrhOrylnKM1
	eMEIaJLaj5w6/IynCGXUfkVVd6RmioC2nZMD5v4q73yrdLqNbmYsXo67zcHYPBomew/vsjiswd6
	h0aGuFHyrMCZE9viLLeHn+L1M6QARfJ2tR7HWNMSyZ3ptogimoqe5MMZOkL+Mv4D/NWHbzAqlMq
	4IJLebUXIjzlABUCPfS3EEWIuHPo2/vJWaTgM4bLrK30I9ZIYsnehEYpMs+Mnjvzx0jbRRqpHUD
	Gbc74Ovt7+iYlaAeNxAwgNAb6uveHTpDaXQSs3flfmu0JucqPQopV5MUKWJnbX0DI=
X-Received: by 2002:a05:600c:4e55:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-499dc723fadmr194049945e9.9.1787841770892;
        Thu, 27 Aug 2026 07:42:50 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4dfdf00csm52342545e9.14.2026.08.27.07.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:42:50 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:42:48 +0200
From: Petr Mladek <pmladek@suse.com>
To: Harry Hsu <x90613@gmail.com>
Cc: jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] livepatch: Reject livepatches with aliased old_func
Message-ID: <apBM6MW42WNFLjIO@pathway.suse.cz>
References: <20260823060734.58443-1-x90613@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823060734.58443-1-x90613@gmail.com>

On Sun 2026-08-23 14:07:34, Harry Hsu wrote:
> Several symbols can share one address:
> 
>   ffffffff8ed7fef0 t __do_sys_fork
>   ffffffff8ed7fef0 T __ia32_sys_fork
>   ffffffff8ed7fef0 T __x64_sys_fork
> 
> klp_find_ops() looks the ops up by func->old_func, i.e. by address, so
> two klp_funcs of the same livepatch naming two of these symbols resolve
> to the same klp_ops and are both pushed onto one ops->func_stack.
> 
> This breaks the assumption that a single livepatch contributes at most
> one entry to any func_stack.  klp_ftrace_handler() picks the entry at
> the top of the stack, but when both entries belong to the same livepatch
> there is nothing that says which of them should be used in the PATCHED
> state, and the UNPATCHED state has to end up at the original function
> either way.  klp_check_stack_func() cannot tell them apart either: it
> asks whether the preceding entry is the original function or another
> livepatch's replacement, and an aliased sibling is neither.
> 
> Patching two aliases of one function from a single livepatch was never
> meaningful, so reject it while the object is being initialized rather
> than leave the redirection undefined.  Compare the resolved old_func of
> each klp_func against the ones already resolved for the same klp_object
> and return -EINVAL on a match, naming both symbols so that the offending
> pair can be found in the livepatch source.
> 
> Fixes: 3c33f5b99d68 ("livepatch: support for repatching a function")
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Harry Hsu <x90613@gmail.com>
> ---
> v2:
>   - Drop the klp_check_stack_func() change.  As Petr pointed out, using
>     list_is_last() only made the last entry behave, still checked the
>     aliased sibling's range for the other entries, and did nothing about
>     klp_ftrace_handler() being unable to pick between them.  Reject the
>     livepatch in klp_init_object_loaded() instead, as suggested.
>   - Rewrite the changelog around rejecting the configuration rather than
>     around the out-of-bounds read that v1 described.
> 
> Link: https://lore.kernel.org/all/20260812140232.48079-1-x90613@gmail.com/
> 
>  kernel/livepatch/core.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)

The patch makes sense, looks good and passes selftests:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I am going to wait one week. Then I will push it if nobody
    complained in the meantime.
