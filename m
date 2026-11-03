Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734578;
	b=oZW+kFInd7tzfC/J9TQWtzlrTAwuQ6IZ/KPuXCbb65MDtjaPNbHiUbZ8SqQJogKLHo9r
	 guu+ZJL1t+vYV/8xWQQn5An2guJ06YTsXeuLp72zhtxhLGpH8+YCXKDUWdcSyxDrWxL62
	 ZI4aXGe2DX7MJ4R67btysfgV1v39a/72h4cjECiXkA4p0QZRyPr4Vp4dSbQh2i6Mire8t
	 U9M+ZmIL6Q4bfQbie+Cr4QOIgQVj5qvcJdCPRfrFdI1C+CGSrhoTRL79YKDgXiHvwaU5z
	 edDpxByPcnPfy65fA86k+eqz/EyfJ4v/QQ1UFAqZvxIBLgymY+ccdzVj2JULbsKcxTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734578;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7GCadaz+EjyUtDNGp4iFFF8gzxEfhR5CHvprcMIc3D4=;
	b=QdcYSxjn9wh7FWftFibVDGatRYSftVQtN9rIl7HGEc0Zna3FkJf0oVx5RNtIhTZ2p3ZF
	 HWGLNyD9HOV43dlyb7djN45YmfiU22fCsS2I1QEefiQC8zPBG6U9rRiWM6ZI65DVGhHgO
	 tojWCYnvS954tpl0hCjrMvyoP306/pxacaMSRjuULsqR6oijwHE9B6F3BWLJnV1f9vF1f
	 HEZARGiD7m/1rTKvUBPeI6ewcQqR815TNNCz7oVxzJL0dte6jCSbH885JbfZ4BQNQDYum
	 N+p3AP/mfFeiqfrBaI+oflee1zZ4b2uO1HVLBi9soJ7L+xc+bSGKo3ZpF1FPCOVHtOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lhndge+D;
	arc=none smtp.remote-ip=91.218.175.210
Received: from mta0.migadu.com (out-210.mta0.migadu.com [91.218.175.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EFB606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96EFB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lhndge+D
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=G7KaqzRmIMer3j1Th54NKYLobcV9sl8HLgmBiZenzwA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793734568; v=1; x=1794339368;
 b=lhndge+DqYs3tfg/liaOv0xoCfapCh2cKEU1ZfrmN3kfCnD2H25OyajNLYl6Y2YIixcy+CFM
 J5zW/ZvG3noyAIIdcRXjV6YKbZ8ozYN0O4sfFZefPbvXJos0RcnqypU9FrwVUOYZ9QXkyp1CgAg
 CwWL1oRRPT034jP1rOkZs6KQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a12960df4dbf8237;
	Tue, 03 Nov 2026 19:36:08 +0000
X-Mizu-Trace-ID: a12960df4dbf8237
X-Migadu-Flow: FLOW_OUT
Message-ID: <08e5c832-ec20-4510-b540-d81f3d9b178f@linux.dev>
Date: Tue, 3 Nov 2026 19:36:03 +0000
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
Subject: Re: [PATCH v5 06/15] drm/tidss: Use the AM625 features for AM62A7
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
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
 <20261103-beagley-ai-display-v5-6-f1c8d0e52bb4@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261103-beagley-ai-display-v5-6-f1c8d0e52bb4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03/11/26 11:34, Tomi Valkeinen wrote:
> With the recent cleanups, the data in dispc_am62a7_feats is identical to
> dispc_am625_feats, except the subrevision, and the only place where we
> have a difference of behavior wrt. the subrevision is in a debug print.
> 
> Drop the dispc_am62a7_feats and use dispc_am625_feats for AM62A7. The
> debug print will print a few extra OLDI status bits for AM62A7, which
> are not relevant as AM62A7 doesn't have OLDI, but that is harmless.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

