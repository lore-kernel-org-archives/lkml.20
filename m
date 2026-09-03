Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1C92D5C83
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422734; cv=pass; b=lt763LJj31QFoV6BSRSzQ3iQMH++PWszP9NVEL5Gbc3lMmq3++JdvqSDP+DNvezOC27Crdqh3XuggDUBhnqqAcCQfhZEXiPZxRAd/93/XMJO43BpXYRZ5PQG7yynW4zgMnepfsyBdltDL3QRUw6t32U3hxxPB4FZxGtkq2ZxEys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422734; c=relaxed/simple;
	bh=fovmEqIqgVXpo5nek+CJqatjdeLkHXnTUt8Ymo9s1zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQV2NBxnhlpXdlAUgbkNidWDadgIzM0r21rkupoNwzWwOrL2UgZ/ualpk65tAVyR29o4RQb3AAfOP7iqD9VI6fbqT1uc1i0Nw4dWPcRm4AHHpRl20pMh4GqlZ1IHAbMDL68YSV6l2/7vUiAkLYXiOTcwauyppgSzcIECDDR19n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJbB5GrP; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJbB5GrP"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso2893333a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788422731; cv=none;
        d=google.com; s=arc-20260327;
        b=mlazlWAbx8HpUywojBrort6M7byIHMEe/YAtm6L7Br0moa4MMyx3DHwod15A5n0d+7
         v/kW1tjGJHTjwJZko2AUOsvXjs5VC95ZdV3qgv6WaBhOdBBPQTxX70jJvN1ljsmgBba8
         6AAJvcwzCkmWxvqZEJcQgQ9lUbIh0AdylEi2pNOk64OGaK9jEWkJ6mTDfkECy09jICFD
         u9zFnxU3MAY3N/PY8KqinQC9/7VPS+AARMK5ZL3ET/nTHEgkbyv5uI3H4CNnChOAhjII
         /Jxjtvp1uPKge+47V07T5wfcLcaCugpHtHNtAUJlsTfebL1Q3J8+iG+j7rPriMIHxYoM
         X5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6SrVKYP6RqUW7pG//37NoHw2yaQK1BSwRv3M9s2+zc4=;
        fh=7Gn/4Z4iyKggD70VYK1aEamb4HgB9005aaTa4b9Z1N8=;
        b=K7Rqp3DxoRcU/oCmBEVufxAwKLfUUQEQPsR/pdpy14tNZXLPEkRt1wCM81nkW0rZau
         25BBmj6wSCBnBCGIWvtLEwgTZPPCCLKae9/dweJqwG+EypELyhc9kaDqvyysZsqRIa/Y
         CgZf7BpMqxMzW08llJJhnL1KAwcXsHcv70Y1SploL0abe19eKdZ3JRw9ZOzzXg0lf9HA
         u4i50HEi4weAmc6v2kFreChgud+MQmpj3RMwBIu0zZ9IYRb8oYQwMdkSDUW7zIGTbwyb
         Q4B8MsLKkokLdCioMR3RMpkxD2VHEDiqzwSOGDbzmqNCXmdE+nWUO8mkptCVgxITHwuL
         UM6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422731; x=1789027531; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SrVKYP6RqUW7pG//37NoHw2yaQK1BSwRv3M9s2+zc4=;
        b=iJbB5GrPlTsZ0MkXt/S6eWY+2Eti33VMfohvB6NiwiMBaUzYIgMW87lgMytpcLI37u
         ST71r4FKYyqGcTT+n3SOWNqXW17KDGPkXYFmYLwiX9eL4j+DbbuKW1maxQm7kRx4vl9v
         JgUZSylKtks3uDc2260p3rGmarCnTxlEeUmP3u7qGMm91oOIJtaVgjhcdFTuahSSVUM7
         fNznplJiTSd3T/3CFAx3HPYFx/1OTpBnKcG79Seg88svbmkZFm3DvId0W29YcdOc+2nl
         2kMh3ENi+jXFwWsQ+9WDwDdvzEhI/Ca4ZZ7+Zzeug0oTyY/ICraQzAoPY9IFnPikE+qx
         axxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422731; x=1789027531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6SrVKYP6RqUW7pG//37NoHw2yaQK1BSwRv3M9s2+zc4=;
        b=XTdvsry2TzBXF/L/OAQrYh+AR0qKsAbJfnDO/Pu3qsbOEiE30WylO2xslyZheHj3GP
         zC78ZpZgASIng7GA0GbfI87R0Q4tvp7YS0YytEgcnXt2DSlWcM8T+oPsgJvEah5/4LSg
         5HUS++tpmmVkO3POJrNjcBDpbtyIFpgCAoo6/jiBHx8WN5uN9/EBBzIJW3cNygKNssyq
         JADJvyj4GhD+sDAELMyGoOOZoBCZ78RAGcs8eMt5MOaNUpGc72dGb9uW4F56//AONG1u
         KIo1IYeXqFt00zM8CRmJ3zN6Gbf0mXyqnlPF+PaoIqOlZ74vUcAF0vjLUCfuC9irSp5C
         GbBA==
X-Forwarded-Encrypted: i=1; AKwUvByl5YjWxj00ij+/tZywV3QnPyaNk5YvF+yqChwz5tllyWK4qLt9/KBJzwB0x8ZSRRzZcwvnTEDgsGwM62Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mbhZW19lAb8Tsj+9r/f3zRFTJLUvvTUYucja4aHU4XTum2F+vo
	f3xh647haCBusYb0RrZSmoEeUrEnHWLHXXxkv36RuJ0O9txKipF2RGwSO54ex8gLbnAlxa0xhBZ
	Ao3HV6jWwN0y4IpYd5hSRWcUMr6n40hY=
X-Gm-Gg: AYBFou33fBjczvKL9+azSVqQP6M79P8ReJqiFz1quL2bBc+YcZIu24NKb4eXP4wzfrP
	+KsaCWt17WQ959Op6Ye3gRctgvfA5EZvShhTbsir47UCxWRwfuT+1YVsh7zmrmu6W5naZ4b2/rq
	Yi0xUeWsb3+5uxFhNutkIB3SCzCNPQPlabhp6lXHxzsKM8K3rYNowEMz/DAivZg1aavih0ec1DN
	ILJuucUugcD13eAVK8rrw5ILmp7uvBfeVTg51Rq2jUtnYoeNNMf1mtnCDqZpj30V3JK1RpdD/gf
	uGN4RACYvJKfZVaF8RxOSQU3j1+YxZW8FMm1zSqjLnIhyDvdMf9ArcIp
X-Received: by 2002:a05:6402:2110:b0:6a3:87b7:b5a9 with SMTP id
 4fb4d7f45d1cf-6a682ab9d91mr6190594a12.12.1788422731087; Thu, 03 Sep 2026
 01:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026082042-coma-moody-5b4e@gregkh> <20260820084557.129908-1-khiemtranzo532001@gmail.com>
 <DKTWKZFYC6TL.2ZESRE0NWAV2T@kernel.org> <0198b9fe-4bc0-4e12-b788-85aa2c9f8162@rowland.harvard.edu>
 <DKU2J83B6IX6.2CG1WOB66WC39@kernel.org> <CAEe5be5OjseCMxGQP=QMd1L-muOTDguaay_-21moS1+xRNNNyw@mail.gmail.com>
 <DKZ6PZV65PYX.3M9UEZC4ZMLLC@kernel.org>
In-Reply-To: <DKZ6PZV65PYX.3M9UEZC4ZMLLC@kernel.org>
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Date: Thu, 3 Sep 2026 15:05:19 +0700
X-Gm-Features: AcwNN1WMKVWa1WK1FArX1_9QFOqs2KtBbQ6O2kt-cOvVQdr4bwbcIwMEhE1l-hw
Message-ID: <CAEe5be4cJ5VPu88V4L7i0Pz+joSmJjBOpA=S9knbk44_-Rf9Og@mail.gmail.com>
Subject: Re: [PATCH v4] driver core: avoid klist_remove() on unattached knode_driver
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com, stable@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 26, 2026 at 09:14:00PM +0000, Danilo Krummrich wrote:
  > So, for a fix that also goes into stable trees what you propose sounds
  > reasonable, but eventually we should use the match() infrastructure instead.

  I've implemented the approach you described:

    - In usb_driver_claim_interface(), when !device_is_registered(dev),
      skip setting dev->driver. Instead set two new fields on struct
      usb_interface: claimed:1 and claimed_driver.

    - In usb_set_configuration(), after device_add() succeeds, check
      intf->claimed and call device_bind_driver() explicitly. This skips
      ->probe() and attaches knode_driver to the driver's
      klist, making teardown safe.

    - The __device_attach() dev->driver path in dd.c is left untouched
      for w1 / ccwgroup / pata_parport.

  syzbot confirmed the fix; the reproducer no longer triggers:

    Tested-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
    Patch:      https://syzkaller.appspot.com/x/patch.diff?x=12af8b49580000
    Dashboard:  https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d

  Will send v5 shortly with the syzbot Tested-by added and the subject
  retitled to "usb: core: ..." since the change is scoped to USB only.

  Could I get a Reviewed-by from you?

  Thanks,
  Kiennql
