Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333044EDCC0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972284; cv=none; b=kzPQj5E1lPfi2DV7PB7o0zeSla0RPhKZdX54jyqn2KLuuaduI+L+PUf6N7/ru7f618okp1MsUMtxS+iLSAgUOJOPSWx9QlOUuybqeBQo2v8fpcx0i55xJwB8jUxxUz3aCrsvAPjeVfpUTYblKk6lTfjPtkZZTnv11z0gUsf1vxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972284; c=relaxed/simple;
	bh=xKoZbrsEpZl7WHOwhRzJwVxlIDXvatXmrwIqVWMRm3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nnhjlz7rMXY+dy412RMdkRBcngg/UGOhaTkjHW2EZP3Ro7pertbLATcp11Pd9sFVAqr0PWSORbDhAq0q7jM80X1ag1caprluDcazLkEOpQ8Nnktq1kJfJPE9rnEmGqULVvDC10X+L0VfX0gRx2XBv1LfZkAdcBuBaa79yV9tNqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qzhorth1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LZZ7I68l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qzhorth1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LZZ7I68l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791972282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XemIgLfXAXsX5F5DvdAMtcb2KhZv0+MaaLg/MSFJqAo=;
	b=Qzhorth1tFIAoFWmA9GB16Be1JJ3ZBgV/WxstIOFGBLj7yoA5H7qX2mg3Iu2Ek8y3Z2Ldl
	D/dISWOa0p7v3Gl2O78fukk0mrPh69oVY/bjgiILCuhfpCEoOgLXg4Blgz3ji3oZ6GJalM
	0XDC+JC+AqNugOMF8eB9ah74On1F6iA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-JwhNeEDNMEaCSC1wPMRaBw-1; Wed, 14 Oct 2026 10:04:40 +0000
X-MC-Unique: JwhNeEDNMEaCSC1wPMRaBw-1
X-Mimecast-MFC-AGG-ID: JwhNeEDNMEaCSC1wPMRaBw_1791972279
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1b11e7837so9015775e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791972279; x=1792577079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XemIgLfXAXsX5F5DvdAMtcb2KhZv0+MaaLg/MSFJqAo=;
        b=LZZ7I68ldkj3iSwSrPBlqlAYfN1L+tOgruyR2PKLAX796uVuMKta9ndcpM4O0A1Mx1
         Jrh/KkTK7G55tFERV/NIXkgqGuIuZMJHiz5KVw/peJIlJU7qX/sDlgJJjq8kTxvXYpNE
         O13qBCOE+IPVyaIVilSKDQ3mLfVo7xhUWVkrAC8K1E6IPftL+X72ATJYThhcwulci9wJ
         spM+cBUqKCOhDE+tp8q2nCEt/fvn5sZZ+I0BpsYTRb4JK5oFWAjU3nfc64azqzAFG23v
         5KwGcnodHwaXG3sbG6YCFg1oZScI88u0f9U4UmcWP5NAlylbh10jrmSDYbxAZLHpij1x
         7v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972279; x=1792577079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XemIgLfXAXsX5F5DvdAMtcb2KhZv0+MaaLg/MSFJqAo=;
        b=iN53J6/OpYf9Makt4UN6siEG9s7rulkxzQnH+tED2DUrzLUCiwghDq1FMrJIbI8szG
         wRH3rtwsiufDAkawQOx4bKaeQflhSIybOs57Yv9f/OfR+1Kdjo/gMCCSAdTU5z5qCDEC
         aINAgiKS3ZIS6y1mySTmgdLehtAJhYT+54nbvz8lbAL89wcGSOhQErrBWbENm2PnIJ0F
         izpAOOzXgsItW3q1tN776qIR53WJkdU4/MGmSya/LccGvi1PmR45m8jqUIOiXCIprJXi
         lvfF15P/f2XrF/Lc6AvlaL/ME3BNjGoaGvcTA5A33565sJz+PJ3OFO4s624FPbAB5xrU
         XuNw==
X-Forwarded-Encrypted: i=1; AKwUvBw/U046UaiDKFDK/lRq21xXcPU5u7SAgbmoRnAw7Tdovg2yyb3VgXuZr421QXn72KieD1vVK30P9kPrz60=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8yZLDUwT65T5Ujv1e2vsZnTLKbPpSn/tuAPp2eRyfF/sIkDIw
	CLTfwt3dPDZ6TxWmKp2NUzytWZgn7/qCy1RmPvmR2fK47ggXu+wfwsTXHbBv+ILB4tmNLuC8aI4
	22XW/eUQKbf74aF48RhLsDLVYWHDesibeJ1joijKCEFLy+XFSNzLWZY5CQuff1hX+ZQ==
X-Gm-Gg: AYBFou3oX5Kt3Uf+zLj5P8duuqmkDA//VfsiQt2g0OTun24IDXxT9qytGeMXA2w9nZC
	JrLhpi7FwKbqKLt8X6928N2Bkyp50Wxz12ae1QaofRRFi8jsl3pRhXAhyhwZYm2++s5NCNZiWJ9
	cBDU8UwhpmypVnuFCoEcRhI0/o86eLTA/UY7uJ0/AAOk2NP0aYXxNmTPXne/JtjslbaRsSnLni7
	hhDoTJp2ZYVBDdgyrEqrGHWTCjJoOLpV6Ob6lHC4ULvBC326AcWcSnr7qv1p+sa5geXEzs9ae7g
	uf+szrtVhn8IGQiH75LGPO5o78eV3ryXzpc1Y1cJtqgFrArD5H5nLghC4oZ6G7xJwqFa0yI2sPF
	FLZIsMLkzzHhmfc/9QciIYqc46rORBVnK2mircCcm7VIPx47DOSSjnE8Y2ZrDKLNnxLy3jj6L+w
	==
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr101285135e9.33.1791972279238;
        Wed, 14 Oct 2026 03:04:39 -0700 (PDT)
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr101284465e9.33.1791972278755;
        Wed, 14 Oct 2026 03:04:38 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm419838595e9.14.2026.10.14.03.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:04:38 -0700 (PDT)
Message-ID: <3d3b9f10-e3e8-4d50-b543-0d451cb07598@redhat.com>
Date: Wed, 14 Oct 2026 12:04:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes
 after the MAC
To: Aleksei Sviridkin <f@lex.la>
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
 <20261013151233.2474217-1-f@lex.la>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261013151233.2474217-1-f@lex.la>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 17:12, Aleksei Sviridkin wrote:
> On 10/13/26 09:53, Paolo Abeni wrote:
>> The above looks like a significant amount of complexity for OoT driver,
>> and I understand it could be solved with a different kconf?
> 
> The PHY driver is in mainline, air_en8811h. Only the board's device
> tree lives in OpenWrt.
> 
> A config change can avoid it, but it is expensive here. Building
> air_en8811h in is not enough, since it loads its firmware with
> request_firmware_direct() from the root filesystem, which is not mounted
> yet when the switch probes. It also needs CONFIG_EXTRA_FIRMWARE with
> 144 KB of blobs, in a kernel that OpenWrt shares between every board
> of the subtarget.
> 
> Is that the expected answer for a board like this one, or would you
> take a smaller change in phylink?
To me this series still looks too much churn for something that has
alternative options. I would like to hear a 2nd opinion from Russell,
Andrew or Heiner.

/P

