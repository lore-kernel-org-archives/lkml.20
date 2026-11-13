Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794562152;
	b=4ueuQsxocmu9uHHxF/AXen1LEgYPVJKXQXn+AXy9iXRjAxLOSwqd7Zr4cJt8mSWysInF
	 t4i3dJ5QQc+SDOohlrJzKjAPVWxkg0f/rQKgFGlW6Tt/dtwRVTUgSofsAqALTEFWgZz27
	 F/Y294KSsB93iUsT4PX21joZeuHhFDIdAw41DIv5a3UWvHaNAZESWT/7n1Knq2mNaOa7g
	 wxfS6SxVTpNEQSCZwllZ1IulijKQy/PO42zSOPlh7W3oxI5Z5WBrqgOdZRlQI/JhnEHXZ
	 8P2UyHo8kJe6sHVfSaXNvqRdrweWQ7k1VfMHUKHkedSwlJ3FJVhD25FqXo4Niaa98Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XjhMZHTLhubfcTGQOwtx59Gz1meBM7UXW/o/rOqtaeY=;
	b=rGsRaPemF+ZUmWc3mSP0KtmtXCxoZC+9cMxBynXlmAptTGqKCvJ7HdPbo/CeOG35xL/K
	 XoZq+RSP1LgqDr0vJbwgW+JU9LjGawz7CZxKpEQfC14hEUpytFpBbq20N9cBKdUjknQmS
	 uNRCwc5CHD5FibqzxxlGvOXCGlso8XM2gO7FAKF/iWxKb7toPhyO6rpW6YUxcDJk49AMG
	 Mc0IkdES1elNExvQEddPuMBVDBlDdh2J6rnLXrybqIA2eTYdb1xkqLWwbvmdYAANB/g2V
	 TLtQ+0vroBipSfDGZRWVT8R7DIVGhZ1mWI0A5sp1lGYhOro1OUBpuNiJe/ctm3a+6vA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMqBraLt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996E9606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 996E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMqBraLt
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9912c47367cso1045215241.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794562150; cv=none;
        d=google.com; s=arc-20260327;
        b=dsyELocfcZKCdGxwLxIeMxejATmSyY1psCCf3uH4/MYeseMGRuGkITng0jkAxiamwG
         InBX4S2RMiw0IQUOMg+qkiXDIUNxT1Z6k71sA8Xc5RQubK9dzyMBaig+oDYEfUJm+M4K
         302smN0anF+a5rvshB8Tdop2YI8MzoG6NCI3HeYkK5KYeqViCoHwLoumqASyt4aDPthw
         dTUHdzeP2Fo/Ba/usFyL0ELpxt2/qWaxHDysn7Q4OoNnFB2wBLRhsmdgtYzJ8JxmNxgw
         YhyKPQSWYDLe7dyeasCLHXt3xj0bi367uUGWbhXTufB7ivFm8AFbBnCXCDY5PE7VS6VL
         LiYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XjhMZHTLhubfcTGQOwtx59Gz1meBM7UXW/o/rOqtaeY=;
        fh=nlSEpUbTgVsv6tslbwkbxm4aApU8v19A7hl+j3xoTIU=;
        b=BRVfJn6rGU0xWTP8DvRiWURJRGz6hGoCu3rYMZmrv4HIq+SOPqLIfeiU+dbasW+dSa
         Bl79Jv2R0iv2YTZOL4LGTLK/LdXJ1Fh8OFGIjHeWoxix06xohzvNqjO0zcbmuneuI3zJ
         TD8fn9OBsJBwwIkipf9SqVFBqNVjU9ASLZYk3pdmZ25fPW0C5JkDiq2ImsOdGOmThoiQ
         ruMdHoZMbL95iSnnuOxVHl79iFEBWl9aRa5TCHURXC7OexC6e3ev72IUsq5W9k//DHWO
         /JUPb5msFLaHGWOPiq7M88PduHQK0aCrnbzoCoLe1tmdWPBnO4vn66CDwW4aQ0xSRP1s
         xffA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562150; x=1795166950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XjhMZHTLhubfcTGQOwtx59Gz1meBM7UXW/o/rOqtaeY=;
        b=mMqBraLtEgLyaWlAzXEopwmYztVUzSa5fY6JTlz+LU/3cJT9lJte7YycYhjqtHFzny
         eLkXlH28UKYE7jmiCKaskVFiJl4sWkEwo2XH9l9wuiP+irG9hzb40vFnWk00ad7cV4x/
         sQtGIcR2DisML0d/grvHKjRR38Hb9/EqqKdbgMoYJ/I0/n9/oAyuS0TySEMrEj1Gfsyr
         hcGVc6RuNEvbQmN5LWsYBfGlnxsBQ6/NGJnbiOyO/VkQg34eb1PBMcqngc/LJVqrRc7X
         8Vzj860bQOx7bzf2UZzbHk462KJafmxQjvI/DObHvzGQ8jCEp2KoHXqz2xdKBKYc9fDv
         zl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562150; x=1795166950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjhMZHTLhubfcTGQOwtx59Gz1meBM7UXW/o/rOqtaeY=;
        b=0ZFoJggJDjemYIQ+Dx0rhKk+viyQO+J5QVXDaNIHzS551HdXd10LKgBJEAGC7R/Zug
         YUWYe0bZ3DRh3JdftXWuP4RWl6cG/5J+sQ9gD7Mj0+V+6QNRXCBVYZF1GUMq3d/60n29
         3rO96r6oojO+EdEuxaiZzI6pgE55XXaal8RYLOa0DsMqhK1VFIrub/vqg6k/F5Z0ADJy
         W8AsWfjZunppvlrzmk3Q5uEIkB39G8niLUwPHJYPWtGliKjsxqlohKYLxVA0QcNdSmV6
         Yil/G9sRzmpC4vmL6eDMDfK5uG97vZwFZb6AW5rVqujnUO8IGF1tWKhxhuXZpAPb/Q2D
         v+/A==
X-Forwarded-Encrypted: i=1; AL+hErGm2spLN6H+eWCUnge5T39dTFooYOSZEyfKxpNFlHWlqcv5UbicwJRzZpyvbybMzFOLumZHT517AWN0wP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W/0++hrR/+3Mp6dorkBMjfyEjTp1kZXoJEryYin17eSnaPBWD
	N8mIMvEV7WXd3Te21+MLZLI39NCc3lZAURW+EEapplB/l4DWHFNYp2e0U9Z6zXI4S+zL+Zy/IKq
	cpDyIwdFzu5+lNKjdED0QzZ3rLIb4Ufk=
X-Gm-Gg: AYBFou34MP4D5YF6kaivC0Dk18wfkiBQ+2WMu9CvXmaf0Qn4AGRKxB986VLm6VhPTFY
	MkJ1vuf2gqm844Qs786fK5ooNecKxaMhDlxw2rF4QnF4LTjXL+OX4pg1mAtNbAOg8WF3hFCcSqO
	HoO47WZ1da0Pb5d+4RuERq2yMlNL3CRjHvDjxsQtD4qS0Sf8ifIFKOWakP2V3yrAxIyWG02mxHE
	MzD9ehkgBg6Hh+lC/6Qw3JgSUxJlNYNXUyRsAOffugh5gfTk8Q/xTbCjCxlozXx1/nbmKCjfjZK
	oCx/Up/qRwukMasIMMzVEO3wEQPyyDPJfAOWt3NuBps+xqLJ7LXQ6mq69qr6uSeSUDjX9WdK1ue
	CAnHADddanDr7rsNZNPihxVU6lysHlakwvLs/Kw/jNYs1UDnhxiAXVko8tJLg79gAiUnpRUmRHM
	Xzg7JA9YleoaFtGqTJUmz+zTrJgdPCVVkoAnONSn33YXzWH0hHIx5Zn/DbO4p5nmGUJjs4ycUwI
	CIicySDa/fbeU/6AunlP6+j4RupcA==
X-Received: by 2002:a05:6102:2c14:b0:7c8:78bd:fd7a with SMTP id
 ada2fe7eead31-7d6317bd8b7mr1575466137.25.1794562150521; Fri, 13 Nov 2026
 01:29:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-submit-phy-mii-reset-v1-v1-0-02a55f352a91@gmail.com> <179456000126.2168702.17640123049966028359@kernel.org>
In-Reply-To: <179456000126.2168702.17640123049966028359@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:28:58 -0700
X-Gm-Features: AclHuK9oifC_qa-phW-VX8f_5gBCRaopk8ooFtHAGMJHKCJwTqeG0TkqH_U-rIM
Message-ID: <CADvTj4rghWnS0TZygMd-N8iOhRo3C+4mjKtODSQs3whfPD13vQ@mail.gmail.com>
Subject: Re: [PATCH net 0/4] net: phy: restore driver state after userspace
 MII resets
To: netdev-bot+sinfo@kernel.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michael Chan <michael.chan@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:53=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

This was observed while testing AC200 receive statistics.

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
