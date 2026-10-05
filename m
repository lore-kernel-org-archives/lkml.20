Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812A430DD05
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791175020; cv=pass; b=F+xpBAKnCGopKOywetpELuNclXdDuwBLs+TyhDixCfmQIX3V8JwSUtsFYozezIbauiKJ2TEsjShtwsxUw+GUJ4RmPmD3Ofe3IfsDTtqBJvd9pWRFqbIPyzIKJO88MH5QE7Uh1S+0yXBz4ipTQVjGIGtQ5YRqUDm5rPazVE+FaSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791175020; c=relaxed/simple;
	bh=4JaW8TsfEgIYQ0t1F0pY0awGa16inumluGQbcchpNhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcmXV0bw6PVwgW+t6jiVHDzkZBRhIQabq1QWB3YI1M+82EUhuqVAxMEnAEouGoO15uc/dVzdKz8SkpLgQ86TN8oNzoQIcoPAzhtYfPDPCuO+F9VQE7AU6bXsefxjsdx5kImbT3TAnlIrGXVHfOLoOpEt83OHz1PpzBJcsiSGhZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGJeDFSL; arc=pass smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGJeDFSL"
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-826f42e479dso194180a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 21:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791175016; cv=none;
        d=google.com; s=arc-20260327;
        b=oBz2yq4cZ36GGcRhue8mVgf7/ZPmVSetl8zd9CeNy7aCgns0IbjV+aFzduBPG/gkkC
         3y4tQCVayfpyyiDTFtDifXn82yTtxD5LJLhnfBlnI8AAXA76ehRfz6zusVWngQEAq1qp
         A+MuWd60f5XDE3Mp0dnH0C/bjuoEY9A8Iqf3YuttmISmaKQpM9xk012F1FhQ2p9q4NGW
         /LEGTXwgGee7nFF/jKadxiHkbOsfQYECgfv5n9Xzf9Vqo5xQTgQ9dFrZs2GxfOaLQFUw
         cfsshLh05Vdoc1INJ2/7AZwXvQiKPrDdSg5zET3b9zOKAC/T9G059wCBb2ikD8NVNTVr
         YCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jMemwemCDjVQ/IRLCAlo5A+Uc/DpvQUIN6OnaV6i+nM=;
        fh=6SXzmoXUGgFzhi5OpZZXny6OW0vLMyPK5DgEVGERg7s=;
        b=rEAYBZeWRhJcGPuFDh2+CyMTP1mOjrok7O0uJFlf4qOtfU74w2j1pGmv5aDJzDty6X
         CmzVJRoTgYW1seNpeEvv6dtNwXi9nMl0C+XrZvzlE4GWYc9AyzkSb3SKDgsNtRkPNbV0
         b1n/Y7SB9zjqCSCeU+reOPvAl12zwtaTJDN80M+VDF4ipHdbLR9JcxJTO+yAbNKeqH/Z
         B8llYzcmhBnRHWWruB01eov/2rXsG2312UrqKqXkbkvj+Vek4ujvMFrh7RJFsBkZ2J8R
         vM327/1fVRiGNewWLOPzISXfs2Is2s7/o/RbgPlOdGDeOJ/k3yIzB3gsFt/3ZDCo6NUn
         8KPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791175016; x=1791779816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jMemwemCDjVQ/IRLCAlo5A+Uc/DpvQUIN6OnaV6i+nM=;
        b=LGJeDFSLZkI/vPN7f6LghCYPc/jKOpleFeaWKdzZDzdOihg8ozwKHvBFCGqzHZ4+Fk
         iudgg00839NrKv6mRHs4sGjUaTRZIP2J/zBqWcf/zxmzk9q/Eg7P5vp40rMFtDVBOHQm
         H5qEGHr45g/LpgcFQFJ7yGkQXfEU0UTu4twTSgFRcfcUFtFpX2U0tnPt3VTDyNENoxoz
         c8KtIhABRG1vheMUe09gbhFaM3ldigSRskHlFPoeLrPtyPxG6VwINfRNbTS9nKnIBWcC
         ig+rgWHidmPpf3Z/xlxVoU+PpD9BuoRY35M9ePkqTcL2TJfWz8AZRJUvr0t4hbElrfE+
         fWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791175016; x=1791779816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMemwemCDjVQ/IRLCAlo5A+Uc/DpvQUIN6OnaV6i+nM=;
        b=tOjV6PMu9xIN4bg/Q+Xudx8SzDGlliBS9lpgpABQfOiRB/9158NkJxrdbB4dF9/bKh
         +kRoVCqGlVwjXku7dGpLP3bZIPuOTiSRF5Dlllh9vuC+9ANnlqkxbpXkAzlojTKs8Wm9
         vjvsrRdr6Tf9NA/8Kh2Krb/q4vjbhSHE2QPkKLtLntWpaoOYNlMPhoJ8Mh5iLT3x4vWe
         lZ9i/KS7OuxPkQ+ZCR0J4/+KvmUUuyS3BhANis56NZ2XjCT1iAk2aTasrJeEwdBYcDai
         SHkA9wbDYfJO5i8S2NLrTVCz6TXPOsQuf+lYIW7yGBenalHGZJqe/QZej2gDfyBpt1ly
         f07g==
X-Forwarded-Encrypted: i=1; AKwUvBw9/hWSPz4gpe8OhokdY8oePegzH9OZYhPXriSoQfEoNZlKJIawsH1WAcwz5r3OoiHtb20jAiXW65vGQZA=@vger.kernel.org
X-Gm-Message-State: AFuF++ndilzQwpPiwM2UeX9DNFKKso0f5IgB3gYeFWmOV3e9+SI7SScw
	kKVgPKOuh2G/p5x5bGNO0/VnlS85Y090A+iDsPTBei39g9nVRXEcV/h0qQs3CNG15EABSsAZI8F
	Ktz7EBvmauVDVGkvLG/Je8UOIrWDa7gtC3QCesHRK7/Bg
X-Gm-Gg: AYBFou1h3zSZDPKujkiCOC1kPqRHUXy7qAiDe0lHXJ5sGw+ABKUFjJFgj6MuMeIZWMp
	vEqfJIVfBiBltrJQRDYbucP00rybByaVI0zVwXl1f80q/AXYam2a7WnuaalnX8e8/YR+f17shzL
	mS/SDV9q9Wn7ZERTeOq2dNMKMbdFIOEehRxkORvoQsEUxJZDFQUcCQMLwxC+A8yRZAHHTrIOBxs
	xQrbb23L4o0WtUCtVzwNja2IqoMvFhpHJLwlNWonmFK3DT5hatZydo+dkV/TfrE2l/2qUH9LWU5
	uhG01SON0MOo/T2QXgZzyGjwD7IKKLKkqocuBBdH4c9GdNtP90erqqN9sODOVIJZZ9AayyPrGZV
	+53I82YZaNlHPgahp7v6M4tkiBQ==
X-Received: by 2002:a05:6808:169e:b0:4b9:a829:f00e with SMTP id
 5614622812f47-4f529a2c191mr8446849b6e.26.1791175016138; Sun, 04 Oct 2026
 21:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005041525.49111-1-xinsheng.zhu.ny@gmail.com> <179117397560.1402591.15477443356899321449@kernel.org>
In-Reply-To: <179117397560.1402591.15477443356899321449@kernel.org>
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
Date: Mon, 5 Oct 2026 00:36:45 -0400
X-Gm-Features: AclHuK8AQ_fJPqH9F2RpLy5B-liqnS01GJJ2XrnacHzFOOm1bTKvMDyxIGNhDR8
Message-ID: <CAFGKm+x2563P6iwWwrJq1VaLJJEbodx8-f5r6Fe41R2f1wdbvw@mail.gmail.com>
Subject: Re: [PATCH net] net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oliver@neukum.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I noticed this while manually reviewing usbnet_read_cmd() callers for
short-read handling.
This is a theoretical issue based on code inspection.

On Mon, Oct 5, 2026 at 12:19=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
