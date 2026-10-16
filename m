Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462AD3431E3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159219; cv=none; b=K7/7+QhW352KsYFqyJ0JUWh3XCU1tILirT11iwr8UnrhhPl+sQUvI+2Nq17qx1eF6sb3zb3vleymZzfWiS8Va2HsmjmOzVh1Sk1LU679hOGOrBMDyUdsj5RGRV//wkY7XrTcHIT/Wqr/wC3xHz5mi8nVlzvkubKJ1JmL8fhsnJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159219; c=relaxed/simple;
	bh=v2V5fnVsa5KLtIz1AyZRKlfVKI+s2yAGKM9+SZyiR6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOwUm++FvWbKRXI2LjojH+ONWTr5u4dRaEw7iI6gCUoAwGegPkinVyJQQdpjS2Zq+zFZunuCSW3qo5Sl8zt2QhrwpLrmWkQt4PrXv50QFPoFloeFCxPBTKWihF68WWMcQe9Rov/QmWKAz4udWYw2rfQg4s/7PHy2l0kba5VLcnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com; spf=pass smtp.mailfrom=smartx.com; dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b=NR/Q1CL9; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b="NR/Q1CL9"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b6dad2382so15703160eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20251104.gappssmtp.com; s=20251104; t=1792159215; x=1792764015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Z5Tjzw79dxuxAtPkKiR6MybscKYv3iH1kbV3jyfWto=;
        b=NR/Q1CL9Qa0Qc3V3DzWap3i8pkUCekX3fBBPqHNzB/idGNB/rq7k3zjM6/6V1/2SUT
         4n4OICp9Ih761z+VxntV1kZX5I6qB7w9yioGfGToQa2o8MAq9amDG0/YLRnLkK2g0OZU
         sHnt1v2hBZnebsX2C7PrpqwIlfBmKqU5/0sWJ/khop7JqqLfAdwU2KstI3eyMm1IE5NX
         TaRo5SF0PFMyOSpS2vRUNBFOMBYCtzIESYUWEKadoMe+XR7/ELMDv1+HDLVH2wNMevLK
         mF5p4XYmFLj6LHC541uenjUkYzn4TdJfI3fXyHRswVPYUiiGppzdG6IpOA/sFXHVxxQT
         hw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159215; x=1792764015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Z5Tjzw79dxuxAtPkKiR6MybscKYv3iH1kbV3jyfWto=;
        b=lAVi6Uz2ofH0mykakHlj7pEpvingzD7laPB2F0xOg1OgOUKZsw9KZRQ2KK5T3Skoxy
         qZ38G/ZJ1TgMS7M6W4U/Pn1+ESjeoqJFcj0UDtxhM5fLZUGiyxqrgBAkw7VoXYtyrfvF
         OaMueFVQIv9QtEsTz9uHHEAV/BmfLqTkEe18Xjuvi+fFx0ZAqgHL5ic6zLdYUXyf29O2
         xUj0Fvtv4xST3+D6mjYE1MSqAG5DThXSh+Efu24LcXk5Qdk+2jar39tQLHKuUQebJh+B
         H1HUcvKBmeaM8JBfazW6JAcV9xa6/bi908/hRx/c/U+P904hsEJygycHPmznplGEyLOJ
         +jEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAONm8H1aQyl+Qjgraq6BZd+zVNIUeyioBF9mB5G93gbZXU9PYN6ZXhVIYPMQYDTPLpufbC0mAuvkMPYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm6eRlBH9gFI9RhitpuwU3oAP2jd8t0Nxr7FPHhmzB2NBvLZX/
	mNOT7m6GD6c5LDn5fkfcLTMdMH2C9H/EOWEZMHpKh2swMOdTfJ40mqyybZjx3qDYq6RQ5Pn33IW
	HHYX/QIWnfwzuq33YyFlKIe1WrwneT57jev1RTkgRTyamJNvGNY6uL/4wEQc=
X-Gm-Gg: AYBFou1cIJxMUIIHq6ARPn4716DvZqzBJJHo0NseiOAEX7Pdv4v4L3rCfbOE5zLBOyc
	i9wBQ3lbRmiHWU7BKZgouB+Vuh/ruewB3Fq7VX1DK2kcAW2Xz+R7nSXGVnLwqJJ4WbW1wQE0V9h
	IZCkGoP8Ilon4maWOG+ClfOdFTP/ZCqk+kukeiM84RGsro6iYetmXlv5buqaSwX2niMcEYcLx6C
	9rBP8PlyEnnhhAtcqU0DOqYdRJq9L7iaL6Cqh2PaHTkjy209vzwMOPJ5yc3+BpewBa+eEm4Cx0E
	phSTdj8iySje/jySAkOE1yZuiOWCEzGEQUwd+8sZOQOy/v0tNYnwWpVcn7O/Jf84+Vs6raCNpeB
	mb/Sp4sSPHSnb+BtnGXUq+lMRFWbMjDABcxiz4YikCuF2TMSHQvU2PeN9qoYHpLCc83Juplo5Sw
	VRicITcPfe+iDnvl3Lur3GbijOJKBNHJIwQNYRD7qLFGvbrfhd6ZlbvEFTfIbIy89AaM5nP8pvR
	7VDlZnLhZs=
X-Received: by 2002:a05:693c:4146:10b0:35d:ddf2:e986 with SMTP id 5a478bee46e88-35dddf2eaf5mr12328335eec.11.1792159208802;
        Fri, 16 Oct 2026 07:00:08 -0700 (PDT)
Received: from localhost.localdomain ([23.148.204.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082b8573dsm7159141eec.25.2026.10.16.07.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:00:08 -0700 (PDT)
From: Wang Zhan <wang.zhan@smartx.com>
To: netdev@vger.kernel.org,
	Qiliang Yuan <odys.yuan@gmail.com>
Cc: Wang Zhan <wang.zhan@smartx.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] veth: set the real number of queues before registering the devices
Date: Fri, 16 Oct 2026 21:59:55 +0800
Message-ID: <20261016135955.714731-1-wang.zhan@smartx.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016-bug-veth-init-queues-before-register-v1-1-f48eb2bb25a0@gmail.com>
References: <20261016-bug-veth-init-queues-before-register-v1-1-f48eb2bb25a0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 16 Oct 2026 14:51:05 +0800 Qiliang Yuan wrote:
> Since commit 9d3684c24a52 ("veth: create by default nr_possible_cpus
> queues"), each veth device is allocated with one rx and one tx queue
> per possible CPU, and veth_newlink() reduces the real number of queues
> to one unless the user asked for a number.
>
> Both devices are already registered at that point, so
> netif_set_real_num_tx_queues() and netif_set_real_num_rx_queues()
> remove the sysfs objects of every extra queue that register_netdevice()
> has just created, each one emitting an add and a remove uevent, and the
> tx side also waits for an expedited RCU grace period. This happens with
> RTNL held, twice per pair, and grows with the number of possible CPUs:
> with 240 of them a veth pair emits about 1900 uevents, and udev
> processing them slows down later sysfs work such as deleting devices.
>
> Set the number of queues before registering each device. For a device
> that is not registered yet this only updates the counters, so the extra
> queues never appear in sysfs, and the error paths that undid a
> registration are no longer needed.
>
> Creating and then deleting 500 veth pairs, one ip -batch each, in a 16
> vCPU guest, median of 3 runs, per pair:
>
>                                    before      after
>   16 possible CPUs    create      1644 us     520 us
>                       delete     11822 us    9750 us
>   240 possible CPUs   create     17253 us    1339 us
>                       delete     17082 us    9941 us
>                       uevents        1918          6
>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Looks fine to me. virtio-net uses this ordering too. I checked that
veth's ndo_init() leaves the real queue counts alone, and I don't see
any missing cleanup after the move.

I ran some basic veth tests under QEMU TCG; no regressions found.

Reviewed-by: Wang Zhan <wang.zhan@smartx.com>
Tested-by: Wang Zhan <wang.zhan@smartx.com>

BTW, Li RongQing also posted a net fix changing veth_init_queues(peer, tb)
to use tbp, so there may be a conflict.

https://lore.kernel.org/netdev/20261014013620.2497-1-lirongqing@baidu.com/
