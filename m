Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292F83D1A82
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020921; cv=none; b=CIneDkXQgzrmL8CUTnCc0vr0R5+bxtW0jYdPI1y8ANciImWB1bkbLu4PrA3UeUuXD1mIKJRrN6kUbTB5ylV6+2g5vCjiRfgZD2aj8nG8/EBWMtGh45fc+wr76tyhVy8GzvenGejix4zj9Nybim9u/AGZLJEykdM+vsPaoTgxoNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020921; c=relaxed/simple;
	bh=itqbRrEdJvtLQCP67Vkiwl1NSaID50JhA6qSpgJe42U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nr52mz0zEHUDnQCQwNx9T1INiXMB6IGMFF+LJijiVek6UpW+CvmjiFo+FMKbJjvhvNt0Z2qYnnx1GtCWL21fzKdNR0QkcTTsrAf9PCemuCkPM2WnkefJT1YsI1n+iegoGUseiaSp6MHdlgtS1GOEKt07EdEjVuQreHFyfwqgsgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ZIlEf1vB; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ZIlEf1vB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=CSPJIsvNlMvdmn6uXKZViopTtoSgZJPrxMs/p+WHsnw=; b=ZIlEf1vBhG/BIYcOIMpcp2PaFV
	asP5GSsBbPrEGg5NVDwX42rXhiMB7bl3PVGpvtbp9SZtn1ocAv/jvAHVS542rj99/zsrldWoIAGDe
	9Vjjz0GLDNOaqKh90G/wVUMG/YWRKI/s2DCdIKu2xijEMwoPgvZPNRN7nt5IW1k6/Nn+sNpkpCWb8
	wC02JTIDNyDXN6n4yqJgLSy6nXzu+Rlz7tl2kicFPeldrNYyB/8aY+ifvqeMRcCjlO9dO/kS5DOrF
	pQ1L4sOZn94QybfY7K1dZsdMPQPEk/TKjfLxu2ywsHtNCPRwPvYG2G982xFr8r1JkL+/GmgVqFpcB
	4JJNDuAw==;
Received: from [179.105.94.163] (helo=prince)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x8kCs-005H41-T0; Mon, 21 Sep 2026 22:01:43 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: mwen@igalia.com,
	Erick Karanja <karanja99erick@gmail.com>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/v3d: Restrict v3d_perfmon_stop_locked() to v3d_perfmon.c
Date: Mon, 21 Sep 2026 17:00:15 -0300
Message-ID: <179002073423.3089763.10777877946256735963.b4-ty@igalia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921190014.38231-1-karanja99erick@gmail.com>
References: <20260921190014.38231-1-karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Sep 2026 22:00:14 +0300, Erick Karanja wrote:
> v3d_perfmon_stop_locked() is only used within v3d_perfmon.c.
> Make the function file-local and remove its declaration from v3d_drv.h.
> 
> 

Applied with checkpatch fixes, thanks! Please, always verify for checkpatch
issues before submitting patches.

[1/1] drm/v3d: Restrict v3d_perfmon_stop_locked() to v3d_perfmon.c
      commit: 8ef59ee794076e2b58cff357b12de2ba5d441271

Best regards,
- Maíra
