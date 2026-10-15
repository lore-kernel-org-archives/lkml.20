Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3813519928
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058774; cv=none; b=l+lBsm7YTf6GkjiBWeiZuDBic9Vl7fhVWsc7WxuHoAr9EkfYwajmCgLoQ2gnRZ/PYIv0dGCs2ib+C4wQ7a8IEZg0qo0VMi+cQPvrLf/U7vZB9AKRQ+KJgU7D4+4yCN7zI67NV6Z3mF0lorISBoCn8WypotmXm+SnZNZpwcru0V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058774; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IyK9/fNRRCsjUQENFqGyMwYq6NTBkilHxm/FDQ7eQSdzp5SP4Ja6dx/jI0r0JcTqCL3/hOwQJzuFsdgT/0akVmI7H69l1FnGbEFx1dc8RwyedgedUIIM1YaET9qx1BNfBBPSBs2HYwKDbm0XtzKBN9M4VojplkNSq7gJII3SRLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWwQvgRq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWwQvgRq"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso3229064f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792058771; x=1792663571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=HWwQvgRqdlcuvmRv5+nefZzxPqTkdGNilzYhgrvtnlUHGdN3oIzCz3g2sGxu+bBfzG
         RL4ByGDXhUqup+d5kNZTuc5sCQZwd6DFjlUaYao5Rqix67vulUgltmcHEA+fHmRc2RmP
         Tz5Cmvly6aUS0ZmyjWGtanvpX+7zcyykmXg04AyWhiPGdS6oUG397vCmroKDh056bqxn
         Ugr530zalISoyhzzXJdyiF/4btXzBhJ6jhGVJ2tdWidCnMk1hiaOrz4IBEFaQb3+LZKg
         U8v7Lm/thNq9YFaUJdEjhoeuJVjgH1W2dj2rJXyrcFRMDE9ddX7OQq7latxwzQtf8dSF
         To5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058771; x=1792663571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=g3xP9c3Pg3Ban8vllKrBT8kOLMihMFLUnFOp53DoSsPpx8TIBoN9YnginVwAWVbgbm
         atzeGAKD1v+n4FoQHwoyxwsBvriyUdthiNYJPYI74A7RIBvgLSzDx3pihvUGpyaM2Bl4
         pp9N8kHNf4WS6g5CDwJ5z4UYsXC/XSNzKLQRWC0M5pmZVB/fwgW+F8c6wPRp/i1gabWl
         OqJ/mN3CYssVr6q/qdzMFum1WAkAp8v3ss9BqG8r2zTFlHf5SBZbo3U1uA4q8J+Rr2hu
         6c5h++m0jvbuEpQLwXyShFPbbnlxVDrMH1/zu1aDd1pYQSAjBf014mwbBTqGJEpfSoAL
         JGVg==
X-Forwarded-Encrypted: i=1; AKwUvBxR6FJDhtZg1rByhTO2N9V8tzGrWsgTx6qkLPyzjw9rVDqEZQdNBMenQYhZ1hRBrUpnjsz+D2+64mC50U0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD6c10hC2jjMe9Pl9v14gHdfS4o6tvJ5Q1x88FO3SLe8fCT4VD
	wMu1pnt97+XXX8w4nd3p+4Q6L4re+11eCqU+0GYNs8U1iWlNQaOD6iuD
X-Gm-Gg: AYBFou0MScOCWh73kIXL/rmAGP1HIDUfKK6VlfILTamGDQY2+G0A57PGl3GrY3Zdod9
	x1yvMuCLf1vwTqzPSdzAgY0d0Y6pFMV7VpojW9ySEtPdYzq7f2pU53TqE7AjoeaVNg32Upn4c1P
	0OXskpLIO+x80daxhNCmfsjVRq/nHXloox2WZeUka8RByNtom9LruIEdS2HlQXvy13Vs4h0kVBV
	RiUTsvX4F0BdwijNN3oqZgeAVrGV8UNjDPRd8x8yMSmg01k6ACdySH672pGow4Abcyg6Bz6fIPM
	p0CWg80kliPxPGk2ZSGtoQSa0MFHK3BlR5SNARqckmxYc22dFrmc8F0R1TF1uSxTZM1XPMA2kOB
	t4K9aqh54X8BdTCx+WIbL8LiXxbv2IVbUCptnV/WX9Eo0FFt8GcTfeu0+TXOen2gt3dMa6Sg5UV
	D4K9AU8Cwf0FpbziOQy50K6xQ7D6zqu8bFKvBHdiXSPwalFViaRUP9O3abKClnozGy92j4Bu2P9
	tFAwITc4G9o3P/I9evTcQ2uKIzspqp0t6V1fyXcVw==
X-Received: by 2002:a05:600c:8b83:b0:4a1:811c:8064 with SMTP id 5b1f17b1804b1-4a18e4d5512mr360955355e9.26.1792058770944;
        Thu, 15 Oct 2026 03:06:10 -0700 (PDT)
Received: from osama ([2a02:908:182:d1a0:44fe:89e7:9985:abb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd993f34sm64406495e9.11.2026.10.15.03.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:06:10 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: airlied@gmail.com,
	jesszhan0024@gmail.com,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Cc: osama.abdelkader@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] drm/panel: Use managed helpers in DSI panels
Date: Thu, 15 Oct 2026 12:06:09 +0200
Message-ID: <20261015100609.19883-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789994813.git.osama.abdelkader@gmail.com>
References: <cover.1789994813.git.osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

