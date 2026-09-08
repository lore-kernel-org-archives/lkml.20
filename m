Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE9F29B228
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851201; cv=none; b=uHbQ4RtN/ZMiwaodW/ktRCwnzCvJCOalDC5GGabR/GDTMtj1+VrRWs03V3/1TceGtJ+aWfJ665Tpfxq2WLmsS+IG3j+2MkZ6Twi6tKpW4P5c7fHms9APxkkP41VhTQk/zlF3jw4dQTtNmYnWElQ2s/TNphqj7JZjwEau92bECAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851201; c=relaxed/simple;
	bh=UF0fuhs2KUnT/AG6X6nloda47GwQtywQNTmgw9+Mp/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=keRXVEPec/oSQta+5X0dJQ+5sbilrl59T2ZyeuP6gXB5F5PX064G72HzJI6IeaLhbb70gO2GCVCtvSUTLrTthwCREe+mYjPs1o0kacHoldS9jtBY2lsa3BLDXyOIXhT6gnTOZEZFmZhnpOw56k9MQfapJNm3De3PfFFcX5HKlMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fY7ozbf7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fY7ozbf7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so41431705e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788851198; x=1789455998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f4OKhHlTxP+mf8Lckkb+JFWYpmo6Azxr4Ph5bz47dtc=;
        b=fY7ozbf74zyHAFClTQM2FZ0U6WpitMrksDP4X4cd7A6X/Caju3GirbLfo+8x0rEFOl
         juZq0OkV/EhpDRBAbV2A94Jt8Ww6Z2mCeIoacJyH3FYq6/3C2o/BF/BG0NbYft7Ibl6+
         vhi0j3wBL2uVpSlI8t1+GKfLLSB6L+voRoOwWCZYaL+HXeh5RYEj2XQylXsHzVR1WyIv
         duLIiRcFbEaIseOBeyjJwdSPJdoCxau92tQ2ux7VOPcEU7Qt4EMyfCVMCdmoWcfj0gvW
         +HbNJ+zaRYHRxcLyLTQlwt6+g8jd7e5joqODXVFCOsOhoIc5Nq+WP9QJWTppDNNw62Gj
         riHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851198; x=1789455998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4OKhHlTxP+mf8Lckkb+JFWYpmo6Azxr4Ph5bz47dtc=;
        b=CmwcwtjtPKNxumm3iotEYIeJGjL+7RoqV1mQ/wUXAsJILHxZPRswQFrPu64L4a7dFA
         QO5EfG6ywoogR5524nhBUsxfrvWFT1+DN8VDZRCedfp++J1S2rQioTEjfACOuFLq3k3Y
         rEOgpUOTfdvS82r0hCOLXPw9XPyMj/eN4hO0z6N0zuTFy38+pC7D+WvQejRgT4Tbq0uv
         JdtkUZ54LhFpHNSDgz8bkRbtQ0Dgrjpo4KH7ypqpLBjVHQ309vbdodMgy20HZtI6Cihd
         JyvpsRtPp6JqMmz3rK2fSHFbnnV7bWqkJY23FRCp0ZTIS7buELmS4uwbdp5Bru+tN9dY
         /uLA==
X-Forwarded-Encrypted: i=1; AKwUvBy8TdsmjKUmU0QTtg9tvq0qUenLr5PnRW7mHRDNNZCmc29nkSWnCnTUXFZENdaxJWXFFydjSRgtPY4dL3I=@vger.kernel.org
X-Gm-Message-State: AFuF++mMNh0bUX6sxEA10qgsgK0jBUR8sHrzTobj5vAK7/4qtQe8U1ML
	0p8T8M6ZCIrzJaob8vtM507mi4hR6WZu+h7VNiP7zzwafEIvk+6IkZ8loDRyB55CshY=
X-Gm-Gg: AYBFou3psbWPJhzu/yFzOUopzlgH2YaOulTAa8a7p/tyZxJOeoXApF58m+ZtVPuP0Gi
	+uTEggxGiJKyTajodnCLa9xlIfOPmIDreMkcAk+utYgtW8lMc7Sg1nj83LHODIST/Xby9625t1n
	vpEu8Idv6UT869uhs1NWlXUaxyO8x3VicV+rfuGs8nET+0TG9mQsG+kEcO1GInGiSr+Fm0C0qY/
	P/9sXnHMTgu8wbuhUYiA+kA431744EbcLxzbUuP9t5qtrLlX9jnO5dGgevxXony9X8yay5Aumo7
	j8y/weLuF6NEZYMsqDN4CZrWPdPPU1sfQb4MTPrsksczWtbSHIMEyxhs02q+QButDhfwakekfHK
	du4Ehkb0BNitAswvwM1T9+ok5p13WJlSASwQbLqLEg9tCtboeuBkVj15N/6BTnNTBQO2eVDy0vz
	4MV96YCP1RA1T7y5+aRRnBsVjX+kmvuhQuue2DUJp+xCtVzWhQYRta
X-Received: by 2002:a05:600c:4e51:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49cff8db5demr463345525e9.11.1788851198438;
        Tue, 08 Sep 2026 00:06:38 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm340625455e9.11.2026.09.08.00.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:06:37 -0700 (PDT)
Date: Tue, 8 Sep 2026 09:06:35 +0200
From: Petr Mladek <pmladek@suse.com>
To: Harry Hsu <x90613@gmail.com>
Cc: jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] livepatch: Fail object initialization on duplicate
 patched function
Message-ID: <ap-z-3n9BbtiV9lT@pathway>
References: <20260830173343.52759-1-x90613@gmail.com>
 <20260830173343.52759-2-x90613@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830173343.52759-2-x90613@gmail.com>

On Mon 2026-08-31 01:33:06, Harry Hsu wrote:
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
> meaningful, so fail object initialization in klp_init_object_loaded()
> rather than leave the redirection undefined.
> 
> Fixes: 3c33f5b99d68 ("livepatch: support for repatching a function")
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Harry Hsu <x90613@gmail.com>

Looks good to me and passes selftests:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
