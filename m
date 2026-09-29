Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9508954EEB9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706634; cv=pass; b=kY0sfUQzLmeDdIFoTPypZw/Lo1pWclIXAV/1swaTJNA9bfB7M0My8BpQO259DbKvafdSUVWchukN5Xx+ebcUMuBnLf06FM8nufASKFVurgnLPePpRNbQnRf2WN19L8B3u6zDkuwWQ9Rc/u0lFSa7IZ7juC8Fo+uChi9JhNzaXWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706634; c=relaxed/simple;
	bh=so6oVerSAvlf8qQyygVkuGfJwEoQL40QCmwAvKJBtHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ax6J43WmNpPeDE3TY0IyhIF+F/UQciV6lkr9+zG/OQziUXwTpitzpfnykJ9aHslMdUNYRGm9/4/Q0TP7SL1j7adjHS9rnmpl4pX30661wDAJw0PVMyxiE+QP++kxbU6adnny8rB3r6Cz8neCpW1sSF4eYN+n392S6itLFJo9AsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akVseL+2; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akVseL+2"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e79c06622so486173eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790706633; cv=none;
        d=google.com; s=arc-20260327;
        b=LA8Sg5ceVQ/9H2wwEE7i5/JVJRwe//OwPsJpO5UOCU50Ek6gdqbr7r91CzMvMnklFp
         rg9UX9FKUXn1Ru+Lh7ADoTy/7/MpYqVWkAslQhSaXVjl07Zw1r/ZhiiBSqflWSrgvsqv
         yaBrDf1IvebEwEtz3jR8JpLnCQzy8PQSOIFoAurMK4atxqAZ87plXpnUzXywcs7o7KuC
         NQ8HClGT+a43VL6YRxixhMuCw7ItdNp7uqYkLoQgketthxonYF4OBIk0OwD7xgwQ+cF4
         G05dMUbfVz0nuMw5Du3bEe66FkAgkxtm7M+bajlzg/fsbXkeacEPKG0H8B/fCgAsLc58
         5FuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=so6oVerSAvlf8qQyygVkuGfJwEoQL40QCmwAvKJBtHo=;
        fh=IEA6m+a6VDln3SUz8TaO+XA/9+W2jiZilIIz7jjQUZk=;
        b=S1M3xnxeFlKZ6I0B2G+QJkshmj5/Lgr2clRnWvKjDD3woiDnCVu6wyMgIl+Bf9pIce
         DaCawnjNO7xg+saNFKa7Ajnjkg8UT1mMyW2qbGxkPdqa0VHtWq8x7FyB5bvZfb/XfLIt
         ikXfPCKkGezk5GQAhYs9K12AyAbfkTaXgM8rMTGNvkr3+Isp3S+JM7+CIyn8FLlgcmSn
         HFaFh4dfZQcLK2wHevUJ2WeOnSD8877+mjUAb4Uf9dgpEJEn5FpBZADCqQbhPMf7es4K
         FI+T3JaUn3QC/mKfjyc9GU7F6fj8vH5UMwzIIfJIFBjliKNwXhjKcMa2Ol/LU6j/HQma
         2SHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790706633; x=1791311433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=so6oVerSAvlf8qQyygVkuGfJwEoQL40QCmwAvKJBtHo=;
        b=akVseL+2Zsw75iD0d1oqrP0APaGwmGn+q4fHtfrhpUTT2nPQtaRxaXwzjfTppmbwEL
         nHa+X+mMhmtr13qN9AHS0xC01gLZMtQE7AUvSV0asif5xU38rcWhyo7QBswnEYBJIuBs
         C5jUtRkLrzNnHWZph3koqFyvR/ME3NBeA/9OFGMQAo30w8je3nz81K1U7NWVbNxRghlP
         AWYQY9xMjkzeFLVT2TsM0qVbWJ5JTBuoNS3HP9clu2aEXN5hp7zSzWNgybybFhB2gwLh
         uPAOSR4P1/kE0h1CHW14sVgDvjT32CCXyhXN8pfWhK9kfB/T9Ch0ppr9x8OGCAYrJMy0
         0LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790706633; x=1791311433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=so6oVerSAvlf8qQyygVkuGfJwEoQL40QCmwAvKJBtHo=;
        b=Ajl/4lCyUxG2kzxou9nVzlVsVGk/9YZzQEYCBX8dNM4oqQXaDKK2OPz1YiaYg2Tlm7
         sigTkc9bV/tR79h2M6JaE2pAfnLpFjoc5M7JPQATNQeqtqcnseo8lcQktP37y+/CD/6W
         rMyFdEzFRxpUVWIAI7rN9LOTc4zUhm9WuUK2I+qZn5ASNZ52sgdj9ojIX/Keg1GOZtFo
         FF2/OTpCnnOQGSrYRl3ziltKEDs0rz2VlyJ2SHvYvmvgivxKo7XrElYwcoCIuCs1EKQg
         43qPLpkg3otMaT+eFZyHtrFcqVnF7e8WCBJImjECnrtM33nflAimFcrwRiWaGr2z/6at
         n0bw==
X-Forwarded-Encrypted: i=1; AKwUvBxDAvm9KPmDupLIcJtKVmc1XWe5l2DX9EiYSwv+77cZO2db50fD4FLtgAzGjfyvvHwtkDeQMLne7nkfob4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/mzeHP79LiWxtTScg2A2w/fPvbbuaP5asTYg0pt7P7X555WLb
	nzPV80AL7ynS9fihV76+vmSIU5JZ/rwtz/jLbMRh39V2Szh2r9CY0WxywtQqnxquJ+GnEvOX2bB
	bj4br2lLnyKnh6sRIZQERe8/okgzejBM=
X-Gm-Gg: AYBFou1cNXVcWA0WvufCLKwTLh5ncQ8j2lnmU09lYIXpc15YkbmkXQFXY+j/OzqYFp2
	GackD9jPq3ykN81c1SrZVBF0IprRkmYxciEO+b0DgORte8S6EVqmWHSSdnJz7cTzE+fd5KSAkSh
	s5HijlW51MkSd7Sxla6f76pSMWI83A5LG/UFBPMq+00EntwSUUjWIk2bxyYcHj+D3DLzc8R+Tzl
	pboYnxGDJrGNprusVkowfVVk8RuOC0ggcDvFa9Yaka89+BicYBPSLKUZcI6a8t+ysd17eCkTuRX
	IT0yXTTM/WL1c67XWJCMuG+DXFU+NCHgXS/apB3ZNzQCxLAIIjxi0acQ6gueDvnxDmzThO2RK4e
	T3dhQ/9iEXO7EK1vIBDAwHnhrY4VYMYizC8JNn8hqrZdwJ8vZ1YIu4CbzgsBb4P1Fcfv5x3buC6
	Ean1hDKzeAvBKWdANZoCWea8x+duKTCcWfJMzylnijh2pjsMOF5/0=
X-Received: by 2002:a05:7300:54c3:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-34c65e57c85mr310321eec.2.1790706632561; Tue, 29 Sep 2026
 11:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org> <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
In-Reply-To: <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 20:30:19 +0200
X-Gm-Features: AclHuK82YPGh1_8MznSyzg_lIm_Mo3ik3GH7f918U02c_TAEwv_vWlnTK-O3zyI
Message-ID: <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C function
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 7:58=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> This function returns the maximum number of CPUs that can be online.
>
> The wrapper is needed by the Rust null block driver.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

I can pick this one -- it could have been an independent patch anyway, no?

Thanks!

Cheers,
Miguel
