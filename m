Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587695;
	b=SV3alYOWIOG1xmcuqogfndYiLHLIx4uTOQAfi2GoY21Rf6ODDVb7GRP5/aFs8iRk2UYT
	 wGq/buToyd/9sTtzrrUJ3oLU1dGLY+gmg1d7ZMXXRThagcFldSDHkmGA6zeEWn6l3Ca1y
	 CcxDcM1swJzdB977ZvsgKVD3U6E0/AZEOgrT+q5VqhoGD1AzR6h8GEAFDl3llp0jylGSu
	 NMPdXdsoGBFZURPgikfuvAUO542YNnSOaPXTV74I9D61mR7Ui0lyppqW7qJWyl7S9KIDg
	 H6waq/x+CCUKC4AQI1LbscxbV+Uz9YIUUgRvcZkg9jnuriSI93MRpfcv+AehYQurevw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IxeB/5HUF4xSL5RIyv8FYJykd2NtQvs0eRR/c5Njn30=;
	b=UN4DxOPksXf3Udi8ObZkbSCepU9NmWdsMCem3z0qeaqzvKKz8ckySNP9t1IAb83EyUc5
	 XMbhzK4JEMV4DyGgP1syP+1iJ0Ixo0jvF9owuKnktK+geWKy8tJo7u78ScX/JnpDHEwdA
	 lz63SKfzZcb+eSkJ9rSjM0sh/YZy6xlBlLnccEK00hhq28osW7v4/ayoi4LM8FUotpm09
	 yAvbQWvWCT8QqS29tE6cJ7kjt76nIDJmyzfS9YvMSpPR4FiFcrv4oxHsgXhiKbZJhPoQa
	 Oxm3dqxh+nSWYQHWcaf6x7V3IEygniymlbRFWjDxkjVbq3SCGy9lGFol4aXDYX7PE+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRk3+SWj;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15646606A339
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15646606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRk3+SWj
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15943c9c005so80914c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793587694; x=1794192494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxeB/5HUF4xSL5RIyv8FYJykd2NtQvs0eRR/c5Njn30=;
        b=XRk3+SWjrmFi47T+BW8eqendwPWmdwpi9KgXy9BnV+dovb2ge7vNhFjLm16xv6o6ux
         vs8KDvC4qWMFoI4VY6oH1k/UK5kSFBNZ8kW0FCRmojleyATVsyt6brflCeE3BaU1JCRA
         eocl1/Qw1fsH5888Sty4t7EL3+OAaWhRKzGUjw4fJTb86AlmQnxXn4S0e1xqRjkKuTRg
         dWgSi767xghB4fE5WjDkgi88GJeS41ivbBGy9PHocuyHpkdgh2NKpK4zko41yfl0IcFP
         SMETV76yFrDufnc7iCLlADKB6DwJvqzOnYCQ78An/4Ev/l+ZU0KoKo+GdWmEsBvuqklf
         /LVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587694; x=1794192494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IxeB/5HUF4xSL5RIyv8FYJykd2NtQvs0eRR/c5Njn30=;
        b=I21J9j7Kt7gBEIwuYV8Z9rMTidyvIcJUxWsR6BImZzfXyWOomXEn9OssCRpGIzMHU8
         NZkuGG8KXkNqAU7WY6sGJB4afhq3mWFQSrCGv8sjZjhLSkyD7eiQtzKWC8dm73tvXNJF
         J4oGDLeivz7OQmoM/fLM2GJ/f9bgWKKT0sPaHK92dt1QlFKxMAfoYrBTcSGgl0Ac4IWR
         i6YnM8E/teFnIJ1fJQ+tdzvVBP5TVAIi+HeewwEzSenFdUCLlQ62Ym8e/iw+MtVTwOsb
         usnIEkcX2gbvRnkyLqpxK00p3UCA6Ks+F02e4svHWc12HQV1OUnV9XFCqzScBjIlh6lA
         0DbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDZMCvYNXiXvQhJ09UJxoqYZ7cRMijX4VTxpPX8Gi+vt7E0YJS2i7SxCn+PiFe/R/DQt19k1x837DGHeA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgbE2OLysjpFfGUg5Y2p9BUrt5OjLA7hIgQnl6hy6Z7ex2NQzH
	F72Dd9jvauD/6ds3+oo6obQ+aKSBGxcOn9a+ia1RJ9UwnbIadRSxcdzN
X-Gm-Gg: AYBFou1rCPPiBcjWYxMwIfmcc/rj/g6ymrgQctrXJnrMpvq11d2YVMuGzYhljHztHDu
	A6ltLpiSkf7YeO1URdEOIcSQQuFhpUhoxyhkL5IuMwFIwsjtg8TPiaX8Qwze7Wp74fZkeKbUkdS
	w3jcmCfvyCEzvDKv26xhXhmMSTVNFSH8HgSME1LQosN0qtl9H9GvIa3JvIMIBAzhPPUMVmXj8dJ
	85JtNyJAQh99NLKJGv1qraH9Bz8B8y36Jc5MqiYb1jIwNb6LzHqpvzEELzXNKxFMTKTnE/xJDkH
	p4DHdkMr2CGQmgHhIg1DGZxh9mdsVSJzkCUDr6XJr9ySD8zYxybS3LJE3RrPTPY3dBDxY7Uys5n
	/6OzF+WkE9vp+epnGVAwwbVhdAgOc4VrcDPzedI23n4abIkzUsaQIJ8NfNQRssjDubz+VFkg3dR
	sz4KvA1/MX9UN+mZPGOYUC/NRUz54FDSOnI2eoYZWnuKaDwWrwoxqokXkgfH7A6YoOr/asCDgfj
	yjoHHg29hax8LIOGy/rw9OkVNOHilWA8V1N5G99jO/cnMD21oHex4qBH17fkyq/E7x73vmUda31
	rjxLy94fC2TcsKqqJIKDgd/jOhl53KejxGuY
X-Received: by 2002:a05:701b:4281:20b0:158:1ed2:cb58 with SMTP id a92af1059eb24-1ac5e6f5362mr13936565c88.39.1793587693890;
        Sun, 01 Nov 2026 18:48:13 -0800 (PST)
Received: from xploitoverload ([2406:b400:f11:1bac:4040:640b:8a1:8629])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm29930662c88.0.2026.11.01.18.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:48:11 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: andrew@lunn.ch
Cc: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: Re: [PATCH] ieee802154: nl-mac: validate device pointers before dereference
Date: Mon,  2 Nov 2026 08:17:21 +0530
Message-ID: <20261102024721.28129-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101092219.1278751-1-skalpesh942@gmail.com>
References: <20261101092219.1278751-1-skalpesh942@gmail.com>
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

On Mon, Nov 02, 2026 at 01:13:xx +0100, Andrew Lunn wrote:
> Did you consider the other fix? Is there a use case for setting a TUN
> interface to ARPHRD_IEEE802154? If not, maybe return EOPNOTSUPP, or
> EINVAL?
> 
> Andrew

Hi Andrew,

Thanks for reviewing and raising this point!

Regarding whether there is a use case for setting a TUN interface to
ARPHRD_IEEE802154:
In real hardware/subsystem usage, virtual 802.15.4 interfaces are typically
handled via mac802154_hwsim or fakelb (which properly allocate wpan_phy and
dev->ieee802154_ptr), rather than raw TUN. However, tun.c explicitly recognizes
ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR in tun_get_addr_len():

	case ARPHRD_IEEE802154:
	case ARPHRD_IEEE802154_MONITOR:
		return IEEE802154_EXTENDED_ADDR_LEN;

which sets the hardware address length to IEEE802154_EXTENDED_ADDR_LEN on
TUNSETLINK for userspace network stacks/simulators (such as IoT testbeds or
custom TAP-based emulators) that expect 802.15.4 addressing.

Regarding fixing this in drivers/net/tun.c vs net/ieee802154/nl-mac.c:
We considered returning -EOPNOTSUPP / -EINVAL in TUNSETLINK, but chose to
guard nl-mac.c for the following reasons:

1. Subsystem robustness / Defense-in-depth:
   ieee802154_llsec_dump_table(), ieee802154_dump_iface(), and
   ieee802154_nl_get_dev() assumed that any netdevice in the namespace
   with dev->type == ARPHRD_IEEE802154 has valid ieee802154_ptr and
   mlme_ops. When that assumption fails, it triggers a NULL dereference
   while holding genl_mutex, leaving the mutex permanently locked and
   deadlocking generic netlink system-wide for unprivileged users.

   Other parts of the ieee802154 subsystem already make this defensive check:
   - net/ieee802154/6lowpan/core.c (lowpan_newlink):
       if (wdev->type != ARPHRD_IEEE802154 || !wdev->ieee802154_ptr)
   - net/ieee802154/socket.c:
       if (dev->type == ARPHRD_IEEE802154 && dev->ieee802154_ptr && ...)

   Guarding nl-mac.c ensures the IEEE 802.15.4 netlink handlers are safe
   regardless of how an ARPHRD_IEEE802154 device was created or modified.

2. Userspace ABI compatibility:
   TUNSETLINK has historically permitted arbitrary link types on down
   interfaces, and explicitly supports ARPHRD_IEEE802154 address lengths.
   Disallowing it in TUNSETLINK might break existing user tools or test
   frameworks that use TAP/TUN with this link type.

That said, if the consensus is that TUNSETLINK should reject
ARPHRD_IEEE802154 (or arbitrary link types that lack driver backend support),
I would be more than happy to submit a follow-up patch for tun.c as well.

Do you think we should reject it in tun.c in addition to guarding nl-mac.c,
or do you prefer restricting TUNSETLINK instead?

Thanks,
Kalpesh
