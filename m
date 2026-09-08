Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D583F353A70
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895982; cv=none; b=kNZIcsHj0w3rqQGJ8ZtZbTZBqVmU4o9MHbmLRubcGBM5JF8r6xLVY/BCBiSlbXCIIP76w0TC0T0nJUAgzMFitjjrOaEWnhU7OWLpSb5b2XlTOCE2j1G41J7iu5Htl98GQjNOA0A1yCI0P7F+WBjjszI6NHg+xgSKDDhdgPI80FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895982; c=relaxed/simple;
	bh=PsmvxiniHeaenvgUByMKyc1Seh9VNZoo6AhTYZzDViA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctlKNIpCF6dEd9hyOEwDKrCizd8wBlcn/qTeWBjKDgrMfb3cNKVzp3yUlo9DHOWpZi6DlrvG9UIx7aTZALRgV47tECQ9m2CU64ElQJ/ZbwlUdPhz0a4MD1bHDkXWNofBuUvp7zRCB2wLDwR39qYPl+KHWiDTfzPbITEHRj9t1fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=cwg+fHP6; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="cwg+fHP6"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7ABD340E01F9;
	Tue,  8 Sep 2026 19:32:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EOvuZCCfcmsb; Tue,  8 Sep 2026 19:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788895967; bh=CSxdJl4VBmqHBG2bWI7rm0ZQwyV1SRPcqmp/fkG/2Fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwg+fHP68U1E4MZ59lLpLK/8gQ6qCUXS7fi5N32ugrohWQjHI6hDpvpxTWRIE5Uhn
	 p6GUxO/I9ZXLuYKmVbEuMqDqRrGw5eI4prsmMRnlGxCY4C4+TTQ1Q97gBYJa3GCdmv
	 ASmk0yH1wCK1RvHvz+mp8scgjIluUYfD+ejJtJmyjcJRYecg3WnfY+Hwcq4DB0i0zE
	 L2m+h1SAkafW6bkrpr8pNiBUSa+gdznsgnLq1PMzc/pBupjiqfExCFGUPNvEY8TSrP
	 cL7dfrs1tAC9t9AOfJM8duIPbsCHZZbehvFl0cvQdGC3KSJ4V2P7IKZwmKMGohEph8
	 7KAVVlgS9yOdoDDWPurPqj+d5p6nsY7ROShKx9SQa8LK2DVdR9tOLAc7GC7pWoM++w
	 VJO05TcWaSy6da/m+C2WftviWAvOtriATkGbNX1L3Yhb15QMwYatOukSuqqXDXOMo+
	 5eJxuquCtyeN7sVE3Dxgjvhlb9ZN/EAqkVNrzKWQuogJ86EvXw//L8RmpUpAj0dl3Z
	 /11ogNuRl0PeDHKTpqMJa96NpNeh/dY16TGIXH3JGLbLWrAWpgKYPwK2ZiVP/+KDxM
	 vBGlz8imGLf75+JzTvp248YRm3SiWdd9NdJx4kCbAVkcABxryoqq4N5zIjSrv6tUKn
	 cGqY+ntuQUYJ7gzDyyyd1aa0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D3FB040E01DD;
	Tue,  8 Sep 2026 19:32:32 +0000 (UTC)
Date: Tue, 8 Sep 2026 12:32:29 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
Message-ID: <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
 <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d1b9ff734b918889eaf8885d64141bc3@igalia.com>

On Tue, Sep 08, 2026 at 03:04:53PM -0300, Mauricio Faria de Oliveira wrote:
> Boris, perhaps the approach here could be changed to add an actual
> memcmp()-like inline implementation (e.g., as provided in a previous
> revision, without return value differences), or continue with the
> memeq()-like memcmp() from arch/x86/boot/ but rename it to memeq() ?

Nah, new functionality is not needed. We can add it later when it is really needed.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
