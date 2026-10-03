Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11942339377
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044616; cv=none; b=Z2DbgjtMUysifewXtl2HJmtQ3xVy4FqmsGd50Z3POOWqlkPPzB/YqyEh9H6JwG/PcrE8H/PaDHg9DZkwObkF6BRGvH2BeYljswDViVONt4K0XOV7Gr45DQ6+jayLbU5LUf/hAkZ2fuUaDYzy0VNTvaD0yMicMlU7A3u7bFFHk3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044616; c=relaxed/simple;
	bh=vgdhw8rACnZl7y0Wg1EtOUtcX8opsAU4+r/FkpeeN1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzimuSeMkHssFwEOGapbl4gmAH6M6IHpLQqVAhIIO31GeancfU78jG5rpU8HjSiAFoFlqyRKT7e9KmrIv+T1+yy8EyF2dbKBtrQ0HkS7LvbL7Igx32q7DQzK7H0k12Pxgo2si4xWtiiwUe7W7eLLkdSJs7zkgGiKWuYP7MvwkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DVCnUW8m; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DVCnUW8m"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-154e9d2d979so32125c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791044613; x=1791649413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxWbkNMJ0gxrVSfCconXVhPE8tqLr4BtV3xGSiKP/9w=;
        b=DVCnUW8mDIrBI0sxxcwwHhvOXIhDL6gv8kV865zpsusVbDpJIQYXKf3iNI1W2OU5bb
         eZ7WgE/0UvN5oRML0M6Z+j2jXw7m1NBvs3r1BCZhSSfQx48BUo9NCpTmM5+Wgz0EauiW
         Nu5fB/h5fbo0ZtPI5oPkMXs3Z1YB5KPPXIrDVr7ZrBSW61y/VgJhlyXhnRSwIZvoDAJZ
         LmtGYhYjppO42xeJQq1L4YG2mMwNa3xnQSfAMbbPR7BdwstuKhWpt0CUxCETcHazMM9q
         arhN3MCSk1HITukaBWJcGAC77aP2WlYeW9WSi5yDnMl4XFjHHnY2p9SLL4OQRE2JL3UQ
         3XDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791044613; x=1791649413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxWbkNMJ0gxrVSfCconXVhPE8tqLr4BtV3xGSiKP/9w=;
        b=RpaoeTR89ujbPQ1vfsPLnmgY/MsYY74Q4m84M5HFmJVXOKOAjo+d/vvjSvJY6p3qQZ
         qm4y2yKXep7i1V1nzUyIN9cIB4GWKmlH+FBckeRzuPiSP6raMK4MwMi2qfP6aLnZCCab
         dgs6hBu9txpThAzjWclFuThJROD283raS9/FQSZiAcagI7p4FFiE4EMDzqOuIPOhOfw3
         zAYo1FWbX6dn1YvRHTDcUQ+eC0wLhoOsvqw1rbN4K83K+D6oHh4aHMKJgjq3rldJQXZ4
         Nx82RIDoBefzfp6DLFskyH7/99ByUkAVfogKIK4gjfkYd9SY45eWA6Tsqz4Q1W7Tu6+E
         VgZw==
X-Forwarded-Encrypted: i=1; AKwUvByUqol/aqS70+3rljmFIswg60pBr0Yi6K19XrWGzB8UlbJGgROCAp4pn6eiLVaT4ko6TqbazOIusZ5Y5Qo=@vger.kernel.org
X-Gm-Message-State: AFuF++mgTDQyC7frFLpuz4OLOuPgmvgMczIwk1Aoiz5Zf56FJzTg//2P
	WdqDuXmtwbnzlmcXyHfomB0XHqTUL/R5zjjpFh+FBUkqVijLMzAY2S1RTcTYMa/Ej+o=
X-Gm-Gg: AYBFou2cQJWyaIDkCAcleQwnlWLf/WoWMZ5/IW6w2chUCaus9YKKbS1RZ+1Jm1zKriT
	xf8LvjwDGLK7EYL3m/UUL5oiBHkYk7YGwAQq3YN2kf/eGWJfQIZ2t2KNVbbTxiW026rW7NAuCRa
	WTPfX9xM5wXYWwFZf8/ZPmnsRgH5kl4iMyYiObRr7aS0siTteagP+s9OgG9bNPdJTyAWUr/R3pU
	kq4cweMfChup86mUjoJ68QNYANEHM1BiAuN6kPHXTMECEk5cHwDvBzGent2ru9I/4aW4mizgflK
	E8J7Fr1XBl4sYr4LVt07dPMp87ye3hPA3iUigdm4JuiFZ0PeeFmOw15A/ANOm5Ub42F2l9oYudk
	ukN+F4+YzhisbDn8E7V0MRJI9PUcx9p70+/t+BY5jFUM0QlX9rKTrWmphxJJG7uXWcdftJeKoPY
	qBVuVC85R7aNf9xi3i+ai2cnr9KQ3rJPesRikAJCgZm9DPO8FOCHoq/KH7uQdijxxA3/IPhBnBJ
	a1nn07EctfDnwt6jJ6nQd2/6Hh7IDd4DKk+V7j11zbq9p6/DfhYq2brh5Rtlg==
X-Received: by 2002:a05:7022:4386:b0:152:97a1:dd36 with SMTP id a92af1059eb24-15297a1ddc9mr3493127c88.10.1791044612830;
        Sat, 03 Oct 2026 09:23:32 -0700 (PDT)
Received: from hiagonb ([2804:7f0:9541:40e1:2108:ffa6:f94b:baff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3511d87cfa7sm3498737eec.26.2026.10.03.09.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:23:32 -0700 (PDT)
Date: Sat, 3 Oct 2026 13:23:23 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	Joshua Milas <josh.milas@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy
 node name
Message-ID: <asErZOk1RtzqC7Ao@hiagonb>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
 <20261003084627.353899-3-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003084627.353899-3-chenyou910331@gmail.com>

Hi Chen-Yu,

On Sat, Oct 03, 2026 at 04:46:26PM +0800, Chen-Yu Yeh wrote:
> The internal EPHY node is named "phy@0" while its reg property is <1>.
> The unit-address should match the first entry of the reg property, but
> this is not checked by dtc for MDIO buses. The kernel confirms the PHY
> is indeed at address 1:
> 
>   eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]
> 
> Rename the node to ethernet-phy@1, which also follows the common naming
> convention for ethernet PHY nodes.
> 
> Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")

My only comment here is that I belive you should remove the newline
between "Fixes" and the "Reviewed-by".

> 
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index ec3bf305274a..cf672cc6b935 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
>  				#size-cells = <0>;
>  				reg = <0>;
>  
> -				internal_ephy: phy@0 {
> +				internal_ephy: phy@1 {
>  					compatible = "ethernet-phy-ieee802.3-c22";
>  					reg = <1>;
>  				};
> -- 
> 2.43.0
> 

Best regards,
-- 
Hiago
