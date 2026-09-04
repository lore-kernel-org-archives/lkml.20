Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034731716D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788565117; cv=pass; b=tCRffC/EJKXh1l0TigLgcTpTnc9XCBU9NmlIBs8FNbl6ZcHd5Hc4OfD8d9UNBmXmoB5fTH7rH6XVvVnVW/OnY17XEJRVHz7LdIBrpPvlbK5oOs2EpQR7IVGWsUtHiZ0kEcoEIPPSpKDLhR3FOeBeozkPigGUzlc27ZY+REFwfOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788565117; c=relaxed/simple;
	bh=OfjNU5ihH6zdhRpk+3D7wnnN3CuA8bJvDSzokOYZQlE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TRmC0uLZwxBgTrePNvGD3BN9C4D+OaN9dmXW2GMLF7lcn8L/+8YcH12VTOet51ZlZ8zhEHj/TepYgrZU9L9QOroAbLUTFPUeWDZskh+xs66HW9t30Uu6dc/8HvIHo74TAo4QOfZFRJpysRRCnR5AwVExV2Yp745DKSGaamevp0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AF2kzGHw; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AF2kzGHw"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90f9f8553e0so19045706d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788565115; cv=none;
        d=google.com; s=arc-20260327;
        b=Is5STpJOgnO2Ia+zecObG8h3cLb8f0+ntp/OTqF92R3s8hS27wkKs0EX/954dTBd+M
         C2nPPm1Pz3QC7ev64LnbV0ZxcvCRlyQVVIYDwvR6GWGPLm1ZvcOhVrMsNu9URPN9FziW
         4MTj8QK+N+ep3QSZIF2TOMUeeYzy62ySK8/UVDLctydvj9ZghyvL356shb2YrNuhZ/1q
         f47rEPUXpvmoPb3k3IGZMGJncm8e2y8VYOUZ2VtGFU8IC2+NgiV7+aJeNRM6XL3E7e56
         hyULsGuy2KyAgCimylVqlUxsETllZWpkA+wUvWLzvqZaWVVYSigI2odJkhuUI+qjJz/Z
         G78A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=OfjNU5ihH6zdhRpk+3D7wnnN3CuA8bJvDSzokOYZQlE=;
        fh=os5rhIsXdovFQLzxjZWIQZqW5WXKDb10+S3u1TzQLzU=;
        b=arc7KPPQKnzSA5ppZAbgoJdHEOIssHOLBSYw4dKkWfyAJv9fvjsaomvsJwX3LYFqH3
         /bDmkVGA65CfS3+BA6yuYVuQxFlbl1KEl6vQ8mNTpnAsCZ4B0eQ2YCMkUKBlELx+A2Tl
         946H9c9NG+mZS7cvoCrRcsEpBDEIE2dqbEc8IIh4PalfnDHcdjueyrgI8upXYRUXloSl
         iFXDvsCIIJUUP0bU3W5MOGPB9UuKygRQxSaJtPE1KCEpxZpVg/GtlexBD9GsH00ozZrb
         efwTEXrBV2INAw1K9GGfb6qrFwV8BClS+as9oH9rIyquakEi9qlBNu5w2eTPpIWMCErc
         p4ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788565115; x=1789169915; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfjNU5ihH6zdhRpk+3D7wnnN3CuA8bJvDSzokOYZQlE=;
        b=AF2kzGHwxtNyRchoqtNoLxE8wB+hVaVvH6vbHJjbBulFZUik2XjfSIHsJhiyAgaTtG
         D/AeIMr5gWwD9HUj5T/8KRVL89MBZAybEk0ZGq7ALp9V5vdGsGkS2xGqvS4p75AS9/r7
         8ny3cm7TUE7lECxX2stDHgHAtcfzyifWGsTnucSIeGMj5Ny0jLkGn37Kf4N4LhJ1Xvrz
         njRVQwrOTi9NVCdcORgvs2VsI4lBAYpoV8fn2v6yKrDwtNUfUiFaqtZG9TGFU9cKMNCd
         zvrTMLLbdsBcdqmF998EVY7xA8M+QFXN+bOO9qotrJ2nuxj73pA4us0Bh+1Wb3wZ85qG
         IXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788565115; x=1789169915;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OfjNU5ihH6zdhRpk+3D7wnnN3CuA8bJvDSzokOYZQlE=;
        b=F4sG9mfv9HLauJfu2vZZorxsvmzNSEbTYPBpDbbX9YfaZvWjnYAE4oEn00v34890Kb
         XRDYcjRktqiO3gbWsVmfQ0rBp3QTTvpVrMtrvHlDMQX24WA8ASdiNC+GfmCiDBSUpkJe
         C9CH2pVQ2sXvSe/ndW1r6tTLTx3BG1u9jLD1BtzphNFX3hmchf/p5ZgL1dQWis9fJ/Df
         NIuF1U5HwP7Sr9K+1ODqnVWvLmQwqdFs9JWLHun0DRy/r57ZdJrw+wII2VE/p3rSclcz
         XOu+9OIRN3g0MWws86agZoFA7aYY1IiaqcjIWhgIpjO5yjQ3AkQO1PcaKCMtn6KFjqbb
         QCoQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/EGzZMtX34koHiHmo5YXMC9WDa38h0Tx8pbux8NuCu6dcCDb3uhg3TR5fzcI7R8VcP7uEqk5OUQ4F/vU=@vger.kernel.org
X-Gm-Message-State: AFuF++mY8MkAZtcgSz1Ts9vh3o8r2GqSTTG98a2d0sBtYGI+31OZ5lh6
	PVryqTOMyDAqvnsaeYJBa+kLkcxixHnPbCuUXVgDAkVqiyIkJhLo9cOYJ3vlWlewpMpAFuVjnIF
	ceW1NJheVmxBYmgJJKlEEe+MwMZo00AIJJVRxuBk=
X-Gm-Gg: AYBFou0epUpN3fCPaIf2vjVXprrOEXB6U3SVR3OQ8HcFMMmRffGdVd6/uhoQEDudOHK
	0DqzPLA9YfKofgbhFaavYXsXHAqP/dhzlxCvGxlWoaD0l0yfkevXPNxkEISAeHhTQyoSw4zTKgb
	ifEh9IW3XlwJMx//CawOa0rOzmKMtRSgzCWIdwXj85aIUDSoIs60NXun69lQI/zPJBmvKa8etNA
	BQK3mmOhyb13o7AgAVTNk2QdIi1rb1cknGxhSKGpgJ0Fuh2OcQNKJFkTtFAaC25eNp672Fe4aPc
	e8pLdFGegyKQ2ELJf0EBy2hQFY1ob/o6M8ekj4T3me83VZLjHPaPn4O9RUYjEIdBRCh8w71c+8J
	SPKcJCJ5cDnXhzcdBGVqM+6mnlEhTb3izC30=
X-Received: by 2002:ad4:5ae5:0:b0:910:44e5:8a46 with SMTP id
 6a1803df08f44-91044e58aecmr60519796d6.37.1788565115021; Fri, 04 Sep 2026
 16:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Alexandre_Boissi=C3=A8re?= <edu.alexandre.boissiere@gmail.com>
Date: Sat, 5 Sep 2026 01:38:23 +0200
X-Gm-Features: AcwNN1W-luJDuFpEK771EUW4fuSGDlBXxkJ4J7p2SaudTyacF1tjANldXjDhIVQ
Message-ID: <CAFiazsFb8TZUKp8oEx=4jkEHm9oLHn8M=c2ksBC1SbeF-zmM7g@mail.gmail.com>
Subject: Question about desc_push_tail in Linux printk ringbuffer
To: pmladek@suse.com
Cc: john.ogness@linutronix.de, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I have recently been trying to understand how the Linux printk ring
buffer works.

However, despite it being heavily commented, I cannot understand the
logic behind the condition in the desc_miss case at the beginning of
the desc_push_tail method (lines 716-719 in commit b6cf8b3, lines
801-804 in the latest commit bf56987c).

From what the comment says, it is meant to guard against another
writer currently reserving the descriptor. My understanding is that
this can only happen if there are concurrent calls to desc_reserve.

I have been trying to figure out a scenario that would make this
condition evaluate to true, but to no avail.

The difficulty I am facing is that desc_push_tail is called with the
value of the current tail (or the new head one wrap backwards), so for
this condition to hold, the ID of the desired descriptor would need to
be two wraps behind the new head?

However, given the way the ringbuffer works, and if there is another
writer, it should either contain the value of the tail if the other
writer has done the head CAS in desc_reserve but hasn't reached the
state_var CAS before the return statement; or the value of the tail
one wrap forward (which is equal to the new head) if the other writer
has finished both CAS.

None of these two cases yield a descriptor ID that is two wraps behind
the new head, hence my inquiry about this topic.

Is there a scenario that would make this condition evaluate to true
that I am missing?

I hope my explanation is understandable enough.

Thank you for your time, and best regards,
Alexandre Boissiere
