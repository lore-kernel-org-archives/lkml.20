Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372124;
	b=b86bx6DPEf8cRrIEyU1et5No4c2/WJ+t5hrpOpX5c7RoRh4XTxVFBD3p0hh96q4yt9IE
	 KB7b8L79IRY65rYpQVEU6oMfIB20xjh/IrgSM2uRycG1FmEWNwnC7L3dXlGD2Sw28zrZX
	 cmI9X+0BzYpC/hEGhiBk8ha8n2V6vNsFds4W+xVB+tpzAnvPrpSUiMYJoghYexrT+qJqa
	 ltNhPQtf0ET9dSxy1Xx5Y4ObZM/qyH9H9FyVegZ5BYHiKGP8I4rAh+wUuOhZ1BgAtoQE2
	 e5ap0Y4yoC7HMPk3eGm3iOZ2q9+Iq8y+l7yVvMZ5uYxSxmcIILBkc9OUpE84STXPNGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
	b=hYsJLDE9tT5oL0NnUShbe/xhPcwkB59FU5b3d8LoMoGsd7tL/bfrwUvFWAUP0R78e686
	 8Y7SjBbA9lLKQ42+hb9W3M6YzCl0X8PzvIkrA/ZVRLYLBaA8ff87NKcuVyqT6Cdl/ft1n
	 OFIwODL0nTvYeMvBAD0/hwy6rfYUzN8CnBaLxL1xipTrYCEtR2QsCQVzIydeNxUM78VOB
	 82W2EyVJQozv22SQPq8tqIArB/ekAtoE6Wv0uBjffxepQycUcntg9YbH1gRWRg/yLwt7A
	 LrBk9NL88WSHisRp8CzTzh4gKCr8jUVtMc/v+BAbm1FvlBnNsHZQpnFs0LcRok8AKDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tb8EYn5U;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E38606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E38606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tb8EYn5U
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so1948461eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794372123; x=1794976923; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
        b=Tb8EYn5UL5TPN4jrj25I2JBolJE+4LfY73wyOfqANHUNWQ//ZRgSlRYHUVN+LIB2we
         MfjhZtYgorMdYNUUdWxpYmku5O5oKZ5DXLNNPmZoqDaFMmvNL4HwqCrDmRa5DFYFoTwJ
         Q63GoZ/tv02pI42Ch0YDvkYx/G0C8eJzTUJPlQfYc6h6Cdhj/Z2lNDN33mqpZalTb7sI
         zFgSrDJbeHJ25XyiK3oz7d+AXggzRSfVZT+wwmfeRA6sKT7+AOMlNUl0NKXAb/8A/jyh
         Px8hGxqnssvWdlULG6GGl+pi7O/1Am0iOHjypP8QT4Hg1vzoe7dAX04wln+YCX5neXAg
         RqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794372123; x=1794976923;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
        b=UGSVd8FpWyMd1b+ioVKx5ZeFg39J8qFS0u1jPSfXtCTtohEEIUQ055HPeBIiVx+4Q1
         7V3y6DssIL3EAqhRwPDHiguY9/pWg99JxV515iYzCbAa8or8s7ujLV+lkUrr0RDVrQBB
         j9og9VLZ5UsjMs9fUjhr55LvlKBw+iCF191fy6lln4qRyDE2/9JuEek8bywJGkDsEZDK
         1kGM0NiNpdVpP+rajbxhVqxj7T4dIr88xR01LzhOJl88KcgVTbkq0zXCx/EPaErepsvj
         UjE5paVFzdSNIdsEzNsX8w6j7MLcqn9N9eObeYrIPJ73c+C8pxTZOsqddVEfKNlKtbhd
         ElVA==
X-Forwarded-Encrypted: i=1; AL+hErEUWoJZrHJ2AmAkMjMzM6Au45ZVa8fmw1Ed5d7tgv2kkhfro3w96xKiegnLYKi4AJO/0IY8DSy0buM5lC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cFvfZaZI2fZs/xBpPdKTEpmTj5hy1Mq+756C1T9+AkzLVML7W
	QeQ9nP1yldLLMaN062YxBnJa8AyDJB7KtosLs3nnzYQHP4Cr2aQRVYZ1
X-Gm-Gg: AYBFou0v8czZzXPga4m0LLflaDL5tvat9t1gMUw9B05mafgQdIJxTr4cPk/0zIHFDcm
	0nXJfOC0Lj6H5yXy2QGUq+2j0faHVwotaywS2+oaHaRqFNh/kKAaREN5+guDzmWhRb28fyrdNGQ
	CJgoCIbkYy6m5iFBzjDa+SRk6GkX0ZG9hS89OG6/s/bnXr/47XOAEssiiER2pE0aZ/AWuazi08d
	4eBSC0yi6ZnEjKf8D25B16d7YHeXty5kK1weWN7VobT8IMbaKVSiOXgR3pJjR1vhDnl7i1PhXJk
	uEOsdZJluzjnNyaoeHxHmstMY5Z9EUROWLqgZ7nGPTb9F8UyWMuzM9yqFRrSzJnYbBymiTzz3Ec
	n/zX1bOBBFT3YtvKIlCKVUN9wK74B5TJTJEgV/pZcJ8wIiissKHYlovHrv8gBIEbQ+zh2UuwAUZ
	JtRww68Rat3FO1lUuNAXmEV2UkMNA3kVatGUSSlamrNEan/teHng0+fXvvkHW18dLfAdLSSX+Us
	fHaPrgLUvNJKP/C4c4aFfREA8GUBeiRnl10rKgLk8SdfN9kK5pVC47WCP+r/ns2fG4vx7kNPp4N
	Cz51eCt0eQ/0XpDTfzwI110Q
X-Received: by 2002:a05:7301:4184:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-37685d753c3mr2904495eec.20.1794372122835;
        Tue, 10 Nov 2026 20:42:02 -0800 (PST)
Received: from localhost ([2403:2c80:6::10d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm11023535eec.12.2026.11.10.20.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:42:02 -0800 (PST)
Date: Wed, 11 Nov 2026 12:41:58 +0800
Message-ID: <531e628a379b6733632a25d998337d77.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Sarah Emery <sarah.emery@canonical.com>
Cc: airlied@gmail.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bmasney@redhat.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dlan@kernel.org, docular.xu@gmail.com, dri-devel@lists.freedesktop.org,
 heylenay@4d2.org, krzk+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-riscv@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 me@ziyao.cc, mripard@kernel.org, mturquette@baylibre.com,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, palmer@dabbelt.com,
 pjw@kernel.org, robh@kernel.org, sboyd@kernel.org, simona@ffwll.ch,
 spacemit@lists.linux.dev, tzimmermann@suse.de, u.kleine-koenig@baylibre.com,
 vkoul@kernel.org
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
In-Reply-To: <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
References: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
 <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Sarah,

On Tue, 10 Nov 2026 18:02:42 +0100, Sarah Emery wrote:
[...]
> I'm sending this here in the hope that it will be useful for a future 
> revision.
> Is there a v3 in preparation?

Thank you for the fix, and yes, a v3 is on the way. I am working on it
with a friend, and it may be posted by him rather than by me.

I am glad you brought this up here on the list. I had already noticed
your work: the series, with your two fixes on top, has been running in
the Ubuntu 26.10 release on the SpacemiT K3 boards.

I would be honoured to have your Tested-by once v3 is out. Thanks
again, and thanks to the Canonical team.

Cody
