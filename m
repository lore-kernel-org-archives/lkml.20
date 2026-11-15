Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760758;
	b=EagfNTtn4aPSVHnO1Vd1hK0BEcW3v0A+cEgD1LsK7T3kB7FCURa5MtIKUh7eyuuhuNfV
	 mMh/XnaoQWznQX9oGwBd0DXi+Hq//4hTBRCNiWrOW9bgKVMWSsqjutZi4ep+IYTY/IcOu
	 shi/nxGXArej7zyGugIAG2O5hIWVHjLhkYL1nTH7neZP2z2kkboDFsxG9ub4S7Rhhk+96
	 Hx5BgFbn0zcN8Y2AzDpIxGF/DzyFrb/LQ8OmHztUlfz9qBG6nOSyhKZUWpbFbz4E9a7O6
	 x+lfCUIUWgC9qlILEFXHuS9LUm+xlBRnNVlql0BnMxdC4fhiwNLmW6DnUOLckRBdFZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UmhoMa5qOjQfqxqn+JWvlETY52OkJWnOSP142Rcwl8E=;
	b=f3pAfMPr0jMDXlxnosf/rMnfHNtbhOpaaeqMChqA85GQ+WsEsIFH3QYdwPUhmCXX67Bc
	 16qO4RRm/fnebj4dUyuDmVPVwfMvEEyvZTzxsSzGIQfRrbiU9XrBzbiQFsSEircHBsPbc
	 1J4sK8pegyWNnVF5Vsqp+OpLILg9fNgKMV405NvdwEfGbX5Dp/LlA+PgLR7c7gUfjVzAh
	 a69HiJeIYvlsXni075xm3oGF38feREd7e3+GB0JiBAZcClxUaf2DZ2AOmfBYyH9Ir4Zt2
	 VKYOgMfsEZzaRnxWPU2yhmc3JwIgepuD0zOUzqtp2uijWzQgzjdyo5fQ6Nb9vQi55uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L6z8SmX4;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312EB606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 312EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L6z8SmX4
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso19412555e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794760756; x=1795365556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UmhoMa5qOjQfqxqn+JWvlETY52OkJWnOSP142Rcwl8E=;
        b=L6z8SmX4Qy5J9LplPriFOCRfscny2TDlOtFy+uP15L5gcwBVvauz9ZWpALSTm1a4OW
         Z3yY8mfNo6TfKIwBJXuGC+FRs819SF+xnhl8rls496JM57D+wARlYBdbSjvg0z8elpwz
         DPt20p2SAl7TUT5Nb6E7elJi/pZfOmxSeoNdnawwlfi8s19HAUYCfjZbdz56KH1rfcEC
         z+fQj80leCMhhuxf1Ydq3kv63V4w5NBZClj6rL/3Bw/yKo6K4RRY+tv+x4nSXUuUrl5l
         XGR8SwiJj4NijLVHSjmD+tq7fAUGHnBbqnTQpKWoyjmAAGpf3wcIa24QO6v6yOTQLSml
         Tdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760756; x=1795365556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmhoMa5qOjQfqxqn+JWvlETY52OkJWnOSP142Rcwl8E=;
        b=iGHMmYdC53pBKZG056IQgN3H1/C+ougAWd8XJRtUrZC6LePX7Hm2FFlWU3Xq8AhQDS
         SxlerYbgUSdgU9NOBmDViLEByCa/5omHJzBNbaxIxSWGv5BNQskKk3zpspeE0SANOEpV
         Uy4ste1cdRLh77UVHJF0qNxh35CB4m13gvdzZJUTvlC+do4UCop2UlqVNNrT3WFhbkXe
         i6K/vv6/DimTVU/AFygFm4aHkbUSTTKhaiaCABtZRjGaSXFw68XeENZVI/Do6uGG//XD
         d2wyw4Q4DhhZncV9Qrqt3jbu7BatJdGmqj3gd3SOpajwQzY3bHYFtapo/ZsW/CqKn3cQ
         YDsQ==
X-Forwarded-Encrypted: i=1; AL+hErE1MPysjtXuNtPx+q3zlaB7GzPbsEUta0g0SXqhPeYV8uUmILuovqydtsBKK6GDzsR4P7is35Z9fYYvp1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J7+wESNS18xN5XeYGcyDcikYFlZdzC8mDpkKphAnDnMPtqJmK
	wDf4GkAXW+5U6g1TYfW+kxwqRhd7epa3Jju9zK0Xxd/ozisEVEPGS1ZgJP3y+x/Z7w==
X-Gm-Gg: AYBFou3PI5tCRbm1WEvLqE7BujuejIj4mNDUYDaMbAv1elr1ccCBO5sJtdt2VxccHcX
	H3HAMrGw6qt6ofZYA0wGrAUyn7HV9+f3jVkJVSuF8P3PIXFrYBkpuySxqglnAiBPz7QlA/LD2TK
	j8cd0qSpmkgpYNwnhH6EMtGxOy+q3Z4rZ4CgaK75sFvQ7q4KbKO/5Aa6trunk89dF3JYI08JXS0
	7iZ2Nm1ma+J3fSup4Yy+xaRucgBBJ/0eahxCn+agQ66hk4vsgE3kXKOYAfdxWWq6ptOhbly3/WU
	c83nIiCAzGUR1TuqGUV+ftBC2JrwTBGe/aUARL1Vl9AsSBZh7gIxPneAjiOW16Q/rQUQwXzBY+Q
	RoEBwUcJqeEX4zTEI3juP5IXdmPByI5noCECaCf07TpdzDM15Eo+O4jIju7hG4CCtgws5HYALDV
	/CcVi9p887uAjSPVxcjGZr/c4qlc1mdqES+P/h6qJzTX/kpe541sUMb8AK2Xkr1TOiu/ikcAsHN
	ybU2TeO0kvptFRGFVdYilTekZc7mxDc1x+9DFZ/Be79/LekhrQivH9L/iRk+hZcYm0XMmGWerOl
	ctCBHqaDu9FsRo6ViRTXbaGAMtRtiMRTVmGV3Ko7EDF0Hk1pEdbnd9h7Kk8DBcrweE8=
X-Received: by 2002:a05:600c:6085:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4bb55a8d7abmr168679845e9.20.1794760755776;
        Sun, 15 Nov 2026 08:39:15 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6caae30csm46425715e9.2.2026.11.15.08.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:39:14 -0800 (PST)
Date: Sun, 15 Nov 2026 16:39:11 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Joe Perches <joe@perches.com>
Cc: apw@canonical.com, akpm@linux-foundation.org, elver@google.com,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v1] checkpatch: Add context-analysis attributes
Message-ID: <avngL4BZlQTv2OHO@google.com>
References: <20261112151203.3129005-1-vdonnefort@google.com>
 <6dfeacb309d58f153c1cd701cd31a587151e9070.camel@perches.com>
 <avhgY9t0KVkDfEZw@google.com>
 <61e4f8997861a1188935435e78682c575552d2a3.camel@perches.com>
 <03c1afd39a3f167b960a982d1a933619855a975c.camel@perches.com>
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
In-Reply-To: <03c1afd39a3f167b960a982d1a933619855a975c.camel@perches.com>

On Sat, Nov 14, 2026 at 06:57:39AM -0800, Joe Perches wrote:
> On Sat, 2026-11-14 at 06:26 -0800, Joe Perches wrote:
> > > How about matching one internal () pair?
> > > 
> > > __guarded_by\s*\(
> > > 	(?:
> > > 		[^()]++ |
> > > 		\([^()]*+\)
> > > 	)*+
> > > \)
> > 
> > Sure.
> > Please add and use another variable so it's not repeated everywhere.
> 
> Reading a bit about balanced parentheses in perl '(?R)'
> non capturing recursion works since 5.10.0
> 
> Maybe instead use
> 
> /\((?:[^()]++|(?R))*\)/

Somehow it doesn't work. I have tried the following:

  my $p = qr/\((?:[^()]++|(?R))*\)/;
  my $a = qr/__guarded_by\s*$p/;
  for my $s ("__guarded_by(&mutex)", "__guarded_by(foobar())") {
  	print "$s:", ($s =~ /^$a$/ ? "ok" : "nope"), "\n";
  }'

  __guarded_by(&mutex): ok
  __guarded_by(foobar()): nope

Did I miss something?

-- 
Vincent

> 
> and I should probably rework all of checkpatch's uses of
> $balanced_parens to avoid all those weird capture group uses
> as it was originally written for perl 5.8 (thanks akpm)
