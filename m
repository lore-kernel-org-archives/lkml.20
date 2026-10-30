Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356681;
	b=HqDy+HF/nW1cMphtxhUkRdLkdGuXCSXhhWbvHoEfOThDDB58BU/wAwmU2khD9jStzJgz
	 ZiNwjPkRkCC8lcSe7X7vYyVu3WpFJlJ4SCvNJbPOeWKbb+HuzRQEbZfHuPEdD6q/yUnWF
	 QP6OGwOy/QuKCjdzwapsYOZqwwgYx7Y1hyDeTZa5C96Da/CHzKnU9H6CqVFSgTWCDAq5X
	 Y9xV4ninO53ucqE9lSmgplt/3Kt6/UXC8K0HaVIWYCOwtNgzh2dhNFabUFv3QHtk+OH3E
	 4cUVojqP6k9roPAOWuJ1Nu/ksDnSM0poOFD3NKoccxVmWG8LMfu7QZjqQK7z5pIHrtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356681;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-META:
	 X-MBO-RS-ID;
	bh=SfbowGU8+zvwq17FTuEev/To1GaQJjEXXQFNhkfWinU=;
	b=o01eCI3PSm6qQYK0shlL6PyM3uki8IS2WhNLUPsjAViP+JjRcHnGqwDyPuEjeAwAuh+Z
	 QeSqKTcbfauZPHOj1VLogBO4rjmw/Xy5nFLF5MpEnc9voaaJ/iqd52CKWLvbWa4zNMfMg
	 7ByPPBD4gKwQF0qVBbcM07wtFg2tF4CZPJonLHxch2gGDAv+c5+rV6CNW26n0rKLqPQ8c
	 D1EBzt58a/aahgGO5gTCrA9TFOJSetUaR70yqpGi0hVZKq0EH8P3p1CtnMESSKM5ASWTW
	 RBdxQ/+H4apzTltJVe2pTX1c810K2AAUPC1p4DSehOd/Bx0bds1H7ocq9tXnBR1cy/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=winSr+tx;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB31606A320;
	Fri, 30 Oct 2026 10:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AB31606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=winSr+tx
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jGHcH3GwzzMlbY;
	Fri, 30 Oct 2026 11:37:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793356671; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SfbowGU8+zvwq17FTuEev/To1GaQJjEXXQFNhkfWinU=;
	b=winSr+txBnuADjaMUZ9hdqYj2HQVp68/Jn+KEM0UHCmy6m9viBAAOPL7u7wrMk3tZ8KVS3
	iT+OMRD03n8OyQdVQyxDsD1zT/+zJfwPQB1GVv5gDoFWMWXo5kinu3b6rv8TdSgMpjU3UE
	bZrHhFgUOYgqMu3AtO5cuH3KR9FzrvN3ILHETazkOPQJeC81MwMmmcT0ecks2GAg4E46YT
	3nQFVvnCMOQ1p/6DXQTOf8OH7wJkwr+ewDWsfKnCz45QqcZ/yr9/VegB/YaGEBysstIjq3
	nNdLX1mw6UoWhl2QJ5KLjP0iEbtP35ncGCOWQPWfnoNm+V++nTUWvCAswuINYQ==
Message-ID: <ec1799db63823edadc573cd162e721d60fc87bb6.camel@mailbox.org>
Subject: Re: [PATCH 1/2] drm/etnaviv: etnaviv_fence: Put base class first
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Lucas Stach
 <l.stach@pengutronix.de>,  Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie	
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal	
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Fri, 30 Oct 2026 11:37:48 +0100
In-Reply-To: <20261028103129.1036380-2-phasta@kernel.org>
References: <20261028103129.1036380-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: uxy477boyjn9j791yzpg1pq6p5zrhigm
X-MBO-RS-ID: 7c4ecb2865ed2b71141

On Wed, 2026-10-28 at 11:31 +0100, Philipp Stanner wrote:
> struct etnaviv_fence contains a struct dma_fence, which is its base
> class. The base class should always be the first member of a class.
>=20
> This allows for removing a deprecated callback in a subsequent patch.
>=20
> Make struct dma_fence base the first member of struct etnaviv_fence.

Applied this and the following one to drm-misc-next

Thx guys
