Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825230;
	b=DXvM/MHfQ3s5DicbYCnvfIeKQUMxlQSNUDwEsjWTTOHJz7NORuTS8/53B0DDZRDxhsgk
	 vMU6xBrC8WWNZ2TY0OsgQ6Qhdlyhk8i+FD4gF8JbktvQqT2TzJOw+ZAovgMQeOme5xQRL
	 yV4bPLZfNKIe79i3Qhy+4RzeVpI7tZnIDMSpZjAlaRViFlVhZcdsDBhebGhozzYIZJcf/
	 dqXeMtqTdKuFNhtiwNYZ5TOQULeF1aQIVJcnPUaUGnL0qIEaL3nMJPJwEg/eS/loUQWNn
	 y3mbA8nqh3B2iF8GKW5R85m9WwBA9vN+V/sBgi9Prr4irylVUmazcIZ/vDkKXxTRTLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BcX26cyIolLDGV7RzmSSpE6fHAk7h/NEUs+iaS9LpDg=;
	b=WAl5ytqG0+Mcqrdmn2Ci2ASTLHWD2jERzJv+ywVWk3ahvamDzOubnZytVNOxw0yu6fOI
	 YSgOKmbY7Wj6JZbnWH/38W+gT6YHzvZ3ntkjC8zta13BQiegH0wr7FaIH67RWce0TXz2g
	 ymJjdlxTWpcqqpUYw+9RLl+ahgQuc2fpW8A2ttOSH63mHO/oq0zJz3ZyUEsn6zr1Jk8lE
	 dHk7S9X1LAKMAH71ar6JCBuuSDpW98FmHdtea2CPiILNTXxRocTsI/cWtk1k89i10w3jw
	 OaLOxpfw14ZamlPB2H1R1aw++733WGbNJWjnUwoz4G+WGCx0Oi8Crpz2KsnP7Axr3Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMA7Ex2A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3E3606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD3E3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMA7Ex2A
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso7453704a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794825228; cv=none;
        d=google.com; s=arc-20260327;
        b=oVRvotIPThHqgXJcXwNQiOvoM8KqPlkVpHc5v2uTvQ39KmvDZdNBhUIgwiuERV7TJ1
         Pkqctar3wl1yjjHi2i3AJLXcFYqaTcgUvAU/2LhUI3dWGNFWZUBCdIPjsUq8v/IS1Q5G
         ukF/IgL8pV05J8vl1SBrFtAq4gFLlH0MZKsn6VGcaaj6IMJvgLyDpFfAjX7WjcoL0Hwh
         jzenW4r6v1i8sZRAeSfUEPjZEnNUJNHKjOsMydPNtiA3kAS0zmqdjPcmvZoaR/AjsEi1
         bNsUYkE7JJMXaqz8kbfXvO2pO1TFrMKyEPAZF/CizdkUeuSZ2mEzMh4MjH5vOu+P8uGl
         Z0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BcX26cyIolLDGV7RzmSSpE6fHAk7h/NEUs+iaS9LpDg=;
        fh=keD37XECy0z/3hL6GtqveNACSlSOcIodqowzPceDG2g=;
        b=ewvnWVn8QAfKOEDOm9qYcAcmjdtCvNIYR0lWP0sBAsYYhUWvXzSYfFRJ/lUbpK5ije
         TtlTnNAP/IVloYpTpnA20oVhTmUHarhFa8g6mlEvYr48rGwHbM737EXFiAPfAmNS48I2
         HAm2KthMCOmhUT8DFw9CqKzVZUVLIWS+AMRm5R25X5y7DDkb0d6E5JWP7NGBctYdUUGY
         UgGc1PbWP/g/1YiYb3o7c/RzfCBXgz0BQqKi+dXe1paGuvVu6hxJaSd7M/sSaEI/Zpmp
         8f++5eTHd/9qhai87nG8RVFXgAaBou74/do1+AAUAHde8hfWrUY+fgl0s5ZN1UwKrdzT
         AD+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825228; x=1795430028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BcX26cyIolLDGV7RzmSSpE6fHAk7h/NEUs+iaS9LpDg=;
        b=cMA7Ex2A6a8giwsic57JQmQVBX4z19O1dwTosopkucFyXilbY7y4KQvBgOiVlUfQHV
         HhAjKnQP4IMUT/2RcGEYQBbPdsrbJdKU7BxmvDzSFaQwhUskc5hS0PDmx1g/X6+As05o
         vBd0pxF0KsB6gB8C+ujKBTAPYJQPLmSf+FNlku+Fk+liGCRRjB6FtAr8GiqsV8qilknA
         4otgmDh0sj2x+FLoPTxCPf09e+9/mAFOVzJuMeIZKZyVKGLFzy7WnmxFpwsKwACWKYjq
         u/mzVKhZpQMIjHbuhHuLVWetNaA9FSK4x0zkK1a2lA64X50eyJSpw2S+gM4Z3AshUNqu
         TiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825228; x=1795430028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcX26cyIolLDGV7RzmSSpE6fHAk7h/NEUs+iaS9LpDg=;
        b=GPenvioZFQT1Al7w1iZAcAJGopOuzLhXrrKqUMDioW8Fh+w69sjk+amcKdHo2d2wbH
         OvUYiZLPgDVV0cJMw/3CZElWEcrTvR7RiYm62IrrPolpdIfBFHjyz81Ti+ZkUyEEsOOA
         p6/Fhc6aNlC8MAPPZ/8IwWaHcQcgDpHx4zEJQ5L4vgbzygHYZfZEgXZsg2eAHVvBp24R
         rn85boDArkyRieRAS0Niu8k3TcffNlGy5d8N8WHJWmcUdvBHER52US6BwgXu657jW0Ic
         Qbi4i+c1JD/haPeBDEVgqZ15JLnopCTIYGcGVsvIcX9+ddPjz5QDxDzzoEv4KTa869bq
         bk9A==
X-Forwarded-Encrypted: i=1; AL+hErFzvvbEG8aGmbOCYyaJbR4jELc1CweylV9no4K3VEbjZZGjm4vykWLBVr6VjRPCGl++aaZ3oP+11VuYsFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fzoHrpNmoYjMntB1TfoJ03p/igP129NwObz2EyWk7pkad0gBV
	PlkpTYwXHvJY6v5MnoZflLc3sWOGrkL030n80/s7CC3Dl0FzdS3Kd7SEaXJHiCuupsz3W3ahuTn
	oNcYwhv2vhE80QrgtbMSOHUCh4PTd5b4=
X-Gm-Gg: AYBFou0uMFrqI25nYsROsTLBxIYAwdyk8u129dZat26HBJ1zQc/Fj3Oc5WOTWPNPOx6
	PsjjZK0ZS9CKaD/5TCtFFZlF3B2o8JPzSyaF4T9w1JZnc3COzN+iVpD6wMFK09lGwC4v0T3cfST
	O+fFLxrW4o1rZr+KOb36lHjg5W66+9urd6o1RSHH9cmknuHf4gjYeOoNdDO0nCrEZ+jsWS1bLkk
	06W5Vfo+yz98zH7ugNVO392qnIIu997wdo4qhaRvfHqWHAPa6sa+XdEgkiM0nMqZheztJcXUBFD
	YrHvGOmPLCyuwkb6UoZ7LWepbC/GywBfnQ3lLE/1lxD39EH7USYoaBZxiJnLrWBr+3MeGNNclNt
	Jkh8XsA7NmT40QoN2LrhlwAdkaI1zADeqOK5WagRKuoSp6h4XNdH9KHgitkNK1okUn6W49Q==
X-Received: by 2002:a05:6402:44d2:b0:6b4:59d0:7294 with SMTP id
 4fb4d7f45d1cf-6b7c0c7fc57mr6737947a12.31.1794825227756; Mon, 16 Nov 2026
 02:33:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com> <20261115210952.2140036-4-graypanda.inzag@gmail.com>
In-Reply-To: <20261115210952.2140036-4-graypanda.inzag@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 11:33:36 +0100
X-Gm-Features: AclHuK-NMHGmo8BvWWPeGRhVs7Os08I_QBobJYDFHOlrsGgrh13rxr7aQnEhSTs
Message-ID: <CAOQ4uxibz=iM4Xg6qmRmqKB25w=Z9AaaqnMqc-L2d27G632hyw@mail.gmail.com>
Subject: Re: [PATCH 3/3] fanotify: zero-pad copied event names after an
 embedded NUL
To: Junyoung Jang <graypanda.inzag@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:10=E2=80=AFPM Junyoung Jang
<graypanda.inzag@gmail.com> wrote:
>
> fanotify_alloc_name_event() sizes the variable-length event buffer from
> the qstr lengths and allocates it via kvmalloc() without zeroing.
> fanotify_info_copy_name() and fanotify_info_copy_name2() record
> name->len in info->name_len and info->name2_len, but copy the strings
> with strscpy().
>
> If a qstr contains an embedded NUL byte, strscpy() stops at the first
> NUL and leaves the trailing bytes of the allocated name buffer
> uninitialized. copy_fid_info_to_user() then copies name_len + 1 bytes
> to userspace, leaking uninitialized kernel heap memory.
>
> This mismatch dates back to
> commit 929943b38daf ("fanotify: add support for FAN_REPORT_NAME") and
> remained after commit 0fdbe845534f
> ("fanotify: replace deprecated strcpy in fanotify_info_copy_{name,name2}"=
).
>
> Switch both helpers to strscpy_pad() so any trailing bytes up to the
> recorded length are zeroed.
>
> Fixes: 929943b38daf ("fanotify: add support for FAN_REPORT_NAME")
> Cc: stable@vger.kernel.org
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
> ---
> Note: default FUSE mounts report a zero fsid (-ENODEV on fanotify_mark()
> with FAN_REPORT_DFID_NAME), so this patch was runtime-tested on tmpfs
> with FAN_REPORT_DFID_NAME create and FAN_RENAME events.
>
>  fs/notify/fanotify/fanotify.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/notify/fanotify/fanotify.h b/fs/notify/fanotify/fanotify.=
h
> index c25cf5c1fc70..4a1f14aa4974 100644
> --- a/fs/notify/fanotify/fanotify.h
> +++ b/fs/notify/fanotify/fanotify.h
> @@ -225,14 +225,14 @@ static inline void fanotify_info_copy_name(struct f=
anotify_info *info,
>                 return;
>
>         info->name_len =3D name->len;
> -       strscpy(fanotify_info_name(info), name->name, name->len + 1);
> +       strscpy_pad(fanotify_info_name(info), name->name, name->len + 1);
>  }
>
>  static inline void fanotify_info_copy_name2(struct fanotify_info *info,
>                                             const struct qstr *name)
>  {
>         info->name2_len =3D name->len;
> -       strscpy(fanotify_info_name2(info), name->name, name->len + 1);
> +       strscpy_pad(fanotify_info_name2(info), name->name, name->len + 1)=
;
>  }

Same as for inotify patch I prefer that we are consistent with d_path(), fo=
r
example by using memcpy().

Thanks,
Amir.
