Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794578238;
	b=VNNVMRfc3ht66GiHyMwK2SiO4ZDrlis8LyY2Z6XFdSPnskHcPyC9E7X9BWXhSe4kJih+
	 RV8Nw8OEF5PLyLWFiAVNq26kTaBob9FaiMV3ORZ/r2TH3jxMnyxpXkikf6VrTiqWQzUov
	 PPJlB+32och58yyJFNnw0MDZ1syQohYwdZjHBRPoH7XzCSKybTR23zkI5yS13Jp0bmueB
	 L2MDUcTLefQl8v/0TWrid6cGkz3qUOt2GRHBejuIH+6aI7Ok8VqQZABb1tkB5rtwycPTZ
	 ZpyZXMs9B8yohGBgkA63wZFV76Fk2vWjScHx3X6T+U1xY5Rsfgcyj0Ad9YLA9g/Swdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oyg73YpJiMIbGke9EcWnaG6kp5irY/WfHZ5cN6Nkeyw=;
	b=i/hqQE2JgASusuqqcngEmxDQGesRSkY4oKhw5/t/V6N4eBuZ9a8C+thtevUN6kSlId9v
	 UvCNklhXnKNptJUdM5DqRR+DDPOFHE+IsDDL18wcMO/SltZ49tP5VzbcupDxCmqltqbSJ
	 TQ7bDXjsiT7tAtSP3TQMD1oS1mbZ4e7vOtC9oeQUlCGBJ7dnYWPRSXszOBGVfmiWFQ7B+
	 LM2mUE6SiQc0s5RcLVv/7pjKQT2ENmj4V90hOXLgJaFf7ewup9r+y5f7gBaDk1lQGfWSR
	 rz26r74vHBLDm9kzU/x2eG2taVmOj+0lZdvHv8nASipnMc45INGd/jkIDV2I17UVmqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MoST7inr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B550606A8A1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B550606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MoST7inr
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-843ea301d60so1237099a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:57:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794578236; cv=none;
        d=google.com; s=arc-20260327;
        b=ea3DpezQh++aaIGdsrnWAhlslzw2rKyAz80AvGHAtNJqevyt+u4B1okvrvAJwBg/gP
         +Dk7OpP+0x+TG2WFebL6uNcqMvcQUFbFYMmW+eVIQx2xSFZbXXh6o0aegWosvYN26r+Y
         xbdajw2LfFBPGFXRMUu1Ip4WPfd0GukwOER/NpJfM4H1e4xCYaY6BE29XwQV77QT9SM2
         /ziWi+3hjCHHXjQQRsjLQ5MjaVm8bMQp2IlV3XX32nk24/lsdtI78PU9xWTjBHiDbTNQ
         eYhaoWL0iqeEwu/0Y8CwNLu2YLjmwp+DjTU6HDNzVa9pu2k6J4M3M/XCwLFKfUw1s4LU
         tySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oyg73YpJiMIbGke9EcWnaG6kp5irY/WfHZ5cN6Nkeyw=;
        fh=LS7AJlNuGj7xO4CXaQy86DJbRgcuO8+CjKvH6GWr9eI=;
        b=qlZXl9pf72aJ/xzvoc4lrIbtpRkTo8Vg5yjWj7bHWyU80SPwplvlPvFZ86kGrKnKle
         2Eb7SBKmCjjItoqMQjkm5QnFucon0DafPz9AdTSmqhFfibAu+pqdG3aAY9pLBvh8Opz+
         OF+6GYvXSm3XvR+DtNw9ZfALiGc69XkQ0XPs8t4FJWvL7U+5A8MclEaPf8vMRfjaNOZ/
         dlYKsorC33PWxaHpvpra5+/gANaycmFmQT7hjde3qVBacsoaGcQbDYAGCYSd/hsUkDBp
         9STFw8j/Iu+QClJUGxNGp7iNUN+mOA6ZcW4y9IT66Mx3prc9AxJBXX0NyVehki+Wb4p/
         saUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794578236; x=1795183036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oyg73YpJiMIbGke9EcWnaG6kp5irY/WfHZ5cN6Nkeyw=;
        b=MoST7inrZQ5+goYt7YZKnNNrtWkfPHcmZt49NCUxGt2+Dit9tS0JgvCKZflB43x9/w
         AsNMb29fZgNMMnMP34a+jRwQgGF6tC3sQ9YPxFvadAIzV7HD4Q0uH/vphiO4apI/SZVF
         x9c2YNRuc/ijhPfaL+dmFhqWXoOvC0tWOt+rukisSGcpdpI5VPeI5mIfX3vtQcftIMBv
         XDmfokpviVaGKM7c5K3cCW7o9PYCIeTkS0VfM2CtLUjXPhX9JjnZ9fGvJul88MjKvQBK
         gHA/8kigOygY0RbdOOQ/vnO3gZJ2AMsmh6qFDzWIGiQusaJLEG++pDhyMnn4x129/s49
         lArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578236; x=1795183036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oyg73YpJiMIbGke9EcWnaG6kp5irY/WfHZ5cN6Nkeyw=;
        b=RgWX4mDjllh84Cpe621i459x7mU2kd3oXGZWqrDtKoTulaFgrwpcyupUL3w7befJ50
         3R+gITdvnC0i1ItzPjrLDZFd7Cri/OjT6dNdkmvaU2Du09OjNkiELjMwKscGIrmPHAgA
         pK51yjleGqDXxEEdnakwqzW1tu9HaQA6yoMwX/8ZmKGwxT9LP3WMWtsbwVbDNQ1WT+3c
         KAhCy4r+nhJL6w58uzoCQg+DaKu7tUwkpBQO3WKTJpS4i6RPVjlTpYlcK4ttz5aYhQUz
         a1nuPewKzM+d2oVp+UwGfMSOxC1ou42BxflSZikmkvQOr0hLMjGQPyUjUc4TfZu2WN+M
         KOVw==
X-Forwarded-Encrypted: i=1; AL+hErHkq4tbTwisRoQ1hKJkEqCBvIiPPG+dBGkt529uXYYRiRzEwufS3ZpXrcajS0Z0fj9I2GLWgSjX0d5ODQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NDw9wBSM9zczKVgWE/Tc0iP1xpc6iHBJ5kXYJpe5MklB6NmIf
	YRD8RkFugkuPJfaDeQdPTB/0eq94NabC77e9QC9ovQvFymKIZv5UaZiwrP0h0WmP0Quuf30aRbD
	peKsP17wRs5sMwqghYR1Ppnkn/nRMsDp+DkLHiXcB
X-Gm-Gg: AYBFou0mxRR8zi+px8jhtrkDebiCs+Upb8mbjPvkVUfMPxIvch92gWluBy9R7CaFdJZ
	QFzJ8y5yZYO0Hj7/s5+7Dd4AUr2d2LsGpmrWyl18OluRtckIFC3mDZNIRJy+NYXIn+FHH7Noj3U
	+am8MbeKjihorp/IZHSznHiMIPSf87wpeum1fd8uDi3RYHbgoCXiIku7LH/sUNT71FtYwwNkdMa
	qNkNM2xAaboRKR1PreiOgyWCSdrg9E0hpqoCOb4gv5LlQJQqk/iwz74ySeUvWrgmUW1EyEq9IzZ
	WmvgvK+RQ8ahqz2WfKU6sT0tWfy3nf1VuEyTaWSEemnCt1CxdsVWRgHgc8a74puQk0kw4XGQrN2
	DdvQ/6dxyhkFGBjEW2tFE5nts/Fb2tKGl05gaToZBqEYtmbc8OButhbswVsIAueZPrksjExwMLz
	CmQRQSfMcPU398rj2Qqk12MCJ7k77OIj1IqlqFY5h6QeYFRVHX9rba8Dt56vqsui1uywpBRkjPM
	2UVJrBq
X-Received: by 2002:a05:6808:3013:b0:56e:3380:1225 with SMTP id
 5614622812f47-56e64e03a5dmr1929551b6e.45.1794578235590; Fri, 13 Nov 2026
 05:57:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6af144ed.f50b2b3a.2c0de7.0010.GAE@google.com> <20261108202849.2e5c40a630e66dd39334a915@linux-foundation.org>
 <CANp29Y5m+47Y5n3Y8WvCEm2UgzGBOnpMK2eqY4aO1L+hQb1yNg@mail.gmail.com>
In-Reply-To: <CANp29Y5m+47Y5n3Y8WvCEm2UgzGBOnpMK2eqY4aO1L+hQb1yNg@mail.gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 13 Nov 2026 14:57:04 +0100
X-Gm-Features: AclHuK8GcatdsmJoXEjM9GYaBuZWdVQ-CUCU6-fQDT0msNyCcFfz9P5ZWrsfBG8
Message-ID: <CANp29Y5C+fex78EryCG-yO7Ex3ait1-LwOpEwZG5k_5T0z7iPQ@mail.gmail.com>
Subject: Re: [syzbot] [mm?] [bluetooth?] BUG: unable to handle kernel NULL
 pointer dereference in __refill_objects_node
To: Andrew Morton <akpm@linux-foundation.org>
Cc: syzbot <syzbot+73e34786d639a8eb1324@syzkaller.appspotmail.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 6:35=E2=80=AFPM Aleksandr Nogikh <nogikh@google.com>=
 wrote:
>
> On Mon, Nov 9, 2026 at 5:28=E2=80=AFAM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Sun, 08 Nov 2026 19:58:37 -0800 syzbot <syzbot+73e34786d639a8eb1324@=
syzkaller.appspotmail.com> wrote:
> >
> > > syzbot found the following issue on:
> > > AI-generated root cause summary:
> > > In mm/slub.c, __refill_objects_node() replenishes percpu sheaves by d=
etaching a
> > > freelist from a partial slab via get_freelist_nofreeze() and iteratin=
g through
> > > the freelist pointers in a while (count && refilled < max) loop. Beca=
use the
> > > loop condition only checks count and refilled rather than validating =
that object
> > > is non-NULL, a prematurely terminated or corrupted freelist (where fe=
wer objects
> > > are linked in slab->freelist than the expected count =3D slab->object=
s -
> > > slab->inuse) causes object to become NULL before count reaches zero. =
On the
> > > subsequent iteration, get_freepointer() dereferences NULL + s->offset=
 (offset
> > > 0x400 for kmalloc-2k), resulting in an immediate kernel NULL pointer =
dereference
> > > crash at address 0x0000000000000400.
> > >
> > > full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3D73e=
34786d639a8eb1324
> >
> > Thanks.
> >
> > : This looks like a bad syzkaller test, not a Bluetooth bug. The
> > : reproducer runs as root, opens the active PCI device's resource0
> > : (mode 0600), and maps its register space writable. It then places
> > : syscall arguments inside that mapping. On this GCE VM,
> > : 0000:00:02.0 is the NVMe controller; its BAR contains live control
> > : registers and queue doorbells.
>
> Yeah, it's unfortunately a known problem.. Sorry for the noise.
>
> I've just sent a PR[1] to prevent syzkaller from manipulating those inter=
faces.
> [1] https://github.com/google/syzkaller/pull/8111

That PR is merged and deployed, so the bot should stop triggering the bug.

Let's close the issue:
#syz invalid

>
> > :
> > : Both crash logs show NVMe completion ID and generation-counter
> > : errors immediately before the SLUB fault. During minimization, the
> > : same program produced crashes in several unrelated kernel paths,
> > : including runs without the Bluetooth operation. This points to
> > : disruption of the active NVMe device and subsequent corruption,
> > : rather than a demonstrated SLUB or Bluetooth defect.
> > :
> > : The logs do not show the precise MMIO access or establish how the
> > : freelist was damaged. Please rerun with the resource0 mapping
> > : removed and the read buffer in ordinary memory. If the SLUB fault
> > : persists without the NVMe errors, we can investigate it as a
> > : separate kernel bug.
> >
