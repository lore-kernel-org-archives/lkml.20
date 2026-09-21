Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18601246774
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950160; cv=pass; b=E6wb6BNiMBWA/m8bYLh79eCNecjKX/7BanpvZvIRKh9/s1AbzCKoqo5ihU0d8BjTU5BO6m95CPOMA1xKrDTU+Dkjm7hPdklemVm3eGjD1xWEOJJa+TeXpCRkPFNg+fWeC0JHeRSwwToHulbh5BKPX/oOut9dR6MfMv4pyiIQ6+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950160; c=relaxed/simple;
	bh=NQS8MYcijvVS4vCIWBQ8Q7bc8fKE4LuS2H2clNR6NXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kI1uQvwpA5XtoIm899+P0+FP7mRRr2tDNOwzskdX1TjRC4OE/5INJMV21bGB+a7bS/JrTSBhdGvyG7bSnTY1xYLJ6SK6+xx3YDI2Cn0Unj4QuJ4gP3NO5Y+fyWKjpNQTwt+b4RQwwq5EtKRO1KkWTUnLCJ5YUxgh3Ha4Nd8vi/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ha/lTDDL; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ha/lTDDL"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab20a33so2244914d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789950158; cv=none;
        d=google.com; s=arc-20260327;
        b=ULZrl6fZKmNrddYUjUyvuzX12t5Wn3tSntIBfcB1QzKfCHPKGnSA7F8ccrXwm3Wui9
         kKvn14Bq3tELdj3uXzqLTH1VyIY0UNJv3ZhR1lBJSo9A/9IF3UVEhWdmJwDewl2ArlQa
         4ruzXB0ymBaF4AE+vElyaSbD5dV2NRPJc8DL9wZTL6VhP2yd/iFLJeDj62Fi1TEL6xsG
         bVYdutvw71BcFbvwKEenX79XCngMrFqPhwjPj/z2QcfLoFlK/ld8smsx1spKfay/4ISB
         mzkvB/tAvtQ0+CJt6xWynbpbfaXKV+KlwDzKFH+v+sNYjs2x8K7SYhwTS9okKz+3OZXA
         xh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NQS8MYcijvVS4vCIWBQ8Q7bc8fKE4LuS2H2clNR6NXA=;
        fh=aivYN0V4/Poicc9e769DzecMeOKQ6DZHtTFS6O9oz+0=;
        b=NexMhfTiM+Ps92QWJlpwuvKM3/RRYn7BhXQdoiIOory/6ZZj3xbj4jWdkE20lYy4G9
         f7Y6hjnRK4JCHprYyRoiVyu1rMgR2m2xEzMj8Io+0MbDDj44f45VT6iwioND50RXYrsl
         aF3cJNAF3XOmV37tKcczT4Ff+IejDiarbtiN5+jSOdZSh2Vncj6zzAw6bSTNoZ7Ps2rd
         aG5oX7RULXu7YBbB5MEBqBCp/mR5XbN8GUYixLWA/ttjYR4yHgCMOatJeSxuKct8pzwI
         GNXaiF8BWqi96AWdJbFuM1LvGKVDdsYDuw1nGNXc/lK9BAceCsgiwkyFZXdF38Ok8q45
         Vt+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950158; x=1790554958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NQS8MYcijvVS4vCIWBQ8Q7bc8fKE4LuS2H2clNR6NXA=;
        b=Ha/lTDDLRh3TkZGGN1fOL7IimSA2l4uAySr4uvL2p0c+BVWyHGEYfHTJoITnC/b09o
         RaUQyUGhN+0GtrILtJGW8s6U3BhQi/DlSQtVzyq+5Grg+B10/2K7Vd/74ZNXkCzsodM+
         JH8O5h4hU1W/a6ayCOul+zlvKxsgh5L3sX3eN+3KqCimAZnF8TcszJKL01T6Gfz/CW9Q
         8aHmIr0T9WMCDmi8neEZiNxQ5q6Kt9ecj8xeRpE+fJi3+A6MNpPfWCeOUqifkdlv8kF/
         Whx319A1aRli77L7CqHxJKnaaqqztUEkOju4tp36z7uIfYQkvKKrpT9crqg3CSoWEBG4
         dJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950158; x=1790554958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQS8MYcijvVS4vCIWBQ8Q7bc8fKE4LuS2H2clNR6NXA=;
        b=Z72ZZs/Q1OAvDw322nRZBXyKno4m+druqmmFs2ttTqwzrI7Xmb7sL6TB4p+VLrIe2u
         FlqUm0/hcMvXdd7qgzW/hOuPJTC11IdABk1slyNYdWKbJbJ0F0GZUoXp5XE5EIzU7IcB
         CiKYTt65SXIORMTNIOhSGR898l9lfjzABjYDuW6mH9E5yeP+eIYI6lCZqon7/8StLNJ5
         2jfST/lBAJyGgKBy+GRiaVrvUZJV4kLvVxjso0QQbIgt8Sh7rng8HfWVxAbZo8jwv2gh
         +E/fDmmx+yoWRm9PFqBJMn4a/jhf64PLAP5qVzIjpPPV73sj/C1skYudjp1O65d7XG07
         jFNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCkWP9ThyDmdQls6ts3uP4f60wGJiyREVHkwcPI3hfjhBKHMREbESri9rQ4PUAGeTirWo+xpfF8YtcLUU=@vger.kernel.org
X-Gm-Message-State: AFuF++nKEPyCCD0H873MP57THMFqY/qE6V4zP5EXnIaBs8gKvXpoQo8i
	m7TrR/Gj2Ntz4HSqill45uHnwqv+YtW2fv45f4ABXnZ4Mo4GHw7nkia9hWOuGYN6IqIBXoMUcEV
	0/UAgCYirBvoOEjjSyLMv0Kk34fkY07s=
X-Gm-Gg: AYBFou2bZ9VAsAS3gWl/UcWmapzyiiYuuSanZdVmZzeqxXTiU/qGJxo7X/DZWrVbNmT
	mENYY1VnZtfr0XXAuC15d1dJSKgdq3WKm9/xArdKD0YEB9l5VmTluTxEdXOiCOnb7GLOAaAvDak
	9UbAbJy8owU8gD81Wt2EzTcqgzbZoYTUEO8kanZLf5jKh+KbpqDHyVsjpz5pY24FdSuDBpVq286
	ZdC01ZEQlOoJfDHA0TtFinhyye3oop9rDgoEkpKNTlIckhlOF+f/Uca1cYeDvw0xRcAwHn5ZKYR
	8ByVaplJoWVqZ78mB1oxXkyGpnkc2rc2ajFmO8AYKoYXPk3WKyT6enKRQnFkiJJBQMJmwBzXqAX
	RNi8dEbnJt3C3J3xeK2DSoxoze08yHRiHIAn8/ta9kjgT
X-Received: by 2002:a05:690e:441b:b0:66f:c8e4:f013 with SMTP id
 956f58d0204a3-6717fdb19dcmr2344214d50.50.1789950157931; Sun, 20 Sep 2026
 17:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912040351.15056-1-kartikey406@gmail.com> <11725791-f4c5-4b8e-b17f-bedc679adbf8@ixit.cz>
In-Reply-To: <11725791-f4c5-4b8e-b17f-bedc679adbf8@ixit.cz>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 21 Sep 2026 05:52:26 +0530
X-Gm-Features: AcwNN1UaCBqh7KC0hnIxyrjD4Zfm4eEEWAHyMCrNMPFJZrk729tRA0ipclL_saE
Message-ID: <CADhLXY7adgWc9EbUJJrzt7djijBQSn_24EfrAovAD=Mos=E8kg@mail.gmail.com>
Subject: Re: [PATCH v2] nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
To: David Heidelberg <david@ixit.cz>
Cc: johan@kernel.org, kuba@kernel.org, error27@gmail.com, 
	gregkh@linuxfoundation.org, sameo@linux.intel.com, michael.thalmeier@hale.at, 
	oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 4:41=E2=80=AFAM David Heidelberg <david@ixit.cz> wr=
ote:
>
> On 12/09/2026 06:03, Deepanshu Kartikey wrote:
> > frame->ccid.datalen is read directly from the USB response frame
> > and used, unchecked, as an index into frame->data[]. A malicious or
> > malfunctioning device can set this field to an arbitrary value,
> > causing the driver to read far outside the received buffer.
> >
> > Bound ccid.datalen against the maximum possible ACR122 frame size
> > before using it. This replaces the existing datalen =3D=3D 0 check,
> > since datalen < 2 already covers that case and additionally
> > rejects datalen =3D=3D 1, which would still underflow the
> > "datalen - 2" offset used below.
> >
> > Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core=
 implementation")
> > Reported-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D1853daab1a47603d4678
> > Tested-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
> > Assisted-by: Claude (Anthropic)
>
> Hello Deepanshu,
>
> thank you for the patch, could you please correct the Assisted-by tag?
>
> See: https://docs.kernel.org/process/coding-assistants.html
>
> Thanks
> David
>

Sure, I will send patch v3 shortly.

Thanks
