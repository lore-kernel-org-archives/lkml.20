Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D8F415B92
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752244; cv=pass; b=aE/34lJKljyprK+GfcPxzraxuhtd6BYoCocOlpdV7a1/hNdxFk4vIkio8RPXf40gmxsPPVRDwByHdu/gpQfgYSLzkqG08hOe80GxHK9b0pWYTg1EI2jTbWlvfOKmz2nXXG8iDIYq7H5yZmuGRbYwTh/eqJkWRb3uCvs+Vy2Z4FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752244; c=relaxed/simple;
	bh=4bW37f5ra0ZUNwTJ/45kz+L36QEIwf8+gHSRR0WSPFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VO6fX2xezqlGhAupwU7NtcgNzPBwEa4YLRGvSgf5W2WTp7eorqqoCRWkDIUd4e9DMxEhW4ujxYIAeOIlbEZq3KzePQJMivMHYYfOoiqebVqIcCdYP5WzkqdLYvMcJFZjBWRSv/kugnru10KSoVCGLJVfFCuH3so1RcO88PSrCeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYO5hL2K; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYO5hL2K"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66d1447e2b1so1032571d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790752242; cv=none;
        d=google.com; s=arc-20260327;
        b=hS987eJq4ItV9Fwg9hOlIGzdbECJOCrDxmgLQq0JftloH90U4xKh4xRRm9i4E/WMcr
         tJLwocnJQu9RbvCv/OJ9UixhGKU8/J6nr/KItxVqmsgZiyW8kpAoZ7G5QTsWWIXYn3+C
         +e+KhuC07G3GaSfGDrB9HMa/q0SmfXXu9sw+I4k7klmGiiAg3/BQaVy4cvyMtNBZil/W
         WijNpnhC5zFc+d3P119KfTvlVNIDitWTNoW0VMGK4bKQ+zX7wBlxQhRv3wn6cDW8qnx0
         E0yHvb0EKVTDMgDlGYNxCdc5OfTShEdi/Lb+6saH2NM5WeQ047KAapvF6gyAcks4PQeN
         NwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t7jVEGjHXgo7KKiRaoFz99MQ7lhB8VYvddwKFIM2yig=;
        fh=DtrfCUXmvYZQXHLyFiEajJqdRi7gUIBOzlnwFEt1lqY=;
        b=ChGMu+aY6AX/M4fKCEXQZzEqpPYL0S7ceiBcPeWJgqJzT1OvfuTANudba/JNuvlefr
         WwzO1XPDBEFlhQ95DW8ZUIRDB9kfyf5YscEUygPdOlgZuOk3tLXlkM8Suj5vWh6qGbth
         1OGPkVY3TrSe9F7oEOfNtPfLrzEKQOPazMbkfDnuBNN8Dn5qlI5ijDhg67XDJwEMiqg3
         CpHSADqO5WZVo3BTf20d+vWyfcDx+xJCYIhSp4m80dqY1saMpLUb65rHv0VW0H71hQ+G
         elssYPhwZwnyDs1X3dueCD6o2fQxEo7ced/+RjpT8tLH8KO4unKdvPdQHJ/xzhyxDnER
         qACQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752242; x=1791357042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7jVEGjHXgo7KKiRaoFz99MQ7lhB8VYvddwKFIM2yig=;
        b=EYO5hL2K+mdt0YAFYJhZpbaSHjMGisYXZeo9vah/zTtT+URy8fwbBYCqfCUglzPssE
         G8hL3K8H+THr5OORtpl3WdfY/MGYcHxS00XqB6yCNcPW+uM6gygySDR+bda4fymL5PWB
         Bx3WbWSjQF+sV8EckwYagi1We2FfMVuytlKbhVZ0e71UkmSQhqBRgMzazLFP207MoAeg
         KbxjoBKTRA+f4NM/o1Cq6Zw/ZpIFMf1nxJwDG0zPbwjQ1UIh7CWMiJ3rS40T57Y4IjZU
         XXuif0JavXAC5HGWR43jQdwIgYegEpCpK89gvFlCCDD7iiJg+ZuAhXR+RPil7NpysChU
         sf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752242; x=1791357042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7jVEGjHXgo7KKiRaoFz99MQ7lhB8VYvddwKFIM2yig=;
        b=xj+JPxI1SS6WWEaUxkOCeGtMBxf/MlnPWLTHg7kiimHY810WNIMbVgeSAa1xBx/KyY
         tq28cu9Tl+sFe13cZH5XWSipESlMpw+aoUMfoJRHHym3L2gkQdJpFEWWP6TyEi1K0Jvr
         rC6dSHzmuGO7VsSqDbVfIUchKAKwNycM73TWShJoQQyIwvUlWYPSrC/Mt8wOIVQjCuPK
         /yaYmqf2bbficqqNhcSbo0HEiuxnny1j584z2lU4GX3sIP76a8E8BzkisTchB7RkfOXs
         MfhE2VD9VEWub4CrNM+TQ2IdF2GIH66bWv6heK+9egVo/MCStETAvhO5C2b9d2eivOC3
         QLaQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8J7r3YiG5Jl+67V9rluZuyakL0UXVdqXZOdLZTOrVdZGd4XO6YDuQvdb2ayCPnZv8gsMeHgHJXkf40hA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh6l+Ut7qTL2Josuhvi9CcU2vK8fvpDuXfIhO0JEMi/elUhEuq
	NPTzEvoKfdZ3c1kmxLRNmq5uW+yS6rZ62VR4eHZ/LUwuPV/0zVkH4NtdY2BJIjil18m0kmo+aF1
	um8kELLB6zZxxBAyZFmIThfDI3GBi8dw8LSe5H90=
X-Gm-Gg: AYBFou1LnBoj0u17M2Vm084kBd5twEMXrFlaWb6UyX8jm8BQhnMIUsKqRsSowLT813q
	XDUqYakLQvVVCmvyr24qN+BIiRhzuc+p1NgXV1eDyydh/210zvyyyTxGVZl5ldGtWdAGbZyFB0V
	DWiqcAUfU/+v46TAkgnhr3ef5ZNl0zX8pTH86MkK2swHyhY/sNhUsrKmEocpf0kaSxbwzaS85KM
	c2jUBmz1l7ziVG9b/lGUuObu6ycFEWJEw19PMPaRwBPjRLIJYOZxhXkTm+Ww93nV2jwKJG/C4pH
	IAKnP1Ev8qQPLvlbjUIbGQ4nsd1g/wFFMXQdygdzkMywLgbXT4tKycqXtU6W7SEE
X-Received: by 2002:a53:d004:0:b0:66f:c1bc:406d with SMTP id
 956f58d0204a3-676835480admr161813d50.53.1790752241587; Wed, 30 Sep 2026
 00:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922072233.19592-1-ginger.jzllee@gmail.com>
 <20260929194434.29937-1-ginger.jzllee@gmail.com> <4f327a8d-48aa-42fa-b580-3b01315f65b2@web.de>
In-Reply-To: <4f327a8d-48aa-42fa-b580-3b01315f65b2@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Wed, 30 Sep 2026 09:10:30 +0200
X-Gm-Features: AclHuK-m06GLd90hWdFL-3PJbcsj0LD0PMP9uNnAqCpxpUvgBztAmWsFtzXywOw
Message-ID: <CAGp+u1bger=5W8eNyAME+3JppL2bhYiYYThQY_R3NcrJC+d_CQ@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: tegra186-gpc-dma: Read channel state under
 the lock
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, it was detected by a static analyzer that I built. I will update
the patch to reflect that.

Sincerely,
Ginger

On Wed, Sep 30, 2026 at 9:05=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > Read both fields while holding tdc->vc.lock.
> =E2=80=A6
> > ---
> >  drivers/dma/tegra186-gpc-dma.c | 5 +++--=E2=80=A6
>
> Was such a data processing concern detected with the help of any
> source code analysis tools?
>
> Regards,
> Markus
