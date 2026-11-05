Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899006;
	b=3KlGfpt/QOArMasURk/s+gpv+VMKkFJF8XpkIvmzQxkjk9SMcSYe7Fvs2wy6bdGRUl6f
	 HKX8Z9Q+/dzApYg7z5FhFWTjmJxYbulyzhrScZBbntFxvvCzDDtD3UOVFJ0wBGBafKFiv
	 l40O/RmLD87hUxe91jZbHaRBQOgN/F7ISHy5alcXQfAw4VUd/uWHgHm2JldXrWosZ7WPY
	 quPMKWORSJ0oYEwqjNZIWmImNleCsAt/hJoZBN1z6uHuTHP32h+4JM/WAsizCtPQFei5x
	 Dq4Uiej8FXN7fL/hyd6N3QVzV/6WSGO6J7QxvFM5dhjypSKs/Gai45vi5wBtnigsF2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8TTgnEslfhmARTzLvGf2WXLm6wVd1Tp4w50+BJAZBOw=;
	b=RamC3Mne94JpvGgYTRaBBTh5DQDl1nLWOtwAeTqeOl2fuBhqNfuMHsIODWJ3qz2+LA+n
	 uRuQp/FfNsIp5HY7lAY5KekPC2/EZ1HyYYCE/PeWMJLgTDXtFS+GE7IiTTzwF4NEoZvw4
	 so51jKana3+56iIxkr5yo8M999ZENn54IxAujJ4HmKj1TVjk0BHx+5s2gh5fGdBD/ja0Z
	 4qHHgGeUobtgX/bHTbXBc2ZkjVkTFtRXZEhzkwUUlDWX2jb+KlHlJWY2Mh6cgbYY2CTpL
	 JR3LWoGEcKHL1kTTqWcWXbOvkiqavNYCqEPhTof0n6IszNoGFb8LxxeboUZLs6QJydA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wgl02OB7;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0636082BF3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E0636082BF3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wgl02OB7
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3531574eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793899005; x=1794503805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TTgnEslfhmARTzLvGf2WXLm6wVd1Tp4w50+BJAZBOw=;
        b=Wgl02OB7DEB2aqh4WoP3ufq9IDXvCofH/DMsCDWp1WDM0rdOnmn3824ZqMlg/EqUQu
         yeE44JmA3wk7cCyKNW1hteK5g+IIPU4vj/+k5nCK7zySs/0T327QSf+PLhcpfZYeEX8t
         TQRwRone9aanZ333rHcWPYHvLh6Feqa/a+P/7439n7mMiAOqoT6gmSrGCcsbz5tk0r8H
         au9MlKszGg4Yr+oTK94ASBKqxphjXbWn4L1s3DPH12NXkfrOKgfMWrzuh6h/Nnbf9Ri4
         5DXkOW0jwrHSx0t94eTi236hzFRPDsJo7lCPblPjrCPe0YKDy6gcQyGkuBxYj9HWPNkS
         ihTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793899005; x=1794503805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TTgnEslfhmARTzLvGf2WXLm6wVd1Tp4w50+BJAZBOw=;
        b=QepbuugQc71LeiuM+Gc09FmJh/h8vbyGVY3VfkrTvv10u2457tAX2NZhEH/3gwTESe
         KB8GHkx5/+yyo3VDib+8f30pzxsZf5lkpU1NSwnDqrIcTXWUMpTNuynvrFcUJfW4Dtw3
         oBkTCPZ0vAOLs5gp3u74T+YmXFDGZxgE4W+yyWDSbhbqxAfM7rRVbILBqs/y2theCl/q
         eIDAOqic0KvbDVu8+DPxnZLFSraWrRaKN+J0O9XgihH/r2TrgIJC+c7kVp1NDqQri4GW
         SrUtYY+Z68N4N0FToxousBJ0XCkcXsUYZLc/P9TaymwYJp8PpfuIGur0NCXwke7xsNjJ
         nDJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxyYWxtDGTirqDHyXxANq9JY8zZGsvWQjGVzq1nWOQQacBNdqNUZWKCBf8WY1CPJHxYLzJjTeT1sgCBBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z93cYNfureYkg4MC+wMzX3yj2rLHjpblKCKJ7p6CkwbThYAa4tM
	BlsjY/B+sm7F09saJ02iu9LsKN8q72Ww+a3aJk3+huWW1g3pZL7HUp+G
X-Gm-Gg: AYBFou34IyPIWbRR0k1zuh8zWhCJWlG4j6klclJ4jEc8NQT+Ugrs2k3FZZifk445/If
	qKQ8rwifxOgxXiGvxtdCUdNvGgP53Cknjz8yM1AvkXR0jqfoO8231btsNE5ZsMNidf1CI6Ji719
	KrjlL1cCKJgxaACdXLAnEgI7gx/rNVVsN/sJcCuilGtfIbEngELgJIF2t4itKMeb3BtccTzerbS
	hIYItxE4Z22iJiZo25tkU7HWjMavxcqt0GqGK7f1DLqORkJdCf/KTI+MBAAl0eDTUBSrpkS7/D+
	V7jLbd9fw/xRT6lATDKV5bDiNJX291xXSnHsckvcrua0pLWT7cwjpxhMun1uDA/zbgT+NUzmJwr
	q3DEU1sxfvn4Dz3tX9PorxZL8TTsqlsHr0eqGWL3AxXO8DeBg/fXp55j45sI+S3Y9pj2G9UNWZk
	eLbstHVk7CMtZpnt8Qzb5Kj8mx2duF6OuwtD0KaLn/CMWb2artIb09H+EhDz3Ce+YEHCB5LtCfB
	uz2tbUYZKP7ftH6rs8vbjTmzk60WFCSrere2DksWl+RKA6APQEGb7Hrr/1EM0oy/javpVr4LEfb
	2/oNbXFGissY4Q8kPIAx2xBB/iTXSSfPVkRr/wNugjjCSrIxjdZ0xRu6BNYQHTx+ZA==
X-Received: by 2002:a05:7300:cc96:b0:36e:b3e6:ebe7 with SMTP id 5a478bee46e88-36eb3f677e5mr2158998eec.26.1793899005312;
        Thu, 05 Nov 2026 09:16:45 -0800 (PST)
Received: from ?IPV6:2620:10d:c085:21c8::1368? ([2620:10d:c090:400::5:f848])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm24181600eec.27.2026.11.05.09.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:16:44 -0800 (PST)
Message-ID: <2376d06b-80b4-46d9-8540-8baf065b0326@gmail.com>
Date: Thu, 5 Nov 2026 09:16:43 -0800
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
Subject: Re: [PATCH net-next v3 1/5] net: sparx5: Drop redundant POL_ prefix
 from POL_UPD_INT_CFG
To: Daniel Machon <daniel.machon@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com
Cc: robert.marko@sartura.hr, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-0-b45a3a26bed5@microchip.com>
 <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-1-b45a3a26bed5@microchip.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-1-b45a3a26bed5@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 5:19 AM, Daniel Machon wrote:
> The macros for the ANA_AC_POL:POL_UPD_INT_CFG register are named
> ANA_AC_POL_POL_UPD_INT_CFG*, repeating the POL_ prefix that is already
> part of the target name.
> 
> Rename them to ANA_AC_POL_UPD_INT_CFG*, so that the port policer
> registers added in the next patch can use the same short form.
> 
> No functional change.
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>   drivers/net/ethernet/microchip/sparx5/sparx5_main.c      |  6 +++---
>   drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h | 12 ++++++------
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> index e039f5369b95e..68c80c63f9087 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> @@ -616,10 +616,10 @@ static int sparx5_init_coreclock(struct sparx5 *sparx5)
>   		 sparx5,
>   		 HSCH_TAS_STATEMACHINE_CFG);
>   
> -	spx5_rmw(ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT_SET(pol_upd_int),
> -		 ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT,
> +	spx5_rmw(ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT_SET(pol_upd_int),
> +		 ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT,
>   		 sparx5,
> -		 ANA_AC_POL_POL_UPD_INT_CFG);
> +		 ANA_AC_POL_UPD_INT_CFG);
>   
>   	return 0;
>   }
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
> index 1464fd1a1d447..219c7f0e516e9 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
> @@ -939,15 +939,15 @@ extern const struct sparx5_regs *regs;
>   	FIELD_GET(ANA_ACL_SEC_LOOKUP_STICKY_SEC_TYPE_MAC_ETYPE_STICKY, x)
>   
>   /* ANA_AC_POL:POL_ALL_CFG:POL_UPD_INT_CFG */
> -#define ANA_AC_POL_POL_UPD_INT_CFG                                             \
> +#define ANA_AC_POL_UPD_INT_CFG                                                 \
>   	__REG(TARGET_ANA_AC_POL, 0, 1, regs->gaddr[GA_ANA_AC_POL_POL_ALL_CFG], \
>   	      0, 1, 1160, 1148, 0, 1, 4)
>   
> -#define ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT   GENMASK(9, 0)
> -#define ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT_SET(x)\
> -	FIELD_PREP(ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT, x)
> -#define ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT_GET(x)\
> -	FIELD_GET(ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT, x)
> +#define ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT       GENMASK(9, 0)
> +#define ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT_SET(x)\
> +	FIELD_PREP(ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT, x)
> +#define ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT_GET(x)\
> +	FIELD_GET(ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT, x)
>   
>   /* ANA_AC_POL:COMMON_BDLB:DLB_CTRL */
>   #define ANA_AC_POL_BDLB_DLB_CTRL                                               \
> 

Reviewed-by: Mohsin Bashir <hmohsin@meta.com>
