Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3375581ED
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873183; cv=pass; b=Bd9w9BLGkU2vfGl/oqLp/2KT8YXHBCUM9skIcglXgzJ2ZwWYDC7ENAleAvwWGx6jnPfD6UptejMbMPXWxn4uzwZ1gCEs8h6Jm2RWMuIAP9WrQQxtDF/9qCjZQHybqKlg/kNC6oJuqf+L6+ZdKl5kC5xygh2MsdKUsgxQkw2zMTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873183; c=relaxed/simple;
	bh=Wz7IZrJW1UapIj7FlBxMC/F5YCmC6GItgtFzsvZAj8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnSHo1FPubyXFf/NJnCQwoUdEvk+K/T5tK+D0d9WriLy1uP4e92wUNxrZFuNmsuxNWURJ6P7255vJ58165+Ga8t4NC15EQvPxeMgDaStVlhZCC0O4lbOAWkkMFe+1z/nPHSzJiUDZ9fkf49O5s6n1KEthm8ES2O5sH5zx06Nrfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hthW87jI; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hthW87jI"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b01910b499so3716307e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788873174; cv=none;
        d=google.com; s=arc-20260327;
        b=rxa9uJajKuYYvx+ZgDLjhI1mwPHY6geH43hIsbeZP6qOym8dwZTAD4blzpoCJzure3
         4TQel6dNloIZM/63oo4TPvV3TiqXvkO70Y5ouDm0a3RXOpWD/khmQBd4o2joDYfP44+O
         6AwZokNiZ3gJE9HIZmjTGCg5wMXqXU7wXKkDfnL+aqtACxng/VlGXfSS9o3gSbocLeW8
         0fLBlalEiClz7thPUHmU3Fzd8CF8uU24OpFVXQYgSDYzuTsG92vteCyEdR2ScweLpLqS
         1JapB66NG9Mb0bl8Dt20jFxTAbkKfNEQkKnJB1E31/kJgmlYWDuXFtcTietpNqxGWwfK
         FmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wz7IZrJW1UapIj7FlBxMC/F5YCmC6GItgtFzsvZAj8k=;
        fh=Z2ChQqk5WR44gTibLOBpRL93XM0om8VldPtkfDHU4QI=;
        b=hEyGgMBB7VluXXq64t0z1WG21byp/PXmrNIgIVxp1VLTOMqK6uyR90sfae39sJBkOl
         Fi4OEFMS/Rx9BJdgKZfkyj9zkBNANTy0WuO4O+sIkhQYt2LSCK9MOtHFwDKXcMxnGfJC
         Md/bI3+L0pQvXG0z6t6cRvMxnArGudkbOpCfVQuJbI5hl5jWpviVBhQ7rEsOXWqvgDRG
         TUZn1vp3EIOHMYp4NZoUJjlU/tvghlF1OvEwJ+v/RSaX++MVOS5T5lJ7BjlSyBlWChGs
         FRquEz7MtwwfBUFPlsTrQXisAQbXBsfr32RbmWlsg9Dqr/bQ9VKUee+xnwZqM/31zc3k
         JaCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873174; x=1789477974; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wz7IZrJW1UapIj7FlBxMC/F5YCmC6GItgtFzsvZAj8k=;
        b=hthW87jIhBpiiYGqUdyOInp+OnGrNnQhF0JAGo5hZbptZEDHh8wBlgpQHcO3UTkzEC
         07gDn972zCPflcA3bMPRGsta8ymbolxJQvPIT93stHJoq8ptVgiabFk+bNCq56SfFiTL
         gtW68dm6dGFaGQZ/LMnkz0jEFs3VHqbBZSTb8IDwK46YyOMkJRf1SYTVzAXLz4/XSs8f
         SOeowigjbhNE5hvxALg9uGtXbzq5RNtC3d1ghLHCQ/hXV5dra3pfqu3uTEquwmk8KiWk
         76GPum4CurFPUopsG712juFDnO2hR02ZLfiRcaZUbFxOFwhrVbZSxj9DI5Os3sC95N5G
         +9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873174; x=1789477974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wz7IZrJW1UapIj7FlBxMC/F5YCmC6GItgtFzsvZAj8k=;
        b=CSueRnNo1jxb0HTsPwASwTdCsoOoHIFEYy8J3hBaNPYD3HfzeCTzYBDgp6flRQUjAp
         OTOSzzWhaTYr1g63KDxdv+mcYNH2HXn2kIIUvNGOok2IEs4FrBtnpzsaot38SH9xDlak
         QndXcy5toPN3m4v8TQCu/KhEcDiCmTs454RmOCPAGptkzynBNhX/e3LSEp4vJprzEUSA
         NGLhUwQGwOhTma7WCzbvp2er/jeL/0x8O67g59fSs1r+H1Vzz93lsE277Pe1w5k2v4Z6
         I3hZCA2fc7/W3/uaSDula9+EXcfUsw1zhyrsCEujUJ3EA/mjzvuPyr7gTCyvlAxlIBa2
         wN/g==
X-Forwarded-Encrypted: i=1; AKwUvBzD0h8vurviAqhXnMObdARY7nUL9zA9TBB3be6ZYHPS26n04OsnHU5H8chvlR0ZA43BdqlQwhcJRM9f1ZI=@vger.kernel.org
X-Gm-Message-State: AFuF++momIFg2YGP/6vYj4NCAwDYxf4HqCxCqZEneMMKPTfkf311B0XF
	o009VDKEJhQ6qL/ojE81GtqKLyPbkfd2iixlJI6et/PIzkkLBGI1294jgPPYlPG28rhS7ifYRF0
	3mlEtSu61DBpOQwQBoj0eRZWdNazMMzmdNfFEcuA=
X-Gm-Gg: AYBFou0N8z7Qx3XFgSueKdcmTcH0h/xRvCMy/0B2hso4nQY28xRSqmZwyPBue7oGSkS
	8go36bfeTGZLtJ5anAtV+JOeWIiTMAe3/ul3DMF+aO9P18WOfklMqT8BqRWXr1ltnKXh5EIFN2l
	6MwP/4PTlH9S01nIR2yThPZ/3uDBuLuTD56gqXzqsG0DYglnS1kwhNWUyA0pnC+UReL9NlpSjgv
	YnTfjD7uxh/jO8tYPBYK3xLQE+NEzfMcyeTRJ8crVyphu6UIdhgVTntPDB0CpoNERwOpZwnwVYY
	42nPL7fsfhtrsK3G51W3BV2JVFZSb+nCCYr0cFmGuK99HJ4MlMTLlPu62ViRFc/Yj/3evEvVlEL
	lcYaeYqNNjOG6bJP2na8UJMNtlqo=
X-Received: by 2002:a05:6512:108d:b0:5b6:10bc:dc4c with SMTP id
 2adb3069b0e04-5b610bcde18mr4681829e87.35.1788873173726; Tue, 08 Sep 2026
 06:12:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788623619.git.ahmadexp@gmail.com> <00b33b4b352848ff87dd9089190b35d8732676f3.1788623619.git.ahmadexp@gmail.com>
 <ap_mtZa1bGidHXfq@ashevche-desk.local>
In-Reply-To: <ap_mtZa1bGidHXfq@ashevche-desk.local>
From: Ahmad Byagowi <ahmadexp@gmail.com>
Date: Tue, 8 Sep 2026 06:12:39 -0700
X-Gm-Features: AcwNN1VS8bqELjY4qMU91gkD-1lcpNW1D8zk_hGJp1BpHq5sUsNQjNRuWPYsAHE
Message-ID: <CAOQiBWMAgBCd4ssAFOdHO7kkNKj=k_XH1SOasH2kwLxCYtRE4Q@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] i2c: mux: Propagate firmware nodes to channel adapters
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Andy Shevchenko <andy@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Andy,

> I hope here it's just a mechanical stuff and we don't have side effects
> as per above.

Thanks for reviewing both patches and for the advice about renaming
variables when their types change.

I checked all uses of dev_node, mux_node, and child in the converted
helper. They use firmware-node APIs throughout, with no remaining OF
calls or void * consumers for those pointers. I did not find a
type-mismatch issue in this conversion.

Regards,
Ahmad
