Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542057;
	b=bss/6HKYmbiUbGIeZMtLr/xt2za5Iknc7F/9Mx0y0FaYiTHRMLdM88VM5RC+RwhAHzKX
	 UESV/DOEsbjpd3ue64MT28K90FMHccpqJ7B+vxMJ1lHTAHlbqkWzZ3mrgPTuhtQW8V0Je
	 9ZVAH6OWClVUf1gL/bZA/3rUmsm9j+kRRvr2TQ1BbiQ56QNXh1QGa8UXFEZjcgTjcohBx
	 cmM28CiGWq7MZd21sP1ljaibG8+/kV7Qk12s0YBjV40GJ/l2VgtpqdjJnTFh1hJGvJ8qJ
	 duznxN17afk4hAYdx9rv1ABFNtMZwpta8PC1+f7QvvHyvGBgW1ru4m9Am3kfujFsUFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542057;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5F77cYEZGtdp//DOKdgD2RKyC5vHfZcmQ0ZLgGs8sZA=;
	b=y28M2A8NxUmWJ2gQACoArYhubYUSdIn5bsym6q4QhCqC0gpBgzBomGv/rTMZw0T6wP9B
	 0hXmcs6BvuUC9l+PpIbo1bHO5TGpailkvXvMIy1Odha0s4f6M1WGjm+5RhdAE+mukF/gz
	 xadP3QTliAXcCEIG8ddL01AI0zI7fYLcYNeAokIqPCJEOCE1kw+IG55lf9wmdJZGpZiiA
	 lWg/nD0e9yweMQyBidhy3wECAIUBVP1ZUkxvibJ1BU421qFIkuBxbcPHCjzt0uFdeoB9O
	 Z7CcS5StFq7yQbkV8nsjkgTR6iYtCwNJqybYJBrwimv2gJbXJlcSnz1HvIwrjbFmKZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wu9sGuYy;
	arc=none smtp.remote-ip=91.218.175.125
Received: from mta0.migadu.com (out-125.mta0.migadu.com [91.218.175.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014B7606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 014B7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wu9sGuYy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=buDOHrSxqP03PrEBlJ3QvBxrpymco82p9buINaigu+U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542054; v=1; x=1794146854;
 b=wu9sGuYyauHwOVlcipOLT61Je4cynxjdW82i6y3V4UxlixG7EssqybwJ9i0PqE0rFVPqfq8A
 uFYzh7dKBjeBVw4ol833fo06ELwRrH9NFCetAob2HmyRtJH7b7LmojgUDXkUzw2suGmDRUp3IBs
 oTkHvO+TrCYb3JiHd7cPMEHg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5e03d0b85d5e79d6;
	Sun, 01 Nov 2026 14:07:34 +0000
X-Mizu-Trace-ID: 5e03d0b85d5e79d6
X-Migadu-Flow: FLOW_OUT
Message-ID: <1b44d01d-e3d6-4ce3-ae0f-9d76b8139487@linux.dev>
Date: Sun, 1 Nov 2026 14:07:33 +0000
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
Subject: Re: [PATCH v4 04/14] drm/tidss: Drop the tied off video port check
 from mode validation
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
 <20261029-beagley-ai-display-v4-4-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-4-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> dispc_vp_mode_valid() WARNs and rejects every mode on a video port that
> is marked as DISPC_VP_TIED_OFF in the 'vp_bus_type' feat.
> 
> The check is redundant, as nothing in the DT will be connected to the
> tied off VP, and thus the driver can never do a mode_valid call for it.
> 
> Remove the check, and rely on the DT to be correct.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

