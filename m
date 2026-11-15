Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794768090;
	b=xlzD2TvdSJt1LryykKay/+0x1HUDkzyCIplk4RK5IbBE4iHiyYC8YZ4wQHJTLUG5KmWE
	 JmuU4Q/6gGnkDNoGZQVw+4KV2LtMCnsUTrjF90+AbPe0dJhPgAHfFUhTjqAtCs0czH/gA
	 EvmCIb/pC/Xt+59K79JZu9l6W26R3LgFpX/xnZgPHJj4R9EnEnTseEhOwjtRsxbRRS4Mn
	 Nr4DP3/HfWB/9kcuEE8d65/wa1YcDbwmjAW0clz+72LMBsMOnLBay/n/GKDJQU0jSJbbW
	 aXm1QhCLmgbowHkywsY0Rml910YEfI5UTIEYxQq+sD1q+QfAW6TXvnUpLC4qvROaukw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=la7CiWGsFqOzhn7dgl8xBsCKXVCT6sr1bpOaOUaIrYg=;
	b=cZS6/no4NVqrbVtCVCfCMQoTAYeJXj+xgARhJzGQC2nE5tIH5l9ALEmSfwhgdPNVFM0s
	 rBgbIgNs8Udkd5F9ba19lg5oIeNz7IjifnR5R6PnLe4dkfLRUDlQnsHXY4ECB/f9FHXKx
	 Ewmgyu4Lj4CzhifNGAwaJP2cGw9klDkbX84TWsCLLh0Vo8YzRWn7TQez/ITe45rlNKNfD
	 DUfO/cFf6XW/wXkZ03Xh8W9xG0VeP5QjcwAB8uEWzEYm3+eS0Q4uUGVdZACFNHE4J0lKd
	 merUlil/OOid3Bktz4GbHSIGhwznmGGG8octVnKgIX+VYM1/qSPqSpuwBZprzNEKSaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wHQkk7K9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D71606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81D71606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wHQkk7K9
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ec20398b05so3053402e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:41:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794768089; cv=none;
        d=google.com; s=arc-20260327;
        b=agU5/PmvzoAUnYX5vcRmhlKQQPcfxGDCS2NuuVBVoduZVRu+Lb8KX7RqjcsK1ij0GL
         Rq01D6M06Qe2D+KE4ldbJehOqhfBfb+RaHDzrgJjfOszS9Upyrrt5cjKZ3sS1E7nyUxL
         m8rsYiuCaw30odgCjtoxQ8ATGsE4927TfX9pNFI31GLPIpDzM+BSbaD/HrKd2GVFU3vm
         tXzZpKut7+E10iomsyPhg+BsI+lbsk9tYnYeemxVYfH0dj+KrCzAUbZGxzUFZKfH4unD
         YBN7zKeTHkEM+LNZbySuQRrnyRffx3flTkuatoY1zgXTYXpP9MbggS6bow29UBxfBkt3
         iF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=la7CiWGsFqOzhn7dgl8xBsCKXVCT6sr1bpOaOUaIrYg=;
        fh=5pyifCDf3SNWocmA2wY1fhHeJpAhWCdX9t65CbTdCVk=;
        b=bhVr1IIFSbEk2ESqmakJfLJEXgv8YysHPqscenhLQ28JzdQ9R2xRighXhGS/RuqTT1
         JdroaM/ukzwiul7swImO1k1MEQKMtVd98kJcOttHiQu/EJjEp0dxReZF3Ww5hwoMUwS0
         M7gkF28Pu+pZfuFGBuSA7dJXL50aHLoZOikf79RLAHRUrYt+bAhXSdQhtbI8wCX0o74k
         b9yEPAEkwqkY0N0xEvtj15/XrziBfkqEzBTILfyirnzOq0Ob61jRnCqUTamWfTK9N8ki
         okAuCc3eMfURhYCPaBL2IsOlFCDvrUx2KJ+g2vME4MLnMvokDzwGfPJJzCCG6t3jCRmL
         Sv8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794768089; x=1795372889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=la7CiWGsFqOzhn7dgl8xBsCKXVCT6sr1bpOaOUaIrYg=;
        b=wHQkk7K9ytfA56yUCpwUfQGX4VXfLtqME3HdwvJ0BOGTx8GkxqW/zvNUHvyEikd5Wt
         Mi2VJkZbzaMW0mWwyHgIobEoBw7I4JP+vXtJ10AqWvqS8y+P0K1rfnWbVWsdofpeafvB
         dAJm/sTQ1Oy2pnZM68oenOIHKTjtcV7XVfdBddpOnK+AM4tNhoSlLAQqFdDT8mq+ZogU
         mQ8n8zB+2njhCrrQpHZTciENBDSu0FEXFbB1SjtK3L0A3CvyiRj1XMdFCnBTRPiTNGVz
         IA31cljpIVNPP/n8vWHWddDBV6x7WPU905goTbwAPH30huVBCrzP2Pe/ML+cMVqxnCB4
         vyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768089; x=1795372889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=la7CiWGsFqOzhn7dgl8xBsCKXVCT6sr1bpOaOUaIrYg=;
        b=zZfjmquh528m+7OYyTmx1K4Ar5S2FwSxVVDq3F25pmykqhuOXbh+Q4kG2qIzGD/MwR
         VXHEbaH8oWeJPxAIEPSgbUGclMwiGcMdpU7LIZWp5P+W++5dvTB+iBRq+bmwVuNZLwnr
         BajJBq/kr6Ch2aS74mBL8qt1LNxcfUI6m+hYA+n4gZWHAH5AOPgXh/Yv3Xu2CBXow/mS
         zhedqWjcTioDIpGuyBWeJ8suD5GArgcxm8egnNK1pMXfgzuinjcGod3s/UwCxdL9YRf5
         ZC5Vf2NHiIktGJ7O4WoJRiAyDmpTsMQtsXvadOgbK46UEtmFOKEIfBok5AcmMu1ZtjZ0
         0VXg==
X-Forwarded-Encrypted: i=1; AL+hErHp7ivwlMPZ63oG5r1cOtoYpZE0KmKzsLtgs1LRFYDAb7272Mgpw4y0h7UtUytpeOqgXSnsnypgGFkvOa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8bXZBFNgdwUmfdojrOol8u5wLZ36lBNbhO/UPmnD344iJ+dQ4
	GExV1tAZlCfpRpBqWFC3Ku8wdum/KqTJ3d1ysiloWJjFUDtOaGzKvkinyzDkIhDcG/YoUuNKarr
	nIRDRiMrqFM5dx9tnXZCLU4BkymEPsB+y5w==
X-Gm-Gg: AYBFou35Rg2belImG5iJ5dqb3hItgKwNHJZFk1UlDduutZ7wSlpdojDHfuHG1PA9HEa
	/OlKAyIpggc5GIiCcxtpHghOvtafOcvo20s1o6RHys933qCGvw2xRN9lb+F0i0BnftHyXJ1r5XK
	FpVBF/d88E9JN42J8NQGGBPvM56crb6khbGAXvEEdFZRJsVLF+seXNWn0ga3sPyGrK/XceqEUUc
	9y0wBUwcckLbR0LDi9uw1rP/Tg/GYl3N6vOehG7nG3pyLygNukVjo/Odjmhx1w17qFav6eiA40e
	wqy8MG3VrHQOueNVvSzNQ4ZskcxJsIVgMo3MAuoyBRn+3kcBHhl25Tzj9UmC+tCx3uKuOVT1GZ/
	DWoK7DlD7OHUF06FNpn1JZsbp7Wf4UTYihW3zJyO4ixNB0ytiLig0Bh+VepX/WYunuOC96vQvb3
	SsJinwILYpvXixljQl5giZzioe1YC1LvIaOfGQL3VkN2cliE0d+OIE01SMEiDbPyRWM4f+ghwXk
	6s+FTMMSwFGDBWU7x1g4jJ/g0PDYt+Huk4EA3Y1sLryMCzOhugwbTWo8sq87tdgVYA/v+BJ
X-Received: by 2002:a05:6122:4304:b0:5ea:ea07:b119 with SMTP id
 71dfb90a1353d-5ee34aa145amr3338295e0c.16.1794768089554; Sun, 15 Nov 2026
 10:41:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <undine-1794657516055390723-80ad11d1aac80df5@undined.local> <179476778844.2691368.3325628965924170055.pr-tracker-bot@kernel.org>
In-Reply-To: <179476778844.2691368.3325628965924170055.pr-tracker-bot@kernel.org>
From: Eduardo Mucelli <edumucelli@gmail.com>
Date: Sun, 15 Nov 2026 19:40:52 +0100
X-Gm-Features: AclHuK_SH2v6q8WdD9ZCvc7-ZhWC0kZrWcftUlvCzART8yCk43iPoENrgYYIKzQ
Message-ID: <CAK0NWSM_BH8zsRpJ7oXJ39GEdw+Ziu666XoFjEzXwKWEd=wn5Q@mail.gmail.com>
Subject: Re: [GIT PULL] bootconfig: Fixes for v7.4-rc3
To: pr-tracker-bot@kernel.org
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Zhiqi Zhang <zhiqizhangg@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masami,

Thank you for taking it into consideration.

Have a great day,

On Sun, Nov 15, 2026 at 7:36=E2=80=AFPM <pr-tracker-bot@kernel.org> wrote:
>
> The pull request you sent on Sat, 14 Nov 2026 20:58:36 +0900:
>
> > git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git boo=
tconfig-fixes-v7.4-rc3
>
> has been merged into torvalds/linux.git:
> https://git.kernel.org/torvalds/c/442fbdb90e120c39bc0b27ffdcc6d7733472ddb=
9
>
> Thank you!
>
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/prtracker.html



--=20
Eduardo Mucelli R. Oliveira -- http://eduar.do
