Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515637;
	b=0obvbJ77WbFzjXBHI8l3OM4Aqt92VgmblNuOvSD91TtnWLJ9Pn3wW2LvdZf3b1ycm2GQ
	 hTWFcyEUFCqHdiAppPAEMf8CFNprXpAZnfocqregi1VrLrgHoGq81ZjhP2NNL5kLv9hix
	 WAFomMmPfpuCaKOteO5n4zSSoMSidNSzeT6KFJgaD7lv8N4wltoYHgTqjzKtxMNLh7IH/
	 /KBKtAqKMMcyUe+fiYdVv1BsOt1XSeVX0tLIks6s++0s2ffVnVCAt3A31etRAZGAElOWo
	 ESiP7z5lJHcpChpibhtyxLbEaneD4lBc2wgfd4MBVHEdJbyvdsbKjeeXFnUQAFIZM6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515637;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Message-ID:In-Reply-To:
	 References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Correlation-ID;
	bh=wuC1euEpB0n5/EBJ0eB8N2MJRd4q5uJE1QtrwCLt46w=;
	b=i+65ZDbRew+gCzZ/oQOm/mDLoIsWN0SThwYAGABi3fbDmeAs1LixTrh+x2gLstkB3r2c
	 vYxmkhRo+FriKU3WwNgQOUCxB2C6KKkydngpUo/J6UoaOcQC/TF+MSkN/SRICFCPFsIBi
	 KRg9qxZDdC2JLreqXg3cYMGrfXxZmbbwlxtJK42vmPQuR+KhPfKc4TGZpV6DDNQKAg3Ed
	 QcCp9Zg7o5wAJkPmbncgdDPigSp8jCu6ziMLDwUMXSXZzMhsYZUb3m9FzcUPN/iuYRwtD
	 SU++55k1Tqx2nAwhMeoA4LyuimruE1xg07Ie7pvUIylT8nds8hDTkSJW+VgjJY9sl0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h8YDMxEX;
	arc=none smtp.remote-ip=95.215.58.110
Received: from mta1.migadu.com (out-110.mta1.migadu.com [95.215.58.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC4E606A881
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC4E606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h8YDMxEX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w4nr15arjCadyvhvYdzXDiaXF7mn7mX3vniCHDDp57o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794515634; v=1; x=1795120434;
 b=h8YDMxEXUmRrE9/nM31mwKslgk03iaxkFNY/bz0o8Z+5US3BaJbiC/v+wn4GmSMQRhiZfo7x
 BdIE5J4dg9+tNjN7/rmnMuUqsyMcpAtVcLy8riEkjjdcIkAgY4qTOHrcCwlCP6lqqZAANDrdx5F
 OLQcAI+7GKumZ+3+5usTv/2g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 17f3d394bf4021e3;
	Thu, 12 Nov 2026 20:33:53 +0000
X-Mizu-Trace-ID: 17f3d394bf4021e3
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 21:33:54 +0100
From: Denis Benato <denis.benato@linux.dev>
To: Andrei Rusu de Castro <arc@empyreal.works>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <8523039e-ba83-48f3-aec4-6d9540b9d0fe@linux.dev>
In-Reply-To: <20261112-asus-wmi-tpolicy-reply-f7889fb1@empyreal.works>
References: <20261111-asus-wmi-tpolicy-5fbc4e09@empyreal.works> <ec9515fb-6698-4e7e-8a88-5b3fa2f50c51@linux.dev> <20261112-asus-wmi-tpolicy-reply-f7889fb1@empyreal.works>
Subject: Re: [PATCH] platform/x86: asus-wmi: write the thermal policy only
 when it changes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <8523039e-ba83-48f3-aec4-6d9540b9d0fe@linux.dev>

12 nov 2026 21:27:45 Andrei Rusu de Castro <arc@empyreal.works>:

> On Thu, 12 Nov 2026 09:32:21 +0100, Denis Benato wrote:
>> I don't agree with this: if the userspace requests a power profile
>> change the driver must honor that request.
> 
> Hi Denis,
> 
> Thanks for the review and the explanation, that makes sense. On my
> machine the package power limits are set outside asus-armoury, so the
> re-apply you suggest would not cover them, and I'll keep this change as
> a local patch instead of pursuing it here.

How are you applying limits? The only thing that comes to mind is intel rapl, but it has way lower limits than what asus validated.

> 
> Thanks,
> Andrei
