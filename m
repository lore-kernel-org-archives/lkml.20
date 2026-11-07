Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794064118;
	b=JLdgTbwABJztb0olOf+tYctMJqSTFllk7SRckhzhbUcvq6DuwpcPHbXNMVyl9WG3o9Gp
	 IqPNLCvfi78/Hdg078lNeKFt07daT1X8YFjG731VKUPUeW3b4RATC917NTjA3FQhjjbYk
	 Xb/FPLadvRaMqX9OJb8pjJVS1uur74LSpddToTBiUXJp19mclnflWje/6zA4QTY9ttlYW
	 Tm7f6m5VaEVyEqn0U22NmK3Pl+GSnq+PuE+x90JIF7wleOUuy78g4lpe4FM+74U/gt9kx
	 z8ZWIqQ+ahBjS3Dt54cPUQoL4bb/NwpvswYqVFD2HmJG6DSrephWrO71uvj4xy+oHKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ALGSenX0zs2BVHF/84nUUmepv/GDcgnI5RNZWHPQC+I=;
	b=OQC/AK9SEOevyQQxNuqXPxO47RBSlviZS46R+ihm1vT74EsOV8ewHYeySWv7msZSxxjB
	 Xvpon9xwZbUlQZ7joMzksD+bCNGuyoRCnRG2S1nunaooCOxGzPQGzlZxY+1SQxBf4R4HX
	 I1FwpE53taDxQn1Z687e5RJG3xoMRCSnH2XjasmYRKyll+66xPXoDlZdVEbrJ90whrDGf
	 vrjRd6tSzWhQHHwDb+/5XWeB9gLitjEV2SwnfgxIKEZwBlo8CZTDPx2roB4mMktZQRveP
	 5JVpBTpxvMAT8r77lJUq5AksGEf/eEue0Qdc+CefhfJDFP8qsaJhutMOA8cf3hMiznA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JV1vknhq;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B742606D839
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B742606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JV1vknhq
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eaf34452a9so554813e0c.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794064117; x=1794668917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ALGSenX0zs2BVHF/84nUUmepv/GDcgnI5RNZWHPQC+I=;
        b=JV1vknhqyz68CXblk7gJJEBC30Y31srYk2XDMjYnwMH9498cfA1iexxosTCnNbEZZy
         hzmlQi9mS5eh/uB/LIKf9M6obAQZdSM9XSCkm0rHeZQVfGcTtyCGtGEpK9ttqbUjLZUb
         /iFAZ8BTYWoDKxySIgPu744IUaOwOEU630Wl33rM+O6wO9sBanuUcjen+4gt5/FjsxB+
         E1Ag4O4IGPq6fLw8N+0LKwHXjl6mLo0CuSwBz5Gv7sEIWV6B7pTfMcr4E8ObuxucWql4
         B7dF6RojE7bezcandIg4VziQxbb47WzVHiAjAG+j0V+kVmSuTGsfwhdAXKwBNySOv3ZK
         hxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794064117; x=1794668917;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALGSenX0zs2BVHF/84nUUmepv/GDcgnI5RNZWHPQC+I=;
        b=A1IDJ096AP9hHtbyNrCNw5UbrBP0PcpH6xxqdLnlN5jSoZrSdaikB+W218RPIg8ugp
         aCmgZ+bLx/QwQylkh/QkSAbne9ew/3OBDLzU5984hqJatns3OvclK/bKz0tSWoIclBR1
         9IBYy0LCwus3PLVn0ssgZjlhwsJaTJUV8nLq5hlOkrZ2TbZ2e6P/ZsSO29jmCx21aZkp
         VAfZ0RqqgVYNpikOCsxSQ57cvCbTf2X9bi9/fZOTA3mXzNJ75ImpMiM1YXBGcevNFKR9
         TW8FCd5LaxGgx3FwuzGKTe+z0oRwOGa6i7f10W+52j59jLxoSTmTuF0EUcQ0JX59y3i8
         47Tg==
X-Forwarded-Encrypted: i=1; AL+hErGB8GnmtmUQh2tGmwH81vdF8lWL/JXTJVStwDl0vxmUtKBn3ffuavaUGGnNUcz31Gyb/XbFCjA03/s8N5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qgr/iKc8TT2/95tSyFeknqyxCtZQVKb0rV8S/UqL0XcaxIiTR
	REruDD8GTUUFehI94UTpY0H4Q68E7uXZyJhOXlATuHKTWsJ6y0D5LQda0g5aVA==
X-Gm-Gg: AYBFou014nGzUy4QwoIuhcQX1aHlUpjFXHPhTqyEJju5YWlWVXAyprOhrhsjerRNvNy
	u5d2tKxKetv4Qh6XDr4zf2hSw6czWLZFqh3T3lr0fRclY+zb/qV2vSf6EX+soIp4OlzSYCk74Y7
	QAUF14IS5RPHk0QTAZ5sw00EIXUHq3Nm/KnqBPt65UCE/brX8PV8PHA461kJYrDNleN2Z2rFaEO
	NrIR2S6SBZUaYq3j0X4fKggXFa1DZ+UkMlPiyBGxOzluR7Emk+/x6+s8S+tlBLAvSQS97C0KQdZ
	c367XZ015T6uAH7Zuo/MYT53bSF23ypBA4u4UX28KV8HBaFZOpm9cunRmZiYHiqT6EAIVi8+0ea
	nsY5MDVe1bHFOPncZem6AbMr6jYj2y9jx3dDZ4nD771HfxVl6mBEvhMW8Nj7m6zd4uHyKDPXdEZ
	UI4wpjhvzI0cAwso/URjdMnXLfalfKjJ2Rb0PRyYM7iWayBwjViJubRLHcP8ydAM/d+0nwbwy1V
	O4ZRGweCyCP16ZQ5TkB1RQFNdlbilxWsyDvcjhJPW2mH2mxH+ojPcdjEYbDrjZdtbfDGTdlHgi3
	gw7ouRgzF1Q0MBG0UBgMcQKDG06kbaeL3rrOMNG6nb9xu1thq42/VnxHpApn6VlCJkdGGJNOgM+
	D2wQ+PNSk5FTjd86uD9XMwXDzfADn1qrZ45Q/P2oJXv5eZncmi6nd6loTATI2JLyR4EHerSQ=
X-Received: by 2002:a05:6122:6e0f:b0:5ea:cb6c:6513 with SMTP id 71dfb90a1353d-5ecd1af4864mr502091e0c.1.1794064117333;
        Sat, 07 Nov 2026 07:08:37 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64ccb58sm3801606e0c.9.2026.11.07.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 07:08:36 -0800 (PST)
Date: Sat, 07 Nov 2026 10:08:35 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Kalpesh Solanki <skalpesh942@gmail.com>, 
 willemb@google.com
Cc: Kalpesh Solanki <skalpesh942@gmail.com>, 
 willemdebruijn.kernel@gmail.com, 
 jasowang@redhat.com, 
 alex.aring@gmail.com, 
 stefan@datenfreihafen.org, 
 miquel.raynal@bootlin.com, 
 andrew+netdev@lunn.ch, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 linux-wpan@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
Message-ID: <willemdebruijn.kernel.1e7cfcaee3e82@gmail.com>
In-Reply-To: <20261107062755.23145-1-skalpesh942@gmail.com>
References: <20261107062755.23145-1-skalpesh942@gmail.com>
Subject: Re: [PATCH net v2] tun: disallow setting IEEE 802.15.4 link types via
 TUNSETLINK
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Kalpesh Solanki wrote:
> On Sat, Nov 07, 2026 at 01:51, Willem de Bruijn wrote:
> > One exception is if this has never worked. If this was a NULL ptr
> > exception from the start, then clearly no userspace can depend on it.
> 
> Right, this has never worked.

In that case, the fewer these weird exceptions, the better.
+1 on explicitly failing this, thanks.

> TUN devices only have tun_netdev_ops and never allocate dev->ieee802154_ptr
> or register with wpan_phy. Setting ARPHRD_IEEE802154 via TUNSETLINK was only
> handled in tun_get_addr_len() to set addr_len, but any actual use (like
> dumping interfaces, llsec keys, or opening an IEEE 802.15.4 socket) immediately
> triggers a NULL pointer dereference. Real virtual wpan devices are created
> with mac802154_hwsim. So blocking it won't break any working userspace setup.
> 
> > Apparently a similar issue affects ARPHRD_6LOWPAN.
> 
> Yes, good catch. Setting ARPHRD_6LOWPAN has the same issue: lowpan_dev(dev)
> assumes netdev_priv(dev) is struct lowpan_dev, but on TUN it's struct
> tun_struct. On events like NETDEV_DOWN, lowpan_device_event() writes to
> lowpan_dev(dev)->ctx.table flags, which corrupts tun's private memory.
> 
> Should I block ARPHRD_6LOWPAN in the same patch, or would you prefer that
> in a separate fix?

Depends on the complexity? If you could handle both, that would be
great. Sashiko would probably call out the same thing otherwise, too.
No preference on whether one patch or two from me.

> > If blocking this proves safe, prefer as little unrelated code churn as
> > possible.
> 
> Understood. I'll drop the USHRT_MAX check and avoid touching tun_get_addr_len
> or the include header in v3, keeping the patch strictly to checking the
> rejected types in TUNSETLINK.

Mostly, try to avoid changing the indentation of that otherwise untouched
basic block.

> Thanks,
> Kalpesh


