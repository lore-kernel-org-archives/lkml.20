Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815930;
	b=LfwFp8IS83452jU+im8B+8E7BMfECwIXXYptxWrkqcGeTpqP6RBPN93YECuKaIh9zayi
	 4DfmdtMZk9K1fEVkLwiHOfQcdZmZ9Nq4NBADPlMeJy7NWQySpvrW1SiiRfsMjf/ARvZMZ
	 XdpcLlfBqNCVevejejZT6rdJcsqObx1NIlvR1exYynAChSCRNzWVsdptavDXx31C4umrx
	 YqEqAIcTdz9ThUrohsiFy5oTZHC7ht05BgbZulkNqw2ueqZeFMesusKnlcBF1pL1EFsau
	 Jz/7w3j3lxOHcGLeIf8LUAVcsCwLXQQI8b2U9xt7tVWMRx/66laxwCE7In+ytyi0xnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
	b=xYRGZFYEnlIsGJQKsGwuKgAbg+BdiEtebQQUUT1NMfYcTeFSbzb4Wtf7EtawmznU/Eff
	 ks56IXoq7FzI20Tvp/bQX4GeQAWry/JVw+raMjws4ejKRQwwXWDcGKL4jRyIZW1Cjck2W
	 b3TVY2sdetKqrMXSoYODFn/jhbaUdHcuY1jyfyNvqx9WR17xTHLDmgGp6xCdjsp/57ooE
	 axQ3AMAODyOJhxEtdA0nk1+z4FYiBi5zaYV247hb6dYpDF+gbC1NKIuUXKKs4GTi76gI9
	 3lpbAP0nXpohcIiOvGQW5RjmZ2KZeOGOeunQNhU98eg1m+1Ej21dZVc/ZJd7Fg9FEhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="m/LM6ars";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F33606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F33606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m/LM6ars
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so6958775e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794815928; x=1795420728; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
        b=m/LM6ars18o8GDKRmm846P52W5VTEeLVl3zm4E6+Ukoew1PNUWaySYAFTHbhwbIHY6
         8zyWRJ3E+soSg5cVCg675JZQUuiKrI7PnShT86jC05Ju/0/IRheNzvGNmD+npQLbnkn0
         fy8Il1K6Vm+A5YZwCa+xzQ2+KQuOMrOvsBIKg/ExEvAa5Y/VxNmGrq1rCHU6BtXLMwTC
         Wsvn5VDRjOEmowS+ZSTEWPRIhLKHrJyNPuqywDI23KP2brkj28XF72ButTpsWAH9l4pR
         IypEgitHhE/vdzZkz5m5Ua6ccTEUz62Pa2MJahrsFOhrSRlAMMkSQY6/3R5U6hM1aN5V
         0hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815928; x=1795420728;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
        b=yPfbDAdrQ3bMeeBxmIk9X5+A9ftDlawBXMN+yxa1zmzUIm3w1EJmdQg1BQ+WrY9jlT
         F0g6i0RM5wMrz1sD0plGd3jjPLPVro3ypedpRmEi5cp52vgf6x1JHnzTW2k6Nc0zWyRI
         J6Alhb69Ho7N9dKm4xsGeFol9kee6K1POfW9OBjgOi94oIMULJj6hb9U1ATElGMUSaOz
         aHplszvMAY1opgNUBL7QuDlGgeu4S6uXUI8u5rGNmF4d48n1ltDaeAaayKeumaPKQSUH
         1eZGHrWVjj0/TV918wTZf5c4uFl864uDtWKZuPsSrd9PywWpMixZlT7kFFiMo7Ryu2zF
         i97Q==
X-Forwarded-Encrypted: i=1; AL+hErGBd/+7LWkeoNgyqdEI5yI7Lu1B/YSrylaEVEJDsncWXzL5PQ9Cq15lhYEcoXkEmqan5W6IEGYtzsfRVZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QIi8MHo51UyFt1Z6OL+mcV35q1nJ9eok0cQiqucPg3RAKzZM3
	Sm/Hizae9KA5TsR6uXlieGNX5N1mxPj43tm1s946vu1DPRfso/PVAA6nc+s7IBKCbcOz
X-Gm-Gg: AYBFou2o4WvdWDLVmce6PkJTlX6CzW4wolpwIu1vweLYCtx/HuidF16mpWpAnzV2S0a
	w4KqcwVyzR+2rEVt0ThiCvvWsfGyLhsI7ffEIJfIlDfk9mud0yY4c8rENcXhcUNDzfx34jIUNsp
	LcG7Y3fp69gJqSuAnOAPqGeXhX9AjZXuLpj6TVppLKbCefjUTQ31KG40e6fAN3+MFBnvZe/qa2c
	tSTSYgj0tAAmbPFo594BNeJtWF+WIoi9gtjz/YjOe86kJtDyN4y9SjPEhbcLzCTAhNR/DwH+39G
	Gl2/BT/M0rNikhKDVcDm0oE5H40xLOmwckFOGjaLAIugxbVNCLHA+3xOtM50MnNL4ib36Bdwxp3
	+foafs3p9c+DsGGNCM4hRGtvxm61P1Km6WTj3ZDIG8WpQTgdzBVYxTYmDqczYV5/MFnBJNF4u5y
	MmH+knwHo0/hbWpmLvLsIenPW32JC4Gb1qoSXCDsL5fWvhgYtb+O0/7RZcLwgByLUJQprN5CGQG
	3gzG1xy1mljdz59akKLWRIXgff6Z6or7LvAnpSR/L6mIyRKA75CqswqtTUQb/+pXfTBugQ6hV68
	xhJlwdCDgDiPna1QdXJL0B5HtMDJFaq3Y9MufRy2AWKRyKnec8/RUDAKQIHTP80=
X-Received: by 2002:a05:600c:3b07:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb5de1f216mr172834365e9.1.1794815928232;
        Sun, 15 Nov 2026 23:58:48 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm375768305e9.2.2026.11.15.23.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:58:47 -0800 (PST)
Message-ID: <aa32167cd3865049bfe0281b8b651c47f5e1c05d.camel@amutable.com>
Subject: Re: [PATCH RFC 2/4] sh/crash_dump: check ioremap() in
 copy_oldmem_page()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao
	 <leitao@debian.org>, Chris Mason <mason@kernel.org>, Thomas Gleixner
	 <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	stable@vger.kernel.org
Date: Mon, 16 Nov 2026 08:58:46 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-12 at 17:37 +0100, Christian Brauner wrote:
> copy_oldmem_page() maps a page of the old kernel with ioremap() and
> copies from it without checking whether the mapping worked. If it
> didn't, the copy reads from an offset into the NULL page.
>=20
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns
> that into -EFAULT like any other short copy.
>=20
> Fixes: 4d5ade5b29c6 ("sh: kdump support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0arch/sh/kernel/crash_dump.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/arch/sh/kernel/crash_dump.c
> b/arch/sh/kernel/crash_dump.c
> index 19ce6a950aaca..85c0e58f1a59f 100644
> --- a/arch/sh/kernel/crash_dump.c
> +++ b/arch/sh/kernel/crash_dump.c
> @@ -20,6 +20,9 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	vaddr =3D ioremap(pfn << PAGE_SHIFT, PAGE_SIZE);
> +	if (!vaddr)
> +		return -ENOMEM;
> +
> =C2=A0	csize =3D copy_to_iter(vaddr + offset, csize, iter);
> =C2=A0	iounmap(vaddr);
> =C2=A0
