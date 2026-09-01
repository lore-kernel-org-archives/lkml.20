Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8975F39734D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246798; cv=none; b=jVTUaH0wUAUtY4RyM2dOTAg+Qj4PlbexALpuUq4TXIsPvSChAkHVc7TeJf6F4vl/Z7uwXfRppJ5O7bzt71Rk56IkmuL91S0gKSdJmNn7LNpzMoC9l2SCLgNZje7JLeMGtDl0X5ZWyDYGfQAQjRaj8HGBl458br3In0vpJlLwo38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246798; c=relaxed/simple;
	bh=OpxgH63A4KkbUuT9e33G/Vfkv1nNmR6pjy20m2S4S+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3bedbAXjvlb51zz+CqOwd5xdh8jPiyheaJUWpeFvkVP7dJRnHUn9TwZomn5NIbhz1L8W+wgcdgTqlBGx8y7YjjfwDdsCqXfv+LFtnTPHh0STFu+7TyMZMPu3+zTbBhoJAWuGa1VvDNloBOMHgYZouJdl01KkDQ0MvcpAYt7Dd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfKFi+73; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfKFi+73"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6e954afbdso3311915ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246797; x=1788851597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vlPVxxOq7kLEL6+QoF62NqA25ABM6Pdignc8YpmkUk=;
        b=nfKFi+73kY6V97QUxudraeJRq/RoaOfboETBrInHeFl0k02Og4FnUVtmeJRpmWKeb2
         sB6fdwwp9CgeeUPGk+9wH+CDY8Xb1nD/UGkXMmtMxM29dekY/b5ZWSMZ40LwgoZvs5sN
         fytCJyIyWnhNILXF3WMeQkH77Eq6ELm5Flry9rKnq9uLL26b5W+vF9PxugNEJDWWbUtZ
         OYuU9ufcewlJn9nwfdJ0DtqGt/Wriz5SrEWr26oqNa/7wpGGUvn7QOQpEGRX4fVSgI67
         T3mn641+aNa1Glf45wGPWuqu7Jov4tboFejCXVfNXtqIEDgEdaLA8l10ISLvd4j56flc
         AGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246797; x=1788851597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vlPVxxOq7kLEL6+QoF62NqA25ABM6Pdignc8YpmkUk=;
        b=MpictvUs5va7uX5RYtD7st3DYvf68kCLZ93W8rUrW64fsYXqN2K8ToD7+HyOX8U+Yc
         uwxguw0+GbFt4V0Ac8bycePTLikPdA4A0gpDHbIfEDVf9/OFalrgIz1jwslYPneEZ73D
         v2540p5hHxsdY/GMllrKDDddDapReD4YKGGC7lsPEhnERJJqGbhopxrrHzl8MP48AP/O
         fvb5opjKly1fRGxJdD5tnUrO1cK+9RUGqOEkMtNmk4tF+4SqIXdhm6SIh2sF46K+BvNW
         Cs6ScpaxhBAhF4dgi/BSj5JMrKMOXU3M2587mSKxMLc2MyeasqeRVNKgCPJPu8HkiyT+
         LxfA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Nfa1uzA/9nhgQ8zIqaVCh5zkYnL6SuPmUN++pio0piufvVmQDBW9/vUJFNX1SYy/jz18QsRDnLllYzM=@vger.kernel.org
X-Gm-Message-State: AFuF++kapZA/betXH/Dp7eeVyz+mGww+CEEP0DNiJUvHy4xZ85ZX4SdE
	S3PYsciLri/inP2rZenlrDD+6o9tEUeDW+VnNiCRgMc+pFqH+MnwwoIx
X-Gm-Gg: AR+sD13NnjXqRttwJ7qG3VBNf75pxVwpuTwrw46XkeV0GZil6QXtKg6+q8/0D/hinSe
	+7wcY/geq5gkQSpVIjIcbEi7GvaSlGOalras71ChLI2oAUDsG/5GZIqzSW5XqIbNMDUQBgf54q4
	Lv1I38yOzXfI1/mhS0SmrauuGS9ZJcIsVZq9q97zu0dfNMnKpUsxASAuy4wjgMLtqvQxv1P6czi
	REY1S1AVUV9HxJkTXcI6v43xgWeNH9MMJySW4MySef0VAWJtRsJ8AHF8VHbh/aBXaw2vQJNyQgc
	2lmdWXhcm9oLwcr15EC3nz2XXyuiyqYD0Ht/6su8ZqzaGskvp6haEasj2canUDTVy0U5sGL2Ee5
	TzJC+04CSCQCRKuVwMfxycayrnYUkmlgGHbWS+jxA1Tz8qpIxAwdxihcEIOnbXrTtZv9LHI6wF4
	Jii746/OEJqQ+D0P8SsrvujilP6A4UsiQC+f+oOXieLsRbIR2qOMGLcVLdiy5BE/IWy1rwD0EkU
	B4QX/6O4On0HIg6GdpMx/BYinSXdaU7HQk=
X-Received: by 2002:a17:903:458d:b0:2d8:f965:7e48 with SMTP id d9443c01a7336-2d8f9658ad5mr288966065ad.1.1788246796726;
        Tue, 01 Sep 2026 00:13:16 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([49.43.112.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fc0b3sm47893595ad.16.2026.09.01.00.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:13:16 -0700 (PDT)
Date: Tue, 1 Sep 2026 12:43:11 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: tglx@kernel.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, chleroy@kernel.org, sbhat@linux.ibm.com
Subject: Re: [PATCH] powerpc/entry: Clear TIF_SYSCALL_RET before syscall
 error return
Message-ID: <apZ63gSfONkXTJhH@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260828053811.1042300-1-sshegde@linux.ibm.com>
 <apUBdKP1ytHSvuQd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <46786528-4e56-4df3-b142-bcf047bacbb0@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46786528-4e56-4df3-b142-bcf047bacbb0@linux.ibm.com>

On Mon, Aug 31, 2026 at 02:34:10PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 8/31/26 10:09 AM, Mukesh Kumar Chaurasiya wrote:
> > On Fri, Aug 28, 2026 at 11:08:11AM +0530, Shrikanth Hegde wrote:
> > > Shivaprasad reported a boot failure due to userspace processes crash on
> > > abort() from libc.so.6. It was bisected to merge request
> > > commit '3424d8c18a7d ("Merge tag  'core-entry-2026-08-17' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")'
> > > 
> > > Upon checking the merge, when syscall_enter_from_user_mode_randomize_stack
> > > fails, which could happen when a tracer like seccomp or ptrace intercepts
> > > and skips the syscall, the code returns to userspace immediately without
> > > clearing the intermediate flag which was set.
> > > 
> > > When the next syscall is made, it immediately aborts the valid syscall
> > > since the flag is still set. Hence clear the flag on occurrence of first
> > > failure.
> > > 
> > > Reported-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> > > Closes: https://lore.kernel.org/all/e301014d-568f-4ed5-bc64-b8a85ca0b1e1@linux.ibm.com/
> > > Fixes: 3424d8c18a7d ("Merge tag 'core-entry-2026-08-17' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
> > > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > > ---
> > > PS: I have kept the block below since earlier code was checking it
> > > regardless of result of syscall_enter_from_user_mode. If it turns out
> > > to be a redundant, it can be removed later.
> > > 
> > I think it is redundant as of now. The TIF_SYSCALL_RET flag is set when
> > error is set by the ptrace or seccomp, If the error value is set then
> > the syscall_enter_from_user_mode_randomize_stack will return false.
> > Hence the next check will become redundant.
> > 
> > I also see that TIF_SYSCALL_RET is also set when processing the ptrace
> > syscall, Which can leave the flag set for next syscall execution. Which
> > can again trigger the same issue.
> > 
> 
> I believe it is a pre-existing bug which can be fixed independent of this issue.
> Since merge request broke the userspace it is better we fix it right away and
> this pre-existing issue fix can be done subsequently.
> 
> No?
> 
Agreed.
Sure we can send that as a separate fix.
With that,

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Regards
Mukesh.
> > Regards,
> > Mukesh
> > >   arch/powerpc/kernel/syscall.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
> > > index 4916c205c4bb..fbefe1927b10 100644
> > > --- a/arch/powerpc/kernel/syscall.c
> > > +++ b/arch/powerpc/kernel/syscall.c
> > > @@ -18,8 +18,10 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
> > >   	long ret;
> > >   	syscall_fn f;
> > > -	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0)))
> > > +	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))) {
> > > +		clear_thread_flag(TIF_SYSCALL_RET);
> > >   		return syscall_get_error(current, regs);
> > > +	}
> > >   	if (unlikely(test_and_clear_thread_flag(TIF_SYSCALL_RET)))
> > >   		return syscall_get_error(current, regs);
> > > -- 
> > > 2.47.3
> > > 
> 
