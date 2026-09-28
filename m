Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA5964AA4;
	Mon, 28 Sep 2026 05:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573316; cv=none; b=mvXaUD+N2ffpg2trMg3MJUZ2eK3/U36T4WjhuXIqtVx4zRNvi5x4A05eBy0/b+V2bfVrMF9zHCucajgqOntOTvi4L6Ba9fkgL2KpwHVi3d/i4Kr/+MY0L21xXBgpdFWzkgI+N5dCWz75EJTsNKi4RxcKawZM9Bu5h1369+GuGu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573316; c=relaxed/simple;
	bh=KfanDVMBEpz7PobdM4FbjMTBPN6BSOZFsal9qjNuiIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfvzGd+NNeHN63HxmiyGENrMIP1z0Utxpxt+8Nv15Lzk1kpRMEqZ/vxBDhOsldIdTkgv5B3GOdCK0I1P9WIpd5BpW6ayMDReM/iFLEsxMtnctOzkSgrQZynsdslXSgDDETRH5jBQk6gHWjUNww+EGqP33s6QLkC3vaCJXxZ9MHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CQZoSMsS; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CQZoSMsS"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 26D9340E01CD;
	Mon, 28 Sep 2026 05:28:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QQCsejbX304O; Mon, 28 Sep 2026 05:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790573300; bh=+iVFUA39JHknLIhtudusL84r2zNhDeEBcA/pCHTPHnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQZoSMsSB09uP7uke2TeZqS0pG/eqc+xZy0HXF8DxasKhwpM64ERKplm43eH/1GTP
	 EA7E4b5fk8tdkh4YzQYD+9WynVrdEepZlti22NapA2BCBXB9xelGttU4wKv2c2lz+P
	 dP1VpVtM+AnwYtQmSAO0l1/3GsLKHnlr9TRP1JXd5xRG/anTiC7tM5OhymmwUNxNNc
	 n82EUno1wHRw+9hpUS4vJyr09Ep7w5yMl6Hf1JHQMOLTimcI0zdTkSUlfMRDRqYdIz
	 fVyzZKUPYaJaCJ5TYyw0CJIWgmcOTDMdEybkDo3SvpoSOtw5aBIT0z03qN0hjOdbcU
	 x41/DYYwCvH5vzOsKsk2sQL9IY5uxtDZdc6T5sHJA6jyf5l1m3LGeegb2tp0Dtla9B
	 vvsmZR8PH7W4g03ESabDsJi461BF4a6BtKb0DFeym4Pm1/FDH1N1pWoM6C8uwUJmnZ
	 uHjx6nMwjLs10uDY7/l3fUPmQWHGFtdV/tH5nwbQigLgbv2iaS9mMTX8piU04Hm9Ak
	 Mbd6rTRC3hdoG6FWXRMVvKyaWJCVSyUHud6UX1CI/+Vzfs5pFet2BjclPmphwVnWyC
	 981ZZ0Cg55EEEZX0A419WvJwc3a0Ntj/n80MGf+jfQZvqdnFTSsQHnZTSrsiUORp0Z
	 yR/kx6Gdj+8PJLMSeJvcDrcQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 789C440E00E8;
	Mon, 28 Sep 2026 05:28:10 +0000 (UTC)
Date: Sun, 27 Sep 2026 22:28:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rui Qi <qirui.001@bytedance.com>
Cc: Yazen Ghannam <Yazen.Ghannam@amd.com>, Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	muralidhara.mk@amd.com, naveenkrishna.chatradhi@amd.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] RAS/AMD/FMPM: Fix spurious BUG when ERST record
 enumeration fails
Message-ID: <20260928052807.GBarn656Cjchv-qbhE@fat_crate.local>
References: <20260925030918.3428029-1-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925030918.3428029-1-qirui.001@bytedance.com>

On Fri, Sep 25, 2026 at 11:09:18AM +0800, Rui Qi wrote:
> When erst_get_record_id_begin() returns an error, get_saved_records()
> jumps to the out_end label and unconditionally calls
> erst_get_record_id_end(). But begin() only bumps the
> erst_record_id_cache refcount on success, so calling end() after a
> failed begin() underflows it.
> 
> This is reachable when fmpm is built as a module: if the cache lock
> is contended (by pstore, erst-dbg, or apei_read_mce) and a signal
> arrives, mutex_lock_interruptible() in begin() returns -EINTR without
> incrementing the refcount. end() then takes the lock, decrements the
> refcount below zero, and BUG_ON() fires while still holding it. The
> loader dies with the mutex held, so every later ERST user blocks
> indefinitely.

This sounds like this is something you can trigger. If so, how exactly?

> Built-in fmpm is not affected, since its initcall runs before
> userspace and mutex_lock_interruptible() can never see a signal.
> 
> Fix it by jumping to the out label on begin() failure, skipping
> erst_get_record_id_end(). kfree(old) moves to that shared label so
> it still runs on every path.

Do not explain the patch in your commit message.

> Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>

Because if you can trigger it with the upstream kernel, then this needs to go
to stable.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
