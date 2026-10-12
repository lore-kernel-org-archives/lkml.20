Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F324AA3EB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821223; cv=none; b=JOwqYYj2qMb6xXDA2NA+/sKDrjEs7l9jHoP+UGg8w33acwiOYKNrx1Dv8kvEKz9Y0V8JHLFl0VI7lGOntDyqc5YAt5D1LDspJL6i/E9u4Xuhn1VG3fr+7a/+JsSB5x+ftYdTFgXNFJSBX98+x1vMLMRT1eEbkwIm5c4Pkv/ZMIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821223; c=relaxed/simple;
	bh=AhPMhzaGqx5SQfSwW56n0KdL1MDOBPKouQGmvbiEKzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEyrPd+If717Id91WvOazpFcHz2eXO8aDeAFQ9kkJeuK2PbzxJqCQhMGF06Q5WvmvlXu9CrvmclrtydeWM5AF0Sn+vca+EInYqa4yctscRx3qQTOEkHwuMfpzr02I7oIWxQPa9m+WohnBfQ0HgRFYULuHE5np4t33usE2sSbYjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WkDkJ4FD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ermiNtpL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WkDkJ4FD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ermiNtpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791821221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8A7l6JszdJyGEbe3E2dMTnVGKvVIg/0EPsHb1/yAt0=;
	b=WkDkJ4FDYRcInMSijef7PJtiJU1Lw38/5U8jwTRxJ4Rg2iONFg2S1tEJm+ezFvy2FoiZtX
	n1qpLuCfQz9JElFhLEnyhuyEDVA8Ae31RjFzax9mAVRqAEulw/C3d6syQZMJ4ksoToJuwh
	aO5UdxQnvNbrKixIvronS9ofNVUY8M0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-ifK37zSYNIuEuIWaoeZhSQ-1; Mon, 12 Oct 2026 16:06:59 +0000
X-MC-Unique: ifK37zSYNIuEuIWaoeZhSQ-1
X-Mimecast-MFC-AGG-ID: ifK37zSYNIuEuIWaoeZhSQ_1791821218
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so14089875e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791821218; x=1792426018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8A7l6JszdJyGEbe3E2dMTnVGKvVIg/0EPsHb1/yAt0=;
        b=ermiNtpLqywv63nG9/h92K+M926gILYodApZyJ3FXTegBM/FLy+zCKoV3GT37Zeaa4
         4fNmGpNleGh6EuyuCRa/iOupWzjrqJg5BIq4PCkFhu3NxdGPSNeOj1Nd9l1zIWDH7bMS
         mpGdeup9lymrhul9wNPEc4mmBRHA/xt1Qi4ZZRouxGQTqgzk/bJNlhA+DK2IDyTLFvz6
         S32g1WyujsoOW4ZOadsfWwqYPANMwpBTBewvRiy4OZ3L2frLkVz2IusBIFt4hOZAG79b
         js842EvuqJbETqWUHRyTpZVyvw3l330d1Q5pRoYIh7OU5yKT5tzs80BkDmfHhHmvlpx2
         v8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821218; x=1792426018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8A7l6JszdJyGEbe3E2dMTnVGKvVIg/0EPsHb1/yAt0=;
        b=YPck1+Tthxe6bVoj53hVnIlx898yVpa4B+sENm+CBYzxTVY+J9zZLJyt2gWXc6PWqY
         dlHGtvfy+gUBU0Y1M++ChUCi04Wx55leTD41+CfiFBJZwa6teFiC9YIf4asFrUp8fq+Q
         nKjm14OJpoPzlVMVUUMHtrreOwAMrHFvaVPuyAfTOtTuND9Rj+EoJYQK2204Jlc3ZTKI
         J5VPjSXNrhDtO2cU1gQJq86XbG5rsNHh6yadiIcoTXuTFg+sS6cp4maC8cjRSGrNDEfW
         bVYC8FQ33dBM587p11NWnt9xb04oXotaRalyLXtSB+aAhSaOVei4z7p/ou33G9wsPqoc
         Hl8g==
X-Gm-Message-State: AFq9FYKkO0aJuCNaeTyQfBfEr7QH4jwVGB/t4Rsba1XxshTKi1WKPLV0
	lkcfkaalK4UYAGTdV6n8qbVbnyGIxoEGLA0+1qlO4qicnw9vRH24vCFo6fVOutHll8dQHQ2cLBf
	2XZ/4jAYI1B3EE922fQjLPI77MQuXATMdCpuYh2wJlvDs6GIB50LOOJxd0owgsyFpkQ==
X-Gm-Gg: AYBFou3d3izxCsYVNBTiDxfI0K9h+0c6G4Cvdk86QxCgpbG+uEBxgsHR7gQbJ1kTfqS
	s39j8O+8hpX6+gBB2+XDHNYWKrwFrBm8w3Nx9xNl4PG6kBXzlOPK3x9QoIHIQpAz+y17QlZWWEj
	J0+cCBMzxh9ut4qfD+xQ0GkVJqVagndByCbWdoyiypZ/1Jgs+R4HID/IRyXaKjrrpaTSUnfe7+G
	cGd/GJB7Eu73d3t/7Npcp9ewzuYR8lQR58j0QDJK7F0eIDoALXc0H67XBFm/q9dJysYlTGY44Mz
	gUc3f8qV5hgiSlUByEZhI2aHTO2G18L/Xbv0Ec8UUNYSTQ1SVqGcV3KfVz40ZuuagZTAzvAwz5l
	QHTwAmk5DEQ8LaHzDZO3o/8y/vE6oWqWrem9Y1wHi4bRdGuxRqjORUXiLpNopRAuI5MicYX5+bg
	==
X-Received: by 2002:a05:600c:19cf:b0:4a0:168f:d962 with SMTP id 5b1f17b1804b1-4a18e44363dmr186396095e9.3.1791821218254;
        Mon, 12 Oct 2026 09:06:58 -0700 (PDT)
X-Received: by 2002:a05:600c:19cf:b0:4a0:168f:d962 with SMTP id 5b1f17b1804b1-4a18e44363dmr186395365e9.3.1791821217787;
        Mon, 12 Oct 2026 09:06:57 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5991sm239324f8f.29.2026.10.12.09.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:06:57 -0700 (PDT)
Message-ID: <4704a40f-0218-45fb-8aa7-03f624c5ce8c@redhat.com>
Date: Mon, 12 Oct 2026 18:06:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: phylink: allow stopping a suspended instance
To: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org
References: <20261005-submit-phylink-suspended-stop-v1-v2-1-8b8e5d53dfc2@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261005-submit-phylink-suspended-stop-v1-v2-1-8b8e5d53dfc2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 21:09, James Hilliard wrote:
> After a failed MAC resume, a driver must be able to stop phylink without
> resuming it and reconfiguring the failed MAC. This is needed when recovery
> leaves the interface administratively up but detached until a subsequent
> down/up: ndo_stop() must finish the suspended phylink lifetime even though
> the MAC could not be restored. The missing transition was identified by
> code inspection of the stmmac recovery paths.
> 
> For MAC WoL, finish the deferred link-down and clear the WoL disable bit.
> Otherwise, avoid repeating PHY, SFP and PCS shutdown, but suspend a PHY
> that prepare_resume() powered up for the MAC reset clock.
> 
> Retain the saved link state if MAC WoL is suspended again after a failed
> resume. For example, fbnic can fail to allocate IRQs on resume and call
> phylink_suspend() again on the next system suspend. The carrier is already
> off, so taking another snapshot loses the deferred mac_link_down(). Keep
> the original snapshot until resume or stop completes, allowing the next
> suspend cycle to capture the new link state.
> 
> Do not enter MAC WoL suspend on an already stopped instance. The wake
> policy can change between a failed resume and the next suspend, for
> example when fbnic learns a different BMC presence from firmware. Setting
> MAC_WOL alongside STOPPED would leave stop/start gated by MAC_WOL, while
> resume would take the MAC-only path without restarting the PHY, SFP or
> PCS. Keep the stopped state so resume performs the required full start.
> 
> Restore any PHY advertisement reduced by suspend. Track that reduction
> separately from explicit driver speed-down requests, so stopping a
> suspended instance does not undo a driver's close-time power saving.
> 
> Fixes: f97493657c63 ("net: phylink: add suspend/resume support")
> Fixes: 4c8925cb9db1 ("net: phylink: fix suspend/resume with WoL enabled and link down")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
This needs an explicit ack from the phy crew. Also I understand this
is a pre-req for another fix; if so it would be probably better see
both at the same time/in the same series.

/P

