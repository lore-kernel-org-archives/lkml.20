Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2753FF1AD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087738; cv=pass; b=sZdBSeBqt6S/CRaO0QkuWhSxHyEA7MpEV1VhhakAsUMwnMT1oBFCW2LBnHsPiAX8A3tYdxTbaDjmc6QPUzhgiMwVpj3C4CY3qTPS8+vE7GjHz4rVIkEb31s8j0ggrw1c7QpKCqu2KYa5lBM8iONtyslomm7xQONRfHrrSO1Ybf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087738; c=relaxed/simple;
	bh=hDy94WcuIGtpKVjdK7YmV9Ul+yIgKHdRmumOIolOZmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7183s2/faKn/0ZaM/QJ5hhO3MRWduwQJ+xNXZg8yYZdTFIDLlwPFCjj7jE5mmDceABs7zPxb6G5UOnd+N4tRd8mQwPvB9vZSvKg7JlM6FYdZYeL2BTzHX297t2c9asQINyDQZSQ7ZGCNU5lOJ9pHqSBEW1Th8BYQ1vjC6RhItA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/fsGBtt; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/fsGBtt"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-785686d2112so1214877137.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087736; cv=none;
        d=google.com; s=arc-20260327;
        b=lGOUuoWr6k093cVdLjEw/yzHJpVGgK8HNZydQZbNUNnwi5ZNMVznnOUsn/W31GkPeU
         2W37GEcWwLyf1VXmVNUauTflc4gItFCUKMjFjeLHy2aVQ2YlkfcA8cyCDpwh2d4MHSOl
         6Zi0PM/+K6tyiRXgFFNizHRNA91p5uChyftyYDyVYcFXwL7zAK7zQgTtt7bhIdIAcbeY
         6D00WefQOzatezf7Hm1yS4o9263BkMOTfgaj6u8mP2ghuqhLF61vrixlBKlPbRRQfY61
         84dxAVnVwAvtq6k0XL3THecnMNn830pLaguMRgS6Lq6zxE1KGOkTRT6kyXZ8+HPMzT1/
         G4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BkwKU/k96wk8bIA/BnamNqyLU1VqFIWHcsHLmQnVQJs=;
        fh=qBhejmLHOnfXfxPViN/pJ8Muyaod1csv3pyLpspMHDs=;
        b=WWMiqIvgbGxr293WeZJKS1n39HoiX3BIXnCGZcALD+/KnpjSh7N5Z+PEFI98PdZ6dt
         4+k0Gvl2LdySbD9NMDCaEvrN6PhGl+uGvVHGPLWR7HwkI9eCfkeZU8TfcWbVESBriSLP
         eINREdERHjQDwYJE+n+UB7hbeRKcmReHWt/odV5hWLdHpSmyTVgbfb9Aite0NRks5vfj
         jU9j6byG0KN6sKXUGaUlYdKNktYTRZSyRjNCaVQG+jx0wVU32tY4rjZUdUSnsQy+sUJA
         eME6ZFpynzwk8Q+2XcxNW4x5qTlAXgJWpzBV4oaEglJOA60WJXK0TxVRFfeQG1RBf80X
         bsIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087736; x=1790692536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkwKU/k96wk8bIA/BnamNqyLU1VqFIWHcsHLmQnVQJs=;
        b=r/fsGBttzfUURMeIkcaWuElVmA+ej+6IUFBSt+HoizMiZwJUFQ5mXbwPpuD8ApbPmC
         M7RLRRM8yDEbT7bVRYl02RI9tGams9LKArEpTZ7OsnsDkya5kQm8O4WdUdqCbzvdBOP2
         rPYHdRnOqM8qqCdOcUvr+q+2dejAEmqAsZC666I9cneHvERy6TuZKa+SXbIAlLso0xf+
         tbvOY2aKbHEz657qra93Wa2Q4p36om4CSQVlx6wzhBHa8i/Eq80xg9TU9dVIh0dslii5
         Ri9Mg+3c5ckL4ixqfx7eqa6mn58kHX24UEZm8nS4aydVzlSCaIwzGyqWGR2rxphhoaB4
         qnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087736; x=1790692536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkwKU/k96wk8bIA/BnamNqyLU1VqFIWHcsHLmQnVQJs=;
        b=PXrKZ+AwO++aUm2TRaqk9JhGWg+ZEVv/9LpqsgQIl0dMgN4MtlLTWZ2unFFdnrbbhX
         BjvWsMPu7CpotBbzjvv1E54bqltCiIdqvBa/1xWyF+kwVtnwaYm3pYxpIgPmD3MLsjU6
         i83Vk6Y+hYpisx2I5S+lqhu3w3VNWsizoQu1aOchphlpcYFuCIASj2vD8aXvo4HDRjUV
         q2ZK6RFsRwQxLL41GydW8CTQD/ekIBYEb0kdGgS7q50TnW5QDD+uRkdbW9okzVmBMLYu
         fkslvL8j+Mi3KzBrm6B3qGJjSP63oqwAhh+Teao+jsiQGi+du4kDPWoLZeKj0oQQy/Ny
         flTw==
X-Forwarded-Encrypted: i=1; AKwUvByheWlXG2cqqPYPLlqBQzcc+A9gU/5I9iuHG6brk49XkAtAFSptb3wccajZdmoiVagpy9t35T2aYWkn204=@vger.kernel.org
X-Gm-Message-State: AFuF++nxA43nb4O5N8DGwxzlrqZDJNRfy/OMsj1aD3bPr1cJIeuINdeJ
	H3Jf7ILEY60I7kxt3O2UZEP/MxiXKsRw0R0RfWOgwWe9RHZUNMqkhii5qUizYheL9vOm6DpNEQI
	riQtZwgTViLBX+yXn9GdnwSo5EsOFPI0K6EE8TwU=
X-Gm-Gg: AYBFou0eaqpEXybLQWl/vJ3CsOp5eas59VU7PhlF0yMTVUTYYftCRBSIG2Op5kakLK3
	QXtmGc4BZjIUQU0AQzRkluufJFpLBShaeZbkAOl5EeoWdZOAxULoOfgxHRTXA9rfI2+lIKw18bM
	CJE47RK2zmWGQ/ppMlv0eb9FT70XNkBhztR733qoo1rK1uTEtxLNWTV1x3QYJdj5OuUjayYlayO
	ZrzCfhrEqJyW6XujJU/bN+qTliOeYQqx1jtltPvbbwcp6M3kHWfG0MNyWrOqSRCtW4CbjSg6dcR
	sW23Vv+0TEa+zCxNTcMUAGbnQzuihTJpuCgqBcywZducX6IBWEvKVeWRZTy5U6SY9yJz36pmVft
	9l5rx1QlC/pT2OgU1H7OMAy+yDd7JscngjtGxpQsQ1J9ehDBqSYVqn84En9vn6FnGXmhjPg==
X-Received: by 2002:a05:6102:4bc9:b0:7a6:bc69:5a34 with SMTP id
 ada2fe7eead31-7a6bc695c4emr5597229137.22.1790087735769; Tue, 22 Sep 2026
 07:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922031247.182335-1-vinicius.m1821@gmail.com>
In-Reply-To: <20260922031247.182335-1-vinicius.m1821@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 22 Sep 2026 11:35:24 -0300
X-Gm-Features: AcwNN1V3Y0-bIN8uQK0ZGfTsLwYw3XWafCH-NgCxj5vT71QyY6kLcoyP6QRUQRU
Message-ID: <CAMAsx6d8B=QXh=CG-2bd3gv6mccPsXxHnhNJ3DT8CQZiVfQNWw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: translate threat-model.rst
To: vinihsr <vinicius.m1821@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 00:12:47AM -0300, vinihsr wrote:
> Translate threat-model.rst into Brazilian Portuguese,
> maintaining consistency with original formatting rules for v2.
> And add it to the pt_BR process documentation index.
>
> Assisted-by: LLM
>
> Signed-off-by: vinihsr <vinicius.m1821@gmail.com>

Hi Vini,

Thanks for the translation. The content is complete and faithful to the
original, and it applies cleanly on docs-next and builds without warnings.
There are a few things to fix before it can be merged, so please send a v3.

Patch format:

1. Please use your real name in the From: and Signed-off-by: lines.
   Documentation/process/submitting-patches.rst requires a known identity
   ("sorry, no anonymous contributions").

2. The blank line between Assisted-by: and Signed-off-by: makes git ignore
   the Assisted-by: tag, since only the last paragraph is parsed as
   trailers. Please keep all tags in a single block:

     Assisted-by: LLM
     Signed-off-by: Your Name <vinicius.m1821@gmail.com>

3. Please add the SPDX line at the top of the new file, as in the other
   pt_BR translations (checkpatch also warns about it):

     .. SPDX-License-Identifier: GPL-2.0

4. Notes about the version ("for v2") should not be in the commit message.
   Please add a changelog below the "---" line describing what changed
   since v1, and send the new version as a reply to the previous one
   (git send-email --in-reply-to=3D<message-id>).

Translation:

5. The index entry says "Modelos de amea=C3=A7as do kernel do Linux" (plura=
l),
   while the document title is "O modelo de amea=C3=A7as do kernel do Linux=
".
   Please use the singular in both.

6. "unix domain sockets" -> "UNIX domain sockets", as in the original.

7. "...de forma a permitir que m=C3=BAltiplos usu=C3=A1rios locais obtenham=
 [...] e,
   quando o hardware subjacente permitir, atribuir um n=C3=ADvel..."
   -> "atribuam", to agree with "obtenham".

8. "a=C3=A7=C3=B5es realizadas no namespace do usu=C3=A1rio" -> "a=C3=A7=C3=
=B5es realizadas em um
   namespace de usu=C3=A1rio". "User namespace" is the technical term, and =
it
   is already translated as "namespace de usu=C3=A1rio" in other pt_BR
   documents.

9. "bifurca=C3=A7=C3=B5es n=C3=A3o oficiais do kernel" -> "forks n=C3=A3o o=
ficiais do kernel",
   which is the term used in the other pt_BR documents.

10. "Hardening" is translated as "fortifica=C3=A7=C3=A3o (hardening)" and l=
ater as
    "fortalecido contra entradas hostis". Please use a single term, e.g.
    "fortificado contra entradas hostis".

11. "tornar o sistema irresponsivo" -> "tornar o sistema sem resposta"
    (or "n=C3=A3o responsivo").

12. "vazamentos de endere=C3=A7os/ponteiros de mem=C3=B3ria do kernel [...]=
" is a
    full sentence in the original ("Leaks of kernel memory..."), so please
    start it with an uppercase "V".

With these fixed, I'm happy to give my Reviewed-by.

Thanks,
Daniel
