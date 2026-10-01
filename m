Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96943B05A4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883937; cv=none; b=Y9HHX9lUjjiwN7ai4mekDNZBtUHeGSfWPx5txHdCABddya1VO3b4PJbmvoO2O9shhN+iGfAOg/G1s9lbCKJuemvTEHR7NmNqyHMz7nBAGzBmyHZGAku4Boxplyit2ZHL6/30XeB7F4NI1BS8dPrgGlEkJDM6PkCX0YoB82JtfTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883937; c=relaxed/simple;
	bh=33moDgAMLZiqd+hf0XXYFfrjrKIuxRXmRKDthUAbkFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ms46BbNB3hU03qaY/6+/w9iQYczJ2hROlBBOZ5tpn9lC9ZV0nIsnlCOV+/bSlV76Y9/ko9yLrTwQ0xKIQxroiVXwybsam8rMC2T9vVq24pUyRD62ep7MYz66ad4tojpGVT8wEuQpipUWYzLtaYm56D4pSWLQ+Q4eG/cqDHtcrmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDzbGA2Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDzbGA2Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6091F0089B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790883935;
	bh=33moDgAMLZiqd+hf0XXYFfrjrKIuxRXmRKDthUAbkFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eDzbGA2Qxg8XJDWc1LA59xR1UI2Je4OI6ROUEScWtHH2SK7vsl0lGlc8i3+bMf82B
	 YL8nZ7xvjkR193G0c4xENrLkGhUSEMQU/j3NC7zT1KswkWOaL0DUfEQ0ekeEPbHAuu
	 QFsklDuAKDdK98ZCmlOm1k8XvOZyVX84u8zN1om2j9/vIyOhkpYA9aaXD6be/hQZSc
	 Q5kB/cu1oNGYopm8dYVEKGQ6UXBAjF0XTCenTiFVDNU+cOzWIpA4ezYO4PA9MQCxgg
	 o73dAvK784z8S4445T94IDtgrJGapXBmIPy+HdVe81VsAxcEs/fa92tZXvT7Wj3Bo/
	 oZwCtSfvhG1sA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba3fc22439so1869869e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:45:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYu3xUiC/7/c2HKlHKiAw6mU5JdQXhmD3j40si+5RrpiPHhvPqrUFuFwfOYDkLOE+ZbdIOQ0fJoejB7Ls=@vger.kernel.org
X-Gm-Message-State: AFq9FYJauZ5W+pp2IbMM1QV5AhTFpzlwPorqg4nQDU5lZLn1td7FJh9N
	Wnn/dajUjc/NiUPlKLYJvAQ4dbrHomxAIT49XHfQB88upiM21iRxg3UJ0Tt+ZG3gKx55wR8BKzv
	3u2oCTeiGkydd83wD5mr8MN55wE/tzwk=
X-Received: by 2002:ac2:5deb:0:b0:5ba:3ec6:bba1 with SMTP id
 2adb3069b0e04-5bb9bc42fb6mr57014e87.54.1790883934259; Thu, 01 Oct 2026
 12:45:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001123730.12157-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20261001123730.12157-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 21:45:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLmdRNL2OqciO=AY6dgn+NnvT+yoh1+GH2BTaiHqNcZVog@mail.gmail.com>
X-Gm-Features: AclHuK_fGSPV-52TcTzJvjoVjVlbgAHX9FPDV5cSDWzZEh7mM5ZWj0ScQPFySDA
Message-ID: <CAD++jLmdRNL2OqciO=AY6dgn+NnvT+yoh1+GH2BTaiHqNcZVog@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add git tree for the Qualcomm pin control entry
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:37=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> I stage Qualcomm pin control changes in my own tree before sending them
> upstream to Linus Walleij. Add a git URL to the MAINTAINERS entry.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij
