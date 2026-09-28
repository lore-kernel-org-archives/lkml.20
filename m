Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142514B95C3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601372; cv=none; b=it60VuIJng6ZTU2vemS/6S7OweGSe8RMW6X4RvbQTrnZBhYYa6xSzRJmUCgu2A79+0jr6eidts653Lj0PNWHb2brSB24vIWrLe34lIIXvhuqjGaDbmxBI9kXgRQJIHlg3IXPWpWGQiYhAo9sck6IG+BqtCfLWoS50wa2mog0CKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601372; c=relaxed/simple;
	bh=rUXQj14uvGvE28ZAhepdPSvbWsNuou5+yCYchZgCN30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8YaPi+iCf5cuQq0mNi+ID+AGEmvxkTZEJCFavO2NMWw46J2qJ2kQZr8OWTucdDE+/W4n+BbBeTdWx8PecVKh61+xhm/FQr4wAqWn1cPJMEknX1a6xbqiHfczbltD+Tkx/1UlsrKLZRcPoyf8hKdeMp1GVfnMKi+2JKR4R6avck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=ZD94SPXE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="ZD94SPXE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso32658055e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790601369; x=1791206169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYU9STrakLqmIxSDy4pe5WDDOj9rDVGZfrzaQa8JAd8=;
        b=ZD94SPXE37JZOe23TupVGikjadbUr4H2iMaRdZ1HHkI5i+4iVxsWudDc6Byyl/kXS3
         MyuT/TIGiaqjo9F53Jl/F4cL8KsjVn0iF4bfeS+QbgSNR6/vWw3lujSQ0A3E2OA88Brs
         gerEuC2JJ/fvVTtaf2R1pEnciQG4JMpHOop/16/xrw2VSfTpjD/76QrX9vE/Hbt/TpQx
         ZS+dHGiKi+PzPJsDjS/xHXvA9gsEe9BtcJq+PDwwSRYn8C5fgtAt9C9d8X6ip7keW3z6
         L7zh4UuUQWvg67wtaNo+PvdXAVEA8849GzfQzj1veGkOZERZiHb+alHVN1jWPtuzzZpl
         GDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601369; x=1791206169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYU9STrakLqmIxSDy4pe5WDDOj9rDVGZfrzaQa8JAd8=;
        b=Ihx0U+cr5M5e7jdLWRcU8Z9T0ZqsfGrF0PFW+GJl0Rbymf6VQkaAc5Gikf0qhQxUXs
         do4aEzCKEiwZ5++cEyyfxpiH/LbSD+dH09gCYijY5BIDA3Nm9XV/ceirBiqw7zqRdUds
         3TuTBO/eqXlCi0VdmUuGODYGAIAbjzuzIg4R24oPIgv4Y5MQuWsJrDMjQUkcxaEmhtbe
         ZgfSb0ojngZG5EedAS+mT6c5WboDH+igPO8BJ1s97Nv4htfsajAoOzUM8Y4OHZATdumJ
         NX6j3Vo2cPbpXSNVtiQVaNhXRKWIPJxR5AF5FhBWebxG9RecrHDFOvkcfpwO7grOOJr4
         vrLA==
X-Forwarded-Encrypted: i=1; AKwUvBzBPxnux810gobeOPHRzMRmPkHdiGU7xHZO5/bxXwGnitQEygdZfmjD/eoWEQMG8dao9nxdB3ihOMeuDIE=@vger.kernel.org
X-Gm-Message-State: AFuF++lkUyKSiJ1WcEFTb4ccm3PdLuO+Cj4RYgsfbeFU12GNoMdUJpVg
	AmQ5fK5tQfk7OrkUWEOfQMn59zcViGr7Mf2szZNDaxqtwDb5SVZ0N27cYEnouPwDG44=
X-Gm-Gg: AYBFou1yL/9QqadRJtLPccHGsHmT5M0C6UnpcCJIpzrifhFJUJKukzbtY2ZAb+w0hjI
	Ze0GxSG+l2If65pGD7XoS4YSmxraHBrWShH0jmyVhWojQtDoW6UTT8Ky3Oy97xJifiCuTH3rxqm
	WhCmbpZCW4lUINnFec++/IoCTptNP1dS9vR0q97zKVr3yLZqoip5bFhrsGUgOXq9I0XmTWaeAGn
	w4Jz5y/MHExHvw4Bz/62sOrO7RWBjd0MoYU663YUu9yJjkxbSJVX9IQY9uPZbK04gN3YLOyKv0/
	Bovo03SQWiZWD2VufS5J01SGN7MXJXwm/VKI6/Ecbf7LuDz0i+SwNoN2/vS6t+llKA2t9Bz1X/T
	cwBcRtL7Ecnk3kFTlEx8OZaacu8aXMoGX91SZny2izxk3kbTdxUDY+97850U2WB68YQEyyATyD0
	C6fzwBNbKY2NL4Q/zPF2y2/bMWeifuL0WVeaMGaoTeYOYrktIAmBGgRPlPKt8qweOd8WS22y6mx
	7+1a/xARz5qeq4H+an8lVYDP32fjOJ1PHI=
X-Received: by 2002:a05:600c:4592:b0:49f:ed8c:6cad with SMTP id 5b1f17b1804b1-49fed8c6cccmr211520515e9.19.1790601369092;
        Mon, 28 Sep 2026 06:16:09 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([83.71.242.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017998dbsm205327255e9.14.2026.09.28.06.16.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 06:16:08 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: kbusch@kernel.org
Cc: hare@suse.de,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com,
	sjpark@crusoe.ai,
	saravanand@crusoe.ai
Subject: Re: [PATCH v3] nvme-multipath: add fail_if_no_path sysfs attribute
Date: Mon, 28 Sep 2026 06:16:07 -0700
Message-ID: <20260928131607.50160-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <arVFPIKeT-HoYF2K@kbusch-mbp>
References: <20260923004959.88440-1-kiyer@crusoe.ai> <arRJLL4ki-sVQnHf@kbusch-mbp> <20260923225753.49224-1-kiyer@crusoe.ai> <arR3zlpx3Xm2mRt-@kbusch-mbp> <arVFPIKeT-HoYF2K@kbusch-mbp> <20260924214503.82963-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 09:43 AM, Keith Busch wrote:
> Okay, I see. Pehaps instead of having one controller export all the
> namespaces, why not configure your target to have multiple subsystems
> the client makes independent connections to for each namespace?

To confirm, I plan to post v4 as a two-patch series in a few days if I
do not hear further comments:

Patch 1: Default fixes you described
- Restrict queue_if_no_path so fast_io_fail_tmo is actually respected
  in the requeue path
- Make ANA inaccessible and persistent-loss paths unusable by default,
  no flag required
- Add requeue_list kick in nvme_update_ns_ana_state() when an ANA
  transition leaves the namespace inaccessible

Patch 2: The namespace-scoped attribute
- fail_if_no_path sysfs policy, rebased on patch 1's corrected defaults
- ABI documentation spelling out interactions with QUEUE_IF_NO_PATH
  and delayed_removal_secs

Let me know if you'd prefer a different structure or have further
direction.

Thanks,
Krishna
