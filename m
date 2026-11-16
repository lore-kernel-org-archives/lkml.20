Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818754;
	b=LAYB8IUzbaAyI5V1VN1+3TdApi58cS79UpohADcJc8JhpZo5ZXR5lwqCsqX2BkBYKyhy
	 x3nSovgBLXNe4SeKsNk073qqIDzbRZ6/w7hXmuC4lFGEPSP/+2zjMVt3JjXWdh/+LUocx
	 eZw4e1l1e1mCivmKegpjiXqc5dM3lx26K5u7KuvS8GBffsqTz+CMmZ5G0D9u8ZxlE39iF
	 /9v/XVVYRA9vd9KVqZXjp3pAZrmRRgnzGgVRveXPPHMv7mtST822bEg80wthauvz4BNlj
	 P2kTqsUWyWD/WnnghcLX/ShhOkYJvrYWAHg1XvZJ52XRTcI8rO5cLNuQZJoyPdRaWHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WC45cvJmF2+vLRRaWf8G7eSygIPFDRykugAowc6yYyQ=;
	b=EWbCWLzK2woz9O6S3HioB4hiykfTpPeJ4L53Rb8UD6gqhdjFSP83YFpMnhUa5OiU5yDU
	 cY0HPeM+Ej2CTzlLD16vlZoJy8XOI6vrWkVHzRBsk7DLQsocTKInIQptI+9vg+L++XBnD
	 JJCIunI4fCzvTcHKTp5PA/+y8c5U00XOtHcAvHeY8qAyWRcGiVGIwa6Ob/e2Gwwf6meO8
	 3U5KGzm7VHLU9Jp+rK7/HMX/0jqIl7aRvwhHjavcRv2IYZo1ptT+IRJpGB8TPAS19zUjr
	 ZuWQm1D+txM4gRtp062Wm1Y+lFdPYDdeFJ14Xow7PtQSGoCZjbxXKFm6Qcmd2q8KNvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mfWCzUD2;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA91606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EA91606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mfWCzUD2
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1550138a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818753; x=1795423553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC45cvJmF2+vLRRaWf8G7eSygIPFDRykugAowc6yYyQ=;
        b=mfWCzUD20XoHTyhJrdA/ZDc0C3u9p2/1bR+BOIRJx16yop9RgjULiJMtgbNWldqAgl
         blLlA0yfgMsq8dZhGIgTYdu1rMKbEgvp6dsEh7HCpaPuvhVo70fxBYdFrZ4Rngl0F05g
         3uj0to7InMh4/RJLqvCggt3QRft70z4gYqR/cNexn1AdEfcE2w9QUozPHe6SIaQCFdi2
         +Dz4KSgYFPLkCeYt2DfG4BGRSqzt58qy28w+AqoY7OdCjZ1eoqWL/umK1UduZUI8gmpP
         V87j9gnCF820f4ijVeh1aXgZ/kg7JNG710CYOWus2ck9pH1RyDCbLyeyqEZmZ2JpZFLg
         1n2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818753; x=1795423553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WC45cvJmF2+vLRRaWf8G7eSygIPFDRykugAowc6yYyQ=;
        b=0CC1dEH18UKi35lbV2zFn4WeaH0iMF5CnbFdJ9MKw5VIuutZQcrj4hDa970NByxe/Z
         Q2oSL9MJ6+uDIX17iWrbv7Kise1n7QBH88HWsLWiYBhiaeOyH4OJqXtOu88fVM1711FV
         Xr49EJlFzjSB0C3pU06cvu9TkYgpR6+R4E6jki6sxdPNsN1PB5u2LPBpKpLoDJgr4edg
         okTAM/Fv7cn87PEXyG0n28nqyEP6JK9u4seMa+LVH1WPLmeP7RHzBS5zcE31O2In0lEl
         bCJrEGrjJAytG4oXDqItBu829+DIyFqnusD/UEF/QMHItkj1GiONWTJrE3nNIyzg28tM
         54aw==
X-Forwarded-Encrypted: i=1; AL+hErH/HtG1MBQ+mGMRW2J32Pe+Fqzq9z4HfSnXySKaa3RfQz/8dgF6m4eMeKGiOnCWbsGls3xgwXlI0XDRRwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LrH179kue2N9Rg46l5xCB+U5rpyGBxqDcoeumxx23miaUagPm
	4csT2fnhxCMvG4s/S66U+NUf/dh0mkQqtAt9vlJ6FoT0/d78bPubYxI1
X-Gm-Gg: AZFdTZcP0gOAW4PlCCCcMAcfY8ZaRVe5sqzpLgEhE7RuzYEfvFEY0M8AXyAQEu27thd
	tRaZpLEt2nkCZ1/4+NuKbpsSCub4nA29N72yVUzLQes6d/06dDqvn1w3iywTZah+uDeDbt3x4S5
	3exHi8w/4x+D1P9KArxC4IsRZGle1Hc7MnOFDWDb11x7TSGZRGYfi8H0p4Kt/tNfwi4be/DsHYg
	J8pERfTXHlM3hR6+QvPbWCq0MYFVmWkqZR95sFHotqjefSZ//wZqEVtxprDfwiVI4Jz8WkM2Z66
	9eAkNt2gLyC9a//Alu7TQBjJAudW+twbwsJdaDWs5Q8Yi2W0YJNO6XFAUeUcSyIpepJ25gHXSWr
	Ovoq6Opn98zpyI/4B4gmRxghSFt7DfY1b1C+TnLFv1oZiQR6vXhdnAagaeFy9bjRzGJNuz3qh/2
	Ts8RQt9UUZCpf9o7A6pb+dgjzu/DjNyzwyG5HtxhtNfKicDMUzuIKHtYmjsj1J3BYMnDjsz/8kE
	7ICr+JxAtiVS5OmXJ69GjahthPX32Yayb37NuNMNzF7rDu+k7d2QVs5vbnPtVWt4oLztDBmJhbE
	Fwy8wKTLwrs9cV+RZAmw1q7kqaJ2imy+O+k5wO+8YBYGnU0cNpZ6Jgfo59M=
X-Received: by 2002:a17:90b:4c02:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1b0da3e56mr6437149a91.43.1794818753152;
        Mon, 16 Nov 2026 00:45:53 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:90a:5f11:9056:5eea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm8861987a91.0.2026.11.16.00.45.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 00:45:52 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ziheng Wei <zihengw03@163.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: mt76: mt7925: fix mt7925_reverse_frag0_hdr_trans() for MLO
Date: Mon, 16 Nov 2026 16:45:22 +0800
Message-ID: <20261116084522.88724-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116081440.1011837-1-zihengw03@163.com>
References: <20261116081440.1011837-1-zihengw03@163.com>
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

Hi Ziheng,

On Mon, Nov 16, 2026 at 04:14:40PM +0800, Ziheng Wei wrote:
> +	/* not every WTBL entry is a station link, e.g. the global wcid */
> +	if (!status->wcid || !status->wcid->sta)
> +		return -EINVAL;
> +
> +	mlink = container_of(status->wcid, struct mt792x_link_sta, wcid);
> +	msta = mlink->sta;

With the check ahead of the container_of(), the global wcid is rejected,
and wcid_to_sta() resolves a secondary link to its station through the
def_wcid that mt7925_mac_sta_add_links() sets.

Reviewed-by: Zhao Li <enderaoelyther@gmail.com>

Thanks,
Zhao
