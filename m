Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAAC4A3410
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797335; cv=none; b=LdDVvcH6vZRS+uuoc4Amz5Opt7Gq4AEnPiZEkCmdmLEvnS0EXUp3pY/gFwJ9kOWKRoeVaDrERDMH3jtjJVYQoTe/SGfLqFsJ6ATnPQUqPYMchRdYJ4+SkkiL2tCTItjfEISMQw+eYSZ8dF4MMtMnZugQtMKrQnLDn7E1lRCrppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797335; c=relaxed/simple;
	bh=zUKr8FgVh67LoltOn3Jl/5CsD0UeykGgu059Vn4dpPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxwQKqxDpe/l+DVrix7YGcK2pjWhLrKfv5E29w8t3U+lv5MXRWXwHIbhSgO8xcQswGSGOMNUXYrdkV/HFCz890mUU6C1Ag/MHuLUVRQdmiuZl2W0p4a9mUTesct7cymfvhiEx6a2nqvRB32rXjOBvs6j6J5jvXQgVZXUs+DJhnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WZfRUAll; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WZfRUAll"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a68279dd86so4556678a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788797331; x=1789402131; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8Fr5CE1z54y1nS54PdcOC6w8v1/nKKQuhFr+nLIDlM=;
        b=WZfRUAllIPFi7AIY7uXwK+VDiiTu6Bvka1lSh4a++mgZ4TqOEiTeRBEg7yza5FDhyJ
         Xh/cyPE7tWkGAZ8riCdHPfz04sMdRetp2Fb2W3a6RrMSTnVMzUuxxYO5Ju3ZD5LLXKlQ
         kUGxteJy0ohY+c0Ca90TmQEkiOGgkA2Zpk+yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797331; x=1789402131;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/8Fr5CE1z54y1nS54PdcOC6w8v1/nKKQuhFr+nLIDlM=;
        b=e53le/KPlCcakT+7HJf9ABfdN2CaKrZ7RfT0yvkjWFttFp9cq5tEFNx0DzyYTJBzDa
         9ODLBJpZmFXmXfABp1i7I//OnLvtaVdRPhQnBrdGf83IvBjhwJ4JejxbuGyvraG5++Gn
         O6vN8mCXNPLEibTFr4GHW1qn4912Z9lb8CncI5qokQqQhM7/F+DVPJ20EDxRoFwxzi4R
         kB3AbtUYUKktlozNP/sMbCXnUmcuqScyCZ/KRy4hz5xL7asl+MaUzZnNeTosz9LctXJy
         fLhMwjPhRaRA0a5QhRFmWVmWVNKOkDrFqL253FzLCf+tu8F8mTuBxQDwSesdH7f2xNkJ
         iW+A==
X-Forwarded-Encrypted: i=1; AKwUvBwpTsqw3WSDo3g1bazS/tJuXnkT60H425TNdoMk/7ow3I+o4hz+qll2w6T/Ewz3dpDY+8cIKL9puY3zcAU=@vger.kernel.org
X-Gm-Message-State: AFuF++lgjMEq/NnSDcVK5fmo201N/3Fgkz/+HeFE8tmVsnpG8XXr3Npl
	KRqPdQBRb/hzx/EMQL+vxtwJuWosjOlBK/TiSWgq++D5g0vD/2YZoVhCQTBzsstGjgMo37Bw9XU
	Ndxukhck=
X-Gm-Gg: AYBFou1b1YI9T9yt1JukCmGlMmz1Gh2CjdDMJRuh9P40mG6ntmr5phyuFz5KMnvRJGn
	RTwUM/5Pb0EOR/DaUXeJPIVUPcPrCBoD1Pap53TtP4r/pxjSu838AFZYCPNZzRqFFsrnKoA+tgC
	g1bB80v5M8rVUXL75c6cq4R+BpHsDKl/3EGTPnEAZkxOeO8NXtxDsHTz5s4/4wWPeNlvYlYeP+p
	5UFAwJOnBhOmL5HwOyiIw0tDi7pnS8xJI6yAr1ppdOOAAIs/oPKdGvNmYTfP/Gh89aKPQM/CzDh
	xeZWbDGa7cTO5axt07wf6eMChSiKyprwQOr1RcPPx2SN1ZiWr0zHEvAVI431Il8LuisBQXeGFbt
	i0hwIalW2DhqTnp7yaZodEUuGiD+G+pswgAuS71ydZnehQYZg5JPx+f4YybSrCTQ+WioJOGOiQQ
	41RlmktxRzfc90rpEevINqpfa/0L4Z3vyVycA45q42O75iS0ncdJzscJCkGZ8WPk4HRRhz6lDu2
	LF/Kejdy9yd3l197nTts74+OZQ+SjcAI9WC4g==
X-Received: by 2002:a17:907:e00c:10b0:c26:19e3:e98e with SMTP id a640c23a62f3a-c2619e3f021mr496296366b.46.1788797331188;
        Mon, 07 Sep 2026 09:08:51 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261e24a9e0sm433761166b.4.2026.09.07.09.08.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 09:08:50 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so414617066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:08:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwd96G5Apf7XC0qyaC8ZL5d7tsq0fH9qsSYnSLIRvAvZF5EngnGNxGee0nxgYqp8pnfh7lm+9rFop+DLhE=@vger.kernel.org
X-Received: by 2002:a17:906:7949:b0:c26:19e3:e987 with SMTP id
 a640c23a62f3a-c2619e3eeb8mr706840166b.39.1788797325344; Mon, 07 Sep 2026
 09:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
In-Reply-To: <20260907084133.3696-1-david.laight.linux@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Sep 2026 09:08:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
X-Gm-Features: AcwNN1XeoFalmJ3FO6X8ZEgmD66hqdqJclYb4ycmOifCnLNf8ATEg2TG0_nkOlQ
Message-ID: <CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
Subject: Re: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock code
To: David Laight <david.laight.linux@gmail.com>
Cc: Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	linux-kernel@vger.kernel.org, Yafang Shao <laoar.shao@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 01:41, David Laight <david.laight.linux@gmail.com> wrote:
>
> I've fixed some broken/missing memory barriers but left the initial xchg()
> when acquiring the lock as a full barrier, I think it could be relaxed.

Well, it should almost certainly be at least an
atomic_cmpxchg_acquire(), since that's what osq_wait_next() uses for
the contention case.

It's a bit odd that the first initial xchg uses a different memory
ordering than the later one. Maybe there's some reason for it.

But even more importantly, that code right now  explicitly *states*
that it needs a full barrier ("We need both ACQUIRE [..] and
RELEASE"), so that *comment* would also have to be fixed with a why
the ordering isn't as important as it states.

And finally: none of that will ever be noticeable on x86, since there
are no memory orderings on atomics there: lock is all-or-nothing.

End result: I'd love to see actual performance numbers if they exist.
And any memory ordering change would require explaining why it's ok
and some other architecture to test it.

Or am I missing something?

            Linus
