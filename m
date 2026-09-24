Received: from mail-ej2-f36.google.com (mail-ej2-f36.google.com [74.125.228.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990EA4B8260
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280526; cv=pass; b=uP1MgAp7Y2wRcbN+rMCNB8mPUSMnrPQRGIwuFgFvLZRIV9s5HPUOPy8BOLN/9Yr+3f7K1nl9dsln11fYWoa+q2pCMozR4Gt7kWTlfOxXw4u9JuvfRBd8iJnGwG7bkZrKJZJ3jMvAr3u0rOlXok069MAKLkMSp+qqKOwckurdrtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280526; c=relaxed/simple;
	bh=RNSm98fgEHKdHpWR7CX29C+rFj4qcatPCgl55FRB0yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kIv+z9fVQs+/4WVpbOSmaIT7ajo1sBXp6tuwQg9nOS34TzoZWRBGj5ZfqbVt/+w/65bsDQ6MMOXnaYcR5XIhlCpHGlJHbjUL/KEfmuvWqOOjRxSo6/fJ43P9TwTlcm4T2NMLtb4jWNjQ3RK2NSiAYOusRl8o8MW810Zjcy3UFD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZ/Ty/f+; arc=pass smtp.client-ip=74.125.228.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZ/Ty/f+"
Received: by mail-ej2-f36.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso26858166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790280523; cv=none;
        d=google.com; s=arc-20260327;
        b=HD+x6zpnS0wCwrEXK6MPgouEqFlpz2I2FbYEx85RXrqtMrEXUWUcTVbhCm4lSP7WjT
         e2gBtgMlNoblixFLBHkiXTumtisNQRrC/KWtNVn0/cuDkaqtbbK+wyP2CnjrOHQxAftd
         7Ze2u2bk/eq41aEanDr7K7xb6zr5Mu6x/Qy9TarY1i977ZSfl0c1KZFUA1xx1GhkcKQV
         q3R4ZsFYgDOJkay23Y+plzoo5680xJflR35YEFIuw4UJjDLm0Is01nQiW+zEE0r1OYo2
         Fz29MlIJs4AHTNVNQd3RCj6SqnFB5IqnkUgFseyNVsLDhjioOaURtEREsxqmrQehtkXt
         X4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RNSm98fgEHKdHpWR7CX29C+rFj4qcatPCgl55FRB0yM=;
        fh=vDEav5XRTHbrX6ZGuVXjwwc4J7Sz+aRPEg/n8+t2P8E=;
        b=fLH4OlElvcpdflbXCW9P19BOxZdMGNZ+ilslk9cXTcSlQ6TRv5JOyNdAR+/kbQOgkA
         xhnCptrhrens/HsOCx0F9P86equPL2oQmFn+HMsCVDmXilvpnDT95y6wfLo4ZBm+OwS8
         KzYdM/CusnrM6i1YIo9A8AA/I68pmzdc+1WNcF94VNg2svNwDnAbPQUsvVBJPtDBDvDh
         yKYHNHEqbG2PmO9t8+nBGBn9d2TWPdoV62wNqDUqAhY1PUvdrF51zofqjLTdNR/g8GDT
         Etez891/1gD99dQDh7jfDkt1ln/6XI5frxFkopTeURO7Trejdz/90DfvyKQxvI4Enb5G
         29/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280523; x=1790885323; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RNSm98fgEHKdHpWR7CX29C+rFj4qcatPCgl55FRB0yM=;
        b=NZ/Ty/f+M2VyjD4sjRWNH4RgktHNCorEHJS4XpGWi80kUFuByGlMRmcET09zXM0c/i
         rImvsFN09G9ummavVpxQ2O9slzgf77qFJeTaPcqOJhgRqVGnA8cnUDjQRt3Z3bK3xmfp
         YJXJ2XMxi66xbIOpsog/D/kCCj43Clrw/P95opB8elhjPA7RjpWx5VZvGvI+5nTrmhPw
         BexEWrZggwE8Gmd3R+e28roYbaWX2L057z3zpAMn1T9409tF+3ikcDyhNouMTEfDwHam
         wPQG37LEyDwIQHhyXN4i8OLU6P9HytF9wwjdWhGoLt9+WpfQlgpYZVR0ei75Wtb9TNkY
         tX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280523; x=1790885323;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RNSm98fgEHKdHpWR7CX29C+rFj4qcatPCgl55FRB0yM=;
        b=zb/DNN0n0QukRO5dIv9IiU3qWtkWAlzxXBpA6LHC5RC+qAou4fOAaU2s0L/Ir/GEGw
         DJj7MvKk/bVcxDCXIhO3EH9XXDbk/Anh6r27wIrKDmEL0pYH8nTPu6pM/kUSYmY94Fye
         6eJXNPMhBWh0wu6gW/qxQaV6cEv4TKr84sP+vThDkyhbatbnai0bDIGHhHlDlyt+kCPO
         ViauWQYT0aT07V8uqrbVtu9LrP+3QXchrf2zmPT7IhwE+dFZj1N0CWBu1lsQEswa8DhT
         ORLvJxc+5FvRQcD9xQmw7WCvUQ9A7hyuU9ZRBDdSAcsSGScdx/y053IRczvr6k56Tbek
         Nb3A==
X-Forwarded-Encrypted: i=1; AKwUvBwEvBA2/H6QM36h0JZsuraJmHHYG8B1N9zGKis+lULOnCbHuC4BWFistM4kjnmd3Y7B2tBDCTPt/0kobes=@vger.kernel.org
X-Gm-Message-State: AFuF++mzZ0jw6fEC+NO6h8FLN/54vEfOo8OOP2KDUDBjdDSrhfFflpXy
	VZUk2oenzPB/3+9oEe6T+jT7IwFby6wRak0OAcfJVkRWDOK9Ql4bl4F/8c//FulFJ6VpRF5dSJR
	Ix6auQ6hKLVz/gILsxhZ7iGm1XHlZi0w=
X-Gm-Gg: AYBFou2WfkPZavaJfg0cXMU74/QGiGYpk60syKQtnOW3ywKcfz4pdhmd+Xq7VcVa9v+
	23GivC8zAv3PIxKRXe7D36SQYjlvl4IJ/VsvaSL8qRX2d/x7Ur/S+oR0XKRIUBa7pdAGLvalqza
	yC0BSjfdF/QA1UyfYXHSRs+g5puV64fUxppXzYxkeKalTtEcgyJLjYAHPl0AZAXfQlI6JoSJdhE
	vBucccr/6eRgeZMtguqwTZa/JyMTHi+qYY3ehqZexXLOdZOZJHXsdyr4ZfQmwUWSGLqWf64FkBH
	MoUEkRc2V80h1ggneDEel2kj2ZWqRQvypOOpSycWsXi8Gn7f7E78eQmw/drsaNKzfRUSrvApm8P
	YUfLJ0WM7SjlVOQPjl2ApuWnbajsqc31iOaoYkrbAe1HS1gB94A==
X-Received: by 2002:a17:906:8d8d:b0:c29:c213:1ec9 with SMTP id
 a640c23a62f3a-c2ac20ab8ecmr322667666b.9.1790280522730; Thu, 24 Sep 2026
 13:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919191524.268810-1-meatuni001@gmail.com> <3aaa9d04-6bf4-46a4-80d7-9828405b7468@linaro.org>
In-Reply-To: <3aaa9d04-6bf4-46a4-80d7-9828405b7468@linaro.org>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Fri, 25 Sep 2026 01:08:31 +0500
X-Gm-Features: AclHuK-fj4Cn0W_vYW46Cg7xkxnoo5u25tZsTVZNPJ2G3OF9fblSULPtGigaufI
Message-ID: <CADqcGBkdFjoKF5Oa=zVshe92ay87CFUu8KzZHARB8WV6ajVXbw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: tdo-tl070wsh30: Remove panel on attach failure
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	sam@ravnborg.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Neil,

Thanks, I've switched this to devm_mipi_dsi_attach() in v2.[1]

[1] https://lore.kernel.org/all/20260924195512.336690-1-meatuni001@gmail.com/

Regards,
Muhammad
