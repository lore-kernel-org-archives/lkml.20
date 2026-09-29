Received: from mail-qv2-f31.google.com (mail-qv2-f31.google.com [74.125.230.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88104F4747
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.159
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674789; cv=pass; b=Fq+C3K6SeT7PXDSYl9jzx8bVm02JwlCMCuP1JV9I9izJUXYsCHXhGpkSavHyNwX5mxrQM6jLx5j30Xh+lXowvfGq9EdEr5jWgzkuJhV9YZczAPvWpEqJ726l1L9h6w2u2trYM1DZUF98NZIfuk9dcmo/UZ4tRz01HpP4excS+X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674789; c=relaxed/simple;
	bh=4Fx1hsbNsBqC3VKjvsEDDx9MU+xRaeZ+qVCoVR6pot8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9jhJqjJ8YTVxFpPQOKElBR7Z7ZcgtIrR8gE5pK2PG4j4qBgg49yhAtmWillXPTz9XIRij1f9jWRwkY5NYpB/fWSftASKOXCwdv/lFUtlNAggCnXd7hgXSUi8rUUgN/0ChhlGmbkNYh6CAv1ahu3LTw+KvZYg8m0ryCWJfFFqkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr; spf=pass smtp.mailfrom=dgu.ac.kr; dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b=szRhvFec; arc=pass smtp.client-ip=74.125.230.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b="szRhvFec"
Received: by mail-qv2-f31.google.com with SMTP id 6a1803df08f44-91219376dd6so45898796d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790674786; cv=none;
        d=google.com; s=arc-20260327;
        b=jAcJ/AJEAE/CvIK8POaozG/It1sMI2LmxbO93/9vne1aRW4kqHdGF7EgaNkVrgkS9C
         J2mAibPvQV+NZaX3R+QucqijihxjeXZt0blmwgifnbQnSPEtGFad8NhYeRSD8LUTrF/5
         Lwma+Htl53TeVBkL/PRxaP2tyTZwdxkOuYAPlYmIohDDyrI+PydwOaL8qFsaXQoF5/yU
         4IrxSBfv4YIlYwttpZIsKlCezP8nN0+LAZSSWnu7gLnYiBd6wxcaCTWWXGp6i0CkJUC6
         qxLjlK4GGB8Gqv2vTfGlzCmiE8ZP8hSS5cGZDWqHmcJY6biu1G0+ojo0r81d5JVgYfYu
         vf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O6zidI4zTNOj0TGHNQTaUW2cJSlvWPwFzk8EpxAP9bc=;
        fh=W8UVY0Uor15b1vlxWBMYo2sVdVFHgNPNw9sdrV0LlFQ=;
        b=JHm/dQyi5M2s6RpDFJDm6bOh4Jj49T1+u0p1bso26jfz351Os+jAeN9BxmHDvFYoj1
         ZWQ86RjsiFc5QJ6xN0oajYF22GIWBKAMdA4ChgT0UahWttHKNXlGsksSrstXLkxHQORp
         o26XMzTOdezUgDOROeSpSIKoygsqt+d8WrJTKZzemflJ1syPJLbSgBU5d7cjDUMgMQ36
         UE3rR561pYhyGwKIINNSXvC64JwOnvZUg05hmA70QoBQEboe80S4IF0WZNm5fWxWHgqK
         GmO3SMKYzfdATXmspPE1gyEj+x9m0r8CeZHxEuIK7RWjzEyM+suQ9QnZ2xeiw/MAtwPD
         X9Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dgu-ac-kr.20251104.gappssmtp.com; s=20251104; t=1790674786; x=1791279586; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6zidI4zTNOj0TGHNQTaUW2cJSlvWPwFzk8EpxAP9bc=;
        b=szRhvFeco190+gQ6RuiEz3SLT3QvXYRmxo5Bxn1BjucRxwYJdrCVLqSSSEzTafyXps
         9HoVlIQav+tTwHzrPp2xmoBXwyygwoRcOp1A2wBKbbbqYeAlUY2SGiAC930jSj1vGtYh
         xVlINKXhECMo9yCrHaAV5yXM5Zm2hhV3RVKhjiCSoHDIl00xliSr76ZkmxWtBNMWEk8O
         fCMzEV8anTZnFvprazXob2Ir3VB7156O0eK3JSgvoLBFzbFfy/yqAtIL9VsDniRZc529
         c+UwASuaKN2TbcGKQs3LmsZe7XW6V2vd9oiCB0i1ebhblAy+cVSXB4n40PHFUMwR/yMv
         WlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674786; x=1791279586;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O6zidI4zTNOj0TGHNQTaUW2cJSlvWPwFzk8EpxAP9bc=;
        b=mmxxukci7qEsrQ3CD6adZOGKNhMfqLxjOJQEaHZs0P2ZEfqMjfSt94urZwwsK8KEn8
         iBI9Bc14RVrj047kfoQGRJDg07n/R/GaJ3J5FsNVRwIkhdDo7To2U5ec9lMuWYfZy01M
         1gnImgogHbpZeQm6LoDa++YgVSNa4OAHCeIgVNHZU9cHiW+uh8pAxWQQGBatLBXyYmfv
         peXDdUCpvlh+ZXSkZeT7LRlhPcjGO8bgdDqLDDEPSXUozfCGswCr5HSfHqufcBDfqSYF
         WPBhbGXR2h7x7AnmKuEh13L56Iq9IW6aWuDObaeruzwcm+uL46mM9ALIJ+LdHV2ZAmCX
         f5IQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOoX+DoRwuZVFeGIx+jkRbgNKVjai1Qg8koKk2LAhzbqy5iQRY9hoXKHpmNus8Ynb1V15Qm0skI9gX4RU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMhBKRpD+YWbEGwC3WgYF2FNQoYxRDMFIedqIYsLWAZd8VvQ5O
	0IXF0iwmE9z2wYUFiwdNGdLb/j61fN/XlNzj4FiHy62DZPKqu9wOAhCLfqC0APjYzKPH/AP300I
	rRMErvqy3sF5RQy1G7DpUs2XIoHrfrdO/XEpDdzyU5Q==
X-Gm-Gg: AYBFou3sgR1QaUH/lkC6XCB2sYM+2QGiemb554/8HAnV7E85OhR6hqd+z7PxCSo5EFL
	suhWkQ2q4UnE/AVQ4XLQjgfbhWqaakh6CEv22h7SikT0qbnhBVL1x6ZiuO8afnXUUM9+6MJEyO8
	EtuHCXnMnZAd3orXK+TfoDKcqP73gqY4xzWe0Ac19NCVT+L9Ci9aHsZuHI16bbRk6P26Jn3EhdX
	dBOTbmiTyknjekxweMdWp1C1pCIQjxyO5xPJgGRYzi3ClmR/WGqMH3JVMefFIiYo/P1vTkbWpDi
	dkcicAZjQPFL4aYT+WRLOSEj6W5g/DvrprFTw1z9x/WMALT31IdFb1azqQ==
X-Received: by 2002:a05:6214:4a88:b0:910:345a:f453 with SMTP id
 6a1803df08f44-91432483830mr243057896d6.36.1790674786553; Tue, 29 Sep 2026
 02:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179066531783.50175.13377521828379196177@dgu.ac.kr>
 <3a95d0e5-7969-4b0d-988a-ead62b06b6f5@kernel.org> <art6x0XpWcT2aUyy@gremlin>
In-Reply-To: <art6x0XpWcT2aUyy@gremlin>
From: =?UTF-8?B?67CV7YOc7ISgL+y7tO2TqO2EsMK3QUntlZnrtoA=?= <ts930@dgu.ac.kr>
Date: Tue, 29 Sep 2026 18:39:35 +0900
X-Gm-Features: AclHuK-TKGufm6-Y2TQLaPocUQkmdwuwTHOz-rtMMxexWAdTwmo5Rynwnpmf1gk
Message-ID: <CAFPGN2jPGhcWVqa3k16RWMaMR3TwKyhFbYYF4D3L6L85T8E96g@mail.gmail.com>
Subject: Re: [PATCH] mm/mlock: fix zero-length request normalization and
 integer overflows
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Understood, and thank you for the feedback.

I sincerely apologize for the poor code quality and flawed helper
design. I will be much more careful with commenting and ensure future
contributions strictly adhere to kernel guidelines.

I will drop this patch.

For David's question regarding reproducers and user-visible issues, in
case it is helpful if the core team addresses this later,
here is what is observed from a small test program wrote checking
/proc/self/smaps on an unpatched kernel:

$ ./test_mlock
mlock(p, -1UL)    : ret=0, locked=0  (silent success without actually locking)
mlock(p + 5, 0)   : ret=0, locked=1  (0-length request falsely locks 4KB page)
munlock(p + 5, 0) : ret=0, locked=0  (0-length request falsely unlocks 4KB page)

Thank you all for your time and the review.
