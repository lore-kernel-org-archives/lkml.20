Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2240A51AFD6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683322; cv=none; b=h3RvreDpLQQCotEu6zkkiFfyvfiIcaUkDbmXFV8l4ACdqsrZNf6CF3yGxMwk8FfmJXOlkc9ASREXVtNd+oMm2IkkyDr16cofE56RDoAf9qegxHq5G8NAQUWg4qHFEmMb4CFF9BOsiYYiPv584QuTgNAD7hkEmgKQbCJz+wyfJsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683322; c=relaxed/simple;
	bh=s/9mIv0ITmLyiV+de3wxWxqlQ70bDYMET12ZAhr5hHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+Pfss1NF2AlJai+7mzVWEDdjPD8ZeUQ1rUH5upY0uhVq0GLGju4IF+d+ibmLpzbplJYnEnI8WvXyGl4gKjtQfuP0tPDwNNV4sNDvqX/Qbs+2Tb2sWcgtR1jVPouSwboj9wpRW7i0+StnAii4PAZ+xueXtJyAF38YPQl+4xxVgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0kRhE2H; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0kRhE2H"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-91788e38a27so5762866d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790683320; x=1791288120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/9mIv0ITmLyiV+de3wxWxqlQ70bDYMET12ZAhr5hHQ=;
        b=E0kRhE2HYf4cefoX2coDNb9pNEz4X+1qny6a3a3a4QL2v45OWKQM64gDMhhBvA4OFS
         lnzYHPXDT9axMYa5rDS76uTYu2LfT1nwbLjp2lJsQbpsj6vug6b2HKFlEBofgfWn4R4N
         UzcrtPuXY8Rcdu3HAQhUlNGcaBlwGKixfAo+s2sQPyhywsk7ZCntgS0vhAbooMe0gKVb
         uytMg5rC7xTnnOtNn8fGbi+RgzECfj/JsQT001TuOkZQ0Xrw4456yXMZ4f4Q4GqucwVd
         +/TuJQCWm3nzSJV0HJ+iaetLt8DIivuXz+PAsCr6SNpWvaiLQdhKnqRThNy/0k2K2zSS
         Rrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683320; x=1791288120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/9mIv0ITmLyiV+de3wxWxqlQ70bDYMET12ZAhr5hHQ=;
        b=r1Ors9nMXwiaNtUghjt2P1PRsGRLu6EXGhNRoM5kfoSbvNHlZjdV+67xVzlURRnqiC
         Z/ne85o57FqeJ2ROHXkjE/tnHOydR0Di9IToTku8mc3PA5Qokkbin7Si48OlRv6S1a6g
         xJ8+flvXHAqToJrr22VzGRmIVYFH998jhkIA7sqhNUgQEvm++9pPWwoYflfVSR7SlwQo
         AAbpw3q0Hw/K0cWrhxzkgXkMhQuIdAsVibf+pEZU0CW7teVDmRzvpxq23BlNPQv+ZQJT
         nJzcAGWGWGnxk1PExq3vuYaNzOZBYgYy2tlD+Kt4OqlgRML/K0JVXIiuviPwoIYdea4g
         GvdA==
X-Forwarded-Encrypted: i=1; AKwUvByW9kZqgSVqTyqCrK3o4OIrFnoqVQO7DhCmkgERvsY6E64ZP9nrFcLjWVnn+t1WvwwuS6fveDlSbjpDBRU=@vger.kernel.org
X-Gm-Message-State: AFuF++nCC6lMAjhhZ32qgaSppYKSPt8IiEXFHqYfw5V9YJ7r5klX8h8L
	oQ1ECMsYSMh/TIJaQFVru8L8sffKRLpEBLHPtHJPJVpe6hXatLaWAQ8L
X-Gm-Gg: AYBFou3ESkb6uqojll0hTjaFEzrIJfsK7UpfF5nZRC1vgmEP4bUd5UlNRg1sMh69YdB
	KwwwSCvWNC/jpDftpEPbB40dYgJmtXr39LRznO/GvkkHk9NUks8YCcsTEzRpmT5S2C0LzyxzTo5
	9xIQvqLPmBUUOrhgrp3WQkkmI4HvZwjQi8sQ383flJsLphiC09B0Ht5+xF8MR4MWaOZPf4LnQxC
	nwi0TrGLH6cxNb1z4R5PEVAFSOLJLwwSyB3hMydsoK98FX7S0m4I9e1wHxysbm1+7jMX8a8c9ng
	EBusqGng2hcXxqmm6jDDMPtLKmWd39AG/HnbcUZnnGOaaz9JUidFSVr2frBDzFzQCbydGcBfpA3
	we2/uqw4uN9uo0wTtqewkHV0YzVVJBdSj4BJpbWczGwALfKN1HCZa6uy/Uxq9aBjFiiE1FN5ejW
	UjXVRvqwcfw4SHsueWZumZBTed9wwAc7E6uRscDuoU8lGneIiuCOysRYRbBXX7LYScheD1KQ==
X-Received: by 2002:a05:620a:4111:b0:939:13a7:70f0 with SMTP id af79cd13be357-93c43b7f202mr2660453085a.5.1790683319438;
        Tue, 29 Sep 2026 05:01:59 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c81425bf8sm374586985a.28.2026.09.29.05.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:01:59 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: chenhan0017.work@gmail.com
Cc: a.hindborg@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail consistently
Date: Tue, 29 Sep 2026 08:01:55 -0400
Message-ID: <20260929120155.2283113-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
References: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for working on this.

Could you please also add:

Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>

to the commit message?
