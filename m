Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232772;
	b=cqGtd3/g6Yjhp63Vsg302cGO+JwcqIZ8qFAQdCYuNl8Mt+3Hhc2di3Ibtfz8BF3IFSZL
	 Ot3NRlyIUNIxkiRasChfRhk4mmK9yp/WOikHWDt0/wlQAThDt1mNOX1JQK4fqDckrwTuI
	 w4G3Bz9Jzy4tkBXzrv6UMR9r1jkeZ8ok4Ce0ng9C5x2o3hAz9NOFbkAvKoVdCRH8wjKxT
	 9ZhKskrxaIahXO+T9x3J/O6OCZ9KsatsLMuitJgdUMPIvDxRseLRhUTNhz4kEfwpVLRPc
	 hahND4lAFMjY/rFoBH271DDBDfKJkUPYsMegmdiDgjNkMzbCvLivPKg7LBOufQoSBCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=r6GoYIP2m3H9i5MGmuIxJ4bywRFpxBjH1clZwGUY6ik=;
	b=btFfqvx/bNuFFp7fU6BPkdDvv9REQSRjY9h+0UoeAyocnB/wxq0q0twvU+H8MjGHWNYD
	 5HPKrydmq0ElwksAbtFXulBNPt06Y2jxSX4SWPFGkCTjQhh2jqRwgNxKSlyLansxbACFT
	 CaTtUpLflqMqKtVjLebPVJiALywq0C/5pnmsiL6vFFkjBqFgEEh/yTFt1m9rR0nh3fj5b
	 KrTUlnXyAJhv0rIMmv/vBeTHCA/VCALb5t4YWpGHHZRO4fmdhsh65dS21efuKR944WVm5
	 ra+o2UYqgjFh58DPbpk+ZUzBcQ69VFSCChH1wssWrJSHwN7a3a9PCKHRyFqWIb5i4XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ccSCZsXu;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74843606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74843606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ccSCZsXu
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso342438a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794232772; x=1794837572; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r6GoYIP2m3H9i5MGmuIxJ4bywRFpxBjH1clZwGUY6ik=;
        b=ccSCZsXuLUh/rEwzq6j9VgdvjUUDYYr4mzyt3nL+0CSgkcVCGRBs1tgfiVQV45Zldu
         YfxkNDzeKohogXGMELjvckSQ6yzNQOkqHLUvUyupI2O8q4FW4/ZtZBqJeczkXfaDN4np
         cIiXlSD/RFK2VMDNKQ6TwUoy4U7Uvd0TJAvAjvbvpboCW/dOEP3P2dwtMQ7MvHPH3q7s
         faYEniXxjg1jy+IgSgGWMIPNQNgufoXiMs78jaRb4+1j33QI0aTTAYEU+FL5c39oh0yG
         gzjAb6zP/IaMQlelTX5eprakhCtD5hEds8h0mRz5oEq7VwgPR50ibEPJlxNDQ4amMnBM
         15Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232772; x=1794837572;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6GoYIP2m3H9i5MGmuIxJ4bywRFpxBjH1clZwGUY6ik=;
        b=k7qrHvGzq7rWr/jIRuThZC1NCDkGsaPkIt9PoXglkUpH7dhHq0lEL56lczUq3TBLck
         dBeWqRNOmw6Wjs0vmpYCLeOnq8O2K8GGzaAKnh7qKlh3+tB6qkTzAIHS2M2iv+OQcrHC
         qy0ree2OvZKL36NMYqJ/Fbge3ZQBcyl/Wf762TpHBhUiFuKvmdvoMCBEL2Q+EjNwdtwR
         q9Zl0GHY06Gko2PaSqXhuEgx13dwFulzU++5AotK4/IcHmdXgpnLe8jJo8j0hqMXSTKX
         JlargVEz8z1GMHmcbrmCI9NhDmDZDrC+mmW1LW5qkofN4V0Tz7lSQPAGftIT8xNJ2D+U
         CaRA==
X-Forwarded-Encrypted: i=1; AL+hErGOHEG4b4J8LTZRZecE+J18UEa4Y7e2o6x35T1rVr2WHY9chfErqxA0KgMq5smHODuIGfydlbBQ7RVqueg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lqFTOqYisjHpNyxhR7QEgP3n3LzzYup4GfQ191dIbjpduj+Ic
	O/QmxW6FpEZ9BsCuCxcC+Vp+3Dch5iQuUY2R4OWC1gD37laYy/sr0t7a
X-Gm-Gg: AYBFou0QwaZHel1XNBwDUmdn/W9+U+YNRgrQY2GRcAZKTah/yVCa97RAx28HyU2qSFC
	L4nPbgW3x3mvoxXSwCCmAwYVOhKLpQOqdNuIix4xH/Fcl0+4Th1YiqGITCZq80l5iUoHtNi1M7V
	wO6IPPE8ystoTe4hVPYYfqdlAfpoKr2+cVT/ykseNnDUFIyoB3TygI1lwsD51AOJc0JYM03iMed
	GcIeLDXA6lSlzwTkKZ3bkchIz/ZnA1UpJFFCVtMeT4Gw5+Js7P2+IcWe018FXINIdMSczW/aWSf
	SWqHSwa8DRP3yh1YCLvc5gyhggu4UakegvTyqwimVqHsCTZY2eaTp3Aiqpvg5XvQrYy+/S1fH5z
	5X40y1aZoEdOampOY9qJ461772jh82TSJrDQInc9K0KhoFDBjNY94bywQHZoND9K+xrdtUVpT6F
	Wvvp1n6+JMoWKYhgSSVW6lX02H7D2TJcmxPQ1qNoHXQe2EXElYFNMR9uAM+oi4vLL7EgxvhrD/z
	jbBQjhro62lq1v9F3pWbxMoEbHGa8tq5lkyoYhJ4zrPCkRtU/7i5MeJ/PM0dvYLq+3zhagqOFkE
	LsKTbfH0cWii7mbHahHtPLY0KKtjoo0UblS6
X-Received: by 2002:a17:90b:4c:b0:3ad:eb15:aed9 with SMTP id 98e67ed59e1d1-3b12d0fb5acmr3535351a91.9.1794232771875;
        Mon, 09 Nov 2026 05:59:31 -0800 (PST)
Received: from smtpclient.apple ([202.8.105.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127fad1d3sm7136533a91.11.2026.11.09.05.59.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:59:31 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.300.31\))
Subject: Re: [PATCH v4] sched/cache: Remove the old cache group footprint on
 exec
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <5c912bd3-8701-4395-a118-4ee6e09233e2@intel.com>
Date: Mon, 9 Nov 2026 21:59:01 +0800
Cc: Jemmy Wong <jemmywong512@gmail.com>,
 tim.c.chen@linux.intel.com,
 chen.yu@linux.dev,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org,
 mingo@redhat.com,
 peterz@infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8E8E3B91-8A0A-4713-8978-EA947438927D@gmail.com>
References: <20261022031933.46869-1-jemmywong512@gmail.com>
 <35237F63-C205-4AE5-87C2-BE85604055C6@gmail.com>
 <5c912bd3-8701-4395-a118-4ee6e09233e2@intel.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>
X-Mailer: Apple Mail (2.3901.300.31)


Hi Chenyu,

Yes, please feel free to include my patch in your v2 prctl series with
the necessary modifications.

Thanks for integrating it!

Best,
Jemmy


> On Nov 9, 2026, at 9:50=E2=80=AFPM, Chen, Yu C <yu.c.chen@intel.com> =
wrote:
>=20
> Hi Jemmy,
>=20
> On 11/9/2026 9:36 PM, Jemmy Wong wrote:
>> Hi Ingo, Peter,
>> A gentle ping on this sched/cache fix.
>> v4 carries Chen Yu=E2=80=99s Reviewed-by and Tested-by and only =
updates the
>> comment and commit description relative to v3.
>> Are there any remaining concerns or additional tests needed before =
this
>> can be picked up?
>=20
> Tim and I are working on v2 prctl support for cache-aware scheduling,
> and we picked your patch with minor modifications into our internal =
branch
> because, with prctl introduced, the code needs to deal with several =
race conditions
> including the footprint one in your patch. Do you mind if we send that =
patch set with yours
> embedded(with your authorship)?
>=20
> thanks,
> Chenyu

