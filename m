Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626286;
	b=IhtgVtkucIsivE7rn67fSNTtZW++cjD1jxNCu4a73awX1s+ON3i85F7sV3ZfsORwe6Qj
	 NpXlE5ChVUHGS9GguEzqiCk5xtmLkuhcfoFo9j6ooGnLsYIPePj0q55RNm5Rx/8YtP5QG
	 fXK9tv9zlxoPv/TrKLrAIaElDBTxbq4wvwgwOxpHodyW7b118/uReDK4+ug8GGyrIjeE8
	 4rjveL5CHwrNnhn0cGd10PoL1f6YCdUnY494HTbEnrt/yC9eVreP5vXf4XJODPQ1r9fEM
	 SjoLMDH43FNJwsRhYd49dhcelGR9Lc8Iy3HOqFqqhRynsx2TUWPW1tXJIDkghDxh+Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626286;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WWMGndPAPi/9UPLdPzs/eClP3b+MIDrQWGzMEfhXf+0=;
	b=IxCCm6zCLxHLOAULR3PRAjyN7EOUny7XygNjTBGJmids+jKBZrRglqFJ0H+BSoN7LF1b
	 WF2e7CiXLM1aay8V0TOV/Wi382TYxtrwSZP1hV473/bGwduLPoBAIt2IRr8ogn/9inioD
	 Kt/m7AYRcH1vNRf43BeRiOYS7i8zct6hcWiwSfblv8mfw8ZkmbyIlwcq92k6eEF+Vkyxa
	 I0SybCQrb20LD15UlibzJ+67Xmue2zKEdl9Zh7dIOUUg6QxV0fbvTO62LYynes8TLrrzM
	 Kf/gy4zntQxUPpIg4asUaXuZxE8RIng5bO6lue26wWMKPQ8uCz6e8edFrG19t6n3dIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fWfUia+b;
	arc=none smtp.remote-ip=95.215.58.2
Received: from mta1.migadu.com (out-2.mta1.migadu.com [95.215.58.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD32606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD32606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fWfUia+b
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tyuUU3tex6yGuGsqkMIA7zBej2IJkvxByg23hzKT+6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793626284; v=1; x=1794231084;
 b=fWfUia+bn78oXS6xaZceLZFGdj2BUs/KRC9uhgCV4jRuhku0GRK9Djp5dGvPEC4qK8aCbsTI
 L/YK+zh4u6+MJwvDK4WvN2vvMtRPGgPJKjdEkCNZhSKI/lWMPX6xe4zS8TW7HzgURgEmJZsFtXg
 h/mouv1NXRAM8A4QRgHhMVjo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cfaa51096a2fcffc;
	Mon, 02 Nov 2026 13:31:24 +0000
X-Mizu-Trace-ID: cfaa51096a2fcffc
X-Migadu-Flow: FLOW_OUT
Message-ID: <b88e357a-819e-4f82-a6ea-00dab9b7f232@linux.dev>
Date: Mon, 2 Nov 2026 13:31:23 +0000
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
Subject: Re: [PATCH v4 10/14] drm/tidss: oldi: Move the setup of one OLDI TX
 to its own function
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
 <20261029-beagley-ai-display-v4-10-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-10-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> tidss_oldi_init() sets up each OLDI TX inside its loop over the OLDI TX
> nodes, which is not a few lines of code and indents quite deeply. Clean
> up the code by separating the setup of a single OLDI TX into its own
> function.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

