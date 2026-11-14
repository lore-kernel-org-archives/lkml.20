Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792018;
	b=FJ7bnsrHpXWxMtBQ9/6hvHm8aUcGXmN5WTyjBO457YL8qK03BLyLVhZw+BaJXSI9+gqw
	 iEZrZiVKCGjswOr28j9NjnmCHsnsM4sNNcq09AH/R8IjTDYVJAiBtPuAm09ei6zpaix3W
	 TgG8CpFUoqRbZdxqrf5bzlM9jqkheXyO2x1+E9CdbUZowENXhk/NKO1ML1Pd0wDbiUgLQ
	 fHc/0SAui8kG4bklLchxewo8clYailLGB98qvc7zwihiCJqOZf+Qtzqobd8olhqVjcTF+
	 0RJ/FRL1aLkHZYbjO9iVSJAqU5YrC8JOEC/J+rNvBK/xA20yY/joL8lg50SKAKFl0Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792018;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=dWm0RA0tqTSQdhSoSRmxYRJkKHnJc3RlGD6s85ZFy6o=;
	b=iT/IQ2hrjyzxVtzg4Lo4hIYMaHQYMVx49G2dzSpQ5vWlcbzXh2R107LbBnw/WfoJSuPw
	 psvjn122bV+xRCMGCHNYmGdUt8CtLPWuoPiZKAUMvPn/JUJ38MiK+cjHLb6sQfdxin2d5
	 K8owsFPamd+rJEMM1YECLyrUVPKmDn2a50dtXOtjL3k0MRFjpaFHBeXNEHM3jFS/QNNi4
	 qX/Hk7d8PDTAn28b3TN7pMSTKq1Iqan211DgFVOiAOXC/zHsKCBfd5oCx7PoYKR+0RNIh
	 t59sSzq44lpX6hTsnu13xBB5bGlyQt+R+CpACyfq5LL1T8uMZl0VizEIt+277DqOnng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=NkpujxrM;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0442C606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0442C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=NkpujxrM
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE91310ECE5;
	Mon, 16 Nov 2026 02:20:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794792009;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dWm0RA0tqTSQdhSoSRmxYRJkKHnJc3RlGD6s85ZFy6o=;
	b=NkpujxrMWHvpHm5fXyGZ4jZJd6IkJyOnFtBYv9hthQrvQQH+xPgGUzZUg/z36bh7FsdTtw
	Q/FogVUucUP8XnscyICVSkneDDNsUFVM65R9JkeLI3pepRHkYK2JlaUx+pOgbheXE+xhXx
	9oFqbVd7YqXzen7fzurK37eRhYYM3UjPFHX72E1SBswuqvuZcXmdtyXSv2FNi0JKimnLfu
	Di/8uZxX+JYTmzq/Fqfcv4Hmdxci3dilZLpLYqz8rz0Dw1dmVpzmKjtHo4pe64AfuybM30
	HCYtj/u+IG5vuGjfWc6EC9ZtD2WOSunsfyFW5xeGd+Ch5dYa7x85tADcCAHsYA==
Message-ID: <293083d1-1085-40a7-9d6d-1776ed649238@nabladev.com>
Date: Sat, 14 Nov 2026 17:37:55 +0100
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
Subject: Re: [PATCH] Revert "nouveau: pci: quiesce GPU on shutdown"
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>,
 dri-devel@lists.freedesktop.org
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Li Chen <me@linux.beauty>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ole Carlsen <ole.carlsen@tutamail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20261025213027.842978-1-marex@nabladev.com>
 <aviIPk4xbKhgqcTy@monoceros>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <aviIPk4xbKhgqcTy@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/14/26 5:20 PM, Uwe Kleine-König wrote:

[...]

>> -static void
>> -nouveau_drm_shutdown(struct pci_dev *pdev)
>> -{
>> -	struct nouveau_drm *drm = pci_get_drvdata(pdev);
>> -	int ret;
>> -
>> -	if (!drm)
>> -		return;
>> -
>> -	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
>> -	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
>> -		return;
>> -
>> -	ret = nouveau_do_suspend(drm, false);
>> -	if (ret)
>> -		NV_ERROR(drm, "shutdown suspend failed with: %d\n", ret);
>> -
>> -	pci_save_state(pdev);
>> -	pci_disable_device(pdev);
>> -	pci_set_power_state(pdev, PCI_D3hot);
>> -	/*
>> -	 *  This is just to give the pci power transition time to settle
>> -	 *  before an immediate kexec jump. it’s mirroring the existing
>> -	 *  nouveau_pmops_suspend() behavior, which already does
>> -	 *  udelay(200) right after pci_set_power_state(..., pci_d3hot). In
>> -	 *  ->shutdown() we’re allowed to sleep, so I used usleep_range()
>> -	 *  instead of a busy-wait udelay().
>> -	 */
>> -	usleep_range(200, 400);
>> -}
>> -
> 
> I cannot reproduce it

I can surely reproduce it, because since Linux 7.1 I cannot shut down my 
computer, something which worked since the beginning.

> , but maybe it's helpful to find out where/how the
> driver hangs. Adding printks might be enough, and if not, remove stuff
> from nouveau_drm_shutdown() until it works.

The laptop screen goes off, the machine is unresponsive this late during 
shutdown, so adding printks() does not help.

> I'd guess this gives the
> needed insights to determine a fix without reverting the identified
> commit.
The problematic commit should be reverted and reworked, since it breaks 
existing users. I am open to testing patches on that machine.
