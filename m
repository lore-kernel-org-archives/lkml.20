Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7687148124E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280690; cv=pass; b=RBBlrrHnfkXwkBdAPxdZDW4oX6iinIbEet5jAm4iERQlZffWJsateU9gAgwsI7hRpdbMGyCrtvkL9OkBfE0flnt0iUP9xcAlW8DexM98iLUMtZvE0xyctGf0nzk0oUqjknCwLgr6MlXrmY7JRDZWbI3GO64yUT23Zlql6SqXuE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280690; c=relaxed/simple;
	bh=nlU4+bIAztJ6sx8wlI8snYU2Yuu311Zr2b171MA9MtE=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qpD62MGUFi4yq5fdWYYJCZy3XghOn/YDBMynR3vHjiVCd6P7Cx4ly9uXAbQ3fGdhCSQuFE/bU3vNnvgKcnfWWPqp/F1R/pnz7/Pfwgh494vWz580nu968SG76hvgIaANkY4tFy9yaw+EL+kHy2xq2Mx/UT7PkokdCVh3PS30rFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3W70CNX; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3W70CNX"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a65e66555cso3892a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280686; cv=none;
        d=google.com; s=arc-20260327;
        b=WXwVhMQCK6pJX1wuh1mUM8TgfwSlCqZX85YKDkfDKbkIMNnS2Zb3UKaHJnD2GXtEtu
         J+ceE+pht0utKv0T3/gn14evhkaFiRWSbWHNsKtGeO/PBfhIvOkWtwZc4VQ4AmH/h2p+
         m1LoCCEB0Yh9BfBXaSo9TlmBxbP4QQDbK8IPHS13TzhShujBVM3cfxJJAL+V8l4Qa/nm
         lpF8DvhhaOf2xoPI9Ww6mqal3PCNAUmVTsa4ja4N1UttP9W7DBbqGsFwe5SBvoOU5bK+
         wHmH1neo7mNWDF9miJapQxUQYHhO29OAn+kHS5y7EUzJntX3KBa/YPtkuwVIY6gKfGN/
         /upg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=nlU4+bIAztJ6sx8wlI8snYU2Yuu311Zr2b171MA9MtE=;
        fh=p6FJFueBTyTmm+s7vuvdWDNR8PCVA1wzswB9VUtpA+I=;
        b=S9FejeZ0B/z2yaBs9tn70+p9pBPUK8L2WySKV5g98/K13QlZlFSUzXcZZ6MhhhnQrB
         n//1adwZKVvVPzMxdcVYVo/YhWOasKJWBIM77rFxvNN8NDPGpAaR850rPLBOW2fEeNOc
         v6H1r1dFJd8S+aH56n8V24X0vdiUnH3lUVPWI9QF5SP9PtfAzGEAKoaUvCqrEO1LWYQm
         e9N9TVUHmhCgzAUpENaTpz/wOJrnWlGHAmSXntfPPJORVo1nHkFnODWgvrAMjHviF9Oe
         WCkhgSb+SkP42tjY1jQvL3nzqu11qT1qoQM3uG+ElaNgGokDeYwgJpTihkRJT2r7dHLG
         PKzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280686; x=1788885486; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlU4+bIAztJ6sx8wlI8snYU2Yuu311Zr2b171MA9MtE=;
        b=P3W70CNXJFZmfSDCWgcqtOzGNwzdEzmjcA35irQDfJYNCNVKSTFXMzuHcIr6tNL5K4
         oekXlQtGLyRO7VWljnseRGTVqHcAObcASy5fq8P7333UdYKv7jwfgJ7DBtnKMrydC+ns
         gZFo6h8wmu0orGsGQN0YDJBneuVzBSP+ceAl2j+FybqMJ5QtIqoWVuc9x+JPNgvxCyBh
         49/30BHNTZq9OTYLFA6Yle50rEzHGoqFuqAzsacs/4DGCzLKUb7DIHbkkG39NKVOc3+4
         mKWsX7kXhxlt7gzj05cM0Y2S5x/S8/mUJqYt8wMNIjIQR02SQ6dfp6ROM7B6yhs0sIAU
         ijaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280686; x=1788885486;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nlU4+bIAztJ6sx8wlI8snYU2Yuu311Zr2b171MA9MtE=;
        b=hBZzN5M0bHTbiFyQruJ1mBAyfr87MxACvZEyAsmyzpec/3+AU+UjGieQxSYHgs9Wyq
         Tc15IPY2o95Da/cAGD48G+eWFmsIteSFXB1bt999/tPHfhifRC2t4GzHFIBmNYfLp0Oa
         bnocRggSAGiWIpbqLeYGl6x3fzMrRxxmxRbnB4Wd36fUl0T0XsOiNdVKrmMM3IQpASH3
         HTHD7DrX+PO0LqpcVe8OqYr18PI7qQAayq8pkvzAA4bJkgpJFYUiDSTSqYuwFnrBw3CZ
         p3EQB7qqjLAoubPx1AP7IlVXoy56f60WS36fvyWYmKQXbEvkJdNevIY9H6NY6unWceDv
         Gw2g==
X-Forwarded-Encrypted: i=1; AKwUvBwCQX1do2Jx7lB9xT93EUp6Co7SWn9V5VKmgfgTKuz3Smy5e8j8siWIHT9Wkog8uTy+RGgayVeuHXHyp5o=@vger.kernel.org
X-Gm-Message-State: AFuF++nXMKKIwjKhAkJfdwBB5frCuCB3qS06Xsz0q2nTbjII3iKDeJLS
	FGbi/2lJmmTOcMnw7ppAXYG+tpFbpMqHU0PYpIWpCtNqdUrfLZ5crW8MUPBXj1WYvmF/oZ9m/G5
	47YzddgSR5KF6uOYdsFmc5cDY1Vgdv0c=
X-Gm-Gg: AYBFou1IIW1+SPthoyirmbnL/Pj1d3Lo7UPxUNfLUNQF2oGdmuhtXpfkh3vL7Jc+bJK
	3ERo1pv+j7G4bMJztz7HMiwtaLt+0wpZmIStgyQjGGGhsZOP8q4WtEkbeQLbuhafHz5KLPvenSI
	YCzo/25pzEUzkNCjBzAWDkGcSOIetJZpv+NEoimA+rX9cIFpU3h9cLldWyUZrKgSQW1N9cvv5VR
	gZpdlRWO79XPbhvv7Wct1nIlPUMo9bxa9czv67sBrqYKC4m81l3ey4Hsmk5tP4DL4TkQSnR8g+9
	kabHvvqqujSr/BkdDVSJtRmPdknNWrzap5iSO8Bctpjenp/1vVBQ2kFYbEP7qLuJpL5hqsFjn6N
	wvg==
X-Received: by 2002:a05:6402:24c9:b0:6a3:714e:f5b4 with SMTP id
 4fb4d7f45d1cf-6a60d3a5f5cmr18267643a12.9.1788280686015; Tue, 01 Sep 2026
 09:38:06 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:38:05 -0700
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:38:05 -0700
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CACOAw_wNy_rFe9fC-+iHyEmsEDRtB_CWA2d+gTvV0DjhLAC9CQ@mail.gmail.com>
References: <cover.1788213716.git.zhangxp1998@gmail.com> <d6a28ec269f24e0ea20f125671ae0e2802d384dc.1788213716.git.zhangxp1998@gmail.com>
 <CACOAw_wNy_rFe9fC-+iHyEmsEDRtB_CWA2d+gTvV0DjhLAC9CQ@mail.gmail.com>
Date: Tue, 1 Sep 2026 09:38:05 -0700
X-Gm-Features: AcwNN1Vi5kjEyl9qyBD6MJJIlkPqFmttS6KIpCPnuqp0vSZXoHy4rSb08lG1KTg
Message-ID: <CAH=xXfEwscibuAp1nnibVZx0sPbtefQoj+zQHmBR9n4nT_SF-A@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 03/11] f2fs: describe NAT block layout dynamically
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks. START_NID() no longer has any callers after this change, so I
have removed it for v8.

Thanks,
Kelvin
