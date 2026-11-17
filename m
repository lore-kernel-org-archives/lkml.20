Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930908;
	b=whT+U9ohs8x78faIKlgBAa3E6EidSKyVeA/KXcNr6S2ONdTngoPPuH4WTIzbjEn3ul3n
	 eizA1J0k1SGC/R83VjzSoFgx3PDmWkmEUto/R+1LBCf3Q75vrS/5bexYc6OwTuYKUvvCS
	 SmeFtYiQxW/akChpf+JXIB4sCGtLl8yIDSqQ/Ts7JC9u4eqje76XhmT1G5WyD3IS6pgVZ
	 nK60OfXLhEsRw9OKq1WkJTDJF1udO/sN8WH+oskjHUgjTAbIJ5h/Ql0AjH9epENhDRodi
	 PRp67m//rfJS1H4zNfm4dBBiGmI4tI2eDkVuE+F6/T86qsknu+2qbgKWX6qKUobL38w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930908;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:From:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=kmglfWXnGsBwlvJx+eKttRLK0WJ717Xi+gggE6CtDUk=;
	b=zqk9cg0wh0ZQJGl46/cQmbpt/Sp2uZTaR6PYix2JYrP/aiOPKjsRRmexUV4inY0+Oefx
	 /ZFe+XWs45rcxLpszLQGKfnepMjscR48vvORPl12Dq/mh7vBnj1Sxz5spuc4OGpG9WTap
	 +zYuucPumLsF+V60ofx70jZ0EsoUV3JcAfqtQTtzCvLQd1YJAHppraIcWKOWxK5NFiyIg
	 /utA2gnGtgBD4M9Yga4IUzsUqWhQP5beY4hRWTv8Wd7ePyRMaWYOO15qu00VOkFxN7cPx
	 heC4qGQKFz21TIvuOTk4W89q0D7HtaspF1SxqO0tFT0vlBPbzdi1t450Jqe1sGQ1rbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="f77/EHKC";
	arc=none smtp.remote-ip=91.218.175.240
Received: from mta0.migadu.com (out-240.mta0.migadu.com [91.218.175.240])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEEA606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAEEA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f77/EHKC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kmglfWXnGsBwlvJx+eKttRLK0WJ717Xi+gggE6CtDUk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794930905; v=1; x=1795535705;
 b=f77/EHKCSIXhu7qNxJAQ1Ac+HB42f08O3BZHa+d2JNUgS9er+C8sXn9BCGq5aYcOyurJJ7yi
 O4G2MK5+RxwSR8pp6lBSFiU/N9CMAvIvqmF/5BFwlvPgDPES9Co4tX72trubB6fMn44VPdk+f9s
 qOdlccPEqkL7m4l4KixAErFY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3e6d1fb6a386ff54;
	Tue, 17 Nov 2026 15:55:05 +0000
X-Mizu-Trace-ID: 3e6d1fb6a386ff54
X-Migadu-Flow: FLOW_OUT
Message-ID: <fd9dd97c-3aa6-4f97-9868-47e762c9ae0f@linux.dev>
Date: Tue, 17 Nov 2026 23:54:56 +0800
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
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
To: tsbogend@alpha.franken.de
Cc: Thomas Gleixner <tglx@kernel.org>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: drivers/irqchip/irq-idt3243x.c has never been compiled?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thomas,

I noticed that irq-idt3243x.c seems to have never been compiled in mainline
since it was merged in commit 529ea3681811 ("irqchip: Add support for IDT
79rc3243x interrupt controller", 2021-04-22).

Its kconfig symbol (IRQ_IDT3243X) is a bare bool with no prompt and no
default, and nothing in-tree has ever selected it, so the symbol can never
become y and the driver is never built by any configuration.

Is this a dead driver?

Thanks,
Zenghui
