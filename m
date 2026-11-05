Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923169;
	b=zIX/hcqOrtyP/lJLYL5A5n8OVYKhzh1XCFOiGxfLKGIklt7XbN0uiycLMRlgjfN+FPZr
	 hGKgLHNe99/bucUAMUXiZguLu7FYOMkCJzjcKmJQ+h8SmuHFFSKEZU+FUOsQH8+7daG75
	 3MdeQVUg1TA2G0GQr/cjTS3i1fsdxgtuQX0+WZt5R9c8O+6WFbnH1JOlQ8U663QgAaxPs
	 PGv83bFQsqbG+5J3ium5fYUr5sseIRVCD7Jw22U7AkPjPJYdFmkGsnjTMu5oQfdiNfneJ
	 8l2y7gFSA6qj17IyF8GrtCmKibEi5LJUwb+tc7x49+jqbNS1FZBwUR+riNrh0NvWd3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=T28C9sQ8FiCIuaarqzvmePMhVsvyoXKLzlM0HPzQJ7c=;
	b=CX/kMwpgqufTRsFo65yxnfY+jc3YYpx4iSTLkoT7YLgxB2X0Ky7NiOk6qA/Le0EvLeQv
	 lX5wNzcp7obmtWskD1jRfIqW+WOstb1NgWHxM2mtf0OgM8sFLgRSmIMqcJ5kaDvELJW4N
	 TNUPahcSF+5lKiz3KHO58eHLRwf/DCZxfPm9drK01dLzaGG6vX9SfDFrKPJnmUO5kf3JH
	 k8eiwEOrW0zVE8Wf8UoB4FXbg7qF8AscQBwQc87P85lJjwgupl4ke3Tr9tSs64gJJr/si
	 WGjRchtBojwXfRwYSgeYUxibc6vrJHL9fnbDw9f3nZNCqzok91/SYfd+5+ck6ONhZbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1sxyxC7;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1F8606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F1F8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1sxyxC7
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7ce78f9d6baso81109137.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923167; x=1794527967; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T28C9sQ8FiCIuaarqzvmePMhVsvyoXKLzlM0HPzQJ7c=;
        b=a1sxyxC7bQJtfR7cdopBphi5R7bfTcf4xIBuY2RS9JbzxOht/RAT3BkY2w83PWKnM+
         988yugqgJ6bBH0W1+FVyiBl0PYlbTffRN+Jnse+kr/Yx051ED0XQgqs5YDIsWysPqFlS
         7nR9B5nNy616IxcczXvYD+/SK09DOIOFUKTW1P8/I8BgeOLF3MbE0FfmotxNAuoSiaC0
         Kq5Cnz0Syk5jaMFWW+9TnPJ0ZiB+G/7CXLW9pOnDDvyE22s69/OUdmVhraqejKq5C/XZ
         ZK1mPztrd+pXvS/sqZQavirWG/gP4PtyNZDeEowd2L8HhFyXT/ryj+5jxSOtVvQjn6eQ
         MW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923167; x=1794527967;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T28C9sQ8FiCIuaarqzvmePMhVsvyoXKLzlM0HPzQJ7c=;
        b=WZ/jdvAoOXbyPuHFZ/TqAhp+V+bOiDtiI87gqLK7d4clU4TScXcT1Vrja6QIktu5Qe
         BvpvQmercSrxQk2j+mmIBodSCOF8Iy30FUdv4O9PD/t9KzRl7ISss8IWlEpfpFrgkTOf
         LVQUq8Oi9k9QRKFBjOaGF88J6YqJQAGPLytIEZvTFwZIyj7VN7kIeA/Q0V5BBjLDNJPO
         cgt6lIAGUEdXdrqndHfB+A5OqYhdiaZvinNxE0yf7bCwrGmFM58cmhCBTRX4fwrtfZWA
         ZaXlpZl4w/CyuI8J4ndBjUsgoJJisxqb+7hBc0o7dgYHeegAqZeXR4mMtG+pgF/j0/Me
         Oc0A==
X-Gm-Message-State: APuU4Z/dEjQz769vw/49ddogYnc+pFg88Ai4aR75dcs99S/FmWDOI8cX
	q+dWkmo0PR41Om53A0iI8iaM+HrDJ5OuDxXhLqTlUXMO8boMQnHrcWCL
X-Gm-Gg: AYBFou0SwsLqcEZRLSVFxzDtgsvV76xXmnBbF9CIQL63wF/RrE4hftX1uVCp20N2gtt
	+38SilvjaowI/1vSgVAWOMvW3VyCqKfvMuVZcSygykOVgcsahiZh/jucuT/4QsXm7LiIW/fKa7U
	Gz3AyI1M30sbmcBQlR75MnQYu83+BvRecgLHMJMCnc8mKStS5RM+DDIcYIblsDgCuS624XxKPQR
	6yQ8XYz5YRI7tvaHndSCEx9OCaO/rQQATaG2TNByoFFNH6pehkOjICdADmU6CDHQfNs74r15jyk
	zBIbFpCycTwm98r8JvF/3uR4mQgXqnh81GCHVtJll/tCY+cZAr6I4YgtYWjdfauBm7Fpljs+3Sn
	yaoJynXEtW1X4OComrJm16J/GR1FgR8iS0PDPd/mteNJbW5+/eFOcalXxy3f4xs36faDCiPBcjE
	IK2tnvvVVL0PKvkcC6lqe50fk7JrJXUIYSoChYR+HuzcA3MJPAswD6oDX5E+SnfT/ak2JHuevl/
	FB2bPZTFop7dPK2DZyrJQZOIWj1WJlhekv3+Bi4jFHWJdZJPzMV82Cx02Yyq+F0ZZfkdDUUaBy9
	GB9Ngi+zQebXal3qn+j3Cx0H/QYfe0PD
X-Received: by 2002:a05:6102:a199:20b0:7d2:9ed1:3773 with SMTP id ada2fe7eead31-7d29ed13a45mr743172137.27.1793923167308;
        Thu, 05 Nov 2026 15:59:27 -0800 (PST)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc650fc3dsm176157e0c.15.2026.11.05.15.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:59:25 -0800 (PST)
Message-ID: <310aec2d-3a83-4544-870a-ccd5abd78f48@gmail.com>
Date: Thu, 5 Nov 2026 18:59:03 -0500
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
Subject: Re: MAP_FIXED leaving holes on failure is very difficult to recover
 from and can even be a security hole
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Bert Karwatzki <spasswolf@web.de>,
 Jiri Olsa <olsajiri@gmail.com>, Kees Cook <kees@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Paul Moore <paul@paul-moore.com>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>
References: <8b45a161-101f-4f28-9b7a-c7c8b8a29f90@gmail.com>
 <auyXeApQlV_CMQDm@gremlin>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <auyXeApQlV_CMQDm@gremlin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------v3Fk1rd1TVAVxiYTaToqVCZE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------v3Fk1rd1TVAVxiYTaToqVCZE
Content-Type: multipart/mixed; boundary="------------83icaf8RpTmC0OcPxXVMnRa7";
 protected-headers="v1"; hp="clear"
Message-ID: <310aec2d-3a83-4544-870a-ccd5abd78f48@gmail.com>
Date: Thu, 5 Nov 2026 18:59:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MAP_FIXED leaving holes on failure is very difficult to recover
 from and can even be a security hole
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Bert Karwatzki <spasswolf@web.de>,
 Jiri Olsa <olsajiri@gmail.com>, Kees Cook <kees@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Paul Moore <paul@paul-moore.com>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>
References: <8b45a161-101f-4f28-9b7a-c7c8b8a29f90@gmail.com>
 <auyXeApQlV_CMQDm@gremlin>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49yB+l2nipd
 aq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYfbWpr/si88QKgyGSV
 Z7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/UorR+FaSuVwT7rqzGrTlscnT
 DlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7MMPCJwI8JpPlBedRpe9tfVyfu3euTPLPx
 wcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9Hzx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR
 6h3nBc3eyuZ+q62HS1pJ5EvUT1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl
 5FMWo8TCniHynNXsBtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2
 Bkg1b//r6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
 9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nSm9BBff0N
 m0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQABzTxEZW1pIE1hcmll
 IE9iZW5vdXIgKGxvdmVyIG9mIGNvZGluZykgPGRlbWlvYmVub3VyQGdtYWlsLmNvbT7CwXgE
 EwECACIFAlp+A0oCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJELKItV//nCLBhr8Q
 AK/xrb4wyi71xII2hkFBpT59ObLN+32FQT7R3lbZRjVFjc6yMUjOb1H/hJVxx+yo5gsSj5LS
 9AwggioUSrcUKldfA/PKKai2mzTlUDxTcF3vKx6iMXKA6AqwAw4B57ZEJoMM6egm57TV19kz
 PMc879NV2nc6+elaKl+/kbVeD3qvBuEwsTe2Do3HAAdrfUG/j9erwIk6gha/Hp9yZlCnPTX+
 VK+xifQqt8RtMqS5R/S8z0msJMI/ajNU03kFjOpqrYziv6OZLJ5cuKb3bZU5aoaRQRDzkFIR
 6aqtFLTohTo20QywXwRa39uFaOT/0YMpNyel0kdOszFOykTEGI2u+kja35g9TkH90kkBTG+a
 EWttIht0Hy6YFmwjcAxisSakBuHnHuMSOiyRQLu43ej2+mDWgItLZ48Mu0C3IG1seeQDjEYP
 tqvyZ6bGkf2Vj+L6wLoLLIhRZxQOedqArIk/Sb2SzQYuxN44IDRt+3ZcDqsPppoKcxSyd1Ny
 2tpvjYJXlfKmOYLhTWs8nwlAlSHX/c/jz/ywwf7eSvGknToo1Y0VpRtoxMaKW1nvH0OeCSVJ
 itfRP7YbiRVc2aNqWPCSgtqHAuVraBRbAFLKh9d2rKFB3BmynTUpc1BQLJP8+D5oNyb8Ts4x
 Xd3iV/uD8JLGJfYZIR7oGWFLP4uZ3tkneDfYzsFNBFp+A0oBEAC9ynZI9LU+uJkMeEJeJyQ/
 8VFkCJQPQZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd8xD57ue0eB47bcJv
 VqGlObI2DEG8TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPpI4gfUbVEIEQuqdqQyO4GAe+M
 kD0Hy5JH/0qgFmbaSegNTdQg5iqYjRZ3ttiswalql1/iSyv1WYeC1OAs+2BLOAT2NEggSiVO
 txEfgewsQtCWi8H1SoirakIfo45Hz0tk/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJ
 riwoaRIS8N2C8/nEM53jb1sH0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcN
 fRAIUrNlatj9TxwivQrKnC9aIFFHEy/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6
 dCxN0GNAORIVVFxjx9Vn7OqYPgwiofZ6SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfA
 rnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li/8oeYDAqrsnrOjb+WvGhCykJk4urBog2LNtcyCj
 kTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlpX2nI9no/ugPrrTVoVZAgrrnNz0iZG2DVx46
 x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKAhsMAAoJELKItV//nCLBwNIP/AiIHE8b
 oIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwjjVVE2V3iEzxMHbgyTCGA67+Bo/d5aQGj
 gn0TPtsGzelyQHipaUzEyrsceUGWYoKXYyVWKEfyh0cDfnd9diAm3VeNqchtcMpoehETH8fr
 RHnJdBcjf112PzQSdKC6kqU0Q196c4Vp5HDOQfNiDnTf7gZSj0BraHOByy9LEDCLhQiCmr+2
 E0rW4tBtDAn2HkT9uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8ecU2q50zgHWPdHM
 OBvy3EhzfAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbOJP2G/q1wT1o
 Gkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVssZ/rYZ9+5
 1yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aWemLLszcYz/u3XnbO
 vUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPthZlDnTnOT+C+OTsh8+m5tos8
 HQjaPM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <auyXeApQlV_CMQDm@gremlin>

--------------83icaf8RpTmC0OcPxXVMnRa7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/5/26 10:11, Lorenzo Stoakes (ARM) wrote:
> [ please check kernel mails in MAINTAINERS - my and Liam's at least wer=
e
>   incorrect, which makes it easy to miss. Fixed those up. ]

I thought I did that, but obviously I didn't do it properly.

> Thanks for the report.
>=20
> In general linux system calls do not guarantee compound operation
> atomicity, and any assumption based on that is incorrect. If you see an=

> error - the operation failed, perhaps partially.
>=20
> Further, a failed MAP_FIXED leaving gaps was the case for most of the> =
history of linux. Avoiding that is infeasible.
>=20
> I advise you to review the NOTES section
> https://man7.org/linux/man-pages/man2/mmap.2.html on MAP_FIXED - your
> suggested use of it is not recommended.

Does that mean that MAP_FIXED should be deprecated?  It seems that the
safe use-cases can all use MAP_FIXED_NOREPLACE, and that the use-cases
that cannot be served by MAP_FIXED_NOREPLACE cannot be served by current
Linux.

Specifically, if a MAP_FIXED mmap() fails,  the mapping might either
still be there (in which case one _must_ call munmap() to cleanup)
or it might not be there (in which case one _must not_ call munmap()).
There's no race-free way to tell which is the case.  This means that
MAP_FIXED is unusable in multithreaded programs, unless one is okay
with leaking address space.

Are there cases, such as anonymous mappings, that cannot leave holes?
I believe there are some programs that depend on this to handle
SIGBUS faults from truncated mapped files.  If even that can leave
a hole, the only thread-safe alternative would be longjmp() out of
the SIGBUS handler.

An alternative behavior would be to unmap the pages, but keep the
address space reserved, as if the mapping was a PROT_NONE anonymous one.
That would avoid the "it may or may not have been freed" situation,
as it would be safe to retry the mapping or call munmap().
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------83icaf8RpTmC0OcPxXVMnRa7--

--------------v3Fk1rd1TVAVxiYTaToqVCZE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmrtGFYACgkQszaHOrMp
8lP62Q/7BcuZTzNzDjqSulu1PZ3/tUbs2jPgRtVT5LhsEf2oiGxL2EdiAWkv3BjC
H+8rqHEku3aP58uLRffqPi9kZY9Xa+V8OfD65coQFYoAjjNwUw9FunF3xlkz16Qb
uo4J0RpFHdJ28SIJI3soCLpyIblsRrsVngml34smiRZ45cpiN7E2D0w3/gxe5hkm
WCkZTlLEzIwTVHNp9ersihO/42l9fgwCoTg0mYhwRb6cBtQVe/dnzX43GuSbXXb6
nXmS3olDR2vkdIejl6WHwLgspT4nRcZMotr27kspanPKfy9CXF/bvNjyTdIbnmcO
duL3/Giw+FiFDWo3NreNgcviFYA0xwitOvyzUhkab+Hc0V6H8ihx1C59E8+cUPgu
juZZg+Vm90eCIx7UkSvIEVEsXi1wcnLBvAJiLOT8Io2kqQOs4RaelRkTRosawY8u
SVzdnkSpHNcd9bQ/KTKRZ6LaT1//M8TO9zIQj0RW3v67J4nApgEh02LK+zQSO9z7
BnryJdGTann2cQkth8VNyTLYN2VCo5UW8gYh1fvQFjU0Cp3aP87tKxwRC59Et+kq
LEaNGRSNYAb65WN6s+SYq/+OxAA60qB68jTIHMbfYbL8mXmlEf+lPctmihxE96YG
vOIZB3vR6DsPbjyl/ZlPhQptzUt6nwuMMTmX85RgNSHwICvq3To=
=aUcF
-----END PGP SIGNATURE-----

--------------v3Fk1rd1TVAVxiYTaToqVCZE--
