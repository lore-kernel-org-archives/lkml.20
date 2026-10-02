Received: from mail-yx2-f32.google.com (mail-yx2-f32.google.com [74.125.224.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4BD28690
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 00:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790900362; cv=none; b=Xl1PUL1TuVwvTeScDirGn8ssbdkUgClMM6sTEm/woFAAT2tvbPSbI4/mchfHM4L2X67ElfFHqcebBc3dO8jtHZX2+T3XKZd9RjHYXG+ndsi0s7vXkNbtprJLkr+87SjfzoLgURiLdmQBxOEYDILW1vSW/rJxR3PixYw3VM0p/Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790900362; c=relaxed/simple;
	bh=DD+PbZOcOM6sepZnP/mE8B57grk05o5jXUbfsi0gFZ0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Cqj4MWlGIuc+EC7DmaeEogwzmxJOM/o5Dl3y56sBLfsllnlhCviaibxxUGMwz2F65MSZdFII4xbvAuc1uQG661D080kuaDXjL4N+3URf+2hLTL2xXmjod40q0pg1t7wOlO76sC2ZkVFCXjBrWSnpY1HRnZiOm6oOfnVkJktQ1rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cri0sqUK; arc=none smtp.client-ip=74.125.224.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cri0sqUK"
Received: by mail-yx2-f32.google.com with SMTP id 00721157ae682-8ac4967f1c9so26930677b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 17:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790900359; x=1791505159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nF/bpEyAJLHrYgSp1W7lB/si839SdmIfrx3CzMfz4dQ=;
        b=Cri0sqUK8TK+nyisKYS9TvQs7p8C4Bs98ld7gLSTuVj2jstnv/GYq8sPqw8fPIcr3t
         CauV1mjTMH98SBj/NSRQAz3RUIOd5/kAYm/Rp7Gu3rQ34NEeSkDFTKj0frX4iKoT/lu9
         dRV/Z/KrNN8vcKIa85R21duRxSuDMKqGmk2ISaXVv/PBGKYFuoyrRqPANaYFaQ52ruto
         rzXecq2HEAvXVFglbTUyBLrbh32utxXD3fnFdbKloKjUrTFEKFFBaehJDuEg8sA53y/l
         JzzRlFuHOf9OWSI5U457EbV+wct7AYN9oYVya/HqFtos/iLpahoxf5SL+vjAIQnXYsXy
         OPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790900359; x=1791505159;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nF/bpEyAJLHrYgSp1W7lB/si839SdmIfrx3CzMfz4dQ=;
        b=WaXaqUQ284PTY6VYiFCeEt8WY42hj/ziY4WpLCtEZMFMyCylIa3JTuD/gh42AKT8I8
         u4igRIJOw9pMus7E+KCnSy/mROgbS+6UFcyFoFL/i66licRVPh93QcRHUuvC8fmhOO92
         ymUjMEuCLmNyKE4VLM2JAsOLUbgitrTjCYkZ3edeI049Prqondyrv/9/QrAEr9HnNqJh
         dHv5KhIfpdolAVQ1vjseUHOxQsbFTgKMUVsr3TKYldZb+IuFylQzuVd22v+Zqjb0UPuX
         j6XxVXCxMltvl985lziRWz9PHQ80UMl4iYJ5HcazYe3NrAkwMRS0EmF8r5N5/r5zgqaX
         Vggw==
X-Forwarded-Encrypted: i=1; AKwUvBxo473dD3FTL86so24WnPMklt+x3IdTbCy8YMGoll7zKt6HhR6Bw3mMULKqWzGuppOLr0jT8gttoXkhiqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXEOdpu2K0P1NTbNpODGMKTC/RL7zywUuHDo+qFabe9Q79Ej/0
	9LsiO8RshdXh/sxKailsdRNwcdTE+X1oLhbPnuWS5YdubEwhvId4QlsP
X-Gm-Gg: AYBFou0z/BtWW+6ttL/jIg8Vy4Gs68j3wxyJyebsE8c8J3KxwdoG4OrYthrwPHiDfgr
	Owe8GiIJCmnbqvCULZ6JaF7QhWZwdUYvEvZrM8GQJmByx/DVh8iXkYhtqpH7pvE0A/2zo1EDiWO
	rJlOVAnvfnN1vJsxM8iFZm6lIR4u4KwzomO9UpEq9IFPMwtbWEpvhMut0I5BjyqiXSAVCSm+vGC
	OASA1yWFQXtamkxjhXZhcsKxlm4YdMtDOKC5eUDq4hK1cJ+mN1C4TIdaL78eZK0QgIMRkH60g7O
	rfvV3o4+WZomR/T/23Zg2NZvv5+WItrwxkkn4KcMoVyKwN3kKBZxu7enExyv5qm4VbHFvKROtFT
	e2osZeXXaUyNKGfskYoEJRjeNz4PoriszQWWtW6BtMJYW/hcLEyeoOLaKgSfCUvR5e1NwHSUvQL
	LBkyx/yvhsVfuV8MP3Zcji5wFbWItH6IiG85riF6LFOM/NqbLr/lGpJ0t5/khml24r0Bjx7hTCW
	rNFr9JDZYNQvxoQ9bCK6BhpgMuVFrdI/ZPcT371Q+xqhqmSgoxs
X-Received: by 2002:a05:690c:f08:b0:865:b26a:8e30 with SMTP id 00721157ae682-8ae39be12c2mr4052777b3.34.1790900359541;
        Thu, 01 Oct 2026 17:19:19 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae32ef445fsm3311477b3.28.2026.10.01.17.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:19:18 -0700 (PDT)
Date: Thu, 01 Oct 2026 20:19:18 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.149ec551960a3@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-3-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
 <20260930-psp-defeat-v2-3-f266e7447129@gmail.com>
Subject: Re: [PATCH net-next v2 3/4] net: psp: drop psp assoc clear in
 sk_clone()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> Unwind the change from commit 1d2929d0850f ("net: psp: do not inherit
> the Rx association on clone"), now that assoc state cannot exist on
> listen sockets.
> 
> With commit 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between
> ehash and lhash2."), and the change in this series restricting PSP assoc
> operations to established sockets, this state should be unreachable.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
