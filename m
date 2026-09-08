Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D003A901C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854890; cv=pass; b=nAwpasZvLxVlIr+6Km6hjw5EjkyasjVO7gUFEEgnbzY5rIFjV7K/1L4WBP+KVpTUv6bx6GyDdZX3TfnbKEGUa78pOZU4YxjZsQRmLQbOmcl8FLTXsGBFXBDuuaW8hOM3/O7XcL5lTdOrJ8K3kNj6aFdqD1QHduX+MVpB6fElzwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854890; c=relaxed/simple;
	bh=tXGbdgcqzz4CAJeru5w2V89eLrYgFnhR0h4hmZG/qUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JRgdF31uBhabJbHorUiTO+ttIkDHc/sm6yyCvg6UGZAUoClaFbS8F7KNLDnZHlzkD63/W5/QOQR8yhcDXSrfxOqsJn9YdtH+Rp6oawWAxLmEAXlrce7pk6vumjXC6JHRJQULPGXeuiT2udI+O+sANsmqCeOKhOJR+hf8aHtw5Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ludBNOlo; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ludBNOlo"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so494046266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788854887; cv=none;
        d=google.com; s=arc-20260327;
        b=XiOGPf5Fu1qVyLrOkXTP/GohYleyu++iBtBey1WrhWyci5ksr73gvMXYyKA3dJq144
         qua0eTYnN4AEgdBNSYvIqMFsBjKj140S19FcdJjJfdkFkZc1Nxk8UkCCrvtXwPaF9WGH
         vsnynlvnv0p0lvlXIsmMFNylZGEpMasuOPcxsiZ6j9FOiPHXQrLIFV89rPhDIe8mBZn+
         yuAOiz3zTqWAo4NaGlHH4eUcgEkuMTwuzUHF3M7K+vwIqYkopdAAiWcU/x87CaMEy1t9
         ijyvIZMAL2GIDs4cioHVpQfpoeQYg6ZRcMA+QX8kpezJkkShd45KG58m7OLQ9ksZeAJc
         4aEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sa6upqADQlqR/MmaNL6A6E6rZ+XVW/lKGKReqxKXRig=;
        fh=l6jLuk5c/J5ab+9rT+MbXO1QrN04ok333Q9diHZfESM=;
        b=avAVj/D3yo7q6eLvHCQt54og47LEffIksHk0crDz4oNvxrvCWlkrYOoP+7yEOg4aew
         dVYSALjdUTPaMCZ1JAzhFZSmdxo3Mj2YcjkN5BGRIC2CIYahXEMV8Cwa5I3+0B8KsT5Y
         5U4qe3SPeJ4Nu8kyCfrhc7iNvaZSUAZZmo7EQIXTCmqyd/PNInAjv5qorraxzJ11InoQ
         cLpH7/6dlP1iOVmgLQsya1cNFSHwrbCSlNrKA0Xzy4jWYghHVxt85N0Yi72rOiQ/4r+J
         Y+zUr38Acb4N7xQvONT3bqDX0jFFABun+JhaNA8gLGQG5E0q8T1IQKQMTCH0I1jz3q+2
         diLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788854887; x=1789459687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sa6upqADQlqR/MmaNL6A6E6rZ+XVW/lKGKReqxKXRig=;
        b=ludBNOloWCYsKmGBwbyjEB7iHpzPOQ3dJGazMLGksLvgB9tqpSjkhZZxa985so1aH2
         3pJ3E9pb+nDj7A45X1dK6twrpqjolQedV5+W2jH7IoQ4KLzQ0rbLmzPr9+uI6A1PNEtX
         2wgEyZyI7usjpevhUo0cA4xM5Gmq+onUCT+74Xk8jAh2emolxJtBeaKcq/x35AuJWGnN
         kDddntYipUOWh5Ovm/s0zRY8XKgWlUgAQVKd2iL++fYQDzJICt/CIWxZjj9T5Vx8EERN
         IRW2R7mbL1ehStJfxSr0MTvtL1hoDMwWyezFCc5QL/0XwDy3Eu6QQTCV4A/Ri5V3yx10
         K+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854887; x=1789459687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sa6upqADQlqR/MmaNL6A6E6rZ+XVW/lKGKReqxKXRig=;
        b=Vrjm/duR/XUzS0hqcBeVKpEiy0L0izWZbed2K0536e+b1ZlGeQLUt7bPJ8eoKW8ICJ
         +0gyANPnQs4UBcpu8xpID0SuX/iOhI15YmTL+l1BVEodUv2kJwE+E2cgTXG/2ZvNDW0+
         1i3hRXb6wMgjz0pMj0EVT5csX3XOUtFf1JvW+bQiXBrv5O3RAcGgBTPEF50QkztF0SDw
         0GfH66i5K0CookS2hPgxNTMKEpsS9RvUp3p1f0zlk0ZrK0oWbkstSW45R6iich3V4++g
         2TDEl8hZ6aPtJfjEbUYyxNKGUb58xH+Ae0KMQ+/9/H5OSTNsWSu5GT9NRpDzddNm14p0
         dtsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMOYDxI4ESn37uPeUqko9bG7emlKXVvJPnivL9iTJ1Oss5xllXhBt22mCvkGXxJX/2YEra99eGwGMvHes=@vger.kernel.org
X-Gm-Message-State: AFuF++ki3DLU8SlyUCwCfuOx8Lof7kk9rpj2F+8CdEBV36WYZmku2tUr
	/H1jB6p7VMuXpidPGn21ie0B2los6do6+zWu/A/KLob6UzOS51iefUOv97PPMoTuXA06vm1S1gv
	nxiWoMojx9EkJ4IIRXBKaHrF1wOa4Fi0=
X-Gm-Gg: AYBFou3vurc2okOWmgEtD5t33OvXd0/uEtmBaGCBgY9UoofA1irV14hpbp1ePkpKrFw
	Q7Fe2ciHxvvQ1fRgdVrlgoJ/x4OccxzsFJWQwH4WFg7tGw+bGRE3bCrFg4h5Oi32ivBDYQ7E0SA
	nMMs9lX5AWrONicY6d4ANy4dDsgZK2yAFsOl+A21+noOF6oYflBW4Hh59IA8JPuU+fOBQXYAMZt
	Rhe9maKIBE8ruYbm2ODeV5T7y0wiNCvP3/v8bGUyWF1BvKtBa9GXXR/RqPit3KaOBFnqstn0WKQ
	hKv7MXMA8gU0IMPgfKRGgm/pUQSD8DAb+VJEvGYyDVeb8lAKL6j7v/9dP0VKi8mcfgZn0EZmXcP
	dheJ+BHfDOQ==
X-Received: by 2002:a17:906:8d89:b0:c24:c250:a6b5 with SMTP id
 a640c23a62f3a-c260c993a9amr1051714266b.12.1788854886462; Tue, 08 Sep 2026
 01:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9fbb6bf2-70ae-4d49-9221-751d28dcfd1a@redhat.com>
 <o6cnjqy4ivjqaj4n5xphstfnk5jznufaygwmfkm2gyixqgfump@7fc6c6h6d5if> <28f144f8-431d-4c3a-a362-56083bb77541@redhat.com>
In-Reply-To: <28f144f8-431d-4c3a-a362-56083bb77541@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 8 Sep 2026 10:07:53 +0200
X-Gm-Features: AcwNN1V1vd5mVM1XveYVMiH3ACcL2s2pHzLcWY3GJUvl9XLSZ31SO_QV5_aeSjk
Message-ID: <CAGudoHFJne0q+dnjYdXOyDKEfu_zZ71_z+kSiUPiHWG7jCBw-Q@mail.gmail.com>
Subject: Re: [PATCH RFC] fs: cache-align lock_class_keys in struct file_system_type
To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, David Howells <dhowells@redhat.com>, lkp@intel.com, 
	oe-lkp@lists.linux.dev, Alexander Viro <aviro@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While I'm not convinced spending time on the resulting bug is
worthwhile, with the arrival of sashiko I think you should rebase &
resend -- it very well might just point out the problem with 0 human
effort.

On Tue, Dec 30, 2025 at 11:45=E2=80=AFPM Eric Sandeen <sandeen@redhat.com> =
wrote:
>
> On 12/30/25 4:04 PM, Mateusz Guzik wrote:
> > On Tue, Dec 30, 2025 at 03:07:10PM -0600, Eric Sandeen wrote:
> >> LKP reported that one of their tests was failing to even boot with my
> >> "old mount API code" removal patch. The test was booting an i386 kerne=
l
> >> under QEMU, with lockdep enabled. Rather than a functional failure, it
> >> seemed to have been slowed to a crawl and eventually timed out.
> >>
> >> I narrowed the problem down to the removal of the ->mount op from
> >> file_system_type, which changed structure alignment and seems to have
> >> caused cacheline issues with this structure. Annotating the alignment
> >> fixes the problem for me.
> >>
> >> Reported-by: kernel test robot <oliver.sang@intel.com>
> >> Closes: https://lore.kernel.org/oe-lkp/202512230315.1717476b-lkp@intel=
.com
> >> Fixes: 51a146e05 ("fs: Remove internal old mount API code")
> >> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> >> ---
> >>
> >> RFC because I honestly don't understand why this should be so critical=
,
> >> especially the structure was not explicitly (or even very well) aligne=
d
> >> before. I would welcome insights from folks who are smarter than me!
> >>
> >> diff --git a/include/linux/fs.h b/include/linux/fs.h
> >> index 9949d253e5aa..b3d8cad15de1 100644
> >> --- a/include/linux/fs.h
> >> +++ b/include/linux/fs.h
> >> @@ -2279,7 +2279,7 @@ struct file_system_type {
> >>      struct file_system_type * next;
> >>      struct hlist_head fs_supers;
> >>
> >> -    struct lock_class_key s_lock_key;
> >> +    struct lock_class_key s_lock_key ____cacheline_aligned;
> >>      struct lock_class_key s_umount_key;
> >>      struct lock_class_key s_vfs_rename_key;
> >>      struct lock_class_key s_writers_key[SB_FREEZE_LEVELS];
> >>
> >
> > There is no way is about cacheline bouncing. According to the linked
> > thread the test vm has only 2 vcpus:
> >> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
> >
> > Even if the vcpu count was in hundreds and the ping pong was a problem =
it
> > still would not have prevented bootup.
>
> Fair enough, it really didn't make sense to me.
>
> > Instead something depends on the old layout for correctness.
>
> If I add ->mount back to the /end/ of the structure, it boots fine again,
> so I guess nothing is expecting specific offsets within the structure
> at least.
>
> (If I turn off lockdep in the kernel config, it boots fine again too,
> FWIW.)
>
> > By any chance is this type-punned somewhere?
>
> I don't think so...
>
> > While I can't be bothered to investigate, I *suspect* the way to catch
> > this would patch out all of the lock_class_key vars & uses and boot wit=
h
> > KMSAN (or was it KASAN?). Or whatever mechanism which can tell the
> > access is oob.
>
> Can't do KASAN or KMSAN on i386, AFAIK. :(
>
> I suppose I could try such things on x86_64 just in case something shows
> up...
>
> Thanks!
>
> -Eric
>
