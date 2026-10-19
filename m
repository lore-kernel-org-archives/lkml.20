Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792431924;
	b=yRUW1oATdgJ79DTKkj4HOR/cTOMB2oxtmpgvMCfBE12wxMk3J9y5Ox7QZ00UIUlI1fLO
	 wak0bndvpkqPDXl96jFtlPIH3c05pcNpQ13++BOc26S6SvylJ6DJKqH2a88dOT3ifRT97
	 TAB8V1RZDeHD2n1IbBsEVz9xODG0FmsIQAjvcwOfdboz7IgYRPXV0uaoT2mQXETEZWHzn
	 FwBMAZkIqXopKn06SYa+zkgbCzLfArYmk9mH5S6CATyjJrSgahtRXR2oOvFydKOaV/iu+
	 7ueHyYpv+8nZHz3uNmQCMV1wXKXq7jC3p1TSqRbbSliLiPmqggpj0/6W7AqzuqEFM1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uHhz8edqGfRSRr1qX/tHz5Qnqw+Nw4GhhVe2mW6VnCk=;
	b=5ZTEUBHMQ+nC7jpGfXIXGGGQecnFk+nADxIkajgPvKBQXUWHGWqtw9YnlqxPxrGS3JrY
	 k0CIA5jcIVqusDybJp/nLnocP9kikiLlBQBhDj5NBFqTjsLE/Pu9P6cqyruA4+XfEY5Up
	 V2q8+MT/aERTFokhKo9z6vcnsi2OSc1S6wM5X6cu8Xo6egLN4oHPl3xlIqyxgrAPOZU6A
	 iY0eKXuTbanGqCegmsPFmtf8Z7SPzM2zhpKbL3E2ljKU/tBVlZ8y1kJ1f9s5qLvx2N8zO
	 ypM9/zCnFDCxD5HVqC5ykDPxJ3WQMPykIkB42sw42MNqFRadUooh9e5bbmHrVct5qrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hZkqtp9p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AD2606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47AD2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hZkqtp9p
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6798c4b882eso1826379d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:45:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792431923; cv=none;
        d=google.com; s=arc-20260327;
        b=H0q5y7B9cnn7jYBy9jsSjLaBYc6BFex8yqBxWDye0boNmbbJ4O0Xd93fO2CJdOllUV
         p9kKZCoeEs+jnNSyOmJU55mjpFKzHUAkMO/xSjpcqw7r2FhuuZJK73lvEnIiYQmC4+6i
         PowrO+uKvdAl6a7cVdDp8HrAF/1ye+PXvo44oJenkyfJ6j29ZSrhoCw/CG+yOu+tPF39
         zhs3kzPTXSzhjhS7hKUlhfs5/dpratPmvlT/B/35Z3bKI6+31wT8HYPtwwFc9rE4805r
         QFs8jKgBUGBV9oyKVFRzKzLGjGD/Qqx+X9wy3hLEN39Qc0tUZ3B+ZvfWZqtHmx1A2eGm
         TUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uHhz8edqGfRSRr1qX/tHz5Qnqw+Nw4GhhVe2mW6VnCk=;
        fh=LLSdvMpHYvHsXYskHB7JRixeig5NnD7aOBEBhnzkc0c=;
        b=fvyP6tza1Yl1S+BceiJLQ9d9S1qT4o2ql3ONBFmAK3psASrdSZWRshTiUbpfsbNVcD
         lW4EISeETNk4/6jH4tsfDxm4/VrYQdMpnhqYe5XPKnXd63RKQ8haYu04LfU5QUy+hkUJ
         sj8vEuC4d9D0JRpWp/in3xi13RZkkN05Kravyf7QIziLMUYdA7WXQryE059P3Ozy3hlt
         J1YRdVXKYtN8b3B5gfJ4JeLXxX2Td2A/1vLnOFsbMcML/40+E+zXkbL4SypPi7ys5UG0
         +DaZRDR67Y3+htL6TWoPeyOHqc5zp4uaCHjRk4HHRhpvlLG3G0f4Y4sGyCCmpsIPpdJi
         t2bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431923; x=1793036723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uHhz8edqGfRSRr1qX/tHz5Qnqw+Nw4GhhVe2mW6VnCk=;
        b=hZkqtp9p7zWP2rp4sPkFkMKPwrurSWfBhIqN2awqtYmm3NqydM752J9f9wlXcS2B51
         0kA9XU2IU7yrnx/jrZE1qJHVa0rj2Xhqxk+fuezDynNJosWbKc+fClpR+hxmbWk3BTzZ
         MJXnU0Df2q8y3sk0AA5VjAn+rskFIPL7bWAHSKDwC9Q9Kk/Z1wLGm1isYoWWPZC+lulK
         zAvmMya4xPLk0gUqOuBqBB+7NOF8R0vl3PAQmZI29w3hsRP7lrY2f/3mIqxwlwF8Hx0x
         sr+C79lyk6MR7NWoFmHDbXLxxBAFWAK9gANbdmk5tEJjjTGXhMCGhoiUKEE7XXpKnw0S
         mfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431923; x=1793036723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHhz8edqGfRSRr1qX/tHz5Qnqw+Nw4GhhVe2mW6VnCk=;
        b=WDSmsojQoVIP52CUvwBzut4MKkokCEulwsiqiap8mJI0H5o/4FVn77WyebDTWEJTiw
         PArrGupd42Y/6Z2JemK76c9TYgaTDYdki7a6aH9aqNjBMTEgGPPyxMsx53fpTHu8tWZc
         8Es1dFtb5zMz3NmhuRGFvIyzGBsjWaOpBPup9x/7hoGQpWs9Ew0Esw/9oXKhjfCrRM9z
         Q17Q40OdBLyDkQrilALipvXtKcCikjGoEcb0r1l0QyY057t9qBRo8iyYd+8pI3OzyvDO
         5Qe9NYxKOC1e2WoiitS1UdHPxBQ9Bi3CC1tZh/dbfjPUphNkYsBuOOaYpihnYgw/TnDG
         6fbw==
X-Forwarded-Encrypted: i=1; AKwUvBw/bTbh2EcsTYQMLy5D161lf3xgDR+gRKZMsB5trVrFqkxC2tD3lQSet2nHhiD8czwTSX4eHOECKvyDkZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2qYraCMiaz8YZDI+E1r3/Qi/X8Oua3ZWEnLENWRZaOQeUH2u3
	Nlk8qGLmre0UqvhZOmI+rBEA9sn8lJ5Zhl8mUkWkZVCthbm6Oi4K6ESs16S7WvnMHtwlG0SZMTb
	gTRq+YVHLHRCqiKCjohmPMvHYf61An60=
X-Gm-Gg: AYBFou1r/1JR5nZzM7MLeKjhFvnCy6b7ywrYKcWb69N5tgvpVwaI5ChSFOnoNz0ogKI
	j103UXt1mC9MDmjSMv+46IR16JUS0v/O93a7nTj+Lmc/0NZv6yBxdw5FhVcJ74QEAq9wcYOjJYA
	yMLP3nZolz+kYejTPg8EBAtcEbv18c6/2dj9JjTyK1sDxNp/TO1s+Q+eR8erF/4mCkuAbf44QnK
	3bE2JbujolMIaBINkyIbwmKz7wwOjgY62p5tFOhKxTOaygniAm3m0OcFLvALrv6iDrngcYxJNmX
	GU0rfTzXM3j9H/jxSwapmrGq8kidZN3U5kJbSgZlDfZRFtq6ZwJbsXsohQBxBjmVC+8zvZ36s2S
	pkmQformmpZVTxj6r6zpzdl5BX5y4b1FxQcTf
X-Received: by 2002:a53:bb52:0:b0:679:8835:a554 with SMTP id
 956f58d0204a3-679ca8c7ce2mr1821558d50.94.1792431923051; Mon, 19 Oct 2026
 10:45:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAUqJDt1pXQ2KVBvMoMiDrzz8ishonqhQ0nnQLEppot4nmv9Bw@mail.gmail.com>
 <2026101814-strut-endnote-a0b5@gregkh> <atYj06gmgCa40q6T@google.com>
In-Reply-To: <atYj06gmgCa40q6T@google.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 19 Oct 2026 13:45:12 -0400
X-Gm-Features: AclHuK_-8oCMVYCMfn6OWm_mzIhewJqrVvI2D-1Z_lvoMQQq2xMophpcFyo4duc
Message-ID: <CAEjxPJ4zV-YE9vRJ0=DgjuQY5gjXwRa8hcd0KpgVtyK_9AM+oA@mail.gmail.com>
Subject: Re: BUG: selinux-testsuite binder tests fail with CONFIG_ANDROID_BINDER_IPC_RUST=y
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Carlos Llamas <cmllamas@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Sun, Oct 18, 2026 at 06:53:49PM +0200, Greg Kroah-Hartman wrote:
> > On Sun, Oct 18, 2026 at 06:36:04PM +0200, Ondrej Mosn=C3=A1=C4=8Dek wro=
te:
> > > Hello Android binder maintainers,
> > >
> > > Fedora Linux has recently enabled CONFIG_ANDROID_BINDER_IPC_RUST [1],
> > > which turns out to cause the binder tests of selinux-testsuite [2] to
> > > fail.
> > >
> > > Minimal reproducer (no SELinux involved):
> > > # git clone https://github.com/SELinuxProject/selinux-testsuite
> > > # cd selinux-testsuite/tests/binder
> > > # make
> > > # ./init_binder.sh
> > > # setenforce 0   ### <-- may be needed if SELinux is enabled
> > > # ./manager -n &
> > > # sleep 1
> > > # ./service_provider -n &
> > > # sleep 1
> > > # ./client -n -c -r 3
> > > Client ioctl BINDER_WRITE_READ error: Invalid argument
> > > #
> > >
> > > With only CONFIG_ANDROID_BINDER_IPC=3Dy the last command succeeds.
> > >
> > > The issue reproduces even on a kernel compiled from commit
> > > eafedbc7c050, so it seems to date back to the origin of the Rust
> > > implementation. I'm not sure if it's a bug in the new kernel code or
> > > some bug/wrong assumption in the testsuite code - can you please look
> > > into it?
> >
> > Given that the "real" binder client works, perhaps the test is wrong an=
d
> > should be fixed?
>
> Apparently there is a divergence of behavior if the SELinux permission
> `binder { impersonate }` is granted to a process, though Android never
> uses this permission anywhere.
>
> Thanks for the report.

I would treat Android as authoritative here and fix the
selinux-testsuite to match unless you think there is an actual bug in
the Rust driver.
We originally implemented the binder impersonate check just to make
sure no one ever impersonated a different sender without us noticing.
