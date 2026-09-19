Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE2E31B83B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.116.240.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789804683; cv=none; b=YTMDwyG2B7v7XCwqREkhU1xOKbLbdBzM46sd8zJoMZ9xApmAKkj0lQ6x8GYldeABOlx2d8TuzZ7VydFclNNAToZvxcit1IvOhlfMqhnXejOVZu4nWVGBizstTVlUqiSd/dkK+WpnrDybvxZYtEpNxrAVuLEFrXDTJgqd9hMER64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789804683; c=relaxed/simple;
	bh=0HqoWMrXdNO5OfQgnTTPtNIXED40IV8fU6rDuuYARqI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VE/W5NZ0cAwwYhiP62l95tP4EO2vgA7E42j6qkpZRuezFKjQSGRzvC+aaD/1pFBchfxDSSr/VRXyvNIvAZbNYZxJmoTCv9mWNI8mNAB45BjwXyB6eknudn//TPqtOdwmvouYLHGKHZxTsBRezPDlPSy0HI+8hpAeMEX/qNZ07Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu; spf=pass smtp.mailfrom=arkamax.eu; dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b=dyeQMdac; arc=none smtp.client-ip=128.116.240.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b="dyeQMdac"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=0HqoWMrXdNO5Of
	QgnTTPtNIXED40IV8fU6rDuuYARqI=; h=in-reply-to:references:to:from:
	subject:cc:date; d=arkamax.eu; b=dyeQMdacFdNOkNT3Q+GqDPR/AfxG96L3SIDuX
	xYuEouDjAdGBjBDnQ/S7PcPSRDci0dDce6PWljneC89Wtqh8WVEB2U8QSLggQVxrr2JoZ6
	cKqx4Qn64itO89S1+kqM/0yGT/Mk4rIlJ8AUP6nBxoluudCn8OnLXQNbhbNxc/JiDJNjMY
	q18Hj8PxSWUy124OVpPyufssRMwchD3NKHnB44wZF8DcqWYu3Ocec4CMRSpKfk73l7jeKK
	kQs6lDT8DQ0JvNVptYepomm6jZ8M4nDCihJzqI5Qh7PnHWBrSrSmfcEFFvBRUJ3tmSSCws
	6NvIdCSzV1ozV/pZmER3Y3Fow==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id 0d7dc368 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 19 Sep 2026 09:57:58 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 09:57:58 +0200
Message-Id: <DLJ4T2GRQSA7.1NN9YA9M8XUDK@arkamax.eu>
Cc: <hch@lst.de>, <sagi@grimberg.me>, <kch@nvidia.com>,
 <linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] nvmet-tcp: report a bounded MDTS instead of "no
 limit"
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
To: "Maurizio Lombardi" <mlombard@arkamax.eu>, "Ing. Alfonso Kuen Arroyo"
 <gerencia@idkmanager.com>
X-Mailer: aerc 0.22.0
References: <DL41D2NGEUHW.2UUHTZ6LLM9X7@arkamax.eu>
 <178978683646.43804.6940923486189370705@idkmanager.com>
 <DLJ4POIDTYXQ.2AOJP9BJAWEOX@arkamax.eu>
In-Reply-To: <DLJ4POIDTYXQ.2AOJP9BJAWEOX@arkamax.eu>

On Sat Sep 19, 2026 at 9:53 AM CEST, Maurizio Lombardi wrote:
>
> Yes, but your patch sets NVMET_RDMA_MAX_MDTS to 8, which means 1MiB, not
> 4MiB, so a 2MiB command should be rejected, even if it's under the MAXH2C=
DATA
> limit of 4MiB; or am I missing something?
>

Typo, I meant NVMET_TCP_MAX_MDTS, not NVMET_RDMA_MAX_MDTS.

Maurizio

