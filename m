Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2CD50276A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700692; cv=none; b=NGQoeKYI2sKziE/s42w61+zQwXHFoPnoQAyFFkfAl00mawQFdEvLjkSw07IbHo39Qc18gOFSJo8AO5EU2CsdGATlIUfeghL9moyxenbgz92k+5d7WIVR2Hd9NRPbVHthIGr8U2yGDsgbm1Wde6wZgjKF9nDmOP90WaMF30HQskw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700692; c=relaxed/simple;
	bh=KPyIrPmq8jYkS6wHePhAy1DCi/M7oDqBqGbUGVFhiNk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gqPn7koYM5RqjaTEKYK5uQUsoIJ2R0ONUeMnhFXRpQKo99arDI4Sp+ODMivJQTiIM1iEQFKsnf5JV6TLeQHAnq/08yb6bPFVCN95pvrz3GlbMf18nnIlCdvYRG8s1lOZNETPmZHURjqlklVTnTAAE7SOLLWPIig6seR9lP6Rn/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IYZmloYV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UIb+B76t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IYZmloYV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UIb+B76t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJlUaG74o7jEfz91Y8H5nhfc14UxArn/vIBZ8Onqono=;
	b=IYZmloYVL4nIbxk1xGYuu9nMYTKJPdKc8+n2voA9snH71w7vs77ncgGuJKH8/P4FvHJbhX
	PvKcujSI+126ZbLjYu93hemRRSc3Y2qf3wkFqq2sgtnNMsCd1WssSXxMqjgcTzJuXsud4V
	Uc6rr1YuR9M4I0DYfa1FKZKUWro1B7s=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-NOP-d5XQMMa2h-eYi9guFA-1; Tue, 29 Sep 2026 12:51:28 -0400
X-MC-Unique: NOP-d5XQMMa2h-eYi9guFA-1
X-Mimecast-MFC-AGG-ID: NOP-d5XQMMa2h-eYi9guFA_1790700688
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso999147085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790700688; x=1791305488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jJlUaG74o7jEfz91Y8H5nhfc14UxArn/vIBZ8Onqono=;
        b=UIb+B76tlN2x0yoV6fd3fwAUMUkP8AduxVRldpiwSjlybbDaH4sa0+QQNMslohjGEB
         ayxMCtX4Hh5ojcVEqdiQalXB6AByIbZQu6ow887UrF7YT4nTHoLhmavHmuRtmsVcLl/o
         HT0qb2DSyaiBEEVhon+NUGuFiEEPo1Z2PDO4IGtEYRbuvrdmk8b9svg18ezokoG8LmOD
         cGDW8Mx5EMi5IHfC/6ZsirVd3CmKOooIahGmACRhs42js2LFeORsmPFOeBk4txue4fwO
         ij4RsHqNttSODV3CKrDTyr8ig4wVCdPVFilzcsnEjX2LgkMFUnZk/LgQObnUDKMbSEdG
         /Icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700688; x=1791305488;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJlUaG74o7jEfz91Y8H5nhfc14UxArn/vIBZ8Onqono=;
        b=r/ujN/OF1e6Tl54WyBYWFj8/ZcL2iHfuPSpBRMVQmPJ2/gzLGDGFHVm89P37pue/Fk
         m5Ruf3b2Vk2Ivf3Tlp7An5nLnpCYKj6oQuVSc9tRToIIiHbAcUj/N+4DMF1VsdoU2cy2
         0VLm2L0cT6ruOBMp/+o/7/h/cwCztT6FCKx/sO2igc4tr1oyFe/3AuIMgkpYfyxH3+cU
         wqlSkH4s0xiSjl40zOGhpVQCCK392ZbwdD1Myj3B2ZytU8TU+hyN/ae/6LAvNYnOJLk+
         Bx7GnLqENc9xY9JNuOn8NC4cbziFEES1WiGfK3xS6iYaKt+lbtFaMqLaB6p1FSqXVSxQ
         8OTg==
X-Forwarded-Encrypted: i=1; AKwUvBxz199W+jKz9EWvlw+3Ve7otxmPJkCm23uL3EcHR0s5ZXlPqf9KySJDtlsPcHEySrzh9rIxTMwcbAQFJa4=@vger.kernel.org
X-Gm-Message-State: AFuF++mGYtSA0d/HxwXOjk0zCVMg6AFqk5foKF0fAFZvRa0Rzkl70zvq
	zPpZ+S0vokdPztnsd5JDKIonVnVZzhE/DBDBWC5vOlWqrszxGcVJ50SlNJNx+0SbH3V1LyrWChO
	ikHadhCtfJXe4FqIUoXPz+N39dOWQxHAIMivIEx5Dvj/d7Q7dIQWrhNjnHGTs6ZiQMA==
X-Gm-Gg: AYBFou2R3L8HwBnS5kt6WQR6acjBxkpC88c71TrJcPKPR/J1b/YrmfJWq/9qSQgyRYU
	BVksLTd3PzfDL6l6dYh+QD0/lfPsFMvoBfGtO4TaH/URuKFDtga8aQHPg2Ww4MxiIfJSHJbOQ2F
	I7CEuxXSFOI8zwF5yQz1p1tz+PDq0G05vNPcICWbJeL+/XWJqsWp/LnAMoetlG0Puyr55fka0bZ
	t2W0zyJeV+d/VGRx+kzlyhtEoCXgvvdwAJqWKKV3lSh18eg9SHau5CVm3W7ejuFew+Z+Usfi4AL
	gHIVSUP2ct1i+3WOg6tSdARVge1L/xSLX/1oIs/fuxausfYMFIuAnev0Hkt/F2PSyEYbn4M4Z6z
	lRlBEeiCOq1rtTTURuKOnCt+A5c3+0PIkgO/1Wfkc9tWW/tBvOaE=
X-Received: by 2002:a05:620a:d8b:b0:93a:c102:1123 with SMTP id af79cd13be357-93c9fab92f9mr15583285a.15.1790700688326;
        Tue, 29 Sep 2026 09:51:28 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:93a:c102:1123 with SMTP id af79cd13be357-93c9fab92f9mr15577685a.15.1790700687812;
        Tue, 29 Sep 2026 09:51:27 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f465795sm12077985a.7.2026.09.29.09.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:51:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com
In-Reply-To: <20260906-ti-dra7-atl-v3-0-5962d8f608ed@gmail.com>
References: <20260906-ti-dra7-atl-v3-0-5962d8f608ed@gmail.com>
Subject: Re: [PATCH v3 0/2] dt-bindings: clock: ti,dra7-atl: convert to
 dt-schema
Message-Id: <179070067699.199845.16336809521598081292.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:51:16 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=729; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=3HHqD6xsSTvsmagNkkuwzWR2bd4nu/pmM6WiPAl6ZfI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v+md7zf9V2niO2f/Sc8LBa7ujHn8epZGzN8KoR9+v
 kUmypmtHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzk1VxGhjU7ezszjwSVSTA+
 bZDi0nkSw9nUln6XZ7KVgb9wjE3CWUaGhb0Sr4qOHvv+o7yaTVRwh3v216nLlre9n/0vmENbzns
 TNwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 03:02:38 +0530, Bhargav Joshi wrote:
> dt-bindings: clock: ti,dra7-atl: convert to dt-schema
> 
> Convert the DRA7 ATL (Audio Tracking Logic) text binding to dt-schema.
> The original dra7-atl.txt contains two bindings mixed in one file:
> - ti,dra7-atl-clock: clock output nodes for the common clock framework
> - ti,dra7-atl: IP controller with register configuration
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: ti,dra7-atl-clock: convert to DT schema
      commit: 26881ca4ad352d4003c6d6acc1343ecd1823953f
[2/2] dt-bindings: clock: ti,dra7-atl: convert to dt-schema
      commit: f31b15c9bbb03b1560fbd137439cd9fba037bace

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

