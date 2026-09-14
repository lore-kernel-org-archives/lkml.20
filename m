Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774C939CD1B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416395; cv=none; b=PG88zMMKKFMu3djpgfAwt+o2RU8iocSSJpiesUsTvPDbT/gBTa7RDg/V5w7/jP4B1t4Kl5R9FzwX1UIW0An46CQTjnP3hE5P6HREt8dnaiBs5MfL9tpO7tzwxj3G86qQ5d0mRVuboXqi3/LWkms/4z6VHCsYUn+5FyiDHdEAILE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416395; c=relaxed/simple;
	bh=pbfuCer32EFke61basoKfT/u18IxpodVo5YuWUgUf0w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=U4SqfoDDJPCByK8TBpWOsqV8NEuEUcV7TVNXD6xEXGK9w4WpwoibtfduJfFK0W4a+R4zhQDEG3PRrJgGr3b35vBliSI5ux6VANkbkuzX5BxpIvSW+hcfxqHPfx4GclyN3TTFeWdl5ri6naAqF3sOce+pEk0nVgmNtzU/SNuRcoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HemtjLNa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HemtjLNa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBEC1F000FF;
	Mon, 14 Sep 2026 20:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789416394;
	bh=pPqCPfuyxQlDdjmdeyS0KXu2sKKxkPJsmqBlbxxmr1U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=HemtjLNaHlgTSZN6z2PzWNBZEYTbAKZEk3SmLKY+qxVSxTysa1nSJKW60n4QIGFI1
	 fDjFkZAixXVmh6Nc3hDc832ZTD1v4z60ZQ9msqffVFNb4B96FzcOxrYBJrIL2Rm0uq
	 cRC1NVo1WB1YR2jZ4Vfviyz8sUyhw3lMkqOKorgtIGysUT8qZuVH6j9WKSI6Mu27qM
	 FH5uNLiCNXqAQOLQgFEeRBpt42jvHAmIt2hVwsJ1nnJ0RMaBUrFoq6HcghppY/Mwyf
	 R6hCssaubkIGAjjUET+8MSdD1s2vJ+SQt+4lXRkdfgs17ky3wiEiDAo6p2+xyZ8glH
	 6jk49Rf8PAcyA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 3E6AA198003A;
	Mon, 14 Sep 2026 16:06:32 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 14 Sep 2026 16:06:32 -0400
X-ME-Sender: <xms:xlOoavKPlaJ-yALHvHz2Q-SMSTCwneQRzLeao6Ww_lWNCQi08fIM_g>
    <xme:xlOoat-JqAM9l8HMzUKPriT8yTXP-MQ8v3vsn_X6Hik8aIgujakyX4m3SgIMzRchO
    bFq8xo095T6txaZ-Ztu9ruzTrxrq7BEC6ryh8BeX8hdNfFFOI-mL2mWnA>
X-ME-Proxy-Cause: dmFkZTECI6tzmPfbEfVsRAg1Kx4eH1bwUiI4Tc8shp8r6XYCQ//dLhs9WFBH1QvJp2xaM5
    /1TBLx72kGdMCe8BsQwOIgphG6Ah9Adx7TBLIuP+qL63i03R0F5RCve5zrrAtrbF4yj0aa
    fIhwvsSS9XvCELbC6ZIoK72OqRvMaMzCM0AgXQsRAjxq1dKEruADNv+drTl9Tdc5mqYcY1
    h9Bv1REtYERvk8r6fwxLxD9aNJTzJdVCcKzmMBn2TMB/jzwJtLb6FsdeDL1Lw2jKPSChK9
    9FtL2kxJCYlRYf0F/DWMRvvRgSpPQIVQBm6i6/9pHBc5M9DnKWlLaLveayYrZLB6YHUVI/
    1OII3/LyV+DrJmXVWytAKe3VPV9a/wdJadA74Kej5vMHw7e2/zxZPsw+qxJ5gVoNikbaC+
    61XyjKyjn86MNvOFwjZ+5nu/VYLow7HCwIWSZYTvfFgb/nuJBOd5V2XkU0Fwg+poP2eiVF
    8sYEdmiJQrtzmrGpdajKKIjzSXxsWkXZdJ+yonh2VqmInf4evfxvZdDnIxKCXPhwyeeUPh
    iJ3+//9trt3fNowGLgG10SePTIMkwN1swZQYeaXY0YfB0eFfJKXfYCCc6D78FhfVhS4vLq
    CPKClLuPIYj/ptUog9I/+v4vBGPHrcuh7c9djo992+w4UHEotJ3eYy5ywTFg
X-ME-Proxy: <xmx:yFOoanz7VnqFMJNf1AeYvSoPIdxA9EBxSuwaNgr3JjICpjLgGfBsZw>
    <xmx:yFOoatGJanQKfO8z3KhtSfXrK0j3Wob1B0XdHuc8cYwXdmQ-BrhGvQ>
    <xmx:yFOoarypG0ETvGuBl78omVJWAVTpn9YrcSMibumUhKjAAi_tW8fsBg>
    <xmx:yFOoaut6LGPT0eiYBhkhXGqr6h1fbys6AV9xsEi6HrF-vnIhdZUPVg>
    <xmx:yFOoao2L7tKzTR6aPLO7Ka1IbDlFstSSJ0skhfBU4EbaoE6PfRIShfUX>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D689CF80081; Mon, 14 Sep 2026 16:06:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 22:06:10 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Melody Wang" <huibo.wang@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Tom Lendacky" <thomas.lendacky@amd.com>
Message-Id: <8e4b05a5-61e7-4015-ab72-1e55156e1772@app.fastmail.com>
In-Reply-To: 
 <d0b15a9b5f6e2199ff48bb77e9396044fa96dfb2.1789345277.git.huibo.wang@amd.com>
References: <cover.1789345277.git.huibo.wang@amd.com>
 <d0b15a9b5f6e2199ff48bb77e9396044fa96dfb2.1789345277.git.huibo.wang@amd.com>
Subject: Re: [PATCH v2 6/8] x86/sev: Register the guest with the SVSM APIC protocol
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, 14 Sep 2026, at 02:57, Melody Wang wrote:
> The SVSM APIC protocol supports 5 calls. SVSM_APIC_CONFIGURE_EMULATION
> (shortened to SVSM_APIC_CONFIG_EMULATION for brevity), call 1, provides
> the controls whether the guest can make use of the SVSM APIC protocol.
>
> Implement this call, and register Alternate Injection for the guest
> by default.
>
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> ---
>  arch/x86/boot/compressed/sev.c | 17 +++++++++++++++++
>  arch/x86/boot/compressed/sev.h |  6 ++++++
>  2 files changed, 23 insertions(+)
>

Does this need to happen in the EFI stub and/or decompressor? We have swathes
of early SEV-SNP boot code in the kernel proper; could it be done there?

