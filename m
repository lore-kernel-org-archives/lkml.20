Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793122224;
	b=H31Q0Eu1SdQVI3/cFjwkithWP1qz6sMzJ0Nn3ffoCCqXSmvX8XuPfOA4GmPkEwZ2qRho
	 kCY9Au3YXvRdIM/FwTeJRmS3HQJ3ErvaikZj+Aze2IRBuWwGUgCpfIwUiiiM9MF223EsQ
	 X0K1vFt7Oz8XY4q4qrhBDTHCVpH40fjlP3D+OstFHyQrFCIKMFVO9HfGQJizNL6rTn+KL
	 L8T7tmhiqW7RD4C62Uxb/emKEHqUhRF02oVZsYZMKUyLaAae/qTfZTnVTTEUBVF1EvJwq
	 27Gy3MJMEpbTl0a+8gGO+kC4Q4tzW+WgiW5m6sCO4cx336Qqo2zXoexsPXXm3XgOXGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7gQ+97vReKa4toS9130cb0MEUCUe5fofr2ehSKz/dNw=;
	b=1zRHke6NBmhlot3oc1WuuMsA4OeM2z9GyXWJxK9bLcGCkKSvpCoG06M6S/MtvgDx0qAD
	 NdCtYuDWyZDaVSpJk3JPKw/6BpwAHsgWbQd35I4l0z3NA2m/Pgr6gLdRPVZTRsafA4WXz
	 fTriUGqs5YpGhoffU8zIjEjjkfQvOWxYEPhyidc08NPBfynk1CyFWAAm2m0tQjF/7zWdQ
	 5g3DJ+bps6ry47gU/BebTrh/GDs6BOoQYpxvjrCkDpQvbkvxxYdRynQOqQVAf5T2/SrwF
	 PFuDaSHZU4BZQ54UWOQ5NXOOipOjmz1DfywhKd/KZ38bA5MDTKll/gWOhHX+oXgaIdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AH5XVSYu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926CA606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 926CA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AH5XVSYu
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c3fd91337baso7588866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793122222; cv=none;
        d=google.com; s=arc-20260327;
        b=qkVQCO/4XXAK2bakMpij9orC4Xb8VxXd0SAlLLLQiZ/FYln22HzOQcYL19ZnSPQZmV
         S8hYWkmQhXoJUVcruTJ5S4BFM/ck9dRYU4NTCU6iE6U20t4W2S1yfTqbCR4Rg6jpCsRr
         VpGNAvaHnkwAxXdFpjXbPyPc11t8TXM03MPBKH50D1vUQoZwSJO7dXjrObFLtwYtjTMX
         qaLw1FRLrAw9atOltOTz23LdFKN7u8PgdLH9ogwHKL9Yp3b2KYKrdNag+27zg/LCYha1
         O9JXp7ZUo5f4bUtmky3MU26+6E+uPVQ2F3MZg6j4k9CmKIuf26mnI5H/KZPJTIVpD2YY
         Oj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7gQ+97vReKa4toS9130cb0MEUCUe5fofr2ehSKz/dNw=;
        fh=eLczGJqkviqPWO5vKiYSxErywVGy1h3ZPP3BjM1NnKs=;
        b=Jnr4Kq+ww5/S4TrwBb0owoq33lhBbs6QrKxurVGVqjzgBDtrI9MdROYjKU7ROSeiRh
         1wCcDolmFziZkVCV29AlO8XgRTk/4dIWDxKVahL8ufgiSeSrVqIrMLBD/AMwrMAiOEAH
         VZcIFoSnjtAv2ke2U0Hg7UHHINOTB/bbdvlPCbnAfj0frUIo0a9UtQm0ASoV89BEqRIs
         JSK2NkLdCMcnI8XZo5BJvgspyUu1YmGS4fHyIiBHmVuJ1MJ97RLBi6DRo2Ew9z/jTx6P
         WoqPsntR3F3ZbsE//pzNFC4ZTArwE1v51r5s73u8syFH/gnYWm4gvu1kd3oLt/O4pOyO
         HNZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793122222; x=1793727022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7gQ+97vReKa4toS9130cb0MEUCUe5fofr2ehSKz/dNw=;
        b=AH5XVSYuq6HUx6QejcrLzJHXiZbWI9DboIxOz+yByNgh84gxZAIKBuzZHV99EG6rqB
         sL71z4Wm6MSPA3Nnza0i731ilrImuFj3jUTow6hkS/0r7bYzxQobbOzdeIyt6ASGeEbF
         yTa0PHt944q+HSgG6NrCVe3wZJYFAVwhpzaLqX011nHEVLqO4I7UJy1zd5cfMTXQHdaA
         BSUKBBxl7R08MamwKyO7Ss8mI2wGFLi7Y2RxS2XZ75lMQCOMaDZ6YNjy/Um35SI/BQEx
         H9A/IMXo16KCWMivgQdBOKUL0g+UWglSQzebhEs3U4Ckl7bH2Y72gGHNDHSXACje/sxH
         22yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122222; x=1793727022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gQ+97vReKa4toS9130cb0MEUCUe5fofr2ehSKz/dNw=;
        b=H0Ynl+2usjxsmBtEK2uRX3gQU7g2zdZ7m+vHqWhvV/CdnKwaIq8mbVLvu94bgu92wa
         zupeeeX8hQhaYAHnC9C4hFpsAByztquiyLVbRyfsPCUNoVHzDhjRBuDyluIYOtSXCvXt
         dHxcgKUbji7tLn2pZU09APOc4BtsEdLFyqxp6tC5p3lk7zlfJ5z5zeoRjybDcF81BfQK
         5kkrbAmtiYnFpHJ7WN2bAFhlTwdGQ28O00rDQSiEVzuwnava5Mk/n3SBOGrK+xOh+jOy
         KHto+WPL5kmmdGpCj2fNObsJ1MWzV0bSm9tQ5wuWttmdSolx6OuH60XVEiWqoL9Q9bR1
         sVng==
X-Forwarded-Encrypted: i=1; AKwUvBwAGfYmcw/yUzKNIWGQomQC8liIoLgJqcJ/KU4rhJxzrkGn2I5vmDFUqQtBm5QLJkQ85CsWBYbHWffqhfc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsTV2SL0VS+l9lxlNSliMCw7tbJvdwTWibfYdohYcrCkhe4moS
	N9qffhqsj72ohfamzSXgeJMzU9B3jHZ8jhdmCX4e6ddPkQYRuwlyji0xbY8Fltspzy69Ms07FZc
	yLZko4+7e1BT3M70V9J+XVcdy5UjvWw5UiP6pyQWA
X-Gm-Gg: AYBFou1uomn9Ja+V7NJE+VR/nP8sEWY81lzHr1l8PGtHlzO+apS5wFDGmLtsrZJDMZ7
	Kop0d7beVYvB+rl+oUz7VCIwBtVpQ5eJJCN5vhXQhCSLzKt7ABBlHh4tn9zjxLLA4y61mzXspsz
	5V7R5gcxtc9xf9uhc86hzcE7dE6hNkR6lTYMTj4ahZNNh4hOwQkuNN1Azd0KKipzJLO60Tc4erK
	dndyHMcYr8Rzl/m5tzc8Lc6nvfx/EouWP4JMPtXlsImGaESeO+pV5bZpRFbHO2Q0wZ5p8ILNtdw
	x9ojMRWyhl07DV7m8XeDbg2uCTtQarf5VjscmG25OBEdwP7Br0HAOeTg1AgS+/Aj1goGxC04Rxx
	0u5X59Rro1NWgvX4Qma4IdJSOMvaeGAw9TSSY66m3AT2lfiEBP3E5jB/gqmY3a8JobSANjocf5U
	Lv332Pnhb9Xu+lt/d77wYRRBLVYI5LISd7zbDcsoJi3KuhXcNMY+Zw5OczR1GPCEBMyKsQwLgtC
	z3YDEcgrA6vKt+TDAjW1KzQqPuGDO8vwQ==
X-Received: by 2002:a17:907:80c:b0:c46:6a50:40c2 with SMTP id
 a640c23a62f3a-c46bdee2675mr1178260566b.39.1793122221137; Tue, 27 Oct 2026
 10:30:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026215226.3713941-1-jthoughton@google.com> <14f5f919-55bd-47c6-a1c8-6f1445cce733@app.fastmail.com>
In-Reply-To: <14f5f919-55bd-47c6-a1c8-6f1445cce733@app.fastmail.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 27 Oct 2026 10:29:43 -0700
X-Gm-Features: AclHuK_V7ZmMdE83iy-wOvaliSqHMUcbKVcnfqQwnRgRgjPYRFDHKTZOMwXOk5E
Message-ID: <CADrL8HXQdzcroeGN-ACjyy-jSAdBNHiT1_BCVVe0P+Y8ZueiyA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] uaccess: Refuse and warn on user accesses when
 current->mm is NULL
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-btrfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 5:13=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Oct 26, 2026, at 22:52, James Houghton wrote:
> >
> > This series comes out of a set of bugs that were found in KVM where the
> > kernel can sometimes write to a random process's user memory[1]. The KV=
M
> > fixes at [1] are still required, even with this uaccess series, as note=
d
> > by Sean here[2] and below in this cover letter. The beginning of this
> > series includes fixes for similar bugs found through static analysis
> > with Claude Opus 5.5. I don't think any of these bugs are more severe
> > than the KVM bugs[1].
> >
> > We hit one of the KVM bugs in production, and it was challenging to
> > debug. This series makes such bugs, where the kernel is doing uaccess
> > without an mm, much more obvious.
>
> Nice work!

Thanks!

> > Such an access does not reliably fail. The user portion of the address
> > space belongs to whatever mm happens to be lazily loaded, if any. If
> > the access faults, the fault handler refuses to handle it and the copy
> > fails, but if the page is already mapped, the access silently reads or
> > writes another task's memory.
>
> This sounds like the problem depends a lot on the architecture,
> and to what degree they implement lazy mm switching. If an architecture
> makes all user pointers invalid for a kernel thread, this does not
> actually happen, right?
>
> E.g. on arm64 with CONFIG_ARM64_SW_TTBR0_PAN, the page table base for
> the current process is only set in user_access_begin() and would
> not point to any task here. Without ttbr0_pan, it should be
> covered by cpu_set_reserved_ttbr0() turning off all user space access
> for kernel threads.
>
> Should this perhaps be addressed in architecture specific code
> instead of in a common place?

You're right that whether corruption can actually occur depends on the
architecture and config. I'll write a note about this in the v2 cover
letter.

That being said, I still think the right thing to do is to have the
new check(s) in common code. Instances of improper uaccesses are still
bugs, even if no corruption occurs.

> > =3D=3D The New WARN =3D=3D
> >
> > The rest of the series makes the generic uaccess helpers WARN_ON_ONCE()
> > and refuse the access when current->mm is NULL:
> >
> >  - Patch 6 adds uaccess_should_fail(), which combines the existing
> >    should_fail_usercopy() fault injection check with the NULL mm check,
> >    and uses it in place of should_fail_usercopy(). This covers
> >    copy_{to,from}_user() on all architectures (including the masked
> >    user access paths, which never call access_ok()), the
> >    __copy_{to,from}_user() variants used by KVM's guest memory
> >    accessors, the user-backed iov_iter copy routines and
> >    strncpy_from_user().
> ...
> > The checks are deliberately limited to generic code. Accesses
> > implemented entirely by architectures (get_user(), put_user(),
> > clear_user(), and direct users of user_access_begin() or
> > masked_user_access_begin()) are not covered. Please let me know if the
> > new check should be placed elsewhere.
>
> I would think that user_access_begin() is a more natural place
> for the added checks, as this should be called exactly once for
> any function that accesses user space and also stays out of the
> way of the copy_from_kernel_nofault() etc.

user_access_begin() isn't used in a lot of places that I want to
catch, including the KVM case. Roughly:

  kvm_write_guest_cached() --> __copy_to_user() --> raw_copy_to_user()

There's no user_access_begin() in there. :/

I do think user_access_begin() should have the new check though, so
I've added it in the v2.

Thanks for the feedback, Arnd. :)
