Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792783899;
	b=nD1ala3PoFDzH0TWLLPU0TMKJn1WFzev+mvTUr+r9XRqWIwd0uM9UGCe1xIUJoiKQuC7
	 3ExRu87jOei1zI/Z5PWfeIoADb1dHqmAZgMmPSHa4yFT+tCePk0NtEUS8woI4gcnHXACi
	 fnrUhVxPg8mZD7SUil3S04A/dhsOjIxlz8HiSsWdl7oNjNJBVgDHnBBqd/JWTHCspmIXf
	 8tz0yLkkNp/gSY7fCZffzyOxt3NJnnApXEH9oSkkKXIOfN+q15uTEBQ9hALUok2wilPM6
	 ex3z9qhVn2ZRndIOoHmT/5DVj95lpigASwtIOkLyhnksvhe3En8iG+TbOuzebH+AZCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ssiACCz8iQhHfav075HToQsQkWyrJS6OaxDAqF1b0sE=;
	b=anSJkTtehRazVwQfguJ6CSDkQEPgcQCSCyGSq822pGeKtSKazn6tTsmoSYdWymvrlBGk
	 WhbGhPZrDXN+5BQPNYI0DiF6vG+OoBdn1EzYhVvwUnNU8X1n69xjOZEKt2YhOUyx5OP+9
	 FW60Y/4FMgTqrMmsFx3rK5G7hEKOYeg48mQFF7R9BbAEaTQ7/89B0h0gCKgd52kR1Qfvv
	 JhviRsoYBkQi5+qoG8mPLvhkm1Od8maxQovEDFSE1gu5Sf8McYYJ3TXAecPEVAmhJCGqF
	 dFAyVeOeAq+fXUMlNKRHWDg/WvJddCC2Yg1Ix0LBPHlVT2tsqzEL6YhLoGIG7vVmPjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fM4pp+17;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6634C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6634C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fM4pp+17
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so11617021fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792783897; cv=none;
        d=google.com; s=arc-20260327;
        b=SIOAD9GDktsww/jQWpIZJqXOUAUsDjZe4+Rmj//jtYjAes8XYRxp5imLgvV2Syzwum
         S08QK2e1JoFHN0HLVplrgNQ25EXazbaHJLlNdfj0uo0fvA2rXwJzPDWXP/aB65llyIWp
         DtdXqgIhRSN17z3/SSWNi0Qp3wPApsNJg4qr508q5O06WAGmotXZrExR6vmj0kmDLRa8
         3pyjtzxnB4FyxQubW3POZif8s7lynTNs/WXrKPesbAAZk+NIPB7MXIoY6cpEC3Cg0VWQ
         AbgaZTzH+FBqYdaVNAeWslWVDWoIB+jmfvrRkzGU680ujVJFu9YZOIqyxBj4cqlSa9+v
         3v+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ssiACCz8iQhHfav075HToQsQkWyrJS6OaxDAqF1b0sE=;
        fh=QzmGg7oL/pUMQOVbK58PlhYeRO2apoxXKAYYK+1J0+A=;
        b=bRtguWk/TvwP/4fVR2ZGdGSmTqxy2Swrt3E7P3y8KRoCIJLmdllcuBAEa624SecfvW
         oeUrSxJm40OH/aok3PWGW/80kxxNzceyhu3Y4ZSmWwEfjdPZiCIR8LLWHwhRnebXw/ut
         UcUqbuDnCSQjhe0AlJpHlYFhEzx9Z1mDGc5yzfWpD+8D/37edhca3nPbaAUQEt9lp1fA
         akJtOaNSxP1HwEKmoZFvAuyQL8r+gItJ1+Om0/0IbyUXg09oUFkPrKfidAHDcDVGd7oo
         AUi9cyjFK/cE44wmZ6piC9dScrhD/cJURfpWv55ib3k3Zn6Xl1St4vFHnfiOSO3+64IY
         dMzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792783897; x=1793388697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssiACCz8iQhHfav075HToQsQkWyrJS6OaxDAqF1b0sE=;
        b=fM4pp+17mA2W5prd1gKXs4asXj+KvPItU/RBUMEhZBpKcMtyDq5558E6+66GTgP1fG
         yPKZv9p894NBLrzFa+5RYs4AFfJXQb/o7xpkKp32dvCtr97FsbmkihOmGUCCLhtxuu1r
         GOGGXG96BmHYxArM9K4Fp//exMojM+ADNW4fYADcQBAlhhRKIiP/l9p7o5PkEyYXoz7m
         qHoycI7yEMC3U6Gxb1Tx/tM5ah1iu1duxm7tAK9BOKyejnzdQSUs7CjT1DAzuiaeHvMo
         R9tUcZKEYc8478yFiI0J5VyfsrV2pe3l7c8HGdX6rJqgo9USGvkieX6t5SEIUHqNk4Yl
         DTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783897; x=1793388697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssiACCz8iQhHfav075HToQsQkWyrJS6OaxDAqF1b0sE=;
        b=lv8j495ZjWeN3WMJ/ARIcxM+Jr7JfAh+hZy7OQ5MZTpUAsqTzK49q+ZgW3+nS5gwTW
         wl19PqwYQZUQuqSQeutX29VBpMgz5vy2N5ZnHLPjnc+phN7/lXRExXigSuBblo9fZT1f
         Y/6BROyzaBRxGmfnV7T2iAiXCXTuSKpff6Ex9cpDT09bMkt/n1glrYO61vxh5P+afo/0
         uJvokfc12HaWUBjXA50T8O6DzOHsrlUBAIFU7k+QZSIPSdwBDpwNy9mUx0JVQvmS0Wkv
         BsNGP16eidsaNuv2IERjO+U93pDCV2zZeBeN8XNhFMDNYmdP+QeSiw2vstURm1bqL31n
         Hwkg==
X-Forwarded-Encrypted: i=1; AKwUvByHAnq4ERhJGrPk/VpUbR6wuC3SY1e42CGq1rMd58ojdlFEIjRptnglzMrEJxy2hBiVps1GYR26Bxg0EFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkF8RnMxN9nMyh8LtrOjECuZWbjsELzb8ksVQwZMp1UAgrlAcB
	hyHr3M05Hh5y7Sc4D5utPmA1KTNr4A+S73xSpMzEFqTys4XpURFWnTAs0z8+x13I4Z8lmEvzp/B
	qyWV9USkB4GDllYFXPmpw4O3K8UoNn4Wuy3zlPaX2+LZq
X-Gm-Gg: AYBFou1L09uoUI8iRw+r6nPXWbKcH/PBMNsi6oJIL3UXQH/1E8hylQKpYQj+B7AOAw8
	muNdBcQw8gD3R5CjycxHCDvPdolQE32e0We1WboUUIpicrlVcVnT1p2vV+EhJZ5ffXrgy27TJ/V
	WfLlS4MU8bcLRogaDIaZi5PlwIZqJA8JB9bplVNmPWInSqC80hjDIHlRIB76zoty0pEjLwV46ot
	KTrst4aCnKbjgDRTCvikn5JYigRu57ZBtIKruLGn1MdzBtf9HJwnF+gLkjmtihSiVlGTtL6+bde
	W+W2Zi3ET01h4K4fykTkUWNTVBWhXHpOj6BnavjOs3IR3DyO1Wq4i4DFz+3+1XNv1y84VHUspTI
	Kv8GCDCspcG7O8HFtL8KKiDUTsqP9OKgGNC3V0nwE7KcmKbwjCUb0g3RG0LbeMs86L7K4azzlIc
	VhJ/o7T+jReki74A==
X-Received: by 2002:a05:651c:31c2:b0:3ab:1dcd:934c with SMTP id
 38308e7fff4ca-3ac6fde7f59mr484421fa.1.1792783897356; Fri, 23 Oct 2026
 12:31:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023174015.54793-1-igorpetindev@gmail.com> <e16930d5-375d-4d61-9e37-94dc9a83ba64@rowland.harvard.edu>
In-Reply-To: <e16930d5-375d-4d61-9e37-94dc9a83ba64@rowland.harvard.edu>
From: IgorpetinDev <igorpetindev@gmail.com>
Date: Fri, 23 Oct 2026 22:31:27 +0300
X-Gm-Features: AclHuK-4Gcg0KL1Ua0F-idU5uezV--PxQTbQwTM_ejfi3csX_24NMPyMrJpzCac
Message-ID: <CAG21Q80vg9LdTRmFMC4aq7j=uEPWpEFNr3+1MLLUw_UU_cjd1Q@mail.gmail.com>
Subject: Re: [PATCH] usb: core: hcd: cancel giveback work synchronously on stop
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thanks for looking at the patch.

I think the bot caused some confusion by talking about stranded URBs.
There are actually no pending URBs left on the list at all. The driver
properly killed all of them.
The issue is a race inside usb_giveback_urb_bh itself. The function
usb_kill_urb() unblocks as soon as __usb_hcd_giveback_urb() drops
use_count and wakes the waitqueue. The caller immediately wakes up,
finishes removal, and frees struct usb_hcd via usb_put_hcd().

Meanwhile, the worker thread on the other CPU is still running the
tail of usb_giveback_urb_bh(). Right after __usb_hcd_giveback_urb()
returns, it tries to access bh->completing_ep, bh->lock, and
bh->running. Because bh is embedded directly inside struct usb_hcd,
this access hits already freed memory.
So all URBs are already completed and bh->head is empty, but the
teardown path still needs to wait for the worker thread to fully exit
before the HCD structure gets freed.
Would calling flush_work() on both BH work items be the better way to
synchronize this without the concern raised by the bot?

Thanks,
Igor

On Fri, Oct 23, 2026 at 10:15=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Fri, Oct 23, 2026 at 08:40:15PM +0300, Igor Putko wrote:
> > When an HCD is stopped/removed (either during module unload, driver
> > unbind, or an error path in probe), pending URBs are unlinked and
> > completed. However, for root hubs or HCDs with giveback done in BH
> > context, the work function usb_giveback_urb_bh() may still be executing
> > on another CPU after __usb_hcd_giveback_urb() finishes.
> >
> > Since the caller may immediately free the struct usb_hcd via usb_put_hc=
d()
> > after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
> > the embedded giveback_urb_bh structure after it has been freed,
> > triggering a slab-use-after-free write detected by KASAN.
> >
> > Ensure all giveback work is fully flushed and cancelled in usb_stop_hcd=
()
> > by calling cancel_work_sync() on both high and low priority BHs.
>
> Sashiko's criticism has a point.  If there are any URBs still pending on
> either of the BH lists when usb_stop_hcd() returns, something is already
> badly wrong -- that's never supposed to happen.  Whatever it is, it
> needs to be fixed in the driver that submitted the pending URB, not here
> in usb_stop_hcd().
>
> Alan Stern
