Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAF23515F3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578852; cv=none; b=OtpbkLujekGahJNCFho17ZpxeYFqB2LvOrHi37KsOQ0uZfkt6T0P+cmTbYL5bobVExaC97m4mSk8G54aRzqX8HvqXwqVD6K/wZbyN7NXrjR6Qv3CC3V7Ax2aMnDycwKxsNlL97Khgo76TCGJL1XDFCzD0GaaYRfWHjsFhr4Ihpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578852; c=relaxed/simple;
	bh=2/Mr8F+V9ZuhdE2vrQspzPF3L2NjVoWL5YbjTnlZDrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DY2L8B1SbWjrmt/AvxrZlcUhgj5xqzr42dxlgkDq31rwS8iTfzMXml+PNOoNA5XV52UL3nLokgCrXUW4i9pwOxNIvprS198/kXf9YFmx2zRNpfJa7Ae48vK42CSuFonFGPCaHTwaOg4ejA+vm6skP669XFotdf3LlLiHB6HZd7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAGQ0wqb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAGQ0wqb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC0F1F000FF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789578848;
	bh=2/Mr8F+V9ZuhdE2vrQspzPF3L2NjVoWL5YbjTnlZDrw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jAGQ0wqbabPy+2R1bFiL65llzbNoTBgxvGo3XboduhMtCRgoYkAwFzLDDWfAwJxg4
	 ELf7wKcxt5BprDCSMgBAXnYHKz+aIvpCssXG+7H0V4lOrUmkm5f8aMXIeHuSjst8jl
	 U6I9k8hgEkAQfqdx/e2pACCRC2c/QczVg8t4xxXj7McueDzRh9FIe+u/DVDqboYTP4
	 ETgIWdm+rZa3DLc3sZztatMbNLOLDhSQnCSLbIk3EtjsoVyEJK6aWdQhKmeEa/y3GM
	 UwseA+9Izt56Ap8jmFcTV5g2/fGRQGdAaNiE0r56j2nU7KaaxaJD+Oo9HbDrly1pCc
	 h1ZMexRWy0wrA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1651cso1170088e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:14:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx8QJbLSmgML7OG5g32u6diVNSPVgj3+rHfKf2LydjAP85b5G/QRRUbdaR0kObAXyw9ymiVMRHqXj2ZDB8=@vger.kernel.org
X-Gm-Message-State: AFuF++loo5VWEfNKP5Msvcbsc4bBgN5NbzHkyef+7W60ICdJFnD8sC2b
	uvWlwjghe08dN6ZoCXkL5kD9N6Ak4eR7y5etUEfmy4y0om03TCevzzZMsObTn6u0sSYSJBDCZhQ
	mfZtsl4/ESXIEVlbGz+yyPEU1o2Yf2Ns=
X-Received: by 2002:a05:6512:2243:b0:5b0:15b1:3d5d with SMTP id
 2adb3069b0e04-5b8b661e656mr953214e87.22.1789578846782; Wed, 16 Sep 2026
 10:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911060917.94310-1-bolin.liu@seu.edu.cn>
In-Reply-To: <20260911060917.94310-1-bolin.liu@seu.edu.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:13:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLmeV5SejT1tEag91RO7jXw9eNtjA27shRihzkA3p3koXw@mail.gmail.com>
X-Gm-Features: AcwNN1VxNG3Resscifgf35MwxVxQqvlhAvkaWR5zg4ETLhuuFq_xzCAqsFoowII
Message-ID: <CAD++jLmeV5SejT1tEag91RO7jXw9eNtjA27shRihzkA3p3koXw@mail.gmail.com>
Subject: Re: [PATCH RFC] clocksource: dbx500-prcmu: check timer register mapping
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: daniel.lezcano@kernel.org, tglx@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 8:09=E2=80=AFAM Slavin Liu <bolin.liu@seu.edu.cn> w=
rote:

> Return -ENOMEM if of_iomap() fails, before reading or configuring
> the timer register block.
>
> Detected by static analysis and reviewed with AI-assisted source auditing=
.
>
> Fixes: 9d2aa8c7961a ("ARM/clocksource: use automatic DT probing for ux500=
 PRCMU")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
