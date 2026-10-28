Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.217.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793199834;
	b=mRK1Ck5vgKQ6gBzvctQCWyWL8ixC2xCYJGN5QJ/I1yUHYVfE8E7U6mXU8EiAnwBv6uMp
	 8MH6m1lVXXbDiwQhoYESXA7CIT/V8s5PEzXCrOemPbYrlf4fMY1kgdPGM3d3HfiaehwfT
	 i+rDnja8FHvUcmiiELXPdbBMC4wIZv8XAXx7mIFohzc12Bp0eVchJZnNZ+fb+2edVOYqf
	 sxxJNxN/Yud2df5fhMB4BOIjA64Ni3TFci/gOfuzyQxnc26EpEIlpB4CX5Z/rXfdijbER
	 KoHkl+fGh0FY/puXORONQ4jElMvV6Of8zM5njknoA8GCtXWWMJWzdoETmDHWykBqalw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=awGn2E34n5xBoC2fXIOuNMr+45oeRxGM6R0LvPLWK+U=;
	b=N6pEccZ6WbpBFpwqSGHRyWyLYjy0hK3Pcu1lQZn9pXVEPh8BtCqctzv0dYOmNmiXnCud
	 f64YTZvIb/SG6fBdzbRyyks0obQT4D6At9c5p/mdIT2pl7WOmVBvPz0wJxgp5v2JSZEW+
	 mCmCDIp7Of98fz1ccUNT/Owj3nBRNN/PuMKaedHWTgqt75uk8Ffu3rBF1iYC+6WvjFAMc
	 wwYOmAzdYVb95L/B6wfVNZGZrQyCJZEdTVlStY49thNpuQffaXanc2hIQPaV6w9qTc3sB
	 L5uwhbAi9fqf296TJBmNezr+5Kso4RsWbK7gl+e07/RZBKh92FSwdc2SfxhlLyM/l/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkYI916C;
	arc=fail smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DB3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3DB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkYI916C
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso654632137.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793199833; cv=none;
        d=google.com; s=arc-20260327;
        b=ZeGD3TaeDlUd4Mfdg85msuwmf4Fj2RWDKwhXvAVE5Si+/z3NvJHtyOc9k+CUDyPAiV
         PZ7tlWURBNCptrKeukXlnnjmqFTd/BJfdz65orbp2nKrB8SZD9Q93Jng+16usB4CH/Qp
         PimGMsywdqMhfXf6ZcsdqmNpYAfFaljcaWubCKIAthU2TSXR3EGRuyIJWSXTeLSiocMP
         DEwmULMdYp1VZyowqmqFeE0C8Dyp3tPg9u4UOeX1C6ei9MgLSJ4yhTzoecliwg7g4XvT
         2Tl/6j+aeiBLyrkWA2EfShYBzmMt4fnx8i8q/Go1UkEEGWvT6QT48O1TtVAURk5jNO6e
         UuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=awGn2E34n5xBoC2fXIOuNMr+45oeRxGM6R0LvPLWK+U=;
        fh=0tP7HjgAIN7VByCaKfxcmxgmbcd7n8tSCrOTGmLxl68=;
        b=qTmH+/xj7Y/4O2PJd4O7koUuGg4vz/V9LHm5F/oSEHzlu3FtMkRnHZavMtSsAlKkkZ
         +ENgqkF+XB/n7NzPKg9QHxwyLGiOrvlLtZqTZBP5gf9XrPT+d0Xg5E0s88rhh4G9Utql
         lyE0/TTJ18uyQqlUjFNbklv5jI7/OcKp72yk5jIRrJnlSRQ/xTJlr67C0ktbyywiqJha
         w5osY70gVvZ5a5FHXOarAOkkeowUAS2Qhfbizg6QtB7EM4KYDDFcDVggTdSQ+wYfrOjC
         keiHKMLgAWlTOADe4gzGrgPBePO/0I3sw/9Te2yShhlu3Y2sweO92hEO9QJk49nmCxPr
         BlHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793199833; x=1793804633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=awGn2E34n5xBoC2fXIOuNMr+45oeRxGM6R0LvPLWK+U=;
        b=EkYI916CHi0fFZPKq292wFAojURC9kUkHh3E1HebbsISBU7zAaxiLCNI24BRX3vVTY
         CYpvCFCHIXWLXGdmnExv+ndV1HAqmdnCtG3d9VLbyhcRzIMoYglufAxq8VNzXnJ1YjQx
         Lf0Mw7IO3eCMsrMq24ws6r1MLH6tvKT2/xoOcHZ/+1uTYUI2Z8edhmsbyAA+S/1t2UEv
         nlUzMBMPQn3WIo99fBLzpXFv7VcYIKDqTvlIuKliXZ9+8pVhIP2W8HFhFsJMA7TXK84y
         rteW56FlFqMmhtM3OfnGfe7nqIOua+WfefzyXDDw+T7Igy0mRVaDxricG7nYWbfz3yCT
         qwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199833; x=1793804633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awGn2E34n5xBoC2fXIOuNMr+45oeRxGM6R0LvPLWK+U=;
        b=2CmwIbUhKcLinXIVurB+vBHT+dWX3h7rG2CCYECZqjCxdu+LKuCv8qxrjZTvP+Gl3u
         72gM9G+xLXZuoP7c2YV68W2mM2F2f5FNpF6/VIsrB1DSdurwQjaOpvVf3DncqycMnrhn
         s8RPudbq6+bWrleZgVnCXN/g6dbSCAWXjp/YEEughQ51jWun09/DmyaywOf72XWLzTkh
         0Y/Naq4+r4H4L4MxFaITozt4zV8lsrr3Stib9n+q30I1P59J+v4nSJsndRevmLkQlv/T
         MEnFNBjwbVoQ9I6mOg6sVZthORe+3M7Gb8wCdZPWYmJRBklAeeBAZjRQceSdzOIsaIVj
         f7Xg==
X-Forwarded-Encrypted: i=1; AKwUvBx2WebKVpJMPgwgv+Iysnu5730u/cmccCSjVwJd27dknCkssYDgnqtKBo8u5LDfMcK2DmZL0CSzQYDovdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1kZ+BZIpSodB9nNBCUhvl6q6S/NgUfo/SpBdVVPkclQ5YZGHl
	//tOQyYY1prRhrrZOfS6kiXTgugyZJ3Y6G7/hxeIMtgpAJUb68IvwxY0wDDk4wRR8g263rVVQf/
	IGdfGifIZamJfMSHfQpV5guF7L5mRBzFzRp8j
X-Gm-Gg: AYBFou3QE95FeCvCLIhHMnS0Ijd5brdLttCQxlc/UgnGUWVrMUqO+w06WR3RhpDS9la
	HTldazZz6iHqc1xRK562LcoIDV51TM/p00jownJvjLcVfKa7hbh6WeIEVcr0l5f0Ildb4RyJuTn
	vhaWwARBI3XhTRsDesFnCKadZ3dAfWDpLEmWuH3zUWjqJrYIi3ZT+VffvEND+8NvAbCj9teQLB9
	i+kBJQtXS+w+OhG7lzIeeWYxdP9jsTmfjbBYrXEGawbp8x2aaO0avo54Abs3FcDmx7D9dGFD9ya
	dxlyh0Olqz2NXQ0OkEIoezSlSIEusUMwU4u/atjUDuWDZpgAvTobxHknKxERMhdt+2KH9n0raL/
	WRqeqhrs1nMbQNfh2PXcIvnlYccrxDto6fLq16C62RBTEjx8nD2dBjkHPygf55WjvKNLyrqlZpM
	xUHUOlu4aTbF32PXiLb0rXpcNIOwUYyA==
X-Received: by 2002:a05:6102:448f:b0:7cb:bb33:8413 with SMTP id
 ada2fe7eead31-7d03a417ec3mr1297169137.9.1793199832560; Wed, 28 Oct 2026
 08:03:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028041253.74839-3-lizhe.67@bytedance.com>
In-Reply-To: <20261028041253.74839-3-lizhe.67@bytedance.com>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Wed, 28 Oct 2026 11:03:40 -0400
X-Gm-Features: AclHuK_0y881Zt-9WzkHkMimi_VBCkr1qyy4N5JRQ7yKOQQhsOVN3bLe2ggK2js
Message-ID: <CAN+CAwPM=-sRDypP0+ZxX8_CziBRjXbxKEE3UZGLzkmOWrajNg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] sched/numa: do not feed tiering promotions into
 task placement stats
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, bsegall@google.com, david@kernel.org, 
	dietmar.eggemann@arm.com, gourry@gourry.net, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, ljs@kernel.org, mgorman@suse.de, mingo@redhat.com, 
	peterz@infradead.org, riel@redhat.com, rostedt@goodmis.org, 
	vincent.guittot@linaro.org, vschneid@redhat.com, ziy@nvidia.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:14=E2=80=AFAM Li Zhe <lizhe.67@bytedance.com> wr=
ote:
>
> NUMA balancing has separate mode bits for normal task placement and
> memory tiering. In memory-tiering-only mode, NUMA hinting faults on
> slow-tier pages are used to detect hot pages and promote them to a top
> tier. They are not normal task-placement faults.
>
> For slow-tier folios, memory tiering reuses the folio last-cpupid field
> to store access-time metadata. numa_migrate_check() therefore cannot
> return a real cpupid for those faults. Before this change, it returned th=
e
> same all-ones last_cpupid value that normal AutoNUMA uses for a first or
> unknown access.
>
> That can make a memory-tiering-only promotion look like an ordinary first
> private AutoNUMA fault. After a successful promotion, do_numa_page()
> reports the target top-tier node to task_numa_fault(), so the existing
> slow-node skip no longer applies. task_numa_fault() then accounts the
> fault in p->numa_faults and p->numa_faults_locality, and
> task_numa_placement() can consume that sample to update normal task
> placement state even though normal NUMA balancing is disabled. In other
> words, hot-page promotion feedback can leak into the CPU placement
> heuristic.

Hi Zhe,

Thanks for the revision. To me, this looks more like a fix than an
optimization, since there really is incorrect NUMA balancing behavior
happening that could be visible in userspace (unintended
task-placement and related accounting). On the other hand patch 3/3
doesn't seem like a fix to me despite the name, since this one would
mitigate the incorrect behavior.

How about we pull this one out of the series and submit it
independently with an appropriate Fixes: tag and cc:stable, and
discuss 1 and 3 later on? Unfortunately this is also not a great time
to submit new features or behaviors as we are in the middle of a large
merge window, and there are a bunch of fixes that maintainers might be
busy looking into : -(

Regardless, thank you for the fix, Zhe! I don't have a strong
preference on the ordering of this against pghot, but if other folks
are concerned that this could create more churn, I think it would be
reasonable to wait for patches 1 and 3 after we discuss with Bharata.

I hope you have a great day : -)
Joshua
