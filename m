Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794706497;
	b=vDRkTan68lsMw1Fhz35Tx8UEW9m96V1lPNd0ibnTj8A1xez3IJ/XNXFADJW1jiusymXJ
	 Cj3SPuSuSCGOEEBfLFiyBCt9U9z2pQoSBD66l+xQKTbVOHxE08hL/b+h0KHq3OVza1kF1
	 h8mYDVdtM09bsr84Mw0mzSE5BsN3rAj2tOqFHWznakiYWfl7uDXCyruN3v56JLkG5zWbW
	 OmdbBMKfnvP5vFFh8TYV+n+HTQ/Iky++feuWOnqo8jQGjy60zy9IPnjpjMWogK+nvt2Vw
	 5asa+BUIfZo+xKSGTmiTHTOSYws8ylIXaFrtW8zxT4c/S8I14XaKcetgXLojqcRFzvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794706497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:X-Mailer:
	 References:In-Reply-To;
	bh=OMlLqSrjy+6LHFtfcGTg2faXloa2fdF0Up8sQHmX++U=;
	b=l9H+IvEr77YEhsov1Nbov6ouHQ6JxhFJaI4Rf8IjAiIMUae3YZ9GYhV1WQnwhWPgs/10
	 +adaWqclifwcHdIRvGTY5SgrBpZS5/4wx4gwcK1fAmlK/Eq40dLBa98SrqdNGFKi/TmTD
	 Ln1Tk6GZhCW4w81EFRFpvCd1STux6xnByk+ahNuxZNxnWCfEa6g4z+kZ8+UWkuEUaP6o0
	 KM3NfGkkq3kVw7aNEzkdrkA10zR/Xr51mYh0pwzJOkXDrIzA/965SL7HVu3UAC9LmCWGC
	 TPl91WFzVOjJ9djxkGvN6Tu41VVoR44aF7dg2yqFwCpzfexqCLEl41t70B/qBf1CPlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NH91V7uH;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9316B606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9316B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NH91V7uH
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so22805505e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794706495; x=1795311295; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OMlLqSrjy+6LHFtfcGTg2faXloa2fdF0Up8sQHmX++U=;
        b=NH91V7uHVhn4uThEXEM9hHqDiasPPqpuxi+21pKdirqLLIOHH4Yfp7qfsfVNoAx7V1
         7u9TM3geCmMP5fv1vknYHs9ftD0PpWWcNLKQvzevKIFafFsUSg5K8hbjrqtC+vdDBrnB
         gv4hzDTjOOpU1zWnFV/KgaPQX154tMKD6Yph+OYYePWqkv0tdKQVZeyTikq+v6XrrrMh
         sRJIUpp4l7mKu8u3g9NIblJZLl6CHsNSuYWMwFrAYpAwIbIsaFCdhZCb/H1kkSm6dRt2
         sdusnXONVx3bBUkali5uIGRvHdaWAl71JEslGKTRgur+cCBNrGO31Pq+yCMUux08xHi1
         nQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794706495; x=1795311295;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OMlLqSrjy+6LHFtfcGTg2faXloa2fdF0Up8sQHmX++U=;
        b=DZsDaWOnbNLSj+wW9EQoRedCVeVbrYryWmNmzc7Pap2YM0IMhtWaMmU8hdm1J6CUw+
         1M70IP5zBqGJEMF5CoRoYYP+oEAyLCTSrQD3JRCGEsbupQ90GZuJe15Z9U2cZnvmbM8J
         Q683wXCCzGkR5EZwEScRQYf/V9g23unCDPBaT999pfnDzpj3qlgOWh7hrcJgArkWVW1a
         3kNd467089vSY7eNO8KorD7UV5NGMB62KEMpFUfLRQ9BvFjPbMvA+xAkGJEQxHxEVDi1
         vDEsIrApUp+MgaFV2M0IBOhiS/plzdf4W2vwTTc/I0K0ljW4Ixopwy9efSxcFAohjctZ
         tNCw==
X-Forwarded-Encrypted: i=1; AL+hErEmoDNbITaCuQPzBHXJNaWe8RpX+gBF0xYch//sQCQ3lFF0nlYBnqIkiuuqojHeF3zqqVu/uVddtkmyEoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CsnRnhMYJVWIQN8iAsUREdrqq6z3S6J4uV91KA481HSlgpoE6
	AFuTlb50Yek77YLES4EzvBqsH6bUs5MOThq1R/lGIpf+bwkSc7m7DNjx
X-Gm-Gg: AYBFou1tGFeR3GuSbt+gWLyHNzmmMtOLOhEJ9eWtTOhkDRVypvAro47oRi5SJCWsPOA
	oepXGE2FBzr5kvX9W7oKQ5/HpxDT/97cdwoKONFJ4HtY43JB2ztc2DwYP3D34piM+m9pJdKpEs5
	oyYRKcqzFJE/deKgrOfXQVe3ECxhbAfpK85tXjBIyZGjGuaapbGMBivWqRLHAfhYBnvf3UMt9Dm
	wr3nrdapbNDLDBX3P6lr79cBYihb/qfgIJ44yi4VhXzOxvp69vI9HzmuFglXr5PHns/s3IS51CB
	SK1zndzanpsaos2IRyT6VWNEKIgEtuXi97BgQXXnqpkm6BSuBH191/8LMeEM9nJrHPzVpab9WGS
	d32WK0J1XJ2GvrkJ6Y+Mi4f4GB193IOyV0K97WgAPKsHy2Y3RSQDiz0q/2ghjSVl2KjKeIo8jju
	hwQE3gYKj1UWEdSjWGi4y9NXsmKH7LvwG916PwHNyh+QxNzRXEnryO5vuBWHpfK/mNdnkw2FoPY
	Wkw1okbDrOOuLXw5mbHh4NC6SP8Yuh6UVv0Kw0J7UPiZ769lvu9o4vBeDJ0ks2EWwCauASzajTO
	MNONsV8KjTPb6LKNMbT193MxmcDFwl6JOgE+SXB53kIRck0=
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr192482965e9.2.1794706494729;
        Sat, 14 Nov 2026 17:34:54 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm13643520f8f.58.2026.11.14.17.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 17:34:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=7778e8827e5f90a3e7c9592d930e9c3386ae58c962b71883b69d27e225ed;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 15 Nov 2026 02:34:38 +0100
Message-Id: <DMVECM7B14I1.3GF2HZB9KRUX@gmail.com>
From: "koraynilay" <koray.fra@gmail.com>
To: "Namjae Jeon" <linkinjeon@kernel.org>, "Ian Bridges" <icb@fastmail.org>
Cc: <koray.fra@gmail.com>, <senozhatsky@chromium.org>, <tom@talpey.com>,
 <chenxiaosong@chenxiaosong.com>, <hyc.lee@gmail.com>,
 <linux-cifs@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ksmbd: decode and honor DOS attribute validity flags
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261114012736.639171-1-koray.fra@gmail.com>
 <20261114160332.2228435-1-icb@fastmail.org>
 <CAKYAXd_qe-dLq6o7XdJzG8orYiKRioAtfEsLjxj33Ca3=PzGjw@mail.gmail.com>
In-Reply-To: <CAKYAXd_qe-dLq6o7XdJzG8orYiKRioAtfEsLjxj33Ca3=PzGjw@mail.gmail.com>

--7778e8827e5f90a3e7c9592d930e9c3386ae58c962b71883b69d27e225ed
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Nov 15, 2026 at 1:22 AM CET, Namjae Jeon wrote:
> On Sun, Nov 15, 2026 at 1:03=E2=80=AFAM Ian Bridges <icb@fastmail.org> wr=
ote:
>>
>> Hi,
>>
>> There is an existing bug that matters when enabling these checks.
>>
>> ksmbd stores DOS attributes and the client's creation time in
>> user.DOSATTRIB. The xattr also contains flags saying which fields
>> are valid. Currently, ndr_decode_dos_attr() reads the values but
>> discards those flags.
>>
>> When the sparse or compression code updates an existing xattr,
>> it writes the creation time back but sets only
>> XATTR_DOSINFO_ATTRIB. The time is still on disk, but its validity
>> flag is missing. This has not affected the reported creation time
>> because ksmbd currently reads it without checking the flag.
>>
>> Your patch preserves the flags on future updates. However, the new
>> read-side checks also apply to xattrs that ksmbd has already written.
>> Those files will stop reporting their stored creation time.
>>
>> For example, with DOS attribute storage enabled:
>>
>> 1. On the unpatched server, create a file over SMB and set its
>>    creation time to a date different from its filesystem birth time.
>> 2. Make the file sparse. Its xattr retains the requested time, but
>>    now has only XATTR_DOSINFO_ATTRIB set.
>> 3. Upgrade to the patched server and reopen the file.
>>
>> The server now reports the filesystem birth time instead of the
>> client's time. Directory listings change too. On a filesystem without
>> birth time support, the fallback is ctime.
>>
>> The affected writers are fsctl_set_sparse() and
>> __ksmbd_vfs_set_compression(). Their existing-xattr path differs from
>> the no-xattr case in the commit message: it writes flags 0x01, not
>> 0x51.
>>
>> I am not sure whether handling these old xattrs belongs in this patch
>> or in a separate one. Namjae, what do you think?
> Agreed. separate patch in the same series is fine, but the
> compatibility handling should land together with the read-side checks
> to avoid changing the creation time reported for existing files.

Hello, so I should include the legacy handling in this same patch and
separate the bugfix for sparse/compression in another one?

The problem I had found when trying this approach (I originally wanted
to send PATCH 1/2 to fix sparse/compression and 2/2 for the decode/read
fixes) is that with only the sparse/compression patch applied, ksmbd
clobbers the time on reading by reporting 0, since it doesn't check
the flags and reads the timestamp anyway.

For example:

file created on host directly
sparse through cifs/ksmbd
file's xattr's creation time is 0 (because sparse is now fixed)
allinfo reports NTTIME(0) because the reader doesn't check the flags

I also tried reversing them (so first fix decode and then
sparse/compression) but I couldn't find a good reproducer for the first
patch, as it's not really visible.

Please tell me if I wasn't clear, this patch/bug is quite confusing for
me since it touches a few bugs and they all depend on each other.
(And one fix introduces another bug fixed by the next fix).

Thanks,
koraynilay

> Thanks!
>>
>> Thanks,
>> Ian



--7778e8827e5f90a3e7c9592d930e9c3386ae58c962b71883b69d27e225ed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCavkMLgAKCRDmj22qf5IG
XBg8AQC0NZYp9aIV0dkoPd8ASyea4rdD9tU+TEW6i8WgdDlNaQD/aIAljJtDYKLj
IcT/BByomHzQYq8tiaJH9xBykbpu/Ak=
=MVUY
-----END PGP SIGNATURE-----

--7778e8827e5f90a3e7c9592d930e9c3386ae58c962b71883b69d27e225ed--
