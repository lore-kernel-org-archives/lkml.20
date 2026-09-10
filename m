Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B7D2F39B8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789019084; cv=none; b=h4194v8JvbkiU8uwejiUULHuO8u60K51QmB9byMx+TfcpDIuK0rCEG/aAVusIiZSntCfKIezN45VD/UdzBmDGY93CwJl56pOtEqqH/HlXOQlMl5V1kX3dKOgpa3YBwZvSX0BLiFNHy8JfYhhEhKUZcj2ZYr/gNKI23ysvGvWSm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789019084; c=relaxed/simple;
	bh=vCsAiUiM0PKCV4ccyqUUSnv3id7jD+rmaY3eiA+jZJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gFOv55MchpohkH3NpOh44pU4+pYY3lw4KiR3stg9DKotNcWZ+ToJh73MjeQxec9PsxRmQNxLOikuuzHeRu6yyl95oHfonBkowchwtdv0P5l5pPv7rdjP1YEjPIdQOkH8KpiIdOqAoWWTEdcRREQNGZ/3TElOmBwCJqY/uPirzyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xq5VqKgG; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xq5VqKgG"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8534d507f59so6688630b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789019083; x=1789623883; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vCsAiUiM0PKCV4ccyqUUSnv3id7jD+rmaY3eiA+jZJI=;
        b=Xq5VqKgGBwAOAt3G8tBXTese9qs1yGVcwbsFk/TVNI3gSHpRaBH/AP5829mRH8RB/y
         +69HLaOGp2YNqdZOZQDhxPqKsNDfDDOateupyHNDZtM5WgquULcPtj0Na+YAZjvVeEj8
         2qEOOyVDA+2GFQVCIkJ0S0vudzZVpgmPmGjrqzceS2Tt14yTcR0sk8aL9LuMkJK3wytQ
         wTmtUlmLNzNMT/fWVp4jBFXm+tXZLGKOvmeou4UMca5yAhzuSeU6tQeuv26mV2vJHvlX
         ql3iS13JrP5I3/44f0r+D3t5XgGsRlAgU/ImlI3mHADjE6Jk2nn0p7IzCYSHwVDk777N
         QthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789019083; x=1789623883;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCsAiUiM0PKCV4ccyqUUSnv3id7jD+rmaY3eiA+jZJI=;
        b=pQ4wRJwrpc9OKHD6shZIqR2pK/FkR0fHzhgVKex0VoG9E0KV28zxcr/osHbViBGjYi
         yFZ4VzzvGeMJNpu+4594Y+XBkGgwFuolaG5cbq9Lz+tQsHJ03cBe5cdR8/CHq1eGjXCS
         mZR0UEazoaBkth7IVG5Ybj8RNCc6ec0QCU4JtSUtoNclvXhUpkL/blj4VJsNHXEKrihG
         86ekWbF8TeODtHB+N2O6bNhAibu3pwPNUGeNOFz0VoCeQ7dofgrJ9C+8/k71fr0r9maM
         K3RESGFTb8OgKKP8vgfkL/KS1wKiMuTCXuX4RhEenkvUVzqBS4+bQPv7WEKI5ZfssaLv
         3yug==
X-Forwarded-Encrypted: i=1; AKwUvBwtSOY0CD5DMXd3vzWXOqzSjM3b4X5XhDrvqYCGdyzuJAKDzin6ciNQarGNuEK5ZZEoZ1DqcUizdkhuWMY=@vger.kernel.org
X-Gm-Message-State: AFuF++kL2lP5z4KRsuAaoCrmhw463mXKG7L+/4YvI4Jh7U1U+02kwP8d
	kOw98TAVKGrZAzHgQrUJSgh9XA2elwMHwCfFSC2bDg0ZdOzxgZ/q7PzL
X-Gm-Gg: AYBFou1R5JksAeQ2+1kUQy2mjKdn/JElDLepkMurPKDqVn+rBFdYhClPfk0Q2yE/o6P
	1kesuXMtwixOHmZ7MCXQcEAHm6vwrhplYAhapWuDHWs2T5g1b897TGFg3swmz+V8ws7Mp+jUzny
	0HDBgDpr4V8wuqNS+k/tNc2qLZ3uAKPAzfF9RVN4zf5n+Q6wLyvBhb0yIVzD58Oqu0AizxG6hfU
	oDtvM8GQSUV8UemMVdzJkmXklMh7ag6Pm1PeC7p43XW3AYI11ALldJmjLfzppjmT3dn0aJbJAY7
	FEhSL7yqdy39Z18ggrKamEzFcndhEJmWASRG2V0zTiQB04mwNzSWTugDKxtVQ00ofQOutTKlOmK
	S07QT9jHUqcSj/K2WwlF+qWU5fZaKK9/3MfLxUUtlYh+aX57iiuKioSGaQu/NwVwNX5YVFu3ZK3
	1ICkUp9MypnrgGTmlWed9dV4Nu6SUZTKmQk3/CWov1rZfzGWrcQFFYpZ26FaTV81vkxAOGJ1OMd
	N6G
X-Received: by 2002:a05:6a21:7117:b0:3d8:5a37:549c with SMTP id adf61e73a8af0-3da39eb8acbmr70334644637.7.1789019082449;
        Wed, 09 Sep 2026 22:44:42 -0700 (PDT)
Received: from [43.242.224.196] ([43.242.224.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm17937942eec.29.2026.09.09.22.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 22:44:42 -0700 (PDT)
From: Roshan Kumar <roshaen09@gmail.com>
To: linusw@kernel.org, dri-devel@lists.freedesktop.org
Cc: leandro.ribeiro@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 pimyn@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/pl111: Advertise no pixel blending
Date: Thu, 10 Sep 2026 05:44:37 -0000
Message-ID: <178901907705.4155737.5974214979587698317@gmail.com>
In-Reply-To: <d3a928e0-0faa-4cd4-9d2e-cb9be4cf84c0@suse.de>
References: <20260825105427.686619-1-roshaen09@gmail.com>
 <d3a928e0-0faa-4cd4-9d2e-cb9be4cf84c0@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Thomas,

You are right, there is no good reason for these formats to be here: the
hardware never looks at the alpha byte, and the ARGB/ABGR entries just
duplicate their X counterparts.

I will send a v2 that removes the alpha formats from the driver instead.

(Thanks Leandro for the review of v1; the approach changed in v2 so I have
dropped the tag.)
