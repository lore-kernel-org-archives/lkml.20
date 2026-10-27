Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084096;
	b=r0pgDFMDSawe0r4rfGKUNFx8ktEyUh/98uzvOaO0IdJacwyF0jIZibby05HlE0NI+Es9
	 rbRqeuQoGeQcVMY9Ki4kL3LoP87v2QqNFFZsJ7CSqj/AF/3XE/97qNaelvDZXZ1mRZ2hs
	 iX8fPbc54WeNDltkKTJh5kJQtORpCwvrmmBIYgOMVUIbEewF8uC7/WTtQdMIdQWrkajDd
	 XOr/Q+X94/NrKatpeMY13cGz7Q2Mwm19S3fU95YD3k1QDl92YP4hVzAdLQnmOk0wQIjnB
	 PnOFaxmx6kmTWYxyLdWim4xvd2Qn8UgF1wlP88uFjZxI40kuxuJBmc9Apm3hEF5FMDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oEXr1K3EZeJQI84eHYprlnMC5Rarw55WE3zGp6jDEkE=;
	b=LjfU2g/sHa+Pjk/a8ZOpra2s1Yi7O40rwnpeSKr3xnqUoadXFf1dL9INAcAC9w8/s7Gl
	 MSbUJu9GF8ksg40sxK0ppqqnlHsj6++HQ4ICyG/XDZYc6hqKBV2413/Lz0dXz+uIjdyVd
	 tHRqKmnpVDnI6oa6Y4/8oaYlhwvEvSOA3nzNcqmuu4XeRnaYxcBcU5eu5ikSMr6J44xc1
	 y8993dSUJEPL0fffkoFK7ezBXVqN/VKkHFH44JGlFViygFwzk9Gpj3Joa3JLxGdqfmsph
	 db31j6HLs3Eor3FRglYqhv9NAY4vrDhpoBYOIjCmBUYDKYAEMKLbbr6Y8I7Vn7o+ymg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rbm2u1OD;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C3606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550C3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rbm2u1OD
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso38242205e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084094; x=1793688894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEXr1K3EZeJQI84eHYprlnMC5Rarw55WE3zGp6jDEkE=;
        b=Rbm2u1ODARNBL1tpPkHcrJM/nHYPU7J8ag3G/Z7wD9ZUxWbcU8zU2GfDy84PQZqBxI
         olGNMC0m9AmkJQMUoBagRXCjfUWnRf72LOO6b8ZKHnif1ixuAo87CkfIcCF2+c6oDo5N
         Zl90Q0Y0wquDTGNCkQp7AsQhS8KWjiVBICgCGQoFmHqGDy//4y8okmwwXdrNLN3LRqUn
         XiNDojM4jhEPtC8xX8wW9xNGR7AXZDCLKqCLWasUszZSmZgmWpmE2DYt/pIL21A0gmmU
         hDfGOgrCWfkynb4anQleTR8DpQW2ISV5cbX4aiTSdtuXDutGLv4CwG/UtbOyuEuXkiPd
         FiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084094; x=1793688894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEXr1K3EZeJQI84eHYprlnMC5Rarw55WE3zGp6jDEkE=;
        b=C5FLCMYXeWeSQR66R79s6uqDq8o3N3LvDLS/EjR9kkafNdmCnvK31ouMvoTrh/Yaw7
         C1Iqu911NQNK3YWjlGq3JAYMxjwrbqe/WFaaSRH6pjOasDMbNYgNe84X+8xm6uXyMUAS
         g4rd1DKxVm+OyaZpn6E9x6+IdVnzHgyxDgOSe2p7zcr8oVPjhRcRT2+sw+c6Ul5TvWAe
         lcESKdbi3BZbv/XLLw9whnjElr6eRl5Am2p9IktBBReLa6vsTGo/PQZAurFs6Jf1Gdb5
         UXbKzSxLd5LLAZLLIH43LsnGkiZ1ZAxl4939wwKls2KU5fmPT8/v2J8t+xkrW9Q5Kfjx
         aXpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWovmTkUspP+dAc4FuVYXbkAL0OM2t63kacgppZMcijNEpSJ0FhpJVuzK4k///abV0rZ6EyzvLs1mwVHA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKf0FRUEGJJlbiaL8JCNHK7qsdtELONf3YYf9ocKIc5hqFQDKFe
	fZ1q5Sz1tLCdhHkrY1K6kbNg8zZjKhTVvXke9wnGCUylTtidLZbP61j3
X-Gm-Gg: AYBFou120hIM1BA6ZHNnOfvGGHuSNO3kQgOt2EMa09evYazobjo1nL4Ajfsu2vIN4mw
	JqfQFIr9W8/F3rdMtz6l9Q6j9EYM1GbQzJRlT64CJBx2IpxLTyIXIFmyojH3I/M3M/lP9Eo6zlS
	MQ+gvpIJLd4TGzIC7fuxCSWipmiNuFCp9pe0iS/ir/PgDv7DGTUBKRpDFZPuYa4kQlHJ+vVQdvQ
	uxW52DYPF5oQ1s+7RbureshA5FBXzKX5uHdnOzUWBKGJHH6EvwDnLKVJ+s9+u+2Fy0UKxMfV1Ie
	45fhD6aICBwHcIGsZhDxoHYtnBEcDE9739b5ytvcB6Vh9uvCZRSpHUPqn0z+be5q7kAslQ91Kpq
	Xuf2uhEkiIzySveK3CXoGJtGlkpLV71Iqdm2jby6hFpVe5Wvg4KaIDXQsbuR7/lOAOUlO0tULHN
	Uw75rHQ3UbVO297GI4Wjy9HqnSJt55F29leXOd/LfZ1ysDev7J4HFQEkuuzA/ooRBQU7iFqg7Xb
	l07ksfC1/5eZBSJQ1D32eDHc9sXeZ4wjjWXXZAVUr7f43GKgz21H3cA32xQycCAiiquP2aebh+t
	f13nFgY9DQKyVrctlsm8wwyIhlerG41j/+PBk5jDR9rbYNbMOBonYP7mNsYeAoGIfmN25tgJDDn
	sSvWA5JnqQPHAd5nFQCArrJheJ3jiMpBpSJN11dKwDw+94a/WoVoEeepmuf5AHHAZEp4KLrH3To
	IEhVG6
X-Received: by 2002:a05:600c:46c3:b0:4a2:fd2:9855 with SMTP id 5b1f17b1804b1-4a35acbd173mr173946805e9.13.1793084093615;
        Mon, 26 Oct 2026 23:54:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a4cb7bece3sm189318425e9.10.2026.10.26.23.54.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 23:54:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix NVDEC boot on Tegra210
Date: Tue, 27 Oct 2026 07:54:46 +0100
Message-Id: <20261027065446.97098-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261015-b4-t210-pd_nvdec-nesting-v1-0-39a36b622eac@nvidia.com>
References: <20261015-b4-t210-pd_nvdec-nesting-v1-0-39a36b622eac@nvidia.com>
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

On Thu, Oct 15, 2026 at 06:58:01PM +0900, Mikko Perttunen wrote:
> On Tegra210, parts of the NVDEC hardware unit are in the NVJPG power
> domain. According to the TRM, the NVJPG power domains must always be
> ungated while the NVDEC power domain is ungated. Model the dependency in
> device tree.
>
> The first PMC patch updates the PMC driver to handle cases where a PMC
> power domain depends on another PMC power domain (other than the core
> domain). The second device tree patch adds the dependency in the device
> tree.

Tested on Jetson Nano (Tegra210, 7000e400.pmc and 54480000.nvdec with
nvidia/tegra210/nvdec.bin) on v7.3-rc2 (5b0764a53235):

- Unpatched: pm_genpd_summary lists nvdec as a top-level domain while
  nvjpg stays off-0. Writing "on" to
  /sys/bus/platform/devices/54480000.nvdec/power/control immediately
  resets the board into TegraBoot.
- With both patches applied: pm_genpd_summary registers nvdec as a child
  subdomain of nvjpg. Writing "on" to 54480000.nvdec/power/control
  powers on both nvjpg and nvdec, boots the Falcon firmware, and puts
  54480000.nvdec into runtime_status=active. Writing "auto" powers both
  nvdec and nvjpg back to off-0.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
