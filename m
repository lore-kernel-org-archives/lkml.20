Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93947544D5C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790112307; cv=none; b=CM1gNr0KhM64jZ3/6Y6FIoGMwkfnEIx/cmXO7BNVPfkPg0yPmh6qsZK8Oe70v8/qpZS5YdniYJXjAOpiMGxd6zw+uk5H0+z8gVPF0KlkfVwrz7h0cpjqPQTiyPZ6BW2fn0lahSkIFRsXXnluXncg8VgvrXp7lvMQK+CHojmWzps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790112307; c=relaxed/simple;
	bh=no/OHCTGZ4vWGPddZ9QLuhpUGxiTm8p9NsSWN+Ypb30=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=nGztA2WmGc5YdEHuHURnXTKmbUyHlSoIERlq6i+ItatUM9LBQIGSNSHGLb0Erez0LGyoDO5VNcjkZ+HKvfMYyZw4emO0/mdxUXZB0kMEaJi0NGBjCHbl/FoWA9QgQekkJYsruDNacAYNgCUUVchIPo74IvOexcQB28cJrbVWX40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lItEh/Fx; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lItEh/Fx"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bb1a50f6fso126537eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790112301; x=1790717101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=no/OHCTGZ4vWGPddZ9QLuhpUGxiTm8p9NsSWN+Ypb30=;
        b=lItEh/FxsD/j8z3dz9Al44YrTdL+1qVmEQifaa/ibIjrYozFB1gRRNZPdjNX/ZblWP
         LlTRTmrE1wgOJgKWWzi+9MKAVtGDYwTxj1CXS+g4C3tAQlNgyuF1j/p7BW+ZG+TtpdxN
         s8zPcK8Ae0AbyZ1WZkBy98+DmsVkeJ5yrxLj+eb3FhR3OPdzug2InQdsqBynZaVUMzw9
         DTAxgZ+9Iq5PC298ItQ0i8INoQNMPLKsan4oTLGF61AFSSlHRmrGbqvKveaw6PId8eN1
         jnKm4m4GZmhDynTAXiTajEsBQdeAJB5b/dGDFklBk99beYO5K8XwJtBkXbzvgxanzcWw
         o0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790112301; x=1790717101;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=no/OHCTGZ4vWGPddZ9QLuhpUGxiTm8p9NsSWN+Ypb30=;
        b=IrM905hyQiAPO06IVximx8EVSvSqyokg8HVCzS0v9x7CEuU+QetTrHV1EOK38qe7wo
         /onvpkWyWUeDzdJVfW0O/cqKbIWNJiu6j8QYEH4WuRpN5bo6iohUhoA7uDRBmGsNc+Tx
         toOSEwtDwR3Al3JlFUHHYzITcgf5zkQV40h3tFsp6tJrY8ZcC/wH7H2t/U7AYouenOc3
         wZIAtYdZ3GTDbWvuJ1W6iavlt3/3dpinKmmdAz3k6oYMtCTQ8azQcSoWGL7fpKg2Qr/A
         ixH2jJ+NK1r4U7XBnOoZPNbt5kSV+QMwIhkEDdztNgOizYv12ChO4MNiieaK3kOgHQPp
         +PtA==
X-Forwarded-Encrypted: i=1; AKwUvBwp+fpej/JPml6YxVefZH2knRCtN//AP8I8DfEX40H0JAA0UsKrvtK8Ak8BRKUak9/Gb94km5MjKL+DG/k=@vger.kernel.org
X-Gm-Message-State: AFuF++kYORDT2K54k+5VbzBj6u8K3ee7cNshhBdm0Bs+z6gMhzU4wwaH
	rokNW5OFN0svw+Q701U2R0Sit56hzfNvofznkIADGpSCVYa3aXsW4X1O
X-Gm-Gg: AYBFou2pNX/wy2UzCTcC80aUI1y576e9JxYYD78A8zSU9WZdThe/ULdRNuLF2nBRd56
	Au8dy7EdR80wwoiq3TaesAtB0CYOyzEt4cBOIDKm8DIqUcOhy37aySbD1rgZ4Uy/afMX7/Qh2kA
	DTAgFpke9e6m4MQIs0zCdrO5vuctooNB0/haxZmlP9DfSbYMpJNHrSRmVzcPrbi+ThL5aysFpdk
	DKVm6n5H9RFPtux4HbvQvWgG6BuZZgzJrwxgfDHUBBQuTY4ekpjH/Io9utNaGy92IfVuXoeBMWK
	/B4H2YHoiLWiucqLBl56XU+HINeHNB9e0ISmfU++i/XtLX5eBK7Na3074p0WpwQ05bO8rDTGolI
	DNCNHLSc27T7tYqe0uf6aVl4Tu4SmsmbZYX5ZK2/B4LvAhneYFZAm8wjA0YdBv9NPAuZE64AsCS
	zbeW2xzT7eJx4EZq39tYVGn0Z6FGZtYjjF4+0swhZPnGvRnfxrcHY1tN8FHnQaJLO5v0zAg5OT8
	rDLoP4A/zj/KdXlHVOGXwOKtPdTeNWr+/u+PFlugaxwYfYN5vGqTJfPEo6S/e3/rS5DoRg72q6G
	55c=
X-Received: by 2002:a05:693c:41c1:10b0:339:7f8c:7f9d with SMTP id 5a478bee46e88-33e8d8d21d5mr615779eec.28.1790112301177;
        Tue, 22 Sep 2026 14:25:01 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm1014841eec.4.2026.09.22.14.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 14:25:00 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:25:00 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Aditya Dash <mradityadash@gmail.com>
CC: Benjamin Tissoires <bentiss@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_5/7=5D_HID=3A_hid-lenovo-go?=
 =?US-ASCII?Q?=3A_normalize_calibration_failure_status?=
User-Agent: Thunderbird for Android
In-Reply-To: <p1o757n0-2rro-rnqp-56qo-56q08q5p29pp@xreary.bet>
References: <205C547F-BF6B-43D3-A8F0-829B657167EC@gmail.com> <20260905061054.50663-1-mradityadash@gmail.com> <p1o757n0-2rro-rnqp-56qo-56q08q5p29pp@xreary.bet>
Message-ID: <836F1B09-60CA-4A82-8293-0F9CF506E593@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 22, 2026 11:54:36 AM PDT, Jiri Kosina <jikos@kernel=2Eorg> wro=
te:
>On Sat, 5 Sep 2026, Aditya Dash wrote:
>
>> Hi Derek,
>>=20
>> The Stop reply changes based on calibration state=2E Its status appears=
 to be
>> the current failure_mask + 1=2E However, this mask does not always matc=
h the
>> failure mask returned when calibration times out=2E
>>=20
>> Here are some requests and responses from the experiments done:
>
>[ =2E=2E=2E snip =2E=2E=2E ]
>
>Derek,
>
>do you have any final followup / verdict on this series, please?
>
>Thanks,
>
Hi Jiri,

Thanks for the ping=2E I missed the last response=2E

Aditya,

Seems pretty inconsistent and I can't really see a pattern emerging=2E I'l=
l look into this more later when I revisit the driver architecture with som=
e other much needed fixes=2E For now I think just reporting success/fail li=
ke we have been is fine, we just need to make sure we're reading from the c=
orrect byte=2E

Thanks,
Derek

