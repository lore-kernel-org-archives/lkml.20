Received: from mail-yx2-f8.google.com (mail-yx2-f8.google.com [74.125.224.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A73DA7F9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814411; cv=pass; b=mjW30UKCoyezUBH6z7/vfs8RagkS4gz4EPpL6vw6p3nDVKhOY9GBVUetZiWr4a/DyX0/w/XcowBHlQvBp6qdpCfDTuvo1AFKZ3MD816B4wMQhDHFV5lVk5rxitHAWH4m35qmyr0tJRTLC6GJA1Kpv2vw0tll9z2Xjk1r4uqr5qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814411; c=relaxed/simple;
	bh=/wyxF/Lpcmq2UAtmRiyEA+9Tty5qfE+H9o7MYaoo/uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4/5d3FxnwKOfYjXHvL4rEH1/nuZTmQclv8sA6C7Y2cSj89jx+54OJVj0p8Js4KiHT0MKRN+6Ayp8lbcDDqCsSA2wZPfGa8SbJCuG3F47McMhkczEIyiTTEiN/Go9UAmfC/ajFbmineabgukSb6qHNGZRUgXkvG44PNydiCesso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqLCmKtW; arc=pass smtp.client-ip=74.125.224.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqLCmKtW"
Received: by mail-yx2-f8.google.com with SMTP id 956f58d0204a3-66d0f3138aeso556790d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814409; cv=none;
        d=google.com; s=arc-20260327;
        b=Nu6X5/G+hKZQKCQflzkxRwLQk6BoGwpYw/kvaPiWfWlRDJodSj9NAp5+wuPPZz17kO
         dnTCgN6rL4DzZ9Ncw2L2ick940Hxusakb0vbZFW/V41t/FboSUo0NZgEuZ1aeiuyL20s
         lRicp+G7KfvyzP2OeT0ESwYs17I6kX6KLxfeSdYP9a4maYEkgTIeWW333uSHXKDuu8Wz
         zvNt6BmgglWXQkcbgtiWvqHvZebs6p1iERb9+yw6Z5j0OQDkaWuPdxvgaT4rWABImn5h
         bPfnweRX5a3geL+qIvAmAoHW7AZJNmiqFPXHoo3kNshS90+y1WKYdAwM3BkLJeb0Obyi
         neZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/wyxF/Lpcmq2UAtmRiyEA+9Tty5qfE+H9o7MYaoo/uk=;
        fh=Oy+w/R6AB4f8GvMXE2ErSndps6sNZ+b8+xmZrmwNLQs=;
        b=NYGhmI4dxPUdT9fJK7yTtwNQITOjsEKr3ywcd61SjOaTL+uImRKWwOrqxjRtNESVhu
         h7euM7olu76Zc604grsXePQ9D1K39aPEvg/iRWK7th7ObwRrh8s/SVzau8VFjRJWzL77
         nf7CEJl9xHBn8XGt+Zu3wLQNchz0bm3lLwWq57R8JiUEN1VdTxoLMw9vLN1EVd7QFTFD
         XZFeW8S8XONgzzxumOJCh/GS2MfFtRZCVC7ZhCapjia2gup0/9vnVdIeldKO15CMPWwr
         +cqtahpm1fMWiq7IWJeEEIr7x5Orw8kZJ03/w6vgYlUf67cE4E+mQvxiuhXscRCnNKFT
         ZfMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814409; x=1792419209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/wyxF/Lpcmq2UAtmRiyEA+9Tty5qfE+H9o7MYaoo/uk=;
        b=jqLCmKtW14QPluHZ2wMQoJ3goz+5H12vTDAaeiJUcNhqGntHZ1X1IGT5/FSa8lYijT
         GDUAvEyQ/J0lcArQdMs+nfO5haeEtcJztcEg4EfkAaN4w5fr5tfsOACT1NRBM3HJ2+IA
         J2kZAMggtBDx5eT2yleb6kcxr7mEd6pZwrse8rKm3ejH6sewj9Q9Owv49A5HY9+LlQHj
         d5fL9Xxzq1KQVd8NfXiDXoPtd0sBLbIZrHRSeBP6+Kgx4GI5RyJqe4dCrV3oWdjswrAT
         9w2LIE6f4KI3zd8VsOfb56IUQ+L2rz+IwDJzKzgg/uX8b5GX9MqsHvhC8ATIfrsITpXX
         hIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814409; x=1792419209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wyxF/Lpcmq2UAtmRiyEA+9Tty5qfE+H9o7MYaoo/uk=;
        b=hAXAt0DOjdONBknKd813C63Qr/BVsvL60NFZAwZ14qO0uT8J+Z681kxS1O49bFgDmh
         m4TOebYB8DZjfxiuWQy2JzHsTzMqwTre+ZTcPchBwMIz0kb4NstnY51T85SsRvM7R9s3
         GSbytlwgQGYWIQAFmoc5SXjSuYXNW3c5sClSVjnreWn9lfotrorD+pWd9jph9Ic/GNP8
         3haWi3Ena12zyXqQJomPaH46Vx0vWfTh2oXG/RDi6Uovag04q2Dn31K7fCVNwqpq/jra
         9maDW+N8nxVNSLKji6xqxpSNL3H2Q1/u1APVrZ65udusLHbe83077avGsFnruAblIX75
         IRuw==
X-Forwarded-Encrypted: i=1; AKwUvBzD89rvnDfyW3ZAYWky9gQskyyY3Q4AaDJ07wyQSODtKJAKNN5huJO631AX9mGwne+5tycyRhUOgIdiE6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYNVtrbuBDEKe1Km0FflH8dM2clSEu9KcKOXBdpfupPZd27gyO
	jXJHiEgmxhKT6l6MPry3Lq2K3P5lTFoIh+/rxszFNyyPwDqhpPePbWZinNHxP6UgKOy9q8sjVxd
	Q3PGVvxP2VBMOnR42vHzRsS8fQVM2h/o=
X-Gm-Gg: AYBFou1YRX294MbbgOWfOdfq8eknR4jt+YskYafCj5cpSNskIqzzfmHStiyQPBc7fuw
	71986P3WiS+XCmfK9DWJY1NFgMtomPY8hG9t+GzhVozZ39VOnLa89suI3GLaWinJg8LC5s8cWO5
	rw6GWINemqpaX58QNajvKGUfdp0+hs6pm93XsiJoQrwmjbC9Aw7q2mBBvAMVfHVZCb/BtJEIBtC
	7r0GihbmNg0jWFW0avJV69UDu8Te0dsc4X/qeaDBZhBStJXjHCiDsacBH0wZv5ThdlEDRxi5hpz
	2Rqu1BN7qKI9t28JXTFwgxO3tPYRCd9yBgHuxfKVYOOxHz6ZfkQ5vg==
X-Received: by 2002:a05:690e:400e:b0:679:5b51:3396 with SMTP id
 956f58d0204a3-6795b513703mr1122750d50.44.1791814409369; Mon, 12 Oct 2026
 07:13:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010021010.19575-1-jianyungao89@gmail.com> <cfb6c91e-c39d-402d-9f70-4b9bf75d88a1@web.de>
In-Reply-To: <cfb6c91e-c39d-402d-9f70-4b9bf75d88a1@web.de>
From: Jianyun Gao <jianyungao89@gmail.com>
Date: Mon, 12 Oct 2026 22:13:19 +0800
X-Gm-Features: AclHuK9MdUApyJ1gGdLPd016vnZ2H_juAMBnJ0tlWD5ohK8HCeWvpaTvl4Ez6-Q
Message-ID: <CAHP3+4D3xg30cWD4obJq7W5VZhrv7bD-afntiOmyq6PybPgg7w@mail.gmail.com>
Subject: Re: [PATCH] dax: fix wrong error code returned from dax_dedupe_file_range_compare()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Dan Williams <djbw@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

Thank you for the suggestion! I will add the "Fixes" and "Cc" tags in
the next version.

Best regards,
Jianyun

On Mon, Oct 12, 2026 at 9:40=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > Return 'status' instead to propagate the actual error code.
>
> How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
>
> See also:
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv7.3-rc7#n145
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/stable-kernel-rules.rst?h=3Dv7.3-rc7#n34
>
>
> Regards,
> Markus
