Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067B24BC018
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496934; cv=none; b=nzcy8lgxSmdUvRyh4T/ogO/BUp5qth95Sv5NJEEFGLTKCF4UsoMfhQL8xd4AGNMm5bgfHw6hpWWe8FTD64SbArHHUK87YaSWyhLXg8xV9uEvjId5t3KEqw7gRD5zJ/MFkLMkQtDhUcXwGUo/TG4buUl+Zp6+/mY69/e08wxwbAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496934; c=relaxed/simple;
	bh=ExaSFTGuyajSGkffCmNiiOT5gX4RugpQ5HKd+MnvrqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bp6tYe6+noJfu0+bpmulef+m/xbaJF7ffa16F/sB9c5aqNN/rRyFliTCbv5uTwTyuqSYAc8b2350jeOHOsJ+oUAcKii4tUHfH8fjKXA3ksdGxcayYoaJo1b2eJ21c42WVxUuHuQni8HMITMgmdaxWyfj7JPzaSZsNEmjSxLB00A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh54XB8Y; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh54XB8Y"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so14254f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789496931; x=1790101731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2OVh9TORSOFM2eLBFL8+9fGSDQsNIFtP4Ssj+M+8PKU=;
        b=jh54XB8YWCe1aiMSLkQdoBxdEiOsF67lTi+047bm/pHMz+mYRwDd33G8uIgxpNCm/4
         DQbRGkukQDu5Tz4RsHIVbiMmaKe27za/IegnbSbl5jE7E0NNo5QiG4Q1nLR5SyBVHqX4
         AWu6+I1d/vcDZH5OmIZK2+rWDHDcn3QTX2GZ8shYKqParQ5C/H1YHGodOc7IyrHhEgL4
         lDyFUZZH1RhY/BSmwLYORiaPe4KvZ2DJaZ0sjUaBz8/2hIjmacg9uQ7ow4HbBGX90cCD
         ieWbBJjc4dNm9gxAe5kDBgfmZedaVM/8v5ktwn9TSwwRfrdFM3x3AoscqG3ahlh8NDUC
         AZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789496931; x=1790101731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2OVh9TORSOFM2eLBFL8+9fGSDQsNIFtP4Ssj+M+8PKU=;
        b=FVLuXZWe8kEKIxIc3GkDWomCO7XVfzBwQFiLWwhJaSTXieiwBr1m56nyyKXYW70O7F
         SxE6UVliTq6Joj0P/bVy2XHfaEJwGQ5FfqeTM6t3zqRClaSPp/iZy8TsGBHLLSwTYwes
         ohXieOGWTMINiKkvMqgoV1VCGTP9F7qw8K3uG9lEh/DTphg0cxEJYuAH+YY7koLYqDej
         5hoAzqltT8kOsdr2Q7Uq1ItDL7LZVw0rSm5ANqOJPjcEuTm9wJOvvXih10NCrgpEu5yE
         8ldi2QsrwpuM/Ob08tMClkk2c06IDp1j6fkVJBPRt4ROk4Rz57VjvFHQssnNHGoTTsue
         aILA==
X-Forwarded-Encrypted: i=1; AKwUvBzlg/6no0qC7cYOtSRlSQCX4e/ZcF8m7sbEmiKs/im1ZTP38kLhRoLadH5YxZSgtwWWgucec1dq1s0Hz4o=@vger.kernel.org
X-Gm-Message-State: AFuF++my7ofAs494nm1Ild7YrJbMjdwGvYDKBUa3Q9UjfnQaqrMu7PR0
	hcpK05rZQtTaMN7aYhZr7FgrLhI3eh3kQnnT2MtOUBg4aN+NcCFzz7qO
X-Gm-Gg: AYBFou1NcYXHHFqOOPxsnqfVL94a/mz9x706JzO2t8bB1Ewgbz3MmoqegjlJrxqy/x8
	EuZ+xjTZvnd2O77ZswUZ4dwQfdusq4o7yRlIQslSk04Pfk/wigUf9pgGk0vqNmdZHxMTtBUQe/i
	EGIax78NIDgwnNiPuLwHWIW10b3bGIdCwV/MupaKhLVP7pqf+384T0svBcuU8UzltNqcQ8NNNNx
	P59MWuX9AGJIL+nj4pbds0sB5C2avGFhlm8SI3OAT18n6hfCQrtcll9fMCsrxxDmefFwk5pwggy
	r952mgp6lqwagYaXfCSk1/QsmucFSab40Ap/7EXfMjvDLUM4I/v0Pl9QkWQGXAbWjj+xkQmQdJH
	J4HBlNwUuXyFQKT5AJBB8YUpQG8KYe1Qf2UaWwn/AF0ZuE1PE6I+R9Al/mR73jV7q75vD/8t/DF
	xYb4se8dqGN9blyCuwhbAkso6ebh5KqJAiPvt78RGBg0bG7fxX3iip0nEmX5XCrf2mk8u9Lg15G
	N+z7LJHGgmjXKqgegkytzPLOLkYAHIkmNlPJcfUdxxJ/ofa43a2r8XtNsNvA0ozFdfygTPsFse8
	sIYZDeK5wWcBihMhUd3QJem+3WkUmC7PlkTJTYYE5kjQzcAdmKrjKv6KOPTY5Q796C/zdp0Tgjd
	FMIm2DhhExJUpG/Z1/zRPiw==
X-Received: by 2002:a05:6000:184a:b0:487:bef:31a8 with SMTP id ffacd0b85a97d-4870bef3228mr766622f8f.0.1789496930649;
        Tue, 15 Sep 2026 11:28:50 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-afd5-c801-ec9e-1a2a-2fc8-3f88.310.pool.telefonica.de. [2a02:3100:afd5:c801:ec9e:1a2a:2fc8:3f88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fe7esm805784f8f.6.2026.09.15.11.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:28:50 -0700 (PDT)
Date: Tue, 15 Sep 2026 20:28:47 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Haren Myneni <haren@us.ibm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Dan Streetman <ddstreet@ieee.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] lib/842: add KUnit tests for the decompressor
Message-ID: <aqmN7Wt4f-DXGEhn@gmail.com>
References: <cover.1787978627.git.kmehltretter@gmail.com>
 <e9659617ce2f1466f227d562f47b961f340ab3c7.1787978627.git.kmehltretter@gmail.com>
 <CAMuHMdVcZ5cV4-HrjLYfFKh6UshiVxq5eXCNyp0Z1k_SMAvF5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVcZ5cV4-HrjLYfFKh6UshiVxq5eXCNyp0Z1k_SMAvF5g@mail.gmail.com>

On Tue, Sep 15, 2026 at 02:57:55PM +0100, Geert Uytterhoeven wrote:
> > +config 842_DECOMPRESS_KUNIT_TEST
> > +       tristate "KUnit tests for the 842 decompressor" if !KUNIT_ALL_TESTS
> > +       depends on KUNIT
> > +       select 842_DECOMPRESS
> 
> Enabling a (modular) test should not silently enable additional kernel
> functionality, as that may increase the attack vector for a product.
> 

Hi Geert,

Wow, good catch, thank you! I'll prepare a follow-up to fix it.

I also found a few other KUnit tests using the same select pattern,
so I'll look into fixing those as well.

Karl
