Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F6D1C28E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261553; cv=pass; b=C1PQfH6oYG53rPNUTsFvIjo5SAzcu1Zshtkcm25hY81I6/a5cxOKsKwpoI2Bm6eKAVg2B4GWBEgY444GzOXmA5lV7/uyeEYTPc7+5GPIHYy23Ou0tAXAFJOqM2IEz8Lw4N7uZiqoXiPIHK1NLgPu/yZ8bWdT1HxheSGkT1A9/yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261553; c=relaxed/simple;
	bh=0zD50AresuS4NxZBuKlzPnhqOGy0n6PBx0KxjwkOhVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=peEPA0sf/VKLieMUNDizTMusfLFJemV+PDRsOZBaWFyWotGSBgd/y/kvITSt99Ys7wjOp2w0kG1vxH5rC9o0Lef/qR+2wD54k7+GTawUoRlXquG5GI1+/mNhH00l/FKXA/4ot5IbnCoahh6lZSasiJF0R0IQqvlIM9s1sMqinRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5RwE6jx; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5RwE6jx"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7c1916da745so385259137.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791261550; cv=none;
        d=google.com; s=arc-20260327;
        b=po9ioxm2WTgstXWiWAoDyEPPNcpLM+7KDjNyhemACsNvkY1KoOGTcPEXbUyFdoeS8+
         icXbCU0osw7tmD14CfQoMxMuqxKUx4daj56SuxQlVB1EPHtgzYKgNKyDT5QPoCCkX/tz
         FQYBqMCSr+LYsj+j3RyvhwMIwd3UwwEkqSyMctnfzuBchxTpDjbjtoN295zq38/DIZdd
         Q9GjedNAI1eSzxAPLWXMdQp3bCxaNeXkpfHEzfWaIvGmk+uD0Zhu5sWJ/knD38LFOs6j
         /S7Uu9Szg6CNxlDvHnVnVuJEHHBSigxKfeJzWbfV5ZQTacLukrxccZJc3eBW4QgEO+kS
         VN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ONq/W5i5EZtiMOmRR6KrqFCqLA2jXIPffovyR6fm2U=;
        fh=TRrfyh9QhkLXBsC+tK4+NBOZApwdrfGsw0WDoqREKwo=;
        b=pCUOo38ul/GcNgbdLUP1lR1FtE2ZFuzzR81mlPck9j7ifL/eRPb7LbhHRz6pIonGjS
         t27LJJO4MAh+MU/Piy4502S3y7rEoGUWOu0UykZzoca6R6+lCMfOu+cjfq+OBcppuh3I
         OnsyCObbePb3+3gXjGqUtmVXff2t3nLqS1unPLMNHPsKE2k31vDc2GBeyXqDbMo7tnj5
         Bfzr1g1JVvpR1xWPxbLQSQqLhaz89LbJf/p8/u6sldceaCZ3PuL8LNzphLSiqVpr6AbC
         qtxsCWquo1OB+KeFvKg18frxZT6UplCQeqyr/S8Z1BVMUNBGU5/x7K5jKlNfdGMp5eUT
         TyPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261550; x=1791866350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ONq/W5i5EZtiMOmRR6KrqFCqLA2jXIPffovyR6fm2U=;
        b=i5RwE6jxZ8pJVbQ7LtveVV7LOVpzXmXQvvIjIKbTRAvMCPJgzyiHqdOWY+lkSV7p6k
         8uF3GLcoNXwLwUPUlmF51ODRRxtCvBYzrY+5Xssrnc9LjzywXPxZ+6tNNkA4hjc8cOlL
         UUsQJSsLFhWBicLntwCQ7i2k6Nc8ZPcbWOLsPCJT1H2+rCjPW0Vmd1yeLL5v+sGYM/iu
         KaMDaMmwOJnI9dJSJZnc23yb03Ukdju5lSenYzAJKgsDjeK1WHiczTxvzzhsHTdPCwZF
         f/DgnSMHSmJgVMR1QJL/iDQi1WUUrXlJuSY8AQ9fpEwpNdDk0Fh6LmaZiNqb07Oesls4
         KhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261550; x=1791866350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ONq/W5i5EZtiMOmRR6KrqFCqLA2jXIPffovyR6fm2U=;
        b=Vf7mcyBz9QDnCX6yCNCX0dPn9g9QUvCnExevRcZayQ7MQqHzaX8FdeE3FIKy2U0G9F
         sv4zHW7QQS6XTiCzbxs03E0EVCJ9v1oMOYnAZ1EAqssbLiBdZpILyMMh9Nrp+xtC8c6e
         RlKRNW3WH+5RHCXnXS2WPCre49aRHCTqNe8FHomSpXQ68xr0xaqqcs9lKglEFXopqtqQ
         miJ8iS1l2vz26lpkFbWLSBujWz77/fXz0rJqeXNQncvIHo0jBKglX/YUbleF3f+gmbab
         XiuoKzkW+pMcDUCsD56mhBeT4LdLlRRj0DJ0IBpYebv3O7h7dAUR3NKpH9AJd1JDCNjD
         9wEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTwqutgKPvuiG6e0Zgl/Lc8Au6RJVpKJ2sAYJctpZPIoao8bxLWmaXsBzkFxkCfzqW+vbhn4Rid9jPrYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBKsaYT3XpetAJon7UPsz4ZPzc0oCd6MroC+PHbvEcAJB+unhB
	0mzxdHmHSFnsea6TYCAvBVlphZHp8YJMXnURVBr/+Om//0SOqWvJxIkcEEeH6iq3V4qoUuvkFZZ
	Wk/SmTIxiCpJR/ApfN9kbIA6Ke1pdFL8=
X-Gm-Gg: AYBFou0t55kSxmgK0SieKFVWXuEYs9fzwsUhI0M7xcN6hK/U98ZrIoHlxs27m4XwmID
	dZcepxnKCqrUiWreit5qayRxP8iCiScBD6KlGrDC85IEk3N01DWZ8NGswPVdAwbkZiutGrZL3Ac
	oQdVUYImNefGlogaYWnRkzfKlgEhuxDKWyuSKMHvDOlUS1iYJyT06VS+7qeSLUkjVnfe+4EPjKw
	yWRpaAlL0Kodv1WRwdlfbH0DxoI0I7ceqlARV1AvvuHPEfG2RgIik/Sb0Ct9gB3QPBXgHiGgwNU
	38j+ymeX1uVnpR/J6WZHnLnR4GGhwBLrFYw+tSxKv4K9A9dsr4/B+m9Y8Bm9NMGYHSHonRufAyD
	29pTrpZPkvzjKmyLnf9M3O7cg4vO2WRRldnHUM3ZtMfdQlhZi2v0SZaZ8okC2K6iTyfSJ+MWtpM
	wm7QJqCPQRlblpwBcAMIGFtFqhyPbdkrhYsJIv79FdPdMoAEAUQMbJUvI=
X-Received: by 2002:a05:6102:4421:b0:7c3:874d:60bb with SMTP id
 ada2fe7eead31-7c87a003906mr20133137.5.1791261550653; Mon, 05 Oct 2026
 21:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-xsk-suspend-teardown-v1-1-a6cac8c030be@gmail.com> <179083158364.31693.4968269038838216649@kernel.org>
In-Reply-To: <179083158364.31693.4968269038838216649@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Oct 2026 22:38:59 -0600
X-Gm-Features: AclHuK8x-oUXR4AyeZa7c0_2JwPWEPKzLN2cv4VlS8Xre1iikpXXL7wBlRrMRYI
Message-ID: <CADvTj4oBtxJM5Xj8ThVn_2cW6RCAx+ohc78idqaX1WUP+AM=Fw@mail.gmail.com>
Subject: Re: [PATCH net] xsk: freeze deferred pool teardown without blocking unregister
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 11:13=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Found by source review of AF_XDP teardown during system sleep while
working on the larger stmmac MTU/resume recovery series. Further
unregister issues were identified during follow-up review.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

These are code-inspection findings. I have not reproduced the
suspended-device access or freezer/unregister deadlock in a running
kernel.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
