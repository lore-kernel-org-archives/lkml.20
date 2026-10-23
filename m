Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792714937;
	b=Vztya87+06vj8qNK1GUhajHG9tyTIOrCBStqCa5Qpqxviz+rI7VJ5lPGbfg1zZBzkzk/
	 CQ3i+MwATGOgW1vOTtcE3IM7tOyMiFAbPwi0wwcSHQ5mM6ZJJ4rHIvPSjIzSCOxsGwnQ4
	 U7R3rgP2EWY5OtAVh/vDNK+cdEb0UCW5DMZKkvaqVnM5WAysiwdrkvOiSem2ZFCY8BFyk
	 hbHaaroOe6n79A2h5uVRkD6QAzyZ+0KiUzxGR8rYFRgC2qak/rDCP66kolVXg9SEVM8Ge
	 LaMUOw55ttWITGr7CmYquvirvZmLzw//E06fykxbtbZxeuoQR6yzJICNLP+NHHbf8fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VkjwhNqrhec49sZYnWQitZbiXMreHiWthFexlaEi7O8=;
	b=eTvlryQkfsPqbcB/bhSQArQciE3BTL6cfS9ItINB8oEffGsUiXwFsBhxArp1+bmzsGDd
	 0V22widnZvbanC9po6Ff0tS3uMrVBUH/lr5ZcRQBBccHrju3gUbowFM4axJ3SxbDLLbf4
	 9CIZblo3uNrWaGw5+ZgLn+tAY/5pa3n03ZtYOAv8Eo1pcsC6VjmaVMGXhgu7jBv9n5EDK
	 bS9hjPjf5VtRCD0hlevUaoVLV+JbfrkW9ZuO7zGyEMxiPSh7YOqKqg8u43eto1dRyzLzu
	 Jodrcn7fx04DMsaveVP8W7wlbfSwg7l9pYSUsAqmryXHnF3vNfN/cLdKVLO6iB6HotQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="a2Q/QNEP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020FE606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 020FE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a2Q/QNEP
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-675617e81f9so406274d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792714936; cv=none;
        d=google.com; s=arc-20260327;
        b=Us8GFPHhkQFQZ37UJSw7VP2Wu7LcnTEfCj9jtX9Mw+DbmzPFA8d+fmIoVF06IVqwsZ
         UGqcymdd8G91Ors1hdyUEfVum2W6pUZNeA+APsDivYZBmWUlLqbezM7fYKvNNEVVIjtx
         vR0EhWH5qVaSKUsSk7chkc2l4tr5JnGebdQ45B3O1wQKb4C0tXNsnxLgkXWX5khC7E4b
         DrAqFy1+QMbfiiCWO6ttO+oOvjOJTSMky6LgBXhvL5nU8ZTKovR+lPogE7wk8mNWzheh
         9ivEYn8m7b6gtyBpZiwmEfl2KAH2giT9weHHZ6UA8WAx8fcnQGt7mjaAtRLtMJFTjhpI
         Ck/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VkjwhNqrhec49sZYnWQitZbiXMreHiWthFexlaEi7O8=;
        fh=O1plbj3ODbP3q9YeF8+bcN7Qe1lNwYhvbOt7d1j5UTw=;
        b=DtHKfYix4nFox6MQbZOzwS8edDOAwLpMh++xEtM4UgV8cvnp1ygseHVZMkvlw//NtB
         rnIqAYU1cONZfIMGdvECLprH6Xlh973lUas4XkbnUkfv4ixuB/JP6+sLU8JH43ZHifpC
         UjodywDDyY3MbNQxsrLY13PEuTniydNv8puCMutL7dt/K1Iq0rovpdX9uOoNDpNTnx7x
         ipIluqa4AY8NQEqvVPrYhiOHrvjYOxAUNRS5bG0sBkefPpXiYViwKnC/1Gn43tQlljoq
         +PSxEYyPR3RoaBVv8mTogW61JAe8zzSqnP/r0Vo9IzaFezS4irsKkVdh1secfNQAUSTK
         t9fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792714936; x=1793319736; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkjwhNqrhec49sZYnWQitZbiXMreHiWthFexlaEi7O8=;
        b=a2Q/QNEPVSrvDNMXrTz8Ym23NxEk5ci1YdoOZqJzDzRlxCCmeMlhVNZT4k+TgGJjE4
         drbaoS7zagqDU8UariXTlHj0GwZm+Ix7NJoHVb5bC54biwZ8vrn5PjKaQNROo+tN5Fno
         c9D4fuyN7aB1HaRqWCNnUIdt6GMTfMS/0rK4BtEKy2oD56Dmk7yMYmjUrGTn4tGidIWx
         Jyj+39h1jXivxlrMnrAUmTUshE6yr9am6JQgZIWIUdXYwuTJRr21mGTv9ftcV7z1DKxL
         g6RZh85aj9lldhFoYVzEMZzUfNSMhSNHehbLqTSV/CDpZZRExRtfjju1hgSb6RML+lEv
         tgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714936; x=1793319736;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VkjwhNqrhec49sZYnWQitZbiXMreHiWthFexlaEi7O8=;
        b=YROVipEOshpXmUH9DwNQYLh2wylptp7e+r5gbutRMk+SyzcTmE8eluncm0GWs4YBLV
         qSZBfoJZfUZznvijoUsvDGe6BG/oWLfgL+/XnLn+q20FKGlPcuTPhkH/E+b2a/PG9E6z
         Rqfhf6mqVvmMytp3EbEIrCS7nacAJ3OAJZ/4uySZdXctiz0kYZERTS9irIqzTcZ3Yo9S
         0izEWzGgbS9l2PlxBy44+bsyZIWQ9a1re1vzSss+o6Z/mHY+HaA+NOLE06T/PpSw++ol
         WvNVdF77pj6Ev4kqIkIxy8R0G7yUC78vkCQr5hOYho62Cj7Ug7oBNesc+vHBVmbDryBI
         iKmQ==
X-Forwarded-Encrypted: i=1; AKwUvByarlSn/6OWOxlUmJ/E0VJqYMxt4OsJJayglbWacUvMOxnYUD2JTKLVniPKMpwMMjwxmzrJkXMZzp6pm1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4pPDj7gYC8j67NLks04q8maDKVKt562/E2p43R1Hj/wnpbDed
	YVvcwVyTNIigdc9o/99xaBuZnfhYflRWlaZRyzL2K2hpGaEKWT8x0HYA7SIoHWVQW2jpaFsl1dK
	0+cyqSEnq3ZhvXe3gZkHK7OtymKrLmedGqOfm
X-Gm-Gg: AYBFou2RWd23oieCeZyOzIBefWFE6K+6crZlAc0S/Nm6QWOcXnhQwREbMFDbqsRZEAg
	nnlNK6rqGRIBT/76FLfUk9McjILsBnT5788nPLu5vSWutTJVVm+6dDQQmLLSDaExWNQXKsLm6Vj
	EFT/FHepT/ug3THCuUTRNHUpLL17syzML1Q5gd4ra6kfTBc87MxDFg1foQd8yLt23Sf/lSFRYMe
	fFbKbTdqZM+QXZ1t8gvo9Dyb3znWrX/DJEvcgZUKdGOQb1QZ9DjqktOh6bLLsgSci+tB4i0rGWN
	BuoAGHzY51RQQTi1tbw9bQ+CAVsX7oqsZ7vUwyfPkJ2zXHJpGp0hrTuK13SpsVOrJECOq8NAGAe
	HRIbUbEx4qxmAOuTuBj0DZEiXrpXhmUCB/j0iArNzt03lHSPFNHtdAE2pbICMcl6hG6klkeHKs0
	RzMeHY8W1nVKUFrshcRw9XCAhiXsqJO5tp3ew5J2LJ4jGO7yUCEamEmdpckReT/gOvH/DdaCKY3
	W4TI8XcPwjCM9hVIEeTGou8c5BHVH1YxRgMn9EWxQXyzB84BEC4ATaNP8e0
X-Received: by 2002:a05:690e:1507:b0:679:97d1:4378 with SMTP id
 956f58d0204a3-67a35bfb62fmr416506d50.51.1792714936009; Thu, 22 Oct 2026
 17:22:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021000338.2160223-1-miro.kropacek@gmail.com>
 <20261021022336.2232886-1-miro.kropacek@gmail.com> <c77944ee-f170-ce57-9065-d7d49fcfed6e@gmail.com>
 <CAMuHMdXWHXjbCNojoukGq4OWvLSibk-goJo4quLdbOj01neOew@mail.gmail.com> <atqTLxkEusWSS-wf@google.com>
In-Reply-To: <atqTLxkEusWSS-wf@google.com>
From: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Date: Fri, 23 Oct 2026 10:21:59 +1000
X-Gm-Features: AclHuK-Y6Dnm1r5HCn5OEPDjtqeZI8Ly1qy0RvG-aD-4oneVDHT_0R61QzLB_0k
Message-ID: <CAN5rfbQWDTXZVyh8fDjxqRVO_HEKvWLC7Q_i-7aTtSxi9sWuSg@mail.gmail.com>
Subject: Re: [PATCH v5] m68k: Fix atari mouse movement
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, 
	linux-m68k@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Fri, 23 Oct 2026 at 08:51, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> Could you please re-post v1? Can't seem to find it.

v1 went to linux-m68k only, without linux-input:
https://lore.kernel.org/linux-m68k/20260814031745.17140-2-schmitzmic@gmail.com/

It touched only atarimouse.c, keeping char * and casting the two
deltas to s8. v5 is the same two casts with u8 instead of char. The u8
can't stay in input alone though: a char * hook doesn't accept a u8 *
handler (-Werror=incompatible-pointer-types), so the arch side has to
follow.

-- 
http://mikro.atari.org
