Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357342;
	b=WIh7MbtqXX23fy4EihcFEflQf8dF8boPCT5sTgn/EjwcXjMKJEdzp2pmWQzpQ8CDoo2N
	 4LunO6dM1jNJopKTlY7ShK2Yo0RWCdzS/pIvn//bZD767vyg2UNe6F/EskhpjAZK4vUP8
	 6s8MoK4oCUsQJeJ/idXbyon8dzAwphbF8CGLFiXeGnBaS/5z1xIltON4VKHIpECHdyemI
	 Nf0eu5a0xAvOvTt986ZzXfsb8wSAdWoKoRZ1AFI642Ge/nlmVUyBEGzCP0OQJ7+on8iiN
	 RGhskqVevvNjrRgOB7Rv9O8KAJk88gh9v6ELuSAUE2nK1d+rfH1YUj8JHCk8r4tfv5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=eiIcyO7P81OBEHA4Sw3zY+ZokoYOfQKU6S8YPtjREDk=;
	b=B5hYgJaWg/wIC1qyx50EfiSYtnxxFL9utiKF07dRdwu7tpWVK8+tSsNPcJ3GEm7dCRH1
	 GYaTrOlQCfIx0eW7CHNhdcr/ZGQRXSZFfSD3BEjAkCEUrlTIhaE6o5ua4h0JltfIC2bqA
	 3KJmpaGoY7hvFZhKAWUodsix7al19WsZ2k70HkDjQbeLoS0dm0QcrqYgqSYxQogaTp6Bq
	 ttBusWmz+CBXARZFMpLXz5u29O1l8f0KdPlsuONA8hAnXgmlSxM4pIRl+TvOggE91tmxw
	 PmA04/qTnM7C6YzsCTaQeb6FQt0qu1dlkEkqvDVe7HsjOOAkEZT8eK9MbZO/tVL9ueg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Akpizang;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C016060A382D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C016060A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Akpizang
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so3146575e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793357340; x=1793962140; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eiIcyO7P81OBEHA4Sw3zY+ZokoYOfQKU6S8YPtjREDk=;
        b=AkpizangxpGL2FKTdTdqIyT5JGwdLcPlyohrInXtHrNQEE8Vu9y7cydRvZTfyWS9aB
         CrM4Laa3WmIAX/tb2vi3MM8k0UHGiOLvbi+tgzOy+hJHZ6NvSbIrlr7RP1St1FHWjoue
         YfxT3LXqtNBE/q8i5mI4mJyqAwvkF+O9+54M2KLHVs0qEI1wLU6yHyRouIUfQbFCZeQh
         olY2KDbzx0O3w9sjghy/TXjxRzywqCY/EWaTAMJrvHrCbILo+aKL/SmJQtOkA3zCLVya
         8ZOnh+9dJ3Y3y5wZkxTTbtZhB74FjaZPnViLNYLFB+NYdzb9D3najyQOlEcdX/OR+UWI
         SAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357340; x=1793962140;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiIcyO7P81OBEHA4Sw3zY+ZokoYOfQKU6S8YPtjREDk=;
        b=GdHrUW5gdD955RhHaeDU88uLAqJNx/5wDPkl9YfBgdhcpVgOx4lAVZRI42Kcd5bqF1
         HZaxVqR6o6qRNHYDFzI1gFNtaAFpWCTIZlC0Exl/2UrAzNyKQ02NXgQefp8YarD8M0GN
         MX1M3XGy1m6LsWS1Jqdbsv431oHQmkjVuxLX7h3ogpoLrApjYtXC+I/YVju/ptbmJRSN
         vOQoEVTtS6GZRtwK/Wb9DRx1NJNHLzHtijwk202tcOmtKptFzcfdy7qJEhVLotP3MlVJ
         Dx6gv5Hnfinh/xFxePGDzpEy7DVL0JgJv3Svbq3Ywwt4LSnQy3KIdlxnNvElyAOhFjO9
         mDgw==
X-Forwarded-Encrypted: i=1; AKwUvBwIfRoSe6sQCFesJog3b8LQF/kd/lC0U6EshACdfA6LFzmchVBVxuUiczT+BVLn4HBBzKIP7OdECpJLgUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK45wwFONmtmy/W366EO/S9XXE3AEnwIwj/mI2KU2oNbwe8jy6d
	1O2cZByuKm4swuTLo1LUePz3R5h1KrlQd80lKLfrAsa6pZSCxnC3TDVXEv9+MGV5VdM=
X-Gm-Gg: AYBFou34oDFPYDEJBGXx7XGUMDZ69GkVWU3yGcA/qf/NJyAUSVZVnu4Z0DOPQ6W5XMi
	M6ZC94oo59yJTEU/ormkD5Kw1a+fqLRY+ObFWmut9wNFHa0qbPi+BdUI4i/Y1mnFkjA3InRPheF
	/iSe81vV+kvraaFyWhrJHru8rZemWrK0VQvtsuWa1BzOLZLNcQ/0FcYsY5FSq1XETvrb7IxlyNL
	rS7zWTFma7cfBcSyHSeAuNbkeNRkqevOzT/qw2di/ciOTcGtfRduSJ6cKzF8H4u9dTflMXqkgf3
	KOuuwr0E5SVt/GHQ0t3R56vBtVthFFHfXaRx4RTagWFHgwWGFdUNClwj9wOctZ8azUHDAXfRkRl
	MIX1SNIPyI3c1kqHLydFCeMXA1a+Z52iPS9GdhlRau6+D5lb52HzsKHftHu1+drAneXWkSd6Bst
	iRuTidYvFLWWYen/bw8jtfjlaQDt4RzdUKjmW0HCcN/OtxFHT5EYy1fF210DtRvNLLYBbsWLxh8
	oI4q7+wEiA8vO+jHNaZWhSodq/NE3Pk5/Xi7Vlrk1EBZlMjRTWh9xMAiLPruNctWkFLz4cGGyml
	aB3sPjTufsGErYWklVynQ7MU/MWS/H7qmOcveWs7Ix1lHEwmw/BYXtJxbWFoA6VRmN+zHlvC/Qc
	7cQ2SXtMPoYB+VMjn1p1+UK3VatkBZv5JUoxiftdHWw==
X-Received: by 2002:a05:600c:4e49:b0:4a4:6fdb:cc42 with SMTP id 5b1f17b1804b1-4ac17b2c38bmr39334255e9.11.1793357340095;
        Fri, 30 Oct 2026 03:49:00 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm68659585e9.12.2026.10.30.03.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:48:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 11:48:58 +0100
Message-Id: <DMI44C1VHP3L.1B6WSA5BOI6BY@linaro.org>
Cc: <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] clk-816x: add sys_ck clock as sys_clkin_ck alias
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>, "Tero Kristo"
 <kristo@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>, "Tony
 Lindgren" <tony@atomide.com>, "Michael Turquette" <mturquette@linaro.org>,
 "Andrew Goodbody" <andrew.goodbody@linaro.org>, "Rouven Czerwinski"
 <rouven.czerwinski@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
 <20261028-patch-ektor5-dm8168-clk-v2-4-dc6bf0fabae4@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-clk-v2-4-dc6bf0fabae4@linaro.org>

Hi,

On Wed Oct 28, 2026 at 4:53 PM CET, Ettore Chimenti wrote:
> This patch adds a new clock alias for the DM816x system, mapping
> 'sys_ck' to 'sys_clkin_ck'. This change is necessary because the voltage
> management driver searches for 'sys_ck' in these systems and fails
> without this alias. By including 'sys_ck' as an alias for
> 'sys_clkin_ck', we ensure compatibility with existing drivers that may
> reference 'sys_ck'.
>
> Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> ---
>  drivers/clk/ti/clk-816x.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/ti/clk-816x.c b/drivers/clk/ti/clk-816x.c
> index 3b8e483aec92..fe6f66fc5a05 100644
> --- a/drivers/clk/ti/clk-816x.c
> +++ b/drivers/clk/ti/clk-816x.c
> @@ -57,6 +57,7 @@ static struct ti_dt_clk dm816x_clks[] =3D {
>  	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
>  	DT_CLK(NULL, "timer_32k_ck", "sysclk18_ck"),
>  	DT_CLK(NULL, "timer_ext_ck", "tclkin_ck"),
> +	DT_CLK(NULL, "sys_ck", "sys_clkin_ck"),
>  	{ .node_name =3D NULL },
>  };
> =20

I'll drop this patch from the series. The proposed approach from Sashiko
seems sound and I just sent a separate patch that implements that.

Best regards,
Ettore
