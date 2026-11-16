Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820727;
	b=cmRbcncZTCFwAwYq1dEgrQQWYsyUgqDwTYNBN3ebsNN9U6yM8z1mXcjmYDPNr7MGeMWH
	 pL1IsHX+vbrKvXC+qxbDiNBUHBBnv4iZfracX/q/8n9Jc4k0ZRtG4dyq48sFlO0hyKCHK
	 8LkA80ljjaHtDTLNrHHRABKKp4MPYLDy2X+MkTg+cNJ/GkjmIw1bH2Cej6Xf7RpG5TOkg
	 +ZEXxCCQcn/j8lISAqBFNJkpFsUO6CASPZrCyGeviK7CLajw/dwwiXQWe4bcaIxdJID6y
	 8rMjvoCGr3y+oXgE1yIUUx86htb+dNcWxWwzWXy0WVZtRJASG7fh0q77Rz3sG/DydXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=10u893rXAEpcFiupZuZpxx17JcoZ4ukJ5pGVXipeKIc=;
	b=lKecePdskIrZfTPexB1y/scQPTFicIqQ6QnBoHzUDHzItxhP1b6qHEL7Gc89cZfOVui2
	 smCWyIVEunjLeqIsqZpL3TQGtqPN3iUICJ526j90Ywd5f1hTvN+Wz+Q6q8n0mgOFxl7kd
	 lDJ8JsZxTwWlPrKKutYZ7KTZnMT0jPSyR4gWRSnVcSdQzo4m4vIwPXe42PO1gF0U7rVPp
	 18e/hNASLmyiEDCPPyOwuGzH3o6VmO/ff5H6x5KtDNLT9/Dv1+EvRiMflLFclg4vOBl/Q
	 DLVOVLQip/fJ9nJPcI14cjzNQYJAUooV+h7rJvrJ9GMqEqqYAtFoeiHwFy9WgDiK1kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0qzup1U/";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10144606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10144606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qzup1U/
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b904d10882so1224673b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794820726; x=1795425526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10u893rXAEpcFiupZuZpxx17JcoZ4ukJ5pGVXipeKIc=;
        b=0qzup1U/bvdpamdUfesp3EzGohjqD6ufcdkxabru/+P1e2lLmEhTqvPFxhiQUJLOuy
         75ZaKlgkGDXWyEh0O7LTEEKNc5q+1cotzhdC0E5B5IjSRuna1VXMOyouKiqLsg6zUVWQ
         kKN19bGG5PO+g4HH7bMNQ3kABDLLxW9cPxDnZYdNKQeJbfcKoyaQ3a/l1F21SD81YImE
         qVhuxwwNl3a38fu49yIa4TcsmyRsn+P0J2KPmZCNL/x1uXeIyzA4yamOwAuAxvioSA5L
         xbF9n061Z+WyXWv0kHGZhiWW8KpSOv0SpLn65dw+0PdYFSQFo7MzfGLaDgXXEMTpFU/+
         H9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820726; x=1795425526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=10u893rXAEpcFiupZuZpxx17JcoZ4ukJ5pGVXipeKIc=;
        b=TFBK75q9v5YpfhEsIgwep9hXIJB8w4q3dngC4xgq+c/Br82LBEJTqoxuvvC2PAIZKS
         o7n6Mjpls/U5UaAFexX6I5oZAP29N2Xtqub1zS2CjU20q8HpAKoTEQDUoU5JRrNrl37K
         6YGh9FnpAoA/e01XST5LY0MtjikpzzUBYwPlCDJLrMzSEsJzV7JAfJ7+SPeEfun428Kq
         yj0JMEt+JWm3wpN7C4rREYJWAZd4FgT4dFzH0or0T/yvJQM+O1DXX36owj5Q8ZHPoDZr
         glrnV7eAZaFJFoXfqpV9yBdNWlg/uq/HtKvjoYilcUxL5fmJg3v0sPpfxJbtsKYN/2tn
         3zxw==
X-Forwarded-Encrypted: i=1; AL+hErFUfSibvLFetER2VFO61/MC1un0HAaw2sxQkMpcQmgj0uPmS2QReixI1yRwwwD9eT0BpEbHpbktrhDc3fw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pfeFOVLgqfzC6XFE6YcSJ1Cd6yhCK/YAj0wgUnlsx6QAODT5L
	/qi+hfvbw7CEhG37a8Lpc91wRG9hNmjzkXiTEfIpGbYcElSfYYYlL7SF
X-Gm-Gg: AYBFou0R7JFjrSNcusdlFw20pYqV83diZp2nLoG9Z5zprbMi7nvRXY9AhCBG7y6ILbk
	1Ey5e75mHzKj38HwhPOwFWC6ofMpTW62cUyKG8hNJnvIunb9DuM8PjOAb4CbdwmjmN5pBWSHc1X
	DHR0+Mf7xR6hkW7KFKzcWCUT+slAfQrLMxFxrRliA3eCJUFQyteusvO09VlttFVPZa4u1h+bFBG
	9uLWBEKcBE7sjMRfDAGX1Msqr/7H+w2NbW2TOnpDvloG+pZKFTm6VH2xGaC+CIrqDFJcbmkX4wa
	3WSiU8vDhZtB5zA3HcSxDprUjPp/m2NWPoiGBkUd3ex90/LQDIk+FZpW5/4obP81s4+uxdvWjsL
	FiM/CFCkwjyropL5oqIS4+1Wrlv/MZ+gT3050MrTdV2/AsmLFucsBttpM8zZv9LkATMHPvP7KwM
	EQTJcjA2j2VQbhQRextSSsc6gRdYdvHSueM+sCZ1F0wCaaJMx8SG8SnKzI1zk4G/Gz28t9H508K
	3qxGc5XMmhjAfrb3MH7VXEk2Cnnj306qvdB7HO7YoM8bOCFdJCvdB0FH4bjZuvu8JHr92T86Lgb
	BcQbTqFBvFHk4Fn3CzxzxdymHI8WNF5LGdTNTZllPYqgwmwVGW9zTgQcoOdJBJ4J1L2ZrgUsqjb
	HQYvZHK01bOjjfg==
X-Received: by 2002:a05:6a00:4087:b0:874:706d:962a with SMTP id d2e1a72fcca58-8beb619e287mr9631280b3a.28.1794820726299;
        Mon, 16 Nov 2026 01:18:46 -0800 (PST)
Received: from linux.internal.banvien.com ([119.82.142.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8024sm3286470b3a.11.2026.11.16.01.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:18:46 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: renesas-usb-vbus-regulator: Fix module autoloading
Date: Mon, 16 Nov 2026 16:17:20 +0700
Message-Id: <20261116091720.112637-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <TYYPR01MB66035439726639C9F4C2A5B9867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <TYYPR01MB66035439726639C9F4C2A5B9867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Biju,

On Mon, Nov 16, 2026 at 09:00 UTC, Biju Das wrote:
> A patch is already mainlined [1] with these changes as part of RZ/G3L
> regulator support.

Sorry, I missed that series. Please drop this patch.

On Mon, Nov 16, 2026 at 09:06 UTC, Biju Das wrote:
>> +static const struct platform_device_id rzg2l_usb_vbus_regulator_ids[] = {
>> +	{ .name = "rzg2l-usb-vbus-regulator" },
>
> Have you tested this patch properly?
>
> I had an issue in probing the device related to id_table match due to
> string length restriction in [2]

You are right. "rzg2l-usb-vbus-regulator" is 24 characters long, so it
does not fit in name[PLATFORM_NAME_SIZE] together with its terminating
NUL.

I tested it on an RZ/G2L SMARC EVK with the driver built as a module:
the module was loaded automatically and USB0 probed. But that only
worked by luck: driver_data is 0 and directly follows name[], so
strcmp() stops there. With a non-zero driver_data, as in your RZ/G3L
patch, the match fails. Renaming the device, as you did, is the right
fix.

Thanks for the review,
Nhat
