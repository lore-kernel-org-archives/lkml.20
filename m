Received: from sirius.syn-flut.de (sirius.syn-flut.de [94.125.25.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E763403F8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.125.25.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788174127; cv=none; b=Hkex+p3SssoTxrJRnLnUfddRmC66w3kIX3YYoTCCdqrzg5efWKAaePcZ45Jti6OFpA4+HpkJnrAT89WP9xCI6cbHKzlX3I4pZ8jx+myXdEPJEUN5oLkoB0fsVuZRE+XkM5MKniraJhSoMMLfriurqMZiXndNrA+k5o9hNr9Q9vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788174127; c=relaxed/simple;
	bh=st0h5eJ2nnQs7ofobVciLWNyA2cU/o3+QS/j1depyO0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fpQr7/ofvCkP/iIII9yH8yloLlvYO86zvIPOzMXdlzNyfKnCsWFO0AXCwepUjPCxykCGkY4oRgwFPPtmLWtml/yYoD/Mjj/9F843avEgW64jqI27/gEU6KIspXB04AVvt+YtesM+ZJwVDwydcclhfHCBugGo9aapDCZEyxLq3G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kait2en.org; spf=pass smtp.mailfrom=kait2en.org; dkim=pass (2048-bit key) header.d=kait2en.org header.i=@kait2en.org header.b=azzukf0M; arc=none smtp.client-ip=94.125.25.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kait2en.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kait2en.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kait2en.org header.i=@kait2en.org header.b="azzukf0M"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96649140326;
	Mon, 31 Aug 2026 13:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kait2en.org; s=dkim;
	t=1788174116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=st0h5eJ2nnQs7ofobVciLWNyA2cU/o3+QS/j1depyO0=;
	b=azzukf0Mzt6inZfRxBpNN0FTq3w0/225VbLq5BCBpyYW4KMi4j36lHmoS56xs1d3/B0/of
	hLsUcf9MdJ/4WPnZMI5saMsSQXmjuv8izB7LgiKhofk/wccxDZmt1pWCNUx5HBp3QtFxMy
	JXEIFSMlNigmUBTGTKXrvuuWSLN77z2Zi1NnreXYELLi0lmwM0dBAPgVWM9YlFKzkyHBuL
	FRupKazsfAlEOk7YbmhYIIbHElXSh2svSH/v6IIN+c9iMP1MeQjevc5KxPIRJyhM7rsNa9
	cR/bH5pZcn0aIrmGBm62LTCsXMXNr77JqXQ9pWJZOXcw4q/fUnf0vbx7/Ns9YA==
Message-ID: <18712116082b2affddf3b509a96e3abf066d00a6.camel@kait2en.org>
Subject: Re: [PATCH] drm/i915/psr: enable PSR on Apple T2 eDP panels
From: Alexander Fischer <alexander.fischer@kait2en.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jani Nikula	
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie	 <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>,  =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza	
 <jose.souza@intel.com>, =?ISO-8859-1?Q?Andr=E9?= Eikmeyer	
 <andre.eikmeyer@kait2en.org>, Yossef Osman <yossef.osman@proton.me>
Date: Mon, 31 Aug 2026 13:01:53 +0200
In-Reply-To: <apUq8bYCZ3I9bErN@wunner.de>
References: <20260829161622.11396-1-alexander.fischer@kait2en.org>
	 <apUq8bYCZ3I9bErN@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 2026-08-31 at 09:19 +0200, Lukas Wunner wrote:
> We've got pci_dev_present() for this.

Thanks, will use it in v2.
