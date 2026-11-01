Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542204;
	b=CZqqEb75uKgBn49RcHmtlr1Mx0gblKYuH5lPRi4rSJDYEilM/FxjV6Vmv32cQDBc4CWX
	 vHiWPbTGPStnAudnAwYUBBWrIpgL1LxjiU2WqmFF2C4ogxctefM9ocJUSesMJeiTlW27m
	 gYSqfwuX+wRhgt02b9QoTrTELTrRCELWKhucTWB3Nc5FpoC2c8efQeEZyzheC+q67966K
	 epivx5vn8sx0jchd3aIXKqNt41zvXbHqYTJ0EZ+Iubvj5SieNOIAGdfJrx/56QGVAQo3R
	 f+022LCno5IbwaHOF1jSzDBOF4N9CTE9on7nMDy+mGJSGcgDyJkPRHVKnI8dXjQPqFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542204;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=MkwmyvkEVjRtDWYR5GqzWTgmyyizRWCCTfKNvyyK1JE=;
	b=A7oX/UqkIFbQJV0Qe8+Zve1L9BRUz9lR6msvIV1teSBiUQKsMjk9AwzeQ0rtet96bBSY
	 7qq3p954n9t6SoyDHXINQ9ZDWqqInpQaOLpu5eQPLChzwSH9c5mnc4fPe6zS2FwzhrLg2
	 fp/B2HM3UIyC6GJKkgjYk25F8IxkdP9gwRPYOTQdhqhk76I9x2Qji20k/3pJ7EbFyVE/a
	 GvZUbvaMtI5F5eraEVKf+EyqBTH4xsgCBwG8+a99duQ1k0dhf7o8Y5Aho+gYtaP+BeGOC
	 zdOWm7NgM9NumDrJxuEfHb0RmG/Cf6+GuTNU09BFLHkJ0fB32cPpSDmhCFZrpGdUX9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X1bieIVb;
	arc=none smtp.remote-ip=91.218.175.142
Received: from mta0.migadu.com (out-142.mta0.migadu.com [91.218.175.142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1093E606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1093E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X1bieIVb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XeOvI8Uurnq6I/6gF8mpx0rDxIIEfThiP9X/LsYPomA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542201; v=1; x=1794147001;
 b=X1bieIVbAc9PaBjqG/eLArr+StyQTvXUc5bH4R6hvTuxxwQ25+sPOgpT2Gs7wNZiy/DGnwKZ
 2Zjkaf6InGiauzZPuzugS0SCeEwXfSEEFlA9jrJmAqZhCQ/7gn9vjZnRJFCVMGlavMh6tktCy1G
 JiYg9uDQDtpjHdhg0NYgblxI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8720dda60dada96a;
	Sun, 01 Nov 2026 14:10:01 +0000
X-Mizu-Trace-ID: 8720dda60dada96a
X-Migadu-Flow: FLOW_OUT
Message-ID: <fb667673-2ee3-4dec-ac1f-dd88c1efb760@linux.dev>
Date: Sun, 1 Nov 2026 14:09:56 +0000
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
Subject: Re: [PATCH v4 05/14] drm/tidss: Remove the unused vp_bus_type feat
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
 <20261029-beagley-ai-display-v4-5-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-5-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> Nothing reads the 'vp_bus_type' feat any more, and can be removed.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

The 'vp_bus_type' has indeed been troublesome when I worked on tidss.
Happy to see the driver work without it now! =)

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

