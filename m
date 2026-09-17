Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD2A3E7BAD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632656; cv=none; b=CjK+W4X7H4/GPZ+1eM8jjHyhfBEDG0i/5hThYuL5h1q+dHyM65teHF7OxoaVwdI9V7CFTy7smEiixO9VdopKwg1RM+ig34+uocKZ7CoTgaAOVFWh+kgndv4abcdc2dEEwOMsyTBIIkQkdoupneBDOyhCVcM1FMgsyHKaM2ut99A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632656; c=relaxed/simple;
	bh=m3YGZEy09yRgJ2JaKzPyUPdH8tTqM2R2o2g/OwqIHvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adcMof6PtVnGEulopwvVEMQf6YxErCtCrEYoSuxOsfTXjg/59RSTnv8rOPAgPPS3QfVQ+qdV+X5VijXhm7gmKn4pCw2liOvfZ+nqb6LwTxUyJfC3QvKUwvpldh44QytpDOHZBZhguh151saEGilCgDTImiqbhl0Ni1MUAkQ3mfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9809ce25a29so377661241.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632653; x=1790237453;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/n1V6C1SyVBCThBez7rg4ybTZbuRI23DZ9D8Q+s9AMA=;
        b=fFRWyT5evjuArdXwpvFUv5HsYtVYlKilQ4vJajaVM66+LjiT0aLUfrIukfK7E41Yuf
         4/rudmgEeelWJ/ZLdx+JM/eZY0NeXUyoAgC4xQijgef9db6RDQ0mQjz4brCXDsciq1fa
         ky1giVe7fhQleKIMwRKf2+7lPzp38JJX1ouNMEbjojnlBW7DhyRrUHyFv8QCQJKODHAu
         qjNM5NA2C0zqH2+A5BjM1RwxtznG7mFAMPpdwIZ/eC63sISqzR9Ogk+uGloQTF+U18gQ
         O9iIMsYxSWP75bGhtkgKFbRXx8EqZoBlZOT6SZgTgK5OYpQBBPcCu6fB5WfEc4dsAKRC
         v3DA==
X-Forwarded-Encrypted: i=1; AKwUvByIsSrqkihEj1kdyBZCTSLnrL/oN1Oyv2tLe8c1okD23j58V/38mYzhU1043ciQgv0r8dxKNtPYqmrmGRY=@vger.kernel.org
X-Gm-Message-State: AFuF++ky63tuFQJQw6syjiPhnvChtHY4cVyYGjdXFmoWOb0L76nk3DuX
	bhLFz8cLiyLotrlcmmpNr8qX5F4t7PxdHOuHC9DsP8WWF7xDYEK9oxcF1V8hqjRZGcU=
X-Gm-Gg: AYBFou1NOpAzeZbGQE45qlnzQZha565vYNJl+ZaxProTFKkPaRjTPrSb7oNeWtCNXos
	LzQV+TY6jMqZyGld/09fOU2B5m6QV4XvRsrXeCaOR6KzZ0u+GkQLbnrrLKNWKx0BgmXfUwDYBYt
	2JW4iDZbXkvlsU2II7z6n8Va+CGrTlHiAkPXDmlCeQfvFSK98gbElZY2OYJN1za7lsQOgodZqDE
	g81E5hKk3AN7kro7RwbBF2MT9XaIg6Dm0hVrmg6gO4AsOpx28smWPXb/cF9KLQvnDHrl4Q8pveQ
	1xfbb5GNzVexdu+uYjbI1A9Z7I6/WoU9iKT/N1i25uE/GNkKPWusdnbTqjrxtcmARASOzn3LT+/
	HiuXt5rlIGty087QFkWEAmpXs3cV0JGdy9MDeb88hoCbTZQYRK/sQ+ahBzm5N7Dus62DCMXFc4+
	WakNQGxv2vSxRNfRVlUf+lpo8R3TfcQR9JRV9lbwgFokBSDXmR2ZwtCbZ6jxiR0jM6tkHA9NEub
	Sb5jJAfI7ZV3SeRob49ESrnlQrdnVQ7770x
X-Received: by 2002:a05:6102:2582:20b0:7a1:f2b5:645c with SMTP id ada2fe7eead31-7a1f2b564femr530761137.25.1789632653576;
        Thu, 17 Sep 2026 01:10:53 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-983234f4a3fsm2365410241.4.2026.09.17.01.10.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:10:53 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-78a338fe106so528475137.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:10:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZAg9AgX+MMSwC+HrRgbPnaKpAPgsTTbkpQTNGZn2vHekF5PQBsKtbMocU1WtIZvoGctAeGcw3p2KU+Nc=@vger.kernel.org
X-Received: by 2002:a05:6102:a18a:20b0:7a1:f2b5:645a with SMTP id
 ada2fe7eead31-7a1f2b564f2mr452263137.23.1789632652708; Thu, 17 Sep 2026
 01:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-4-wsa+renesas@sang-engineering.com> <CAMuHMdX27+sdJYd06v3T9hj2=z3ADSKOVGvu+02-qe+Jp6R4Bw@mail.gmail.com>
 <aqsNpEXjuZswCC9w@shikoro>
In-Reply-To: <aqsNpEXjuZswCC9w@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 10:10:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPcBfFrLLW9_URM99S1jR-KhqUBQo1n7oHqX8qL4=1-w@mail.gmail.com>
X-Gm-Features: AcwNN1Wcf_hW5MJVX-r-TSDH-HlDt_qd0MZzGiSdL1Dk0dN2d6j_lLw27_H_CyM
Message-ID: <CAMuHMdUPcBfFrLLW9_URM99S1jR-KhqUBQo1n7oHqX8qL4=1-w@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] hwspinlock: add low level debug capabilities
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 16 Sept 2026 at 23:44, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > to request, free, lock, unlock, and test hwspinlocks. Because this is a
> > > potentially dangerous interface, it can only be enabled via source code.
> >
> > ... code,
> >
> > > Similar to writeable attributes for clocks where this idea stems from.
> >
> > similar ...
>
> You mean I should merge the two sentences into one?

Yes, as the second "sentence" does not have a verb.

> > > +static void hwspin_lock_low_level_debug_init(struct dentry *rootdir)
> > > +{
> > > +       debugfs_create_file("request", 0200, rootdir, NULL, &fops_request);
> > > +       debugfs_create_file("free", 0200, rootdir, NULL, &fops_free);
> > > +       debugfs_create_file("lock", 0200, rootdir, NULL, &fops_trylock_raw);
> > > +       debugfs_create_file("unlock", 0200, rootdir, NULL, &fops_unlock_raw);
> > > +       debugfs_create_file("test_lock", 0200, rootdir, NULL, &fops_test);
> >
> > Perhaps just "test"?
>
> Hmm, too generic for my taste. In fact, I think I should maybe rename it
> to "test_single_lock" to make it more precise...

"test_single"? All others don't have "lock" in their name.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
