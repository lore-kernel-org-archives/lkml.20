Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63DE36402A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539263; cv=none; b=ev7+rvFodGVvvLBLd5I6RXdNLPjYpvLbZrTWY8+qBJiqAk0bJfUz85IrP7kD5LyscEfFNesUU7i7da/z4SzLPv3M8EkFRi998t/mxZiuoeoxKr/vxVmTaK2bbVIkmOkRPfNWbOApPetolNE5GbNyG9dTDXmd9JEut7A6oAEmkBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539263; c=relaxed/simple;
	bh=b3E2k84QQEGwtviD/HyyfH8SNZuxyZTPnb62hGODMfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k40rGiIj8atnep/nVyU+U4LSXm8GO9MvSxbd69qHxI5cSmxb7PnWZt8RSQPsIwhnb6hxrDB8j/c+A7wYhgZ6l9T/0xYOM0ewdLtTBQMTsv0f0pjSSIR9GVF1y+gowW1EBHroW38aSQ+9TVnOT2I4AjFdy2mi/OpmDQOnAGwzgWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LifvRJ/T; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LifvRJ/T"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2db710396ffso9468315ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539261; x=1792144061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ux6hJESR9kZkvYlx2D/IGwLIHS0t2PsKL+AJPtGbIUU=;
        b=LifvRJ/Te8TXZyVZlXveRGo0NndHSIBR0tX+qIUxA64VtXjley/ekSKBaNZyMezZZl
         b3gvPb7ywGnXz3wRcpdiPplazJlDQ8nRRE7hoBef9NAP0+0vrICcKZjUi+qfQ1vhWKeO
         ZshevIoyPDKQz+mh4PFcWuvnn/OnWycBOaMTlxwi/sCts2nm79nQMlE3ujeJGwb5hkpW
         SCOMtkg4z4wY76vR1//y078Vng8yPBrsqNP1FICqpnFvUagHgTLFTE7iQyG7shND/s48
         wTFEzxQBZtZYW0IDImv+cpD6+b+HDvVctSbN4DvB+niPXWiS7NQE/bYec9TtnAsTg2ns
         5KQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539261; x=1792144061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux6hJESR9kZkvYlx2D/IGwLIHS0t2PsKL+AJPtGbIUU=;
        b=P/UUl3xX8CZ26FSHuJznUuTU/N3z9TMXSAUE9gS4GPiWIzqKcHirdS6Zr/tmjEz19l
         9cxEgBaEztHEBxzl7Qyed10DoikLT/XKv825t9b1tWI36XdXTVfN0ZSwNiBJaX681vyz
         gfUcIBnpSXafHwtDSUaEoxCU0E44a/Qd9UrAqBuZ0fiJiuDKrzv2l75uvrwtGhJiiatb
         l5fKHB7LtEdqXGBuuAcEHuy1GkHAA6W6rmgkx/ucR5ZNB1xjehz6CcV7IHaSujGR3xu/
         dV/jFxpKpzpj8zQ0VycGJEmUYZkl1NrsHj7nMy69DOCQdWPBMbKvvS2vIfzSG/2XGFzW
         gLOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqSwP0OxZCZQ9A/7zr7T4T515kh/URjdGBvulpjUj0DWiQkM01l5Nf8J0jQXJPPdpsWH5pfcuPxclJGY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpDuWB8f0lS0Sz9+RnK/dWlUfY3s0jX8fGUsaworpH6G8X9Y7Z
	58RHjgUun0C/TcVQihXy3D+J2m+ZJIrZF14+Dv8nmkIvd6jR5eOJ8wyZ
X-Gm-Gg: AYBFou2yaVxOFcb3VA8g+tBj+qH31RXsp0TyOYrFbHdrMfG9si8eSv1k7Z9jFiCd/Nw
	k3JaZ5cxo+VKfoDn8pK4oNMkq3TSXdmdRGsYhjQ5zPctLVlKBbUmg69eAtF1MUR5NELvFxG6Eim
	LuCzoAya9GA84qLNkViZUSEKY2eS3eSN2SQg94oaB3cHd0MJxvsKbVOn7UAxRpq+UXeysnf7Eeh
	xZGo1sUIxU830y8oZeq0ScvdHRQanz0IAu+DZODiS9q0iLlguYB3fuF5zyJxWKundOfce8/8jyl
	Gc5XsUFlwbmG/jh4ovMJxtd2IDLuR+xJ49EcXFe1NfdCOUWNRY29EwQkSFajQCd9Rl1uRWAHbum
	kfotQ1DJ9m0oOOFoUIKtvjS/1h4sAj+HYIzpt8J5lA+vm71nsNWPRdMV21sA2/9WUKtD/6rY6Gz
	ECsQR2rTtXzhqTyQh5O5mj24VP0/3LQrHiM1tftharSA418xiiPilI/HJZYAcwZtEYv3rP
X-Received: by 2002:a17:903:1b70:b0:2e6:e9a:eb48 with SMTP id d9443c01a7336-2e842f2d257mr7768075ad.41.1791539260811;
        Fri, 09 Oct 2026 02:47:40 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b17basm5833635ad.42.2026.10.09.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:47:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet support
Date: Fri,  9 Oct 2026 17:47:07 +0800
Message-ID: <179153921381.259252.9054877756385260471.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
References: <20261005093749.645014-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 05 Oct 2026 17:37:47 +0800, Chen-Yu Yeh wrote:
> The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
> internal PHY is only usable through the optional USB & Ethernet IO
> board. This series adds an overlay for that board and fixes the name of
> the internal PHY node it exposes.
> 
> Changes in v3:
>  - Rename the PHY node to ethernet-phy@1, as the commit message already
>    said; v2 only changed the unit address (sashiko-bot). dtbs_check now
>    validates the node against ethernet-phy.yaml, with no new warnings.
>  - Drop the blank line in the trailer block of 2/2 (Hiago)
>  - Collect Hiago's Reviewed-by
>  - Keep Inochi's Reviewed-by on 2/2, since the only change is the node
>    name
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
      https://github.com/sophgo/linux/commit/627e4e43e555ba252f93784eafff74ed82234c63
[2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
      https://github.com/sophgo/linux/commit/673f8e66d5edf424eaf599c8051e0f6962605861

Thanks,
Inochi

