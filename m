Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A413093C1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570014; cv=none; b=s1xLOI0CLOjNps9/IRokLIji0ELVewp2SKJ/U+Ij2w1PET5q6ozP2sbZBdLXvAbMCOZmiXdBKbV4vui6cCsEJIdiYRJpAFtGT5ou6QaPc8qb9R6U4xr9HzEL3O5buydBMiTVZd0EoaXygEIFp6sOSWpOvS1+WnHx8UedmWN5xwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570014; c=relaxed/simple;
	bh=ry0gP9/nte5FvnTqKFpnVOsUj0CotpETxmQQImGcUyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+4M2FE2FB/HYTUvO4Cd5B9PyWPy7dUKiIiETa3JldDOt5otxSfRD0318gMHiMo7y9z6nZhiaZBB1Im4bHmeScGZzhufitqrtVnkudAGFOljWTAnbGJpdinSlWok8dK01JpG5gn9x6puEvErTUDXB52ZIzVU6Qfsgsgi/c7Iq/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDMGGgzl; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDMGGgzl"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca069c8so8729055ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570012; x=1790174812; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Leygo7+6aTim/GwiqbwE1kTpWGv4lEshT5ezDgEePDE=;
        b=fDMGGgzln9oDP3+ai1klZz/tz2Pj+bzvN5zQXFI7N7SWPfKsoJvbnneaeHTLhzgGFq
         lPKDQDOzgvtnSsk93DueRbj4+Lm+eqL15VOgaKGkW1VALVjcCfDOht84Fz/wplPUUZ7z
         i2hBDglIQWWI+EW9ocdjGz5U1SqVBXeI/+lxD9CsvQV/3vlZ12Smzehd4zOaaICCe9ou
         sTBl5JTb0gKvL4lpt0XzfgtKtvMuSWov29rubux2jVTw6jlMQlIIjgH8V2bgwpeupwcT
         ZF5qqIBruHdl1/uC96kql9FPCX3W28vYZw/a3vrwWGcCQri+RRpptG67qN8D014Ja3Ea
         WXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570012; x=1790174812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Leygo7+6aTim/GwiqbwE1kTpWGv4lEshT5ezDgEePDE=;
        b=e4PuvA7/Qb0EWZOU5aPmLabSZNVdii8QUmntn9H89IsV4pt1u/uKd1VdUYAlMrlGf0
         toIcR/wlvySRED2QdqG0Lq8gKQ/0MkbeJTYFrpL4KUswQy9mSZN9n5kZehjK3rPkMv00
         Ndykf5hpojdkmXUqcAI3sOTay8BkqO/gYdoZ+ffGQRVjDlGWyS0iOBQxR7CnnAvB5Bng
         kzr9qmkLuKnFTKmg/Y7l7Lw+KH4YATOhZWq/oxK8HKr1o1iriyjx/nN7IgR5h0FIxYsS
         5CRVxJl5RomPkvsPxqEIBtm7hz4F2D925dQE7FYmQH+XmQ5NnuMIw0R+waMA6WYW7W0J
         zysg==
X-Forwarded-Encrypted: i=1; AKwUvBw0RG8sKCKRxwoYpH99SQpLcNsd96fLA332PdBVZQyKpn6/I+z4H+rWdPTFkcrEqZw1DkM9b/sZZE4eLsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lS7Le/CRmVtJQjBgN+qtCAs/q9nC8TbMAdiOd7lrISuCGywzGb
	QsizAAKid5/QJETIhQhiUhdlj0lm4Lo7XWp86xp1R+xsEnU8NJ3WjLFn
X-Gm-Gg: AYBFou345fYmjrjFenVucku7Q3LHVk8lIG+JQx9ErL3Za6XEuLOkaeeFDBRdQADnMWG
	4OFwEBHrrnaNLEYdwt9ltgVJF8XpefduLJP5aTzxfV3RXr6lXBeBZ287aqwB2NkNMl9jauhV6qk
	hPT+q/2rOvqZukTdRwwNhqDspNcBzuRkWrZ/cOpNTY/bmxaaTE2gQaXNDuFpwtxOKRDfYOhz37o
	HekM8slhN7/SDk51Wq6AWXeB8gQrWpRgO8U4pDll7DG3kH2jqwePL8aSs/hQ/7TX2+8FUMIdOB1
	vwet32PwytQ1TtMEt37/3JgD61JvXh1WObBsI7rtEt+7sUdTT8JTxpaybWYwO3qwl1qRIwMca3i
	tFkx4lJJNdifJL2X60pc35wyIbVSBvTmEOP9sSDmFMpdpvh1fjHSWtH7N8+v4raHTuSQxVk4zZj
	HjvPgJ2VzpR1ZUoQXJMlQgi1l+Q4NnYwheNvxoAlejToJINr0Txiz8SH2Byknrj+r9H9nL7nrud
	beFasQTPwhSSwfK+igXjnAC8h3BX790qVrc0ABVKZ5Lzg==
X-Received: by 2002:a17:903:2f10:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2dd8e7aa5afmr63174535ad.20.1789570012227;
        Wed, 16 Sep 2026 07:46:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fe00sm13298065ad.12.2026.09.16.07.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:46:51 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:16:39 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: David Gow <david@davidgow.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, ynorov@nvidia.com, joelagnelf@nvidia.com, 
	fujita.tomonori@gmail.com, linkmauve@linkmauve.fr, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH V5 2/2] rust: kernel: Add KUnit tests for powerpc
 ARCH_WARN_ASM bug table emission
Message-ID: <aqqqKyquDoisxvZL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260915090453.1227034-1-mkchauras@gmail.com>
 <20260915090453.1227034-3-mkchauras@gmail.com>
 <236f1c15-9532-405a-818d-9bf52349f25a@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <236f1c15-9532-405a-818d-9bf52349f25a@davidgow.net>

[...]
> This works for me under QEMU, but I have a couple of small suggestions.
> 
> 1. You should use the kernel CStr and kernel::ffi::c_* types, not the ones
> from core. This properly matches the way the kernel uses -funsigned-char.
> For any architectures where char is normally signed, this would fail to
> build. Which brings me to…
> 
Thanks for pointing it out, i missed this.
> 2. Why is this specific to powerpc? Shouldn't it be possible to do this in a
> way that works across more architectures? (Indeed, the current
> implementation happens to pass on x86_64 with the above fix, though more
> would be needed for other architectures, and there's probably a better
> solution overall which doesn't hardcode a special bug address.)
> 
> So this still seems like it's something worth having, but I'd much prefer it
> to not be architecture-specific if we can avoid it.
> 
> Cheers,
> -- David
> 
The dependency to support these on all archs as it is would be to probe
the implementation and figure out which will again cause it to have some
arch specific stuff. I couldn't find a clean way of having all that at
the same place without a lot of #cfg's so i just made it powerpc
specific.

Tomonori sent out a patch with a single test that's arch agnostic, but
for ppc I would still like to keep these if the maintainer agrees.

[...]
> 
> It'd be really nice to use the warn_flags!() macro here (or even all of
> warn_on!() instead of hardcoding a separate implementation here. But even if
> we can't (due, e.g., to the need for global_asm! vs asm!), it'd be nice if
> this were more similar to the warn_flags!() implementation. Not only would
> that reduce the likelihood of these deviating needlessly, but it'd better
> support more architectures, too.
> 
> For example, the commented "{size}" would help on architectures where size
> isn't needed.
> 
Let me try this.
[...]
> > +    /// With `CONFIG_DEBUG_BUGVERBOSE` the entry must record a non-null file
> > +    /// pointer pointing back into this source file.
> > +    #[test]
> > +    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> > +    fn bug_entry_file() {
> > +        use core::ffi::CStr;
> 
> Please don't use core::ffi::* in the kernel. The kernel provides its own
> CStr and c_char implementations. Otherwise, this can lead to issues as the
> kernel builds with -funsigned-char, but core::ffi will use the architecture
> default.
> 
Sure.

> > +
> > +        assert!(trap_addr() != 0);
> > +        let entry = unsafe { bindings::find_bug(trap_addr()) };
> > +        assert!(!entry.is_null());
> > +
> > +        let mut file_ptr: *const core::ffi::c_char = core::ptr::null();
> 
> Again, core::ffi::c_char should be avoided in kernel code. Use
> [kernel::]ffi:c_char
> 
Sure.
[...]
> > +    /// With `CONFIG_DEBUG_BUGVERBOSE` the recorded line number must be
> > +    /// non-zero (a zero line would mean the asm operand was not substituted).
> > +    #[test]
> > +    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> > +    fn bug_entry_line() {
> > +        assert!(trap_addr() != 0);
> > +        let entry = unsafe { bindings::find_bug(trap_addr()) };
> > +        assert!(!entry.is_null());
> > +
> > +        let mut file_ptr: *const core::ffi::c_char = core::ptr::null();
> 
> And again.
> 
Sure 

Regards,
Mukesh
[...]
