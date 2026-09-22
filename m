Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7F306744
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055766; cv=none; b=r2BS0htTY6svcfSLrxkqzrex/4AUDnhR0WmnOXGtmxq+jt35pDcbX/Gh8Eg9SYzQXNc2TRJhISLr9ownzvNjdzxwCowfzhYUdJA7IOmI7xfI9oDJ/i2YrleP46c44+AoFRdAtqcuxpeITu7OSZpEAZIuGwI6fc6mXjHDgr9lrq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055766; c=relaxed/simple;
	bh=aeVabm5Uw9jqkcM5NWOCRISU7fwu/VYuC4VPgGhiH94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sDqeRGHoHpywPV7i00Clp330m0AOyYhrR/qWZZqLrMZHRb8EvmJ+u5CNMIlfDwUORY7vLfN9at8FlFyI/cxXHtuGlFwUGXuFEY5XKetzPtCwKOi2d0+6VKNHpRUwq44cd8lrckTY4KF1piW7tYnRNxPBIFvnlzPxRWDQJBlBKh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dZk+ANdm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=stxicsMo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dZk+ANdm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="stxicsMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKXk6E7IJgUy44hxqkIoAOjGZTQ4msGrU4sztKdUeCY=;
	b=dZk+ANdmKaF4wG+NiLPdoMaswC92iYHAjsjXzUGtpcrKaq+IlyBU8e9yp9JYVDWUeZpRcl
	D9uX5hImKGsbr3a4cNBuQtSH98zMaWGH9Z9rMPCgUo4HvG8nqX2UR0dJNWqGgZnopP4yg+
	+EcpFpQSBi6KM3raOADv5CGTZgPYVdc=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-D2wx7rZZMse_l0ARv9SbIA-1; Tue, 22 Sep 2026 01:42:37 -0400
X-MC-Unique: D2wx7rZZMse_l0ARv9SbIA-1
X-Mimecast-MFC-AGG-ID: D2wx7rZZMse_l0ARv9SbIA_1790055756
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8710450f731so3667235b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055756; x=1790660556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKXk6E7IJgUy44hxqkIoAOjGZTQ4msGrU4sztKdUeCY=;
        b=stxicsMoPS2lefGv8W6+Z9akUHyqInRgcUih7AWPq5UFpwMo7M2WPKufAVnttppEyp
         MtZSE3nUrJ8MAIPJ4mnV8zkEvArh3DLoW7T+udS52oleO1bzSuush3n/hajO+pWJW716
         vqftVMROyK+zVJ06abusPkvLLP+zlCE5hCEyy0IeHxNae7TttRRlc1hMLhsyn9JwUibt
         dC+pAEDC3hN25Lea0yyXaEGrNPBnjikrakYymQYynB1DiU/THlr1KMoD+EYIZfayaGfJ
         4ZSj3XzMKwkWv+5hjPt9h4YoGGQAOwXsVkK6ksiXkVIbIZewqjGmqA7Gdb6n5n5Xey7V
         A0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055756; x=1790660556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKXk6E7IJgUy44hxqkIoAOjGZTQ4msGrU4sztKdUeCY=;
        b=Km3CFL4ACigoyAabOKrSpcnmUCz/4cQGgbr0sLd6PYqMoEpTN3Ti6iq4plJAXVv2gS
         D2dHP7z0jV+ziBMTtHVkRoOEABfqDN0qcVYOEtMRtYEu+JZakAGxk+r0PBc87K8w08fQ
         r/bALzTvFBTCXTzmwnUYUks9EXe6Dea3HGgEduBqOsd5du2hqml5YI2fo4b7e3j/241i
         ITpiL4VSPGzZovPmKp5wKxTW+ecGA0uEjwpecRThICEYAwX6tVY9GftunmwK2KPp4nse
         YTV0G4i3cT/z6j7G3/zW94MklsSlG+TBvquhI7012Pe5VBV65IfsRGZtqyrmf2klbIMV
         EByQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3KNOZp2UMYqh5PtCeZjbwAmrfVP4LxS9zrq3W4PnnDJ5ARnSpZQT9lWLEmUulZkBQ7Tx3qvjHRkefbYU=@vger.kernel.org
X-Gm-Message-State: AFuF++mBg4YVARDfPq99ftFeBBDvQGtcpfAfHbvFmIOf6++ghVvjK/Aj
	LYqcOo1E9TzxvsGWTVOQD7iAOEsCM/JUozh38i+/Iq4PVAMs4726TL1kFbJw+uofQP9U3l+VRSG
	QSFXzdbryeGHTExiRAH4xnoOrhwUDh8E4RcT2Vnrv1sTn7yMQOQJGZ8IDdsQG7yTU2Q==
X-Gm-Gg: AYBFou0KSHhL98ZYfxh+GyGRdjW/ZuAYTPu2mEXzzT7muriotb9W8deA/UEchJ88ftO
	7u2XVwMSSMnM2W4ywTXkddUGS+h4an+I31JOE2i2Q9yZMrUvh+IpK2zxiqUNzTY2k8M6cpk/g4Y
	vm4xMWpHlAN+K6LXjGwj8rgciZXBAkxLDxCbkeVQsmS2WLAC4qoGAaSYZ42kc/Uyvi1GWgChZ6x
	LV/fS60RZtbrOttJ4GTJtqVpmsyYuLmWEmrMzxI3NGTfpx/Hda1IYIEqAYwGSmeXYEle0iGqTv0
	k8GS565TFMELIUh1r6xswpfUd1UiSSTpenx8YW5Xpo6gugE7IzAxr2QopcXbwV5Pv2MM+lZxMhj
	nS4YRnNKUHAPfMZe6dV7jqbQ7f6stZFtV37vJ4asmvw==
X-Received: by 2002:a05:6a00:14cd:b0:869:c368:3675 with SMTP id d2e1a72fcca58-87c8298c595mr71273b3a.17.1790055756438;
        Mon, 21 Sep 2026 22:42:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:14cd:b0:869:c368:3675 with SMTP id d2e1a72fcca58-87c8298c595mr71260b3a.17.1790055755988;
        Mon, 21 Sep 2026 22:42:35 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c31ee8aa2sm284836b3a.13.2026.09.21.22.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:42:35 -0700 (PDT)
Message-ID: <0bd449a3-6432-46c9-8cf1-26c774e5c056@redhat.com>
Date: Tue, 22 Sep 2026 15:42:30 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] arm_mpam: Set mpam_feat_msmon_mbwu_31counter
 when there are bandwidth counters
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-4-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-4-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:56 AM, Ben Horgan wrote:
> When MPAMF_MSMON_IDR.MSMON_MBWU is 1, MSMON_MBWU is present and has a VALUE
> field of 31 bits. If additionally, MPAMF_MBWUMON_IDR.HAS_LONG is 1, then
> MSMON_MBWU_L is also present and has a VALUE field of 44 or 63 bits as
> indicated by MPAMF_MBWUMON_IDR.LWD. Hence, if there are memory bandwidth
> counters then there are always 31 bit counters irrespective of whether
> there also long counters.
> 
> Set the 31 bit bandwidth counter feature bit whenever there are bandwidth
> counters.
> 
> Fixes: fdc29a141d63 ("arm_mpam: Probe for long/lwd mbwu counters")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
>   drivers/resctrl/mpam_devices.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

