Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E5844237C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773079; cv=pass; b=jmxd9tCio4sXiJoySSCezZmFIoSnn4UOGUVOG4Rc53bhin6mK9OCG8mlhRSP3pdEil+AOshzHIOtFoj4kTYxgyAp0y0yyZ3E3BwppcGvNz72TATosbFQ/sxN/8QeONHEJ5vVj8LhsS2q7TWocO9664IDxwJel66EdnspDF3bwR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773079; c=relaxed/simple;
	bh=cSfmMGgIFwjjaaI7Bk9duU/SsMv1zgWa3X4ow3p9Z0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KU8RfTaGEiKFuH21zYwqVvFj/HXO54ClMLJLv5GGRVlxFYl3sxbXySK3EMupr1xjP8leFVsLnvgBu51YfnHnqpmZLBVpse4S72pArGrth4Ug2mV4tXDBQJNj1eZcO1ter/sd0F6PTFfiZVrNPF+HxEJ4k/omXe+vVx0zpufHWh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bYzWZS6h; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bYzWZS6h"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-485843aeab8so3687551f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773075; cv=none;
        d=google.com; s=arc-20260327;
        b=S49IkCzeCA3wAQ7BBZgBhaktUZyiKgOdRkaIK9zPCO4Ctzo4iXqn11e0kjkKM8SqV/
         NWmst7OvwLaUBthBwIdVwuqSJ1EP2CObREAVXqWbeDZNxShMm0DNHhI9zs+YRgdqwuDs
         idqtAR4bxsPvSXqw3uJkUNowVcP2FFA+pKXvSpNNSSYXm+NyIXCCjsFPBffcqjmyi9sL
         8eQupDdk5JmrhDcFL+H0nThy5BnlIQQiFPsqAcP9uk8vvRnkJUl6COjYt5IHdQ9u6A2I
         7nVgp+08oCx2oMvLz8fozdl6whrA8HtZc2uAAZKINJDwROW91GRo9l8gqkApBZuv4S42
         oIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfGjfP8T35WEV6rGIAsKY4f5Rwo6my7dAG0voowddxQ=;
        fh=fyJAzwYp1TUZ4vMmjQWS7CWYlqO3Kg2S0B2yZM7qIfo=;
        b=Ajz+nMIGJjj7eu0G7hFEIfPmRrXz11MeoWdvzdxLdLJt2tOCwSeApMdIUmwWFwVDS8
         hqJqg0VgTCTw6zpShdQ0ZUUoSl+MtMS6LXoNHAJPbt/wNS1ZPhcLHLOTdP3NVjKjBzjR
         1W4pWL04Rd+1M4/0s0EwM4yA1JShysqXhCM33VoTkrhB6AUNCrpYg0aeWr9dQEDjTnHM
         fyo8B+b9wG9PB3FMJeyLpCXM3rnCk94vBF/r4u3GyM6I5yjBkySROOqPfe9EOzrwH0+n
         BOgKAxWuYw5J9c8oqRsGSVIo8iyZRiv2zABEywRez0VQmK5vyIP9E028vk2CwmtV4Ose
         GZVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788773075; x=1789377875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfGjfP8T35WEV6rGIAsKY4f5Rwo6my7dAG0voowddxQ=;
        b=bYzWZS6hvyblgTmL2WcmqKBFUHHD7UV1gkXyod2CvfAo9EbydIVeGF++9jABbnZPte
         ys7ocRIu1X8wdEIGp96wY0ZJwuX9iep0RRInWAVJmxBvFDn1O/SCyei+2Uu4DEx9EFWy
         Ju0SX+/3BqiQeyfykHFwlXZNMjTYSHT9Hz+p1tge65xlQefntxQdIOB//wajbELDPR6l
         bZSz7BV5hpdU91s0tZALuvzT0BaGoZvdwZ+37h8mSbXVV8RthaPq9o6xvdh7qixRCia5
         5aTu+haqTXNlK7d6WQD6MLUT44ym0DOgw7EgnQhTgLv5A9qh2xRN6Nek2Upj1f/kRQ35
         VQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773075; x=1789377875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfGjfP8T35WEV6rGIAsKY4f5Rwo6my7dAG0voowddxQ=;
        b=S8RpwfMXdrTIL31JTnPlqGiutvqRttx02nwuKK6yu7+2hHBUY1doeXWRJX2kQ/yLjU
         29JELfCQa6GYNebBQlzUyiFuSi3YcrzbJzdE64B2a23wcQsU+8DLxLt3V5vJ1i+X0A7r
         +OeZDruydIPoGgG+7LIV4h5kpHS7BLQRQwZJdxe6cEjGlVBrrQkdKoLIXcSbt0059uUg
         vOHjgvDXS2+JgPYlkQzji8158DHgdHJrxTL9YKoWwHPbVuts8A5nuA6jrUxGogsdN6vh
         yGGOPFCHeQstfIyZF+j9HZNRnufTqyMytb5/BtliU8gUGAOPuHxNL4Dm7r5yJhrFj9vf
         jarQ==
X-Forwarded-Encrypted: i=1; AKwUvBxz/6Br9V6Xp1uVMUzYUh97veLqMh95COybYBoVniQcZkdXqPUq+D9TpvlsKdx46PI+5+tv73EqKa+ysII=@vger.kernel.org
X-Gm-Message-State: AFuF++npInDTDQs9A5dO8nZZQ2h3+G1mkKrtAZK7hJeVYrfteRTdFFHx
	gJHQKiQ3odn8Kmw+UGNQAa8YbhxNPsE07qM3A/eegO4d6yLd/3sraUbEm3HbqkjD220mM1yAzGW
	pPlMGPNnpKsvPaavJk8Gk8Fyvk74gfuqSjwCMW92i
X-Gm-Gg: AYBFou1IAkshXnsbmtxIHjYMrLDDJT5JITvwRctEQSPoftb2w3AtJJOfn07nwgULT9Z
	3n/suUt4COtn7iT3LTCF/SOyq1Jl/5PpWeg945WVhyGe9l2o4+OFsnkosu/F875hbI2pYkmJJ4Q
	cP5Ya9iWHnkawGUX40V/X7mmiw1WvcrVxqw9DWEFm3JEUgU4NrHQ4XVjKYLmgPCNbHgk/WB3Vzr
	oa8/490TREvEtSB3StNaMkp1uQARQNqjpL+UjOMVbMxRTudOj3t3yUXbGYb2QWYurWpvWosKmw8
	dKLxUBRHPZfxGofJkTDRTNRbzCEyj3cVroo00n2Aqg9eihJ/MUO3QllVkwxZzdKUIaxbx8sQvFP
	RDr5KkwKhMvKeBMwo4HRXcnm+JeHMtSM=
X-Received: by 2002:a05:6000:430b:b0:485:8ad6:3752 with SMTP id
 ffacd0b85a97d-4858ad63a6fmr37026021f8f.5.1788773074197; Mon, 07 Sep 2026
 02:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-4-490735672187@kernel.org> <ao2WubjLtDuHvRzx@google.com>
 <DL894TFXM5AT.2QOXN683UKXIF@garyguo.net>
In-Reply-To: <DL894TFXM5AT.2QOXN683UKXIF@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Sep 2026 11:24:21 +0200
X-Gm-Features: AcwNN1V4plkowyMHAsnIxTQwxzR-aYAz331pg1N8okzwNx7uKX70uWh-YG4Yx6I
Message-ID: <CAH5fLggAMfBcxprKJxs4JbieKadC_mKg4B0xNETOH1QUi72UGQ@mail.gmail.com>
Subject: Re: [PATCH v20 4/8] rust: page: convert to `Ownable`'
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Aug 25, 2026 at 2:20 PM BST, Alice Ryhl wrote:
> > On Mon, Aug 24, 2026 at 01:17:56PM +0200, Andreas Hindborg wrote:
> >> +        // SAFETY: We just successfully allocated a page, so we now h=
ave ownership of the newly
> >> +        // allocated page. We transfer that ownership to the new `Own=
ed<Page>` object.
> >> +        // Since `Page` is transparent, we can cast the pointer direc=
tly.
> >> +        Ok(unsafe { Owned::from_raw(page.cast()) })
> >
> > This doesn't satisfy the safety requirements of Owned::from_raw()
> > because the page may be used with vm_insert_page(), which increments it=
s
> > refcount and causes it to be shared the vma system, and this occurs
> > before Page::release() is called.
>
> I suppose the existing vm_insert_page() abstraction we have is already
> problematic, because it uses `&Page`?
>
> Maybe we want to change the API to use `ARef<Page>` so it already has to =
be
> shared? Conceptually it takes a reference count from a `&Page`, which isn=
't
> possible because `Page` is not `AlwaysRefCounted`, so it needs a `&ARef<P=
age>`
> to be able to do that op.

Honestly, the problem is the safety requirements of Owned::from_raw().
Pages have a "special" main reference, and free_page() does more than
put_page(). It even does something when the refcount does not hit
zero.

The correct behavior for Page is to allow the user to hold one
Owned<Page> whose drop calls free_page(), *plus* any number of
ARef<Page> references that invoke put_page() on drop. This way, the
owned page controls the special drop codepath.

Alice
