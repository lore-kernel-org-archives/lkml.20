Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851863BB100
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789780491; cv=none; b=lTST/PF2t54GbAnDR+vMXWNc6lc30zigGJI3ZOjyZVa7wUj6jgv75e83GbibK+70bLH6Y5GfN+XGkHOfV3kOz8Z+yC8ghb5qVlyPIT2R2mk9yHxH8k/CA1Fs675T5q+WjKekN6gnsV4tCrNQyq9nb3lv79hWcWeqaIAVRe87Dfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789780491; c=relaxed/simple;
	bh=tVD6I32X9o09LnLSiCTDoJRb9N9XzkPtf1rrJepbfPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnlUFf5R/Gu2oI2ALVJHvt8dMLF7uySCk/qAFr6J/R6TgRmLhT/FQKCHQbONBwFaPzQ59WQjX6eW2PoRLUy2BiM36l34qiz5KyEHgc3Y+usrhs5tBhe/i42NKQhyWgjptPX/4agLSfgKx1wtvvHXlEAmJKqmtvmYLocR/4IDJ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=FJuy6yhc; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="FJuy6yhc"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1323272a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1789780477; x=1790385277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ICHHulJUCBRD5f9GaFqjX1G74LjOBZZCUQAyH59jdAQ=;
        b=FJuy6yhcPMn+EeD5lXAan5Rt72HBYRFz9Rh9RyE6dCcJh+omUhnFB7YQ9Ib9jtA7Ew
         0zkL8uCF44AeuiDyNmUe7xiNNQdQ7RU41DWeBkY4p/ofo49Ldwz4BUcC3ew/vN3/7W5j
         m5JbTxBxQrMJONQ2kTV3xsmm8uKbElJsv9fsuNd9kBak0qNb+/fM7ZWpj/Munouq8KWO
         hC93qSgxZK6TSf/SQnnrJZbK2CkD0wFi6CJUxsIjtqeAeEuGTzU6+3Ro5GjOUxge2Rtf
         h2gcjBzY7HizMJhgpZRc2NIWAs7AAa/7X7WdTSC47VVkMuiONINpmk1/S29wmaHsjhhG
         GXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789780477; x=1790385277;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ICHHulJUCBRD5f9GaFqjX1G74LjOBZZCUQAyH59jdAQ=;
        b=YeNuxHnxi6jIydSXRbh1VXX83GnzfUBbZGEJTMnORBrRtno5xNa2UIpWR0AhK/l2AC
         HANPd6sGhbSdkSjJQnaH7nLMVQ016D5cehVzAhJjoWZwTnPDWHAfCEOn6184nsJH+nAY
         acpZvk2IREIvoo6IgzYeDOJpIPoBl1PwRmgT0Fs5r0As/74oThTwGlehngzv50DooUu7
         abrQxxo5ozKJBx66maz7VrSnmD8Wl1aKtbo3i2/S7PYXU70Tmp5GSKCC8uFa+6pdbcA+
         mREL3wTgYEj7jW2eGP6wyp3ZpfDHcVaMn0GXtrZ92qYnZiq+8TTC1IpMH+bkEzawRUOp
         rOwQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4OaXI1r0NE0UXbBDm3UJofsvNpjK/b08cXo5O8Cr1IRVh1we/aJgyNx+c/hQGh+8NQiFSRLeksz3wqeg=@vger.kernel.org
X-Gm-Message-State: AFuF++nYg4i7q9X1RMSRh0EYF13NIO3utFr2qt2z+Ajg2IRHyI2CHDLF
	A/fmK99edmVCivwkUB1IgwBdP0ds9f5G+4nKt11mBwfS3OBK0U5FDNlL1ZfTGjiINec=
X-Gm-Gg: AYBFou0GmbDWelGoamezSMbyrWFTMnPOkScioR5mQUIGyCdiqLlwLkpK1CPRDC9O0qh
	Ush1HfO3q/ubo5YxR8GH1rHm8y2l/O9IyOY5PAbQAVkqa3r1uPFhmcCeJkMl6G60QeozdrJ9flY
	4/QqUY5AvnAftkRTg8VHb86z2cApqv5jVqc/av/b3yX+WoSnfFmGKK1pIF3toSqrb3ORsG1DQNr
	7ZenejsVIVxfT6usSZilIyMs0lkqjPyhN4+iVg6Ls8ps94QRb5e0l/l3ZDVIq0kS/yFN1xnKvRm
	vXJalsWzAbVwAEnFbboTYfKI7JKoywqZ+Qvq63I/K9JYbP1RMaan5KTIAusatkv9tv0ORc+MPxN
	OoAj6vfsTlQpdG6aHTKd/Cz7ZhXnV+WqQK+8jelms3n0UmSUsW/32mGy3f1cUIkHPdyxZBXdF+2
	Udr5cQqrPcNYi4XU5/xqiTt81Lz9A9/RxcNwkofxZaE9i2WQOsve8l
X-Received: by 2002:a17:90b:2dc3:b0:39d:e9b6:cec9 with SMTP id 98e67ed59e1d1-39e54d36756mr14388646a91.7.1789780476843;
        Fri, 18 Sep 2026 18:14:36 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:58::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55f124d5sm2722789a91.4.2026.09.18.18.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 18:14:36 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:14:34 -0700
From: Joe Damato <joe@dama.to>
To: Koichiro Den <den@valinux.co.jp>
Cc: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ntb@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 07/10] net: ntb_netdev: Reject short RX frames
Message-ID: <aq3h+iaPkvy7n4Wg@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Koichiro Den <den@valinux.co.jp>, Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ntb@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260914084838.2158249-1-den@valinux.co.jp>
 <20260914084838.2158249-8-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914084838.2158249-8-den@valinux.co.jp>

On Mon, Sep 14, 2026 at 05:48:35PM +0900, Koichiro Den wrote:
> ntb_netdev passes RX frames shorter than ETH_HLEN to eth_type_trans(),
> which expects a complete Ethernet header.
> 
> Reject them as length errors.
> 
> Fixes: 548c237c0a99 ("net: Add support for NTB virtual ethernet device")
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v4:
>   - New patch. Included here to fix the existing RX length check before
>     adding checks for ntb_netdev_hdr later in the series.
> 
>  drivers/net/ntb_netdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Joe Damato <joe@dama.to>
