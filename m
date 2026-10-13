Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6B24E4C29
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934788; cv=none; b=JQK0bCNW+tOJvpaigYiApxdz5O1zJ1UKoukzKEIW6/o4RAb1kXJwY1sdaHiRF5eGdTIRtmj7/J03wnN4w2iHl9dWcTgd9Ert4at5Hh/PLuDTjt41Zmsk+hWJHZ/GYSODsmsYHvwnmXhpt0cOiK4a4meGIKn0f4+SBq+PrJg6k24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934788; c=relaxed/simple;
	bh=S7O5rBI7dXG9qYqaJ3kcjTgDq/GWo+vP5SrrNxSzbw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDBdQwvB1Glj2SXpoMjoZiJIaf+9Qd/TKEj6//HR3HUqg453gMCNthjDOBckSTWTgjfy7scjz4YWrgzNfnZh+YS25mSim0Q4baKgUOZL538evhlABQwGJOdFmS2fREptDojeBioDvhC85T7Mh7Eu3VzvLzpYCn3T3iZlJQx2wGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SKzDthuI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SKzDthuI"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so615680666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791934781; x=1792539581; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIvCI33wWNp/DAvpxTsS1BgBSu/jPazhvP/vqfwVrKc=;
        b=SKzDthuIa1Usxh5RqL+WWtpYoPLHaEz5r07M0dMdIrUErO85+WQSf7XJSLZTDtU/LC
         /BOr77iljyvAUgnIp3+5oPVev6lQIXAfMC/du/LG4FfjXoD6AJLQ/WDltahRMUZ+4Tv/
         gbuiYU0DDpkfDFVyVb+kFDLwGxSltqaSpqTW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791934781; x=1792539581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iIvCI33wWNp/DAvpxTsS1BgBSu/jPazhvP/vqfwVrKc=;
        b=G8RGCTGWx4yvX3TPb80si+etuT4aoyF30MPNjVP37ss7BpQbnl73dZspPD4P22agUr
         MgIqocrX4Aaw2goS2F1rQdIDO8cmnvfV3OgUa+wfY7i5U6TtJxULp7thdJcWcK8q79gm
         f2iu1DVBFNDyEadG2/BZ0++1kjhhTyvCFXwW22QEKkU4/6HuS3Pdj5ywhmyEryRD8TDC
         fsOxTEm4f5xuUArBkfdgA8Ijhxe/hPb/OlFQu2LVbYFt9/NPVvDdlLGD70XGxBhWGiAr
         v5ZUbG0z655PoDqfyCyTBQ2e1Xo/lpxMFlUOY8S2AqlSQ/pxuBJNkFSiDqHmjqlEyuq8
         6JKg==
X-Forwarded-Encrypted: i=1; AKwUvByfDBwK6lKo7NGgpbMiZXYOu4JC76wzou6T++BPDcttqHiz6SrgrjSOsBTB44FuD6nYukluQi0rwGP5vwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtgDTB5fKDfwUC3n/UqEyxZiZ4tRP+MfQKnm0THoUJy7P9ZYr2
	Iu6ozqqZt41n6JO9nb11jph/uq8K69onj+QHIotPauErU9r55vHBKCC8+AmoF/sYJZQL4uUwCOS
	c+QViY2I=
X-Gm-Gg: AYBFou3gza0wKl9XyUxiLVQ0TNC21FlIuDBiAHtHvILGa+KHIaF7s+rA2xBCdhWrE0h
	l9h4Dvot4huGqDFBxy4XIpp1Zg3jODDVKKWH2+hk0qqajAHtqY74vkal3zjaURnmHrcdjyaUx7a
	JX8nPsD4feo4B8JnlmU8qgYqYlWz5z1wc7y8MfJ4CuAcGWID88TBDcCFvZwo6mc8G3Xz1EnVkGX
	JzsYjH1hNHd5QMnXfkx3eu359PHw3zfFKogZDP86Wix7Ob2WYnZugfgsGdcHUTRdJDVCjbE5jfn
	SjiNlbidYcWeum2C7xrrkj/GtrIqRCnhsL/ah4lwZCvldRsz+AFfEABHE3dKShkqqlNh0owV3qp
	RMBO76mSkI7bkt7cRaUWZmpZV2opYn7y9soKlZzGLGr8d91PxG8Rh6yyMOH8tUUUS4DU+bE9+jr
	pUq0gdvPzTjpydcHwc/7eWXBUxZ6QhiKvzg4BhlFHx7u3YmqzqCPV8UKs0uf7z1NKW42n9iVN2k
	pJ5lpUf2DoO+1gBb7ZeF4BVB0NGN4ViBfDKHc9rvk/vPpkcRXB6I0f0IFo=
X-Received: by 2002:a17:907:7211:b0:c2e:4c59:a3a9 with SMTP id a640c23a62f3a-c31a9d15da0mr1363098166b.23.1791934781410;
        Tue, 13 Oct 2026 16:39:41 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3498276daasm322161166b.51.2026.10.13.16.39.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 16:39:41 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so615679866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:39:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwge7M5hIghoJgYDDL78bU3cv/WXlQcw75OoWUVa+KcpO5h04tGxZwtPvDft8ItFe67ofNqsS96J1ZyEVU=@vger.kernel.org
X-Received: by 2002:a17:907:9712:b0:c2e:808a:f781 with SMTP id
 a640c23a62f3a-c31a9f8bc7cmr1313578466b.34.1791934780887; Tue, 13 Oct 2026
 16:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as6vBoWQGglxXxb0@thinkstation>
In-Reply-To: <as6vBoWQGglxXxb0@thinkstation>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 Oct 2026 16:39:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiCe2H33izZHDyDHEhcFwUr9fXZk27-WZ2vn_pn5FcZTg@mail.gmail.com>
X-Gm-Features: AclHuK_t9rjdo0WDDtR6IOloPl-ku20PpY-3DOTUKMlyPe1AIPutzFIkxJJwGqo
Message-ID: <CAHk-=wiCe2H33izZHDyDHEhcFwUr9fXZk27-WZ2vn_pn5FcZTg@mail.gmail.com>
Subject: Re: Improve page refcount scalability
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: David Hildenbrand <david@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 15:43, Kiryl Shutsemau <kirill@shutemov.name> wrote:
>
> There's a race in filemap_read_rcu_batch(). If the folio is replaced
> under us with a new one and then i_size is extended, we can read data
> that never got written there:

Hmm. Wouldn't it be better to move the i_size check up, and then have
one single check for that

                if (xas_reload(&xas) != folio)
                        break;

case?

Otherwise we end up with two of them, one inside that "folio != prev" case...

IOW, I wonder if we could just make the whole

                        if (!test_bit(PG_rcu_free, &folio->flags.f))
                                break;
                        smp_rmb();
                        if (xas_reload(&xas) != folio)
                                break;

be unconditional, and move the i_size read up there too (I notice that
the comment about uptodate got in there too - PG_rcu_free indirectly
does imply that, so it's not *wrong*, but it's perhaps a bit
surprising).

That said:

> My branch contains a few more changes that address downstream effects of
> RCU-freeing the page cache. But we can come back to that later once we get
> agreement on the core mechanism.

Would you be willing to take this whole series over? I'm going to be
on vacation starting Friday *and* do the merge window next week, and
realistically won't have time for it. So...

                Linus
