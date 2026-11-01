Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542674;
	b=ygrtS1K+B8WvlZ+LCHyk7BQfMgG9c7d+JJNlIC26J4/+1VWBSs6YhY46feZXlO6u+J3g
	 yIHRdo/2XwRauNnZRXtxkQRwI8vBQEkHQYu9C7nu/mZlCgzk7GpJANqSNBA8U7JSFdH36
	 /e1cvMzXuTyGVrE3r6JmbpRY2y51Z5LLiam2uU6aWSouuF8KG3mcKx0twe4umr+8r4mg3
	 8GLkz/RQG1Th192XoWhFG5QBkuIZsWfvK5PWTMzA9PtFD1oBU/8mjTudMkKIqcrYVLFao
	 5RNRTseWOwaWSqEODhyJ7PAz8HZJqPx8XF4zOtdpWpOiS9pmI28y3RVoEkHZXe/ocIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542674;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QOWCpj5xocO9r4ovITstA0AQSfIrmgmI9TwBqylnJ5Q=;
	b=0bIj2Qhp3xVSPnS1wDvghKCnGK31GlW3SuVIgLh3j7j7GmUn6RMR3+slgc48SLSBjm2E
	 mtWsAa0Ax1JQHujM5vfNDdJOP1WPS4hSYAszvfgcQT0bnKKCniDyotztJFPOy2NY/qVv4
	 frvWoj19PxWzG6rRx3fwAvXCUmE0KgwnaVgUYNzj/qad52uUy1ynqlkzT04tsnPXDkCB9
	 WAyMLYJRGd66WEY9OyvnfxqirzWsPduQG9X08puMOhyfsBpS7wKxZwXmLs8AK8hv/PN4A
	 tCWcdaG3t6FiDn8sgz8SljQND8M/kDjetaHoBYWLDGWPxl5N5QoFybKrgy+U2IGfiXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ek1s6Hkx;
	arc=none smtp.remote-ip=91.218.175.17
Received: from mta0.migadu.com (out-17.mta0.migadu.com [91.218.175.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6881606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6881606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ek1s6Hkx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fw1iLfF3jVbpvumv35xApp+yxHDwlvLUfs297heBAlk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542670; v=1; x=1794147470;
 b=Ek1s6HkxlK+V27Bb2Ov+HW/BnK7OzFsz+5APl0d+9wOmjo0ggIgXOuaxGDiZbc8GCRRoXtCn
 UtRT51AMrkRDUW1UMtMC6HpzHF69KSPalvYIB0EJSRwR6I3fyT1P4x1kyLTrRgiTa+MngHcJCp6
 uYhpQ74AyM/evRmzRDPyZiZo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bac851f887adadfe;
	Sun, 01 Nov 2026 14:17:50 +0000
X-Mizu-Trace-ID: bac851f887adadfe
X-Migadu-Flow: FLOW_OUT
Message-ID: <b7cb1cad-07de-4ba2-9158-de8de43236fa@linux.dev>
Date: Sun, 1 Nov 2026 14:17:45 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/14] drm/tidss: oldi: Fix serial clock reference leak
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-8-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-8-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> tidss_oldi_init() gets the OLDI serial clock with of_clk_get_by_name()
> and never puts it. A clock reference leaks each time tidss unbinds, and
> each time its probe fails or defers after the OLDI setup.
> 
> Get the clock with devm_get_clk_from_child() instead.
> 
> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

