Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CA93E6392
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901614; cv=none; b=O5XZTX949beA0UQ9pjYGfI4k2hI4+OfJI/1gDEdF7s/s4+JDiLCGAVkzzE4zpjzADSTgQZYw5brwFSxk+HVKRaDQ4P1RhieoDyuX968CyJBXVKuAYh0WqYjYEi5Vboo4EHinROazJlYilFeu9o4tH1HLr6DlzrqEsE6KXBlZDBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901614; c=relaxed/simple;
	bh=RCHIyf1NOyzfdfoy38JnZ5JxI6Bh2ugZ1ku6gHKi4g8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=coH4SAJLQZWmHeWYeL1aMkL6CT2PVwDaYOR8CUEqmHhq1A+RRcBGZppKt+pJK1dRp94GHUYEjbb3Ev8hKFVvPQ2c42PwLS0afP8XF6k7cSZK1TEUTZCrcK062l2h42K3lMRvNvid9mjyhw1tZkglKUXBvAajH8EFX+NVV+4aTbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=V5NqWq41; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="V5NqWq41"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=W0woORh2sNhrNSjAwp60+N8VcUpv9x0tKH5X9eMmLCg=; b=V5NqWq41aeMDKSrS6F5dVbnjgf
	wmRNBzjY7koiaSRlpGgHcaEW+WiAjGfhY/AEBITXtuN8+Kj0qi1WkK9OzF0EWMNO42/ZOFej31+MA
	NGAaehYeDoel9AG2AePrXiLwxJHohpFSAXawU2in6A+w+AuGEpKLe1yII5ZaFS1qqYALtstTNnmOC
	2s+3GD2s/LB1h6jOgF5kc/LMFN1w/Teo51XlhZuHYFSRRd073dS50NCZfUOZq2f2x7ICyy/IWFAam
	P7XJzaL2aI1lgZg3A/is2Ir0mMDVhCGr/verxPv1N4zGbjDZ9Epx56fgVqg0lWScqdp3txuKyvqNJ
	MSbbubvg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x431K-00GhLn-AS; Tue, 08 Sep 2026 23:06:22 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x431J-006po3-Hm; Tue, 08 Sep 2026 23:06:22 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x431J-00000007CH8-21e5;
	Tue, 08 Sep 2026 23:06:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 18:06:21 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
In-Reply-To: <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
 <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
 <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
Message-ID: <c955deded411defba0de3a1f6daa78b0@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-08 16:32, Borislav Petkov wrote:
> On Tue, Sep 08, 2026 at 03:04:53PM -0300, Mauricio Faria de Oliveira wrote:
>> Boris, perhaps the approach here could be changed to add an actual
>> memcmp()-like inline implementation (e.g., as provided in a previous
>> revision, without return value differences), or continue with the
>> memeq()-like memcmp() from arch/x86/boot/ but rename it to memeq() ?
> 
> Nah, new functionality is not needed. We can add it later when it is really needed.

Ack, and to confirm: not rename the existing one, either?

-- 
Mauricio
