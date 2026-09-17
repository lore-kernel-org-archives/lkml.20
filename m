Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314144E781B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664219; cv=none; b=NjbAAcT8JGXZ6VTEShAgjli4+/XRLoFwZmpe4PLKa4JQN3xfy+P/Mp65gfv94ymSUSAeqZ+TRMO/3w4rP9sQ3XPPvPYRY+PV25PqgOdaT+RyVxfleob+oEIYazflbfdiia9MSGDy//wdy/9KFr+Db4c6KMm2jwny1NlKhcdQf3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664219; c=relaxed/simple;
	bh=dn6zdp2y2bOJRaaaQLDIzFmFi1gvO691DvcSbAUCigE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ylg5A+PmXGvxTdqxnxI/u7Gq8+oPGexK9qLKaDhiQmQDRAc4jybkMEsBtO+F6MpCtmazclLEHzZq+an+htDY8q45o+GplzavmAhQdKyQJMPkgKfO7CvZtxPo08dGCNrYG/+942yZX9KaGcHV9aVZ0Iq5eZiUfTX8qWAFjgLbWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dl7oiocz; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dl7oiocz"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so8372505e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789664215; x=1790269015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QNumNnYoURFzMwz5gShxa1JkMSD2gx61i8FWqYuf9ws=;
        b=Dl7oioczVUdXEXtspFX2+mOxyKTgtK7CijzIrDpETJMXfCsvKeEwdTQqdKEWbTBWRS
         g0Cma75FJqSZHCBIED+LGvJF2805FxD8fJmljj6KU6HGHzOBxNm21ZbleanAJjvXoZ5E
         AXWerMvg8PvsxH5KKEDRB3atyr7C1KcgqdGgsHcLp+9LxStr0YcywWbVfjIvMAwdnPgl
         8XZNYVkJnTCKaI6L3SGyV7KSnEh1lYay1KhPtwu10lJgKz9CsamytYnssW/ta5o7HtyR
         3j6SNkIEgLqlQICFNA1Yns+qW66481vHOwGwNuUlToLQcTUqoypTupxEMvBS61YbGf1s
         OpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664215; x=1790269015;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QNumNnYoURFzMwz5gShxa1JkMSD2gx61i8FWqYuf9ws=;
        b=Moc7jGkM8OoBjiXMBfJYhT2zbge6jRgM27bqfsvhCVjyrkdlfsSabC9OJd+ceoOsk6
         kZoggpOax/OXY29lBGu6jOx0VT25Kn9wzLV1EDxBLLOXNavZdqMaHLn+S8o1XBFiZnL7
         nOJgoeL00+J+YnX5NFABwO7lxZRGKjHexoNsBpNdq6QWigH9ERJiQj6zOnEqe0pgF5CH
         HmuwgBZrrBYF18zjXtO97KGPRcXvkpuvmkkf6AV6iutLE4CSIo+OWDZEArHn1tyyHSFL
         IY9BXeJsldSI8sas3DFHwFLrPFBYknx6GQDVbjjehACun1u+8NNrNtOveY/Zk0sf7i8G
         +A5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjZemsGsSN4wDBCI47lFJLGQOQJWiboLVmGX3U09gAgatZDAdHHZR1FOBqwrRbSG3OYwsLbAD+FBSqjxM=@vger.kernel.org
X-Gm-Message-State: AFuF++nfRaUgJgav05xaUOpuYP/+sSSZ/OEG1DtLfHFqsRrKQ3TdA7b6
	AYLvA20Dfnj0TXZabzP8ITdMa4N3sVJj8Gz1Fpw868UFKFHEf3m9tZ3H
X-Gm-Gg: AYBFou3gN8QK0q647xcK60xWjxZX296Hbmp6wwwZqh4FEPUiayoPqBPo3fNAVDYWB8m
	nr4Etp8fmQsFoaLK5n129NeTrmEP2xLPI7X/bwGHn73nKpyRQjhrrz03S3a/RXklfMh4+AbNnLX
	LuDPgwmuUYgxTN6tTlchV33B7UdScCFXj0PqhUCX2yIsLryO3gJjabelIpO3fmIeIP3A9tGD6bv
	I8yFIbOKjxNkWLuX7kUVrVFxoFxjSVGiP7PuNZ9tm8EMSIhgem68wlF0moZE7sfv/VijKkEnU1S
	0TLRunlbU5IGD8SXYLUQmguE0oIQIe+8NRf0ldtowGHzw14rSwyokDU7BzkJaKobZ4JfXDmzv8W
	EQk0vT2WIlpPcpXVOdMMrB/RPV178gEyC1eOGKhQCUfMA3fejzSr3Dw9hhM3x0QFIHyqc1THs1F
	ynwl/b//FiBNU5cmUid4FZy3uZo2HOhAc3ib0nRPAn9Sgn4yyS5eYaZ13sG9w7XBpcvY2+5ealm
	/LXn49f++c=
X-Received: by 2002:a05:600c:358a:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49eb733cea8mr116064525e9.27.1789664215299;
        Thu, 17 Sep 2026 09:56:55 -0700 (PDT)
Received: from foxbook (bez152.neoplus.adsl.tpnet.pl. [83.28.37.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd225898sm95977295e9.9.2026.09.17.09.56.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 17 Sep 2026 09:56:55 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:56:50 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: djraszit <djraszit@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Oliver Neukum <oliver@neukum.org>,
 Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] uas: JMS578 returns reproducibly incorrect data after
 host reboot
Message-ID: <20260917185650.7fdea3cb.michal.pecio@gmail.com>
In-Reply-To: <CAFKhL9dmR1KDaBQGta=X5xDCGirzJ8t7u0rH4HUgBoFqN152DA@mail.gmail.com>
References: <CAFKhL9eUM91rtywaz_7Mz+4mJH2b2csmOmc3+86ii3a0Ka3Q6g@mail.gmail.com>
	<c335085d-a824-4632-ad3a-c06715258c81@suse.com>
	<CAFKhL9f6aLZgerw_7bohbQWvzMxSfd-m-LFcuNP1_p1vWkN4=Q@mail.gmail.com>
	<1320caa3-85b5-47dc-aa2d-56d3b003c6ef@neukum.org>
	<CAFKhL9eTD7DxtxMSMuUVP9cDG7Nq4jvrkTCjYfwr9puZfuC4Gg@mail.gmail.com>
	<20260915233818.5881ad97.michal.pecio@gmail.com>
	<CAFKhL9fL++S1xh+aUCuYbk6EkLQnfUn95y7TBoWaGnPAVP1gYA@mail.gmail.com>
	<20260916204713.22c4f575.michal.pecio@gmail.com>
	<6041fdad-78b9-4310-a86b-f9931563de19@suse.com>
	<CAFKhL9dmR1KDaBQGta=X5xDCGirzJ8t7u0rH4HUgBoFqN152DA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 18:02:02 +0200, djraszit wrote:
> shutdown Pi with the enclosure connected
> -> disconnect USB after shutdown
> -> boot the Pi without the enclosure
> -> wait for Linux to boot completely
> -> reconnect USB  
> 
> I repeated this three times. All three tests were GOOD

> USB_MSD_PWR_OFF_TIME=0
> 
> I do not currently reproduce the state where the enclosure enumerates
> successfully but returns incorrect data. Instead, after consecutive
> reboots I reproducibly get the "Cannot enable" failure described
> above.
> 
> After changing it back to:
> 
> USB_MSD_PWR_OFF_TIME=1000
> 
> I repeated the test twice, starting from a known GOOD state each time.
> A reboot reproducibly resulted in the enclosure enumerating normally,
> but:
> 
> Alternate GPT is invalid, using primary GPT.
> 
> and the previously tested block returned the BAD hash.

So it's a boot issue. I think it would make sense to determine whether
the problem is caused by bootloader actions or the kernel.

Is it possible to configure the bootloader to wait a few seconds before
booting the kernel and connect or disconnect the device during this
time, or to never boot the kernel at all so that the device can be
disconnected and tested on another machine?

If it's the bootloader, and things seem to be going in this direction,
then you will need to sort this out with the vendor, obviously.

> Regarding the Raspberry Pi 5 test: yes, the enclosure was connected to
> USB 3.0/SuperSpeed. The Pi 5 uses the RP1 southbridge rather than the
> VL805 used by the Pi 4. On my Pi 5 Linux exposes two xHCI controllers,
> xhci-hcd.0 and xhci-hcd.1, each with a SuperSpeed bus at 5000M.

Thanks, that's all I wanted to know. It's some other xHCI controller.

(I looked it up, it seems RP1 uses Synopsys IP).

Regards,
Michal
