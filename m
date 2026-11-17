Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888140;
	b=jD10rgPwBfXQGxQTaCBhs7aloVo54OOoLVe10LEmly9GCHVA+aNed9vifFz+3yR2RY54
	 ++TS98cmxD3+VTLmdcvsK4qR4uC3eZga72K5e8W0yqhzVfHGG7kHW1220CbG5H6riMFKl
	 /6zeUAF/enXouQXc59acxtaeL9g1vjGXsgD81l2oBfhNGFgiJmLPZ5Vqx97j4KyqdFh6s
	 LQtSSa/WVuRnqea4lZzPD1qpOnN8WY/OKIVYCNJBO3YNwAOowfp9ACm8xJcVcJN02uP/v
	 mEBKqHufJ0xyRImiAYBBRIApQoLSVaRSP1Rsw1JJHk2XxS0L/T9vxUBFRNkF/n0cdgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888140;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1mXmtjfaSxovkfA3DiMEsdihwIzJ53S02iXGOJSWh3I=;
	b=d+G5b/QmG1pnaFPNLzFesDP3+QMyFRDEccT9BWm2T8+ycIO6PcLW+O2ZJ9SgX0I0B8fO
	 S2/Faxc7sCkd0iydWM4r1f9synybVlU6ufGdQGJAYHloL2gwNY4MCoxhX506Hm/5gBuqT
	 tYxBPjpeI74hRa0NGyxM1jm73QcWueNA3Ip4Rgo1AsZdOp1X6RHJIEj5TIvwyr1ZqQMdb
	 J+5MPD60ksT6/xRPcF2iMA/6x3dmPXd0/Sy8u5BK86gsfdWhi0vsAkrHWiYzIvAN1Ano2
	 rYYYN3o2sISyEEc5HRbG+zUB91sKTJwq4VjHMrGMsfyrVcSBYp2mo7QxaU3nmokDnQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hJ6y20sv;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A2606A31C;
	Tue, 17 Nov 2026 04:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hJ6y20sv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=1mXmtjfaSxovkfA3DiMEsdihwIzJ53S02iXGOJSWh3I=; b=hJ6y20sv5/W26cMd7/Shs7e+UZ
	HWN/llRQ58epXk8A0FM4R1KNXDb/sWji69u0SrtrBnou71ohSs11KkGoKD+DzHYHoowFNXGyHEkot
	oQiwtZn6hoRZLR2tT3dXZsyipg4PtTe4D8jQ4YEy1Qe1EuuXkg8KIJXdTOfBqYyAAeviHjsONGQ2V
	hwhbgjgyPidFjTS8Kw0B4ZLv+Vz9djov0vNm4OQSROiBJ68tzIGQmz+1MfUybij9W3YAopMU7peZ8
	y3xZPFHfJeT3o+qDEGXMyFB+Eri5aa0RJyr6Eag3Qeldq98Ob4HZLrKQOyNMJoG0wdZ6YC5p/TkYg
	6LkPfX6g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAOa-00000004WMu-0n4P;
	Tue, 17 Nov 2026 04:02:12 +0000
Message-ID: <c5d64937-b75f-4795-b3e3-7d15cd5e7e9e@infradead.org>
Date: Mon, 16 Nov 2026 20:02:11 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs: porting: Retitle
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 NeilBrown <neil@brown.name>, Eric Sandeen <sandeen@redhat.com>
References: <20261117035004.12262-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261117035004.12262-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/16/26 7:50 PM, Bagas Sanjaya wrote:
> porting.rst is a technical reference on what changes to the fs subsystem
> (since 2.5.0), not the whole kernel as the existing title may imply.
> 
> Retitle it.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/filesystems/porting.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
> index c38f5df755bb50..dd5a55e68ba7b6 100644
> --- a/Documentation/filesystems/porting.rst
> +++ b/Documentation/filesystems/porting.rst
> @@ -1,6 +1,8 @@
> -====================
> -Changes since 2.5.0:
> -====================
> +=============================
> +Filesystems API Porting Guide
> +=============================
> +
> +This document details changes to the filesystem subsystem.
>  
>  ---
>  
> 
> base-commit: 2138148bf44fd84d3e0a863f0e8cb3627cdcc606

-- 
~Randy
