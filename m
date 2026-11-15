Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.125.25.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753276;
	b=grLWfK6ton6DY84ZJrRFsqpEa/d+dcu6mV+1FaiCVQrwFyRvu4Cv4NSL6ZKD/PcGqmqQ
	 oT0yetp0qEP/s6dzj6Dwp0ZXvkm/apteiH+V+YunavTBLZkTTuS9IGFL4UP39uxpnQyyg
	 DIj/L/U3+S6MKEtDm3EvAv8UHPH5w8YldiuXaM/oSV2HC4KqV6Sbd1EJrglfzJdH/7XVK
	 HdGrC/UiduEzClW39sBKNVJ5e8n9Zt9EIy09Vo0/hYYhHc7pz5v6Vr3QOr8u1QFMWScCv
	 BM18d+YMdEVZnJZxQvy9i9LltEieWJZHIDKIC2Oi1fAIVxw4LqRmRVp/wEtiP7UCjEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753276;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Last-TLS-Session-Version;
	bh=ZFyZN1FF15cYS5kE09kbPO5/SQOe7sCHNmPWADa0IL0=;
	b=f0x1eZb3jZRnX9TBYdzDRwVa48QA98pxA/ZHrDsnZ7ho8++yoY6IbB6OME/ad3M33jo+
	 MTcm6mZnbPwGFjWyE36yzqpirhLOCcMpdRiOT5hDkaLjtzJiiv9WiciAVvDJw46VO3x4X
	 Q6hnV/y/YTY1t735uPCMI1LpoAC2igfFdJZeWsMcA3Wl48Pp0ygcKnoxzEjDNhVYXB0BX
	 e/xGDDPef9g4aazwQonuM61Yy/pl6mZSK4z0PbOEA2Dir+Clx9kcar8nSld9A0t1o9I9A
	 Sfpqa4w+tzJCPORzv4UwI9D4w8eguTGQsB3nG8DU5amNI2v+g2J4jZiwVfQh3tonfzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kait2en.org;
	spf=pass smtp.mailfrom=kait2en.org;
	dkim=pass header.d=kait2en.org header.i=@kait2en.org header.a=rsa-sha256 header.s=dkim header.b=P1au2GoD;
	arc=none smtp.remote-ip=94.125.25.230
Received: from sirius.syn-flut.de (sirius.syn-flut.de [94.125.25.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9562606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9562606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kait2en.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kait2en.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kait2en.org header.i=@kait2en.org header.a=rsa-sha256 header.s=dkim header.b=P1au2GoD
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87A57140EE9;
	Sun, 15 Nov 2026 15:34:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kait2en.org; s=dkim;
	t=1794753267; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZFyZN1FF15cYS5kE09kbPO5/SQOe7sCHNmPWADa0IL0=;
	b=P1au2GoDDwKBl0HsjeUAQxpK7goIWcXviCjq6dEKG1j72D5DOMrGldMKQxwKy0wzgibM4F
	hFdNo8yi0zNSnkRBIvAQxFHbY5YknAc/ENEU2TMAudgFHadxLrvs7htt7bMnyDDCZd4Dfn
	LE7cosNnNyi+hFKXFkzNXMgli+vEdjKKhKkHRKh6MKavddd7c1xWh6BhFLWDyKklRcamNp
	Z/eTejpSGpI0VIFosX7lSQs6mOXvQW5MFAovia0wzCZd0KjZiOuLkpYLEC5Ro3GSSv7v5y
	vCmPSFSYD5CqscWG4B7Z6t+7eafMdtumPowUgd/N3ZZOFs8+Nvw+6MjvFVyFaQ==
Message-ID: <b58095131bb7a588aafd5b5b0a8cd5f754c21971.camel@kait2en.org>
Subject: Re: [PATCH RESEND] drm/i915/psr: enable PSR on Apple T2 eDP panels
From: Alexander Fischer <alexander.fischer@kait2en.org>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Aditya Garg <aditya.garg@linux.dev>
Cc: Lukas Wunner <lukas@wunner.de>, Jani Nikula
 <jani.nikula@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin	
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter	
 <simona@ffwll.ch>, =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza	
 <jose.souza@intel.com>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Andre Eikmeyer <dev@deq.rocks>, Yossef Osman	
 <yossef.osman@proton.me>
Date: Sun, 15 Nov 2026 15:34:22 +0100
In-Reply-To: <avcpZt3CkBJvz49o@intel.com>
References: <20261112165956.61633-1-aditya.garg@linux.dev>
		 <avcpZt3CkBJvz49o@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (by Flathub.org) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

Hi Ville,

Thanks for reviewing this.

> Which source OUI does the Apple driver write there?

When I first tried to get PSR working, I also tried writing Apple's
00:10:fa from i915 before link training. It made no difference. I then
traced macOS and found the extra writes in this patch. With those
added, PSR worked, leaving i915's Intel source OUI unchanged.

After your question, I read back 0x300-0x302 on the MacBookPro16,2
under macOS 26.6.1 and got 00 00 00 twice. The same read method
returned the expected sink identity at 0x400. I haven't captured boot,
so I can't say whether a different source OUI was set earlier.

> Maybe these should include "SOURCE" vs. "SINK" in the name as well.

Agreed. I'll use APPLE_SOURCE_PSR_SETUP for 0x321 and APPLE_SINK_PSR_*
for the other registers, and update the comment.

> This is some other device on these systems? Can't just match on the
GPU subsys vendor/device + sink OUI alone?

Yes, 106b:1801 is the separate T2 Bridge Controller. We only check its
presence to restrict the quirk to T2 systems and retain NO_PSR on older
untested Macs. The current subsystem device ID is a wildcard.

Specific GPU subsystem vendor/device pairs plus the sink OUI could
replace this. I chose T2 detection to avoid a per-model list; the five
tested models are only a subset of what matches. If you prefer explicit
subsystem IDs, I can collect and verify those for the tested machines.

Best regards,
Alex
