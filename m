Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259225;
	b=uyP2eXiiWNiJXhhKVGa2z3vxJQ1EBbx5SW9fyojkq4DTvQJmDYPY4iUfmHZwMMR+/wRa
	 eRXYW28P8vbF+BX6Lo5i1CFHq2ANr81XHx5DjENVDQIQRbG4EmLuM1kqbzDVzi0gzgaWX
	 wGek+NxqxU3LdK5PYd9ri0jq7QRh4HeJXymt9n/PZ9w7QfJHfRnJjbNBGz/VQyGkltN28
	 CcnpCciRGwehvf16JOnM+Q92x2R+ct9t429KYLPtxSlX/qzrz/Op95n0C280PIwP//Y04
	 9OqbJafdc7ICvjrs2Z0yzl4w+0VdCBrAHUboiMrvC4c0Fz5cwE+VUP+BQ6PQ3HSnNkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259225;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=jhTFBrZbm1nKNNYaIDvPlXMHWrRMWNpq39pjf8IlDhs=;
	b=D/bPvalgpcF61AhpsUb68DRKucgn9eTICdIwFtvOfVZgYkunPUYQbrl600bpLD/CDtuJ
	 IwrjcIDuLABv0JSA+Y4n3s+8bMPLJaKaLZruvo4fgRWBViYoF/bO3MaMWayV6lvN8rDbb
	 ncFodpJICWejV5d8K8t/3X/4IqMAvKwtgTveZm5+C6qnTAPAarRDqriWlqAD2dz9025Ci
	 ewrdNg9FxGnyMQxGeyh2IcB0LB0DD+yL/wJmkWTHopLCfUyzjfjV1hhG2yFV0+yreIxMF
	 7KQy1RNTC9q2YYiI6KCNhsxSmM73CHzuke7WfKQh7H3k6+Vn9kcgadjx6ywC+ez4BKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PG9JunJo;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nvL4ojAW;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF0606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4EF0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PG9JunJo;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nvL4ojAW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794259217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jhTFBrZbm1nKNNYaIDvPlXMHWrRMWNpq39pjf8IlDhs=;
	b=PG9JunJo9bwRDRF6D+kVy3LAsXDGAG9l23SSqjGHPOO/ziDVhVDe6/7mckFnNfth9/xEEe
	Ya/Mrw+Ft9Y8f4nnTTV+SvqOZufsC3jw9X45NMYzUreLw6ml00NdVsiGlSuk1O3qWmpZHH
	Asah0l16Q1GyTuenipBr6BLtw/GhcB8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-R43b18HvPL28_iZ2WgG-OQ-1; Mon, 09 Nov 2026 16:20:15 -0500
X-MC-Unique: R43b18HvPL28_iZ2WgG-OQ-1
X-Mimecast-MFC-AGG-ID: R43b18HvPL28_iZ2WgG-OQ_1794259215
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b2fd108b28so20181887b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794259215; x=1794864015; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jhTFBrZbm1nKNNYaIDvPlXMHWrRMWNpq39pjf8IlDhs=;
        b=nvL4ojAWxrXG89Ui2evwQkpj4Vt0M0P4HWpUBwQov0ihCLpMM6dNoDqHWIasA0fyp4
         HOYZlTmGJXjZ6lEfq9VfTIFeUlBQcxqSRzn2XncQntUdL7A3MBjSt00y1xU4M5lnx8Cl
         YHGJF8HROCW9zVJvoZcZBdE7iR86exw61q36NzkHB4JtVmUjMXsp7p112M9PFZFytjON
         oB/CKDRkSBq3Pmhss5ZmbEjxSBeGkqMb7ozaWd4m4acgROrf4H14VZ1nw1YUWr+nGRHq
         V0bYcRyHqKe0dbU/MgM9aS1P/Zl0FfvlxEexbn49TtLsXe/N4auLRoTLOtppETb1nwyQ
         mwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794259215; x=1794864015;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhTFBrZbm1nKNNYaIDvPlXMHWrRMWNpq39pjf8IlDhs=;
        b=OjP8heue+VT8Dts6blyAYfr7imJqTcXHOXMjhOfMkaf8bjX4rJxXKAwkvaJ5MKMWQl
         49WfxNm6d7XOdSONkCYaUYsMdgUIuLru6EAMX56ea+7o5e363J5CUdxqdgz8L8WZrCaQ
         YGXv8eOLluI6qfleo7VTBKeCekmx4Cay7jU1kaDYz/q/XFkM5IchmiQY8oLA6P0WGK7j
         cz4OleA8Gk4meM+SVG/Q6yBOlmySf/ZaoHQX8W1o2tzDeWCG27gZdLpHbgRFosuoYo5J
         37wHVjulE4BymmmNio/RNECaPFDSc5oRgkEYcRMDa2XBsNtVzRQ0WpEHUgIDipppXsEp
         QG/A==
X-Forwarded-Encrypted: i=1; AL+hErGzNAgwUl4g61DpakZCeuYYCNYKk6cUfTYlkqwqYwjTh7UIRKV1oy4aLbk0qDciI0cRm+ULDsal9Eu0RpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3tv7esOXkRq5yz0RamI7KwytTzngT0ewCOdbXdYzYrdQ2RY7t
	X/MadEltmrbXaY5bJu3hfeRrgqy7vYZdnIqu6AkVx/cKh+AYpNLrSOfzsg8SlHrJAsboSegNc5c
	taaP/lxZ4p3l2xFn1yNbz2VrRbRGtBXXmaiDn31KDfIBiPykMlgLJXsv+lXgNTSY0vg==
X-Gm-Gg: AYBFou3NVQLPN1t01A7ARX5uUe9Iro8CNIeAWe+8K9hdBTTo7fgiC+BUg8avOPUfXO6
	/XAM73/hwv/5lY16GZ7iRCdOpC+eCoZZ5Sk+RXQb72kJeeG5ly1vmxOLrvAMxoZJ55ZZ32hVOjP
	Bj7YSAvRVHPV348a9GsHLiYd4wHkbjZ+mlx9mZbqZ+OVO3ArSDKxUmy6ywhbvdVfAKZbbgrR60I
	Hh9R6piJBx1YC3r39YaQQrztEP1ATRdFD2feKtaLDVf7bj7prmt0vQv2h8uyVduwPCoYIBKnHEo
	c0Wv5zrOXpBCfTmika9FRivUeetkdYdF4yUH4b1z2dJmcrIQAJxwNkTukG4ooKwUd2JHmnq/QgS
	Id3+gf/M7A0Caq1FCu6uYuLIanX51GjqwVI/l6uuFEvfrfEn4vJ44hrAUNGUembq0EAlw9V/bw9
	t7
X-Received: by 2002:a05:690c:a055:b0:8b0:d468:e9ec with SMTP id 00721157ae682-8b392bd0c0emr2841677b3.105.1794259214835;
        Mon, 09 Nov 2026 13:20:14 -0800 (PST)
X-Received: by 2002:a05:690c:a055:b0:8b0:d468:e9ec with SMTP id 00721157ae682-8b392bd0c0emr2841517b3.105.1794259214432;
        Mon, 09 Nov 2026 13:20:14 -0800 (PST)
Received: from redhat.com ([2600:381:e227:64a:814:7bae:8aaa:cea9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933c59cfsm3832747b3.17.2026.11.09.13.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:20:13 -0800 (PST)
Date: Mon, 9 Nov 2026 16:20:11 -0500
From: Brian Masney <bmasney@redhat.com>
To: Mark Brown <broonie@kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] regulator: convert to subsys_platform_driver()
Message-ID: <avI5C2UFcxKF_LoG@redhat.com>
References: <20261106-regulator-subsys-v1-1-1f91f4204bf5@redhat.com>
 <1b56983f-f88b-453e-bd8f-8189c3f79d1b@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b56983f-f88b-453e-bd8f-8189c3f79d1b@sirena.org.uk>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Mark,

On Mon, Nov 09, 2026 at 07:14:12PM +0000, Mark Brown wrote:
> On Fri, Nov 06, 2026 at 07:28:46PM -0500, Brian Masney wrote:
> > Reduce boilerplate code in these drivers and convert them over to use
> > the macro subsys_platform_driver().
> 
> This doesn't apply against current code, please check and resend.

I see that Peng already posted a conversion for regulator. Based on
what's in next-20261109, it looks like there's 4 more drivers that can
be converted based on what I have in my patch.

    drivers/regulator/qcom_rpm-regulator.c
    drivers/regulator/qcom_smd-regulator.c
    drivers/regulator/twl-regulator.c
    drivers/regulator/twl6030-regulator.c

I'll post a v2 with just these 4 drivers.

Brian

