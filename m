Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2669B374A14
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787993660; cv=pass; b=AMVKwmE0rTC+7TTlrDCEi7GJGjvbnEaVO9CGqxrkn3ilAPuA9BQKKewqbj1lZBMm/PVSrJk65c2c5HMqrpcdEybdjvb18rhyoViQi6Pfk9fNzZI4bsTFIBlNNnxdgsF0WWYztM1nYo4NV4hgzCIT83G2kTJBmV5BafOvirs3fB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787993660; c=relaxed/simple;
	bh=hrtNEgtG3j6zaZK3E0236Rq/kyzlkNTa4Qq5rfR+cX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAC9mK2uhNNgMTKxDQsMh1g0qu+Z1aAerkM2fj68zBMCsp5KiCoDS5Z9cB3cBysajHee87ZM1Q+DDAN3Kvd0OyGUtSA5uqFpSOBLIgw/FqGAljiPw/l/esI2pNmb0VLlLA9wE+WeumnXHp5Cr6UMH2+CcJrxOKLzJpYV42JOwJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nL6zmajk; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nL6zmajk"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so2807604a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787993657; cv=none;
        d=google.com; s=arc-20260327;
        b=rhmOXgJ/J7UsLGbVTCSSSZx0Q6M+nOANQt0BUgO+/9uF84of54mFSDOa7SMiu1kY/x
         dKYlFOGsCKXLCyvdOuiwCVpySJ9nWyNFkqgrcQT/riyDp2C7IOJ1YrgG5epBB5JRlenU
         vT0Uc8APJpkagLElw2l9537VR6BdnNBG+LbqJwpX/1hLiuyPiL+HSd203Z27HeVK+qCl
         GFprdbC5DnlDYAKmAPdWws9zzR5u5DwGp6uH6JtWCIxSEDEV99MUNUHv+ESABarNDFuW
         wDi7zFc0VpHa3JRFB25bSkZoT/PsiHo3EV5sUBq4PrHSVjCm3GdrDCb0AbAmtLdSLzTX
         i9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hrtNEgtG3j6zaZK3E0236Rq/kyzlkNTa4Qq5rfR+cX4=;
        fh=0TS+cbugEj6E6cmB2szpEbxF4eqFQDmwLPf/ufl7Wso=;
        b=Io6JX4PJ7LuP1EAZHX8deAlYhTiNfUqMxT7ejudlqeaEDpgx9nPpaRanFZzqeyxGcU
         iQJvsMDmESLPI5v/2IiuTQjC8daizn49jnurHF7ra/ZEbaGU4Fr+PUtzeCnvVKAiH7Ys
         +k0R78ckW119Eaf9aO3R8wHOchqPZs2d+ci5XekIQBstmzGjKeHtiX8B3exW5hmWkDmt
         Y/RXSlJyg6nbZx8lCdL9ddB8HC6cbxbwqid6wI4hOMDZoCeIYzbhJB6hKW4qnOX9jPsa
         Fs6zEvAa/vBa6TNto1kKw5Yc78oVEFs+OPeMh4RHnHxumUYzcZKK4CzAp4FU4zFaYYsr
         EZiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787993657; x=1788598457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hrtNEgtG3j6zaZK3E0236Rq/kyzlkNTa4Qq5rfR+cX4=;
        b=nL6zmajkEZ/qFYFDwXGycrsf64x0wQAyYSCEbwO4TbG8E5VPzoddPYFzJfUtLudb9T
         /Hn1TuUU4GgqOzO/ePVCs3cGJy8YeuEBWjQyqfyEs7Bw5MCU/CwTAHMYNxAX3575Ztwm
         9MF/Qv42oMQRDYWSOe0mll7uxWdR0XX1Vd5XnM/JLt/1RzQdTvX6yMTaV6jtg8fw9nDC
         XO8IKIhOJQP2rChjLNzw24zBbsxQUEJR0RS6cto1Gc8ubo2Qel78VPyReXbCcAiBpzFw
         CetIxPt+7b74JPKKmFC59xJ/MNqH1DOS1v7FbRnuQ/wmOXe110vqmyjD3s+cLij5wGte
         JaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787993657; x=1788598457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrtNEgtG3j6zaZK3E0236Rq/kyzlkNTa4Qq5rfR+cX4=;
        b=mnLiEJCEjFcOM5ZCX9WjcrQ+X8xvnOu3RtC9khb01iglT+eyf02MB6SBRdCULYccag
         W/4RGKBHkdNlqfkyAgvw5wuWGtLT9UuKPHXsVeZSvbWBsETVnFKipsJBHFkfOIR0x/Sf
         DFOG80Ua/KIh4GCNT6myLkJQ6VAJAgn2Kv95Jb0UT+oYkedBhEhe5MVvrV0OF3VVPe0W
         N7iA+IRQJhkye+pnLns+cZhckuf8LzkYoo0KQFexdx4Sjk8igeEbA+11tvN9tJ5xG2/x
         gy78hpoKyZ/NQE3B5SYnAMlRybBd93VJSc/mSXLbXfKDSWULhpZlDzKYHCeTVDohUtme
         YurQ==
X-Forwarded-Encrypted: i=1; AKwUvBw43jWw2zbF6F9ssA1/hcKGjO09GfSTiv/9p6O8A0kpga48xjAZeeQmbNtveo989qvwNPnTbyq9bydqNgA=@vger.kernel.org
X-Gm-Message-State: AFuF++kWyXhNM4EZgFxIiwGJKWkFIjYaf+CAW0ApcbreQeXOT6mFIpwo
	3Y6+nfAdSeMND6EGE+49aHXA4EbdX3JgTg8fxIcjdr8DwGPbHA4ojxdtwQ9LBEF1HeuYooXaehg
	z88WDuUC1Qqyh6Jm/60IMv6UDmDNt9L8=
X-Gm-Gg: AYBFou05uGfyBnDKn2EDmrwvKD1WK1fAgurIuXbNMKQn5SCeoiCnTlCb5gbZochXLo1
	5c0Wn+0V8xA5lcRlEKTHtPgZkK/KJ2we33pAVEvNjtylxEkU7/pM1WfYXQzy5jMk/o1mU/rL4SR
	53PAQXFVB/oCKjqcnlS/jKwY5HYCwzrXk1O37yPIHN7Gw2VxJKEA/tz0m9iezd6YhdVUi2tUJZ4
	zijH+6st48EPFNv9X1cszL08TTk7vZ+AlpYdzhhI7CEk9+OzyMcz8iR272dDvDXLoRocqXHlv5B
	5oB3OKBEiOkuCjmbGcAssaMTuTVSc9EkxMqBLJ7Wj9mmANTxsW4+MNyIUAdHV+UtOPuhXeBcSwE
	EvoO1dctm7K30Kw8psfFU1n4Di5dC4Dg=
X-Received: by 2002:a05:6402:3812:b0:6a3:6d83:ba44 with SMTP id
 4fb4d7f45d1cf-6a60d2f3663mr9153249a12.2.1787993657229; Sat, 29 Aug 2026
 01:54:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827182757.6856-1-linmag7@gmail.com> <20260829062933.GB44338@ravnborg.org>
In-Reply-To: <20260829062933.GB44338@ravnborg.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 29 Aug 2026 10:54:06 +0200
X-Gm-Features: AcwNN1U6gDCQuxm8O0njez-6ceR_nScc2jt9Lo2gqUB-dHcQWIJBt5FHMPzsBF4
Message-ID: <CA+=Fv5QAFULPP=hwFFAKjrhEm0Mcb8J5kqr3tdvkTzJ3bFgwCw@mail.gmail.com>
Subject: Re: [PATCH 0/5] sparc32: replace sp_banks with memblock
To: Sam Ravnborg <sam@ravnborg.org>
Cc: sparclinux@vger.kernel.org, davem@davemloft.net, andreas@gaisler.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Sat, Aug 29, 2026 at 8:29=E2=80=AFAM Sam Ravnborg <sam@ravnborg.org> wro=
te:

> Patches 1,2,3,5 are:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> I left some comments in patch 4.
>

Thanks alot for taking the time to review this, I'll pick up your tags
and address
your comments in a v2 of this series.

Regards

Magnus
