Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA8449ED7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371692; cv=none; b=rJtt3TK9GQt/Vz5sl7HsvnlYz40ixzU9UKwklb6juFh4OjtmTXGs17PYmts9sxca+/JIRX3fEC2rLxQ1bN0P3+0d83dwioqJHv7OljeiQr7Dw5prhJcFJTliHMv8oe8AZbWUBJpGO3hT2yLK3+VgIQqCRxEQ29NzhB2KyzSSLiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371692; c=relaxed/simple;
	bh=aRNAktut3RhsP3MYWFeTSASKdMb7z7iK/vCtms7DqpM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ar8uNXMWfccgLBtnz2I+Wh+utIgR9H4hKYHH/8wlF1hs3vIKmcpwQzNIJuvqrkp4KII82m+/hKxGGPr6AemudK1j++4m4K4L1hX5LIPVr4FLARkxY7w5dSd0uDb2wgcIIeqFqR9ZFNrdPQPjWHhCbhD3OEqhO9+fJOxxsjsGtoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=W+EDTtgl; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="W+EDTtgl"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-7f4f0d298caso849685a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790371689; x=1790976489; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tzP3eGfEK+PbR1jRk5YUENfrQ+xDVsw5caOf2XKwdAE=;
        b=W+EDTtgl4eBMibqlM+/7KqF6+uPMRAGVnSBtA4qydttU+OCzE7cqsTzV9b8S9yUKQg
         q8UfATwcOd5QbcwYHuVoaUCGUi5pl2xEp4lck6fznweD7EL9XcCCOa7FzyT8Q3NYXRME
         cNKu5ElHNS3pjXcxMTyXoYQiGaqWY/pFH0H+ldCKAGfOzAUvBWpzQBhqqbg7r8eIhM3/
         DfAqdpR4LED0cq9wSUB4H7E4L9mzgTDTWZpKrYpcYI5hiQ6rD/3y9pOBFpcTQ7aOIl3R
         Pxp+eZCvm1Oz3jg5qc24A1mtqOKLm0CIfqWO2E/8KY2JLr/ijoCFj8Nyn+QH8B5dmvMb
         UDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371689; x=1790976489;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tzP3eGfEK+PbR1jRk5YUENfrQ+xDVsw5caOf2XKwdAE=;
        b=x//veLZjbxGS16/TPHp36JVXxppVy5RIYUnB0TO5XlFLZof90UKfJyLqF+Om7Xbdy4
         CUQdKcSU2xS7boi0LRat1S0yUId5/y7jkEokd2hxPvIgLz/kpFNybTjyLvg0Vur3ksSE
         IrvAMVtCJIANlCjilAy35ygPBWRl99OgRDZmoOcXOBy7/YFOPcgBNhaTBBe/XTvatnHe
         fsbwXdlNCvCd5GiOuK5dijlxnh7ls9l1IFgI7kbPokoL/oKaHTvsvKLvg1gTKtN63te3
         OiVRs2JlfHXRve+CEfvuZdpclVNjSFuu8oj6JeDcFoi1rk1JbhgogLxQb/3hwlMGwOCJ
         bEQA==
X-Forwarded-Encrypted: i=1; AKwUvBxvQPHRI0QeyZpBWLmO2LEB5B3prnRM22rdSbc+bwrUqdGUSwq4HATfgtdZCuuNtZcQ3JGTrqYk1x4upIM=@vger.kernel.org
X-Gm-Message-State: AFuF++kLxMM1SjvkNS51od8KJZGqxljHVW9iwHvHtsahNRL8DGfaLIfP
	i/8vGFul4Nvx5ryAtWcVvHPM0+HRfxrVZMgzG0GDyAGd2Kk7Fp5RLVGqmCvpHnLNeUk=
X-Gm-Gg: AYBFou2oES0xrQ9IaHvXY1FvMRZUBFsw7wlgZ5gj2uQuNWDqn21GzCbB4tweGkBJxHi
	I0ouNM0d3TfL2ZQcqYWoe5zj3nMu7/1KUWFNT/3d1kOH8XZqeM4wPFSreLnxAKvcNJ+BQ0ABXm9
	ZhzuLkfi2+rb8v/NLSXP0ZMrUOQ8zTPeF8GkShGNw7IqT0Hwdi5q+HbuN+cmCRyz2tIoUToMnKn
	j4auFFVWLbKQUHwaLw5BHEAHRuEegC1220I56U5N+eLi5lVFFjBanj3SSPcWhPkJ7ZJev1SZ3Al
	t+KKLpWnyk4TKOQBlQb3gUK9YXmV+lm7nonnDTAK1TRXR3UC0TJGp4c0Z1i/hnTYxCiuKQ4r0cV
	2fvNSxIcIANZHHgAspdDa5lNLGClxoME6CctSEQLOdRZSAyNTnBbkax+byy8oF+lmGr0pk93Cu+
	FVfzH2pH5kjGDogj0QLmIUyz3XcjN2D0LqxSuLyvrKQzdsQJ+R+tHbSsQsJsvLCby0tUQ457qz2
	/c6Fx9k1wqSrbE=
X-Received: by 2002:a05:6830:83ad:b0:809:5916:fcc3 with SMTP id 46e09a7af769-8178298b7a8mr7998024a34.17.1790371688735;
        Fri, 25 Sep 2026 14:28:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a0e:55f3:1b40:7bc6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm3568385a34.26.2026.09.25.14.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:28:08 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Subject: [PATCH 0/2] iio: adc: ti-ads112c14: minor fixes
Date: Fri, 25 Sep 2026 16:27:42 -0500
Message-Id: <20260925-iio-adc-ti-ads112c14-fix-settlingtime-sign-v1-0-1fd53e7242e8@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywrCMBBFf6XM2oEmxkf9FXERk2m8oqlkogil/
 27U1eXA5ZyZVApE6dDNVOQFxZQbmFVH4eJzEkZsTLa3236wGwYm9jFwRRs1xgbjeMSbVWq9Iae
 Ku7AiZfZ7Wbtx2LloHTXho0g7/mLH05/1eb5KqN8CLcsH8I3vxo4AAAA=
X-Change-ID: 20260925-iio-adc-ti-ads112c14-fix-settlingtime-sign-a8e34f974d24
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "David Lechner (TI)" <dlechner@baylibre.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=764; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=aRNAktut3RhsP3MYWFeTSASKdMb7z7iK/vCtms7DqpM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqtudSVZtTAnctlwaud/NmFZ7dV77U+wKK0czpn
 krgXdQzG1WJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCarbnUgAKCRDCzCAB/wGP
 wH1aB/9uPTJaTovdHPkdebFWKPqDBHH40NP/dfv7rl1/doSpBfHsqSTF2dlk1hdUl1LL5zZtz2i
 UYEVR54xm+c/5rVSdT3XwOIsR75hLnssEdMaAqHy4kmRF//1A2tUDPzurad0co9gp2CmNPuvhS8
 wmBqkYsWa2+0aJ3RW5VVze6pn86a7S8byXMFlwWCwhfBuWKb3Md0do52Hp/2tpFB2Hkp98vRQsK
 OxoR+QAj1heicayz/YwbDE/kfkPVQOmNkehYMy+osiC3T2uewE2T2CP/bxQdJQr0X6thy0LZ5F7
 7zgPKh4O7dceP/hHj3rnbXYMYvnJHDxvF0F7+NyYNbdwCy2g
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Jonathan picked up the filter series for TI ADS112C14 already, but there
were a few minor things Sashiko found that seemed worth fixing.

https://lore.kernel.org/linux-iio/20260913211128.25734544@jic23-hlaptop/

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
David Lechner (TI) (2):
      iio: adc: ti-ads112c14: fix negative settlingtime check
      iio: adc: ti-ads112c14: fix settlingtime creep on write back

 drivers/iio/adc/ti-ads112c14.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)
---
base-commit: d8c0f48f0b1583308a98401c0c7b1a65d1d43a6c
change-id: 20260925-iio-adc-ti-ads112c14-fix-settlingtime-sign-a8e34f974d24

Best regards,
--  
David Lechner (TI) <dlechner@baylibre.com>

