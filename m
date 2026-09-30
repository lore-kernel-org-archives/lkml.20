Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82D14F68DB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780120; cv=pass; b=mHbhzlwHCuZl5LQG41Rt/qocLOQYiUX2IdYWO9UaEJGno2pnR8nIwGYHyRqyhEj8wEL+aSGsHqqjT9TGtOneE/63pRXj+SiUOMASiWcbQcQdIcq1jl2Pboipr5ewsJzC3vOJc9IL/QdmE8vCTRx2wHV3G/kjISTcPRbxMTQzU4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780120; c=relaxed/simple;
	bh=+9LhwFUxd3nuc3xpgPWp/vYsHWl/HfXCw8nLMlz0pek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtDb4NI6tU+rTAILFWo5nBVRZPXn6ThIJ2TjoOZ2h7UFBfzz18uYKIACnI7ToPsxEuvXmTdhKVsESaXiITaUNwxo3q/nX4GGR0m5Idp6bqhpNAIM7ZRPO0gpGdtSWG+c4VcWLbImX1cR27Ydnln8Y+x4qQOSJbnj+qzoriN2MvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sfQ24We1; arc=pass smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sfQ24We1"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-1431a73fa1eso381335c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790780109; cv=none;
        d=google.com; s=arc-20260327;
        b=lsJWXwelBY+pFDim1MQ3vVpQWSrJ4Wv4qNciWOZ0G1o8ppFmU6EFENyNLEFQTRtroo
         PvJlXYAaFGVJO0GTCYO6NCxTrTxze6WLavAdwWNiC34IALZHOs+b0NOFyzij7dxJeoIM
         gA+iTfsayMXz1C3ue/tVNnq9M7NaZfT77mO1Esiiw6YxltXiO/as/YF1a+hu1VnDSWps
         MNDvhKjJIzBcbHhdwdN3hKWrD+LSHBHVUaYuDiF60/6K+1AqgJwOjMo+m9EhPjBfN6HH
         DyFJs/GX0RLfnvZycQSqee18CIqt6pZ0c2L4Gyg/MhRlNk/WDpycika0rOWofIrm86SX
         rI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+9LhwFUxd3nuc3xpgPWp/vYsHWl/HfXCw8nLMlz0pek=;
        fh=mSmZqYyzWq3Pcr1Z3iElKXNRggAHHwvE9c6/IbgPOho=;
        b=hkQwK+1VqvIXUTDq0J884YRXMD5J2FRokgd+SBRhbzZ8Y0XeHzajR9J8eoUldDUhyg
         E8rJOk2XWEhnyTtBDHdA7k9q1AEOXfXJMun0x+5ZL1BwaD1VGCcpT/SNPunDeyzXsHF3
         4dmHb/UoKEkDvytiWtNa0Lr4/NL4bk3Nl1EYkHfPm/jod5hjO7cP1YQwKqDN8FNcdm/c
         8lVn032ajn3NVpDVT6ivJM6kG69FLAQl323mG7RT96biT3xiO7GnO/m0ErFn322jsQXI
         UcN4/CqkbXFZb0i+WptelDYZXf3zLjmCDXhJobnmNBfsphIju3o7DKoxWlnVpZHePeQ3
         2Dpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780109; x=1791384909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9LhwFUxd3nuc3xpgPWp/vYsHWl/HfXCw8nLMlz0pek=;
        b=sfQ24We1pryQMJGE2pQ9MOBijyxeO43j/VwTvfKvkj02sGT788H95lfrGoEXB5q8yr
         ZiDM7DvYwvyGbcLlAz5b9QHZ1OuDntuIG9Yr7So3c5AB00/dAZI72x7lSOe/dC/nYRJ6
         Ax37J/bf2172HF1/cw7h0o7GtW9H+MCIVcyDjqMWXRkuWheqQ8pWEK0fLkzXfvVyjb6s
         3BBfTZIEPkRSy/TwswUnlUx6phPI7VABGsOs347BjNGlbTNWZL2KugASXZBAnuVRoVu6
         EVHOa/phNNCP3inMCYiFhDCMFtlQIUlnp0yZ0JwLusX87wOac7sJEpEFt+0fUOvCcB/4
         X7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780109; x=1791384909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9LhwFUxd3nuc3xpgPWp/vYsHWl/HfXCw8nLMlz0pek=;
        b=fV79m19oCLF+HWQosU4bAGRAlbpFeCy5zPomGb8uM7byuhT8L5So+thPSALlMt9lZ3
         Zu3EqKApXu9f5UAqBWmTG52rL7cw+zb2Kwsa/uRNF+BZCSMPOkYr4C5zmtkezjTP6Wad
         9GehY3p/tO8gfIaZ2Qg3wmcCoS6DdwFCfTOLOo/qT3Ux3JNxhGLyCdHugO/SdGOqHK6B
         FdXi8C5O5O8CGTHcxdXnjiwZzXdckp+TsMqkXeh5YK0z9UEVt61F/V5GD6ASqCS5Shpd
         Ji2xS8gjP742qEy/8rYSZfOeYeLe8YMrZU6L9sK2BfZGA/dpnY0904UkjJumXkSJAncB
         GSZw==
X-Forwarded-Encrypted: i=1; AKwUvBxRc6Y3TspHSYJtOJC9q/QU+wCwlSxw5FN67Vi0IUji/3uuTo38chLW+TgmdIxT4s/FTCkTFlijyL/loyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnHmH7UhvI4ohd1ZY6jlDbfNEyoy2tDBHnU0JWv0VORLiXbQuD
	JzDR6FRsVefrcCLFCHwuVhsTTsINZhCMhjRdosZ8lB0QppRkjuDOaS0nwRKa1HwOZt47PzqLSsm
	bBTBl8WwFQcTrZSP9vXBImkGcmq8x6ZA=
X-Gm-Gg: AYBFou1F1x45gmTaFEx8ydF64dztHlUrj5hr3YLtO0d0kWGXGje+JeoBHKhVjyNiYed
	ATbYFGTc3/iAX/94XEyn4i4aGddvI8e58Ms9dEdKRv6TpuJNi2VoMFI3Z7szkWOHYLsiRfvWyO7
	9biMhNR5JYrntrvNS/xkDVm4qhdveqBnHe4fbNGmTEr9qT2SoDmRYZJ2Wdug3ewwqhLAFv85XhR
	Zp5qP1oJiged8XoSh2MEQw/uF4pJUFk+FSEzJ08SFMYA+/KESAPYwPG1FEXSpqZsAj3kgdlx1ib
	n7uA1K4YH/QuVyEt8Zu4hLfGq1wZvyJD0Fgw0aQ3vGIjW+K/xMRT78QBP/rlQzL5amjHgBxsQ3P
	eGYMiBQ9CWjTRb30CFL/DerMrOwvY63ZZOLW8i6ZURhMndHLAcjCbLGtkvhp1CZW7KhjKsU1bkb
	E3tkgX8HQ68N8g9dMgqlEktEvnO0spjhX/yDmPLiBWXuG//sflSDs=
X-Received: by 2002:a05:7301:7309:b0:33e:6714:3945 with SMTP id
 5a478bee46e88-34cdeb6be9cmr3096391eec.2.1790780109257; Wed, 30 Sep 2026
 07:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917051147.98775-1-tweek@google.com> <CANiq72nRLF7PmqqVUrAiw_M3dYZCr9ifoo+Q4SuXfBQsAFH-pQ@mail.gmail.com>
 <DLSOH1EVCWKD.XEIME3CYEYYJ@garyguo.net>
In-Reply-To: <DLSOH1EVCWKD.XEIME3CYEYYJ@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 16:54:55 +0200
X-Gm-Features: AclHuK8vs1MTQYyzGwnnDdzCftKWMmr3adWgFDGOHVj3p0ypcSu7KLDo5vXWnlg
Message-ID: <CANiq72m=rhBDJSSPBZ3yXb_r0jiCq7f8KOy+Fs1k8SzWJUwkhw@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: allow non-ASCII characters in `authors`
To: Gary Guo <gary@garyguo.net>
Cc: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:16=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I'm not sure that this should be considered a fix. More like a feature.

Yeah, I had the same thought, but given we discussed the topic in the
past and we supported non-ASCII on purpose on commit b13c9880f909
("rust: macros: take string literals in `module!`"), I thought it
counted as such (that is why I mentioned it was unintentional in my
previous message).

Having said that, it has been quite a while, and it is also true that
for 6.18.y it may not be worth to change it since it does not apply
cleanly given the `syn` rewrite. It is easy, but requires creating a
next `expect_` helper.

Cheers,
Miguel
