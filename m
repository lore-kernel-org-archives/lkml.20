Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775888;
	b=XPOpu39tpjTnNDLrqyLD3wKoPHsBpDct95yvv+hX77rBrfM0OYPd+Q1zy4XpWVc8pv3j
	 EnNd7Vy4u9lyXOznLP1mSohkZdRdHTmzeRMeHOBq5iKsc3jxkPg9XiIk2lLCKPjmtU2t0
	 o29axjO95a7FINNWULINTWE3v3zI1ZbE11b2itm8ODme5MQ2G3xHOZEA+fix+oFX/K1f+
	 FOxZAvBdGtEqvMjnlQHPxm2kFOIfdvmczlCboHBrPAuX+bkeErq8ImeIpW5sVC+xwkFtp
	 hZzggqBUjGh9ZFQ90vntrlij+VGK84qwL28UCTOnItwS22CpuyEplIXYX436lC6oOVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775888;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=mzOs5klzZsM8DpqoUJkRmjxNxFZASEQHOw94+lLwCGA=;
	b=WDLoeRk04uFe/WCLl7vrMzvExtvSZw/wtVYJanjofeU5LtzV0lLo9guIoqjT6trJp/Sz
	 hfHYaG+ZqyHXwXldf4K012DOHE/ALoXoGAVxYjKW10dh/MAIhiWHOFCKFU0M7OYZnVPeR
	 8iQgMnk9mPBZgNKMZK9xfI7YNVLBl4m3P2qPIpM71+CQBEw0DzJO+XiR2/Ce3FnPZY1NY
	 TSL2Uq3URlcQRWCRTEsMAPS+5+KNgPSbeX+KWzmD/o3T67io3S+hleKCfUv8ib42g8aB1
	 Wwo8+DggD7wUlsebB8t1RAE7UjY6HOC1JmY6+k1aZjRYV7P75Gxy+dC0HZ7NN2f0MoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=zlSOePED;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5689606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5689606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=zlSOePED
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mzOs5klzZsM8DpqoUJkRmjxNxFZASEQHOw94+lLwCGA=; b=zlSOePEDqRn4Zo4UkzqpUSx/w5
	JgSMLMHUQZ97X3XIrSM/KIzDKoua1s9XMmvoYaRP6vr7fal/+zIm+mFb15i4OmRDyLrgOa1ETZPz5
	ynwuGz1Dz8iOeE5cdEGF7+UgBP0/yRCP1bzgpLUyONv6Orsgw/cMpu10SBQKqHjE/GBfUYmGmJSBA
	UOpf/+9CQ8/zYA6lEvGTDvhKGUEgsq4/wZCR9xBLjyg63aiS6kfhgPvx+SmPtJjXu397oYbFLkZNr
	VNQYza7sKMrLWBOxyKCQO6fw4xQ5QoNcLu66tZUZsZDm0v7Dq06K3wTGywPrfV3hg0R31Y+EeQnvA
	1BlxRdVg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
 Guangshuo Li <lgs201920130244@gmail.com>
Subject: Re: [PATCH] accel/rocket: put IOMMU domain on BO creation failure
Date: Sun, 15 Nov 2026 21:51:18 +0100
Message-ID: <Z8-0sxgbQR2_ndmAA6Kohg@sntech.de>
In-Reply-To: <20260708114354.753817-1-lgs201920130244@gmail.com>
References: <20260708114354.753817-1-lgs201920130244@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 8. Juli 2026, 13:43:54 Mitteleurop=C3=A4ische Normalzeit schri=
eb Guangshuo Li:
> rocket_ioctl_create_bo() takes an IOMMU domain reference for each newly
> created BO.
>=20
> The normal GEM object release path drops that reference from
> rocket_gem_bo_free(). However, the BO creation error paths free the
> object with drm_gem_shmem_object_free(), which bypasses the driver's GEM
> .free callback. Those paths therefore release the shmem object without
> dropping the IOMMU domain reference.
>=20
> Drop the domain reference explicitly on the BO creation error path before
> freeing the shmem object.
>=20
> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


