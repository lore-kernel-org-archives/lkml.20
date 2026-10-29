Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300558;
	b=BFj3T/hIhPFrAotXMG/JGpgKt8+zj9ORXIEM5Dx28Hd7GGljA27rOVjG8VCJ5csvWrGt
	 PhAhfDEDP2EPQZDSQWRgQ51is5O+VkPmOgARASx+vwSScrMICu2bd6QEf0SZHGcNRbDQT
	 iWjD4mqAgT8FzMgUPccpf71BAR+lNYkNKZFnVxKiF+Ac3mwTNM74JvLX74qriB0Hcyn3n
	 vKFa3dIbapfhTmNyFgzWfgEcFEBQnbn15OCVa87OGmxIBnmu67pQlf7bYLvWH/rRQqtP1
	 9z32XoLlvcpQ6Ur7kOm4Ckph9HWf7Io7p5Ml9fiUPzevGRDY1JHyHyUNL0zvRv0ShIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300558;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zrGAc+lTlkMMWvQFd6GgNmeFlV86Z0O6Et+9auME33E=;
	b=0QIzGDdTRmxE1rEdCqxbiA5HjQUMosnj6D26hPQ3ABD9GXseCdjaFSsvBhRfQfY0lV87
	 UKVvR8HK63T7PbKRDBAwi0eGL32cV4nsfbEwuwvLBFnfd/ww/3kzY7WoCQCsKTOhBwg/A
	 bdkbVepFae699QOYhqt7FxUiV+39PBV0k5IojnjyxSN5i+8jkpiIsHbLKmlOZqfrvQCIp
	 jA9USW+kIDCum0NpOmSAMwnIuZT7AhMnvNmXBUgQK8go2X4Zp3RC4kpAY5mOucIYfTO0Y
	 /ZN4f3CcmEnY4YkHe1kYYxn/ELzvx8c7iy7KApPiBSoZ7RltFIJMrw29I5twl/3sX3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=CyIQkzSc;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AAD606A31A;
	Thu, 29 Oct 2026 19:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37AAD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=CyIQkzSc
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D5BD740E04F4;
	Thu, 29 Oct 2026 19:02:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id N88clBYcNWrB; Thu, 29 Oct 2026 19:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793300551; bh=zrGAc+lTlkMMWvQFd6GgNmeFlV86Z0O6Et+9auME33E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyIQkzSciyhyp08ApvaCwaGrTJul957WOfJdWRdCC9ELkdNT6pCFZGl6MhCLV0k49
	 XdquakvENYJ3O0+DyQ2WiMQpAzGkAnJUQGORzbFu6aq/3N9fmJrLVRf99u8Z3MwGJn
	 skBndydE7gYSFsIDy9PontOCFWELhOGpZ6p5U7HX27Qt0V+GUmJ5QwqQ/RKM5LCx81
	 xZk+YiBMJwsWtw/t1WUwxZh59v9HO9TxlCI89HsIDjk1BuqGYlkIfp+XnFdY5XbgPE
	 XFBDOMbpz6r2z/afppl2wzjgN4TkaQJJzPEYpzvXFZRUJJBOPHsN6XO54L1lQrDn4K
	 n6Hgavi6DdO7JwY2qYWxnvk+Ci2e7QDtGT/+OTdIy0E+51tnvtI0a4EUSACMTYrJ7G
	 l/mS5WHVVAucPLEXd03Kycrg1lSCqauRjE/pIh01KrZzeedIVHPoKslHn5vX+MWECx
	 xBF3iI8Mi6EUFqa0FmNZ8I0SniYT2mgLv0uLy30J7NqoiSv4ldt62m9Cp7S/iQyDTR
	 fm8aC5NLXO5YyfnFZeffPBYK/tDufATvG+uLp+mQgGd8tH4Volqf5OX6F+N/GNMV7+
	 HX1t0Cl3wjItwRW3V0JNz2LroKFlQQaeWsBwyGZszGPwAcifOd7DvXZshQmsRbzOS2
	 IuPiiCkSplVCUv4VemM3U/r4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 43FBD40E04D1;
	Thu, 29 Oct 2026 19:02:23 +0000 (UTC)
Date: Thu, 29 Oct 2026 12:02:19 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, peterz@infradead.org,
	syzkaller-bugs@googlegroups.com, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org
Subject: Re: [PATCH V2] x86/mce: Serialize sysfs controls against CPU hotplug
Message-ID: <20261029190219.GFauOYO_354pb0ot-n@fat_crate.local>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13>
 <20260817235553.GAaoOfieqJBZTsAn3N@fat_crate.local>
 <20260818001840.GBaoOk4Mz_mmZYK2rK@fat_crate.local>
 <878q63lrqr.ffs@fw13>
 <874iec22sf.ffs@fw13>
 <87y0bhy5h8.ffs@fw13>
 <20261029165636.GA5110@yaz-khff2.amd.com>
 <20261029174646.GDauOGhqHXpndpV5BL@fat_crate.local>
 <20261029180801.GA96343@yaz-khff2.amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029180801.GA96343@yaz-khff2.amd.com>

On Thu, Oct 29, 2026 at 02:08:01PM -0400, Yazen Ghannam wrote:
> Right, so what if we deprecate this legacy machinecheck bus and put MCE
> stuff under the CPU bus? This could be like cpufreq and cpuidle.
> 
> I expect this would need a lot more changes, but the end result may be
> simpler.

And it would need at least a decade to whack because of user-visible ABI.

We should remember that proposal and point people to the /cpu/ hierarchy when
new things need to be added there which are mce specific.

I would prefer not to add anything ABI-like though and let that stuff die
because it does not belong there at all. But that was done a looong time
ago and we're stuck with it.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
