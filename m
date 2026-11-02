Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619686;
	b=HHZvvzIQi8dRut98/DaY6WpNbFQvra/rzmq1shFfzAUmeUYERkujRu35+1w2pskY2iWE
	 YyIonz1s21JtAigPxg95eQeVbZy67tjl2WAH2gPJGKEMy9j3aJM5xwAUykGHhC2HcKHRc
	 AJorGN2wN45Pxst3LTxOYxjyMjdfu8GZHgM6xTb+9UydL7TA++wSs4k3PTiyysJDkY+s/
	 qNV0a4PB/7ufQkgBRXBlrJLeqx48yJLUXw6C6YV864A1PgVCRmvCGTtpqmWr0KX4RVCwU
	 p+6I2xA7nEZvVi6SGO7aaBr2PqCsP4mEfFy1Qu2uMatXmnW9vDiQj6B8IC+XchtSbzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619686;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hli9Pm6PyR4E1whnLP74hf5mHnZKkC5Wmy1ba4WkJhE=;
	b=vGfV45d91vUvz/6GwLye+yP0OJy7YCluTR7bQyi3jTPQ/jvqcuhkr0iQG8xeIEY65mjn
	 hqtnW2pYbejPnXOy8Tc4YV+e37Z/dEdmWPn2ks67f+z3+N9JQvniKcaRVv0n2M6KvLExo
	 MMZazfFeuiQ+Hhrs4HXMYMeN9uNnnySPD3kQZCmgu1CixWql7+XWVOkP2EOsYHVDNwxqS
	 +DVtDHdmebwe2Qvh0l/8H87/amJRWp/r6tO9bA4y0fB1+y1IuJNmzHYjNs1ADRzJ1NkKH
	 gGttE3qDuAYiZXTCnRTQYgc8LsbGAoU3mgIRuA2p6gA+rdbzzdaO92xwpkWc3yUrdbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KXIvGTeQ;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5B2606A324;
	Mon,  2 Nov 2026 11:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE5B2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KXIvGTeQ
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75328BE;
	Mon,  2 Nov 2026 12:39:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793619547;
	bh=T+o17ojaeL3LXS8MEZRII4Gziximst2Yab1GxPQcvhM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KXIvGTeQ97m5HZMByM/E2aPK96z4htwSQbPZrQMzUkZbrLZoiUZPDBa1x8s/HV906
	 rvr66VS1WTemwmFC6/KPrpMpywOuNSz8/BNKd3fSRFMNtpomPGSXe8lU6Ko7K8KeVU
	 Zx94ahRVzU7xrC2xlIMX5hWiKAfF0T8eWNmSRigE=
Message-ID: <02facf72-2b1e-4e31-a84a-cd18913469c2@ideasonboard.com>
Date: Mon, 2 Nov 2026 13:41:19 +0200
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
Subject: Re: [PATCH v4 06/14] drm/tidss: oldi: Drop unnecessary forward
 declaration
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-6-dc7f2b532478@ideasonboard.com>
 <5044b7a0-5eaf-4008-9653-11027b8055b5@linux.dev>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <5044b7a0-5eaf-4008-9653-11027b8055b5@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/11/2026 16:11, Aradhya Bhatia wrote:
> 
> 
> On 29/10/26 10:18, Tomi Valkeinen wrote:
>> Nothing needs "struct tidss_oldi" in tidss_oldi.h, so drop the forward
>> declaration.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Should this perhaps have a Fixes tag?
> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
I think this is more a cleanup than a fix. The forward declaration 
doesn't cause any issues, so there's nothing to fix.

  Tomi

