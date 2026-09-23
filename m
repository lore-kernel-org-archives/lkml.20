Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20C853446C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180609; cv=pass; b=CDXx2TX1HTJkX9Dinqh/i6tZNKf7yfXD3H/HzvHP2L5L4tnYimdQP1HwOHez9PPPOqF9fX5LR2cgE/JkUAb/WSddWcoXeS3qB4j2DKCfdgvVzOjqwLrb+G6Gz8wEL0tosvJN0KFLesAfmvvvW7UPZZYs97G+U6lfdvYRkzC4eVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180609; c=relaxed/simple;
	bh=vwFPNenlD2vZUkkMCjc8UFuJO/cF0xzireOhDjif8kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhRx/+Zznb5INVT3EvBdyI3Vhl6GSxNBHRXqOobKzkWfIEmYXfOAZ7I+fXhtEneugIregSu+aFE9aCV/nG/t/RUueoPX90z6X9+klEtzFagujGSMjEAns0n22oOmIkVqSEcDAAou4GIglvKKevgvX9Aom25ytMqODwlTu2F2n08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ioy2mjYg; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ioy2mjYg"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3286624d194so796801eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790180607; cv=none;
        d=google.com; s=arc-20260327;
        b=raDuMQetFIp+T5uyaJo9CFOgjP8SPwXVC1aiiRdSHtKbRKybHyOvLWyMNAAGZcRiHk
         p1hAKFQ/0PKb4VRxkfntORCdYXNy9vdfoDaRDvdBHPdnRytsefxQbKXk7aN/G+iUXnxk
         /IQnC61xn3ruFUfix3mOvewZKFCZRkSrGysdb+o9yDm/pQiAUSZEjZCBe7MYvxU3rqKN
         5gayaUIlyUPtQg4ECbZM4knV5/EJo6P2sXdhVVm3C6j3AMmbJtlgUiYpSuamydTnMeoR
         u2IokE/iq/DAzYSqTaTrn+EFF5wfZu8tM0ghRyndBLYPINzzIg4cIIUMqt2jeUREAD3T
         Jsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vwFPNenlD2vZUkkMCjc8UFuJO/cF0xzireOhDjif8kw=;
        fh=XfcMHZsSaC2BEeG+ismFCLK2rBo+RmiOvyEDx4GgDWw=;
        b=cXZVapucy28nma4sjT1Ti14Br4E1QeY/PUSk8rrBbjtLiNOp8OazOR7jwP/iQRT1fP
         BH6zTBAcNE1vITA1ldY2Cv2d5MmgQCm8TMsNbtdCM+DYLg0uhTn0e/rj2oCuZrcJuIoz
         MYshRc8Veuyiv9aBsHD6TqXQZTt5kAhZbT1xKEdKl/U++ZO5uMds8bwdUIHEXiQFOr92
         qk3C+AqrdhLrwiqrlvyL+4RZLZ4NZJRvG+cjC+gm7W/L7T0e05rMXBC8PjfD5JgRnYhX
         fq/buP08yHyC16lKUDCe32fwnz2ZCk2rT/3A74yNt1ti0nixXB7G0IPkSC8k6/35zKrT
         hPfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790180607; x=1790785407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vwFPNenlD2vZUkkMCjc8UFuJO/cF0xzireOhDjif8kw=;
        b=Ioy2mjYgXsOKOftjhvkdnHm6meYtlO6HEwL8bhTRomSTnVJOj5EhELc+ZE4BWnI7sM
         66wk6GKrGd0sohohGJh/ZnX0TYBFCTkODFQPls9iPllmiIPoylH1WOX9oO5+V0p4YLwo
         RqK/nXrQhBfr93oyDGzR3ka4PCXdKZAjyr7S3Js2qIwTFaVqmCRoGSVE+RnplNaATSCe
         jPSNvtH3PEix2ioG9YDUNMx5aqLsx7u/MseYleyniLbAAwSQlt4WUF6X0U+vZJ/ne3f0
         BvGpWVct/LjkuPN8QI5QLgLe5nPe7f0VIZGLsAqKNClBA5e/RPxRfwQUPJTyhNPt06gD
         gH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180607; x=1790785407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwFPNenlD2vZUkkMCjc8UFuJO/cF0xzireOhDjif8kw=;
        b=PPBPKkzx8eWL9eZiijphtZKfaPP0SAptk0i3Oj8x8xTUX3md0eSVps43JdYr3rle73
         dBBhh1vJb4LRJv4zZDtBofw/Ecj4V8U3jY8ZwxjbBu/s4P/BtHt94CMKHCtErbjCeu7z
         NT4MMbfxItVHg4gz21vkTU6wMTO6t39MSuvRWH7TnonsyduGizChutlLA0zScG6xfQUm
         /eRj5RR4OTZ25zuiEJBPtKlkuY1gMFpslD724ckU0lilJkksDTMjsRFHtQ8Qj1tJUr5b
         SqGgdDDAmJm6pbEUstvfKyvUuS2Vp05PGPjldYA2heL6fy95XlTqDO8APa0GtPDBgaA1
         UzdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgV0w/p0hpQ+69ah1s7FrlY4XPuV5vItqEU4Mw0qgZyC1+UsVo7wpWBvQLI+/eeo0hcCvX4oyfhrCXAGA=@vger.kernel.org
X-Gm-Message-State: AFuF++mNJ5hyxYQZS/sXuB9phnNh12l8tlLkeGydzG/mGKMh6HUXgEmw
	YqVOuIjk7era8Twun6+GGsuEncLCKr8oLnU/cG78DADa8LWPo19nNgnUwwOy60/LSOwKxQ8gkHi
	4ibOhtnEQ+Rupuafthn3Bsgiz/KeHTAA=
X-Gm-Gg: AYBFou3tf2VDcDbzl09aVot4UU6NhXTTSXpwDzox0qJacNHyTH+McDZiMrd4e8xyPuV
	Se+gvL8ecj2cJSvJIYDqlEG7q/jbjERR3T2QqAsK3AToB8wU9Yge2z41KU4sPQyWh4QnDJc8pP7
	8i+ep44HAWVlqTPMWzhvw5Xx6gUg5cxVQStEUUwF4bSzLWGLLXH0hcBbyJBaReLYZxTyMgRABr5
	7u/hB0/soz8OI3D5FwfDRN7sSgMv69xnI0nzcqOP+0TUBqbRpO/Jrpz6hN1rTHb0JQhtKHbuPsA
	OR4QoAdJnyIp81JVA29JuJN5/hKabavjtfKJQQ1iQJCsA5xjCf6K8raa3EyjSAc5xZJsQtbX/+b
	8v+Mk1VUTp+M2F9ZHbNWH9dGsN27CFiSMcaj8srpKgh/4LlV1VOaFNk/8HHbLHsicW6Is7cJqVV
	wFqMjnew==
X-Received: by 2002:a05:7300:56a4:b0:33b:e74c:e43e with SMTP id
 5a478bee46e88-33e8dcc6990mr3004307eec.19.1790180606510; Wed, 23 Sep 2026
 09:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-fix-pcs-lynx-an-v4-1-3f7927606d12@gmail.com> <20260923161815.qakiviia7lxbu34r@skbuf>
In-Reply-To: <20260923161815.qakiviia7lxbu34r@skbuf>
From: Patryk Biel <pbiel7@gmail.com>
Date: Wed, 23 Sep 2026 18:23:14 +0200
X-Gm-Features: AclHuK-4CqNmQ3uz5wZ1gtFHH-5gwAJSHllM9xsvhEb1dBmioHG3CI6Fp9cWo0g
Message-ID: <CA+DkFDaDQkA1UG-5NMwPUUOxxgiOKGbe1YoFt10wT_207yRHeQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4] net: pcs: lynx: enable autonegotiation for
 10g-qxgmii and usxgmii
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 23, 2026 at 6:18=E2=80=AFPM Vladimir Oltean <vladimir.oltean@nx=
p.com> wrote:
> You are supposed to carry over the received tags from previous patch
> versions. In this case I'll just resend them myself to this version, so
> you need to do nothing further, just keep that in mind for the future.
>
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for the patience. Upstreaming is still something relatively new
to me, and I guess it may take me a little while to get used to all
the conventions.
I'll keep this in mind for future submissions. Thanks again for the
review and testing.

Best regards
Patryk
