Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793552749;
	b=SoopnudkAaJKgSfPRnnieE0n3SZLL1f0GbxtTb+5q7P7zNNN8TGS+o9EtUqaH8g646x3
	 vXhtaBMRU6vYLBQiAwxR3bd8eZbeQlTxZeDvHZnGpqFyvJxq2f8ns305Ibho2Zh+xE8Iz
	 F3XbqKsfCK36YiUBjxTYFzIMI2Zd9JmHVp7xDQi+lvTv6pF9ONGFIX4SSu+UtLdWbjutt
	 wu6a0tAmnwhTAz+vTIpymlZb331RLqsTxkAp0DV2lGfsCz3dZFg3ndZ1pNeyjZa8h+W8O
	 xDwInwcKrHyhw5hly0rdomrsC7ViATPzATI57hegEjwlH3CyFnh16zolLBG2MFX9wTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WGp4jy0/mnk88TT9DGzx5ZXJaAepnvlzTn4tFZXcRUQ=;
	b=V2J5mGgN6s4zw3hx8PVJqeXZXilbY0SSOTNlL+aTjS9RfQzGm/TvAEiLVr5uuu+DNV7y
	 Ci4vCBVRTjBWwvref5RvcIKmGe9bXt3WfW0KUj7Dn1nlvshwQUQdyxnCVrT2oeTqLiopC
	 tzs3eMM9gW7xnCdIXdYV1/eKDNlZGOGpto80CsowBwIRzP1dTHaVqMaPgt+KsgtooBcvy
	 t37zI82KGy8w5ECLvTHnPaVMRB9qf5EjdqIobKZ7LdNVWmWHyjF8d8Q+QnNpuMqqnKv08
	 GmNPzL3vxj39hHZRddzeV0Tphl0E2p3RlWY21ld1zItsmgbp6/5ly9EHp5om4WQo9dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Z5BYZyEe;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBF1606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DBF1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Z5BYZyEe
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so3955951a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793552746; x=1794157546; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WGp4jy0/mnk88TT9DGzx5ZXJaAepnvlzTn4tFZXcRUQ=;
        b=Z5BYZyEeTmuMSDHQvXppeyFakK9w+gHg3pVD2wgA/AQ8I14M/yjbNnvwPBu/MKtu/P
         7t0f183O9E/rnWYIDCR4DePHOpackA9HIMFYgj948YKB4xB/DqhlXl8hJ3+mDvENkikF
         RK3qqE4gygB+Pg4sm0GnTDvu1WtJMZcamqYwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793552746; x=1794157546;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WGp4jy0/mnk88TT9DGzx5ZXJaAepnvlzTn4tFZXcRUQ=;
        b=ywirBJiUpCvyn83UHX84QCXNCPVXlPWUGiGynSrqjesFZ/XLLT1/wN8sYQ2Z9DYNG4
         ZNTO+3CCskK0Tz4tGa8Jn4myV0evvMLSLHJwToSDcM+pW1LAhbTj9KQFlpTky2tWcyJS
         BT8wMOMmEQLgsU7AISJcBKgh+57NfGZvc3V/cLIvkf5D04f3iEIhcVv3wk0YoTBxGSat
         JaeLZIEWUPh59x97MAje3PkTNDv3Win8sqRfgmN0rOKUFKuWZo/K31caF89LK3CFymGi
         yGLYVwJt3Nkp1pVo5t4lNVBe9lB34g8U5cJVUwklZzH6fBLg1czJC9zgRkXekfmirwHc
         ypyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHgEGNfgBtwCKq9Z+mXVnqMkLXCXdcDQjJt8a1j4HV6g/D60B5kXdBV6dOk6PdOfHU4+5mEzloZ4UXdVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q1AF/evVQxMi9hmvRj/Nz5lO9U2SbI6kvxfljuFf2Xjwrklz7
	YHKomiMKBzcYCkdbWj0X7B5+W+5z8ShJHZWU52A7cI+rPec9jKr5iuZ6aBqkdyLhn8u2VyHr2Yj
	NonWewyg=
X-Gm-Gg: AYBFou2UwzRYQrZNDEiNMB6ALl1gUC6i0hlJhK2BzfanzURBhrhvMIv+Cj9vLA5RvNm
	G+0lcNQYasE1l30JxBcKTRH7oEjFOI7B/qi0MP159nMpJQY6ms1LP3qHmx4DtfTUxAgjHTpZsMe
	mUas2ocdBz2ZIHYKY/LxGyAVDeDrlYA8rGJhVxEKZzaKAJxz8XeD7aIGr+Ir0dNro4zCCb9u7wQ
	oTjargHqoQw3NnyKO9DkOv8kXgxsHO925V9Ot+pzMde+pJbcb1nJ3BxxDufjMVCRybKb/+7BM0n
	viM3GlJw9bV2zHXOvql5lXXYI9v2Z00f0jII2eQWbR6aF17tdszJRkdfABUNvobXNb6Eba4Dp+W
	eh8WA+IZvzcGgq/gv8xrCwXbVN7DMCsz9pCpvN9uNkfY7eeYAJtJauTIz7UTGC1wnQ60AJGbybp
	euFJQk1xFZH6XYPw0f2v7PlgwL7wKGuMf2c/3fbxuDrtT+q26s3buh9El5HhIO1gWXK1kwhbINT
	Q0xIVxx/Q8wC/uoFtsljQ46OP8ZuZCGruix/krwLUxaBEO7JE73Ow4qdwWHLXB/2VDDGvc+7Bgf
	/XJsjhSBddfYbDbyj55D9sfioHZSusa1R6lszZDnR7pN9yg65s5lYpvjSdCQcPSzzXBu4XJnljT
	xlA==
X-Received: by 2002:aa7:c2c9:0:b0:6aa:a33a:2762 with SMTP id 4fb4d7f45d1cf-6b4d3377817mr3923738a12.2.1793552746489;
        Sun, 01 Nov 2026 09:05:46 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca21356sm2341969a12.35.2026.11.01.09.05.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 09:05:45 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso269087666b.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:05:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz+62yYZSGSgDYM08faLcbyrDYtIr6mAlo7CGSnugbXe7xXSom28O+3njeH1kzGpS+Q8TEqJV7ppjdSo50=@vger.kernel.org
X-Received: by 2002:a17:907:d91:b0:c41:44f2:f7d2 with SMTP id
 a640c23a62f3a-c4ca7a4ff1amr616714766b.24.1793552745656; Sun, 01 Nov 2026
 09:05:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024185058.20410953@foz.lan> <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
 <CAHk-=wg0+RmcNDKQ4Qf82-miG4gjZ+CzqjTBET1ZZhkrPBp5Kw@mail.gmail.com>
 <CAHk-=wixKLm5ahcYJ0tZNViP298RNJ_QwDcXN-AheH6uOfLZwA@mail.gmail.com> <20261101084528.53a1e83e@foz.lan>
In-Reply-To: <20261101084528.53a1e83e@foz.lan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Nov 2026 09:05:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wifT3KtYFGxKBTcvOhXZ=Et6vMas95Y5LTCfqvYq6ic_A@mail.gmail.com>
X-Gm-Features: AclHuK8EIYK57ipaNaIf8oLyMNo-kh7kxRzYHxcOr1tewjlRB074sPPF9NpHMOU
Message-ID: <CAHk-=wifT3KtYFGxKBTcvOhXZ=Et6vMas95Y5LTCfqvYq6ic_A@mail.gmail.com>
Subject: Re: [GIT PULL for v7.4] media updates
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Ricardo Ribalda <ribalda@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Nov 2026 at 00:45, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> We opted to do that instead of using merges, as sometimes we're
> picking very small merge requests with just one patch or two.

So that appears similar to what github does by default, and I don't
hate the workflow for your kind of setup. I agree that it would
otherwise result in lots of pointless merges for small individual
commits that make it hard to see the big picture.

But I *do* hate how the commit times go bust.

So _please_ stop the commit time rewriting. It's really wrong. The're
a *reason* there is a separate author date and commit date, and the
commit date should be the time of the actual commit, not the time of
some *other* commit that does not exist any more.

I have no idea who controls that 'marge-bot' thing, but it needs
fixing and until it is fixed please stop using it.

                 Linus
