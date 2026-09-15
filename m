Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD773C8C48
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476551; cv=none; b=ATS20Uo3KqEJPmMTjppMEdn1Wge4UrAN1z+ijXX9C5hLPeRHTIEtyhV07YrxPS2T+g19fnt/doG2zZcsPr/b5PmyxQLSoap/CEZiavTaLA4mh5L6eZQyfj7QcvA3BtJP6gILRI+brxUOcmaHi+QyuZvNMOTtrSBAZ2Z9N+5U34A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476551; c=relaxed/simple;
	bh=hjF5uq4+rnXMZsq4PdMN+lhsdpK+neGjIFKdjIdf+8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=WcNoa9KM6g7LatwdcE19KYoets1XC0e2P07EkHMKDm9r9jUKB0J1MDxSp+aPV6og3RBiDfdFQkWUCNZ0KpdiHAQs7gAeioipeGRiJnijd/A0ce4ZArF0it7bFwERd5XbK11IO0rBPWLzETjRW4LRda154YR0llxpMQp4LVlaRCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOOARdHK; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOOARdHK"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db22383fe8so22631115ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476550; x=1790081350; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hjF5uq4+rnXMZsq4PdMN+lhsdpK+neGjIFKdjIdf+8w=;
        b=JOOARdHK4zBGCfoAZZPJV19GXznCctp8XRRWXg1F+REhUejU6SPsn6B8nKNB0I+mPC
         /qV/wUTsgSHCSusEuyl3LkgYfqmHOhUxDzDeEttvCiwkb6tDBY5iTlMnPXmuwslL+4Wn
         zeYBhl0PEK7wwRfXtYoqU4NlRfufvPzungXlAakwrcqtx+p16jhnnNBslkS+xibrSDTp
         tYgy0fwSuKGbFRIWBm3aBgf0z+CBZUfoXI/DW2SOKhG+TiqvELVGQvFSu6GgkbI9fP07
         gI0FJcSxgZAX/NUxT+Iis7YUtpzTuq/5OvXa/0IoK0fdpD8KtQduGZSvEsikGzcYE6PI
         x3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476550; x=1790081350;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjF5uq4+rnXMZsq4PdMN+lhsdpK+neGjIFKdjIdf+8w=;
        b=ZEWdyLvZtMU6sSTOjErxCcYbVU271TWJ4kPlW38uM7/K5LAbDhcfrr7y69hHmLwWS2
         AhegT7mrYGqrS8Lr1VJcgI9nHB2ElID7A9ECHC1BSWU54HNWsHEp2ymJvwyb8wC2ZK9x
         zLmSJehK/qzmx2QlQJ1frx076z+okF+334eKWgo7mcSpXlpeaQ6xc8MoIJ4J1azR4Xo4
         B5IFh6Pd8972KXSFoi+xzB5z+MSgzSbTg/tcpO2po5eF+3DXYVzSdwt9JAowf+Wl1Jes
         QD/sKSUYIQZiLBEZrfSN41olIudwtFpfAlbdAhg3FgYWq6VoxBmwKHuKkQRDLLPrnh+g
         NcjA==
X-Forwarded-Encrypted: i=1; AKwUvBwtMt2JYi+KA12VLbJodc7wfwH9VfxagwGF3PDEPF4DQKf01Fu4QyxmPApfMFD23VgRYrBu0p76B9kH8KA=@vger.kernel.org
X-Gm-Message-State: AFuF++lwl10O/U5xBiPtF7mcg+c+872IYNNJKsHi3NGmkAnYgcoCio6Q
	tLOEX/4gRj4c+cHZUPlRo/iTrGVQeYlHuMTY8DuMdjrqi37HIdLRofKm
X-Gm-Gg: AYBFou1b8qG0ZflvFtND/61nPyVZV0TZifBJFaYBMWyFB4Mf8n4ZnE5JAtPVOPk8+uw
	ILjkVdJ1Pc2pT+KxJ2sx9+PKkbrimmfqNbkcSOANnbI3YOoj6FQnBgir0E6HJAbElrZVmWFtcO0
	YVgyMWhd1MkqWH5WUsXkbBwCepWQnWLxQ79KROVKi9jPfSFGqB/TmDgOn32KDIcWwL3x7SOhp3N
	WYLYWJwPkidSzRCm3C25d+Dt19AAB1qzOOw7h2xKhpYQrIa5M8g34rDuN24lE67Bw7HuH7jd7+O
	7N9eepmKcXm0G5j8Tv2RzP1CxHKZQFcsv/juVy8NvHIAuWw+S+AMJ65ho1AQaPDS1sTy7Jf+uCA
	ODe5e82//k2YQi0hDSAFRxZt3qDw2FFvzBwZeq7wm7mtPSQU69f4lj3pq2pwO1/0csIL+XknWgL
	UQap/g/fL/HerDVAxIvaglhrB/QbDAASGkNGPpFQY3wJrnM2ZHrDCXC/eguNHmQ6vLen9sxg==
X-Received: by 2002:a17:903:320e:b0:2cc:864b:539 with SMTP id d9443c01a7336-2dd6c5eebcfmr170674595ad.6.1789476549474;
        Tue, 15 Sep 2026 05:49:09 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:91e2:d400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd48ae3cacsm52866095ad.26.2026.09.15.05.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:49:08 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v3 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Tue, 15 Sep 2026 12:49:06 -0000
Message-Id: <202609152112.ReplyLee0910.lhw@gmail.com>
In-Reply-To: <20260910093232.GO2133376@google.com>
References: <202609012200.RFC0.lhw@gmail.com>
 <202609012200.RFC1.lhw@gmail.com>
 <20260901145204.2BF551F000E9@smtp.kernel.org>
 <202609032000.RFCv2-0.lhw@gmail.com> <202609032000.RFCv2-1.lhw@gmail.com>
 <20260903122408.3CA6B1F00A3A@smtp.kernel.org>
 <20260903161357.GX2133376@google.com> <202609042000.RFCv3-0.lhw@gmail.com>
 <202609042030.RFCv3-1.lhw@gmail.com>
 <20260904131503.355C41F00A3E@smtp.kernel.org>
 <20260910093232.GO2133376@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Understood, sorry about the threading. v4 goes out as its own thread.

On the three sashiko items: the naming one was a real bug, the LED
names now flatten the sdev colons to dashes
(asus-arion-0-0-0-0:led0), so there is exactly one separator again.
The other two are false positives: kzalloc_obj() has been in
include/linux/slab.h since v7.0, and blk_rq_map_kern() takes four
arguments on current kernels, called exactly this way from
scsi_execute_cmd() in drivers/scsi/scsi_lib.c. Details in the v4
cover letter.
