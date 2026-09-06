Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B343438B5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 06:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788677170; cv=none; b=VQ0JSfE8zJJF5m3KQtMjaCEYyXa4Udhskrsc0Lt3715zbxi3g01/r1lkwfVq+u3mn4pDKAWf2mRgAZvhLS4C9QFrwiuCF0G86BIca00ak3/isPbjKTgghkGVyVXvxxDrUDFdXJsM0RfTB6/yXhY0l11f0U/Ejk4lkSnxLl44Y7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788677170; c=relaxed/simple;
	bh=sIlOoPDk5igeV9GNzkGYTdKPuLFWWhg7AMG8ajh5Tn8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=KMOiW1H+0AT6YqeKeObnGFDnqhLQCX0d+ohCTSFxNDiNCTJM54q3gQFl+9qHfAdLPTf0KIJ3ZwqJnmiXPcjSWw5FhJR8VMtywafbcnlwYw3OFjY/Y6FPTP106iQnn/3rJ6ivykquqvO99AIXR1D5EzWoWwTTHbZoXgr5Bv8to+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8TRf9j1; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8TRf9j1"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9399e925e0aso47215885a.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 23:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788677168; x=1789281968; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3SKBAIjm/G1mUF16pDnpb3A8NBOTGrYWEeA499nT6IA=;
        b=m8TRf9j17pvqWR+aEZVK7ZqJIcI9Mv0MDSMaw65MSbYx2IEd2KIvF2k7JP8kEP5pdS
         gmakLGmQEd4VMZI3SKxKNmt7BzFd373dy/jwWzbNu1da9xIaGvamCnXYkvq+v3nucNHG
         YaJvoEBR80L7dINgLgBvKN/rk1aosqsdrwng2Qt3bG/PeVGxZd4cHB7v6ZGAel/Q3cEz
         rd+q7DIKB8DeET0Lbg9Saqc5UbGGzaczbK4gkT0onySO9Xd79xi2Qz4Iv3/9m44XT0FP
         H0bIW+BtwJ5drCwrDsEecWiEFiBBr6VN9hk9rbe8fsWUsPcNq4Pc7A8TmYhlcTCLLuc6
         nIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788677168; x=1789281968;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SKBAIjm/G1mUF16pDnpb3A8NBOTGrYWEeA499nT6IA=;
        b=j5SoVDzDGwh0dYiiTwG4P2bANmYbUwEPdZNnGTinnACvqwt8NGAC/egE7s9NJAkckt
         JuTpzX3w0svp23V/kBb4H2QJYXme1iBDiiSlPfiFT/B7VdFc2MKDSMnB5P/8WK9SLsHd
         Bkvdj4M/nj8b0H900cH8Xl1VIAFfI5Q7TORpbVtqZe0sBcLdiDuD8K3HgMQ6SFgoNRTh
         kofAxePkCHpxmF9G/8f3ILXLRhj+zR1UTH3i/Ib6fQlL12r3X1EwITq5C6r+H1yIn49R
         DNE137uiGbGC+zH6i9PQ15ezBN0dbHmZ7tKIJsZWQuEJZIRHYLzWBONeRlDMCI2DtdRa
         YRxA==
X-Forwarded-Encrypted: i=1; AKwUvBxsOMzwPYWcGSmvOLcgZpz8wL4kpuEtiqXHq1+EAk8pTpKLnjtNk3DKTvxe4FDj+BflqRfzOFuR3AkPZ3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ6KgM9eDZsmUuaGHYveo/NKW6dXjTvvXF48HRpfu/MbVZuKgZ
	jN81NACLhw+sRr/4/xiubPMUSZKboYkgleVEmglLNA+mb9U/zkM2vc/5
X-Gm-Gg: AYBFou1syibpS1zYCyojj6uSGCP52+ueUikoSFv7lqePthpuCOiKYah34v5IP4bPZh9
	8j4B8HQ+rEhTVfeHX5yqVBVap2Htq3OLuP59hhnhyjnKs1DXWA/14+DkpqrwWo4vePrmhWGNKxt
	3I70hVXi6GQlVBLi4WuEK0uoKzxkPJcuTpeQGs90qyLJzgrVHgA8wpjk6bOkiZi5Q8SXfWXVfQW
	+SRMQ+2Fdp1fTa/Hyo5T+XymbIkYufAI7VgsbJk68RoVCEr3PckWaGQ+oJJskKOnOlq2KaCRBbm
	4bbYYlxUHRrl8P99ZZyNWMlYzBj9zQA9r2FqNYv2WHvbRdcuNRog7JOQ1K7liRHLS4Y/407IMpc
	AKZ3joeMnVYKaoPtvNELbIFIcP993M44QdI47iUUKj0t94g2KhQrsBZPW/a0PYe/W5ilXZe6iQ2
	HxKWNfq4Z1u9WovgrcOKNKHEvU+xI1gF1e1rdEqSLJzQLdC9p6ETzALY8JCmJ5xuL0uF+TlTv9n
	a9YbrzAf0c=
X-Received: by 2002:a05:620a:4450:b0:939:4a44:5f99 with SMTP id af79cd13be357-93980324b44mr1510113985a.10.1788677167677;
        Sat, 05 Sep 2026 23:46:07 -0700 (PDT)
Received: from smtpclient.apple ([2601:152:4d00:6110:4590:6205:75b9:b340])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9399cf10c7dsm174331885a.15.2026.09.05.23.46.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Sep 2026 23:46:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.15\))
Subject: Re: [PATCH] m68k: coldfire: fix typo "reseting" in comment
From: Josh Juran <jjuran@gmail.com>
In-Reply-To: <e038c283a0ee7a3932f3e3bfaed188280ff7188f.camel@physik.fu-berlin.de>
Date: Sun, 6 Sep 2026 02:46:04 -0400
Cc: Hemanth Selam <hemanth.selam@gmail.com>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C901AA86-8D21-4E1E-A2E5-A6D99CDBD705@gmail.com>
References: <20260904112336.38497-1-hemanth.selam@gmail.com>
 <9051ED9E-9257-41E8-B979-DB7716F516CC@gmail.com>
 <e038c283a0ee7a3932f3e3bfaed188280ff7188f.camel@physik.fu-berlin.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Mailer: Apple Mail (2.3654.120.0.1.15)

On Sep 6, 2026, at 2:43 AM, John Paul Adrian Glaubitz =
<glaubitz@physik.fu-berlin.de> wrote:

> On Sun, 2026-09-06 at 02:40 -0400, Josh Juran wrote:
>> On Sep 4, 2026, at 7:23 AM, Hemanth Selam <hemanth.selam@gmail.com> =
wrote:
>>=20
>>> Correct "reseting" to "resetting", reported by scripts/checkpatch.pl =
using
>>> the misspelling list in scripts/spelling.txt.  Only touches =
comments, no
>>> code changes.
>>>=20
>>> Assisted-by: Cursor:claude-opus-5
>>> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
>>>=20
>>> - *	There are 2 common methods amongst the ColdFure parts for =
reseting
>>> + *	There are 2 common methods amongst the ColdFure parts for =
resetting
>>=20
>> Is there a reason to leave =E2=80=9CColdFure=E2=80=9D as is?
>=20
> The AI assistant probably never heard about ColdFire, so it assumed =
the spelling
> is correct ;-).

What about the human reviewing its output?  Or am I misunderstanding the =
meaning of "Signed-off-by=E2=80=9D?

Josh

