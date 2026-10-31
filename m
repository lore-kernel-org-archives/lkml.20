Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483049;
	b=bMqAB4tYmtB1OSvvwLDkcWgNnVLPhbeSb6y3ISjMYB9JXfPlyAnwmfhfzm4YtkbDULqg
	 COMnlxdb5VwWqYd4dfUk2eb1mOw0BaGIUyT2lhd+5wCwgiCbMtzE9j8J9RFgpnZ9+ivvH
	 5KJoUgFsOV26aMWCzYgEhHCS1UBgwn8XG/yTsBXoJ1tb1x7u3Orm8u3Ch8Ce7d6OVSAIo
	 ii9eVKgQ3Y18nGlyl8zJv05YoTBraeKuGO2wHSf6ZK9hsyhfJ9Hu99/V8S+T1oKCaWJAu
	 yUQltgoRcq1aGF0KKF72mBaqfTGsszmvU0nhTPwWp12wsaDQUNSyNETIUfunvuAQESA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483049;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NO2VKNhT+Jay0L65Dhd7S4e7LdAoQQCT5ddWCnl3QQQ=;
	b=mSfhkUES2sWL367giXJvYXDdKf/G5Eu4PuZrRbLTRjcuv3hG/TB8NP7SMJ5bTkt51rBm
	 olz7REEGLSPIKp7nfdtzew7ute0Lu0SSniQ01BR1vRVlsSAp+sQMAvmN1xamF13rOWDD4
	 UxmFscsccPfBGRBnV6T/wIG0gYzzQJa6G1p8jYZxszGCPBpK8+o6TKF0mPsYD4/lyu1fz
	 E68Swy+2/d+Vf5bWz6IBNHz5ZYy2Kh5itUM0s3eg2QQIhJMG2e9oSBMHO6US46iQOvxOP
	 QwBvKzE5LubcB/Yg2miE21LFvFb/FSL0l2TeTKZPAy0n6CE0ZzNn7BtImXm6mXXw2BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=kcTeNzvU;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7514B606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7514B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=kcTeNzvU
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 28A3240E03BE;
	Sat, 31 Oct 2026 21:44:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sIETETgL7MeI; Sat, 31 Oct 2026 21:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793483043; bh=NO2VKNhT+Jay0L65Dhd7S4e7LdAoQQCT5ddWCnl3QQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kcTeNzvUOz7RC/kQXCgnn60il7oMtfQIuYyLOs0oCOoy21xy7robg6wwptvfbzzo1
	 YiLNT4H7uB/slayGaxafqRwJy26dHH4KHopSlOzTAgJHPVw3p7RpIOFf9jWFvGfsSv
	 iFKFVEHb0Sdy5l+P+SmTnwildgVciCpfM862rPLOISg98XJZP3lpJwKp4Xg8G2WNy0
	 kWb2VhrRS6l/+ErLABw9SRDbvrkhRdKao2JeEI7ckFXUl0CtOEiXLtDmqKfejg88mJ
	 78wVkWtxQzYlvRDlWRp5zNpaOGNhS+i9uoh+AiMC3gxAC2rpbO/a50ib2mafLH6+LL
	 zYBOUlnzwj6Zm4r/20FYlTCh+s7dRw/SUnGJ2gEvPdN4R0Ddyo17Yk3ZjfiOAL7EOG
	 1Awca/jNuLI6L/HuZaZ8AkYFQCXitcz1iV6ObH6To/lTA3DoK4B5eoqy76BKIg0Yk9
	 +1KZsCT1XzKfV6vev4Pd5wgrB7IeWOe4LudJWBir8LSzhvmmZwc9QsNmYABHMQkWhY
	 XI3tl7PyhhHC5eyFWLDvJA139JlDs4c9OdvoYCg4JN7pEt0OXoYY0aiUsGYy+9CdEM
	 FbQASpLvA/HECf5LddiPooiunSNOSPGHgEhKpQ8clKBgDtihhc3khg4PRyoSrXazXz
	 VSDPseH6Unb29YooiKy+68FY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6A66440E0298;
	Sat, 31 Oct 2026 21:43:55 +0000 (UTC)
Date: Sat, 31 Oct 2026 14:43:51 -0700
From: Borislav Petkov <bp@alien8.de>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] x86: Make processor vendor selection available
 without EXPERT
Message-ID: <20261031214351.GCauZhF1l6ENBfLKIS@fat_crate.local>
References: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
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
In-Reply-To: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>

On Sat, Oct 31, 2026 at 08:51:48AM +0100, Vincent Mailhol wrote:
> Restricting a kernel build to a known CPU vendor currently requires
> enabling EXPERT.
> 
> Make PROCESSOR_SELECT available without EXPERT. It remains disabled by
> default, preserving support for all applicable CPU vendors in existing
> configurations.

What I am not seeing is git archeology about why it is behind EXPERT and
whether that reason is or is not valid anymore.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
