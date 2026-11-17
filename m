Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892459;
	b=QS/rgzX1lROYWfR2Rz+geQ/QaSzMYyZiI3zUAarFn3fNLoejf5Y7TJxkw4Rj1r/dmhxY
	 48KO4dcCVMGlV9xANiBAXCyteFi9+3uJ0FmhOEUJ6Ss2EMSMznp1pAUEpDWeeEJmHxDC2
	 1q7nj7gJs6jeFtC1eaR+tEeMho1dQWFmFTol9COkPgY9UCLNkzHnobiPPL83jUSxINWTp
	 EIWDVESWhRgtFqF2ULLdX4LzzW45suM64iU+/4BCIh4zVGuHe8E+SfT8G3ARUjB0Ayzxn
	 2e199ZfvppFTolXaU3Y8SEEd9937ID6jg/E2BeRIfNliCrtHiD7b1AnfeFphSteq+pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892459;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
	b=Wz9TSuBVwKQLfjSbiqtTUxTqMufCyet0LRgImTMlZKXxDeif0PNQbWuTHx8zQd18NTB0
	 pey2YsXiT8lwAALrtKHXI9rdNVKX4hIFJhb108tYKn8G0HejpojRAfP+eEBbhXlBa76x8
	 vHd/t+2OnXwshakpm4IH8Kcai9msITZR02tjb+4NFCCWZt3d1GWEdvh1jU+3/mioNJtCd
	 cYaddut8ylxbo/Hf5OA7LMXYI/7fRf7YUrjsS18yG41OzM996MCUr/KS6uBk/o0SOxjDw
	 wXXNieiZdacQpuAYwUjrEaacE3Dx6E0mTEftPuVXo4QV5jKz+84Jyw04ZnhqIXXn20A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BdGv9q2y;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0066606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0066606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BdGv9q2y
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb9f760337so307867a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892458; x=1795497258;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
        b=1V1k02yiDtWkL/kg2w7231GX9oCrKASYRe3Qz6tJj1Dg8xIce3lZOJpqJOpTG8f0WH
         Cj/IbyJrflY+arYTajglqhJLoaXzxmfS6jcemCg8duX1YPyB1c48Wvl/tP09V82HlYLO
         vq7SnR/Y9K7Dd9AlqeLu1uLRRlUsi4XcbjhSmujIl3jPs6st94xQQY3B8I/mhq/iFw3x
         aG4LHaXAhITMjUAbNcznQ46LJ0nMeh2v6kVEk4AmAJMXhM01+frqtEIATB7W52BQFxvu
         BcV6g9AESlTa7YPkBpSKLNooh++cPd/1MJFGYAViFDIM4v/J2hCYUGDk27H5CAqevVWI
         41bg==
X-Forwarded-Encrypted: i=1; AL+hErF7BPkFF6sicAFsFww+1A3AGbOO2E7L3fIfVYTBQi6hC5KUDalzN5ZUAURI6149GJyn4yyFHWTt7K9m5sg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qNg8e8JOWqa1/+yzwjSnfcMQujBSjKnMg1+Ld2O0Z1hUvOjbv
	y8r91X21l3nQbd6MyaUBNDPXayUaqxexHBMAxs793YS8KY46ZjjAcK3jT10oeqsIsochNnxHfif
	s6NPIHBr88gtcCPQUG9OOS+J+xDFKaIFxKkLiFdA66bDxUknmJ+9cscZoaMnnzcQhyL9Z6n7rkh
	uXxAev3V8SYxY8krbi5j9FZ5Z9LSGQgilZ7Jd4n17y9V1jz8zqtBcL2/ReHBvkTontKLhComb6b
	9FU4WnTp8pM3pb0
X-Gm-Gg: AZFdTZeIYa/SAZ+/cETIqO8hb5cjaJQOICCfyQ4MtsFm7LQoqHWb1YP3GFj4M0AqBTs
	U2xh/luR3I8tEhOsZ6faYaBIibngLRcQgMPc+U21kuSHrIc4dvOp9JUu2837LLSnFPuooFOETOt
	kKr7IV2Z9pYmcw/3p0YI+v4MOtZW1hj8UdKFQmPRSHsMZVei4TfmYYDaxkXm5V8MLrjpaQe+XMw
	rby3bpCH5TOrXAbIbjef2uY2hLNfkZxLZ7EG2mFZIhKF4G/10r+qP9qOuiHZlmbeD9m3gM29t18
	vP/VmRDV7v0ftVtBsDyLlmewdb9G9uQapfpGmsagFis0J/ByN7kl6xIOgCezgwLiQeE9M3KCYuz
	iT9tEcDYmKWbqN10q1R3Q2pSbt9ybSzbvAPLj0bVbfq+A4kmK8CUN3Q620+DKJNkrTUvq9UjGTt
	dXXj1Zm4P6Sav0bK0PEMYYOFOUaJUXW971aVE=
X-Received: by 2002:a17:90b:1d51:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b3abe139f6mr870808a91.33.1794892458041;
        Mon, 16 Nov 2026 21:14:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac02cce6sm1040517a91.7.2026.11.16.21.14.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:14:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so658485a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794892456; x=1795497256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
        b=BdGv9q2yO0xLyqN+AV1p5W361CoGRqQ6JCzKFyiXI3Zs9R2BTBBdam1/T23MRbOgmR
         ZkOjDF8Vm9BJdr+zYamcZ4fE4le9PMtUpkt19aw7vYnkQQVGU/Y6P9UhjJ3BXBuM8A8B
         58jGxJ7Ad0z6/POSw6M2CwyiQU+Aq3QInssmE=
X-Forwarded-Encrypted: i=1; AL+hErEKkRdjPvUGCIbKdkLuzvtevthMTUk1X3Z58hU3wArBPo5YQmFnFKfTqh/LUJoYTFf58Nk+GqjBf9g3yr8=@vger.kernel.org
X-Received: by 2002:a17:90b:48cd:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b3abaf90ffmr845991a91.8.1794892456172;
        Mon, 16 Nov 2026 21:14:16 -0800 (PST)
X-Received: by 2002:a17:90b:48cd:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b3abaf90ffmr845973a91.8.1794892455435;
        Mon, 16 Nov 2026 21:14:15 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm2158002a91.0.2026.11.16.21.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:14:14 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Vladimir Popov <popov.nkv@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Deepak Rawat <drawat@vmware.com>,
	Sinclair Yeh <syeh@vmware.com>,
	Thomas Hellstrom <thellstrom@vmware.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 15901/15901] drm/vmwgfx: fix NULL pointer dereference in vmw_validation_bo_fence()
Date: Tue, 17 Nov 2026 00:14:10 -0500
Message-ID: <179487959552.2515856.5690215138822621209@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414105529.9883-1-popov.nkv@gmail.com>
References: <20260414105529.9883-1-popov.nkv@gmail.com>
Content-Type: text/plain; charset="utf-8"
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Thank you. Applied to drm-misc-fixes.

z
