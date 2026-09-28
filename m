Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52123C13E0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585160; cv=pass; b=IzMU/rYSXBWI6WLpYm0zf8Za3aXY8l6XaKtzAW7y6UrBNli9z52gVYFg8Z2frGZg4UZux2uWjD/efxQSmSfLc4qZKBOKDxYqw72Zi/UkgUGKiA1QaI6TI7pogquUkD6GACsyM0C34LUegIuMDmtByQESganntH73QCP/sAlKn/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585160; c=relaxed/simple;
	bh=mr3/oZdmjnfuf2xlBeuHdlom8Xh0UAkM0Ox4x7tjkHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cp9u+cuivFwXE4vwdvUKyGAKUEIKZSfdl2AexxlAFMSre08oDEhEqlKeLLJdTDXJ+3/seXjB8S8VcCRRI1YbDZvLprss4TsYB/fakbm/IziJ+uktVe/qFVy6tJN6H6u8OG7BFJItGaLSXdzL8oQt32Uh/s6HuAT1q/GyT4ct2ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V33J4cAZ; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V33J4cAZ"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-34251480737so154425eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790585157; cv=none;
        d=google.com; s=arc-20260327;
        b=JSRg76nGbc4Wye8FtxC0klZ/i8y5uE5RMBxay1u0/iCMtmAQuT315J37l65Caj2375
         BODZmzzWTD0Q8vzRb8pEmp99sUkGKsy1voq+5UKrh+zWIgPQzuyohOUlpsfZ+/MqTBO7
         mKr6NzpQYN/zmBYulG3eE4fIUbPo1VxK1Rdg61bRSqyzUJBaV5U8LH793gKDDlyrfQh/
         zbt83XdJgNxcSFnP/mb1xaqW3o3qiTU6IcQEp59dOGACF+9b7z7/uUt7u7Cd6MTyQDoF
         +WqsAwTSvrfJvowN/ePtJ+Hqf+7pa6E/sV2N4cgzPRLthYyw1YEYfKE1jTN5x5Vmr5Vm
         5+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mr3/oZdmjnfuf2xlBeuHdlom8Xh0UAkM0Ox4x7tjkHA=;
        fh=pmUm3MYgnPlxYb3MNKJ/MCCVxE19iAxNOyn76MvY6oo=;
        b=aH0c5Yt/+o4DLkenCCZGELKQmhXhKZFhIXy4z00eT0Cp+w1t6HLGvsZ/sn3fg6FSOm
         J054RQmgSLvYerRSB1qc0ArvVZuxlLaRZsynSq+M7i7K+dliZ263oB7NPpfwsBG37WlX
         9Pee7FobDvwUN4zt5gH1pnsNN5zfxeVn5llqACB7MrrpAO8NGUE6hk4O+XDJ+aN92e9f
         1HeuCktKyx2oPz0W3bfj0flfD2RvWMgqlEitbxmQw65FulAFmV3p2V6SdtrB4r5ihoq1
         S7SKxdz9exrMO4gHypF2uVZBCoRkfOT5a2lFb1PP3rvmQLBWMsWGYUpeXBbGhEJ6dQp3
         32bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790585157; x=1791189957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mr3/oZdmjnfuf2xlBeuHdlom8Xh0UAkM0Ox4x7tjkHA=;
        b=V33J4cAZ6xIv0Z5nO9CswyGG59Wn3DruSk+9Og9iexPegBLvVJY4W36M1pDglzaKlJ
         iRqzcX185fvH0kpzHlj6wb/kNHluTapPddimNFQ1DKq0gJWG3AdO+1q/ixjBX319GNfz
         xoJLqNnTvuQGBAdP+k7metClV/l0bxsQy8swLNAb9Qq+jtj3xoKMPC/cCcxYNIirD6Lr
         1u5DGbAd8OvmPogvMkXhQ3E7X0QFIX0MJMC2p1EQ2jpNZeS1C3naz2eQYrREBGDev14M
         o3C13s0GASUi7MIADZhKNpQpJiVdPBuLAt4TYiXMKDTc1uF0RiKewZd9K+dvyKH21ldq
         ksPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585157; x=1791189957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mr3/oZdmjnfuf2xlBeuHdlom8Xh0UAkM0Ox4x7tjkHA=;
        b=U3Svp20PySVJ1XCw3uuKUVPsLLYWA75VHxwa9AkAFZUgrzRByE51H17rS7zN6o4o+b
         5FadEi68+ec2RjtRhrXVNI1iZz95nNuen9bRKFj7y8bD0lVMAk0dljcOnxO9RgD3SQ4s
         TVplXh0dusY/AWycPJ7AUbQTCPzRixYea8ucZm0mnrd4z/66U5PDmnDWFAbu29iDbDay
         Jyt0mI6Cwy6RuwV6Ad0LEZVmIW8A+yCnj8F7KUFEdklmknFoLKCHUo0hCkw1K+osvMhq
         b1WeD3ko2yZ9/uZRpDr+nVEN/Fn8RjpthCGVQS4nnND76+CVIIA6Vyzs2YpXXAJ/zEew
         Z+2w==
X-Forwarded-Encrypted: i=1; AKwUvByr5lxmg+8y7aE7aUFJtK2zLV0TAsV92LXZUoe0k0Bhq5Ituc0snBsT7gwEYQ9yiWJEAfxD4wPdY/ScCV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbud/E3L8w/BqELwr0nmcUK363eFgKxEhLEzxWoQ5cdgTqDrdo
	p2NXSDLo4ega5QrvbkgqvF49YTLdR3e8Xy8ZAPbbXGCsy616ceVVe6i1/4vyXNMF2PXHaqaErwQ
	AadhRB6hdxAISYcqUwuTMhgoVLnoPtWA=
X-Gm-Gg: AYBFou2Kd3hO9xobUrsKJ7PAsds5CLrxiVwU+stTceRiS7K9/VXcOS/Algt9cAdVWE9
	lOYrCxU7bN4I1LrAiBDCAlJj2+rOKUhKovgyhwDVEUGCrWhNBhtKd21cjvelnNDtVGWRfPNw6Ul
	JrRAXdZUQqWgHcZsqMneyAUAhdFaKaKpvNwdcgscitr6OnwdP5znoWnkwvGxGuNgAFjK00RqHco
	tma2AAOFl/GV4DPuS8zBOxDLhKVhQZtbFzIDHqiDNnX23LiNRUPZn4brRbFoYoezgCjUCRxhZer
	Awxbducky7Y3QaPlG6WWQYbBH5SWXyf425NH3VhKk7rE7vGkd3Djesk+T8pQSfWFGSREseNNWSa
	hmqsea8nGhhOYyGasOAkFMy8LzmW62kguk4uQ/Ax2cor3u/9RXRHx68tvbRssOwWXR/q/rGRGEb
	OiY/HLFV3coPPBrOJKkHFp27Hovknol0slxU0RTDvF54ZLgPYbBLU=
X-Received: by 2002:a05:7301:4d08:b0:343:fdea:9a0 with SMTP id
 5a478bee46e88-343fdea25bemr10067053eec.2.1790585156645; Mon, 28 Sep 2026
 01:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924085523.2620704-2-phasta@kernel.org> <DLNHF9TPLXK2.1VQ2LJ0U6Y07K@garyguo.net>
 <dc8b56abedca3c6d17649de7f682e4af0b91b645.camel@mailbox.org>
In-Reply-To: <dc8b56abedca3c6d17649de7f682e4af0b91b645.camel@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Sep 2026 10:45:44 +0200
X-Gm-Features: AclHuK9mcGbHmyfX_Faw_MdAIDwZJVwS9VWb9_oTdrbq3FYkqNR9gMtq6GAb1wE
Message-ID: <CANiq72nrj0k=SLKJHfJyd02cA=n4B1zjwBnYyWtAGkhF5enDEw@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: Accept errors for Lock payload data
To: phasta@kernel.org
Cc: Gary Guo <gary@garyguo.net>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 10:10=E2=80=AFAM Philipp Stanner <phasta@mailbox.or=
g> wrote:
>
> But why was it imported `as _` ?

Because it is an extension trait, so it is not needed to use its name,
only the methods it provides.

Cheers,
Miguel
