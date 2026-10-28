Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793179232;
	b=tOak6TLzWEyihW1V2eWOf5NJiZCq8Ba14Vb1j3XMw5ORx7/4Yasv4DgAjhv9cOQlJm6h
	 2c2Qh2rTLS8wXoED7dhNzSrW0eSnvN7S61KuiPbvGRreb8KlZNpknbo8YNFF09usg+/yf
	 TGjM0x8f/4XUKaom0Evt/8qebgBv+PrIveOEm+GU9bSWSisdZ5+eHSVk0k7oE22+iW1qm
	 1LpTS+IuSiy5tiqtlwSLOyj8BsXvFdWhjuLdPOIulE41JUQog4qHIugfv71Dw34IRFtjy
	 F5iC0o7qwMNB6dk5VAD7A1gpuVAWjaigMDvivGJfzO5Y0pZneGWPnw+hiR/hPW7VjHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eh6BZCEmCk1ZVXixUmTLxWjuWCHZJ05b87AiZULAR6Q=;
	b=PShX6TsJUqUHimMNmVYOsDv58AAeoqaCZhppg4neIINnX/qS5B0FVbrjfY3Vg0PnLzQ3
	 Z8ggrcmhxCeY6wWD+GcbqXrLdMt1zlBrlFud1MHwDg7esKz45m+nshoWqQWXngxbr3Jmb
	 NPdwdRPyZjt2qj7JgOkjD6Tyl/YRk6pyg5TIAlVDFspZpKdpEDoAz5KPybcNhgF9mPaWs
	 VNo0Z2cyAcPHEpoMhXsIDMFunMSTFdXyk3ReF+tjcCVf9Bw39aLCCE0AMkRzslxKRmL4k
	 Gt3FhfqLfS8VvcfNk+NEcHwPdk0etSUaLkObIHCcTiK2a72GA7pB7Zl/EOCLhTm9bBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i8fLVYCC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDD3606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DDD3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i8fLVYCC
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679a2b5fe87so695698d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793179231; cv=none;
        d=google.com; s=arc-20260327;
        b=AniNDjXHHeDmmKzAZufPQVHBp8aUquDcYqyVTNyJyoKSPAUR31ky3HUOTvNEihxwy3
         cdbUUD0RoZhxV78Lch6n8urBA45NYenPDS+vNFXFlbpF8Zz07S3CZfncqJVyqTkxFT7H
         6lS1ojp4/6+FYhdMeDnVQ/BaWCUK4RIzfItrl2M7pN6VjK65oBJtubEWOetwTWkY2sxU
         IruKGYMg2Gbeyy67jjZtpQGViGKw5+LnhMyYFEIFMjmuSNS+wVZPWFbPHZk58syj8f5g
         h4FqQ8X8lPEzwVqhTUVmRWNYy8XYCzL3vkdEMzV0HEd6sEvJmgANj0IfmOEmMfT+lnZ9
         0niQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eh6BZCEmCk1ZVXixUmTLxWjuWCHZJ05b87AiZULAR6Q=;
        fh=5JzUVZuy1aelhFv6gOnEuZWQixwn/L/bmBuUIRBSrtk=;
        b=AyW7Xxa5mbQ/4dVW/IuFREK3C8Ryk7hFWHD/yBZhcONwpJq3z3frmrVR80XHxp219m
         8VzlOhtVrLgzmGPKskXZ5/jiXgqos4etgOg9P8sxsvFodry0oRKvlRw+z5IWj+jHzHyy
         hJji6YLuNPYysPblP6Kj+k9t7VFN3HeuZctUScAsanO+LdIh/Ox24dZmRzctyNgHbaRW
         /V8DzLS5/0QleveaEcELpt7g2FNR5VeBK6QaQaH2d+K+MdJv22r2VTf7XdRGdYtYv67H
         PxIWBKzas2SojQe2cIFfbhyEAWFgMM5aVnEhzIUyY1z6G6u91ZcG9AA3l6IY7BkB77Xw
         bNGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793179231; x=1793784031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eh6BZCEmCk1ZVXixUmTLxWjuWCHZJ05b87AiZULAR6Q=;
        b=i8fLVYCCaKVOh3SPBcNbSk5j5GMBi7RlNKGoB2Z5YPH2wnHVnEZH6bWddEIROEAB8E
         loCXxuaQFIQBR6QUMECQJb3TiLNJQqXdNFoEKUxGzcot0G5CCtftxpdd5I8FYdujSoi1
         jwksECoM0od3XqduRIrXcWZdclQ89sq4uQziHicxCs5+gk28AxXXA3+CURVselzQJsFB
         ZKPCN7Pdw+PHNJE5fv/7eCWop6U/Cu7OkPu9B3svqB60KwvLw64bx9HCLKlj6+Yr6l/E
         I0lMvDVCh3SiY8mKrxtRrMDgmKjcn5AudGHuBh1eqR1a9cl+yC0IrW4vX9/f22ivfskZ
         Kj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793179231; x=1793784031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eh6BZCEmCk1ZVXixUmTLxWjuWCHZJ05b87AiZULAR6Q=;
        b=M/jJN5cNe+38AMQTOUym4QncZr56iIiFrg9ASQpzicAt2SOxV/qnK5QZ23+4+w532U
         RLkIAklylnm/iYVYTc40xROkgvtftR2W1s9mk6BD3TN6kVjBnWYs0zLi+IJoU8xNP3Pz
         XpW8KAXe7MZLMALER9qASAHPT8E4i2P2uewlndyonwB2UBc/7QvSlckMyBfdLDvwBoP1
         J/3SmJqu7N+MN8niEbrt0b2eM0/9l1LOVIJOC417cDsZNTvG7VUHPIuTEx/57PZuLjox
         6w87pQYg5noFdB+5ceU67lR4zOFU5uCLo5VtGWXVGSYhxsa75QO1BTBYUaDjV7Mr4/OA
         54lw==
X-Forwarded-Encrypted: i=1; AKwUvBwhfkht5yiBlIdE+yYPRQsG6L2fPYdFnuMBksvXFua+3tRO0bPGNf4x2c2cV+Z/n+uA87Cm65vxpAIwAvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKASDiH8s5gVVZ24l+yykgzLxBURh3ntg7diTWiQDro+3QUZrV
	3btX5kATzk7PQx1z5B5qbmfqgZnkseR/YcUOMXqvCss73c316jSSly4FIBAMM/HBZP58lm+cL1V
	qYIceyYX3a0ONdJgoI4QH1BPbqgt91Do=
X-Gm-Gg: AYBFou0YOySm1DxjiqFj6xHr27s+LYI6DDas6X/50G+vcyraWScoyU8A/Xe8Ox00lSL
	IBr3Hlcu1cYhC4AG1D/mkdo37XtpBTGA2JmnmeY88/ioxjVd5+xiBYt96MrNadhKEmUfKufKnLZ
	F0f7kPaVcE/pBpG1Gojqn7LIXJXBBHcK76MhkG3mG4KKwls5WFTdRDBCQfnw6GppcyJIkufBYFu
	LfWETAwwC0IBmjKfoK4EosLYOql4gU4PWN89H8vUySQsMTSR7T9Sls4m0+0lUfbwn49lpqhM4XJ
	JVDtkVt5hLD7nzsQmNBFYmyE8C0pkoDSWaLD6rXoAoyr/uf0aeBW+CyW5ppKG3ZmiPMCEvRoTnK
	v7gi4PlpKagEQUYzbwpiiNxBi9k3nWxUsFcw=
X-Received: by 2002:a05:690e:448:b0:679:992e:3ac4 with SMTP id
 956f58d0204a3-67a7bd59ce2mr983590d50.150.1793179230888; Wed, 28 Oct 2026
 02:20:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-btrfs-fitrim-freezer-v1-1-0ad1d58aa94d@zliang.me>
 <CAO0HQ0UE5BtevPHHfV9mQo5HoqzxzDDjAkj9e=pD_0AaXmSYFQ@mail.gmail.com> <65fd2260-78e1-4521-9df1-b042788ae7bc@suse.com>
In-Reply-To: <65fd2260-78e1-4521-9df1-b042788ae7bc@suse.com>
From: Luca Stefani <luca.stefani.ge1@gmail.com>
Date: Wed, 28 Oct 2026 10:20:18 +0100
X-Gm-Features: AclHuK9-DzQDAG9TREsG2UeosGG7kD222ce8lEWGULjSuRCq72uxpwj0uMq-JIo
Message-ID: <CAO0HQ0W3rALzPX59mVONjDtK1otyS8bo6_hGG6og3qwyLepmnA@mail.gmail.com>
Subject: Re: [PATCH] btrfs: do not leak -ERESTARTSYS from FITRIM to userspace
To: Qu Wenruo <wqu@suse.com>
Cc: zhiwei.liang@zliang.me, David Sterba <dsterba@suse.com>, 
	Chris Mason <mason@kernel.org>, Filipe Manana <fdmanana@suse.com>, Robbie Ko <robbieko@synology.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Oct 2026 at 09:57, Qu Wenruo <wqu@suse.com> wrote:
>
>
>
> =E5=9C=A8 2026/10/28 19:21, Luca Stefani =E5=86=99=E9=81=93:
> > On Wed, 28 Oct 2026 at 07:57, Zhiwei Liang via B4 Relay
> > <devnull+zhiwei.liang.zliang.me@kernel.org> wrote:
> >>
> >> From: Zhiwei Liang <zhiwei.liang@zliang.me>
> >>
> >> When a suspend starts during FITRIM, fstrim can fail with:
> >>
> >>    fstrim: /: FITRIM ioctl failed: Unknown error 512
> >>
> >> On a Fedora 44 laptop with kernel 7.2.7, 3 of the last 21 weekly
> >> fstrim.service runs were in progress when an automatic suspend started=
.
> >> All three failed this way and left the filesystem untrimmed.
> >>
> >> Since commit 69313850dce3 ("btrfs: add cancellation points to trim
> >> loops"), the trim loops return -ERESTARTSYS when
> >> btrfs_trim_interrupted() sees freezing(current), and FITRIM returns it
> >> to userspace. Since commit bfb670b9183b ("btrfs: handle user interrupt
> >> properly in btrfs_trim_fs()"), btrfs_trim_fs() returns it right away.
> >>
> >> -ERESTARTSYS is only valid while a signal is pending, because only the
> >> signal handling on syscall exit turns it into a restart. But
> >> freeze_processes() first sets pm_freezing, which makes freezing() true
> >> for every user task. Then it walks the task list and sends each task a
> >> fake signal. The trim loops check btrfs_trim_interrupted() after every
> >> extent. If a check falls in this window, the loop returns -ERESTARTSYS
> >> with no signal pending. Nothing restarts the syscall. On that laptop,
> >> with a few thousand threads, freezing user space took 2 to 5 ms in eac=
h
> >> of the three suspends above, and all three runs hit this window.
> >>
> >> Make btrfs_trim_interrupted() treat a freeze as an interruption only
> >> once the fake signal has arrived, i.e. when
> >> freezing(current) && signal_pending(current). freeze_processes() sends
> >> that signal in the same call. The trim loop stops at the next check
> >> after it, so suspend is not delayed.
> > Looking at how ext4 handles this scenario it seems to me they don't set
> > the error code to -ERESTARTSYS and (from a quick glance) return the
> > bytes discarded to the caller.
> > And like before they continue the discard (which will skip/fail again) =
until
> > there's nothing to be done.
> >
> > I don't know what the intention of btrfs: handle user interrupt
> > properly in btrfs_trim_fs()
> > was, maybe we should just swallow the ERESTARTSYS case in those scenari=
os.
>
> I agree on that btrfs is the exception, we should follow ext4/xfs, not
> rely on some tricky signal handling behavior for suspension.
When I updated btrfs_trim_interrupted I used the same "checks" as
seen in ext4 so at least on that part it's identical.

What differs is our error handling: we set/handle -ERESTARTSYS, ext4 does n=
ot.
ext4_try_to_trim_range only ever succeeds by returning the count of
trimmed bytes
even if it checks for trim interruptions.

I think if we remove ret =3D -ERESTARTSYS; from the
btrfs_trim_interrupted branches
we'd align the behavior (plus reverting the previous change as that's
now useless)
>
> I think the tokens of the author should be spent on unifying the btrfs
> fstrim suspension behavior instead.
>
>
> >>
> >> The restarted syscall re-reads struct fstrim_range from user memory.
> >> When the device phase is interrupted, btrfs_trim_fs() has already stor=
ed
> >> the trimmed byte count in range->len, and btrfs_ioctl_fitrim() copies
> >> the struct back unconditionally. The restart is then asked to trim
> >> [start, start + trimmed) instead of the requested range, or fails with
> >> -EINVAL when nothing was counted yet. Skip the copy_to_user() for
> >> -ERESTARTSYS. In all other cases the partial count is still copied bac=
k.
> >>
> >> Tested in a VM with pm_test=3Dfreezer. Without the patch, 18 of 20 fre=
ezes
> >> during a trim leaked errno 512, and 10 of 10 restarts after a
> >> device-phase interruption failed with -EINVAL. With the patch, all 30
> >> runs restarted and trimmed the full amount.
> >>
> >> Fixes: 69313850dce3 ("btrfs: add cancellation points to trim loops")
> >> CC: stable@vger.kernel.org # 5.15+
> >> Signed-off-by: Zhiwei Liang <zhiwei.liang@zliang.me>
> >> ---
> >>   fs/btrfs/free-space-cache.h | 3 ++-
> >>   fs/btrfs/ioctl.c            | 7 +++++++
> >>   2 files changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/fs/btrfs/free-space-cache.h b/fs/btrfs/free-space-cache.h
> >> index e22443598b..cba2f5fd6b 100644
> >> --- a/fs/btrfs/free-space-cache.h
> >> +++ b/fs/btrfs/free-space-cache.h
> >> @@ -58,7 +58,8 @@ static inline bool btrfs_free_space_trimming_bitmap(
> >>
> >>   static inline bool btrfs_trim_interrupted(void)
> >>   {
> >> -       return fatal_signal_pending(current) || freezing(current);
> >> +       return fatal_signal_pending(current) ||
> >> +              (freezing(current) && signal_pending(current));
> >>   }
> >>
> >>   /*
> >> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> >> index ac070c745b..b02c59cbb0 100644
> >> --- a/fs/btrfs/ioctl.c
> >> +++ b/fs/btrfs/ioctl.c
> >> @@ -529,6 +529,13 @@ static noinline int btrfs_ioctl_fitrim(struct btr=
fs_fs_info *fs_info,
> >>          range.minlen =3D max(range.minlen, minlen);
> >>          ret =3D btrfs_trim_fs(fs_info, &range);
> >>
> >> +       /*
> >> +        * A restart re-reads the range from user space, so do not clo=
bber it
> >> +        * with the partial len the rerun would otherwise take as its =
input.
> >> +        */
> >> +       if (ret =3D=3D -ERESTARTSYS)
> >> +               return ret;
> >> +
> >>          if (copy_to_user(arg, &range, sizeof(range)))
> >>                  return -EFAULT;
> >>
> >>
> >> ---
> >> base-commit: e17e64baf63f7c85bec209ed73f14c1b2a7e39fb
> >> change-id: 20261028-btrfs-fitrim-freezer-d4cba16e7e13
> >>
> >> Best regards,
> >> --
> >> Zhiwei Liang <zhiwei.liang@zliang.me>
> >>
> >>
>
