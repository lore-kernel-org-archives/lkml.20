Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878695;
	b=GIwaDe/tmFEVl3Iuk3GkZMf0fpqpEnqGo1y2XMQmzgX/6ZlxBPH8Ri8JjJUMuh4W+AWJ
	 eubYRFDfriatf9rh+u7u32vd6LePzNlUqo65t5oVacCbl9oXjEhRtHV0hb+Uhfe1ItHye
	 r8ira+AhLHXfYm8a5XbmgM+XMaFNqtEZSNzBq6ex/2y55M4ec4/hcOBcRB3+vXaurDWAn
	 OH0rt8+rhn8Ya69awNzcbUIX0mZZ1J0vgKpePnrBUowSy3zoY2KLTlXOJDBAqmDpbnnv4
	 /l+DaY6iZQ0IDA0DKRgp1yqI4xoP2acR/L1lDVwBRLxefNk0Z2/og8K1e2RShwMBxrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878695;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=tbsBhorpX5/hg11/oBkLoGN5x3wli6X3ebAisCWgK2c=;
	b=vSM6wgKy8N/PWyK3kmzs4lDESG1YZPfoeHnkLxwPIczUB/vDmZS4PfM2c0IZiWmYjPJp
	 wm8ztFpOnA6ne4edxh722riSbIOeD8B5j3OOSUTqrTfhiAqDJVScg+Qqib5AMBHqp0iNa
	 BDVd0uoO1Wu1hejWGDLSGUYw5dS94zk8SthF5iVH7bJEO7HFKoAMTZe+E/kSjufzP7bRn
	 JY/KpxM6iHcJhODNwd6yJ200Sn5xXg8dZfSDxEz9bokCd7uca9c+2m64jGX2ERTomfGaF
	 XNaXy0jc5aCaOCQgi+UhCi+xR8/DwBkY1uRA07w74azPPHE8cdQNoRZkmyOwwXXvMpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M9X+iDw2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEBD606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M9X+iDw2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171B81F000C1;
	Thu,  5 Nov 2026 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793878694;
	bh=tbsBhorpX5/hg11/oBkLoGN5x3wli6X3ebAisCWgK2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M9X+iDw2ORrpPUaDkz7MrCQc+gRQbprFWySehjB2KG4rXWODD4igi+duJmMoSnlRl
	 kopf5u3YgN78VtyHl01cXCmfizipTxNpk9SOEBgAAr3E8HL0zkMhopiP05LtJceWrY
	 ED1WnjC2S+xlCNv5zBI0n69ItkHBN5Wv4H+yDUCiuDnOO8jDRfjazJZOuRPLJcFlvn
	 o7n1fCqLc0w49cechdoVyDSWEqcr3LondEMEu5s12GyhP//iaF4cgVTlLRiCFKnT7n
	 YVnsMU9vpesAWl+HTeCTqQOCSgRLztuF/dP3vfs26f6kTtzbNGF3sa+mLKXdYiBHiM
	 st1wzmJSheO8g==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 6D272198003A;
	Thu,  5 Nov 2026 06:38:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 05 Nov 2026 06:38:12 -0500
X-ME-Sender: <xms:oWrsakkGlgKpR4wSm4ye8vv5csIAo86ksnI3CRCrKjaIAGWH7p4RZQ>
    <xme:oWrsajYtjeGUs_u_kIuefPOf_AzTPUtWXK-DrRSGYCrQpC4L5EcIZyN7-INXKLOrj
    UGT8w0Zod-RsEbrQCenUDhV7iSUy-tD9bftu208ILE03j7t44SYUg>
X-ME-Received: <xmr:oWrsasBHzt1eXTYkDr6ygg5y9ro_Ytj9FkIMPtFlnndtttzqxgzJyhCDHMo>
X-ME-Proxy-Cause: dmFkZTFgCBY0H5ERCpEWHMWeRovHwsuqR+Zb+dTNF6i0Wx6f7bDy0HWpqxM/ilEd3SmjwZ
    vjJAUFeZ/zBNEC3KI2YM+ad6PmkKx4ukR8n5J8nEiKNFWVXyvayr0881g5/mna2LEZcqam
    I8+YZ6HPM1KFewLEYnolCm4NMYZG7n/P92+sSLWoLbVmG9/cM8ddAdCMCI/zzzsvgYhWH/
    U0/un/WLwaEnnvjrs8TM7ghH3lFOprirTdMYV8lQR2O11uKvbkktYbVoKk6QpJLoKDlpMF
    htE8GiRINFSaJ74JopyvAxB/OOc/3hMfEeCHd9+w/qJ7P2Stp8TOD//K8G5YrP+v/+gaSn
    rqCy4qK4skVM4GvMeNcty2X+jEl/W9vNjpmQZj7NSp3HcqiH2ME/3kKmcO4vdSZxh38I7J
    hm8EEkedoYry5QczVgTb4gK5JbJXByKI9E/D12mIdar2rGXlzoLvqb04B6flvcbpWOUqwa
    xWodXioGRteUh8SVPRSz+jSe33SB4Q/D/xWYp5buKmkf/K7DPwLQz3JakHyyAf5XP2v2k0
    ypce1ZV2IEOqx+byeARzy6zXkHBuMXRBPo8mflhhICtYm4kEfDGfscjBvW7nHL41WdHa5c
    0QTbN74SZIEmIktDxDq1ZWXtR6RQcPexInTsmSlhYzkCOES6HqFBvU3HrZ1g
X-ME-Proxy: <xmx:oWrsapZ0sJZPaTLJohiTbQH0GBzNwIUuyVsQjhPFgXtwhGjHo0Ovuw>
    <xmx:oWrsaghIMK7D5dEeDwAHlTtyLk2v7kb6ZDy0SBbzNCAnWqhCAjKzVQ>
    <xmx:oWrsapw5fN2OQzBsVBeThBvK9xYPabwzuGCdda-JmTfst2VqD70-FQ>
    <xmx:oWrsar7ua-Gcqusx-0RQROs1qZszuYf6_HFQ7zjrPjym7UOkp0fL0Q>
    <xmx:omrsai0JtSjuBIAGCYf8dN5F2ipy5pl5kQbKYWQ6nBG8-gYebIvfqvyX>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:38:09 -0500 (EST)
Date: Thu, 5 Nov 2026 11:38:08 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, Breno Leitao <leitao@debian.org>, Dawei Li <dawei.li@linux.dev>, 
	mrigendrachaubey <mrigendra.chaubey@gmail.com>, kernel-team@meta.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: sdei: Run the event handler on the kernel
 vectors
Message-ID: <auxqaslfm5t3FAPL@thinkstation>
References: <20261104180936.2981070-2-kas@kernel.org>
 <20261104182842.3436759-1-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104182842.3436759-1-usama.arif@linux.dev>

On Wed, Nov 04, 2026 at 10:28:41AM -0800, Usama Arif wrote:
> Would doing the swap in __sdei_handler(), around the whole NMI
> entry and exit pair, close that window?

Yes. The WARNs you point at only fire when context tracking is already
broken, but the same window has tracepoints: trace_hardirqs_off_finish()
fires irq_disable exactly when the event lands in user space, and a BPF
program attached there can fault.

It applies to 2/2 too: anything that traps in irqentry_nmi_enter()
overwrites ELR, ESR and FAR before do_sdei_event() saves them.

I'll move both into __sdei_handler(), around irqentry_nmi_enter() and
irqentry_nmi_exit(), in v2. do_sdei_event() still needs the interrupted
VBAR for the IRQ-like resume, so it will get it as an argument.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
