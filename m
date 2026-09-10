Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B743D388371
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031224; cv=none; b=msgO7rgkKkrwjUGiyPd2wwFXhbybPj6Ewzx/E9kej5ztb9k3fq0fIgz31uH/VSeI15uiBEruAcma6seTZrpraezWRsTpcWJ2VfhWcF2XqIM1agNVRn6FA5qBFXJsjTqzmpAhlw3LAjWE/N0n4jkAtv2NGgqgE6DpVr8EqK2mDPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031224; c=relaxed/simple;
	bh=98ptv6rfuwvhydBME95fdFOyv6p1Cs4i6w7lfirkLa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2TOUqH5gd11WPvq1gAVNdwhHFIRz04GGf+SQf0JsLHxOhAQk9+dtkSCVcb2reM3kCeM4HAy2e1jpp8DycPS8+oTQKWetaFYGUhOonkWWawUbvo32H9RSuv8Q/oRXxfNCF9Lsqybs5GcEO8oMlR3LgRAYWVJUpT3QFuvu/0IQ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NA0aWsjd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=l95Q5+Qx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NA0aWsjd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="l95Q5+Qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789031220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtDa2p+R7+DpjSivG9cDQd2WySu2bvarovpKx6zwgkM=;
	b=NA0aWsjdP6j9qxtcq101tWxzcKUEtNgqGxhOsAfnXdlccTZigh+/3PACpQFF0I2afAdwqS
	mROV3b6otB8d4smLkxPB1+7lIHmI3J2K6zH9kfJjK0lR6nVuin636oTcdGOY5389VytCfk
	WDENmCU3V7xjHer4BJ3dK83Fljlr9lY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-i7yla6mPPVuMDo485ZvbCQ-1; Thu, 10 Sep 2026 05:06:59 -0400
X-MC-Unique: i7yla6mPPVuMDo485ZvbCQ-1
X-Mimecast-MFC-AGG-ID: i7yla6mPPVuMDo485ZvbCQ_1789031218
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495474a5fbcso68657095e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789031218; x=1789636018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtDa2p+R7+DpjSivG9cDQd2WySu2bvarovpKx6zwgkM=;
        b=l95Q5+QxVO4YVlbKSo7HqBdyEHCz4lO1JEqDSHA/uS87UsN4mnJxSAGlubgobHAQ09
         c93tyN0Hj/jFpYOOvYNDowpVHJc2ep4R3Bs4BzelnITYdSMAEd8BQFvouzzVb3+YimH0
         g5YUifdNYzx3M7G/H2otQAbBE0wBdEz7R82wQ6g5H6d70/cyMJKqg5m+LxYneiVUCYgF
         wBXdoQUlZQomRXeQFchCILWr91I1I0igzwnDzALPAGCA7JFVSgGd2A7Z+b95nbeW5vOP
         KFU15VKQTGhrQQuYkCbjcrsFMxNPt56VBnfiKpesZhoztBEA6g7oF6VHTBDZTJsvfN5K
         u8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031218; x=1789636018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtDa2p+R7+DpjSivG9cDQd2WySu2bvarovpKx6zwgkM=;
        b=DeVMNLPZt2qrIU9IV/mVDhfnQihnmOTkK5P0uvjPIJSi6UUvUbM8o2EmegBK4mR0RA
         TYnbfBVOQkrPupgAEU98pO6+BrwUqY6oaGJWj6/I1PWpqxgRobC8OMMJlehopTLz9Ffa
         Q8zNohEBh3RKkN+qiXSUvqMRuBneKIWghx94jDSowuO3xka/TbZE/w2C+qcBGTyPjHAq
         64IECV00/DuOViVCAuKvxj2cdtN1bgEH9Bt6AAgvsbo/kQF2WI/mQNBQfmojs4NzwGJ2
         fHQD4NN3atqrKpzGYUxGkPDjPkb5sumj1wn8oAKFLccUhmOytg/LTuSWShrBmhRLLSUJ
         c0Eg==
X-Forwarded-Encrypted: i=1; AKwUvBwG56HTNxmNpp75m9TPEcXS2RziufFzbBWdnVXdqZEFYXv4hfTMGKxqdLKWG8HePgFAZ2q/d48fVWXyJfs=@vger.kernel.org
X-Gm-Message-State: AFuF++nLvC8nCRc3pn0OGZB16o/s0VfbHOharof35R2Rgj5S6JyUpdc1
	oGedd6ybqbJIkd076Lmpk9NqZLZWamvZnqU+Xo8JAZ+yZFEYd+Bz+lYt/DvEBse+evCD/ZRWiPe
	qOLRMCkWBQ55N51w6PWecVDkC8A4GHoo2gxhxnWYJf4ggyFUMHXVayM+S+O8ClcmtEw==
X-Gm-Gg: AYBFou0+E8YAuWLB4p77JfUqD6H95ORm3B/qt/+HR7XAJ7iodlKhu92aaczNVbw6TBt
	qZoNrx6pFTVAPMT9NA7KcvlXn/3WVMSH1IbYjqkiSkynuTMnu/O/qm+zAxY1TSCGyScmjAu/YzW
	Raf4UK9lqulg8SEaeOQiDRa+iYP1ODEozcIj6C+wuhj5Ufv4B+aQ851DafTPcbChZ1gd7p+c2Uy
	gtJZG1nm2+WdFU9qfMZb8wx+GRhsH87EiH1GZ8521mHA/5h4fiCM0F6GnI79tQUjSflUSxr/gAS
	mfsiFz8vuRLon41Lzfw/84R6fpGfGru/HxxjJv5PZkI4MACBWWXC8o59Hwl7fUCwaOKlwWMoFkF
	0vE2qEVaukKppg2ERmPXivLF6kq0AzYYym4U9OfE61t4klxFKqV+CDAMoO62JlhtQx2jJ8iOJNw
	==
X-Received: by 2002:a05:6000:430b:b0:485:adb5:2075 with SMTP id ffacd0b85a97d-485adb52e38mr7977134f8f.51.1789031217893;
        Thu, 10 Sep 2026 02:06:57 -0700 (PDT)
X-Received: by 2002:a05:6000:430b:b0:485:adb5:2075 with SMTP id ffacd0b85a97d-485adb52e38mr7977080f8f.51.1789031217419;
        Thu, 10 Sep 2026 02:06:57 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm49916954f8f.34.2026.09.10.02.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:06:54 -0700 (PDT)
Message-ID: <2e89ce5a-3d7c-42fd-af82-899f6bc8a64a@redhat.com>
Date: Thu, 10 Sep 2026 11:06:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/5] net: pse-pd: decouple controller lookup
 from MDIO probe
To: Carlo Szelinsky <github@szelinsky.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Corey Leavitt <corey@leavitt.info>,
 Jonas Jelonek <jelonek.jonas@gmail.com>, Simon Horman <horms@kernel.org>,
 Aleksander Jan Bajkowski <olek2@wp.pl>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260906153102.959217-1-github@szelinsky.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260906153102.959217-1-github@szelinsky.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/6/26 5:30 PM, Carlo Szelinsky wrote:
> This is v6 of Corey's series [1]. It takes the PSE controller lookup out
> of the MDIO probe path, so a modular PSE driver no longer makes the
> PHY/DSA probe spin on -EPROBE_DEFER until the PSE module loads.
> 
> Patches 1-3 are the same three notifier patches as v4 [4], unchanged,
> with Jonas's Tested-by. Patches 4 and 5 fix two problems the v4 review
> surfaced; v6 additionally fixes a build regression in v5 [7]'s patch 4.
> 
> Patch 4: Aleksander reported [5] that v4 deadlocks on probe for an MDIO
> bus registered from ndo_init (lantiq_etop, sni_ave, netsec): those
> already hold rtnl via register_netdevice(), and v4's phy attach took rtnl
> again underneath. Patch 4 swaps that rtnl for a dedicated mutex, so the
> register path no longer recurses. The ethtool PSE paths take the same
> mutex, so the use-after-free that rtnl used to close stays closed. The
> mutex lives in pse_core rather than phylib: net/ethtool is always built
> into vmlinux but PHYLIB is tristate, so with CONFIG_PHYLIB=m or =n a
> phylib export is unresolved (v5 failed to link there [8]); PSE_CONTROLLER
> is bool, so pse_core is always reachable.
> 
> Patch 5: Paolo's review [6] pointed out that patch 3 defers the
> pse_control_put() to phy_device_release(). A phy that is device_del()'d
> but still pinned (an attached netdev) is off the mdio_bus_type klist, so
> the PSE_UNREGISTERED notifier walk never clears its phydev->psec, and the
> deferred put later touches a pcdev->pi[] the controller has already
> freed. Patch 5 puts phydev->psec back in phy_device_remove(), which the
> mutex from patch 4 now makes safe (the rtnl recursion that motivated the
> deferral is gone), so the detach is synchronous and cannot outlive the
> controller.
> 
> How it works: pse_core gets a notifier chain (REGISTERED / UNREGISTERED).
> The phy layer subscribes, owns phydev->psec, and attaches the PSE handle
> when the controller shows up instead of during probe. fwnode_mdio loses
> its PSE awareness, so no -EPROBE_DEFER leaves it and the probe-retry loop
> is gone.
> 
> Tested on a Realtek rtl93xx PoE switch with two HS104 PSE controllers on
> i2c:
> 
>  - clean boot, no probe-retry loop, no watchdog reset
>  - 10G SFP+ port: module hotplug works, no deadlock
>  - ethtool --set-pse enable/disable cuts and restores power to a PD
>  - i2c unbind -> rmmod -> modprobe: PSE detaches on unbind and re-attaches
>    on reload with power restored, no reboot. No lockdep splats.
> 
> Jonas confirmed the RTL8214FC deadlock he reported is gone. Aleksander
> confirmed the lantiq_etop probe deadlock is gone at boot.
> 
> Tested-by: Carlo Szelinsky <github@szelinsky.de>
A bunch of 'high prio' sashiko reported issues are actually fixed by
patch 5/5, so IMHO not very relevant. Still I think there are a few
points to act upon.

@Carlo: please have a look at commit
c82ff94592fb68f529afe63ca7f5ddb7dae4ba83: you are supposed to reply to
LLM's comments.

/P

