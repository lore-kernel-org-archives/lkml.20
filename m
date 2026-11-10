Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794337070;
	b=Jl0HcifKahUqwBEJCE381J94BVmD3sh079craMWoFjljXcNKG2hANR02pTwKYuGAmdqw
	 wy+y4jvEiuzDEuy/+tAGHrx3vlZlkR2FVlYF9wdGx4PJm4QbD2O3ehOqnYsmTnQZRjGvP
	 rfIY3wQpGxDcFhz0RBl8gi1xe5KyaB1d6AN9YSgsaqKkPkIZU+V5yoJEDowCatWt/nd3b
	 u59pAKVg6eh1cywryvDAzDy4uTnKUfuD41mmq3fTldW2RM7+PKYAwUSuUmTxRn76DV5wX
	 VfbWGWbl1GhXQ3TvCJMu34a1I1Gse8p1Eb0rMQuqq62JcD5DpqAR4yaXeZft1L7rl3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jZ2q7zCDeh9+qJcv+PdbfEkMzzuX6IJChiSNXNctPLA=;
	b=wIN/vuhKt39O4fQ0VCG//nwp9gEegyj72+77JDNVX6BWmL2YV7CYj27bCHZujhOB0SNK
	 7+brprFXFqJ7MVI5tNsrItgEUC0SZQQDCWiDVZQBXv5RXOxHDEeyRSC4Ts+y04ftrdG9e
	 jTmam5s0kcbvwT8KkCHoFJbPkyHeXFLKt6ZRbSP/StF8xisMjU+c7i2/u+el6K1PW6tlk
	 XLMXPZPhxGtSv9LC/B/2hkwpJlVTjFOKlNOE9TrUL9Xci9jAQi9hi7UtvMA85t/Y5cqDC
	 w8vTrO5QCakcuQsY0tXN0vP4QFZbfQh5ceqGjAQBkzh9vtx7x3sYFh/ZPEHII+QSCKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iQtu1cWh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3EE60A2607
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D3EE60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iQtu1cWh
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c07c7306e1so2047656e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794337068; cv=none;
        d=google.com; s=arc-20260327;
        b=DNtnTOZB42sCp26rxG/FHz1Tep/Uu9c2oZDn/ajYJMA3yPDK9GZRhEQlXk003aahhx
         1xdgH1LKXxmlrvVYorEpzI9eRxg9v6yyG8cGVmr7/PSot+AnfLkfiTxgyLIw0ZPZbfCI
         Khx3TKkyVK8oHtT1PD9fDb5g6A+nKdbzGQt5ufwM3Jc8PJXCy945wWgjs73OimH6iLD2
         zCHBpfwQ6XY/3GeHLhP3+ZqQUgbu8fzxx5K9L7ogdp4BnCmvJK8UjsHPigRpIAE8tUhj
         szzvPzmLv/TONRCm/vtsLgywfGiaB6uPNLjexqKL4np8yJR0vXphYs1k9RCCMBv0pyiJ
         6wpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jZ2q7zCDeh9+qJcv+PdbfEkMzzuX6IJChiSNXNctPLA=;
        fh=vGlbTtGT2Rojls402zj7zFIq3wuHALrIqI+uIcb/d6k=;
        b=IiItSP+megwLRvtCpXrS8B4WjrKfpkfrdpIGsqBPyXNphAj96PwXPXFzqdF9yIFYS0
         0wm9qxGjKQ5Wd8TDOOKYk77I6h/2K5MJlpvZsuqcR6C50inWN8N0GNT26+ng/iUwLnZ+
         syhhuBvHQtKe8NySpkXDC8y934R/jsFXJNPV1Fxh5ctcGuiTGZ8aXWbp2EmFl1durxbY
         ch6TCH8yRPQejVYzmRV1Y7IWdRjkbphF4jpCb9F+fXQvwxAMXlJy1A25vTcTvyjzftTb
         31skjcN0hsg9ij0PCNG/QV7aFpK4G6UkUXFPrYdotROroqp+mek9GOjGhwiAzuqWpKPl
         /7pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794337068; x=1794941868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jZ2q7zCDeh9+qJcv+PdbfEkMzzuX6IJChiSNXNctPLA=;
        b=iQtu1cWhnOLMlZ4E5YGX7Tg7W/m3OqQiapHg7wYxHLF4F3LmarjWo6O16g6NCVP5/I
         h6lLQXA8mKzDp5HNFA9ezPw+Tk1ftzV65/nweBFK3hRTbq033BeSICNH87SZNvN82II0
         0EeyQkE0DJCwIV0l+fpETv1vCCLzlYomtS/Yu5c6H3KuAUuoIqraEm5UbUjQ+MV51/ap
         jVFX2bWotbz5ty/PLs9cHOlrEqSpBmipZNsED4BQ1rTcPZ5pkNwj+Cl3nmOmqax7QAkn
         Sz1ONCybN7zHEfCjN3TqINbLN0oKsSnEwQCRRXCwiULshPoqjwdcVXaT+s9TW3i96tUN
         U5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337068; x=1794941868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZ2q7zCDeh9+qJcv+PdbfEkMzzuX6IJChiSNXNctPLA=;
        b=CocJKuloIiZwsFnt992bRE2KUWpyBndTk92VGF1c+W96bq/FTSeMWzbNBrDW8pDb+8
         CmBysG0ZRaoeQxLvVM7cVYXArbQxbcz38G7wNHdCoYl/I3qVps9kf/Xz2FmygjKX1CBZ
         Vm6oMQrrcld2S23bp+8mAKHLABfXsxMiYXu04Zbc4AeRVLc26b//hkCZ9HYf87SZeivQ
         jw3FB04jATPhHR2wNRqvI+OBCIVDZNo122Wbndhm6yrcvCMHGqFOXfdpDoFSFByl+3q9
         8rErZOJnrbI0Fv6MDQTSjy+vnOn9B2PUvVGVEosOhL4x1r1ItKN0PGMyb24njaYM0B7V
         tBig==
X-Forwarded-Encrypted: i=1; AL+hErHADq8d+Gy+j+CjqiLn5XAxV1avANtDvXl7f0X+GslF2waVA4wfDXHYcth1XnI/NrUsJl0yo8CvZSjFlwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nlmhUG0M47RLxcwv+QvQxeybFstZ7Lqx5UihdMEOYn8o8SKkz
	zk9qBYt8OsZb5wLeSojtCzNx1BPv4nq2/Nxz675WTS7pmLKwcrNC13jVMQpwPrVilYSrsnfMNcr
	M/p+iDkJFkH1vUSVM41t0VpV/0cZf9s7VlVjnyrqS
X-Gm-Gg: AYBFou3reoXEYuVtNJTDCmIV/DZwZNE6z72ECyklVFSeKQImrhIg+BRm3Ho794U7LkF
	+KYV2TZ3nORIwO85kc5mY9GNL81yuLy0kq7/mlffUtvsLSRLcsu0KwqPFqge9CL+P9yr0z3QeFg
	9gpCgun6AbGuIGco91XP1SORAlARD7XkcDMWGeM2aNfoCsqv7M8cZwbB8Fd6luf7l8cYN5HJ7RA
	qHJyclaO/zum/HyX/XN6kfiejFlsCQ/8WJrw1MKYY7oPEb9Z7z+xfBJfXImlHT/GBfOZ5NSDlAw
	zGBtWnuSTwigglphibA5jmdq+TrxOwjDyf+7tmfvXxq812qGfUJaFt1g1/Mshb07gQJeHcCD0Ux
	jfERQe0ghf1xTmaCZH9EpXhBydE0A6nnKQLCcFhDYI8z6rQyLmTlSLPpvGx8+F0udTow=
X-Received: by 2002:a05:6512:2381:b0:5c0:a80:2837 with SMTP id
 2adb3069b0e04-5c156ea57c8mr1243048e87.45.1794337067799; Tue, 10 Nov 2026
 10:57:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110020632.4003499-1-svv@google.com> <avKAaJxlxE8gOYVV@google.com>
In-Reply-To: <avKAaJxlxE8gOYVV@google.com>
From: Siarhei Vishniakou <svv@google.com>
Date: Tue, 10 Nov 2026 10:57:31 -0800
X-Gm-Features: AclHuK_Y7tuYVtqC14Xyd8VRbI_P-1UHcUvd0-bsysWD1j_K221SrIMS6_jP6lg
Message-ID: <CAKF84v00nJ_+2Tf8m66LhGEKvqnHb26YD6p+FRUXK5juYEPQZA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Input: add ABS_TWIST and support it in HID and Wacom
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 18:25=
, Dmitry Torokhov <dmitry.torokhov@gmail.com>:
>
> Hi Siarhei,
>
> On Mon, Nov 09, 2026 at 06:06:29PM -0800, Siarhei Vishniakou wrote:
> > Some styli can report rotation along their long ("barrel") axis,
> > commonly referred to as "twist". While the HID specification defines
> > this usage as HID_DG_TWIST (0x000d0041) in the Digitizers page, there i=
s
> > currently no corresponding evdev axis code to expose it to userspace.
> >
> > Because evdev has no MSC_SCAN equivalent for axes, drivers and OEMs
> > currently work around this by mapping stylus twist onto unrelated axes
> > such as ABS_Z or ABS_RZ. As a result, userspace input stacks must
> > maintain device-specific workarounds to know which axis carries twist.
>
> How is it different from orientation?
>
> Thanks.
>
> --
> Dmitry

ABS_MT_ORIENTATION describes the 2D angle of the contact ellipse (or
tool projection) on the surface of the touchscreen. Looking strictly at tha=
t
initial sentence in multi-touch-protocol.rst, it sounds promising:

> ABS_MT_ORIENTATION ... The value should describe a signed quarter of a
> revolution clockwise around the touch center.

However, the rest of the section clarifies that this is the alignment of
the contact ellipse with the X/Y axes, not the "twist" of the finger
itself. In fact, the docs note that orientation can be omitted if the
contact area is circular - even though a circular finger or stylus tip
could still spin in place, and that rotation would not be conveyed.

For a stylus, orientation is equivalent to the tilt
projected onto the touchscreen plane (which single-tool stylus drivers alre=
ady
capture via ABS_TILT_X / ABS_TILT_Y).
By contrast, the proposed ABS_TWIST can be thought of as keeping the
stylus at a fixed position and tilt angle, and using two fingers to roll
it in place like a pencil.

This also matches the HID Digitizers specification, which defines
Azimuth (0x3f, rotation of the tool projection around the surface Z
axis) separately from Twist (0x41, clockwise rotation of the tool around
its own major axis), and hid-multitouch already maps HID_DG_AZIMUTH to
ABS_MT_ORIENTATION. Since styli can report tilt/azimuth and twist at the
same time (and single-tool pen devices don't use ABS_MT_* events), twist
needs a dedicated axis.
