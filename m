Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3161353A8C;
	Tue,  1 Sep 2026 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260104; cv=none; b=RoSZ86qcLmz48u8pc/fb/hAMvwZhyMjoPEUMEN3evwE4uG0a6DqMufLCsEK0r5QJwyt8plwJgqdxtRPSTv8pIn749MwBcbZIfpqwpfSOYT8SX5pld/zB/89Qlfjf/rWfeTKKK09qXNBuxjqD1H6uX5vcq5D8CVFc+VulHcVwL5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260104; c=relaxed/simple;
	bh=xuJrOo2N1GeNfW15+M2/mvNMi23byCpsgz13Dbb9hJE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VQOly/rYsp2hwSXcrGreSgqKJWGcA3eIqyyyAlpUs0dzqO4Em3zIe5c9ua256RvKT+HWa57RAAX1Ou/bdSXXrgo2VVSI0gqoDmfbtyfHLPk64ROfC3Kr/MabWUpwm9iLdhN+H/zq5KEeeY7KtDnKpn8YY1T5qG1/nKRHmy6bk3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oWHH0iwB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oWHH0iwB"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:42c8:e78d:2576:d7c8:5aa9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE2E4163;
	Tue,  1 Sep 2026 12:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788260006;
	bh=xuJrOo2N1GeNfW15+M2/mvNMi23byCpsgz13Dbb9hJE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oWHH0iwB6VCYY6N83qIXnwLFTuoWZ3qFM+4e+1BboOyuV3C/K3tNNmZAW1HHQ2geP
	 I7kBt7fNVqpK3gYHdbNSa7xzAxRbYUX+V4cGwxC6qFSOxaupZ07lMkdnOcrw46bN+5
	 hFwUoJ6BmpbYIS3kNR6Awkk4pvs6XPOZ+FYukfiU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260827-imx355-ccsify-v2-1-3a97bc708315@ixit.cz>
References: <20260827-imx355-ccsify-v2-1-3a97bc708315@ixit.cz>
Subject: Re: [PATCH v2] media: imx355: reuse existing CCS defines
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, david@ixit.cz
Date: Tue, 01 Sep 2026 16:24:50 +0530
Message-ID: <178826009065.11722.9465569994622163267@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi David,

Quoting David Heidelberg via B4 Relay (2026-08-27 14:56:53)
> From: David Heidelberg <david@ixit.cz>
>=20
> The driver may not be MIPI CCS compliant, but does use same address and
> often set same values as compliant drivers. Do not redefine registers we
> already know and are standard.
>=20
> No functional changes.
>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai
