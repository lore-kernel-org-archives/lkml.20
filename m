Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116479;
	b=rAFC+1Ow4x1i8+GoHtl/tBI3ejMdTYD51gH/9Pd8NmhyTmz/gPKbj4SA7QwYteiHSvj8
	 3YOeaA4BH53aOW2AJvUqmFKuGvmeriAFcTTx0vhJknevWtzg5c5Nbvx5+Z4cNURAEQrzG
	 mAH0op3u0JVumbFY5LIGLgZxMb9vBa/PxFHljt1ZDWqUlPGRyI35iQu8pflsaf26oM5mh
	 VEHXENkRFNj6KJyhqzmK4oTdgufr2HXFRvi1B4wMhbOPZIJB9ExFsD1f0Ze9BJ7f5+aRV
	 MB22g08nxmUw6idAtDuY7hW90MtG4ei6eBX0p8PNvE8UUezNX6B7E4tggBxOtT91yow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zq80UJ+hgfJc//pAabUCEXC8s+2mlwefGbT/4AIXsFg=;
	b=xkiNgN+3F3bA23W1DrY+g7J4G2JttntQWbB8bPQBQVFl5xRyNr+R328tLdtol1Qsd9Bo
	 mAIv2vUWd243IID0FMc5IGw/ADdYd0MJRXYH2mYuLi+rXTUnj2tb9QZG3f5P+yzPJ4PAw
	 KVE3qhHY2WhxejC2xNjF/FjGgrKpgKGgcSsa3Dw3qw/Q4T7QjcNA1bXpR7zR9GOZPIWpV
	 nq7UH2WvR+n5v7/Hi7vFpdrxXT5fdrDDETIKDNpRvISiEFyJZOWfrk4EGAiRg4L3bFhPE
	 YFk3xyiUdoBHmSP23hkvUKXxdEwS3/NjY8929JKnO+aTw79SLkDeg84KLAWkNgKG99g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=usjqEqVu;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD65606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD65606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=usjqEqVu
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-353804b591eso41438eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116478; x=1793721278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zq80UJ+hgfJc//pAabUCEXC8s+2mlwefGbT/4AIXsFg=;
        b=usjqEqVu78QEQn13ICMVK6hflcxe5IWpfrNyZNQ/eyPM4bh5V1cLo7QerESF5sjzUL
         s6RSUypRHHd3ymB1zguVvnsDKcnUJxYV5V7aEFbSlySPrxXyW4mSvzSB1al48L5Eq64l
         TKHWvjX2K/0jqsj6XGbY7E2c9O+uTrdN2GmIBN5r+NdQcG6iteq1pOxZq3mHd72kx9tf
         /AdLdgdFMjga/gQ79mm0JMO1N5CkGLcSaGhSBFeHmMFK0Y4vXg43aPKKISHj4GqaNibH
         PgBDyJjnpuGYl7ijmp1yCKizmJ6X8OGS5LH6EUyBhShATLl/0722K8D571HvyENMl/Ys
         9tpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116478; x=1793721278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zq80UJ+hgfJc//pAabUCEXC8s+2mlwefGbT/4AIXsFg=;
        b=u3JeSnb42ZRImNbuWiRBYMMmhYIzpWP4a3O4ocSYvf7YR2auEQBWoaORPJeY/zsFt6
         DihJa81RfOAwLNl2x/9ytdo1zjNuZriEQ4ybsYRaOJt0X9KXno4Qxh5AQrd41Hv40W2d
         jlfdIXBGVqEtZytmJTJi7xEvK/FgW8E87g7h+K++EkaJQz3q1bUa7VpshJPNZfKHFpPE
         oVmR2FPR+NgKlLVnHxDB8F+PHb1ZFcafoyhxcqHgv76hxKvnJhzVt8102jtVzfvtQWEy
         MFA/R4X0wL7BYLvFJnI3W29VdcTnFxm+TnKpYgael6X4EEYlpntd9GVGW4DcEYpPaZ9y
         quWA==
X-Forwarded-Encrypted: i=1; AKwUvBzR2hm8/Vwh6nxW8yHDnSzrZLrnUQ3frBM80iX3/7BAUBkAZASJVboNRHeiTnuLCKv18m02IbadHnq8OnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIt8Nt2wA5gj4/THcgnmNx3HsN2k0Gv2egMbbh9t1fu4Ho28+ue
	o8w54IuZyWKBZ5E7e9ElSgbc4hhKfvg8Bg3hhnW8w80eoCDEwKFxqTB0
X-Gm-Gg: AYBFou0WYJYnTzupad+1AlnvmfAJt4fahaCT+gRZVNl+6LkoAoaBRM6SsYcAubXq0zU
	vyZ6XMeUsTMfwPNpC2q22jT4XRTg8QoI+f8WeacuIGJidoWlVTuNsFsY643N85gAv+BWfJwK1mi
	y23mHCGzc3OsfvNf1xdskoQ0csqnCRuVSBsT+ZH2CZywqyedmPLy2vUCMeu4qsM0pQCKkmDfm7r
	ticHteXNs+iUMsUEwk5C4rzRo4/HbTfn0DteN1/c6+eU/k3yqsxbOCJ217WIYpBDVzKy9t8mw9A
	wvhZjZyEQCRcwGDpM2ua0kWDnsHXGbgM8M3EB3SmhYDvjSZZ2fNt4KbBQKku2AUlCxSUpeC3sgU
	SB5dQpbv+XOPDUy/y0lqyh4hnAkZQjgXSplB10w+FO1O32l+Zukm12yERcs+S7+c10xnhqek4iF
	dVCscGWqHadJjuIBbfYF7Q3xmkHtfHkFw3soasaPVevef6HoaOB1x3rivkO/FL6TDG6WC8yCwTJ
	r1+tog2gH63aTuJufqu+SuHEF/ufQEtAIcoavcbFK6/GPyJTVcWU0R4vVz6P7ZNpNRM
X-Received: by 2002:a05:7022:3b82:b0:149:1b5b:1f25 with SMTP id a92af1059eb24-1993505e533mr15180431c88.15.1793116477644;
        Tue, 27 Oct 2026 08:54:37 -0700 (PDT)
Received: from yocto.amd.com ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5937dsm34071951c88.20.2026.10.27.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:54:37 -0700 (PDT)
From: paritoshpotukuchi@gmail.com
To: mlombard@arkamax.eu
Cc: linux-nvme@lists.infradead.org,
	justin.tee@broadcom.com,
	nareshgottumukkala83@gmail.com,
	paul.ely@broadcom.com,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	linux-kernel@vger.kernel.org,
	syzbot+df0058a8d0bdce7c4059@syzkaller.appspotmail.com
Subject: Re: [PATCH] nvmet-fc: extend critical section in nvmet_fc_remove_port()
Date: Tue, 27 Oct 2026 15:54:18 +0000
Message-ID: <20261027155418.2005768-1-paritoshpotukuchi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <DMFPJJEAQDER.1LTPXDFP8FYUG@arkamax.eu>
References: <DMFPJJEAQDER.1LTPXDFP8FYUG@arkamax.eu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I don't think this safe.
> nvmet_fc_tgtport_put() can end up calling fcloop_targetport_delete()
> which calls flush_work(), therefore you call a blocking function while
> in atomic context

Thanks for pointing that out. 

The current implementation of nvmet_fc_portentry_unbind calls 
nvmet_fc_tgtport_put() while holding a spinlock.

From what we understand, this seems to be a design flaw,
since flush_work() is still being called while holding a spinlock.


Paritosh

