Received: from mail-wr2-f25.google.com (mail-wr2-f25.google.com [74.125.225.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE148509EF9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862225; cv=pass; b=XadAEwRfmg5M07g15hKLJyztH03Q62eYVXbuO4KHne6GKTSBeyIeqU1m8+L+7YCYTplUnRxYFO6wpxzhh6DAXYJZQsz88e4FPI19WOl1KVbyKnpQW/4eHUD6ntYGzuOc26M5SJo+Tbhahj7FNLXcMEfmv5To29Mc/CQG/mKsKrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862225; c=relaxed/simple;
	bh=H942DdgplYjE1m4Z1C25g9bIj6fhk/3ChJ6y1dd69ZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ne11EME1S1Q7/2RbvsCxEh//vZlmXZQjsXFn50eNwuvOWtkoQ8sI33++9cI7bXcPyq574GYW8YVyQXi/mziF8D3JUC2wQ/iORamQM6B9Fu3yPcm8QoL60UtJd2+publn4+BDLg+s2nSb8nRSsdr7EuJ3FbHg9im6OtvoY+coU0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=twMmdzeA; arc=pass smtp.client-ip=74.125.225.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="twMmdzeA"
Received: by mail-wr2-f25.google.com with SMTP id ffacd0b85a97d-48b03eb33b2so624778f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790862220; cv=none;
        d=google.com; s=arc-20260327;
        b=WyCsd0fuiZlGnBK8nzsHUZxe25/GipxOZu3J59pAf4By0AtXl3bfkbmkr4J/0Qq3EW
         yhSDp3ynHK9VNQZjhlEZkCBqeyeS/BanSAVD0f/ZUk+60JysEZz0G/t5nER7YqvO/pXa
         eHDnpVldLDu8xjhJunjELBSBniEj8zMnrXSZMXQOlld2W+aNfzZRlfMjD7hVcWDEpUzv
         nSs8TaK8jY7yEsTGF0AGCL3mH+aS4OCA4bOArDuiJzJO6Z55TgcGLT1bCCR6HV/A7BRu
         cqKh5mPKyFSj1pW8DQ27s0+pbE7/Mp/EkqxZYQCzCnkMDbj71IP+WGys3Pp2Zd4UD2HH
         FxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uc8EFV3gFR6UdowGpvG9mlcPbI0S1kV27i2pdS0bYjI=;
        fh=qdmR7+gK6VZJI0cyx5qnbvyuoyWiloWi2PH7s5zIc/s=;
        b=YoalIjzLjIP235PTUGwRO7ecmWRkVibSI1lfKr5smO2FPGIKFhfhZnHPerVeBxKdqj
         5HU2QyNdjVNBKkNEyswAfc61rKP3m28PTr8eoQG5EfYf+rdnXepp/OJ+mUfC1ccuPAhr
         kIGZkYWnQSgS5j0iXPVZkeIlAuUknCAbkMYhrltuOR1urtal34qyIsxMAgPbY9OAlwhO
         xU9BCNpa3zsj7Ji9E3GYx+JZQGkp02gd8xlPqjrtx6+F6qsimJlYO9ThRyguz8qteYZn
         7VuwnMgeTUNMZ/JvxMRvaxY2gceLF2HPkLEwd3qqu8sI/r18SEdLF0QZ93BvIPLE3bFQ
         CvUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790862220; x=1791467020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uc8EFV3gFR6UdowGpvG9mlcPbI0S1kV27i2pdS0bYjI=;
        b=twMmdzeAdWYxHc+aiKUETneDeiDyvtCcG8NMLWGRQ4dtnzBUcm6/TwgJ330SP8ZPnh
         i5tprmJoXPwDgBCxcD8v+3gOmWTnqKQ864ReFFgTmLRDbhbEWpCjzjZ9Zeys0ApwVgxy
         7h6mio27RuR/fEMosI68uzDawkuhBeE+aEiDTF5QkF+IgvAK1JCeH5dTrmvKdS/nt83I
         jSl1VLN7Y88xbXCbGEutWs+tWpDcAdPlPfSBu3MxrQPyOLGpjXwuZePiOQOX/GJYIvmM
         3m1P4BhkUKOLDK2cOiVziKBCFhnPKVCaKGt7FPohk/KpdUWyix2zrzfvjqhVTdmn443a
         w2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862220; x=1791467020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uc8EFV3gFR6UdowGpvG9mlcPbI0S1kV27i2pdS0bYjI=;
        b=e6rSTAQaCICjFnyMNaqAGYr55jMNbQ+IHwqB+8zrvt/PwcoIMlXPJ+ssQ2dcAUswOp
         9o+k1x3+BBhLA5YZ2Olx0xOXeb8LA875TVWC5hr4kcAB4XFV/z+YQ3Md5M1TDcj70v80
         BUgrPgzo19RWmf+cJswS4ymPYEwxXnBPh3KQU/WOXEGiYXklihI+uOViosJV0U1HgKvy
         visSePHlRHuphfzN4tlQOvuoI4pfytwk07UtHM1WnLexwliR8+scFDLQef1eaOMkcmzr
         IlP24Wl1PzGP7ZeX5BKLovh2mMs4t2+p4GlYaOkSBniplhxlXXDkEv40z+FjXH5EjKdB
         8Mww==
X-Forwarded-Encrypted: i=1; AKwUvBzD/cFXp7USF32oXKiDGuMUEiiG1ABbcgHYOYpIP5HBeK/+/8+4L3Q8gjtRUq9nY4D/YA6+463k1SSAJrY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIj4A4pYjkMFLxUeNCprerncndCp9F+pVxfN01m1wh5zt1drWIV
	5l1nBqWKByI/vZpDTJdILt/lZhVJgzrAzLPrm40CziXgvQHO4XQc4o3JQ+c0qfeevU/IZgIU45s
	B4+4nLQd+jIo6ZCWXg9N4ilb2m5CTjJ3SEAe55fns
X-Gm-Gg: AYBFou2KaQul4OuigZEvnHwBMbJnALRZWYP8lqsN83bDOGKT+5aabIUoUo+SChq9bLH
	amUGp84ON0mMJURYdj4FezVma0neaujqx8JacV5w7O5Cv9dIG9KKuwMOOJl8P6j6twuykItR5Um
	vpmQl+H3eujke++O4yNQo/p/pypRmDn3lqFs5L+R2jHmLPzlPavRwgtYl5vq/LB7Mh4d9Ya/ERw
	IdZuIYBYOOQ9muquE588AHu2IS0s8/ho1gnTcVJawbnS+nK4XLcRc2J7sf2NoZykO8b46lO6G29
	gAN+/RpHt0ta0DkkHJtrdo0jrNfOQrvuLlwIDoiBhvmOoUyvB7A7ZHlImZLve2ms2QMtlBUP23Y
	E2Ptnmsb+64irBhmgh+qzpneFsBHcyy+9WHTRNNClEUFMrvhVvYQ=
X-Received: by 2002:a5d:588c:0:b0:488:80bb:d14c with SMTP id
 ffacd0b85a97d-48b067b5c63mr7039150f8f.5.1790862219570; Thu, 01 Oct 2026
 06:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831052635.42417-1-nenkov2004@gmail.com> <20260831054920.42550-1-nenkov2004@gmail.com>
 <2026100156-strongly-plural-e7f1@gregkh>
In-Reply-To: <2026100156-strongly-plural-e7f1@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Oct 2026 15:43:25 +0200
X-Gm-Features: AclHuK-JgNuCEKzv_oDPeieF0TCT5U4OIu-QevALTW5aMRozO0q80VSA0jAWOMo
Message-ID: <CAH5fLgh5MRMRJfym-Cv=P_bqCzZ+jXh=ieTD=hPX4KrktKtBiA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: binder: Use lower bound for node debug lookup
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: nenkov2004@gmail.com, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:38=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Aug 31, 2026 at 07:49:20AM +0200, nenkov2004@gmail.com wrote:
> > From: Hristos Nenkov <nenkov2004@gmail.com>
> >
> > The Binder node debug lookup currently walks the process node RBTree
> > from the beginning until it finds the first node pointer greater than
> > the requested pointer.
> >
> > Use RBTree::cursor_lower_bound() to start the lookup at the relevant
> > tree position instead. When the lower-bound key is equal to the
> > requested pointer, inspect the next node to preserve the existing
> > strictly-greater-than semantics.
> >
> > This changes the tree lookup from a linear scan to an O(log n) search
> > without changing the returned node semantics.
> >
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1249
> > Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
> > ---
> >  drivers/android/binder/process.rs | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
>
> This does not apply to the char-misc-testing branch :(

Please check this instead:
https://lore.kernel.org/all/20260814215145.2050599-1-rafael@rcpassos.me/

This one is a duplicate, and I prefer the other one.

Alice
