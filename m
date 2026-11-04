Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785819;
	b=Zd/D9SkTkZLeHdI3KzBxdPg99Pxubljn0cifb6CNcHg5lwojAqS63bh42sVb3oH3l0SL
	 kB8wPsGt4mQZ6yOfC2K8MtxYCU7QDe88Xo4i1ahX7TbM6fp80qlXfJCnUVPUUkJ8MSd78
	 UUzgOUMZYNKusrLE9PDS/Sdgut7PrgN3vb5bNDrpWilONqGWNRutC2725JKHZ66eBTdpy
	 UOngSR6UOylTWbwUbAtZs5glXpkXT9WBdtbzhxBw1ttS9nnw9fWKy0MIKT18qVlAu84qa
	 LQupGyrZfy8wMvMYLuO6JwxvUrvRK2dl9nnnbeiVmpPBU745qIQIVTMq2PsBglUNuOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=t9f+Vk55viv3NpwRqRsDkuFkLcfNYRqwWUiHAW6XHcE=;
	b=Tdj1Raz1nDT9WvavHva5jmQPKH5ZRy/HKfgpLLtHv5ecnJxdzAMgjp1CpyFlp/naOd4Z
	 4vrypx5m4nBMg9B5LdY3+jOICpdaUQOFBZHiLJeVXGlP0bGJ6rCfoqaGoaFltS5jB/mWh
	 7RT26j8a16BAABEvH3WfdIiQGE694/7VXIP/YEuHa+4CugdSiTFpxA6JDJJeJxDDSGyCm
	 JSJq0fSHvc2xke/3CWTnqSaPL3rcx0bHMUj/Mc80mS8ucx++Z1KyhumJwlwWcaQ0kt6Lz
	 Q92OAFCrjbTSJThDpD0eu1arMWvXmHOjQjyPJ93r5sgoaT6SAaZyfI9Jb7Bzp1jVCMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwIumg0b;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACA0606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ACA0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwIumg0b
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so3476545e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785818; x=1794390618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9f+Vk55viv3NpwRqRsDkuFkLcfNYRqwWUiHAW6XHcE=;
        b=OwIumg0bVI4/nRLmEpLs2ml90PPkrBN9/Y2ceEVRe9kieCjuJVzBse32J5reKiuvXI
         /wmlo68bF0Bh8oyS3KtQPkFvprWAeMVEJ0KQiLoAnAuiBLhLiWwgQJdf52rbxnmOaHIi
         N1GBjZANpLAUAUFsA7jAHHHQjKdXUWOXwmdgGHMMHOZAlkRw3vcZBNvAF4LSwSoLA1FO
         RxHSI6+GSLCqwZoVtCxhcabvBR32mcMwM98sXlV+RL11S2hc+qvhwz3T94DibaVOIJJE
         NwEUxYl6ewX/GhaFrVXOcmwD9TJqkFUGI1YrkutYDiA6LZ3E2PsaRIgNNEM4jg0dZDKK
         uAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785818; x=1794390618;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9f+Vk55viv3NpwRqRsDkuFkLcfNYRqwWUiHAW6XHcE=;
        b=FKn0SxUnZDNFD8b0SA2NuSiwMiyk3K2SL0fYHBDIxgvxbi05n5/FVNkJAkRTzEULH3
         4kfs2vlUdQ44T3tt7GB9oW+1+/VwRFWF9MWjwBBI8priUHQ/t5+wip6Q5WTRAzwvZca9
         Fm1yRP7kBA/1D72LbQBHfx7e7+FLiPQwxJcUfNbblAxrhz+C4Uo+OlegyetG93QKq+ld
         6zJEvnJ4eylVZUdy6piJwDWcQRTzJ4BLvB0WK8Nh5T8rHrhk6w6p1ch76Am/QTa/AiKc
         AfQo7OcaJtIxOQ/YEm4pL6iJNnimgv/zBo6pzDA08zjQ/ULcr34X4ZfPlfqExKuYYGc0
         69Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwJQsI6H96FKiFF72qGLDTFcxf3+J1bvoLY5XmsQo2T4Rzr26ZwqX0qpxCnF7kd84fNS4Utarm2Dm5qe80=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a5+FQTlBhoG7YjiI0YM0IxNnrgH1A1poAd0eEazqHBJVKooUd
	iyl8MRTTu87h7Z7uwqsF4JudhNALBWc6xpq7A1qjNP5LWfKfLyOyHKolsCunbHPA
X-Gm-Gg: AYBFou3c1G92waVqGvh1KrveK3ih/xFZK7jc3ogevv05BAgvIMIcEiT7O/hcM586GZn
	BrAtSxoFE3CNJX1sWWMgGwUu1rYvqo0QX2ab3au6MKtB/rfkEPT6J/MP7KLUHthS74IrlltXPvN
	XAURsgIgfZemGU4LGWT6k2d5M8kP+wkItpO0Yl4K1Fh+pPjdf3W3eO/nOKsiEF9kLp36a4vrMkJ
	mGtdcnD05WI+ltgsWtCWuxhZcA2O4LvkcxJG++jHiuYbY/XxQUTa9YnbJI/mIas+33Vz0C+E8tz
	cW0lauyi1454Siq15RO9gtLDN1oQ5WRpZJtIR7585mrLHOVFrXDQYxTpFMO4hG5DMgPlw3gwBAR
	2ZFrYxBUyPz3fGJ40edXhFyagvMoHr525Dl22Q4v+cowbVQyRKf02IHMIrHV7rYSKuoiKpke777
	bW4UJ6xGlRxAIs/Ri5m5NhKNv/sYLcJxM4W4eSln0jpr9rPwev38OqqnfcVRtjWPMB1zqWCvXR4
	JxbdRZBY/a7ZwO6QJsK9nRb4BCHCu1As8Hh47TIdEjDhCtygsvGrUgbPOdsTE0TGnK2CxsBY68I
	WCsAZ0UKLZ6sSgdEY9WUEatiyeRkGj9gL6+u9nE=
X-Received: by 2002:a05:6000:4212:b0:48e:60ed:b012 with SMTP id ffacd0b85a97d-48e6e4f69c7mr35846762f8f.57.1793785817529;
        Wed, 04 Nov 2026 01:50:17 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8748sm2917388f8f.16.2026.11.04.01.50.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Nov 2026 01:50:17 -0800 (PST)
Date: Wed, 4 Nov 2026 10:50:03 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Ambareesh Balaji <ambareeshbalaji@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Tear down host on Reset Endpoint and Set TR
 Dequeue timeout
Message-ID: <20261104105003.3ca4a3ac.michal.pecio@gmail.com>
In-Reply-To: <20261104093608.2642748-1-ambareeshbalaji@gmail.com>
References: <20261104012725.147741-1-ambareeshbalaji@gmail.com>
	<20261104101506.5ae19157.michal.pecio@gmail.com>
	<20261104093608.2642748-1-ambareeshbalaji@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Nov 2026 09:36:08 +0000, Ambareesh Balaji wrote:
> 2) One real hang with the same symptom on the same controller type
> (kernel 7.3.1, tainted by out-of-tree DKMS modules). After a Focusrite
> Scarlett Solo logged "USB disconnect", usb_hub_wq stayed in D state
> for over 4 minutes in usb_kill_urb(), called from
> scarlett2_private_free() on the disconnect path. Nothing recovered it
> and only a reboot helped. There was no "xHCI host not responding to
> stop endpoint command" in the log.
> 
> Reset Endpoint and Set TR Dequeue Pointer timeouts are only reported
> through xhci_dbg(), so the missing message does not rule them out,
> but it does not confirm them either. I see USB audio hangs like this
> once or twice a month. I have enabled xHCI dynamic debug and tracing
> and will send what I capture if it happens again.

If this happens on real HW then it's a different thing. Having logs
of this anomaly would surely help untangling what happens there.

Were you seeing these issues before 7.3? That release made changes to
the handling of URBs on disconnected devices, which caused some people
problems even in absence of host controller bugs.

Regards,
Michal
