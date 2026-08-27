Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D283115A2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830855; cv=none; b=FpjW21U4Iq90X4zZkZXjDXO+eVaScxp0cN89/XKdGnel3rnqI+8G5yl7FmJ3PkBbBhA+8Ke4Wr4XM1Cc99nj0YI05+HGaK4LTd2pMBNxkMMHP9ZTj57i4mYEvaNudxjW3DhCJNg5Gh6TbzRdWIx4pKRRQzSI+FpVLolR2S7FRZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830855; c=relaxed/simple;
	bh=gwLrmytVYeMIfSF1eSLHQPJuoreaRYZhEn7gbBOrPv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZSC9rjafjGmHRY1Y5UFlByqY69/cyiw3deymzuNSuYLv7T88HMxQcRhg5hAp/btFMxnDybKJyteuMG/Au9/9R559FKHXicD3HI5OuaekDRCTYyuLdaigUGKMWb6r3OrBFFM2E3xXgbs9Q174dINTKxqKFVMU5Ujmm1r5XkDG7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jEopNr0v; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nP5Mi43A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jEopNr0v";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nP5Mi43A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787830852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZ2+HPBM4So6DB+Magsi+GAUKyjptnXMS5Wn1n3mvMM=;
	b=jEopNr0vz9Zhg6sU4fd51wvF3cTdyQ4yQm/A0+oNUmlaQ3G/kuxwY2TINcj5FAZfCnyGis
	UORX5nigZ7Jwmq8d+hqV3Gx3kleBydW7Fglk2GLPw0HB6w8ZDDNYomZXr4GRFlbiLhLkbD
	XEAI2jg2jDf+4CMjKp34r4/Um8QKds4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-rDDzk-bfPLieED0rb8ykbg-1; Thu, 27 Aug 2026 07:40:51 -0400
X-MC-Unique: rDDzk-bfPLieED0rb8ykbg-1
X-Mimecast-MFC-AGG-ID: rDDzk-bfPLieED0rb8ykbg_1787830850
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-493bfc3b84aso3879915e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787830850; x=1788435650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZ2+HPBM4So6DB+Magsi+GAUKyjptnXMS5Wn1n3mvMM=;
        b=nP5Mi43AP1ua5FBjOoFfFVzuERohs57d71LPdPbVtBZ4GgOYGBzSJApYOXLhOt94bY
         Gnau1WSUkrzKaRm1caB8lGQDWbagFBDsX8Vvu+nY/neBXHClLJFoWMhDXzXNK87orE/W
         m89nFr9iC4x47YIt+AGbX4+kB8DOKSGOGqKmrvDcjoS8lmGmzkhWDkujZe/bAs/xfHr8
         GEQXAo5DENoH7xri7WZyP65sZgEglFLB4aCv9eQO3/RXhjOaqkDJcLUr7QZOE29KwfJ7
         C7ZPaB9VZfn3ojwJCGe3niHE7EfcDg4PiuzlxI/VPm9ix1TzoxOajqpLwFkXrM4GCFOF
         lENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830850; x=1788435650;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZ2+HPBM4So6DB+Magsi+GAUKyjptnXMS5Wn1n3mvMM=;
        b=GwETMVCqOEUdORIs6UXOKpK1QNKXBOtvCCr8Yxtqz7dDlUk7OjRO6QkswdtXmAs+k5
         qN9gku5YxA/0yAx/IA7UwuUtixjY++u7UQYWoDWmVA04na2TfCybkIDROwSwaPl9q5Jg
         mOAN1VnXAF/1EVAP2K7StKWFATyUVTncNByOoK8/g0WGfo/+mSslrMLkZKtWHhYR1qBj
         s9pVcsLAhILmfkoSylrf8SIxC3A/PBgxXxafmDK/r0ldppiB0UpW0YbBOj2FhPLWvM0Y
         VXCG6KvOj+a3Ef1eiIyhOWu4uHys+1qXWPsHAmLpBrSYXMQaauosaing/yw/XJZuMl3h
         dDPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqIxYUBU/+sjgZmBzyd6B1b9LUhuV+q9weWTG2LtIBtzQM+CXToh4x0tXoOC/d8DPLphCxuJGp0mI3Mek=@vger.kernel.org
X-Gm-Message-State: AFuF++n8saEg/n1WJVO2Uq9lkSBj4y3Y17cz70rp/zQQ4O4Bs8d66/HS
	BjHO9l59V5+CnvJKpr45JYj9eTLp00O5ddVz1U+SgZVVpM+C3iBs/WzivkYQpCj+3ZsL95I+Pyv
	11Qg0JKIQWuyhC+Al4yha/wEVY1iC8PnM6a8cIfAnjzMkUBaVwObuU2XdctFEJiaG4A==
X-Gm-Gg: AR+sD13Kekc9x1FrLxM5Meebn/0TrY7UNFELblS5p4PUdSd559/NdEZ2ys8ygKvzLNf
	x64dwwe2a0YW3jn+7p/cElM9I14Yip87pxDuy9bXStlm9zlPQgptBbRQaMfYlEuSSqz+aHwnwAL
	KwGgZHwX6PJ5cu/L1KhZ8lXeZki1CoAFSoFuofHe6pHZNHiC6BlroKvRQJbx2LU8briZltig7vF
	yeSG64Lu/GI6t5da41K0sNL2MseaD+jMYkgBl7sxbqvXLPoPjdcKhpgfj4WpSGJObpwaBI7JEWb
	aCTefVgf9zTWBUbZ8ktalySCaHH3StK4tpGHCB80w4Zzc/k85yWUSwaW5/O/Mh1rAAC6fEp5n0k
	HVWX5AgxdF09DVifi6MpYaVP+mgYLtRPOt/GI/QCpmDsjggxsTkKpb8DXohtovNulKexZ4Xw=
X-Received: by 2002:a05:600c:1d0f:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-499dc6e419bmr149696685e9.1.1787830849808;
        Thu, 27 Aug 2026 04:40:49 -0700 (PDT)
X-Received: by 2002:a05:600c:1d0f:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-499dc6e419bmr149696015e9.1.1787830849336;
        Thu, 27 Aug 2026 04:40:49 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279e92csm8458879f8f.5.2026.08.27.04.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 04:40:48 -0700 (PDT)
Message-ID: <e60be557-7020-46fc-9b07-d8b32f99f103@redhat.com>
Date: Thu, 27 Aug 2026 13:40:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 6/6] net: phy: avoid double-free after LED trigger
 registration failure
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>, netdev@vger.kernel.org,
 andrew@lunn.ch, maxime.chevallier@bootlin.com, kuba@kernel.org
Cc: hkallweit1@gmail.com, chleroy@kernel.org, qingfang.deng@siflower.com.cn,
 hao.guan@siflower.com.cn, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, linux-kernel@vger.kernel.org,
 Xuanqiang Luo <luoxuanqiang@kylinos.cn>
References: <20260823035600.188864-1-xuanqiang.luo@linux.dev>
 <20260823035600.188864-7-xuanqiang.luo@linux.dev>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260823035600.188864-7-xuanqiang.luo@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/23/26 5:56 AM, Xuanqiang Luo wrote:
> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
> 
> phy_led_triggers_register() frees phy_led_triggers when a speed trigger
> registration fails, but leaves the pointer set to the freed allocation
> before clearing phy_num_led_triggers.
> 
> phy_probe() ignores the registration error. If a later probe step fails,
> its error path calls phy_led_triggers_unregister(); normal teardown during
> an unbind or MDIO bus removal calls the same helper from phy_remove().
> In either case, the trigger count is zero, so the per-trigger unregister
> loop is skipped, but the dangling pointer is still freed unconditionally.
> 
> Clear the pointer when partial registration cleanup frees the array, and
> make phy_led_triggers_unregister() free the array only when its pointer is
> non-NULL.
> 
> Fixes: b7f0ee992adf ("net: phy: leds: fix memory leak")
> Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
I think an explicit ack from phy experts is needed here: sashiko has
flagged a few pre-existing issues on this patch:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260823035600.188864-1-xuanqiang.luo%40linux.dev

that IMHO bortderline to be addresses in this same series.

/P

