Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6200553977E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998152; cv=none; b=MthD5doEz6+/Hf9Kba42IFe5O6Wlhi8pE//mzAxtBONJfKZ6IHQp7dgLVuN/uoMtX2A/JCIAoW4aFVddsdtJNV/Usn0c6PV6OuONeWTfnD1yI9oLzxxTmUNfky82O4W9hoBrM/Zgn3IiIzBSiPk149Wtswp6ZDUMR8Fk2gzBP4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998152; c=relaxed/simple;
	bh=XRIa7Pgvo6VVKoIKoi3E58OdE0xB6nok5Hg1DXJoqfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pduCVf4xwwqW5xUFxIPkiJmnfheUsjT9Wich2+WVac9ejJx/yVa+kogOlyE6fyFBiz/ohcirfALObFT7g6K1/IEFwLNtSlHBYwgRhj3FTkObXVAJd5D+afF/ekQWWCzBojhYSzOq1iGwOLtNW3DojeUg1sAMYBS4hRLyhmBvBJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dQcNSYVR; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dQcNSYVR"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso5565014a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791998146; x=1792602946; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMIXwI+O28aTWWq9S70Hh5SSta/yBvY/YtBDSjKEcWQ=;
        b=dQcNSYVRzbgYGiR2wHmszZPpLfozbN5Y1ISL31sstTwia69cq/tz8K6sQWxc7d9e3z
         r0+hBttJafDSPLM4rv7AdELDsFKlAap5G5bOH/15CHEz2eVung7Iz38/+KjexhlK4lNr
         DfebLKf8Ae/Saz68rN+aise7htmWlxDTuJLXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998146; x=1792602946;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IMIXwI+O28aTWWq9S70Hh5SSta/yBvY/YtBDSjKEcWQ=;
        b=bmWvYbgT866NmVWSicjQCLI4SFWPzX5TcLO6lkAkQorUafqcOHvjpfTmVbVhxLY153
         PyPoNUOVmWB8gF0fx/tiPXP1VSLPMqv9BFWukGnF8oTeG+lousZ3tkx7zu31/nRVoE3C
         PNZR4/6lJeuW3L1msfp9Lq8hFdeymz8IcmAuFlwqfaspL7WVCa0YMLMnZWGmeJlgIJHw
         wU/41J5ftJpbwQ+GVVh3A0I6ZYwNlh6NnLRwAMKQBdKAA53LUPitPjbuNeYKRJYd2WRa
         5GTJQCM5J07kcVnpssfwdi/jOV6f5cOSf+/YyEWA7Hkb0Ay7AOXBpERFYvPHREsTHpEn
         upbw==
X-Forwarded-Encrypted: i=1; AKwUvBwwTcnQK9k6XqfvGQp1AlUSKRbXOhg2s543gEX4TQDAcu3eS5MaG4fseuhgDpHJ12IhhERrWK3JvufiuFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtUtJAQcJelzxXXY2iXuElu0hQY97MJo3njynSYYMuwHEQXZ6M
	ewYQLTVY1C84tH0Wxggoq1QKBqAuZPJ1KvkLo/SIlRlXtJ0Ccy7QB2rHa3iqX9SdJXRL4Rb/YLb
	QNoLoOqGw/A==
X-Gm-Gg: AYBFou3Wln0l3IXgkfYEf89KSmxlBWqI5Cg8Vbesc8kr6zMcr8hHZx/KkFLh1w6cNzl
	fSy0crLj9hzsgIMC0aZVSWdmcEi7p5R2edyJrwiLTWXWO/usDQTwmF7y3bJRlvllmrYu6B5l9hv
	S98Y8VILyl4kMrSb5PjTOhgsRoyzA1mxfflIjH6nLkpOFLXyghSAanee02IGWbmJLi+W/uukxRz
	cXp8mwbAG0gPikHCYN1njqmSca83d12xrQiIL9r3R/xQEIlgLNSmY+llq/yYABf5x/VI8IuTL9q
	BP9zAL11BQURe72STbkZARLGUN6LjmczeJSSoPvOnXdiZSZX8dEQSrm+Dwt6DGKxYUUw6/hooRc
	kdVg0ZJdmjx9GdAZ1HUNLGPc/uPWR5Y9s4Ixc57YNzSQgXDSdZb8/SRsD7uxkY7kGBj8+NoFUkK
	DJC4xhP2jf7VBuE1BkZVlax1u/wacWRfggOJn8to7Q/WI2i1DKdFuI1BaXhVbelsIYBLWEgLTUB
	RVc14G66DBh8tmp+cEG/maX2abHhdmIfJywlhIL+MYPXGHx
X-Received: by 2002:a05:6402:450e:b0:6ac:9a44:d409 with SMTP id 4fb4d7f45d1cf-6b17c1dec0cmr13946236a12.4.1791998146325;
        Wed, 14 Oct 2026 10:15:46 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038abf24sm1346539a12.37.2026.10.14.10.15.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:15:44 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so777637166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:15:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByTyL/8vd/71MWGZMc6H3tt/aL5FRzySj6kmB544DNl93PjZuGW3CsDJ3HqTv6WDaHAdCRrnee2xJpsTks=@vger.kernel.org
X-Received: by 2002:a17:907:9690:b0:c29:f0a4:a4f8 with SMTP id
 a640c23a62f3a-c31a96e4d7fmr1484999866b.0.1791998144070; Wed, 14 Oct 2026
 10:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as690Xcu7FxIDYjf@thinkpad> <CAHk-=wiak+h+d2tZ5W_MwRzatUP=hJKn7cpGjDxArG-gwgHLXg@mail.gmail.com>
 <as9-2cIuGuXwE2Oa@pedro-suse.tail5790ac.ts.net> <CAHk-=wgkoAuxNXga29nQ8w7GxdqR+4vPAUhPsbfp+gzKrb9EgA@mail.gmail.com>
 <CAHk-=whzkNzkBmCspHYd80D1Z=krDc4SgVC32=pJ5PtEgqSDrw@mail.gmail.com>
In-Reply-To: <CAHk-=whzkNzkBmCspHYd80D1Z=krDc4SgVC32=pJ5PtEgqSDrw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 14 Oct 2026 10:15:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wicpT0MJ7hFmpj3NiyobL6ErT=Q690Sod4iD7HT=bQRZg@mail.gmail.com>
X-Gm-Features: AclHuK9HqoL5WYsSIywkBsAxV0TH7_OPcbKjG6NH4NO6Sxx0TiFKxKFMs6FyK_8
Message-ID: <CAHk-=wicpT0MJ7hFmpj3NiyobL6ErT=Q690Sod4iD7HT=bQRZg@mail.gmail.com>
Subject: Re: Improve page refcount scalability
To: Pedro Falcato <pfalcato@suse.de>
Cc: Kiryl Shutsemau <kirill@shutemov.name>, Harry Yoo <harry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 09:59, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> That actually makes me think I should go back and clear PG_rcu_free on
> unlink - at that point the folio can no longer be read. I used to
> treat unlink differently from truncate/hole punch because of this [..]

From a quick read, that worked exactly _because_ the marking was done
at folio removal time, and then it was easy to just say "if the folio
was removed because of a unlink, don't bother marking it for RCU
delay, because there can be no RCU readers any more".

But now that we mark it at read time, actively clearing the bit at
unlink time looks a lot more iffy.

Not worth the pain unless somebody actually hits this as an issue.
Right now it feels to me like a "numbers go up" kind of thing rather
than a problem.

              Linus
