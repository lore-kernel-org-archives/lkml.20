Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA81411FBF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788501423; cv=pass; b=bUJYdHFj8PpsFDWUwB1s2RijW6hqPJZzV3nhjJH3xONWyUjdyxPqOVGd2zeCb50++12IqNFSQyF4Bh6r9x78TSggYNjJwbDTcKUJuSnFbOwi74+gCIMIazf1M4Qvy/yBJGNu0JMz0NTDFB2CjFBx0nomWqxeCPu8IHxQ/HoXplw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788501423; c=relaxed/simple;
	bh=erv31jIWtJ3/FEifDcPN2exSNWpRw74SHVnIbN/aM+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mlx+2jQ/MrTIYiOHHr+If2PcO86EYKpCflofrEFKbH83txUhNaYXAwjbSoR473vjEv9rmyWnBPuP9dcTqabSE5s79cy11P0DeOe04KFDFD29ea3EsUOvExYCjt/fICE7JC4tUgVkLHlUeeOqjgVXsXeQwvb8v9g6oD1Hwfzb/JA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leET85QX; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leET85QX"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so882595a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 22:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788501420; cv=none;
        d=google.com; s=arc-20260327;
        b=HW3EaFf/mxKZiEIiWBUPkvceCFco2utQ8aAbarydQwr/oHY2xb3kYk1j5WPZjkkTeG
         fQTuwOhsGsyQBgnqC39ys4Ri+mZUfmbSncPNDNa2lKavRQHze0u0IMRVS8rb7sWy5wws
         FzQXzotamzwYdlcf/xmsnvSmL51ADmor5PR73n8+nlmvn+Mm98XX91UecZkEJECzOWre
         yngYe9BslHm8QF2X0vO7esgnrWHhXnS6WVXcdw2iMLrxZN6nDFoDeKk+iLiowS8vF2e+
         okLP+7HGZ/PwA/PSx+JoBIQDdwKnoV0OsxtCFaqlDhFpEH5lYy3YDxzGXtWMz5MX6Ooq
         D3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m/8a0k+DlG2O5j4Zk3XqfuFN/7ZzoOfWFh+Bgz5ym8I=;
        fh=YpF5+3r4CkFSagk+hBF4Bfjf1nEdYhdyvNT/RhE+9O8=;
        b=Tuw3BzSuY+9pqrJOMIROPIZyf4eG9ea7XxBvcUphQse1x2jo68neop3KZUBRDbs5uE
         Xsqe3WwlXGXSPJ4dv6f9gDRRWzeBj7q2TdHaGj2LYbwTdIy90RD0E4k8dA4fmFd0WruK
         lK7DL6qCiI+qJW7+vjwI7p3JFWXfpN7pdOoNMN1TsoIHBax10tLItuOM4TQOujS49XVT
         ie450GOdnjSwawjUYstJLLN7HttIq0ReJTDXahGNsR1kKcKugBmv1rbvVCNFJR1cLzAL
         ov+9znxwYy84GSTXuZAwUB5TJGhmUrlLyXVYifPQcYlaSP56/vS0SZcxy8rhSixYwMNz
         jlqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788501420; x=1789106220; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/8a0k+DlG2O5j4Zk3XqfuFN/7ZzoOfWFh+Bgz5ym8I=;
        b=leET85QXjCPKMkHFcsfB1ahgJKp6Rmz8Ym0zT1koVi/IvfeNjw07voWme7am+UY646
         PokdeRLSj/WTw0zU7aU6ilZn2VPThowEJ+1iu/I7OLnHZ2pui676DYbIzeI0XOEtmdpM
         JKzePgzOhPCKjVb+6LNDPYuUqIjLfr8mU/rDwtPb3tIXeROYKh1A/P9ddCHsqYdINuK0
         qO1SKJtauu+CrvZK1ZlAfhsOxqViw7coL0omnZfKBpJBusJL/94AFS+x/vU0dLBOaevB
         3WHZ7qmJ2ZrNSc/FL3mi/J6RQ0KSMZ8cp6QqLcym4NknmETD5ZMYBcEX2bp8iB9dpr1/
         3ryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788501420; x=1789106220;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m/8a0k+DlG2O5j4Zk3XqfuFN/7ZzoOfWFh+Bgz5ym8I=;
        b=excFIupde+4m8JdvCQNbCT3zMuZYD4tXwn9ci9OIDapu+I92Oedl/XG4kvzQmQaATj
         h1u34qDpBRcPsMXsk4tEHuQ6yOJnPAOY4geIxdCQ3ysa68hMfS5hK2CUpQRPIPzUSTxg
         yYqyUs34tq8gyND2BFofBVoSco0iUqB5wiHZOlEy4BvNV6r5NSr5pI894gWjj5KCEh+f
         IIQMAhr448MV0FssTgPiYcKDwLwhy9rrLETTV3T4PKosreLULKI3q00uyuFHSjdZ/iAa
         F53FE30Q2/Jp1cngbPm4V5mHk+JbN8k31bmZmnIoeuJ44os+t29UfmO4tqR0yx9y+gTX
         RvZg==
X-Forwarded-Encrypted: i=1; AKwUvBzyqe6AFxsfEDMb9ALwjPV6yodusAof4+0EwqSARUF5a3NDbIKS7QbTR/CDTK8n3FAYwEvY7tRI6kTQ0ag=@vger.kernel.org
X-Gm-Message-State: AFuF++mFZQ8OKSae3ld2UIK7h3eyTpy7md3FNv5yltSfDrpUVvoH77w0
	twlOUg+DhmNsrfY8G3sY9XKWMxRStWETYo4+G5IRD2a1qKQoFvXk3ssctlO/NvIPswSf9OED8F+
	5VOOCCn6FXYO1smdHrdqbVEko1FSYDmg=
X-Gm-Gg: AYBFou0dB+yWiNZSdAgf7hyMThzEygNzgnnYodQHW/eOhDQO+ug2kgG8uWzM6L2sOoA
	czwjCCD3QGOm/DLND0jQ1jrJeyROuw0d8TvcR7SbHhvOv/er9/ZTEmlQCc5NjOhMO9EvhYepL8c
	wS5x7cn2wK4wU1VIcdwDBpoJe6wN6DFStu8o9fDgEgTP2JOHuYkYYBJ72tf2BSQc6+5a3x8299S
	iUNNk8N0QJiIt5/aPbEWHsPYJ0qjNnX+f8v9eNU3mO4if9YCIhRUkoQSG9qz5JqnPrTY9TLY1LG
	XAcHeveEJPQUDapq8StR1oMIhmRqiEGrqLZyAvhAzErgs0FfQhaziRyklB2hKTKQI8uDm+Xu74s
	qEd1b89nmSn66cL6QBDXKdlUgR36ePbZ8ueywAiEvgV15zcdYtnwkM6ef/vtHlLnc
X-Received: by 2002:a05:6402:518b:b0:6a7:ea54:375 with SMTP id
 4fb4d7f45d1cf-6a7ea541ddamr606137a12.29.1788501419510; Thu, 03 Sep 2026
 22:56:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904034628.12376-1-surajtheekshana1111@gmail.com>
 <2026090416-humbly-remix-5d86@gregkh> <CA+_JcNRPo1dojU4EmegM5Fv-YpZqiyd_K7SRz8km1VzzPv2nMw@mail.gmail.com>
 <2026090450-prolonged-tucking-0a55@gregkh>
In-Reply-To: <2026090450-prolonged-tucking-0a55@gregkh>
From: Suraj Theekshana <surajtheekshana1111@gmail.com>
Date: Fri, 4 Sep 2026 11:26:48 +0530
X-Gm-Features: AcwNN1XSZ5qp6Oyq4oJN36p3DEQGOV7r5lLe4xgJagcBsH1HQmfvGIl4Kt_-ITk
Message-ID: <CA+_JcNRkjeS92kc19AvMUxjdQn1GBc+8YJaOuCmZ4w++U=sf1w@mail.gmail.com>
Subject: Re: [PATCH] greybus: cap: bound IMS/auth memcpy to ioctl size
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Sorry about that. I have switched Gmail to plain-text mode and am

resending with replies inline below.

> How was this found and tested?

I found it while reviewing authentication.c. I then manually reviewed
the affected calculations and exercised them
using a userspace ASan harness based on the Greybus structures.

The harness demonstrated the 2047-byte and 1983-byte copies into the
1600-byte and 320-byte destinations, respectively. It did not exercise a
live CAP ioctl or Greybus transport and did not produce an in-kernel
KASAN report.

I also built drivers/staging/greybus/authentication.o with W=1 on arm64,
and the submitted patch passed checkpatch without warnings. I do not
have access to real Greybus hardware, so it has not been tested on a
physical device.

> And doesn't this info come from the hardware itself? Is it not trusted here?

Yes, the response length comes from the Greybus endpoint hardware or its
firmware. My assumption was that a faulty or compromised endpoint should
not be able to cause an out-of-bounds copy, especially during component
authentication.

However, I did not establish that hostile Greybus hardware is within the
kernel's intended threat model. If the endpoint is considered fully
trusted here, then I agree that this would be defensive hardening rather
than a demonstrated security-boundary issue.

> Did you forget an Assisted-by: tag?

Yes. That was my mistake. I used OpenAI Codex while  preparing,
and validating the patch.

Thanks,
Suraj
