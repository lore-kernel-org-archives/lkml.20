Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609453;
	b=mmv0keZ4irnsrWgxdUv9Ug71AzrrPZXD8TjmuskmbPPQkA0N6TMc/W0lI4hEI4Y2XSjA
	 XImf0I37eYH8vzbr6HfqibM5Evt+TiAoKA/BF3oFJ/RnzLoePVHBTeVYRNjQISvJhkUGS
	 sf/uRThuZlr7mhNalPmSZctbsFzbz3HsSFYWg0A18x2uOhaZlDlfEX/4o8tXXKBcw1Hz0
	 RyoKj+bp05uPEj6pfdJ6afudNEfTLJk8xuvWUkmGCV+0Y+ZXT6c5U453tly8CLsFZPDcL
	 6mX8uuZeOsaIrLxEDAA2DtRSA6AJauutVl3WvaRQa+p2TmXAfOe19FKAaNu7C+Z71vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=iu+KitSBUBQmvGXjEE7eBTsuXt7zA8pwnDBVeMtxfq0=;
	b=EPF73T3K/7xubXCCb/8gVtScItjUfEzWCY4nyEW0p4VRR8BxBmR7/xcwxFob4v6s5iiq
	 gTZo60BuLjG66jQKs7Swxa+SKNoPKXQbzO40q4Ew5iZ381ZMub+zgKv0HT4h4ljQ8EQnV
	 QWHu7KoDpwPO3Jhdth925uZp98VWRHu2Zpo70VuggbRoasCyzprr/yDce2zraA9bhFbo8
	 FLD5gufwtlSmnhh3j4Bh0ExTpDxKSp5DKVwTILXgy7XXbUrczaOACuyAC02/2c4e/fB9/
	 qYIvCOu0mFCoj5ah9jJeJwPxgxM4TwCM35nmk/R5LUV1sdkq8jFJIBy9f2hFcuWAoIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irbKGu6i;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD8606A555
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BD8606A555
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irbKGu6i
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3791619605cso3062612eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794609453; x=1795214253; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iu+KitSBUBQmvGXjEE7eBTsuXt7zA8pwnDBVeMtxfq0=;
        b=irbKGu6i1uI8ip45+TPaTGtucz6fep1borw5lZ0NbIpENwxyKd2IKLdr+TkjlJWJh3
         Yop7WpiGC1xwoDR300EiUqFOjiR8ig2oC5MdQ//lnZyzLyZaR6QOaKasEIvMn6mk0CEE
         V0cKuee2pqwFvRs4TkTuS0CQ1RWVqPzL6p4kkxm0J156LvSHiURtT4z9B4jksvxsh9oI
         pO7GHpx9Qf56qPsDSQCZMdPNkHlHKEYV+45Fmi0vseuMGvUPRbpiJVrsLjUDsA2hzMYa
         bkreL6HmYFRidUPgT8r1bNEwe30a1eJ+FcT5yD66W1Vih2mJr1RDN057dsY+nYw10I7f
         azig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794609453; x=1795214253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iu+KitSBUBQmvGXjEE7eBTsuXt7zA8pwnDBVeMtxfq0=;
        b=tVmrENlz9dyOKGtG2IBgfKCZH/Q/+66Acl8B1QJDQrFcA4ePrgwUs/4zWTSHol8X4I
         zDCqtuAlDD8C0Lfd7PlUy9PQZqkss5JHwTKRZDx+JjEET06vxOm27tR9TFZ+EM+/t34y
         iRDPgcKPwXCVl05cfjTWRUbLWsrLr3qjqgtMohOJV25152HeraOEvnB90tCkxPFYNUI6
         2Ug3IcaFvAIwwNtH+FSxmOmBkJSbWj3zSkAhmnV56M9KJ3tjzTeFT82Vydbe5xGyBLWj
         WEtnzFhSvwtiC/38zOBkhX97N65jZSvNRAFdIC4o8dCBwb8FeXof29Lu7cGljvPoirG1
         PQIg==
X-Forwarded-Encrypted: i=1; AL+hErGjHpdRmkh2hBOC1Pv8pq16p7VTOO26zoR8gVO36V/ngzfDmHqrqZrVxuLsr2oeySZZq/Na2vbAgHgVCoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VRuHcBK7sMZEQT63M27J0g10nLAUZMq4rPk4LUbfcX7I1cfL8
	jDcQOQnHOB7MAJ7SzNaaUZnoKVYw5D9aV0RPnFJQ1PkR11pe6zCvxW/Q
X-Gm-Gg: AYBFou1e0AkgzQ8ofHnvkL0kQlTYe89UpQ048Sn6MIaRmhYwUtmox0ig7tkM6k4+zU6
	M2FXgdRfUYxUUHR8itx6R1SCr40Poi1fXl2q/G27D2wkYQWJUuBCekTeYFIBZnWRWKvNR5stJ9Q
	zvVyd+EUpkz8V/zIfQTHkH+wOrg6PlhtWJlT0HSyfoTutNeV+Vf0bs0O9p0mgDL/ruXcdWZ22xc
	ult3GPchWoAvDCjBT9PL1j2QTORd+7eOpq3wgCYSrNHs9slPbgCHrFVoADpdOYGCg+mwvG7OFZt
	eYAIR1hjbvQuLyp7wNT4Niy1EaHYieHKwEstesoWcYPgCD5e89ZAY7EB14XVGSQs7e8lNyLxgt1
	v0MXDYmM9IgGpXjpXPOjIGBQV/K6M7lts4MCXM0LdhX3L6vRY0GI/TLxPwA8YgpTVpMgvZfyhTr
	9RCinP8HKrVdjCCTlg24pl+s/0Q62o85XLFTT0JtMltpM7n2iZTlKWRmjp5yxFzn2mXNpMUARIY
	VNo4zMe92qtWqOFpoyu/e6H9EgBRa2EEnWJ2aX/GUbSAL0pfhQY0PPLgjlp8HEmyvzydV/rntkw
	ftJd+QnHaosu87TUXPh8gCxV16M=
X-Received: by 2002:a05:7301:f0b:b0:36c:9bc6:3ec with SMTP id 5a478bee46e88-379635648ddmr2887280eec.3.1794609452470;
        Fri, 13 Nov 2026 14:37:32 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm10591353eec.2.2026.11.13.14.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:37:31 -0800 (PST)
Date: Sat, 14 Nov 2026 06:37:27 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Vishnu Sankar <vishnuocv@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, Jingle Wu =?utf-8?B?5ZCz6YeR5ZyL?= <jingle.wu@emc.com.tw>
Subject: Re: [PATCH v2 1/1] Input: trackpoint - Add new TP JYT_NDT device
 variant id 7
Message-ID: <aveQkso_7wCLskCY@sapienza>
References: <20261113112202.10304-1-yaoyuan@linux.alibaba.com>
 <20261113112202.10304-2-yaoyuan@linux.alibaba.com>
 <avcxUnUh17L91ny9@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avcxUnUh17L91ny9@google.com>

On Fri, Nov 13, 2026 at 07:48:41AM -0800, Dmitry Torokhov wrote:
> On Fri, Nov 13, 2026 at 07:22:02PM +0800, Yuan Yao wrote:
> > The new trackpoint variant id 7 is found on Lenovo Thinkpad X14
> > Gen1 laptop(Product Name: 21XMA006CD), it belongs to JYT_NDT with
> > confirmation from Vishnu Sankar in Lenovo. now it's incorrectly
> > probed as Generic or Logitech PS/2 mouse.
> >
> > Add the variant id 7 to match the TP_READ_ID command return
> > value, probe the device as trackpoint correctly.
> >
> > BEFORE:
> > input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input63
> >
> > AFTER:
> > psmouse serio1: trackpoint: JYT_NDT TrackPoint firmware: 0xa1, buttons: 3/3
> > input: TPPS/2 JYT_NDT TrackPoint as /devices/platform/i8042/serio1/input/input8
> >
> > Signed-off-by: Yuan Yao <yaoyuan@linux.alibaba.com>
>
> Applied, thank you.

Thanks Dmitry.
And Thanks again to Jingle Wu 吳金國 and Vishnu Sankar!

>
> --
> Dmitry
