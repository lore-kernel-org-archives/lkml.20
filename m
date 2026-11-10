Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322109;
	b=sCEV+XnEkIhpfes7dP+4fr11PGpBemmz5at9pjNvFIlrhvyvFFPQzFUyVbxXvGgCSyUQ
	 cEZIROJPVR2GO8niZzkm5TuRqF3tOMbqV9tVQubXd7RB8L7mICF0N6yo3vMdFMGN8KMqF
	 wBFggmAkqx1Tjl03PcPlN/zyFxDgD/dNZ4TtkI2aa7ux4//p8Cb7Yk9Blufz799Yg9nVM
	 m1DNIDkmNuoqDhifCZSDOiJ/NyQOHe0l2MtYBt0f71SAW6PjnvCNfnof7/XQA1hqzh5Do
	 7COQNy9L+4RCmiAwUcSxriIw1VeEQRU3oscWbK2r6FRXRMS/Ya6Cd6ofaAYD1T+ewwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322109;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HReSs8xkCDmn2RFbwNR87Z/8FnpjP8wlH/AJisucaVI=;
	b=lh7m/TgUxoD695K7O5WawVm5zUjYhBdz1CvsYolPyJEFavEcv7b4V5/RF+QM6VF6CEWI
	 JAs5ktts9HXIwvTakke2A+qc3qZOIj2kOP1kb49SXFpBE/tGU21YLZ/fs86lH4n5OrlEB
	 yE4NkGm7l25MY/VzixJ19Z4Y/EsdqsSIJorPUfBK2+sieZi/n/T2sCZ82yLUBOfQ8zjG2
	 qkF6WcOrs/NQni09AwYv5VmGpmOdQ+We+vfSdKf5T7b4VX62TBUIyNghG7ntVSyg920MZ
	 UbCd855mGYSPbbRBjl5d924YCql4CEszTX4f/KjQp2IPrSts2w+T8g42hFBe5tU+ltQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZVqrrOyR;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Mf6rZt+n;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E560A263B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C23E560A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZVqrrOyR;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Mf6rZt+n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794322107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HReSs8xkCDmn2RFbwNR87Z/8FnpjP8wlH/AJisucaVI=;
	b=ZVqrrOyRcu/6EO83ju7fXNwDIT0d2xydJK1hsx/ZhItIpMfwWiUOC+3DwaAbYrfBtD/DgW
	EU3iWWBc0j9sRpnQOFTMk9aPx87aPxYKSGvpmRtr/ijOMWxpZLujpX+XINEeLh/mBJYjWo
	hlES7Xv9nr4xalraxS0YQoL6+xP3Btw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-cez2ACy5MSCcVeCV7gvGNQ-1; Tue, 10 Nov 2026 09:48:23 -0500
X-MC-Unique: cez2ACy5MSCcVeCV7gvGNQ-1
X-Mimecast-MFC-AGG-ID: cez2ACy5MSCcVeCV7gvGNQ_1794322103
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49166c8a60dso1620400f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794322103; x=1794926903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HReSs8xkCDmn2RFbwNR87Z/8FnpjP8wlH/AJisucaVI=;
        b=Mf6rZt+nD0M+rzWE0lWoLCFKpzfyNhmhY1LwHU1meiHNXvEGhs2nOMiZw1kQcl9G1+
         a6rH4ietR3qT5b57+xAyaAqlteNshFhigxaYbdWCvFq65c/pNmvaIkwGCj/Su/q0BTm/
         JgolJ/fPAZSA7Kz5+e6JrA+7jqNqUuEU0lGjc3wGqPbB5vlv+ayajVb1rJekLo8aNtD2
         t4SMKnUFs5q+jo/gsIkUCg2RtcKMgtYvSChKgnteCPIR/o87uxODFeL4NR+7ruYlHkIs
         +VFfo+x3XOsyEVDuz32CvNxlx2AuOSmam8Mf32O4WuZ1jdCxz5X8wb2cXxBeF2UDDQlM
         LMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322103; x=1794926903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HReSs8xkCDmn2RFbwNR87Z/8FnpjP8wlH/AJisucaVI=;
        b=UMjga263Cn2BdmtNfVOHtWmpEY75NUlu63G5TW3e76gQum0K96liWbHRbJV4UfTkQ7
         nA4Sc00Bv309kDsVNHAHyfMyLUa1j58dNWwJeAWsyggeMEukSQ6QwSNsUhB9f/guwx8f
         ohNSIcyT7neahb0r4Jm5g2iaT23pGk3pgXxY7wY4sRji78TRpmRFR+q1MS9dcar1oyEt
         04fVubGuta8/yN9QtlRiZYy9rF60d1ez1G1PSFVvy5Fz6nkZZQ5AoOsolW+ZgfqUXlOz
         w8kPhsNOVtlTiQP1evkfqFGaIXc7rxpfYShu34Z+nj4BfhL0ogzRvDKr1wBzCA5VvcUo
         keEQ==
X-Forwarded-Encrypted: i=1; AL+hErGGilj7vmvbT8/QkUBm4NQkeOWCMynU6ip8ghahOusyKpbFuuwZbgfy+yrWmZVYii6nnXnnFsq/Cth9V2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bawRN0K7UW+kv3BRbJ5Xx1YOr5lkvEg48RC8EBE09TQMeObnY
	UruMMl9cbeIwpdAqYO8tCkg5F24IsQqUzjGFLCfuRO9CEODlzUVfSUQd06D+h5Uk+59Yq6SsEmS
	VIRagEBDfKOOjc5U6JKa2ijgVPZ4eRzcL6lLa6B2tWWRAfNiYAQR11e2nfUzE6Bvzvw==
X-Gm-Gg: AYBFou1gHjKDsLaUYxMb4Sgp6H85N9iUmOaTdXdNRnaH7fe+UB3CPhiNkRMgnCeuD1T
	m81inF0TslSMTyDGU8c3jWpy0CDZWC6dX0jqnRXGAWXNdSWHolmDFChFnjfIVafb1rx+CVWaWNO
	RPwPnONoUD/tc+YrYvMOFtFRQ3VtdxZDZnH79kUlAl0jEs0i3w9urcaegLuJqaNGt1TlWtBP/1n
	hPTo7J0FFSjA68MCX/VXrL0J7dFfxerC67hCRYvHiEaeFOkjTwGWrU71zFYwUdpqtaNGeDD9vvm
	VxYtBKVcdCrDHSK9GFjrgZdw/yMNOSci4tLg/YJQ7oJABbcI2dMZhtCh7FfntvVafNPkb3G6M4N
	Cl6/SGKM89szV+dz5q8DS78QYEO6n/V7cUmQv98NqeGui+VxNUwBiNEUXvrj3CMpsKBhpHqADl9
	Who5s5L7tgEp0t0U/IQsGskzvUlLd+N12tD5uOYASBehgq
X-Received: by 2002:a05:6000:3ca:b0:48b:174:eab1 with SMTP id ffacd0b85a97d-49830d81adamr5057444f8f.36.1794322102663;
        Tue, 10 Nov 2026 06:48:22 -0800 (PST)
X-Received: by 2002:a05:6000:3ca:b0:48b:174:eab1 with SMTP id ffacd0b85a97d-49830d81adamr5057392f8f.36.1794322102119;
        Tue, 10 Nov 2026 06:48:22 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585923bsm5635389f8f.11.2026.11.10.06.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:48:21 -0800 (PST)
Message-ID: <984a9f14-d8d3-41d4-a846-6750f710c741@redhat.com>
Date: Tue, 10 Nov 2026 15:48:19 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] igb: do not let a VF set other VMOLR bits through its
 frame size
To: tkusters@aweta.nl, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Alexander Duyck <alexander.h.duyck@intel.com>,
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
References: <20261104-igb-vf-rlpml-v1-1-729621b60eee@aweta.nl>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261104-igb-vf-rlpml-v1-1-729621b60eee@aweta.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 07:34, Tjerk Kusters via B4 Relay wrote:
> From: Tjerk Kusters <tkusters@aweta.nl>
> 
> igb_set_vf_rlpml() gets the maximum frame size from the VF's
> E1000_VF_SET_LPE mailbox message and takes it as a signed int. A value
> with bit 31 set is negative, so it passes the "size >
> MAX_JUMBO_FRAME_SIZE" clamp, and it is then ORed into the VF pool's
> VMOLR without masking. Its upper bits set other bits of that register,
> such as AUPE and ROPE.
> 
> A VF whose port VLAN was set by the PF has AUPE cleared, so that it only
> receives frames tagged with that VLAN. Through this message it can set
> AUPE again and receive untagged frames. It can also set ROPE, so that its
> pool accepts unicast frames that match the Unicast Table Array; while the
> PF fills that table, in promiscuous mode or when it has more unicast
> addresses than receive address registers, that is all unicast traffic.
> igb_set_vf_promisc() does not offer this to VFs.
> 
> Take the size as u32, so that such values are clamped to
> MAX_JUMBO_FRAME_SIZE, which fits in the RLPML field.
> 
> Tested on an I350 with two VFs and kernel 7.3.1. VF 0 got port VLAN 100,
> and a test build of igbvf sent its frame size with bits 31, 26 and 24
> set. Before this patch, AUPE, ROPE and STRCRC were then set in that VF
> pool's VMOLR (0x8f010bce); with it they stay clear, and the size is
> clamped to 9728. The normal igbvf still sets its size (3022 at VF MTU
> 3000) as before.
> 
> This was found by the Sashiko AI review of another igb patch.
> 
> Link: https://lore.kernel.org/all/179370458190.488856.17697539789438631896@kernel.org/
> Fixes: 4ae196dfd61d ("igb: Add support for enabling VFs to PF driver.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tjerk Kusters <tkusters@aweta.nl>
I still assume this one will go via the intel tree first. Please LMK
if I should apply it directly, thanks!

Paolo

