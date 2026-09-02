Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280B4379C2E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788328907; cv=pass; b=k1NPERPbVhQQ15sTVBXwyR1tde/OTtFqsjpr4hrl1zDeKV/ebxdRuABw/BIZuFSMTSmJ1mQEf1XtPvUaDgOHd4WEwj9YfgTBFKPqXh4cX5id8RpztopwjOsiPWw0d0CPEqyQkE+mzrb5KdZp7Uxac9JMGC44swIEcaBrNZ9hcRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788328907; c=relaxed/simple;
	bh=0/44lYrEk5LJ7Jy6yMWQMzMFrcvbDwUSo5nkI1aJqA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ue7jqL9iOoKjjWIBZuhY7+nOanoEN4jI3jnwFrpzi1AgQwf8CR7je6qQmUuJmXiW+hjOymm9YM0SGIvxpURXZch/19VUUiYxmhAdX30EJGsv9ik5M49pSMxhpv5ArhfrD31F/28AhpTU96apf5PR/JRkYqaPjkWy8oOuFosSdiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFDG0wPL; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFDG0wPL"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so1072750a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788328904; cv=none;
        d=google.com; s=arc-20260327;
        b=fnLFnS3ST665h+N1ZHsRQ3EOiX8TNlta/SeZvOVvkNiDx2mqkuR5XYF0AxDKf7naFv
         ARjjARYd8OYRNrJgqZ+b9UX1pQhIGUR5fdAPZWI8H1GbiirvqrfpaQkWPPFTY0Bv20wS
         ZIZfeGz7qXc44TfuQLFJQ4Atws5ee0n6pUgb9aHANE5IzCM3AjjJkYxkc5W1ej5hxefB
         AXUtQZDKDuCP37W1ufJsnjk78DKEAo7wB3ZWGsv3+IMc/5MuoygncyU8DBC5QfrxTSRR
         puGWFgv8Yf/VTTmC4Lfmk/sz5GwaSkIzgx8IFPgDssxyh0q9/3ce10pdi5SrfRnKlUs3
         wUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0/44lYrEk5LJ7Jy6yMWQMzMFrcvbDwUSo5nkI1aJqA0=;
        fh=Vn64Lzxh2b28gWkggafiibbdVs6CSNwmaLFlccPHSyo=;
        b=l4QnImkM9RaRWbaBTNKrd/KPpq2zM3AuTFLWXL1hgE8Ab+QmXyACuIpbtQ6q0Lz8Dp
         vmwGE70hNS2IBnHDm6vXMhi5EA/sHPh4aHO177sSYQS33jGXlS0juPFWTIuKtx/P2uZR
         g1iXr0nw4PNSw+szZt1ymLsfm0HpI5ftGQlQ97NPUL7mSpHK52pZ+okcFA+kdZLgh4Cc
         nR5ZkgPA31vVuLYq8rmycuPNMxoQyL037EZuGV50hRj5J/QsM3qlkX7HRKjvRC4Jz3JV
         szQMKDz+8FYK3lNjr5mFLwOLk4v3GdSGos9FJCnmqjyIunlXHUEEiVnGD/lMlWvoICUl
         yc4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788328904; x=1788933704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/44lYrEk5LJ7Jy6yMWQMzMFrcvbDwUSo5nkI1aJqA0=;
        b=qFDG0wPLoYdgIz28wld6JT2p2iTq9PGtRHq+JJRKB/QjNMhW6Bc0aZAAtAFTwXHqpA
         Clg7ZbLFeYZ+aJyCgmpiRKrUMmUvzEK8o6IJg5sWKBGtcDlec3J8UmFS3BGLOKwgKTol
         8Hx2xo8oURXc4PxcrDrQ9zIuii2Yn6sYtCFVP/ukFUkk87qn2sYOSfm2P9k3a5RCIaVr
         +kwR44c1JNMvHrQ17ib2k4WeNUA1waE+GXIF4UFjKWFiWNkCgWM0dCqNuX0Hmq0mmRvJ
         JhtET7HOoyzo4ArxQ+vpRWzRnwYP9oIP3BG/zopcXlKDGVrPifvqHkuhDk77T4WA4ep3
         MW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788328904; x=1788933704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/44lYrEk5LJ7Jy6yMWQMzMFrcvbDwUSo5nkI1aJqA0=;
        b=DYJt5TDkoJ9T4+WZZGuLpiEFCyX9dCZ2d0ixGHHcv3Fv0VR+3WLBoCx+Ah+xZT89Xt
         zdUjQo6Air3n+r4OVbT7bHH0IZQPbl1S4xQcYTTFoFSUqs8bLOVRjjsdz7bxmCxNYKOV
         i5AHztrwUVBZvMyV7X1C5ZTNiqjykjSgJgU0fhkElftwpAl96ZS45Rb9cFiJWmn2X6W2
         1BLBGbuFdXBQLP8EIgOmS9dfqf9MiHZzJHzdXfVtIzD4ABit+AAOOMScYdPw/JyYq+kr
         5d7gbxNndGZV/VS+ubiUqsw3eVrpr+0GZijByhs6lEF8jQMXej9TWc+SlKQYvkmTkrCP
         W2BQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBdYStEuHfyCCWq7bfRe/PGp+H3jq+Qt6Bn+1C1fa9b2lkCXQAtBrXJVcitHwjlArMEUu8H0DCUg10YzM=@vger.kernel.org
X-Gm-Message-State: AFuF++k0+ynToV7w266i27K0+WhEk1x7zcN2BTonaJUPvMSDj63/HlBP
	/hiCOOjF4aRfM0hYVbALVKZ1E3YnFjJQQLVmwLni3M34IF1wiu6j62Tbkfz2zhn7CUBC9cPwLEO
	ygMRPDgaOy17vwL8+IA9HYe5LqA23LBA=
X-Gm-Gg: AYBFou0LW8tFVNzpcK8ckcE9fw72z2vFfYXTliv3QCsF6qmV8P0p7v+0nUewimnVcaC
	dpcPNpM1bs7I2WRzAdY+xvwpw71rzIYOB5mUpe0HcMJC0sbI2rV9Y71P3ktPcZYLKWdK+SPS1cG
	1PQ3eUS9snOUXrspwRdmCQxsfgFg2oQlPp7cC2RrPYRFQSeQZKJa5n4u20sROTAT+YapTx0Wti4
	XQQfRxdFAEt60GT6ctt797/QMFlpQGsShdaEv1I4iBpdLZ4a63oLBFOXvRXbpUbeINBGmsr/d8p
	pT8zErz8Fxfhzj4iR3ZSJYo2snovNUOvh9KDNCUVRT3BUbFElSbO59bFZQ//p3vCIaa6JCiRyIX
	hC12PB7UoYY4sT9nN0GJdSKzhzVdipqY=
X-Received: by 2002:a05:6402:3819:b0:6a1:f7f4:200b with SMTP id
 4fb4d7f45d1cf-6a6829b0019mr759262a12.12.1788328904058; Tue, 01 Sep 2026
 23:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <906b726c2f6a84b55365dd78ceb899e2559b76b6.1788277742.git.mattst88@gmail.com>
In-Reply-To: <906b726c2f6a84b55365dd78ceb899e2559b76b6.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 08:01:31 +0200
X-Gm-Features: AcwNN1VxdSqiijdHGCw3UjtuH6Vcfz6CUJ9AQ3IHYQW6HuCjAN6viDA3q4KSZjs
Message-ID: <CA+=Fv5QKQ02-CWHjRr5otSSveFdApBuoFVqWdE3AJV+RR=Lgjw@mail.gmail.com>
Subject: Re: [PATCH 05/24] alpha: select HAVE_DEBUG_KMEMLEAK
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Kmemleak needs no architecture support beyond the standard linker script
> symbols for the data and bss sections, which Alpha already provides, and
> a scan of the kernel stacks, which is done generically.
>

I tested this on an AlphaServer ES40 with CONFIG_DEBUG_KMEMLEAK=3Dy.
The kernel built and booted successfully, and a manual kmemleak scan
completed normally.

The scan reported three suspected allocations from the sym53c8xx_2
driver. These appear unrelated to this patch and may be false
positives caused by references stored in DMA-coherent memory.
Either way, the patch looks good to me.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
