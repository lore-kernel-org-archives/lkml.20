Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29095353A6F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496068; cv=none; b=XVzLoq9Gb65Yy+Re7oWwmgJwzYcl9iqXP9wDsSmudMsIYmO7JREtrdZmnddF9tWME9RtJ1TRV4qrKrlCI2cUyeTPfPv9sX0FORM6u7kuqv5zp7gvTu3P9k1YpgCXt3MmWp7TeoJMwuQ/LR/G2OIvRK20YXm4qv6/5khK2drAARM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496068; c=relaxed/simple;
	bh=9XCqskVhO3CB34b1th/1rPV3GJRFNpe/Okejb4tbSlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8vpNfzHNg52jRUnq/3dmQfleC4DOXQSdMfrJtPbBlkDbk45wNRy84STS3N1IYgFyzUpKB8PwlFbxAZ1ECdKEpw2telBnbCYbggaQV3D/ujCapGw/5sLw5gmTarhNJeFd5BVr4iVLuzLpULH2iB6QVxvUAxgxBTGKIq66kvks+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KkRlh6TA; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KkRlh6TA"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3A0EF40E015B;
	Sun, 27 Sep 2026 08:01:02 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WQ3X4IOCnIX2; Sun, 27 Sep 2026 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790496051; bh=AC6BqwzXto9LrQtXsvELdecEAzGDZtQnIZ1HjWSIiiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkRlh6TAephr5aWMu866yr8t1s878wmjMIA8ZcGJUDR/04j+YKz1Rnw0fTuGiGE0b
	 jMD/r3NJSAWv9EnQSIAPHuD7isXSOfQSO98sDk0pA6TY6lbXW7p20bSqWj60UBRl2p
	 fcvj5z15L8YZ96fyZvorCdy6PEN6tjxjHKqhdpx2kjjAf1bFr8LlCt+ARiPKk7lAO5
	 /OKkHmGzgK9A8IAg3R3Crb2J30emTt71u+enUsvPGJrhxUIaMTiuhK032Amtjjb1ao
	 tpgLCCXP8pN8wuKxLjaXyV0CP3pk3XBn0+cvC7j6+IlJt72fXkxo9s83mZoyg4WLoR
	 MB5cAel9g0WK397LpWArZnOMlncCBhge+m4Yus0O7V4LYkLPOeye7f1E5V452VpXGm
	 GHssJ2QJeVs7EtoNE0dxBW8G472cxot5o9mHzcM2teyTVUuL32HSb/sQYxloMR6Rrk
	 hwzdg/ukC1pOvP2ahbfsk1XfEGfijSlAolw9jKKooIcVgnqco7UuQiFz+DXedrNUto
	 2V12ks0vu3YzSkpzLUUxO7CCI3ni6FjMYcgJBud3msBU/qRCS6v//PRuRio+a33sfO
	 IaEeOWBbtDSlaLniDXqiHwN3sipZI0/HIn+DWzXalQoFtxt6JJNzhzZVgKdkIrqz0l
	 efbA7EjFfI9ajhfhCGtYKXwc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E620C40E01ED;
	Sun, 27 Sep 2026 08:00:35 +0000 (UTC)
Date: Sun, 27 Sep 2026 01:00:31 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mouse Zhang <zhangzihao@hieco.com.cn>
Cc: puwen@hygon.cn, tglx@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	wyes.karny@amd.com, peterz@infradead.org,
	linux-kernel@vger.kernel.org, tingyin.duan@gmail.com,
	xinruizhu75@gamil.com, shenxiaochen@open-hieco.net,
	fuhao@open-hieco.net, jianyong.wu@outlook.com
Subject: Re: [PATCH] x86/cpu/hygon: Prefer HLT over MWAIT for C1 idle when
 SMT is enabled
Message-ID: <20260927080031.GCarjNHwUinwNBqN0h@fat_crate.local>
References: <20260820015746.1715315-1-zhangzihao@hieco.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260820015746.1715315-1-zhangzihao@hieco.com.cn>

On Thu, Aug 20, 2026 at 09:57:46AM +0800, Mouse Zhang wrote:
> In init_hygon(), set boot_option_idle_override to IDLE_NOMWAIT when no
> explicit idle= option was given and SMT is enabled, so that the default
> C1 idle uses HLT instead of MWAIT. This keeps
> prefer_mwait_c1_over_halt() vendor-neutral while encoding the
> Hygon-specific policy in its own init path.
> 
> On Hygon processors with SMT (2 or 4 threads per core) enabled,
> entering C1 with MWAIT causes a significant single-thread performance
> loss compared to HLT when the sibling thread is also in C1. When the
> sibling thread is in C2, it enters that state via IOPORT, which is
> independent of HLT and MWAIT, so performance is unaffected.
> 
> Hygon and AMD use different hardware implementations for MWAIT C1, and
> HLT performs better than MWAIT on Hygon platforms when SMT is enabled.
> 
> On a Hygon family 18h model 7h system with SMT2 enabled, the
> single-core UnixBench results show HLT outperforming MWAIT by 14.53%,
> and the single-core SPEC CPU 2017 results show improvements of 12.68%
> (intrate) and 19.73% (fprate).
> 
> Commit aebef63cf7ff ("x86: Remove vendor checks from
> prefer_mwait_c1_over_halt"), merged in v6.0-rc1, removed the vendor
> check that previously made Hygon use HLT, so Hygon adopted MWAIT and
> hit the performance regression described above. Restore the pre-v6.0
> default to avoid the regression.
> 
> Fixes: aebef63cf7ff ("x86: Remove vendor checks from prefer_mwait_c1_over_halt")
> Signed-off-by: Mouse Zhang <zhangzihao@hieco.com.cn>
> ---
>  arch/x86/kernel/cpu/hygon.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Sashiko has comments:

https://sashiko.dev/#/patchset/20260820015746.1715315-1-zhangzihao%40hieco.com.cn

Please address them: if valid, fix them, if not, explain why they don't need
to be fixed.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
