Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777913C3F5C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224317; cv=none; b=nt84KopxDnM/4woD3KeFX48jLTxOH2gLKkPlghSYulVOr6VR4lsv+mDXMxUe5CQIJELq7rfjtFn7RPL3R8rQ4KL0GPYk6n/SVtjO95vSc3xX2R6HK2P2OynUACqJaC2jXTF6YJjE1E++vPRihowx3Yf9DamVHt4meV8k6JIFmUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224317; c=relaxed/simple;
	bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltVO4Mytb0EA7EjRUV0MThwzcoEuRzATcJGIPZUVMnZBlKM8Oha6NoXHHpTrti+Dgwwxd4dffj5sb2G1ZLFRT7rHwIW2cS7464vRqRZcjxCkm5yKU4TOzilScoIZ2cE8wp5nMaDjr4swxrV8UueJXt5jI2B7uNKMovBmw0H+gAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6QUi51w; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6QUi51w"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so890792b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224315; x=1790829115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
        b=O6QUi51w2N9AjF6xq+I2SOxm3120l5gvM/q2UUuP8ydbXQ7W9DUrrf/X9OMrb5ooHa
         M+jIoQKT8ZrTt83fs/knotPnqrEVCca2rdOa3aXwrf9Y6+R+twDEN2AVfvexhMNwpl2X
         7KUPoPfXj9saP0Dsp0dt284l/kzv6JdUmAtWJoRPABaxiCoRtQEX43jG7iBWOMavX94v
         V6txZOdN1Z6ZxtDgsjKqAmjEkQd/25WyEmQ/5LFsmH4wprJJd5Aj3SA7wqXdUbGh823Q
         jzQGlpZT+BeE7aOWLuVlUXhlwABBDfE/wCxF4MtaskH5egE3hTOW5PjRcA4s+vHKvArv
         c3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224315; x=1790829115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
        b=hyPWOaNd7pk+7G5zqLwXAqKWzO/wAcp4ss1J3RwsB+W4Tx93MPfeyD4GbCVRi58cJB
         Fz4vecmJxvogtLoVtVjnJNKsMrVoM03u2rfopG0eynGBCspUwc5ZTdkx7U3ut4JajQoS
         xRZGG3GT8mvrwhbpFsxwjCF8q7WS9yfrW0KwRHrlRuFRvx7HFOtw7RlHLkR7hBYso/94
         2UmLn/AIKVrE3Srm1wct05zc3rL+xOGjeR7QWUWw7o4sUAd/CvenzpOiagiRkr2dXtzW
         QC2BcP8vML90tbizp3YDtPt7ZI+BOrnGCkheGVAO+YVIqj9H9AjBxTdl/GKyYh5K1pnp
         Wtkg==
X-Forwarded-Encrypted: i=1; AKwUvBw4aq7qJEuHLcVMAcL5i8ygoGUZcQAQo9KpbDHNvFKu3G/txsinqdml1TZ1KqexUIQW61GfIk7QIy+c3fU=@vger.kernel.org
X-Gm-Message-State: AFuF++lO10ZpWE72Y3UE+eB5PtL1wFUN5nqWQEDR8x4BKqW2xCIIQoal
	fX66ymvKHS6hujRnR02ek5c6lGGkCWP+4ZryR28V2oEw+/O/X5iIPRrSRNPoGUx7dxypRg==
X-Gm-Gg: AYBFou3wu5tR7fwpGDt2HbXX6Hky4AuESFxA7s/tt8+qHB3zyiwKvHbb025VW28Xupz
	QsPZGQtHf6DNTPJBoy0jCNtgTJoO2N3ZclknvA25FQKvhHzs417luUULNPbAONzMwylnXMeue1i
	8goPXJ2VE2xjRiTTFiTg6Nj8OF7qeR8b6EtnoZae170CyU3YajI1wC1NYqDzFjc5QG1j6qcUK1D
	4QdtVfomOQ+k/B2i9uw2VzGMKCvUAGDEgtwi5IT2UOyjYaO2ltc2C13JYEs4PesXIKO/fpqtOlP
	Hr2O6CrrY9E9k09eOEglCIbZLyER8EF3zSPElYfVZRBXs+GREZXsvuO1Id8pGnnNJgE7+IeKXi/
	nevyiVQhCsywaEoCv7MPap325ybA6pYCkii0lO4BhGcnOOFzYrfrbn1xY6SEL1SCEBg5riusAJc
	ehe7ysKWlFa8/p8/SQ+RdrRhGrX8RYxAxC4ZoN3wZbpLhryiICa29Io611dbWt29AK6XjFkMlx5
	KkiTy0Mm5trYUy072KuMJE6eOTcImDi/mQheoZkZLiaV60MmGyexN39EphKZKKOHZyqpATm1Zpz
	iOernMKv0q7swlRP7Rsbi+tiAjSi45DQWhzUy6BtlyY7cqVWq1WmbHPIfZ8=
X-Received: by 2002:a05:6a00:854:b0:857:72ba:ff0e with SMTP id d2e1a72fcca58-87e9947181dmr975987b3a.22.1790224315411;
        Wed, 23 Sep 2026 21:31:55 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1b0b505bsm2219376b3a.8.2026.09.23.21.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:31:55 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 5/6] qnx6: abort mount on superblock magic mismatch when silent is set
Date: Thu, 24 Sep 2026 12:31:51 +0800
Message-ID: <20260924043151.3897375-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921042511.1473629-5-benquike@gmail.com>
References: <20260919222556.3792829-1-benquike@gmail.com> <f68323da-e90f-46a4-b3ce-70d26de115e6@kernel.org> <20260921042511.1473629-1-benquike@gmail.com> <20260921042511.1473629-5-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested as described in my reply to 1/6.

Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
