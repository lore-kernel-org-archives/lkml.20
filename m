Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460908;
	b=mXr+x+A9I61KyM6jSXH3oGlJo9INfXkk+eJmZGVgnj+/9m7BYqmpOGLE+K7wAFdc7Ho9
	 y8nsmpPjZzm/80Rt6kOFYbuIpA3Uv3CeCNEHO+fC4rRu/eehwcy54cOPrpbVWIlCs8BRg
	 VwrleyoLLUzG7FNP5Pe08knSgZFJsLFbhRFOSeaPGac7gXMzc7dM5xt+DNDgMACWzX+x9
	 G29sxJXMGLVuksG2Ns05JjmObTIlwZxIwo+s3NqIlPeNhrisnhVRcy1enhP3y5XEJmmMT
	 bp9m5P28womiaIXWtn5YbehyBx3OUf+WWYG7HLFIZ9bckrXUrEDSOPc73HVbrNTyeNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ezGP1Yonno3ZtROnLi8FLhe0PdCDx+ACf/Q9hTx5uuM=;
	b=iMRBsiq55eXwRuf+5ah/KL1IT/Emcd6VM1NWq8XiaWT+jWkKcWjWQS0YfgYXYWwVqY9Y
	 mvw4ZoHu0oszBcIfd3qh6GpyQ6INtGLOTjihfJ0subflMrkOkUTAtT/CcsZpq+qB/ncKE
	 b4xrWvJkEXYIFVeO9u0N3sQSO6LWUfn6lsh1V61pkKFWcukPG4PmjX1fbicCvZ/I26RFh
	 v7qmIcKLocJh6yvRlzQxVFCwUVJ1yF33AojVxEfYRvQ8cTstKBBktqr8wP66O5kImBErT
	 qdkeLgTjuCXB/Nm/Gi+sl/eqX66fG79AIdqCbOR/9mzYRM/VKKF5ouf1zBscj5QRojQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FZkWFoVY;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D726606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D726606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FZkWFoVY
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-354ba08cfd1so4957832eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460907; x=1793065707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ezGP1Yonno3ZtROnLi8FLhe0PdCDx+ACf/Q9hTx5uuM=;
        b=FZkWFoVYsMtjoo4moW2w7KngMWoj4ckM6+YHFDl/bGjZ/ieFwRpf8QXxMADqaL6jCf
         oZ2vFEJ6GWTQ0h0587RDMCGKndR1Sv5wCTQAsh+TEFJUHA+uQ9nhoN+n65iGv2wXnpVm
         zGpR1cJ1E6C1gtBxo0zeZHgULiQ0Jy2kmGA9zYIAe81Jp+aYLLToZQ8iLbGkziFwAM5K
         sMYXKWct0/DIwBcna//boojaxbfdQiBnDmiXu711WywsAgWJuup9m11wjE2izpvRxbC/
         ZgP6PtE6mixlMmzm/BClDggHYm4pxnNogIdIQoTrzwoqpXn7rKS6opG0v1Rimc8cEaDN
         6NEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460907; x=1793065707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezGP1Yonno3ZtROnLi8FLhe0PdCDx+ACf/Q9hTx5uuM=;
        b=XjB6sEXpzAMunae3ZdplAFyQo5py5jAadBCLe86t1HQobx0dEZ7722sn2BF6bDJKl2
         0usXHvHWqMo36UVoqk6zMZXYx8n4Q7Cq5qakr10lAPbs5IW37DeMoGdtiwFe1hSGcFxx
         Ip4F3MvpyKp8wEseCvaOvPSve/xDo+koAZjyuO0Ool9TLmY1ijRkHedUnWxF/VbIUZlr
         kAgLrWDfKtXjSyMBFWyJ861h0iTJQiBQPNjxxA1q/PUvTG0iE6aaq8+PVh1sYm18IFhv
         kQv9tvztA3zHf3WmZVwxvilrdsXfDfSiE+jqXRV1IdJRW97Z0Re62qGYXHkM73jq65Wd
         ZXDg==
X-Forwarded-Encrypted: i=1; AKwUvByYo6UFnJi2rg3t93Kn0Oda4fwM2E6eREQ2VRHlTaGTcIHiQeyDAFKDA0fjRHi+pt+TPF8RqXWpqaeCvu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu98ozOZqFXUD4hxJXHN0EpN7jvfzu+ygUcT7lmMAMSvBLojzi
	a7SORFinfP56SSDdJ9bAh6hqAvox3Wg0Y9WfZlKGtgN2GDXpTp3eJYYr
X-Gm-Gg: AYBFou3z/hwk5Mw2R25nbkXX0XsDr4SZI4SU3AQMxnFXItEzfatUXOqOpvU/SeRq/nZ
	sv+QaCKhF9bKzAJxLM9xka+ND/p+Mw8UyxQQa0CDzwZrBdc6UM2ADuxVBLOTolzMIqtfO92KEYf
	sXqDNkTMPbs2riAW8uS+KZn78esabfwpdwdY0TQsNYdrJz1dalL31sIvlOsgwEy5JWW+3jCa3mv
	yiWPjT9J062D6D/CMc7rJMscQODUs3R/7+v/yMYhON+oQVg+ndTPjZVX971yyoZN51L2hSkpNGw
	+s6YVWFDJ3JwvQ43vW+B2cab8HjJVmhVzQyiekftcyc3rQqbtCiX2LBWh6PiAfhVlWPPskzDOuo
	xWEyjXAcExCt1o2Jp/L7ecs1tX7qRcCZnMutM7M3JEoey92QvP/P7+jE45mhVDc6hNqC2PkzNen
	UJ5JMOJo5MBVNN5WQ2MEqGBVzblMKc3wPweC7jDvS5sQXQykL0MSz2PpepNDb1L0nU8M/o/1GJ+
	Tts7z+EylsB
X-Received: by 2002:a05:7023:c087:b0:156:3684:96d4 with SMTP id a92af1059eb24-1851238b5e7mr13733617c88.25.1792460907214;
        Mon, 19 Oct 2026 18:48:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm28699903c88.14.2026.10.19.18.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:48:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:48:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: mediatek: add MT7629 reset controller
 support
Message-ID: <4606c758-16ca-4fca-9a0c-babf15643b49@roeck-us.net>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-2-c124bf9ac273@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-2-c124bf9ac273@gmail.com>

On Sat, Sep 26, 2026 at 07:14:00PM +0800, Chuanhong Guo wrote:
> MT7629 currently matches the MT6589 fallback, which exposes reset IDs
> 0 through 11. The MT7629 CONN_MCU reset is at bit 12 of the SWSYSRST
> register and cannot be requested through this fallback.
> 
> Add MT7629 match data with 13 reset IDs to cover the CONN_MCU reset.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied.

Thanks,
Guenter
