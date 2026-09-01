Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F33624A9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267125; cv=none; b=ENG2Bo0bS+rL7N22z3LTj+llLDDPEOgJoyaJqxr6VhyugsdX6heQMEUCJoTDYFqnm62hCWOPnYjqpKG9LFvKHHTKdzkx9u/yFgoNWxMMVE74pP3NX8z8DDiRx7NyoVe8vIr1e5uKOhCHduChpnKqwI19QtVO17UZRjZn8RXigcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267125; c=relaxed/simple;
	bh=FoHZTB9cnvppjq0kX629ApVhBBw1l7eB1Aok6qcffPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oqYuRAEVpBBdaP0XlJH2x8eR2R9ildED2NvGB9YPnLfcEdnGHurPY9uo53EzRqobZ6Kp0jfSYKP5g20WnvGt6JtXczObIyhFyMNtVNs2TbN7tryhDbcCrmAUiLAPSfJrVgjmM1SaoWATqkGj4HbK0K0Wn/KUn6UwJaY6ZSQEZ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIJQEnjk; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIJQEnjk"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a5ded53570so1257213a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267121; x=1788871921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ro4d/Tm6ZUdjMArZWZHciQyr6YK8EIE6H0sDY06CCw=;
        b=cIJQEnjkJHwV28JNFLASVzY1tWrbALXvJXLRO5R76ELGwRy7FIT/i01U9O2dfy2xKT
         0QXr0eqaE4o298cPITolxt5+fDjFHI03WQ2Vt3bBWtCh2E+ROu1ibrTcYWUctYY1iaw6
         gXIKpq4Hy4HWyOgRAHJOMuV9U04EFBBjZJbWvEtBpSSAF7BPvPRde3sXD8gxnCa3XjhK
         aS77wDwXvONgYoNhuAbn6p+GMQfR3fQqMt8D4DxgRigoJfu/1D7Jc5YkvInc6i59aJnA
         iOUeCW7dUrbgfe+DjPq4kLMsm0TdvEsdlN60uwQUG8y6He0QSnumT7HxjxIx6b4F9GfB
         Ki4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267121; x=1788871921;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ro4d/Tm6ZUdjMArZWZHciQyr6YK8EIE6H0sDY06CCw=;
        b=OAerBHAwz3DgaUQoMS6MXGcsAbu5bBG1TuRl15wVNytbBUcZPREna808RhoZp/AkZR
         bSeE7v4g/nsFZtFUJjCc6mxwTC1gFHfTEh3neUkqIUrQoIWe7oblm/GFH53R8fPV0BRt
         LESzA8wFM6Ko3bK/zA3SLHeBkGuDZX4IZx1OVl28hnMNo86+Eqd9B59nSspkXHm2BKoQ
         CaueW02yFhVgWfnonteu+i6mKApwUk8EirhfIgbjqthXU5Nkr8XNWeKbQWFyoDVcQe8U
         zn6fpYznpppWp6hcODnzU/4YxwCQObyaB4vKie+MDR+P5u+nHzyaruiN+YSlZxjN3ePn
         vcxw==
X-Forwarded-Encrypted: i=1; AKwUvBx/lUYQiZ7nVWwSlS3WtNMWPR6Fd4GoA9LW9XembeIIrqfv7KQ5Sl8mEtyObzapVrjSIuvFTfSJMaLDFYU=@vger.kernel.org
X-Gm-Message-State: AFuF++k0GCDNUWOuXKOeM3SYWhH/vkGINUW8+5Q1hKr6r1DHdVYNfNRa
	ylpwY/ZMJrzg7SIZ65P7PkEi+Qy5e42iefxoEeSF383RYUlO1yry3qUf
X-Gm-Gg: AYBFou0pC6KIapUyujaCLTmBLLRUiuIyj2bUiFjZ4aMLw2StMpGsqWLldt8Eh9fwwjD
	EId51gPOJYhlu7XUD4IqciMBSyogsu3+tY8DZ63orfx+DZHCtv1SEIUcOGePcaRgTa7GmPkpFQI
	AFjGHrUcvHInso60FDNjuM29N0rikPjU+3si1NaIw8xWrP8paTL6MGEig0F9WUHfyaOsnsFzm+g
	/5q982c+jH3ESlyWDMV3HnhqrYTIjqLmDxrnxW4XiTnjUL/R2nRfj7subSsoUeIgGezCZ7jYgnB
	ogIBvRhkwAxq2yVwzgfT3tw3DkOInInp0T+7xdWGwPkJbimK8qEl00WIIlYRoVXAsGUakWXRHH8
	Gvd1GxTAkHkYcWe/yq3cVSJhxv0E7hRF5rXGxJ8pF2peBL6ZBHPvQpxK+1PafOV7Pueyor2aKCr
	2m5La+zWZDMEjo2IZRVznGSXHCRiqtPDFNqn9kHnWUGSqaNSjZB33k1BbD9Pnjhtw3ETLMCBPi5
	oSMT0/1WrwGBg8oJMeztQwcJQ==
X-Received: by 2002:a05:6402:44d7:b0:6a3:87b7:b5a9 with SMTP id 4fb4d7f45d1cf-6a60d3b4e36mr16460049a12.12.1788267120995;
        Tue, 01 Sep 2026 05:52:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66ccb6c1csm684717a12.6.2026.09.01.05.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:52:00 -0700 (PDT)
Date: Tue, 1 Sep 2026 13:51:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mohit Mishra <mishraloopmohit@gmail.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Nikolay Kulikov <nikolayof23@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: convert swing index variables
 from u8 to int
Message-ID: <20260901135159.5417b6b5@pumpkin>
In-Reply-To: <2026090155-cruelness-plus-404c@gregkh>
References: <YOUR-ORIGINAL-MESSAGE-ID>
	<20260804170137.20708-1-mishraloopmohit@gmail.com>
	<2026090155-cruelness-plus-404c@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Sep 2026 11:43:11 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Aug 04, 2026 at 10:31:37PM +0530, Mohit Mishra wrote:
> > In ODM_TxPwrTrackSetPwr_8723B(), Final_OFDM_Swing_Index and
> > Final_CCK_Swing_Index are declared as u8. Using u8 for variables involved
> > in arithmetic calculations and lower-bound comparisons (<= 0) is unusual
> > and triggers static analysis warnings.  
> 
> What warnings?
> 
> > Convert both variables from u8 to int to clean up the variable types,
> > aligning with the TODO item to "convert any remaining unusual variable
> > types".  
> 
> u8 is NOT an unusual variable type at all.

Indeed, but doing arithmetic on u6 and u16 is likely to be less efficient
because the compiler has to mask the results (on pretty much all architectures
except x86 and m68k).
But that isn't the reason given.

David

> 
> thanks,
> 
> greg k-h
> 

