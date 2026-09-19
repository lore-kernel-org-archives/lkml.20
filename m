Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3C41ABEDE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789782426; cv=none; b=Igrm6ASVXu50wQJzg5YKWzH4QznZ/WawcWyNynMdOVY8HQlJ9psSJmBOblLm3YnvknELih+ME54b2WVIAX4FjaLl3hD1CzjSJcIqyjpN51G5+wRgxDK8bbuk5FHDww6c1kq8J7/CS9A3eUscmOHNstnxSm5gOdpN7tvNhDr0baU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789782426; c=relaxed/simple;
	bh=g8QfnrEqUcs4vN4eChvt2BeQ3M31SRLU7+CBgJ503Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4CWWLkolsHQ/bNaAqsuiTStYl2Wo4+kIiZ5DwA9aklXNgEPkPpMtbRXQIRQ1BQ5gRkxXU+sw2bim5VysnevOvDdixMeUREMJiq1FjIZthHwoFcIMbyu/SK+2qJJzYlBZBfaoGiuKvVQQz+CZE2sAcj9o6psaF7rofvmmEvre4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=AjWzlTdx; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="AjWzlTdx"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BF8C040E01DD;
	Sat, 19 Sep 2026 01:47:01 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id z7DbkjMpjY5r; Sat, 19 Sep 2026 01:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789782411; bh=vT7h7hIMvAs3SbVeBoKpLslJ082Fylpa/XFlxua848w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjWzlTdxQbuLtZhPkmwoxa0IefxQCPAJOUPcJEH6F+LySaFzGk/pzvibzt6T8b/A/
	 U09IvS3NGcJdBW1jvJZLmdc387JwMpKHC3+PAy9cWGSOAIYS45/z09ur2Ikrg8waiH
	 BssctBHtCJFWOSItF9qNvyi0tU1FQpWjP3RKHqMQqCGjgfLlYgaIgvqQz0hNMD4VyX
	 ECoFbfVpdeqcJq+BUivCI7lP2RhOu0HpitoqG8guAsZCcjfh24HSrr5dRriMsesdzN
	 qLXqA3UEPWa2g+wbOGMR+6O7TF3rSq4AsbJV/Lyrz6LmAb/I2+FAH7eYALN+m2dAKd
	 UXIPE6vMEYAHjvsWfJZhSHI5m/V/n/8PCx+SfX2jxXChFxIIhxzqed8pSTUQ3PFEcL
	 QDAEyG74gT5CJ9vD0/FSCjHcAPc/UDWQ/b9N4JusqQonle6mC3+ZSsh8cvGR1jOI6G
	 BVQiagdadw64mvjhGZ9A6fp4eeivVyKcai7EwKX06ynr6nJR2Q0BVZR2z1YWujx4sC
	 /hYD0JKN7boqh2tdCDmF1A39g6Gb/rjZnKL9IIN2aicQJlr0xqLaqiNeyVkPXDFiF8
	 G6StGP+8+owyQsopXi/MqEHfk9A/8EA1qG4Vva32Smgu83mOO17GGhUOzCe6K7s+zd
	 V4WQN6NDzERq+hlt5/uhvU/Y=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 38E8940E0173;
	Sat, 19 Sep 2026 01:46:40 +0000 (UTC)
Date: Fri, 18 Sep 2026 18:46:36 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: "Naveen N Rao (AMD)" <naveen@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH RESEND v4 0/3] x86/apic: Add support for additional AMD
 EILVT registers
Message-ID: <20260919014636.GCaq3pfAUqGTfIK00d@fat_crate.local>
References: <cover.1788425679.git.naveen@kernel.org>
 <20260915002940.GDaqiRdNKYpyKgL2_B@fat_crate.local>
 <a064f4fc-51bb-4802-966b-2f09d3009bb2@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a064f4fc-51bb-4802-966b-2f09d3009bb2@amd.com>

On Fri, Sep 18, 2026 at 12:33:06PM +0530, Ravi Bangoria wrote:
> All the preexisting IBS issues reported by Sashiko there are applicable only
> for the very old family 0x10 AMD processors. Given that, it may not be worth
> addressing them unless someone is actually running into the issue in practice.

Yeah, looks like it. Let's ignore them for now.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
