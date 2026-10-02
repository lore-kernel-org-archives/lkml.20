Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673333F5B6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954317; cv=none; b=Hu5D//GOLv3w9qCMrVSQOZ5+qjaIEgwncDiq4wwvL269U54KPDJKub5e/NiNP1DvmLCVgFgfkT1wv9rrtmuiLYDIp25mrNgSQLMQ5GpWJBK8vkNcw7Vg7d7Rxn9g8d6MJEdVB0jeOR/UUVB2CiZe0pq+Cn7TfWZI4sLvpto4NsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954317; c=relaxed/simple;
	bh=rfxft130ubu+lypHXPl3SulzpXMvGF8Gkn0UirwH194=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hWTrhzEmIAj8wL50u+ZIzeQb5hRzl1k999EGXa+qY+4ZS/zKh89zc9CEWkFV2gUZ9CbdT+BCAg74a9Yf+TQkt+UhTQRLUwUWFvjhclAn9XZkUFXiieJf++cTI1ZoLZb+Xstne7vutmvOU9fTbMOViinROqOPLcEi80DNY5YMzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MuX16dCA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GcKKXHX+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MuX16dCA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GcKKXHX+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790954314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5HHSLHQ6EbhKxP++Q4gbaISPGsA/MwNTf6uTPkzsaE=;
	b=MuX16dCAv6mQBVpqX5JtD+BOcvYgYQk17LHJgypPqb4eLG6peU/UyrROnT8tGIJNfMOFqG
	lxfFdj4JUq/etK+zGoMWILHbvFXMN7yiEmJ078GpVvFiVJNGR6xa9j9aSyBijFMfD8Qr0Z
	V7eFbj55wAuos1RjnfqwjlUaiEbBlSQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-MaCs9OfyN1Oq4BwMQbVBCw-1; Fri, 02 Oct 2026 11:18:33 -0400
X-MC-Unique: MaCs9OfyN1Oq4BwMQbVBCw-1
X-Mimecast-MFC-AGG-ID: MaCs9OfyN1Oq4BwMQbVBCw_1790954313
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so331250885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790954313; x=1791559113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5HHSLHQ6EbhKxP++Q4gbaISPGsA/MwNTf6uTPkzsaE=;
        b=GcKKXHX+1RbRrV4n9R4mGnwdCZpqkIRDNxuaj07M2VjyXI4cnRl3MKqk+beB1Vp8jD
         BxTzIoRM0oqkHs9GmPmyqtNvkxQJ4nGbe0YlDHMLZ8VdoXON/IPJT3p2IA+Q+n/FKMwX
         rZ2nnuxnQzUdtxUt+/8DOeGtSmBlYuG5fwtKVBjhdB6h1a4q8q6+SHEtDoOh5NpVu7aB
         kIv0NW8xpmXidAzBVUT6UVhdtNvbj6H1FzfJsdVhVDnSHrWar93XDvzUEF+g9MzChgYT
         NdS8in5+gIXKlxLL0f0lhzp13MWnZLzSUpxARQLmW2aizO5qE/q7N9172r6wGl2sIgnQ
         JfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954313; x=1791559113;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5HHSLHQ6EbhKxP++Q4gbaISPGsA/MwNTf6uTPkzsaE=;
        b=MJfNIyo0jiK7PZFuw8ifbXHpbd6sjZ1GvIXDC6H2C0Sk1Nx60pd/nA74lrUY0jNw/1
         q+caJpdPFNDrFBvAQSMaTlxbuwmyzAWZDsGFCiU5NQlGqtZAkWDOteamm1O82I4IrB4n
         ltqbzyJFxam9Ro4sj3Y7Ya3f3Ch7VTSKrgyi0XwGWmDXNpXNHfvMVUx4AKtK+hJfhtj6
         KrzSJ0ZstKriMbNQQW1jMg/3Rucl73rVBcLhtQwLd8Fq3qWa0yuYYjt4qQq3eQGzR2hl
         /J+Ud9Z7cUDBMOP7bK1txJyt1VYrtY0gXxOWwqpgX3kGVijQRAzTWnduMDPbYE7VZBPf
         KPqA==
X-Forwarded-Encrypted: i=1; AKwUvBwygdtj80dlo2hAyLzsZRCEWfllPV1tuldDOnKf7bnEOw3KcZeJTPG0avEsAWyhl13NyGXfcrxQzvc6eLI=@vger.kernel.org
X-Gm-Message-State: AFuF++nBDnoTvg3jf9iCuTmSGxWKaKRsJy4W/ENM424t6CnXJAT7Qv5L
	1wrd7puOJZ1Y6LFuX3kWanbmBWDQtp8gQo2qOePbOyVfdxvf6n41XZp2NKX5uduhIYvG7zWUKR7
	PSQq+J74qYI+l75+MHRYEdry7HcbFl3GGOzypXh704elWueiobXL4TxmiOoVafrcP7A==
X-Gm-Gg: AYBFou3rKIc57mdggGny49Zdad+OVEBn0Jv99juitCPk6GE3Rl1na7goxauyzCBx+tN
	adJ0YhnqS4GEebihDtBDImRU1NW5Mxb1a15b5q9DDdFB6oYxHCy7wEGvF+yrD8P9ood0VpuNwGH
	A+hK1OV6Ffca09wdTNVdnpDz8nhYg7q6BtyspFc8DzOhjhpT689uLT9GoW039ig4aPUay89UXHm
	dOdb8GOXf5Lw1y9XsIs3g0uWh6/sZSzy9uo/VRtJ9+C+eukSsKNOGSzR+SxgfgTOaTbubghngPQ
	GuV/a6GsRsNfQwTMgVoVQ+n8tFcCRhbpwSNsgCcBuc9r1x/CDJ3XoAlgiceh45wOs0zv5PzjUpe
	9z0LzY4p7plQgbwL/jY2BPN4GSuGpQGPO/d6ihy+6rv7Hn5fiMa4=
X-Received: by 2002:a05:620a:1a10:b0:93c:65e3:df81 with SMTP id af79cd13be357-93cb5a5be1bmr1167443585a.13.1790954313070;
        Fri, 02 Oct 2026 08:18:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:65e3:df81 with SMTP id af79cd13be357-93cb5a5be1bmr1167438485a.13.1790954312646;
        Fri, 02 Oct 2026 08:18:32 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b682dfsm22236446d6.19.2026.10.02.08.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:18:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261001052343.17966-1-rosenp@gmail.com>
References: <20261001052343.17966-1-rosenp@gmail.com>
Subject: Re: [PATCH] clk: mmp2-audio: add missing PM_CLK dependency
Message-Id: <179095430450.795320.18251776137659753144.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:18:24 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=295; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=8prFuF3c0ZcSADlIJcosM/6C/fhmNlZC3585kHSeKkQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2n3Z1Ej3wYZPrzgPvHjunljL0XOnaf+BtPW9J1v/4C
 rlWmTlfOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhI/B5GhpUiOy/snDNJNjtS
 6KlmH6sVl7/DZd+znxrD9x1cbfbg72ZGhpbbvFyLrU4Fi2xlymJw03IuCazbtHlvIFOi2R6GD2w
 7mQE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 30 Sep 2026 22:23:43 -0700, Rosen Penev wrote:
> clk: mmp2-audio: add missing PM_CLK dependency

Applied, thanks!

[1/1] clk: mmp2-audio: add missing PM_CLK dependency
      commit: c5898623e0df6ae0e97c957183ebacc13a6626e1

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

