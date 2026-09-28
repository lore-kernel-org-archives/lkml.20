Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C524756D8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631308; cv=pass; b=MP4FzaSJ8rCilbS1oWuSBhbVd2I8ca0dtEuVWXdQE7Ad2WjdIsPhyAR/6q+kmK4SeWV+hUFANYBZDjGNXdgIw9aqRzv7Z6qF2/AHroNpmG1pqIYVV/s3nzpLe4YnWgIPuLN64vm7V/FL4Bpdj4mbxaeOh8SP9Bx/tmzKDEHJEXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631308; c=relaxed/simple;
	bh=vzJQ85GPqKFtTeBCXYuHKUzsnPT7TPrKjUdhJU56BoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKZnEB0D8KK5td3O4HIHn37KVN+FK6ujtyXxEtljbNGsbIGAD6UMMkGjOumGJmznUTuZFmfBIafHzR2rM+xOjDdzPTuoKdO4GQf+c8ZXIbkcqwR2ufCpR18gaBz/kj/5FjH88YA6iqL3oShBFfCwoT4sod89xFM+DWImx8qq/qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URNxiS6K; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URNxiS6K"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2c570a3030so299774666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790631305; cv=none;
        d=google.com; s=arc-20260327;
        b=ly/VQCCyKWANiDI0MuwDFwu/SGkPU/W6b0FaeKHhbxj+C9XDuGQZwmdTog5bKSavSI
         jMeWFU8JA7+ystl0pxV1tuTRCizCK70wJbhYq+GfAfd21T15lk+uD4bAcsWwueFpn+Ew
         HDaFWhlHHTrgtMs6ElAM18mBHuDI46dXOaiP80cnhbgbT8dStrSxuWT8C1BjC6q8hHXw
         2ZNDhvrdVnj3y+lHnewkjUb0Pn1a5SqfzcKHe+8fD4XCS4gF0H7ym9wvpIWF8Ezz4uQc
         ssvryTUej21V8zsc4Kpd/2oTPWeBE70eHIn+yY9WAAZY5dnXYjOYL0Y3/qxUbiSGNjyg
         gSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hKH1VCmfZugQJTpZMRBvxmQ3C0yXJLdq33pyaJF/XR4=;
        fh=bCi1AmTyfLhCkYzDlASr5Xi5OEbOWO1ik5Jg+tmhVfM=;
        b=L8jTap61K19aMglOH1J67vRyOzC49CrNs/JJDr3kcz+D7+eEMDT/OIwLhB0EyKl6Im
         i7ZOV16p2AnCxA/xVqj6shEtBvslK3v+45JOg10MwelwcmJ8+FArcyUvQTMMRsDoygWe
         0JOxXfeL/X2y/cxW1yYp735kuaIvpxjXafZlpdyQJVIvvc6yntg3YvsBf9B2iXkvbHHE
         m85s6DuAzerLJ99CbMA6/q9pQbYig/jCwUVdMOCcVW48Ey7LAqV9dwqJv5j1B/yDnye1
         6CdL9/R0JLz3eCq3rUOtM+P/io7V7yt9I2UTe1rt6KT1KVLn6J4YCwsHwfEYhfQO59SI
         cXTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790631305; x=1791236105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKH1VCmfZugQJTpZMRBvxmQ3C0yXJLdq33pyaJF/XR4=;
        b=URNxiS6KrB0BjiY8vW5pi3471D4ar4brtKl+SuMRzOHRw3Z9+IVokYEsFRFWaSjOdS
         gQn3p18H/PPrpgwZ3p4EiD1lPNYZZE0ndHqy3LSU5xz9ACmXZQ1BE5wKeIWAiVeSmWui
         NpyUGGtZGi50fa350yGn6V398YN/rVJT+ObA1n+0EDt+Ss3P2DqNOs62BO2a44MeWMly
         b7T+7zzkeWbpGBPDbTDjjL/jrg9FlSHExQ3uskbx/m5Sv1wGqbek8Dy1+K/t6X8Cs2eG
         SO0vHi/OGWMy5nKmp9s3NCq9hZ66GmleX3bcLfi3TIqEmcEvhtMt3L2zUZiNPe6BAZ8j
         s3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631305; x=1791236105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKH1VCmfZugQJTpZMRBvxmQ3C0yXJLdq33pyaJF/XR4=;
        b=SyOdu7LFOQAExPO5PEMoTTqThlAlX662Pw1AMdT4csgkQoQc1878p/gbFGwXIXCfnR
         m7tl49IHM0hNVD42Zlp9RHeaZqV4kVWium+gXC201PbQBqA08o28f3Gym1ayPup6Q3zz
         ebV2PgjWZity5Pwi1zJhQIjK1k5F9429e94kx8TqOsgy5az+r2Ah0BpgbGVXEjtBKtqi
         wdt5fsx7+f5kyzhSsmHctQK5Jpc6MLKAt87lOt4E1r+5I45MtALAr4FyR+fWff6ESFGp
         f3YlOVbAexE83xY6ltWZEGvTOHdA6xkJE6DNkSukdFy1InlEDk13wzRGio8U5NozAbQx
         qZ1Q==
X-Forwarded-Encrypted: i=1; AKwUvBw3lSb0p1zGvQ1gCfFuP1hmkEHuM5XW/z4r2Cu1PiQ6bnBBXNn4Y96LgxkE4e3pjZOijZLCEJty64WB3S0=@vger.kernel.org
X-Gm-Message-State: AFuF++kAHZQXMbCXKdrbVg7D0xGSa+8nG//mHyry1YVVYJUVBphVu7Kq
	/T0mUiGwVxy/Nq+EMip6DSdYTytRExM9F/bncl5DlfhFZhJF53uxywlR22Pp5aSE1XvPZkmHdh8
	hz0asqE9hvgq/dSd/tmTvue+E6FtD4nc=
X-Gm-Gg: AYBFou3Ai86QWX+uzy+QM4ChED1LCMHihjva5iMjeNul2Gx1RFN3GFu4JT3NYpJGc41
	Haby04CD+dPdG6i4fqeePxHjEB2nqWIi3ZsX9SNTfP6HpoCKaBz0rXl2J2qOq6di66B+33NGt2f
	fnvLUSkaXfgaGJwnOFo5VHeHV2hXsnYmp1u8nyRBeiWOdEswEDGVtrbRaA5/MEDBKQIp6oxVWII
	go5quvP1hsqf8jdS9S1irg4YYEo/gMupmvOnYBjycsoCBVAmyzilA4vPzGj4tjtAoO6kb4Of+Bt
	9cV+3MtAywxbe8dyH/2mkfCNbZOqmMbu6MxV4OI3u1W6mfiM0vmyvyG1rceEAfaqkjbiR0IMFnC
	J6+gzm9aUyRW1ERe1+ncgR3BBX7dkr4ESIHx1pN34utO2iUFH5MXli00Um/EE4Z5XpoIPhc6nBe
	u4DJ24A6ocROWg83/+/Sr7VM1QznHZUvG1Rvqbfb2A
X-Received: by 2002:a17:907:d789:b0:c29:5172:6151 with SMTP id
 a640c23a62f3a-c2ac263bc06mr1090827066b.45.1790631305354; Mon, 28 Sep 2026
 14:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928200318.63383-1-meatuni001@gmail.com> <20260928200318.63383-4-meatuni001@gmail.com>
In-Reply-To: <20260928200318.63383-4-meatuni001@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Sep 2026 00:34:29 +0300
X-Gm-Features: AclHuK_zWLiFRrc6U7vmxR1ZoTbaYKmfPM7Lz80sz5CYaEVPc8AD2uZZsDfOheM
Message-ID: <CAHp75VcrAo_XACcfcycaGyiEsDniBBzCGMyGLip32KQz82q33Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86: hp-bioscfg: return -ERANGE from validate_password_input()
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:03=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> validate_password_input() returns INVALID_BIOS_AUTH (0x0E, positive)
> on rejection. store_password_instance() skips the store on nonzero
> ret, but its final "return ret < 0 ? ret : count" treats the positive
> value as success, so userspace sees count instead of an error.
>
> Return -ERANGE, matching the sibling validators for string,
> enumeration, and integer attribute types.
>
> Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7): writing 999
> bytes to current_password returned 999 with no error before this fix.

...

>         if (length > MAX_PASSWD_SIZE)
> -               return INVALID_BIOS_AUTH;
> +               return -ERANGE;

Nope, ERANGE is for integer values. Here is definitely about the size
of the input string. We have E2BIG for such cases.

>         if (password_data->min_password_length > length ||
>             password_data->max_password_length < length)
> -               return INVALID_BIOS_AUTH;
> -       return SUCCESS;
> +               return -ERANGE;

Ditto.

> +       return 0;
>  }

--=20
With Best Regards,
Andy Shevchenko
