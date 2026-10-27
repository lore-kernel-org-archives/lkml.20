Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793065759;
	b=hELl/RrLOkx4rlkE1oKop3nK9+fPDciCZZRgm1L4hsbEqHZdsgMMDCkh8w9aigGPUZMl
	 lnXKIXZyC/KQGOrH90mvYuL9Pl0Ey9NIZU7nvngY5K15r84EWnNFhoizLePKmK6eXQQxU
	 Ug8nZ8BdWJnhcc7OqroPMW3A1wjjjkmXRB4IFfoE5BcsaMumHibsehCK7ZTPmfjVQ3R06
	 QdV887EESvez++1L6uv6ZjJ+bo4q8aBIt36InAoBURYvqbVnDm7cgBs+PF8F2B0EHq0bA
	 QCJPp4rciCHwUeQVnfQ/Qpy4zhF8N1LO31bYPdQO8EDqVUqGv9yHMFUcSWtzbH+r5uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793065759;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=gR5q3OLftxCFHkyBKlQqeU6c6KN++ASiwpqlGffKbrQ=;
	b=1kIac03OxhPCBkPjvDMPZZipN517Q6F6DQlqIoZbzTIfk43iEedfpOdxv5abpg+WJadv
	 y45Ypd+kcmC3Y9/zDkXGGw/1Nv//TEvojbnNp260AMYc8Krx/JSKzgyDKuGoSg7uRS4SS
	 hlJrkFTNAEUV4mEuECqPB25uMSF/ainpkLfDp+11qqMVFrfJuuois3++PwBAhx8EcE1sh
	 M5rGpLdKccsKjTeRONS9BRxAO/QkyQwCD6k8MhjGULTh5xRWSSWthEm3H7EWs0z6RV/Vb
	 6o227KpKyxlVrHBFsy8nJphbuRoWIYY/TJfwPM5oEM27ZuTfBZvORwRWl+NfkYBmddw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="RUBbrT/U";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC5B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EC5B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RUBbrT/U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793065756;
	bh=Wbi3NY9WnYJfeKXoxOhR70QLmxw4mM2jPoXXqAXFUT4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=RUBbrT/UfeZQyQKecbvscc15wRIqp19C98IasaXLYH8nwqeGEVK2ly52sqBdShAbG
	 RM0EUZRbamZfZAFyxfRo/GCdoaE9O1Ekzt3c3tTkwBNnwaBl89uypfNFRoughodKqi
	 b4cbG+OXQXPJOjb1EWwGNkO1k9vjiBpDH9nVUUdtC+4y+OI0O/WPGxfK9tpgCmg/xY
	 3mLRlzRDuiHf9Yw3oJU7DKAR1aag5Z8fcc09wG7Rsfg+DjaQIPD7kUNSGDEM+OxYhv
	 IMrH6ueghpO9jyuI/GhvUg4hyfT+IETKiI2R3HpDpdKdxgHVuqiTXu60a0CbCpInPW
	 eErCLtqHNyskw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D429B17E0254;
	Tue, 27 Oct 2026 02:49:15 +0100 (CET)
Message-ID: <a6314959-1287-4381-88a0-2fbc3edbe3b2@collabora.com>
Date: Tue, 27 Oct 2026 03:49:15 +0200
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
Subject: Re: [PATCH v3 0/9] drm/vc4: hdmi: Convert to common HDMI 2.0
 scrambling infrastructure
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261014-vc4-common-scramb-v3-0-c68d58d959a2@collabora.com>
Content-Language: en-US
In-Reply-To: <20261014-vc4-common-scramb-v3-0-c68d58d959a2@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dave, Maira,

On 10/14/26 4:03 AM, Cristian Ciocaltea wrote:
> This series includes patches 42-48 from "[PATCH v11 00/74] Add HDMI 2.0
> support to DW HDMI QP TX" [1], which convert the VC4 HDMI driver to the
> common HDMI 2.0 scrambling infrastructure as a proof of concept for
> reusing the shared code.  It adopts the shared TMDS character rate
> constants, switches to drm_hdmi_mode_needs_scrambling() and force_ctx(),
> fixes -EDEADLK handling, and replaces the driver-local scrambling
> implementation with the common SCDC scrambling helpers.
> 
> The infrastructure patches have been merged and there are no remaining
> dependencies, so the vc4 patches are now sent as a separate series,
> rebased on top of the latest drm-misc-next.
> 
> Tested on a Raspberry Pi 5 Model B Rev 1.1 (BCM2712 D0).
> 
> [1] https://lore.kernel.org/all/20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com/

This series is the only remaining blocker to finalize the infrastructure
cleanup. 

Therefore, may I kindly ask if we could get this merged, so that I can prepare
and (re)submit the last part of the original (large) series?

The only patches that haven't been reviewed/acked yet are 7 and 8. Those are not
critical, and I'd rather send them separately (together with patch 9) if that
would let us move forward sooner.

Thanks,
Cristian
