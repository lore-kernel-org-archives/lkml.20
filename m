Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D9A36493A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787776978; cv=pass; b=Y6beUxmbBmzSVGz+xzXboxcq9cYyPESf8wBoOxI4n/HSnd/4O/TqgLNLGhlAGcfV6WShCngGgnEDPxoIvWN2fwujuiWB7WuI4u4afZYHq45CAPzXi8P4JwjBlIY4+H9/PALEu0j7Nz4+knictzgtoA84213hwRyWdBnJJ0IWaTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787776978; c=relaxed/simple;
	bh=GVdZ188LNtx3TZKK84+iX7t8VYh9/znoneRN86I6/xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWp+SKaYLueKurztZMz+WynHDUpnw0C+vAesLUXeXIk7pTVdIE5ICT5wVkvNjA8dcM3kmMRwO6MoHIZW9lMkvoJo92Dmgp7IlWErMJZSMgHB9+oSWbfVh9Z2X+474HRNh4Jjg7ACXaqvUmJk1q8gUhWzBxW2ZIEgWH09zW8RzDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avokEuFk; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avokEuFk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d049069377so17794715ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787776977; cv=none;
        d=google.com; s=arc-20260327;
        b=PHbr4hYhykSnxFhW5hmIPV1iopZBe8pVET7P0CycS+dQRB1EDzNuoXr31PgGsgXBZQ
         tNXS9KeumFI9WSgnNXcAF2/Qbxwj5aXX4w0wjqMCBhKZEw12e4PcDM3oxFLU3LpAyxTi
         wNPeyO2egTuQ9J6yHJs4Cet0O/yr0BGJkSUC2m2eHt3tC87C5Szkij9bTVuVAgzvn+kp
         8CLdkl+fSxXb8FJwhNu9fIhzFzJFXzgHEJ/3j42uqA9EeObpDJvMYdsc5e2BLNMHGbfM
         a75/3c8SVUu556cwuvlhBGA3bTeFHHxen3Wb+X0JXN/Kq20uzSUWn+v3ApgNWZknZN3/
         jpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GVdZ188LNtx3TZKK84+iX7t8VYh9/znoneRN86I6/xw=;
        fh=gmkTTlJArlS8sRhJn46DhnusMRBcVbzTqs1H4y3W2Tc=;
        b=BxcHOnvw6CuLYUdxNXoW4Wpcif8Ik6oq8i7WWFuyDSkSEurX9JVKyhDLgYoZHHdowb
         O/V7R1BN40WJsX0DngFPuzqTPlCB444g6W+18dZj8JosxEHfTq/aON67NMeJimnlBJAT
         y61u8pQd/N4BQbIsb/EIsFdxiocgO47G6sBtoerrIC5HGKXg/BOzyTysa2xGmnTNtrrh
         pu4LjJjo0t4JYdzpZ/3kWgqZPhdXILF8XAytj23algqEN7YPxicO5qu5zGPkfX3lQL45
         78stQpgX0EMAkcn551TEkaRah59I0rDzT794YpYL/1aQ92H3cLY/P/L5j/+/XLvPzJ3U
         qvLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787776977; x=1788381777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GVdZ188LNtx3TZKK84+iX7t8VYh9/znoneRN86I6/xw=;
        b=avokEuFkcfWeR2lgt93CKutiN3tnprWnMH9N4hArJvSDSgQAj2SF5DcYDhd9Dh5RGk
         cN6U+D26n/47coE4P75lY8raSzTyhGOc+57dAGONrGnNoVamD12N1Fu6/ND7VQ42Sf56
         D2jWH4WRVgrH4tDJygz0SnKSle7XD5DZHjt8nPBI+D2rwbPbWuIgbKQ7zgoPqWo+tOmq
         pGdTlYh8htOncnAtZLTBQcMW7gjPmUzCXMVwkABx0fYzjImwsctRDSETDFPeCb93N67E
         goJ8F6IEZty92jmanozKAQvj2ixf2my7nINzmIv35XYUTeLxl8XxDh9PkhLtlVn2XIuM
         RwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787776977; x=1788381777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVdZ188LNtx3TZKK84+iX7t8VYh9/znoneRN86I6/xw=;
        b=o8t9aXAaDe331zb6NNzyXav8utIHW3oTumugfff+ii0iwOhwzevYQcLIu0Q834NJDO
         nHLkVolc0uKgqV3qy3JNo64DoY767ym90X/TplMxqJzTXDQZc9Y0Myz5xyEeNyJYyiMS
         yH5yavJiqAOjfofm0i7sVFMel5ChscERuDaNqcsFW5Od2R9MmYpiqRlJ49e1R27JJRXD
         QjftUrWEwgle73MTrBb7MEFYp/+L6mQxaeRkvmyvuAwoEhNE8L1yK0dOLK8RenAVxIXt
         jN0IPsUI7dEK/JBMbD72hJXFGiRUiedHmfCVb8NyBRjiz3UhD1x041DiX1/LjA5wdJ4s
         r6nA==
X-Forwarded-Encrypted: i=1; AHgh+RqMcedH6L8XdkGDUaQtl9SEQyPwzDRB3w8+ek+ypuZ8Bnup4Dy8PCwLCSIvVDGx+zWYjswewnqRCo3sCaA=@vger.kernel.org
X-Gm-Message-State: AFuF++mbjOs1nq0cubRtN98XOL41T3uT3HrObQeMVp5XRfuwO6zJJGhH
	Zd0MaBkiN1bcr0Uiiphv+g60KJj+da7yi3N51NgyrJb+9/J6EFMwbPbSQaLPWsLLt/ztCYC0L3Y
	SY1+6lAGOqiAI728mpzjn2oD1eEG26ds=
X-Gm-Gg: AR+sD10RNGoMDdnJAPuXCu38LIDN7ef3O3sHBw0AH3o+WCpTQwS4NI6rHwBorS6nsTJ
	0uWjAlTt3R4I0CqLRzZuBnE/K00WLW1A2IhusBUhfRMAOj5W3mr3gxMgJQFqhWSwqlZfKJ2/mDj
	vzoZ2li0ykDuftRZZRvWpYJ2RdQjE0pJJmMTVUQH9rll6T5nU4yJMTOoAUfq7xnqLVoTnxyDXi5
	Jn9aWZVQpEDPjmxh/V9i57yg8LpDWmkavEJm9f9TANk7CN+KRj84NXvggIObHSRd6c0Fmu85ahR
	a6zTbji4y6UyFKAxC0GzZMI77BfmtIKSMoBMBN6sKPtADbLCc0ok42vrk4sONljtNZQx5Xslye5
	I/w==
X-Received: by 2002:a17:903:46c5:b0:2c8:f34c:82c0 with SMTP id
 d9443c01a7336-2d707a5d1b9mr183703255ad.2.1787776976607; Wed, 26 Aug 2026
 13:42:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826061300.14038-1-anshumantewari123@gmail.com> <cfe22f1a-2ac9-48dc-a2c6-4369e45a852b@kernel.org>
In-Reply-To: <cfe22f1a-2ac9-48dc-a2c6-4369e45a852b@kernel.org>
From: Anshuman Tewari <anshumantewari123@gmail.com>
Date: Thu, 27 Aug 2026 02:12:44 +0530
X-Gm-Features: AcwNN1WRjnb4FrvbNG305N6dcYNUZlWJ5mcojcAGl8FuFaVujFN1h0WcgNdVL4A
Message-ID: <CAJqi8kLqxjX5HjxH6e7seX1Tyb6NhqFReMpCNKR7KTpaFGiszA@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: fix line buffer leak in mremap_test is_range_mapped()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, David =E2=80=94 appreciate the ack.

Anshuman

On Wed, 26 Aug 2026 at 13:08, David Hildenbrand (Arm) <david@kernel.org> wr=
ote:
>
> On 8/26/26 08:13, Anshuman wrote:
> > is_range_mapped() uses getline() to read /proc/self/maps line by
> > line, but never frees the buffer it allocates. Every exit path
> > (parse failure, match found, or reaching EOF) returns without
> > calling free(line), leaking the buffer on each call. The function
> > is called multiple times in this test, so the leak accumulates
> > across calls.
> >
> > Free line before returning.
> >
> > Signed-off-by: Anshuman <anshumantewari123@gmail.com>
> > ---
>
> Looks good, I don't think Fixes is needed (even though called multiple ti=
mes,
> the effective waste should not be relevant on any realistic system).
>
> Thanks!
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>
> --
> Cheers,
>
> David
