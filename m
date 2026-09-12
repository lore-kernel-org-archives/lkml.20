Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4032F531B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789215528; cv=none; b=MXGkafOI1JrcQLVMhd8pFyjH+0ZRPG1rpKVh+2sMUBQXWHRtSp0C7DzYXGip9UbfAOsG02iAV/0EWnI3GGVXneg07Ad0LOS5xMfh+QghPVHlcrWNFkmSFIVdOA5zfuuagMh40sgjKo5t+ycEma9vEsEZ5S66ZsRDkjJosBrlbZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789215528; c=relaxed/simple;
	bh=Pv5lp5bjPwTmiUKO+bVv28cfhOyswqn39WXIT7cCr3g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=arFHvFkLQsVMmyZa2sLFiCy2e8vzaYBbiCfRrZF4MasfqPPAmW8TDnfhsLyV7h7koVa3QQ/ox8dJK8Y3CcTQhzs9wu9jvdukLCyL0OwNsVpGdvZ/rmN2TeZPkWUEAfjnZUarmv2CSk07OSLwTfvUPNhZhL2kfnxA/vnCuZhG8ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUWkNyLG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUWkNyLG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so16054975e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789215525; x=1789820325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i/QUVEZsFPTwUSjXiHHedV10C9hU7WJ0OJfvcfgCPKk=;
        b=HUWkNyLGtXwrpVc19LMzb7jlzpGxhbql8qq5pmN0IowO0JmoMH8k24/qcIhq5kxYmt
         Yh+h+cwF9yQFXS0X5UYiANK+hZoFuHoEOPJDorB/NCn91Wp6g6J2bNqIRsSItrlhYyqn
         R06eOtYSX0T2colNgLdaQ1VDIabSRgP4MmiW8xndncMTu8YxA1VuhewxWpUJNaYRJNW4
         kea93P+P2yT6DRPk6EytGYpuUI98Hf7jH9HPCbtcuXBHvbVQI8ZIIe0IkoszmEDkyi1y
         YXDQYj1l3rnzyFQpeeJZJih5Ohl7CdeKlgKhDvOcT4ry21CP/PaJjPXnPuNuqc47FuHI
         fa1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789215525; x=1789820325;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/QUVEZsFPTwUSjXiHHedV10C9hU7WJ0OJfvcfgCPKk=;
        b=V3q/hQECbhANxXq9qbG3WnzlXnqbd7orOx/8O6NbEVHIjzBfCDaJjaeBv5VpkYPbR/
         qXJuxaCXvBbbRt13M4B8lca+D+DOaHkqupUautlTsOZ2kHamQnJttVpkEVjf02temTap
         CNGkpTIZMsa4uV1rGtLHEkqhM9a3zw4WbG4Q3wn8gYwV2JPYLesm0BUD1s5O6SHh7IoR
         +2nu6mRIxTK2a2Cf+02DfTowz/8O/HuMph5+AQgWfCUiSMIK5iFrYyOWTl7DxM88zD6M
         vpqy8gRSY0fBdWPMZ4UNE7UVf1aebCFAGRgRAC/jpa1eknaB8bx/JrzsRPgS0TWS0TRi
         bUVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBzz0ia6xM8EsOea89fTqaTNejiO/9tOxJce2YtvDtnrs8ydnfG6z0d1DbiGVpZTuM86CnO4hb+E0I7vE=@vger.kernel.org
X-Gm-Message-State: AFuF++ltDGfVpyCVelDRZImClRai/OSdKJsu/trFkl1M1ioDilQFZXDo
	PFvdohDZewNN8096dtglFh/3CgV4H7QcWU4nRl/pPfXPP2zWouA9jZA9
X-Gm-Gg: AYBFou1Q9rJqflduRSXi96ed3xRQakcYfl4o7BS3+9vkScMEcgap4UQxM4DyeII7dqw
	0cZJCdrGNPjgHt+16x34tKgIIzOFm/kCMIM+c616AEUo2mVq4ynnVwsasSb3WWmalPZzVFpECwE
	KabPsUsB6XavPXAL0NZvA/6HH32ne60ttnTAOhuu4BSTlWCsSAbFP2CTHtBF/+x64rRNRut77Vt
	cyCPo/nv0FJb5xlWwFJAyKG+g7/TK1Ep5IuUDFwP0qcufrOgUBkHiXYliA5vWbYI/m/mqKNtzaV
	TzKB43LMf5aTA9RQ5Se20L/5lr1Uqaz+QDPKu+SqKb04C/NFedi6hCJ7jMejaQDuHPR8fvXp5pv
	ytK/pSzLqO6iGMcchrIeJOh28Df4QKVpWz6by++3Ozf+M9lb8AUiRz1QdwA86sMVj3Bapj7PshF
	nDkJA0K67V30N0QV0l5vuPDlbjeSNsRLJCjZpmSxfg5dgOTsGOQvvPvjGuz3I8qCNFntAF8/j6i
	lzDf9ij
X-Received: by 2002:a05:600c:4f08:b0:49e:6c47:1433 with SMTP id 5b1f17b1804b1-49e6c471517mr27716965e9.33.1789215524691;
        Sat, 12 Sep 2026 05:18:44 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6af095d7sm64047675e9.0.2026.09.12.05.18.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 12 Sep 2026 05:18:44 -0700 (PDT)
Date: Sat, 12 Sep 2026 14:18:37 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Selvarasu Ganesan <selvarasu.g@samsung.com>, =?UTF-8?B?6IOh6L+e5Yuk?=
 <hulianqin@vivo.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
 <quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cpgs@samsung.com" <cpgs@samsung.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Subject: Re: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
Message-ID: <20260912141837.06b2f3cf.michal.pecio@gmail.com>
In-Reply-To: <191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
	<c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
	<360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
	<TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
	<TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
	<191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 16:10:04 +0300, Mathias Nyman wrote:
> Good point, endpoint use after free is a much bigger and earlier
> issue here.
> 
> The endpoint rings that audio driver is accessing via sideband are
> freed and reallocated much earlier. Audio driver is unaware of this
> reset, and may still try to access the freed ring buffers.
> This is an issue long before xhci_sideband_unregister() is called.
> 
> usb_reset_and_verify_device()
>    hub_port_init()  // resets port
>    usb_hcd_alloc_bandwidth(udev, udev->actconfig, NULL, NULL);
>      hcd->driver->drop_endpoint()  // for all endpoints, xhci tags ep to be dropped
>      hcd->driver->add_endpoint()   // for active endpoints. xhci allocs new ring for ep
>      hcd->driver->check_bandwidth(hcd, udev) // xhci frees old ring and takes new ring into use
>      
> So turns out setting vdev->sideband->vdev to NULL in
> xhci_free_virt_dev(), and reacting to it in
> xhci_sideband_unregister() is too little too late.

To be exact, such reset of current configuration only happens after
successful hub_port_init(), which requires successful hub_port_reset(),
which at least attempts to call hcd->driver->reset_device(), which is
xhci_discover_or_reset_device().

This already deallocates transfer rings and includes a callback to
sideband client to synchronize. Current implementation in QC seems to
command the HW to stop using affected endpoint(s), so the most obvious
and blatant kind of UAF is meant not to happen.

Maybe this could be extended to unregister the sideband right there,
but not sure what happens if hub_port_init() fails without us knowing.

> I think wee need to look at using drv->pre_reset and drv->post_reset
> to unregister and re-register sideband, or optionally to unbind and
> rebind the whole interface.

That's another opportunity to get rid of sideband users.

It doesn't cover usb_reset_and_verify_device() called in reset-resume,
but clients should usb_offload_get() to prevent suspend.

It doesn't cover hub_port_reset() called by port_event() for SuperSpeed
devices, not sure what that is and whether it's dangerous. I noted that
the original patch talks about hub_event(), but maybe it's a mistake?

Regards,
Michal
