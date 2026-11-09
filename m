Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241317;
	b=bAC6hLw85Do5UvN03gH7+4dSUHZdsx+eMZcv2IpdggdErx25MG9OztySoIfqwo4R4xF1
	 5hJnyoCS1S5R2owFe35rPGDA+jRZFTvO/TXn3GUKB0idgHOWdwp6Hup3yx5RRpha8x0qN
	 UbwuN7gS5rB3Pe9WmFxKXV9nTIYylN6DbJBPZp3OTQQdLfcHPO2kouwRHegkkXufhTsC7
	 yydRgvKXIBsiqQ6XayKkUqf3OOiSJJLTjmfzLfQfFo80sdJttrPnQrNmYXSggyjQJyRNk
	 u7BnuYdmuqEaZyOETdJJZqNqBM/U1hR10VIlGp25hAX6sXQsNMdUbDEv0vmnCCJkszQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BYPTkk/4BunQr6t7vq/ZOQ1XWuSd/WG5xS8ifOxf1Lo=;
	b=eSOM10fn6S1uHutaTW8RBP1bv3xRBJvWRIM1Cq9k46asYR8UQtYJMLkQVKuu/ffyxTN2
	 AuaNa6u6DKQLblH9ttkxZwt7WX6f+wC244lnq3izRVq9qNGXJlcyYaNK7q2yliymucnAL
	 +ZWbvm/ph0c5L5Mf2Bv2MsuPhCf/Z9j4UmPr28GmL3YPQuuAVmsiN5GbQgOXDguiiptJA
	 IxcMsZZVH22miL+n/28cuszbrV+seiZaPZkZ1qI4kD/lvObtzDwjTzmUXwXge8LNt9GeX
	 QgzTa2pe4labrZZqiBRank+nw5FEfjjOr4vMgA6TpCBvXm5YtadTBuQ4YirSjFat12A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fJs9VWZ/";
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F33606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F33606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJs9VWZ/
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5e9528732b4so871027e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794241316; x=1794846116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BYPTkk/4BunQr6t7vq/ZOQ1XWuSd/WG5xS8ifOxf1Lo=;
        b=fJs9VWZ/D6Zrq4tHCM/tTaabajQiokI5fKewOJzDRs5IS8KspKYj0dDdxANJBHdVMh
         tdaqSjQLDlakszKo3L0QuF9bEIoXXlM3v+PhugbNXBaYEI4WhZFI+TFRZUeDRimiSA3l
         fFMz/rzKb9ZY7w9xIIhsg0i/nuKM7mqi99g3h12a6cMWirwiauRWpPJzT12d/wbwtWX9
         EavcRosymWl7MLB8U0uP6/tZW3EFQru6Ksn9gKBXYyKqRF0rLAUiomE/jQuR2YvdbJvz
         pMpkI8SfZmNeD45z9ekErRNnLuJIiKV/Cp7IZD2h6ImavO05rvL5qjH7vY2lv6B4E8RV
         9qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241316; x=1794846116;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYPTkk/4BunQr6t7vq/ZOQ1XWuSd/WG5xS8ifOxf1Lo=;
        b=VDXY4hZlTGScw8Ci9YpVJElUI0Jpjb2S6eY2MtZ9c5NuyyeG29FyteOYN8UPHeiKBV
         7BlLblDuJHLDDodav/hxW9qfGZDL/S206PH30p6RU0QeaBZg5U7TDPYG7vhEFniwKKO1
         dJPB1m2s28vYJMxNCSIkFZKKIec1UHLvaHGWgbTQEL3RDxWqbGfAG6kHykv5JGXWLPHe
         2uo3PSX6qv8tJKqdGTT5edZBODW6IwkrRzTBWZlGNf97oyz1mPRcnh/tNI1DpH3joXCp
         UzMB7XZa0CEsq33GSDRqudh09XVyVZ0Ofblo8uoT7sd6ACjiWW30V3MZPWNVcsDhqkSP
         4ZfQ==
X-Forwarded-Encrypted: i=1; AL+hErEweNvZTL0uWCx41uc5mRUTKmlJvWMFwHX0RYQKaTE2dQOvjk3dSRLJm5BHRLk3cQ6+xHlyctBDt8I9lVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HJHXT20P9VmXIBfHMjU/iBjqXOVKEGJMXgDQjhIXgF3Lbpir0
	u5QjqLwhqjiTwUQUveMbDK9N+v5Lo/vwD2oNCuHgyIl5sAceQ0E/E3T9
X-Gm-Gg: AYBFou04vEHNX4N2DUWZp6bikXIh/cZWInqxeu5R9QU2N266jfacFHXWKL+ePMbvhB4
	KmnrjApe3MIRj00WwxnmMUSaLU6fkF9IqxfANTcImEKDysl02cfzGrRPAcXOXJ+tXttFHfMAXKL
	0v8UlWJ/edkWIkHjnSjWAWtCxigaqAW9LlsFwhK1BQqFaDr9aRwzyyhVlsbGGgv5duX1qNcA1Sc
	ET4iTeVO2V6+wl7lvhX2QOYAvdf22cc0AvCd8NVALK57LGuKu7mUCklYEi9YgnTF49iu5PAdwWE
	+6Tc0x+dzN+r08QM+Oun/uCXtx1IQmo1v/GXWrqWa6TL8P43ZfeI63OFqFus5vx+qmuFMlemooT
	/O2i89HIijrkRw4WlJ6LjWvPBM/l7kH9EHNWOuAQoHnNGiPaXAST0u3LAUfPERE6MDwJZ+BnrC7
	UosWg8RIpZSQdwpl9Vr6k2OnJXNb4zX0baxU2K+lRVnmufMs0XjgWXly5PNgxxFLqKEeDg70DAo
	zXsPRWABTxbmzFc9Yye5lCnWHp+acwgZYlMOqEds+4YvOPp210At4C1oTKnDp3FyxOhLEQ8gmW9
	vwOmLFZxnAgQkgq+cYm1wdTCoc6PM178CvWeZoF917YMUbHTkmLEcxpIvfgoRG0PadRHS/qvl6Y
	A9+lwik1bkO1yT7aSZPNwj2i53p0v+TjPknrMImbldIW9Rib1VbYtzqsilJelKHBvmhvWmfvEwQ
	lt4dHowvFypTlqQTH+FA==
X-Received: by 2002:a05:6122:4890:b0:5c9:c60e:3a48 with SMTP id 71dfb90a1353d-5ece735964cmr1685538e0c.20.1794241315788;
        Mon, 09 Nov 2026 08:21:55 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm21301241.5.2026.11.09.08.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:21:54 -0800 (PST)
Date: Mon, 09 Nov 2026 11:21:54 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Kalpesh Solanki <skalpesh942@gmail.com>, 
 willemdebruijn.kernel@gmail.com, 
 jasowangio@gmail.com, 
 alex.aring@gmail.com, 
 stefan@datenfreihafen.org, 
 miquel.raynal@bootlin.com, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com
Cc: andrew+netdev@lunn.ch, 
 linux-wpan@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com, 
 Kalpesh Solanki <skalpesh942@gmail.com>
Message-ID: <willemdebruijn.kernel.4bc56403b78e@gmail.com>
In-Reply-To: <20261109083037.22337-1-skalpesh942@gmail.com>
References: <20261109083037.22337-1-skalpesh942@gmail.com>
Subject: Re: [PATCH net v4] tun: disallow setting IEEE 802.15.4 and 6LoWPAN
 link types via TUNSETLINK
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
> A userspace application can set the link type of a TUN/TAP interface
> to ARPHRD_IEEE802154, ARPHRD_IEEE802154_MONITOR, or ARPHRD_6LOWPAN
> via ioctl(fd, TUNSETLINK, arg) because tun_get_addr_len() explicitly
> recognized these types.
> 
> However, TUN devices cannot function as genuine IEEE 802.15.4 or 6LoWPAN
> interfaces:
> 
> 1. They lack wpan_phy, channels, PAN IDs, and MLME operations, and tun
>    never initializes dev->ieee802154_ptr or dev->ml_priv. When an
>    unprivileged user creates a TUN interface in a user+net namespace,
>    changes its link type to ARPHRD_IEEE802154, and issues a netlink dump
>    request (such as IEEE802154_LLSEC_LIST_KEY),
>    ieee802154_llsec_dump_table() unconditionally dereferences
>    dev->ieee802154_ptr / ieee802154_mlme_ops(dev), triggering a supervisor
>    null-pointer dereference / general protection fault. Similar
>    dereferences occur across net/ieee802154/nl-phy.c (ieee802154_del_iface)
>    and net/ieee802154/socket.c.
> 
> 2. Similarly, the 6LoWPAN subsystem assumes via lowpan_dev(dev) that
>    netdev_priv(dev) is struct lowpan_dev. On a TUN device, netdev_priv(dev)
>    is struct tun_struct. On netdev events (such as NETDEV_DOWN in
>    net/6lowpan/core.c:lowpan_device_event), it clears bits in
>    lowpan_dev(dev)->ctx.table flags, which corrupts private memory inside
>    tun_struct.
> 
> Rather than scattering checks across subsystems, fix the issue at the
> source: disallow setting ARPHRD_IEEE802154, ARPHRD_IEEE802154_MONITOR, and
> ARPHRD_6LOWPAN via TUNSETLINK by returning -EINVAL. Cast arg to unsigned
> short in the comparison to prevent upper-bit truncation bypasses (e.g.
> arg = ARPHRD_IEEE802154 | 0x10000).
> 
> Fixes: ff4cc3ac93e1 ("[TUNTAP]: Allow setting the linktype of the tap device from userspace")
> Reported-by: syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9ea34da5ca6100593c90
> Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

This may affect more protocols, and sashiko may surface that.
That can always be a separate follow-up.

> ---
>  drivers/net/tun.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> index dcec7311e60..b50a7245be9 100644
> --- a/drivers/net/tun.c
> +++ b/drivers/net/tun.c
> @@ -3362,6 +3362,10 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
>  			netif_info(tun, drv, tun->dev,
>  				   "Linktype set failed because interface is up\n");
>  			ret = -EBUSY;
> +		} else if ((unsigned short)arg == ARPHRD_IEEE802154 ||
> +			   (unsigned short)arg == ARPHRD_IEEE802154_MONITOR ||
> +			   (unsigned short)arg == ARPHRD_6LOWPAN) {
> +			ret = -EINVAL;
>  		} else {
>  			ret = call_netdevice_notifiers(NETDEV_PRE_TYPE_CHANGE,
>  						       tun->dev);
> -- 
> 2.53.0
> 


