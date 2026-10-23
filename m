Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792763563;
	b=eUARnDHS1owwRHP09NdmObLyNnEPJGb8vxmeLZprLOju4SOlGbT8ul+HIbR7uUINtuZB
	 9nlDpipmzNzfIlXZLkLAbPBexNmQAiA0Ptjqqjn3Te/9iA99KU1SvaxTKV+ajw1MxUujD
	 pnIxApHMFhu/ERY186GvjwFZwRPy7kDkeBxLOe+AUI2NozFTSEbaT5/T16+bJXf4UqAcP
	 wHkBICLFF/CDaBUG42VW62SoyJBQL1529U6ovjH5Bb5JVb/zxaj0AglI4XiBHMcY/ATRS
	 joZ8Ga+PGnyboILRQdFBTA6IcLX7k1HVCOPQNtWhZkM4aMwAMRCoMP+0JgaKpizWpwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7xX2gKagSUBvZ+dsAi1NUa1T9ybCAiN1NSx6inwuTp4=;
	b=h+e1T/qgDe86qykgoLo8tjtD+hOwVbeYn7bGcjWt0ajijRGxSAgc15w3egQOCHyWIRQ7
	 986/+cM632kX468qURM00B+saSFDklpRWeENuMSCTqa0yqWNHf64xMcrMCUf4JpjK/q9r
	 EmN9wZxuPLo+nFlAqycAoQa5DO9mjDBRSdo/R1wQn3LuR5lRo5HogGJNK1d0bj9kvbY9g
	 nXGiDgUS1shpwUxlIOCcsLes5g6NlDAgmykRtEeMrhjWVZeC9Pr1RlXUYHG0gqjbd2boJ
	 mdjLME8oGsvwQoUhddkAd1862OlX+Q303mVY7YUDun6GxDmya1lzuC7HqY+3fKit2zQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LMh5TxHY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D417D606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D417D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LMh5TxHY
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-18ae3f47c26so1512c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792763562; cv=none;
        d=google.com; s=arc-20260327;
        b=IGsteAlZul68WkLA1P6Ii4J0bWBhlaogtEQR4VLajZsJkGnnuNbX5gXjJKtah+NPXH
         /+XP0unXLfA9k5hMtgOFguakiGvxSMCBV7WjPkGlOBVFZidbhyKMzXFEXN++6OlV7p4U
         7CgZX6WhgErv+0AhdFEj8upmHqwkA3bpHyM3gxiH2xIHF0o/qJ+rL5v1pPkwWgjVHPK7
         8LbeCPR2mtQ6M2r/x7WzFAXip2XBhSwsQPJ9IBdOSoIF9LRTve6iMceoxUCu5rnLM/NM
         4Z1LqI40OQ44x+hTDlyZKHAsvAB3ydxdSFkHa8dH4e7WAHIGLnFV9A8gSfAa2avv+xEq
         GazQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7xX2gKagSUBvZ+dsAi1NUa1T9ybCAiN1NSx6inwuTp4=;
        fh=N49dwlUusHzk/7uQJWRD9rQ5YK4BVwohM+qEW8OZCjk=;
        b=k7we5FwbGHRGlXbiSPoJm4U1pQ2Q/aaEtdycBijswpI2KFgQCoMLfulJxuTybvQPpr
         QRKyLIyiA6OGvZtfuje91391STEl4xlYD6wmPpNVN5/wHFOB7XBymUV6DGGO2MGK3qMc
         /8JAJshTUlJ3D1B4/V4h37qi6Ek6ETKltD+QY8ALDeTo6efXnZgUIC5zV9sy02kt16kV
         bmvhNkLfxyue7CmkXMqiMQwO9x6ddOPJ71gO6QKNCC/zEEqb85GLRZlnLrZ15iftPrfj
         0pH+ShekRTE7K7h4t48yP5mt9rIVTOj8ysfPAiMrL/NxKEQR2z6waryL0T7F6Pf7mpAh
         hLyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792763562; x=1793368362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7xX2gKagSUBvZ+dsAi1NUa1T9ybCAiN1NSx6inwuTp4=;
        b=LMh5TxHYPVNwn0knYhb15IscyKFf5bitBFBnu+m3p43jQE7EenXmM+CVHVV3Rp4zLa
         aSkXeG02nQ+4ktdRBQgeQln1i/KdVbMpeFoMKVy3TKtRaCv26+gzzXWaHe5ykPqgxfFE
         Xo3xLYPs1TuLS4PI8yvP46UBpeiE6EECTrCey/GZkVdzn/PXHR58SIDjNkbir+srrjiZ
         0UBeGQ4l4epXOIxFj60MnnQuBQ4axBVWq+ddrRsT+WT06+SLd+/AzyZ1ldaBD5QQ2bNJ
         Yk2tAiJXBluxyEjk0vtY7MknCCDHknZt/ckJBBe+sndU3CsK72wmPi5nKy9T5X5tYLqe
         Wxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763562; x=1793368362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xX2gKagSUBvZ+dsAi1NUa1T9ybCAiN1NSx6inwuTp4=;
        b=yiDZNCcUHAipOIRVq4ipCu1/W1azz4dtV7ufCiixf2o9N9vv3YFHOaosyKxckRa2YJ
         GWsduGR7spRXp/Z3H8KMVNIWTrDBbpBfEwyVmcFgd2QxNM+LDCkctTX3yf8bW6CHzWS+
         /vJDWRUo6zOddMTr2AnMUMQsX6G8ZhIOAEZMiHPq0c8ug2CMnmUl7iOGB1rUJw64v53a
         gIibY4Yi4rh6miSFcGFDqHSVM2f0XLXmvEqfCzHYb2H+rH9iUOQyB6GoJHhc0ejYg083
         TNUTqGip9asymhH+kKVOD19WbLvOxkioStJcNVzbsQ+eBAhjF94q/njBKgKnGreBqoXD
         mxNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBauTMPdrfhMa/qBw7USou+Ux2rR6aEqObyM8yz/pIFo/1CXRdPO8w74Q7H2CK71je20IGWDTP+JnuDl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrzFE8FtBXNgZIxRzwtFcfv9sFxmwhwypUpaXfF7Q94AHYrNG/
	ZkakMkldc22AXEc395YXQRnuAUUxAp7n3KIAbZW61ISuyI5iJkFZEDX9wmvQlPbXR7h7TG5IQSk
	IaMFoKH8cuq2KbI+Jy1be1nNeqcQk/gUfTlOZvYJl
X-Gm-Gg: AYBFou2ys5vuVQaMpop5EEwHu2McoAUYtp8U+lEgZJhe5kndtak6MHMbv1Pm0rnGbZ5
	ZhR70TXHvyk+W1cy73/k1etG4gJM2Z47x3wNBSxxTeq7RIjO51INK4UnvwMtbu88RIipLbjhsM9
	xIKIQqDQlM7ecPm+PmCSxE7PtkGJPeP/ZaZjmk6/qGPs8kjgtseUwxeBMkTpTuLJOqFS5S6yVeU
	74dm9SpXdVpprSYP/YGthQua3136TffJ1gguLl9MttFktQALPDC7KaOf6dF4QAvSqmlcHyeGBYP
	yi6idO44hU3GehRKk5IfMVm5hEBi2fkrHQIFqUNx3qeAVh43Vent9B0mfR5sAXK2zhgb+rTpinK
	fsHMLyUONY2BYo7n/Luzgu+x0b5SQc93wxxuffVVPMiUMWw9PwqQ9t3SirJ4=
X-Received: by 2002:a05:701b:4286:20b0:139:90c3:391b with SMTP id
 a92af1059eb24-195aab5d822mr340982c88.1.1792763560566; Fri, 23 Oct 2026
 06:52:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019210604.2433620-1-lrizzo@google.com> <20261019210604.2433620-2-lrizzo@google.com>
 <90e0df20-126a-4429-83a7-77f95234cdd1@intel.com>
In-Reply-To: <90e0df20-126a-4429-83a7-77f95234cdd1@intel.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 23 Oct 2026 15:52:03 +0200
X-Gm-Features: AclHuK8IMAai5WBO8HJ4NB1eQHErdtx-3lINsiz265g3x7G0go6ka2kn-9-9jcE
Message-ID: <CAMOZA0+pLt6rsoc1RRO3-TB7SNSUVbEAnMOitDrqygciVvUu+Q@mail.gmail.com>
Subject: Re: [PATCH iwl-next v2 1/2] libeth: add libeth_rx_alloc_gfp() to
 specify allocation flags
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Brian Vazquez <brianvv@google.com>, Joshua Hay <joshua.a.hay@intel.com>, 
	Larysa Zaremba <larysa.zaremba@intel.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 3:35=E2=80=AFPM Alexander Lobakin
<aleksander.lobakin@intel.com> wrote:
>
> From: Luigi Rizzo <lrizzo@google.com>
> Date: Mon, 19 Oct 2026 21:06:03 +0000
>
> > libeth_rx_alloc() calls page_pool_dev_alloc_netmem(), which always
> > allocates with GFP_ATOMIC | __GFP_NOWARN. Drivers also use it to fill
> > their Rx rings at open or on queue reconfiguration, which runs in
> > process context before the queues' NAPI is enabled. There, the caller
> > may sleep and GFP_ATOMIC is needlessly restrictive: it can neither
> > reclaim nor compact, while the initial fill can allocate tens of
> > thousands of buffers across all queues.
> >
> > Add libeth_rx_alloc_gfp(), which takes a gfp_t parameter and passes
> > gfp | __GFP_NOWARN to page_pool_alloc_netmem(), and make
> > libeth_rx_alloc() its GFP_ATOMIC wrapper.
>
> If you'd really like to go ahead (I'm still not really convinced, even

To be clear, GFP_ATOMIC is not a problem right now, but it becomes
a problem if we try to back the buffers with 2MB pages as in DMA_PMD,
and those 2MB pages may not be available without sleeping.

> with "O(100k)" which is not that realistic),

On a large system, which is definitely the target for a 200G NIC that uses =
idpf,
we can easily get there and above.
The system I am testing now uses 4096 slots per queue, 32 queues,
meaning 128K entries at initialization. Under load, the pool has grown
to 197K entries.

Ok for the style changes, will resend an updated version

cheers
luigi
