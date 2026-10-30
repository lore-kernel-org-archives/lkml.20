Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354991;
	b=XBkYr5H7cfZDg5S3wDFAiFRgkkCfD0KT2Y/RQ4fUhECpq0epoOzJN4047aqfQcrIukg5
	 23XWpkZIEes7QPJcEOzVKnU/Zi3qADVOqme5vcX0DfrS/BMlL4WlkYYTPaO7zZEQKITOR
	 +3YIaj2uWu62qcGAcoANU1j5+/jqk2cHuoJWOrlmQ2gWMZZ3/yQWpd/YK2Buk0sg8qXc1
	 K4w/uMmcag3EPRX3AEQ3aYE+QINfFsHiaTdwS2dXEW7R1asT+t9I4mnhiW/ebP5blS+4i
	 vY6QNa0C+xcDEc/3im/ZViVYKYJXqYZDmVThHzrRRQBSF8BBl3LC8BEdXOfKCdRHOYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xXTWaj9Cn/BZq9+DwWznsrJcXlgriA1od7y0HK5Q66A=;
	b=ucO2XNaGKHuHQ+YiAGlvySOwwikbpxc5kaMkmHxRmbtNgLNefSJKlKW5OvJ+mpwRuaff
	 o52CfvDmXVeYWElI89aNlhZVzY6B91b5cchzA30AG8YnOvPTvJC8PZnGmGYThYHHa5dVU
	 CHemus3siOAW3DV1OgCY1rCyC+uQHD1ft6/kf5BH23gEXdEW1jdU4vVc9TykhxpiCrGHB
	 /F/JvYrGMdOa1wJMm48+eO5Ced1tD6lEBbBGCyUBDBTH4fjEle1CDD/D4oyJM99icCchS
	 c3y2OSxZrD2A3hKOXwqLvw9hEqbCyRivZYfYOTYeKR1bRJQmEmm9IVWMuQjHouNY2tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhgNvgdd;
	arc=none smtp.remote-ip=74.125.228.8
Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02495606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02495606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhgNvgdd
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd5cd8e8104so76959a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793354990; x=1793959790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXTWaj9Cn/BZq9+DwWznsrJcXlgriA1od7y0HK5Q66A=;
        b=MhgNvgddE+xdnaiuByEq4IkH2Y1kfe3R7OG7jmySIshoRf87kG7YuW0ma4+SEOlSq8
         x+gPYgCH4v373XKWNXmRHLnCypgcNlauFuVA4eP5wWuamC3qlmscQ8V0LeUwiFZ7UmkS
         EthHSPx+czuqAWehuuDLRsps1gQKvGZ3CYMw/STPTfzSY1pdLeSSDSBPtggdVVJi18KI
         Fz4una3RWA1vR0+yuorLNA3NQbBMsgryhWkYaiX8Ztg1wah0b0956GeCGv8JgH8kbUSz
         1Lzf+xvQAnbs4/IIiZKTsYZSXfc5KLPR2yQ7arkqJGpd8iapADKQ1dJds1sETBP29DtL
         qQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793354990; x=1793959790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXTWaj9Cn/BZq9+DwWznsrJcXlgriA1od7y0HK5Q66A=;
        b=niDWsq6JnjnNqPcqJr4WB+vQugdumbd8+s3kkGq04xO66KtmnUUnFwSng067eBE78v
         lWFDSIcT9Th/fHs/2t0LLVfgAAv/o8VEhkqwZdxoNVx/UKY0845WEs0GfbKjvkt80g2D
         8StoGZ0aCjC09BQpHb5Pdw16JYetuRHoiNJdLQzapCsgJN86WRRbAQNuU9QlnQ/5bP7d
         ZCrDTWqIlQtDLdf4LuEsvI47PrZMQSpCtJbXX8C7Autebq56uuybirwEIaPmwZh+UgSL
         QSHkeOJtZ1Ae7CrW/E5LwJ2V6MUZzCU4eJB5B5+rS02OfZEvsyU/ZrgjXSKdQAxiPjrC
         bCCQ==
X-Forwarded-Encrypted: i=1; AKwUvByt5fFvnhcd6j+HhlTJI8u+vCmC7Y3JKuOGZCFh40Y+r20eGa0OwXSnYlKJt5QvZI6wgxN5suZD7ijtB3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy78QbV4wI4wasj2aa5yE/PGXNE32aZRpxOimAPwo7RbeGTq0b
	XSs1LFProrh5kLGS92/25z9TjzhPxJhEB+ai4cnwLxNLseA9MPQYmG0B
X-Gm-Gg: AYBFou3xAoFcSjD1VwqnMVhRsGCCYhmF//TumFYD141WRDuxFJEY/dSsiu58clatQLK
	CSw4kqBeJyQkXjmWojTyRKsPyqmJLz5Gr2iBdNEemSSAHoIukmUWGH9uChFMTB5UjySNyrRGH4c
	9xh6v4A4mQnhYfCMvpcq1vHXSwrNWANSKaUAYMFt9mTS5gyvEw7t72Ibwuv2rOBuU1st5gFeqFi
	mayVJm+IgJnBwwSwbCpkiCuquOZSufhrNOD+8ZIiT2FQ2s/xC2pnkzLerU45DvXsaYf8ctp3Aqu
	/IdKzy4lbxnELALO4IDagPaLnIEhaapWYnbCUWXx0Do0Jih2SXtK1zMqtDcbrS1/O7rVXViCg09
	Q9+4ZLu3bHY85FDTi2kn/RCdbdxbAtrd9j5bbZ2T/9bcWPSwlAuZyFRnGU3DfnA/GGYGimYEu1A
	3BnhpX/Uy9YT+UBv9vLxXw3G8rIXTjUB9m9Hy6Ts7v8TC3GkmfBMe9Gn0ISr1PsD5WcdDFaCKrN
	1+suPUIXuOOEoG+YErYue1wEZVQ4b4CbCJch39/8fkR1oeOm1ah2LSAuzOJaszNXpYk//MDPlsA
	UEjJO1DTtr4jF06qzU7h1exVwCRq6PLrXA60GRJN5BuFFkqDPxIRV/IZaMnuCa1c5RgzVghwG7O
	1dw==
X-Received: by 2002:a05:6a00:2d90:b0:8a0:1e49:71bb with SMTP id d2e1a72fcca58-8a9c02bb2d1mr1624105b3a.57.1793354990314;
        Fri, 30 Oct 2026 03:09:50 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9efe3056dsm555365b3a.43.2026.10.30.03.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:09:49 -0700 (PDT)
From: Qing Wang <wangqing7171@gmail.com>
To: kprateek.nayak@amd.com
Cc: bsegall@google.com,
	davichazbh@gmail.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	tim.c.chen@linux.intel.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	wangqing7171@gmail.com,
	yu.c.chen@intel.com
Subject: Re: [PATCH v4] sched/fair: Replace random newidle_balance with Bresenham accumulator
Date: Fri, 30 Oct 2026 18:09:41 +0800
Message-Id: <20261030100941.2500509-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a0dc959a-a05f-4725-86c9-1b7299d9b2a3@amd.com>
References: <a0dc959a-a05f-4725-86c9-1b7299d9b2a3@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 at 17:46, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> On 10/30/2026 2:49 PM, Qing Wang wrote:
> > diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> > index 919d0fb00bd9..79c477b47510 100644
> > --- a/kernel/sched/topology.c
> > +++ b/kernel/sched/topology.c
> > @@ -2002,6 +2002,7 @@ sd_init(struct sched_domain_topology_level *tl,
> >  		.newidle_call		= 512,
> >  		.newidle_success	= 256,
> >  		.newidle_ratio		= 512,
> > +		.newidle_window_pos	= 0,
>
> nit.
>
> I think this value should start in a way that allows newidle balance to run at
> first attempt and then stabilize. Maybe '512; is a good number if not higher?

Thanks for the review.

The initial value of newidle_window_pos can be any value in [0, 1023];
it only affects when the first balance is allowed, not the spacing of
subsequent balances. I'm not sure which value is better here.

--
Best regards,
Qing
