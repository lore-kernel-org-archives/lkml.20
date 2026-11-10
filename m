Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318793;
	b=cBbI8ehdZrErEqOtiE0cuQIuBag+F1DBxeZXg2+6c0tYpCHVn7rlFnwbsKJc0LfGhRFa
	 x2qeG5QUXZLhyQ5tu4xzr97ZRrFIYpB7s6W0FLOZ1J4MuX1hsVO8cKzPKy9npxJpbBrGP
	 mQ0/1OqZsxgRFQBoBqxiObSexYSEnhAJhX4m4mpqMx96xs8TVZfgFetbI9tzqvu4+vwt5
	 VtiCMa9YH5q9U/GjzWgYIASCpOeIcQaV9llMbfb/EXgQpLA2f/+Veg0lqJOdhkvoqmyjw
	 Qj2CFlThDgK2ImBDbQQ6FGzzY0tiL1PNFmnfJhFvotISJR8qOdsMJhdiDbhcpDPLzZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=d4NSCnrsDvRbwBgqs2GERpu46FtgR0tNjhD+8taDJQk=;
	b=ZJjKKrxiu5isIdGIZu+bECmoTM+CwtaUiJSrb6VF+61ehYObtb/MF4AeApnjZKizeJs4
	 eZGYzoeg/aEc79hsP6eRv2L1rdQ+c7BG6Wwguc6ZxAPfArISIVTvSPgWe5pJB1M7kFGfu
	 92NpY6XwlTbPWwnLAEfUZfwO3CP+VyA7WULQw0jCozgQINsc4ndfk19A5gWR6hG2KUUoV
	 gl3YlZ9RD1hPUL+dxlYBPxYF6FvkywZ+Bi01BDoHu/KH9wN5dT/IwSxCNzuqzCzDR+EbN
	 7hkhXJVS7UnSmxYoe7Vp6vI+cb6/pY/31T1XjNEBThv0V08Q9/TG+FKlNNNTAawtxmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teLs5hGE;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B0E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B0E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teLs5hGE
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so16736195e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318791; x=1794923591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d4NSCnrsDvRbwBgqs2GERpu46FtgR0tNjhD+8taDJQk=;
        b=teLs5hGEycwkTQHU/tkdfRWfHUVLf8FvNrr1j6fIqA8AwZspd3ALDl77yFSJq3YWmz
         5fQTLeLFDFyKbnoHpEegpwvsXpoPDpyRRax1A5+FUymd+p62uImzs0BFrmhahhf71Uhi
         WF1VAuaQDa0HA5WqfsNkFapOLbnjQFyrvAMMs0SjV5+1oI7cv0cxDMV/v8/rZmFg/DKN
         4KNU1U8uOBxIpPBlAEx1R7Nrt5D01mpXSNl6RYSWYKrcSaT1/iq35lsE5xKDjn7BJFGI
         aZUy+7uHSH3zyXuR0I9VOLLmcJmgMpna9rTxgF0of3s57PdOZJIQ+CIgrsFbScZCLUH5
         X3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318791; x=1794923591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4NSCnrsDvRbwBgqs2GERpu46FtgR0tNjhD+8taDJQk=;
        b=Gfq0SSvEQRybmoXAHKWYUEChROl3pKMfIuczD9jEuyImAR9QNTSCmY9xj92jhRkhMX
         fcXeV8AP4KPq1+4XXoj8fzviJRctNEQThUcQs9X3JB1UOrk5uc5S9WBwbNT8evljAs4V
         0lT4sS52LH5nj/jRnMyPLMju/mK+B9ySItFHIAw3cLeJjeEjml8eUbXd/+8sWDUVyUlS
         yu2WFQhdBsGF2z17f3DV4Z0ev0MLXHOK/iguNbxZ2Az4ySmeYfVInKmJzbRoRXQAgL55
         cQ4fk/Yo5vjb05hTr7i1KBmfJP4V/ATpaQsvgXjvm3Z0QObr2Ew79ZjxoPt/T0T89Dqh
         eexg==
X-Forwarded-Encrypted: i=1; AL+hErHCLYw8boDo14VhGZa/4IQhrNnnxtv2vY5sf4ERifEgQ5ximjQHKs8KXb1kQnHXgMAfRGGq7pGjVMgFpr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/97maDV4DtGOE71QTwrjSTT8wLhh8pJ9956Ucr4+Z3zCK8NLlh
	7jappHLvU5mP1rWVsRoaGrmI7sIDVcXyixeUafgRkOglHqfjEiJr6dN5
X-Gm-Gg: AYBFou1sOjKk2THccgBLwkf0ocOBhMnkvFnH9gjUr/n42oSJ3vpcO2W5G39uHlvRzro
	Px2vNEvNVtngMQd3Qxn7vv76UGwPOmU1lAG/iPJcig1bGzri8HPnVdIPpiIlA4fnwknSRvyxQKI
	meB2FKnoxg+BQW7fOZzySFVg4nc9cJIdmbMYg5atpu9fR0tW82/uS6GiH8rBW0UVKM8pq59ZJEn
	kSaJHKoHSLO3sIwP5D6lhC+MAUvT6Unxl7gAsYYUd/CIGgbQRUk24MRnzJTW0A0XgN4NWy1+0NJ
	VAuwf87yk2xtTf2+cZGnJvcNj17OMiYllI1ek79n9xrXjApIxwB2d6ncCEWU09IsAGq0EfYJDYp
	hmJqAflJGiDKZF6jYNIkmWqxmY2LiP4DYNnOQT/C6V53vDMSJBzscbyzMXOSI83UaFKV2ZLgbU2
	botjkil+GCTlmxg5D9akgShK89BZJyxSO1JbJFJ52IZsySglBTCBUYn6kOhhiJcvuSj7d/WVJXJ
	2BPY2Rte7+pW+m3TBQ8uFpw2ymTcxjeOjEHdI4hVBXMSRadOQkz7aZJR9mzTc3DH0xtrG64WjCP
	1NXnB4QgY79yPRzgFFrt48cI1Efvv/vJroSd8w==
X-Received: by 2002:a05:600c:8b66:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4ba02351009mr49636755e9.31.1794318791044;
        Tue, 10 Nov 2026 05:53:11 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2c5asm104797705e9.5.2026.11.10.05.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:53:10 -0800 (PST)
Date: Tue, 10 Nov 2026 14:04:41 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, almagui@kernel.org,
	john.fastabend@gmail.com, qmo@kernel.org, brauner@kernel.org,
	kpsingh@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	emil@etsalapatis.com, ihor.solodrai@linux.dev, sashal@kernel.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH v2 bpf-next 11/18] bpf: Follow PHIs in bpf_scan_ir
Message-ID: <avMkeelRyvo-Bzuf@mail.gmail.com>
References: <20261109170550.141443-12-a.s.protopopov@gmail.com>
 <8ab81e05089b4f5ec1ecb1bea9e6dc5cc2953a67f16e9369db005c2f3f3ee242@mail.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ab81e05089b4f5ec1ecb1bea9e6dc5cc2953a67f16e9369db005c2f3f3ee242@mail.kernel.org>

On 26/11/09 05:42PM, bot+bpf-ci@kernel.org wrote:
> > bpf: Follow PHIs in bpf_scan_ir
> 
> TL;DR: Nits only: in bpf_scan_ir.cpp, isErrnoRange() duplicates
> errnoConstant()'s errno check, so the range is defined twice; also a comment
> style nit.
> 
> > diff --git a/scripts/llvm-plugins/bpf_scan_ir.cpp b/scripts/llvm-plugins/bpf_scan_ir.cpp
> > --- a/scripts/llvm-plugins/bpf_scan_ir.cpp
> > +++ b/scripts/llvm-plugins/bpf_scan_ir.cpp
> 
> [ ... ]
> 
> > @@ -34,9 +36,40 @@ namespace {
> >  
> >  static constexpr int MaxErrno = 4095;
> >  
> > +// is Range in [-4095, 0) ?
> > +static bool isErrnoRange(const ConstantRange &Range)
> > +{
> > +	unsigned Width = Range.getBitWidth();
> > +
> > +	if (Width != 32 && Width != 64)
> > +		return false;
> > +
> > +	auto L = APInt(Width, 0) - APInt(Width, MaxErrno);
> > +	auto R = APInt(Width, 0);
> > +	return !Range.isEmptySet() && ConstantRange(L, R).contains(Range);
> > +}
> > +
> 
> this isn't a bug, but could singleErrno() and errnoConstant() share one
> check?
> 
> isErrnoRange() has a single caller, singleErrno(), which only passes it a
> range that getSingleElement() already showed to hold exactly one value.
> For that input the width check, the isEmptySet() test and the wrapped
> ConstantRange containment do the same thing as errnoConstant() below
> (width of 32 or 64, then N >= -MaxErrno && N < 0), so the errno range is
> now defined in two places, and the !Range.isEmptySet() test can never
> fail.
> 
> For example, errnoConstant() could call
> singleErrno(ConstantRange(C->getValue()), N), or singleErrno() could test
> the sign-extended element against MaxErrno directly.
> 
> Also, the "// is Range in [-4095, 0) ?" comment is the only function-level
> comment in the file using // rather than /* */, and it hardcodes -4095
> where the code uses MaxErrno.

Yes, thanks, will fix

> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/42662799554

