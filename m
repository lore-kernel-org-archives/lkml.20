Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794071594;
	b=1AONcs4vj6s25K2LR61ju06Qms62zv0aNqqJD82ET3jYbvcVF9089XXyfPI1C9dLYWHh
	 hHV/TKbZJzfUKGpbv/OuC3HleCjFtkmi2/GqfCJAO/JQxuy4Om5RxzHD9+I1Yly68Wa8O
	 GJ5GnNr2XRjTIj2zjaHW/b8F1KCtUosqeXs8Uj8rz9shf0ur6Ypz/nIz7jXTPuVRsN71p
	 yhxqPGDFTXelHlH+1YvQ+3GqM4YpRN7QJCwfkbj0+Lp45wPyLE36r8pd3+/UnCC1jSwiu
	 QACuM0CXXPWjN61Y4CW8ARKRRD0mJK1Zp3lGEiPe57IDbcq4qqgKtoTqRf1tzNMGOLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794071594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RrcIjc82wzLHRIBiu7WsbnPLnaaISGaTukITjRMdwK4=;
	b=zlBTZ/nHZDXlUocXfb34UwGHmBiv8eJE9GFCkC3TM5bK92LSQOnyrNeTA984XeApMMbT
	 5PVcCtdWCPJE7qLPo1JtqzpB3srRYFmPjDneMbze6QQxVl+/98tSijNO+6QoxxMotDDdp
	 jVDmbYQVkg+75QBQy9/SHqEGxFJXWfnGX8CCX8V4Dure5CBZWlf9IYiJFh6U8Qq1NDORV
	 aVTZkisCwNst1fFdo1V1zWqlAEtBfeJRM23J7bEbU+AwuyUrjGJks+yzWj1XgZTEd9LLa
	 FWOL7WZrh23MAdy89moy3zZGtV3HMv/1xp+iHJ9kBOUhQcDWZbiN+NSH5HIxXMNZ9iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LSKRq+Su;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6247B606EEA0
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6247B606EEA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LSKRq+Su
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so1278616e0c.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794071592; x=1794676392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RrcIjc82wzLHRIBiu7WsbnPLnaaISGaTukITjRMdwK4=;
        b=LSKRq+Sub16VAsEMonpzRlOiZ8U/Plpyjo0xR2iYyxNNpt3DqQhh77kmf5d1aaRvti
         IyZhXH9yctfuza57fW/gCZP74SmXlTA4YxybQsjf6uITlQpHi39WwbzFBfjmHJuVO+Gk
         iQdTg3oJ9cpYc1ZmoFUBFuz79/TEvjwIL8YDIHzozD4wLMoy4Y2kWPfoC9VILYoSVr/E
         HRWn5S+FkoluHtTxKQiD/DB5X7aHTVcmofLixtW6CNTen71h88Vubkd+QhyfUReog68T
         rEwCnatBtUQqKCoKFSm8v16DmtVOf2V3BoRTUyIjCLyut6lNnDair7haTTLmVaNRvSSn
         TN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794071592; x=1794676392;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrcIjc82wzLHRIBiu7WsbnPLnaaISGaTukITjRMdwK4=;
        b=MDEhIr/JvwWNUP+cP+YlpPdyEaEppnJ/izS0lPrBSO+Vmpd5GbzuKkxTIIcQkmpkMy
         ht7AyWIvtAO/1XEkMOwt8yItVSY7SYRdAsXPEhZCOLOhlAJoaqwhiS25LxUStgAas+Mv
         v/qHllDqjJhzIEMN3ASdnDeGRv4+gqfHPmZXTi2MbPMgC36FBShYZV996FWJOQZC/Zhm
         /VzPsKdrNgCKfCe4Bhjg6alVCsiufqj0ZxA3iIMMlltF1WskPgf4HmxOIZAuM0Fy+BkK
         nfaC1g79SCXObyvF8cBEWfmKzdOQcriN/gG82fn4tVXrp5HHPepAA/QhDtQ38LzxEVnO
         q0XA==
X-Forwarded-Encrypted: i=1; AL+hErE7ZCpysSE54WNxkeEZtKZh81bRKmF7he3ugItjt2ZrG1Fl/GGc4rrK/SBH5+3aNqr7a6/RpgYQv+EzkZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zva8pRQbFKIS2xFk0O0Wxqhx7MX77r81fFyak9GYCnCIFZuud
	qJ992YJeF++FocQGCJufUDPyYEQgD8WVmXtqWOeQHzOtHNtgvv3PWiPJ
X-Gm-Gg: AYBFou3A6gLHnOCrocCB53GDTjl/Mk+hDQ6PK9p/h+5ennJ7ZSdKZS5FOjvC/xigBYm
	4dA9sO/UDp0MxZ2rqJG6yrjrSbbfnb4U4yH3/PbW7vVKolLYwo3QvgRb90vaX/HiwbGRvbZY4fr
	xIck8PRHQuUreNjV6t8Aun+kJRRwNOTturxeQTmzzYrMx+QVqAETz8ksFTItXcDFXCY9sZwlu+t
	Dsc21ZKNQArhIsNuZwLdK/N+H1JlV7UxYao0ZDjmukF30qs7mP52pRJ4c/B+uWp+M82GY5d+vNW
	FN15HhjfyLoIByaIPW8UoEui9BwzBAGi/CnI14F/yvjK2hMSbNCwVteQNIh8adD5CB6fp+9yx5j
	DBbYs7q0BEAtl9wyIR+CvH0vTv2mDS0je+xfyDzNvdKY/Hic8LjUa/7fd525AAHVBStoSGqzfiB
	hB9fvWS8Ic4ug9ob/l2q+07a4eSurE8NpDFE2uF6gFl2zq0ura0YbjZaqtEZ0m+047wS5b4z4+3
	nUNzlfZJ+Hx3GhEhx49fhVdSdQFexWHXztvkkjIalSLkVh6GmY47bKUiHK2E8YBJeKL4WP9SSJZ
	avbTiF/v0SPcgdl2qU+9Dm/2P+3AnE2U8bh7v27JUkoA1gVTY5Ev3TzLwett0UA5doqVxGrl0w3
	TwKpGsTZMYzySA4hWaFO/45XCWnhX8gcfQS83TDvAGXl+vSyfn0XRwjhI8ERyoqo+kPkNy5my
X-Received: by 2002:a05:6122:3c45:b0:5ea:aedd:6087 with SMTP id 71dfb90a1353d-5ecc43a4d30mr2895214e0c.4.1794071592253;
        Sat, 07 Nov 2026 09:13:12 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64ccb58sm4015495e0c.9.2026.11.07.09.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:13:10 -0800 (PST)
Date: Sat, 07 Nov 2026 12:13:09 -0500
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
Message-ID: <willemdebruijn.kernel.2b153da88ae03@gmail.com>
In-Reply-To: <20261107162649.282982-1-skalpesh942@gmail.com>
References: <20261107162649.282982-1-skalpesh942@gmail.com>
Subject: Re: [PATCH net v3] tun: disallow setting IEEE 802.15.4 and 6LoWPAN
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
> ARPHRD_6LOWPAN via TUNSETLINK by returning -EINVAL.
> 
> Fixes: cca8ea3b05c9 ("net: tun: set tun->dev->addr_len during TUNSETLINK processing")

Should this be

Fixes: ff4cc3ac93e1 ("[TUNTAP]: Allow setting the linktype of the tap device from userspace")

> Reported-by: syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9ea34da5ca6100593c90
> Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
> ---
> v2 -> v3:
> - Include ARPHRD_6LOWPAN alongside ARPHRD_IEEE802154 as agreed with Willem
>   de Bruijn, preventing Sashiko AI flags and addressing the underlying
>   lowpan_dev(dev) memory corruption.
> - Minimize code churn as advised by Willem de Bruijn: drop unrelated
>   USHRT_MAX check and preserve tun_get_addr_len(), headers, and existing
>   block indentation.
> - Fresh standalone thread as advised by Jakub Kicinski.
> - Link to v1 and v2 discussion:
>   https://lore.kernel.org/all/20261101092219.1278751-1-skalpesh942@gmail.com/
> 
> v1 -> v2:
> - Instead of adding NULL checks in net/ieee802154/nl-mac.c, disallow setting
>   ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR link types via TUNSETLINK in
>   drivers/net/tun.c, as discussed with Andrew Lunn and identified in Sashiko
>   bot review. Virtual IEEE 802.15.4 interfaces are properly provided by
>   mac802154_hwsim and fakelb; TUN devices cannot function as genuine 802.15.4
>   radios and lack private 802.15.4 contexts.
> - Add an explicit bounds check (arg > USHRT_MAX) to prevent integer truncation
>   bypasses when casting 64-bit ioctl arg to 16-bit dev->type.
> - Remove ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR from tun_get_addr_len()
>   and drop unused <linux/ieee802154.h> header.
> 
>  drivers/net/tun.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> index dcec7311e60..05eb28578b8 100644
> --- a/drivers/net/tun.c
> +++ b/drivers/net/tun.c
> @@ -3362,6 +3362,10 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
>  			netif_info(tun, drv, tun->dev,
>  				   "Linktype set failed because interface is up\n");
>  			ret = -EBUSY;
> +		} else if (arg == ARPHRD_IEEE802154 ||
> +			   arg == ARPHRD_IEEE802154_MONITOR ||
> +			   arg == ARPHRD_6LOWPAN) {
> +			ret = -EINVAL;

Thanks, a lot simpler.

But, arg is unsigned long while tun->dev->type is unsigned short.

An arg ARPHRD_IEEE802154 | 0x10000 could pass this check, get and get
assigned while truncated.

Cast to unsigned short in these comparisons?

>  		} else {
>  			ret = call_netdevice_notifiers(NETDEV_PRE_TYPE_CHANGE,
>  						       tun->dev);
> -- 
> 2.53.0
> 


