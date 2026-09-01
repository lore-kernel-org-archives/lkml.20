Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4B433DEF7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250848; cv=none; b=NRPQOjZl+5jfYJ+gGxMpc3dUVb7mJTpeqjuUvTPjfdqanYq3D6lTNEUWFH1ufwuL7xL2vI81SUBHpacN/lcVj54o0Z87Y4n6eC8wJe+9rxDpR/xTAjHlj6IBItjxueazULVMvG23Q53yMPdN2u5y9Eyayw6abESeTBLPhvUj2Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250848; c=relaxed/simple;
	bh=qhbhwYzIfNcQCNDj2Gqm8SMMNPSr+C9838EPGmm9yX0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJCVpXpgjmLCOb61UewWFD/C6330xDQnblIv4uVpeFpsQG9kNYPSPqy3XjAKTuR2hSavyQrhaZecaSJ6P5RojdourhF8WnMYtzoNC0ZQO2wX/IH6nBUhecxR5b303E7cQi3dKXinOdwl3nLXuOkwCAoSbN+TO05aCl6j5MSLdhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDKBqXOn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDKBqXOn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495590dde14so44081105e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788250845; x=1788855645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4qFvf3uf3u+WhCf7btsk/PihbgYG+RBQKhD/gmMwWkk=;
        b=RDKBqXOniLJOlaRmX3sPjtjqhps4tZM4GNWI55FLzFnvUcuqZK2d0VtyBcCu5j71KB
         5TjkOa0RqfrAvtwYvulfSs48OVlloe5fHXAitRiqECHMYfXI307xGo5hoPfXwvpOqFSO
         1d9IKpb2Ek/LWVymssYakRtevNiwSpl2BLwK3asos20aRjsMWHIJ7BQg8UIwd5zmH72o
         uMqGW3P07ICMrkiYeZB0sq3KNlkoaIbVi2/pDki/hKej89dS20rM09UZsLEqvQ5mErXr
         nVJ5LFCj+i1dIN5XGM8/b8UM9hSMrFbqQkwVmAHYtXj6vNF0QD17+U4xlEY7cB5miF1M
         Keyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250845; x=1788855645;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qFvf3uf3u+WhCf7btsk/PihbgYG+RBQKhD/gmMwWkk=;
        b=MVrRST/TeGqqcLzLqLky2LTNblvoLDRwaFAIRIXeo6BrTB1WbqmWlqb+5n58p7FJH2
         +6aW0cGKcOVs7Cbr50ekcdRbAUqfU8vvdHhT/YoC1zm574D7BRsbXGjRZCM/PIRkf5NY
         DLJe8LRMegRaSTqoipaIrZ7Pe1pBUPyER962TXxxBsxakuEWpJsAzJD0YeIDHwbys1Kp
         3dugE+J1sDEz5pnGzV1wkPV5BiqEYaqFwZa8lgyFoqIiO08JqYBKRlzMriZm7IrQMvgP
         yxyftp9rb8v1lb2fw4l0jXir5G3hVSAa0Ob5m8yUPhpczlWfH1+6tax6jqnNPED2MUsd
         wCeg==
X-Forwarded-Encrypted: i=1; AHgh+Rof0PMtcyeLNh15TDevbJWbWJHiOpmZTsgETJ4WKNUj/WsSXUkU+LSU6iin++HQ0fj40x3EdUCf9fV3OFU=@vger.kernel.org
X-Gm-Message-State: AFuF++mGjni2VL+a2UDZM2wnK72dFjmeXU5Tbh6N/jbTtubqr1MCiTUT
	xvxZbT2PgjgxmYZZK/Oore54jKSZwl4UyozHqJA0049Bhfe6G9+1QUqj
X-Gm-Gg: AR+sD10CqgSF/HLVFcCHhbrE83wKjmlexabJmmif/yCOSum5xqufGMZaHFyg/oWa3PY
	IlxMs6hhsvHGjY3CRC/mG6wHs48QGw78gDLO6F7YX79bJeNvZDbWQHNPif5XFn4GZE+0XhO6n9x
	b1U2BDFPsU13t326S8zhWqfnhnr6lPP+gzmmzAF+mnIO0ZHRsH3XTPP9csxx3sNe3dJtSZCKJjK
	W4sjUbpOGkuJTZff1rBQL+20ijDxC+p5AYTBsXC+FwsH9PdxM/YZY/3zM01S3n9S+nBLl1K8Alw
	4Bstl1UICrFJNngiB+kbMHJ/vatkCovEXeWnsP6FAl5H7X571/rLujbTGsAXcOkMCkETWhWMwia
	k/Fry6YQNO3lpjR2suI4q38AASTuuyHuDzc3p5Zx//OknNFkrGkmjohPLlRdn4y+nTggdf0+en/
	jKAfMaW/8wze9S7XNsTVbE/aIgsjtJQFS+sVN6ehj8rzoZ15lOnLmJ4dx9AdnZIHv2A1i+oDC1H
	ILIuMgejYWnRj5XmIeuFgD3/g==
X-Received: by 2002:a05:600c:4f4f:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49cdca4097dmr121503735e9.13.1788250845287;
        Tue, 01 Sep 2026 01:20:45 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm219895505e9.0.2026.09.01.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:20:44 -0700 (PDT)
Date: Tue, 1 Sep 2026 09:20:43 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Luc Van Oostenryck
 <luc.vanoostenryck@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260901092043.7feaf5d7@pumpkin>
In-Reply-To: <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
	<20260831214437.15d6ad34@pumpkin>
	<a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 14:19:10 -0700
Bart Van Assche <bvanassche@acm.org> wrote:

> On 8/31/26 1:44 PM, David Laight wrote:
> > On Fri,  7 Aug 2026 10:00:56 -0700
> > Bart Van Assche <bvanassche@acm.org> wrote:
> >   
> >> Using a __bitwise type in a tracing __field() definition triggers four
> >> sparse warnings in stage 4 of expanding the TRACE_EVENT() macro. These
> >> warnings are triggered by the is_signed_type() macro implementation.
> >> Fix this by using _Generic() in the is_signed_type() implementation
> >> instead of an integer comparison.  
> > 
> > Does adding __force to the LH cast remove the warning?
> > Is so that would be a much better fix.  
> I have tried this, but unfortunately this doesn't suppress the sparse
> complaints about the casts in the is_signed_type() implementation.

The _Generic() version just doesn't work.
You need to explicitly specify all the qualified types, so you need
'int', 'const int', 'volatile int', 'const volatile int' (etc).
And, IIRC, there is another qualified in the latest C version that
would need to be allowed for as well.

I suspect you need to change the TRACE_EVENT() calls to remove the
__bitwise marker.

David

> 
> Thanks,
> 
> Bart.

