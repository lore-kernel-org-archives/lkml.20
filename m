Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497702BE051
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562218; cv=none; b=H5Mo4lAzerCBi4JQl/Pg3SR3vptLPOQ+pim69aOOlF9LlUhe72g8UNuCXdwdq3KuBQHHmwf30KWMv0JwDt3xZtZ5ZRKrvaYcYgEF0DQun/FAMwPWdcmjSfmjLdz2CS6hP+SuQLNXPyrfNCo+YEZy/+xHI/w67pRSk8/UksxO4Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562218; c=relaxed/simple;
	bh=LaI524RLHiWVWroEzCiOVLLiqXyEe4eFFE+hiw53VBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJOWnTMdaw/5h9+jhvauJ2n54lcx6BAjVs2AX00mqQqJKfVqZDSugarfOiK0djlnAWb3OfHfoFFujP7m/uceXhome0JiBhBYm9VtB+e67LMQr3YiHgUId77cnbabWtrHkFIoKxQBliYcPBpmdVx/HmQmkcszP7+fEeOLLYvmDTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrkOCCFI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrkOCCFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318431F00A3F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788562217;
	bh=QIFsmUdz10F99DC44yiISatbO4LMo/BgryDqrJj4LQc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZrkOCCFIPkJL9lRqu7wbEsfcPgr9szRWtdXJVkCNjTDTC3gCEaGGvqNWcWiIN5oVP
	 WkvLrxRbHRl2NFOHrSb1uDPh/G5BAXF26rAEpslXDNDNs17rJGoKZYf53snypsTfXa
	 3+9+RRdYIUV+Ep6y7boSBZuXbssLmpQ3Yur7UKnO/Cjn2aLTwxzM12XbjRvfZqHTOR
	 /r1sjiSe9zJemV3JBlBDYAltBllyHOM7W8DczGHLMvUSIETWxG2uwWi5OR5eWnkzYJ
	 7icOCJlpibszmxCkAaAtP6RXpQp6roY0UZVBOCggQy9Kz72ETCGTxb3BskfCkx5ImH
	 4C3mI+SQih3hg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so16706861fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:50:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzIRSA5o7ce8UGNcHrWWrDS7aezjrMg2e/CdeQFyGzdmNNZciDOU3pNwT11yLslEKaMRZxCSYaQnLTl7yo=@vger.kernel.org
X-Gm-Message-State: AFuF++mc6Vqw0jYyQi8AgljSBE7ps1pdf+LiFOkAXwYCNvl2VkVQSjYW
	FlDnoTL2PvwJ2AvaF19S2JX5OTPT4NMkSjyvOFxSE0lzZNeH0owhF9e8CQFyprrZussRfE2v30v
	TZKGnnkBWgVeyvEyYoz+QVzFZuzZJRYI=
X-Received: by 2002:a05:6512:3984:b0:5b6:1a7c:aa0a with SMTP id
 2adb3069b0e04-5b61a7cac43mr1040185e87.34.1788562215915; Fri, 04 Sep 2026
 15:50:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904123207.36203-1-hemanth.selam@gmail.com>
In-Reply-To: <20260904123207.36203-1-hemanth.selam@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:50:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLka3QsnvoRDLB0mmAzMJFb-+yWqetSLxFmzpxf3i_1HHw@mail.gmail.com>
X-Gm-Features: AcwNN1W3m1-Lc4lxvPZ_ch92KoW1rz9j_7ac1OxU__eb1riTgKOJXNVRrEUuwvU
Message-ID: <CAD++jLka3QsnvoRDLB0mmAzMJFb-+yWqetSLxFmzpxf3i_1HHw@mail.gmail.com>
Subject: Re: [PATCH] mfd: fix typo "interupts" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 2:32=E2=80=AFPM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:

> Correct "interupts" to "interrupts", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches comment=
s,
> no code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
