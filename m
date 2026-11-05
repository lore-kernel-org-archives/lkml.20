Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840179;
	b=edPSvESvF8LF6JfGn2r4Exo6Yu8OwPSyGV40/rx3PVXHE2XH2vF7xQ119v5FJZR3hu9D
	 xNEWdizz6Byi1Lnk4klLF35d+5SrRG4yonOWCKl/WYbM1W8chUAWzYnhjICry7Dlzm01b
	 gy9JaPmHp6roPLEspAEYaY/ClbLDeOsUnqCOu5Q2GnmrxG4la7bbDBMiSOg2tAspnFcDa
	 xbwt670KA48g8hi7Is94sOpvlQm1lwurugJrnMIQE7R1Ilffdzgj1mE2eQdkq5LoY6QOu
	 40nQNC0/bw57SfsTV+WOk0CBrAQN2PcbNUcV7Ho1lLfQFJ0/5EvGy20vAR44nKj3hOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:To:Content-Language:Autocrypt:Cc:
	 Content-Type;
	bh=6eXXWi7komBSrov9nUxVTW0Dt48eZZgpagX6tasygeE=;
	b=YRVXfllD3aa/g6E9EqFCwXqlGkNKRGPYYXvvDWbFFs4hCKjJEDaPduHDPDMMeoTbriE9
	 EH8HJn19KWhjr6zxpJ2C1nIxB5lGNRyAf6X9bmtvdZGAXH3EaS+Cl96VcKhYODW8EM4db
	 yesf+GaZoroE+K+qUyRF4SgVx4waow2IXeIh+/Rk/x0m4P0S2T1iASzF/eYmP3rkovPgB
	 fy3L48pw8yokQMgFuISdBoQPIqbVkqQtx3xPRuMyvviinOry0IojTwvMtNLiPIYtd3lB+
	 Bt5cvhtX8Hmbn76ZLrzKMOAfyWuVoes4NK+OkS/RJkWUJ66Jz1vmE3CwcOu8batSqOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbLk2ZU0;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D01606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96D01606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbLk2ZU0
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0a921ee46so13314107b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793840178; x=1794444978; darn=vger.kernel.org;
        h=content-type:cc:autocrypt:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eXXWi7komBSrov9nUxVTW0Dt48eZZgpagX6tasygeE=;
        b=PbLk2ZU0Kd4islwaaAu66fBnEM3JOZ/Jz+FQGvkbKKIz/XPoXqyqC5ISesmmqHQZdg
         ON0SHIesjL+czQuDFk0c4w3xhRlTtJAbY+1bnYmmt6sU/LRtDWF5rjsc5frC67/wO/v6
         ECjYsKaahJV3UzraNKd9CHNG4lY6FogshDeND8tRHLrk9M7pUSOrP+Fg459LsLAzGe1J
         F1kjZW7qWFAbdW6QQJUC1yo4AFnrtpx3TEJoEdpA8GZduE+awwSTXysxL6dE8ippScfA
         sGA/mwvvVd58rXT+j8pwEYhm08bN25+zT33mvsT/6Li3gc3XX6HIL3qV+NZPcnkKx3Tn
         1TVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793840178; x=1794444978;
        h=content-type:cc:autocrypt:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eXXWi7komBSrov9nUxVTW0Dt48eZZgpagX6tasygeE=;
        b=jwS/oVpRGi8N1lMh3dGc/6zwL2jaYwXex17C2QYvIvUn7ZzF5YBe3ZmlOzq4LZsyzf
         bVYAkmIudQDT6vwFXrsX+Hf+l11laGC5lPBxbnbeXl+XJ57xAJ04goQLUON0rzeWTnl4
         HxB0cwE/D7AHNsn2NT068/DPklFom3Ar7moN0fRVRJ4fP7iYKdxQ8tk4MMAr/MnvhfvZ
         ubAmQDsGGF0+Oqzmr2oU2//JQT73/0m4k2TY1SYyelhoIF9hEfOayPGaE5UHJJBlcCEo
         EbVk6zSOwrOJk3fs2QgYJ9kfq7sWT4UC4zmRdMir2iiRN5x1OqwW29SoeEEG8eLGwB3x
         h93w==
X-Gm-Message-State: APuU4Z+/tUIaw8oTghYp0FszSFWIRi365M66qexgXC4jPXzgaioa2C1E
	JQosKLOALASJgh/7kPUUiNpC4MwTJUlHCmnuy9RjJvoUFAupFSnWP18XZmia/T+/HqU=
X-Gm-Gg: AYBFou1NFuW5XrB8ZFcDz81T/lxo9n0bkf7iFEcAPmUhr72+QRi6mKsm1UrKP/GHPZR
	BzNf2zXOYIumsCL4Xd6hAdI/ltMCGU3W14BXLsdJzkyb1zEKVrf2jA2WKrKolT67v/NeMRQ6YEe
	6Tlg24zhGgKhNYWvsukgnKyPx69dnHLpuR27XvBIO0T00FpAQrOaHwpAHKK5jNkDXQEr8gFxk7T
	SSZhgHVmJumlHvuNNlUx9zXcoc23ruF709yqRwP4rSoe6s+Hf0P+bm536Dmn7fAB7GRTyqApBaL
	Y0SwVgDXIPt5enbx4T/ttUdETPdDO9FGq9eBxriyo8rYCmlta/Mqb4oxWF6lBAY8sMq5dkXRFul
	qn5kAOsHTzI946sWomafotXQXEK+5FePLfHRpIqylibkrfLVN3TjmbNR78tYoz6jrukf4CRsIoo
	pRQA9yNl6qZsSUxHIRvpRt1xOXSQ0TzhTKLJJnWq6OPIN5C7UFdrdZ8lCp9Rw34jae3ntDA8Sko
	I1YmLgwAMqGj6bekF7kpdB0y2w9dtx8qiGyYDxU0FYv78vPPADlbw7h5MEJGL8hwHwmPS/6ssNP
	Um2IxTOeioaMIkewBliUlYZpN+L4BbFH0g==
X-Received: by 2002:a05:690c:c507:b0:873:5ddf:d872 with SMTP id 00721157ae682-8b2b6749779mr102401947b3.61.1793840178492;
        Wed, 04 Nov 2026 16:56:18 -0800 (PST)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309932a24sm30029057b3.19.2026.11.04.16.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:56:17 -0800 (PST)
Message-ID: <8b45a161-101f-4f28-9b7a-c7c8b8a29f90@gmail.com>
Date: Wed, 4 Nov 2026 19:56:11 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Demi Marie Obenour <demiobenour@gmail.com>
Subject: MAP_FIXED leaving holes on failure is very difficult to recover from
 and can even be a security hole
To: Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org
Content-Language: en-US
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Cc: Bert Karwatzki <spasswolf@web.de>, Jeff Xu <jeffxu@chromium.org>,
 Jiri Olsa <olsajiri@gmail.com>, Kees Cook <kees@kernel.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, Paul Moore <paul@paul-moore.com>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xVK0XLy9X0vduJNb936CFAdr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xVK0XLy9X0vduJNb936CFAdr
Content-Type: multipart/mixed; boundary="------------0BQDKKn9cP29OPNRK45Ha9VW";
 protected-headers="v1"; hp="clear"
Message-ID: <8b45a161-101f-4f28-9b7a-c7c8b8a29f90@gmail.com>
Date: Wed, 4 Nov 2026 19:56:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Demi Marie Obenour <demiobenour@gmail.com>
Subject: MAP_FIXED leaving holes on failure is very difficult to recover from
 and can even be a security hole
To: Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org
Content-Language: en-US
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Cc: Bert Karwatzki <spasswolf@web.de>, Jeff Xu <jeffxu@chromium.org>,
 Jiri Olsa <olsajiri@gmail.com>, Kees Cook <kees@kernel.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, Paul Moore <paul@paul-moore.com>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>

--------------0BQDKKn9cP29OPNRK45Ha9VW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Right now, a failed MAP_FIXED mmap() can leave a hole in the address
space.  Another mmap() can then enter this hole.  This was fixed in
the past, but the fix was undone in
4f87153e82c4 ("mm: change failure of MAP_FIXED to restoring the gap on fa=
ilure").

This is really nasty, and can create serious problems for userspace.
A simple example is MAP_FIXED over a part of a KVM memslot to expose
memory to a guest.  If that leaves a hole, the result is catastrophic:
Subsequent mmap()s (perhaps by malloc()) can get put into that address
range.  KVM will give the guest access to whatever happens to be put
there, and one must assume the guest can turn that into a VM escape.

Other situations don't result in immediate disaster, but are still
really hard to recover from.  One can use MAP_FIXED_NOREPLACE to
refill the hole if nobody else has filled it, but if someone has,
there's no hope of making the original mapping (that the MAP_FIXED had
clobbered) contiguous again.  One must either figure out how to handle
a non-contiguous mapping, rebuild the mapping elsewhere, or crash.

In my case, I can work around the problem by using a single memslot per
file descriptor, but I suspect there are other use-cases that aren't
so lucky.  Yet others may simply not have realized this was possible;
there's even a Stack Overflow answer [1] that claims that the map is
replaced atomically.  I only found out about it from Claude Opus 5.5.
I asked it to write a test suite, and it pointed out that a failed
MAP_FIXED mmap() can leave a hole.  If I hadn't asked, I would have
shipped a security vulnerability.

Should the behavior be changed again, so that mmap() with MAP_FIXED
is atomic?  That would provide a UAPI that actually makes sense and
can be used without horribly ugly workarounds.

[1]: https://stackoverflow.com/a/28576674
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)



--------------0BQDKKn9cP29OPNRK45Ha9VW--

--------------xVK0XLy9X0vduJNb936CFAdr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmrr1CwACgkQszaHOrMp
8lOVcg//SKjfMVWdZ0NQUQB8SGUy1DUvasvgNKbECkMRVXoKID1J91XoXk0hW6a9
U7CFyJjrLcIkxHBXo3i+AHcz/9R7BD3M9XwnQAk3ZcN7XdpgzjGNXDixXftPcay1
lFuZfI3btf9V+AADMiP2EwrwseYFFciXKxaSvFlmV8it5+8xbffiCyyjbZ5RFZ/g
s8x1bJ/XzpZCPv9NZyn4lHWBcbJ2eN1N6bgblOaKHLLN7krBDF2fQWYlFXmOieWT
weTFXZxKnH/NpwVlJfL2jeCkYXUdkdDHOSWJm0taFbfV2Wct1mgXXewrjSrDTgyI
1G9iWh9zr6+Qu8jtz8/XPYltG3/akStk61ncQEo4PUGg7hkEG3haP+T+fOaepot/
mMGFdYID4j6FQHz1q9EiUclgd3B5u4CcWpbpsua/sFwbWlM9LG+vU+NcXnAArHiW
gxR7P+3FeKGua0MD6WMcpzg4NiN0OTCfdEZgzIpyhxpJy8p020Hpwr1GQ4lMHApX
mBmOfMVDq4jVzv539aFl/rxsgAIb99ylyRWHIBP7ARe8MoWq95W+Gh8FmWDPFK47
SRUDXhOU8IpnAUa8YD5r+32q5dXY4M7v3scqSBh4lxni9Em47+goQTcrP5lNXqXl
lBTECCyQP8qfytBERyiDVn+jPTlZQR8gBy8sezeTQ9CFah1jbww=
=n77z
-----END PGP SIGNATURE-----

--------------xVK0XLy9X0vduJNb936CFAdr--
