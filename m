Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65109332907
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774407; cv=none; b=cY+3j6A6OcTBycIVlp3oijGwzDhiGUQQg97Azn8N+EUqg2Q8pTKVTUuYSHQRejOrppvVosTQErmHXyXEN1MCqGpdvbfcKl975pKtICAUjLd1YdXaJ2q3zNMQAzvW0aErgH3hPri8krtUBNTxYMNVM6XewSaWYMUWvXYwLkBK8pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774407; c=relaxed/simple;
	bh=pJBXlHq1OFNpmmLLzqbU2cvZX0LaMTVQsIWc7wm7TlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjgvAFbD5DuTW0YTQa8y1wNl6qFPumAdE3yBRTHHfQEAvsjJCatF60zqrPmDZ67tSVl7mz4UFDJKwt8WkGCsef12+X+eFgX4B9yMnljrJ26hJkgwNabj0bBolwOdiZovx9DmZR6MNyaSC68AxxYsiT+NWBKSlZsmWdKwEtt0kJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l26yM4sR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l26yM4sR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93501F00899
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774387;
	bh=pJBXlHq1OFNpmmLLzqbU2cvZX0LaMTVQsIWc7wm7TlQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=l26yM4sRQVQVntMHkuqhI2xr0vqd4R4Pr0zAYb0anDXgiJVFxusSPk+ojkNNpaFiX
	 rspN8E/axPo9owmQx4kCOdtUzUkEUlk4xY8hI1NxSesvaNSsHpwN7aUw6AIvEgM+lV
	 dpk5sTvWf81N1utrrcQB+h/6Y8OAvZWXffGrCgEW/NT2yC6rlqBVRjQic0zuqW6BSD
	 GPM8FQA01wG2vCU+XmL0PNtV7cKU6MUQ1FYOyiJcGZSzonBawEJOy5yOKXi+WRMHi5
	 dTphPBdY8nsZnoSD5wlBFq0FvztD6DshjDBTaDr8+8WHGhziszo/IhgUKVgLDZvDyd
	 HP2e9qU+Hi+Fg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so4869551e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:19:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxa7u98Z2luPVdlB5795KYmmXg5k4uSrmZUPuxjY1XecHahr5NXotErxAdzxzMOcBvTPWl5HSs+W/ZZKZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA+q5Ki2jPSFMO4ndXHOUblgYaRmEf41eCMHa+Sd+QxqEXupQO
	8/Cfc6WTNLl5a3lo/i7qhFQhPUd6mGITvMd4Ayu50hGgBIhBnE+0Diy+SnUukDNKyvroRV+WRuM
	onU9gGJvqVDy095oUqJMoEj+HBbMnYCc=
X-Received: by 2002:a05:6512:2343:b0:5b8:da5a:937c with SMTP id
 2adb3069b0e04-5ba405fdf29mr644077e87.17.1790774386711; Wed, 30 Sep 2026
 06:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917180339.49882-1-sinha.aryan03@gmail.com>
In-Reply-To: <20260917180339.49882-1-sinha.aryan03@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:19:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLm2hMOqjAGq7BCAacCnXKJL_yc6u1nkS5EODENVnT-vpA@mail.gmail.com>
X-Gm-Features: AclHuK8Osm-3e1OZINy-_8-iOwx9Q6Y4zfZjr6XqLptuGmWjVabLOIN-BWaHHyc
Message-ID: <CAD++jLm2hMOqjAGq7BCAacCnXKJL_yc6u1nkS5EODENVnT-vpA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: gemini: fix kernel-doc warnings
To: Aryan Sinha <sinha.aryan03@gmail.com>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 8:04=E2=80=AFPM Aryan Sinha <sinha.aryan03@gmail.co=
m> wrote:

> struct gemini_pmx documents a virtbase member that does not exist and
> leaves pctl undocumented. struct gemini_pmx_func is missing num_groups.
>
> Drop the stale entry and add the two missing ones. No functional change.
>
> Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>

Patch applied.

Yours,
Linus Walleij
