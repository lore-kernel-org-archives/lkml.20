Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794540102;
	b=FMNLClOIJZkysGzZSWQzYDJWXeWnz7ihjsXBeklcIBANUzcpiKLft7C8cF2r/oe2C7n2
	 RtaoMt9jwxkQSVktDu9/oSJ47PGf/O4fxpADS6Bn1fIWP8cA1AwBPbAXIZLIDNISfhEDp
	 oR3bx6f6AlN4En7/ha7OTKfY0m/Kq2O6hwhuBAvSgtO+h3C7j8vL8kYJdUPhRZlK4349M
	 dqM8yIUJPS5SjB4HCHzmaGdSf3l+Yi0YepSnuRpV5byc/jSnKcEfnJZJsNUgJ0UTZdQJt
	 5eQIxwNDHVD+ZUPG+wk7GqsQLQ84f6AXjBASWy+UrBfM4fHQ9Gobys4UfMuV3Jj7YCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KlC7kz5Wd2GugrQzeadNEBgbSiUKxvLtosrmHbuGMxk=;
	b=Ph5OB0y8W5dsWjk+7r6SovlBvMmmt5OpRwtwLlnepPNLPMd2SbtiWVxExO9bNGftzQTZ
	 1ZvxnznOEA4LFFI4Vf/pfKUnwp6uXFpQIj9s1g9qAYv1VBIYn0dCRmLqPhYAQab7z02/0
	 +gMRUrTELMWmaObfqVPBKFGdY47tSAhtOtfTnF4b1oTCf7FiARwLh2NP7h7rCrGiVQtKc
	 DP5O1lGNnSNdzNtRF1o5Yl/LBA/xjjGTZQ4o6PY81FADFrI6Qt7NYSu+rwHKgZAYFAf3H
	 i1rl9A9N5rCBXwSHjGLQ8xQZdbyelzM9vGwz/EMtT8vijVFeB4iF/L0ROM5pg+gVAtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p+yKKFSE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF26B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF26B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p+yKKFSE
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso132187137.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:21:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794540101; cv=none;
        d=google.com; s=arc-20260327;
        b=elaUdyTsdz+w1gjwxUf95g8S7QeS/wAfCVHLGlx5Eq2YqwtKiswgcdp2GNkNVEs7aa
         3rq/ePzdmg5ETJoYwT7C1KhDxnXW8alwFku7El4qEnnJW6vfNCYTPZlkulTNSj3VtKsA
         ajJnU9znhSBSr5bydsZTyqhec9WIRz4hQ/q5flXkqldd+NNj6mI/LU2JPSaulUwVwicb
         mD+aSbEx9YDU1+QbLKWgLURA/0R948mOQD7a2TursHF3lsVqfFMa5wMHf3v0AVrtrtx+
         /U79RLOua1wz7xSmyPcFG+8ygWLsJjRjgjhEy7b5LqDy3p4FnDMmOkRvFkNgvRf0X0gn
         KW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=KlC7kz5Wd2GugrQzeadNEBgbSiUKxvLtosrmHbuGMxk=;
        fh=nyi/Fz9RYZgYJw0WA7ErhvrQEGlHf+Pi1FFutkLsO70=;
        b=soF0iYduwBiVllf08SH3qJBQBDE/An7cNEKBHBGxI1PbZsuJbx5WAcE2E5LFpnJON5
         8h2H+S4uwMozXqIbITfNtDmBf1qjmZKCjhiJ83U/U4WFYNFjnlLnSP3cPQ8NU2kWr1YW
         SzSwjw6i71EIdHCKbFA0HVueKYvKXobn+FcnO96rXLlmnubKhdnCwQMAkwRWeohdOYNK
         /ki4a6cgW6Xa3jH14iKqAHxwga8iOyAWM9Pt1VV80gwOSwDfxQKKdKQflZFTrXRXefHk
         SI7RjCtfyjMQBzVG4X31u9NmhsygzZCXWzNTLpNbO+NeWGkyR+jRjuf06SodGCo1xcHH
         c/DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794540101; x=1795144901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlC7kz5Wd2GugrQzeadNEBgbSiUKxvLtosrmHbuGMxk=;
        b=p+yKKFSEqRUjbz47fBwoJzJkS4+jhIUzdjZZZSJ0azUfzJBRj5DHk0RgEvku/oYJxo
         XxcqzyLF3WMhME6fBoDP+MsSVr/fV3oX3jJQBy0FwS5rOXOZYhgJIKxrjh4O7jZS/MOd
         HPhv3+N//W02rVjqCkp5DD6PWaKm6pkVcOTmBgAs69qYezPxCuC5P1udn2MiPjTn5Hox
         rmmWjAXCjA1y1up4AQwQHY054NrxA1WZB1Fp+fNZ34v0JSv2b/oIxvcrB/mI4ckheFe7
         xrqFDzO/PFUEbh8XoMu5qiIHHdWIzrAOWm9eqUUWS1LHGyzjjqF4gHwTi+XgzArqUMXF
         kRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540101; x=1795144901;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlC7kz5Wd2GugrQzeadNEBgbSiUKxvLtosrmHbuGMxk=;
        b=udx7pANIBfhmKBnFaqASbvvI9p0dhRoI7gR/r2SZ3XeTL89pyC52xGOulZb+z0/GCc
         eIYJee4tZEqK01Oy4DB3+cCO1CCIWJqHEK42jgGArMvM2EzdSJcmggoi4UlJIbB9GfIG
         yVAzty/Ic6wjZgnNNbqtjGn9yGV/8RQvpklfufH76hmzsf1pqX7ziAsP0hYyEOjUQSI9
         Y60LFLaaaC9ajTskrskjvSnJxxdBb8kE1VfalQiCn0SEGhEtLugkyuIlqt8Hmws7qqME
         TOaadibKSRYw+kynhSpMxcFBG9UjnVtWycmao4oX+uAEkuqpPUGkrMDVkIc/QvR5JWbg
         Tu7Q==
X-Forwarded-Encrypted: i=1; AL+hErGdiKakn0PtOi7hkb00Q3HIy+VzLTlPDKdws7PlC27YWKMpgfSDiYmE6RDu5X/q4tfBBnrsnxnDdIOs7Js=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UYSW28cJxpLSnl5GcTCrhTzlRZcHVRbAr4gDTr6JxJd4B1FWx
	NqNGPlvuig3XfwiTjxvy/vK+CqZ84QzQ6mMScXTtIJac4ZscxklN44L6Y/i1wnotkeZndzYGsIg
	SVLvsZYJB1GirTaRQqSqjpg2YYO3vl5o=
X-Gm-Gg: AYBFou22uonEUt92jLCW+1LcwIF3/QNAYgbaD/Bme/ojU1rt6iQj8S+Tt4H4NsjXaMF
	PH1lSmUznEYsPyXXVj9sTPtI8Fy+UwuyJ9ddlxwuI+CRN3hqTX/IDUC9hahpnofqCBMJskb9Vug
	2wIesIZTZp8UACN1UT9k3aJCMMbf8txc1Ob88UZvjXl2/+kYQ4vb5NADkeJyZ9X/1IAarb28wZ3
	K5TXN/EBj9Am6/2+bdTwvx7R3svP61EEg3VMfs32y9aGej0V8ItOJfL1rE7fLCDx0c9+Iiv7fbd
	dLu97wkQjUfvzphW5jEKvMjn6L02fMYneMH/EczvN+WPDgb2x6oeIzQ/odA4E7bD15GaJGeW46H
	hXnXtihE2I7xiitj5O3OvowtieM3rY+WNhp69
X-Received: by 2002:a05:6102:c86:b0:7cc:2daa:90ee with SMTP id
 ada2fe7eead31-7d64d74eefemr361865137.15.1794540100262; Thu, 12 Nov 2026
 19:21:40 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 12 Nov 2026 19:21:39 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: enderaoelyther@gmail.com
In-Reply-To: <27d2c98928859d47b2c3cf76870d868882685809.camel@sipsolutions.net>
References: <20261028141751.6728-1-enderaoelyther@gmail.com>
		 <20261028141751.6728-3-enderaoelyther@gmail.com>		 (sfid-20261028_151822_083722_A5EF7A18)
 <76bc126fb977cac0f0a124fc80eae9fdb803264d.camel@sipsolutions.net>
	 <CACHPgzw-JeorCAX-b5jjd6d5=L0oYpPdGtstUSaz5sPKZE2HsQ@mail.gmail.com>
	 (sfid-20261111_204546_211086_1FE84B1B) <27d2c98928859d47b2c3cf76870d868882685809.camel@sipsolutions.net>
Date: Thu, 12 Nov 2026 19:21:39 -0800
X-Gm-Features: AclHuK80WoaUMO0xvfMrBMj1IE6hAop1teGb0zcH15s2lA-M5re3Tk-IE5T-ugg
Message-ID: <CACHPgzyGx7trDo1+j_HKCNaQn8K9ZE_nxDX5ZxDfx=U3kxTAdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: mac80211_hwsim: serialize radio removal with
 frame commands
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, Javier Lopez <jlopex@gmail.com>, 
	Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> hwsim_tx_info_frame_received_nl() just doesn't do anything that sleeps,
> so it could just use RCU protection directly?

Agreed, and the same applies to the inner transmitter lookup (txdata) in
hwsim_cloned_frame_received_nl(). Extending rcu_read_lock() across the
full use works there, since teardown unpublishes the radio before
ieee80211_unregister_hw() and wiphy_unregister() unconditionally runs
synchronize_rcu() before ieee80211_free_hw().

> hwsim_cloned_frame_received_nl() uses it twice - the inner use is not an
> issue as above, and the outer one is just acquiring the mutex for
> synchronization with ->started, but given that mac80211 will sync RCU in
> stop that's perhaps just not needed at all? Or maybe hwsim just needs to
> synchronize_net() on stop.

The existing mac80211 grace period is too early to replace the mutex
during an ordinary stop. It runs in ieee80211_do_stop() before
drv_stop() invokes mac80211_hwsim_stop(). Since the hwsim radio remains
published, a new reader can start after that grace period, observe
->started as true, and then be delayed until after the driver has
stopped. That is the window the current data->mutex closes.

Setting ->started to false and then calling synchronize_net() in
mac80211_hwsim_stop() could replace that mutex. That would be a
different synchronization protocol, with the grace-period cost moved to
every radio stop instead of keeping the existing per-radio exclusion.

> hwsim_pmsr_report_nl() uses the mutex for pmsr_request access/swap and
> GFP_KERNEL, but both of those could change? might need some more work
> for abort though, not sure.

The abort ordering is the difficult part. cfg80211 moves the request out
of its list, calls the driver's abort callback, and frees the request as
soon as that callback returns. The existing data->mutex therefore does
more than protect the pointer swap: it prevents abort from returning
while the report path is still using the request.

Changing the allocation flags or atomically clearing pmsr_request would
not provide that exclusion. Abort could observe the cleared pointer,
return, and let cfg80211 free the request while the report path was
still using its local copy. Avoiding the mutex would require a new
request-ownership protocol that abort also waits for.

So I agree that direct RCU can cover the two non-sleeping lookup uses,
and it could cover the outer cloned-frame use with the stop change
above. It does not cover the PMSR path without redesigning the request
lifetime.

A hybrid design is possible in principle: use RCU for the frame and
TX-status paths and retain a per-radio pin for PMSR. The reference
version instead keeps one lookup-lifetime rule and leaves both the
existing stop synchronization and PMSR ownership protocol unchanged.
Its trade-off is the short hwsim_radio_lock critical section and the
reference operations on every lookup.

I still think the single reference-based rule is the smaller and less
fragile change overall, but I agree the RCU approach avoids that
lookup-side cost on the packet paths.

Thanks,
Zhao

On Wed, 11 Nov 2026 21:34:12 +0100, Johannes Berg
<johannes@sipsolutions.net> wrote:
> On Wed, 2026-11-11 at 14:45 -0500, enderaoelyther@gmail.com wrote:
> >
> >
> > The underlying problem is per-radio object lifetime, not command
> > serialization. get_hwsim_data_ref_from_addr() returns a radio pointer
> > after rhashtable_lookup_fast() has already ended its RCU read-side
> > protection. A concurrent deletion can then unpublish and free that radio
> > while a frame, TX-status, or PMSR command is still using the pointer.
> >
> > I reworked the fix around a per-radio reference count.
>
> I'm not convinced that's necessary.
>
> There are three users of get_hwsim_data_ref_from_addr:
>
> hwsim_tx_info_frame_received_nl() just doesn't do anything that sleeps,
> so it could just use RCU protection directly?
>
> hwsim_cloned_frame_received_nl() uses it twice - the inner use is not an
> issue as above, and the outer one is just acquiring the mutex for
> synchronization with ->started, but given that mac80211 will sync RCU in
> stop that's perhaps just not needed at all? Or maybe hwsim just needs to
> synchronize_net() on stop.
>
> hwsim_pmsr_report_nl() uses the mutex for pmsr_request access/swap and
> GFP_KERNEL, but both of those could change? might need some more work
> for abort though, not sure.
>
> Dunno if that's better overall? Maybe, maybe not.
>
> johannes
