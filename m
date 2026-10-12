Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6678A331200
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805612; cv=none; b=s8eBEdk7xRbfv4XGAtNDe3zAcyb+vIT5yrMzeMdGnCwIL1S5z5eidmQqxCo3BvWP89rfkB6sQLsQ7CZRA1XMlnssRclVi9PBJ6cd4kWJ/0dVbCdmaUTOC9zJ9E5BUJHecxDU9CuUlte89VITv3gzhu7usNVvk4YIvtuFGLL8cD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805612; c=relaxed/simple;
	bh=PJ6jdbT1y7bX58fvx+BQKUdf++vjDv25ipv+YCgsA1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gV1olKpN3PwOH1cM+z4drUXPQVid2hJCorC0dpLB9WZO4wkZh9aM6/kbUHt3WAlfoGmS3hxd/law9i2HWfUoflD0C//XhiCZ8/68oSRY1NasrrHwKFLYOjMI7AHNK9lmxuEuuJIeKxU5p9ebSgi5uUDfPalnsRg/ONQj3T6gLqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDyzY9U1; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDyzY9U1"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35834f72d94so3015040eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791805610; x=1792410410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/pFIA4JhU+T4tfga+MhmKf2vHHiyKNlOYgyfnrmVZS4=;
        b=hDyzY9U1q47drqyIBjdlUhEFQPd1QtALcCQHb2+su3zQHj/zCIqMflm4HbGP4aTQpc
         /XBovgdqSck2gbYkGOIAkpd1ytjJznyGKHsq/JHwwvLIc5ViAxJvLd+bv6e7BFNMrcvW
         DFXP1s8aJXDIAKblzlI2Pst89FnOm/r+aUMRH7GKJaD6OMX4O+asZGB2Y79W3024/4H9
         v8h5TLVw+Jor/bpy9tJuIQ3xP+sEPCNlLN9CbVYS2f/mMYgJquvUbLVLaHQF4aATNP6m
         LZ1L/OGhknfJeZorZMqkgSEnA3Z6jRR6tHDveDnN5wuach3bY9mc2pMiGt5PhPHQy0DE
         PPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805610; x=1792410410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pFIA4JhU+T4tfga+MhmKf2vHHiyKNlOYgyfnrmVZS4=;
        b=SkrvoYPTmXYOQAlzv7YN8LsMEU6mT5YByEFrZiINr9Z61leSWASVEwRPECJgF5ZM9N
         FknYfKmw7VajNCj9XCL415bigm6If46KQEV6ACEN2pG6PHODyT2bAvY6fZu6QHVFt5Kz
         HjgiCy4KGpCnr0khXPlm6H4XItJPHYbaZgLrB5Rm1jfzQWBr4TFuZYs9cS6hRUf5nnpK
         Cow/6aRCF6wCETxOTpqWZqbawZBDbiuByEs9+GOTlVmHHGMyWccnudyi2diST4fy9ntU
         ZEk5UoN8Drqz3S6HoQphe8a70u4DckL/0kHzCk7X7LYM8XDCf4SsSDDgPjtkaPBCjtD8
         eEuQ==
X-Gm-Message-State: AFq9FYIMJ2z1AbrEbN4aPhBeGkNjc+dbqFWJj2bsT6CL+4mEystCn0bq
	C48/ooBgQjg1IvvBHjMxhy5eoE/LIwXmKrVI9dKPyaKjwsuZ2qzemDA=
X-Gm-Gg: AYBFou27d/i5w/1YKhccmzkol6/wR90aRaPRY7P8H7lWPKzRJskziFlWDP79Lr4rJxG
	vt7evPNe3B6iEv3yo7I16wza399GbD3GEtKYSqZiTF2gKz4UwLQ4JD6C2gNzgHfVYWNs5tobBIb
	skc9SMazW+KH2sc1aB/clLB/4FSU4e1QOkrSW6aSra/CibZt6/6h/OhnKQYCQ6V9Ox678q+ol5T
	pCcQuuKpq8tsJEQMwOYl7I5DIyRkWuswXauTNz2ibCHgsHc5X6Rq0iU9kZnFeOTiCZ9lsMc33gI
	Ts1CL0w/sj5lJsMIA/eCXPn4BuplP+l4Wi8OGIknkz6eAXNZMdiRkyfahH/sAvt895MkFzgnDb8
	RZ4CU0UbHU/LXmniUjOZhyMs1jDqZfeNF6aYFaKKh7aA/Wdeh3tFdjl6g6Vl3RinF4CQsFJGrO9
	GFr+6MDZjqcnEMTLlY93HCG9fhakqhmWkjI73KZ9COjsm0nwtxSjzoUZyMTmB6Alab9bfXbC0gK
	cUqhOxdMr9oGNQmmXbtHz7p2Fr8dGoxJlmfbA==
X-Received: by 2002:a05:693c:66d2:10b0:356:9345:a07a with SMTP id 5a478bee46e88-3569345a94fmr9735696eec.24.1791805610252;
        Mon, 12 Oct 2026 04:46:50 -0700 (PDT)
Received: from localhost.localdomain ([101.0.62.171])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm37311334eec.3.2026.10.12.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:46:49 -0700 (PDT)
From: Nikhil Gautam <nikhilgtr@gmail.com>
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	Nikhil Gautam <nikhilgtr@gmail.com>
Subject: [PATCH 0/1] iio: atlas-ezo: Fix humidity channel read support
Date: Mon, 12 Oct 2026 17:15:52 +0530
Message-Id: <20261012114553.3327-1-nikhilgtr@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The atlas_ezo_read_raw() function currently rejects channels whose
type is not IIO_CONCENTRATION. As a result, the relative humidity channel
cannot access the raw or scale values, even though the driver defines support
for IIO_HUMIDITYRELATIVE.

Remove the early channel type check so that both concentration and
relative humidity channels can be handled by the existing mask-specific logic.

Nikhil Gautam (1):
  iio: atlas-ezo: Fix humidity channel read support

 drivers/iio/chemical/atlas-ezo-sensor.c | 3 ---
 1 file changed, 3 deletions(-)

-- 
2.39.5

