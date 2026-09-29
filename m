Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C03A358D27
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694937; cv=none; b=EXe2GT3RmgFiHzhR1Q1p3bvY5nwl8Igk/RjEdMC491z0pPyEg0KsJvDLF+AGvW9QNdrQNPoObluD2viq+bkXFagzZm3VrYcRDOwq2aZB50DFLzARp4n13b+xltdkynhlgLuuGlzDawpAlu33gAAkP4eVk7TnhD4mwJRK5uJYn98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694937; c=relaxed/simple;
	bh=oPQHCssSreqYevmIjmIVpdjtDtYP4yQh7GmMq4F7OJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8YkLRAH9+uYo88ExAvwbaviuvT+zjR+TU0uDRkqjOxIPDlDtKpbt6a5jpDcyMGJ8a9GOdcAcfdUsLnml42Fbe7rdv0GFNd5LZ/a6G16kdHFQMGL86dGxV2cFYZGz4N+mCL6fs1oHtuOVKvtNXB3ypzEYmRaBL84waFibegafQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtUEwfue; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtUEwfue"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144f7915355so3771801c88.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694927; x=1791299727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gVboeSEwOgJav25gExM8I636sToVx7fihtJZdEWuJF0=;
        b=WtUEwfue7sRqWEdoeIyM2cqWA+68qspOVfIDNhQZw6lf0R9OgYTthH7Rk6/9JNuNi7
         a6PQdaj+luiKzA2VYP3aNwo5YVSmfsTmeEXR0eLumdyMz5XYvfqeWCalytGUi4yPyzLk
         nGClggQu1v1phHvQA6V9GYdUqY2g5IiCeF/nPbLwagl+9GiujnuJHODsxXHfwzcDn2PM
         Km0xv776HZDb+ErWR2TzF3HlR9ReddCt1JnzLxhrMeCBl02udhX/WjzNp0vcb4Fo8hsC
         QD74E3PHgTDVTIvubfaWK8nfkLP7NF9AU9jU5zmPBUuncl7nxRY0Gu3E/VfLQMain6X9
         TF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694927; x=1791299727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVboeSEwOgJav25gExM8I636sToVx7fihtJZdEWuJF0=;
        b=xRnlSWP9mxfC2fYJ+/EDzvbVS9EIDNxGBO9hNIjVDIRTSVBhff0/0XVK6HHjJDbt5b
         agFx05fr4ciZSUy99E0e29JtYwimg6xfcA3qfTxLCEAxOw5X+pH2QNXh7jXz+txHXtOg
         z8tSmNgU+jVYwo+Ak6eRGN+BaLlYsbcUyF3RpBIhhb+81OaMuttU3yIpa9vCWOc2QnpL
         NexsMdjuyJu6NZAhP2aTvYoJdNoNgl9KBfFA9owywyn9O2IeSJ8FXIJzyfYMv5sydd6D
         2nKSYsdY3O5PbCQyrpXGMh6Ypw05y+OjuQ0Kaut7HsqqgMR8E1vRxq7TJPiwvnYNL/ri
         ce3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwjUp1YXWTEnDl3MdtJeJlQyCmaT2NIDbIQRn5B0c1vvhTol4s6LFNWm6XDJE+UJRll8h4cAIFH9Qtp7Qk=@vger.kernel.org
X-Gm-Message-State: AFuF++nxscEcE37dlXpl9DSHUc/W9JF8kktCK7bBhToYgfM2LqwYL8D8
	WdEFS5biOOWMb71GChPlFrILsrhaSuWQK3es3FGlG+wKxctBCgFjTb50
X-Gm-Gg: AYBFou23w9gliAS3c78n009Xlt+K3QFYmDEXykwj9SHGFbReqjNg6HxMn1hU71dkPoE
	J7hdkf01+9SwxeW4e3xYURpZewAvvLR19BwmX4m6x0/7YUUyGNqnl3IkLEddNj/CqTBuifVwz8N
	1/lGANqz2mu3Ewtj1iBORgCS22qH9N+eyKVLvPuSdskZfPMsBrZnCq0XGp8iMcZbcjGgsUgl1/Q
	SAoOAZNjaiWPkbsVOz6hx6L9oscTo+uj59508z3N+O7awWFM8aIev16yVSWoYQH9WSUOoiu9FNK
	ED1rV6p5enudlRQkdMsOvTlMxz2vqqQJ7PkJDqxygyI4rhDUTTVdQN21ntYeZJNJiLTtqP3Z7UD
	oqdoG8dapTaNOt05cDC12Qr2ykQHPcMSc/woe9+flVDossxxkOYnaZPyNbq7LkG67y3MYBqKVPN
	D8p5zNuABl1V5NDgfH4GdTv/lT0fG+x9DcVOxdgD37ODpOEHbNwDJ2yWoiEAMI6+nSZ/SOWPtvi
	l0O
X-Received: by 2002:a05:701b:2702:b0:14b:1757:fe5 with SMTP id a92af1059eb24-14b17665491mr3620704c88.0.1790694927068;
        Tue, 29 Sep 2026 08:15:27 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c6489457asm101549c88.15.2026.09.29.08.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:15:25 -0700 (PDT)
Date: Tue, 29 Sep 2026 12:15:37 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kanak Shilledar <Kanak.Shilledar@axis.com>
Cc: "dlechner@baylibre.com" <dlechner@baylibre.com>,
	"joshua.crofts1@gmail.com" <joshua.crofts1@gmail.com>,
	Henrik Grimler <Henrik.Grimler@axis.com>,
	"nuno.sa@analog.com" <nuno.sa@analog.com>,
	"jean-baptiste.maneyrol@tdk.com" <jean-baptiste.maneyrol@tdk.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"andy@kernel.org" <andy@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"macromorgan@hotmail.com" <macromorgan@hotmail.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Kernel <Kernel@axis.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: Add InvenSense ICM-42370-p
 accelerometer
Message-ID: <arvWGdQN3fQi5UFU@debian-BULLSEYE-live-builder-AMD64>
References: <20260917-b4-inv_icm42370p-v4-0-fd9373f123c9@axis.com>
 <20260917-b4-inv_icm42370p-v4-1-fd9373f123c9@axis.com>
 <aq_lObgrI7uAi0K1@debian-BULLSEYE-live-builder-AMD64>
 <3ab2ba81a38d4da84d4e3ebc147aa956728e96bc.camel@axis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ab2ba81a38d4da84d4e3ebc147aa956728e96bc.camel@axis.com>

Hi Kanak,

On 09/28, Kanak Shilledar wrote:
> Hi Marcelo,
> 
> On Sun, 2026-09-20 at 10:52 -0300, Marcelo Schmitt wrote:
> > Hello Kanak,
> > 
> > On 09/17, Kanak Shilledar wrote:
> > > ICM42370P is a 3-axis accelerometer. The device can support I2C,
> > > SPI
> > > and I3C. Add the supporting devicetree documentation for the
> > > device.
> > > The device supports VDD and VDDIO operating range of 1.71V to 3.6V.
> > > 
> > Patch 3 says ICM-42370-P is almost identical to the existing
> > Invensense ICM-42607-P.
> > Instead of creating a new doc, could we have similar properties for
> > ICM-42370-P
> > by extending
> > Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml?
> > The updates on the other patches keep supporting both ICM-42370-P and
> > ICM-42370-P with the same device driver.
> 
> ICM-42370-P is very similar to ICM-42607-P but it's an accelerometer as
> it does not have gyro. As dt-bindings should describe the hardware I
> think it should be inside the iio/accel/ directory although it is using
> the same driver of IMU. If you think it should be in the same file, I
> will move it and update the binding description.
> 

If ICM-42370-P can be described with the same (or roughly same) dt-properties of
ICM-42607-P, then I'd suggest to extend the existing dt-doc so all devices from
the ICM-42600 series can benefit from updates to icm42600.yaml. ICM-42370-P
being an accelerometer is not an issue according to Rob's reply.

Anyways, the final word is always from dt maintainers.


With best regards,
Marcelo
