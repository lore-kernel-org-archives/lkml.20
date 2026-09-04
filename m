Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CE0374E74
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563735; cv=pass; b=l58mGSotlEpIHWsWF0mnT+XOpKpjqxsLY8oSncUQAvspRTsyR6lvfKUWOtC4SrbgPSvi4CBOAJULl6dyLj9lAgvP//oQuBbYrcwbPiE+jUIlk4fmKXx0cefXfT6gtHARWXNZbDOvrbdCsDcC18sIdkINY141QRYLqg5dkyZqlEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563735; c=relaxed/simple;
	bh=BB6EHdcKaA/c/EJGmaFUXmWq/ZA2wzbj+weVgexRWpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=eu+0HR5phkdCweXxC6rhFkaazPizOBZi7rXh2abJXru1JXMJxe4OBCmeigTPPZwaDgjBIelRh8lKzJDK+p+JlqOmjaxb5CIPnwlS5fchi+ZO5KsbZiHDn4RgjnaYU/hAa93uBdOd+gbrRasKUQB6F3nSSu7aG3QiwIItIw1yUJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOsR0Ahy; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOsR0Ahy"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a63c610b8dso2171341a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788563730; cv=none;
        d=google.com; s=arc-20260327;
        b=k448FPBjsvTfaha1gEIb7/ClwD8tbZEAR5HT8+Mu//1OLX93sz/WknAqs5z+un8PFw
         5dLJ74pXGioxs7gnSq08/38NKSKXkk2CpPZc8TbMfcxs9RSmrnC/5BhuQZxG2Q4diEAT
         o41Sck7IFb4C0Kko3OrWfJLRwcwxDTbff+8wykSX5UIXT6di7JnHIpYZHs64IWxVV7lQ
         BUJMdWeDEyecXgeRy4kKP63arEh3shmhL4swGL+iYzGtpbfJl34yBgnOlTwg6STLgtiw
         eFVEjdyE8Ddmq4kCAMbCNXbUZCO0XD/ZG6FXC5mV+swMc+Vhk/7isVzCPCDj1y0LNdNj
         Oovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9+oPFVCHlIoWQo6jiz+svGdAWRzZsX5XNSQUMsdvUXQ=;
        fh=q8WZ/u4qpvnLwCT4XZdZBAn8r/39NdpL8SQcfysnmFg=;
        b=dJqtzd8KXyf1kXstMkqVD6INJ1lWnS5Z+nBlaCeRislkBxWXKRcLhw4IHLnvBI7QEw
         jwxfK9QwnCiDcb+mI8llpInwAwcnjprln52T8Q9qtc/qOdeJ6Kuo/rV7BRvwgBWCfotZ
         g3jdlq0ccnD1xfM1foaCrvCg3XyXUa3srjW6aoUqNIoRYfrFVpnxrC9ubMHYiYe2Th3z
         AFwqt0Ztrb5LTIiydxIxMTH8BNVUtk3zndjHmDCYJyRa8znxfKR93/EYxmTJJnEUP6Wm
         QyjqtRNDSdxg1l+05TCE1UjmA62hMt7WLekHHmN9JNSEG266hGvYcdT3W9CH1tpSzOHH
         Fk0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788563730; x=1789168530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+oPFVCHlIoWQo6jiz+svGdAWRzZsX5XNSQUMsdvUXQ=;
        b=TOsR0Ahyx2rc8fPoCXaAmmdH+JBj/dKF2JsrnSUXh31gxGcDlD+rz0SjrL4nt8NeeM
         OqVBqB4tnXygC7K55VeXl/wPuFm9+3K7cyNfDegiQkIycQ2hiopFdxW4CVpuPtSwoVLN
         OA+FGd/YeIdXjrjgZuOORaJH+VlqS2jWxZcbfYZSCqfGjiY8PRFqtkJLwUdS0CW2DIoX
         MXGXXfx1E5wXNIDAuYgcT2vElR94BrDgCUeZQG/8/exxMdhJgWpnNmshcwD+kD/cgGwy
         mf4nkN8n7+F214FdoYfU7LcNe5owwHUi8VuvZvVH3vx5AAsfsdS5ef3TCF73xI7aPPzG
         ti7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788563730; x=1789168530;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+oPFVCHlIoWQo6jiz+svGdAWRzZsX5XNSQUMsdvUXQ=;
        b=SbHopdHuGxh07BnGCffR0BfS6S5WraWDfHAStwnC4ujsB9BKhfMtXUMi8WWeoA/eu2
         0qOkMUlq3I2rJxZsIEwuOEVvOcKEqpJIFcL0RejtT9mYUaO6161NtRgciY6ojw5CAOa8
         V362guXyjVJodiMLV1lT/gQ2bggDJhbEa2gxdO2prICKD8W9YR7MB7H9T2Az6JttZMF8
         U70lIgBKh07vJn6uu3KlfI34g/K/I7CWPEWXjTywvND5Wq0HzfGLAet3uuVVOEcmVYRB
         hr/oM0voXj38cXC9c0KulB/Pnysb2dR1JAgvW0QWqL5euA5CE6cr4zTIfXDUX6uDcS36
         lj0g==
X-Forwarded-Encrypted: i=1; AKwUvBxncd7dpq/JqsCZnixvc+XCNdb/xlT66vDK7E/T1kISYKRFEbh5iwY83Nx8AzOCx80JqU5M9ghY0awp7lo=@vger.kernel.org
X-Gm-Message-State: AFuF++kGRAmjw1iRf5Jui8geULE7qkV2/2wms61Ls7QvV4t0gNwitcIf
	l+6jeW94ELNjEUObUcKHl1jxy9NtUNQeFZof8wjuK0FK3yxx7AeyxiBCY2rRT8h2nT0uasrfzcP
	CjDQgfDtSJAEOFylWY6uEPtG70ZX0Rkw=
X-Gm-Gg: AYBFou3qMhpGLFHOSJCiCiTCZPGZbQGeSTJ3lc1q/KnklIaqEiHCzX68aJn1JrJl3Mf
	DryLUTYjly0yQToRH80ruxji5XKgFuLdahM9HAx3AxDhlJq55QITL8OooslL3DEZsVSM2+wJ1aT
	nDaeBj8OcDNiU6mPugpk0uq7zgdCs6MrYSAMYdiYtL3ZxOnBkeWyTciBrDlzbqiDY5yg2RJWxwa
	Yt068RVvqP8Xx2KnECn8rdXP+bEJHK5sCea4ccYgopI8foWS6miQ6+UzvbbVG/hX8Y81Pr8ezU8
	BZmlMsIRSW35Ykvh5+Jw51s1gp3MoiUJDqg/tCwVOSdQdisQNlQJZoxvthh5VeLgtv8ovEAAJHs
	oUN50P5DWLwTKSH5r++QIxUzj6OyF+UE=
X-Received: by 2002:a05:6402:27cd:b0:6a4:21c6:1d14 with SMTP id
 4fb4d7f45d1cf-6a7e85e4d77mr5260992a12.0.1788563730187; Fri, 04 Sep 2026
 16:15:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <61175f9015771b6a6d78624579ecc180f57d17e9.1788277742.git.mattst88@gmail.com>
 <CA+=Fv5TYnwcDLPvwScOcGq-7CUSs2bDMqrYEj-Lhf4XfQ=yTzA@mail.gmail.com> <apsqmKw1pLmOXVgg@creeky>
In-Reply-To: <apsqmKw1pLmOXVgg@creeky>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 5 Sep 2026 01:15:18 +0200
X-Gm-Features: AcwNN1VmVYiQOCieWwnQgTF_EcXBKZAMYOMzLNI8gu2I3ggOXSm8eITiFc6_Xk8
Message-ID: <CA+=Fv5Sg1KjAZZ3X=Yh62hUr=5qeRg_ZVq=A_C4bBovde1MeoA@mail.gmail.com>
Subject: Re: [PATCH 03/24] alpha: select ARCH_HAS_UBSAN
To: Michael Cree <mcree@orcon.net.nz>, Magnus Lindholm <linmag7@gmail.com>, 
	Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, 
	richard.henderson@linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Fri, Sep 4, 2026 at 10:31=E2=80=AFPM Michael Cree <mcree@orcon.net.nz> w=
rote:
>
> On Wed, Sep 02, 2026 at 12:34:50AM +0200, Magnus Lindholm wrote:
> > On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com>=
 wrote:
> > >
> > > GCC's undefined behavior sanitizer has no architecture-specific runti=
me
> > > requirements. Enable it for Alpha to allow UBSAN instrumentation of t=
he
> > > kernel.
> > >
> > I tested this patch on top of my rebased Alpha GENERIC_ENTRY patch on a=
n
> > AlphaServer ES40. The kernel built and booted successfully with
> > CONFIG_UBSAN=3Dy, and the UBSAN instrumentation is active.
>
> So have I, on an XP1000 and ES45.
>
> > CONFIG_UBSAN_ALIGNMENT did expose a misaligned struct bucket_table
> > allocation in lib/rhashtable.c. This appears to be a generic rhashtable
> > allocation-alignment issue rather than an Alpha UBSAN problem.
>
> But in my case the kernel vomited copious misaligned access reports,
> so many that it took quite a few minutes to boot and I lost much of
> the kernel log before disks were mounted.  A few examples that
> were recorded later in the boot on the ES45:
>
> Sep 03 21:12:36 electro kernel: UBSAN: misaligned-access in net/core/dev.=
c:1401:2
> Sep 03 21:12:36 electro kernel: member access within misaligned address (=
____ptrval____) for type 'struct net_device'
> Sep 03 21:12:36 electro kernel: which requires 64 byte alignment
>
> Sep 03 21:12:36 electro kernel: UBSAN: misaligned-access in kernel/signal=
.c:4362:4
> Sep 03 21:12:36 electro kernel: member access within misaligned address 0=
000000058e1e939 for type 'struct task_struct'
> Sep 03 21:12:36 electro kernel: which requires 64 byte alignment
>
> Sep 03 21:13:04 electro kernel: UBSAN: misaligned-access in drivers/net/e=
thernet/intel/e100.c:1941:36
> Sep 03 21:13:04 electro kernel: member access within misaligned address 0=
00000001c866fa6 for type 'struct rfd'
> Sep 03 21:13:04 electro kernel: which requires 4 byte alignment
>
> Interestingly "kernel unaligned acc" in /proc/cpuinfo remained at
> zero, which really makes me wonder whether these reports are all
> false-positives.
>
Good question, had to dig deeper here,

Not false positives - real UB, but harmless, and I tracked down why.
for_each_thread() and for_each_netdev_rcu() are list_for_each_entry
macros: their loop computes container_of() once extra per traversal,
unconditionally, to test for end-of-list. That test compares against
the list head (&signal->thread_head, &net->dev_base_head), which lives
in a different struct entirely (signal_struct, net) - not
task_struct/net_device. At the real end of the list, container_of()
still subtracts offsetof(task_struct, thread_node) from that head's
address anyway, producing a pointer that looks nothing like a real
task_struct. It's used only for a pointer-value comparison, never
dereferenced - confirmed with a printk inside find_alive_thread()'s
loop body that never fired even when UBSAN caught the same line. Zero
unaligned-access count follows directly: nothing ever loads or stores
through it.

If it's worth fixing rather than living with: the sentinel comparison
in list_entry_rcu()/list_for_each_entry_rcu() only needs the raw
pointer value, not a type-checked container_of(). Splitting that one
use into an unchecked pointer subtraction for the loop-termination
test, keeping checked container_of() for the real element on every
other iteration, would remove the false trigger without losing any
real coverage. Not alpha-specific, so probably wants a wider list than
this one if someone wants to pick it up.

e100.c's struct rfd is unrelated: casts skb->data (not guaranteed
4-byte aligned) to struct rfd *, writes via put_unaligned_le32() - UB
in the cast, safe access after.
Not alpha-specific either - list_for_each_entry is everywhere.
CONFIG_UBSAN_ALIGNMENT just defaults on for us
(!HAVE_EFFICIENT_UNALIGNED_ACCESS) and off elsewhere.
Confirmed on the UP2000+ rather than assumed: 7 reports,
"kernel unaligned acc: 0" never moved.

Magnus
