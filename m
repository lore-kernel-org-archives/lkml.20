Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794610643;
	b=lguXBAlvkDdoUvfzcWMBvk8YwCIyRNwYXXN2+2C/KinLH5j07NYSMKFWBcNMQ0Iq0zrg
	 1aSVEzHynTk1ETtn2i199esjd3OFnhqYk9j887w8nHptQmnx2rODDMKZkaS5YfvAlWvNx
	 oQCJepnLoNUZQ1iLkSahEtYBxM7NZS6ER5Qs4kF7/Ljt0kxqLukblKorsfYjD9wGW/qIY
	 OZLTbIqJaOiEhJWOvSond/f8qshElJY6pDJClRopK63JAG1cTW4DJcrl3HThPFswa2ho/
	 Pj0DO1NsOpKZQTf/QlutiabuGg7XWq15UfcYjSxaunnsRcQEw6gVMKGBBZGDhze8YOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794610643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UQXefZbpyINO7gDBDyjwA6nRNyUzqCa+7+QTu56koVI=;
	b=CYt/wFdHmX3Z7QSrPJsbXuKY/TG1Q8WZm3BUmqtneR8Xdw1du8O6ThT6GUGIX3lxwWL+
	 K+x8BvOvd7WcSmIs2CFsELZDbqhBg11J3NgqJMoaDczZh6qC1IsVfDP/7J+7UfTbaLkb7
	 dJFseZmBref7B8rC7lkc43kEKNiPdumpcm5pG/tlhjLuxUrcMF/R5R8EtSOFkzMWy/u3c
	 /jhpdh626oZEJWKeJMjupAbYDZP5e2EFO6X0XILVTlQ+nebVYnltizXfDHVTB4hgzgaAS
	 Rkn55lAYkUDbQEw/tCzdifVi7gMpCVX8Kh0T90JHItvGQiGgiShqc+V4HvbvRBzIaCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dc7Xe3z3;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3D1606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B3D1606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dc7Xe3z3
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1916140eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794610641; x=1795215441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQXefZbpyINO7gDBDyjwA6nRNyUzqCa+7+QTu56koVI=;
        b=dc7Xe3z3l6rITAVAoMVHoSHNFqsQ3y2ODSiuZ0Y7COJxadDAULe7fhlaNqJfRVnbDl
         a9Z+YoaLO/8s+/S0noGDG6rmWspSzfXPSPPHtrVinBd5Xw4XO9kh7tnqVsJxfIaX8+tz
         TYrOCX9/Um/v9R94CGbOm3YxXbL1RbDVwLi+p8kTaWJUmIEFAUa6NfGDD7Np4dRQnnxI
         MGFqulnx0l8WMkYf7idKaZpK1CERc8JSYoc/tfleIAyLzt+Jr1fJBPb53/g5HIarGrl5
         ihJWpHronFta1R9jiwEGsLLx5LzksFoAOOtPL1QsNQkP9ur5vcdBjJFPfyYacK1or8KX
         txBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794610641; x=1795215441;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQXefZbpyINO7gDBDyjwA6nRNyUzqCa+7+QTu56koVI=;
        b=nyTtxFSjMsRT7Avtnhj8Om7gXYwICY720FO5gEQ1WqTMhgDS1wXbzbm2e4KwnrnnZr
         klyGDz3VxkQRR2B8Sh8Xla3BKhICxYlMT0an1KYS1nu+JIZLh9OVsRWQY5w6KHMIitgq
         QCt8zvNAMVyAbwqKk2OeW2oWfgumppRIuvIgEciR2UbFzE/wbFRZnvLA5th8bbmAnTie
         weLNuvlQFNkYMzd5XqHdMLh7ib6V1tBhm18RGy25TxhlvfV9E7L1bHYtADu4jjd9yQpf
         p87JoGSa/jm916PKjdxvvvxfo8LvjyZFgoFi2WJDwjqgZv/7fzz1bSs9rTbyMItxQj6V
         QKng==
X-Forwarded-Encrypted: i=1; AL+hErH9saMYkULZtkb5zg8vo7eniw4OQKcNSa7XXUN67gSrcARgF+cyDbpXP9w+YMi8BAS30ZEUSdZj1yITAwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gw+YfqrRguO95GlQT0ZB0h+bqoXNzOv0+ZhNdGEC9adqs6J0I
	15QUIw1JOpOcZTqgsfIMiVxTcidbugBQkEIYFfBLj0FEHfRNH6SeqFzIHuEPhKj3+A==
X-Gm-Gg: AYBFou3QU6PkENBXspQ8tJc73NiEC6NlxGTKbgWw/byahoSnKZ9LCU57zwtPyqetyDP
	vv86YwTs5vc29nLxRHuucU6mF7V2TCVoKdd1rxSPRV3JuZ2LGe6cq7g3H5ocwnCo1O/Gje4axDG
	YLUyVcpp/v4o4RiF+SeBGXM8IryCeb+OXnuiGNxVEXxxfJd3TXPG9VNloT1q/Tdwf5EPNAMOp7Z
	6sMUS7ETdAfloxJCwNxQhoQNqEQu90ibNoCN1O3VjS14/tzWFj0zlB0h9H7LU8GU002a8YguMZT
	g6B/eHn5QN1IuSVts0d3jJuSVHvYVIONA1PbLtLZe26WrvNJT0FNlWiZTHmWqnTp+v/2kc8woj6
	VgYomtj3/ARod7I6/Ha/3tF+fE8ONUj4nHqxu4LuoAqti9/9pXLs0A+D/NWPjQtqKBxxZK1D6Bq
	qpPGNH5o93BIF7JJBRTWn47FoeLYual45+RoJuYC6ARE7JpuuYCLnzqiffL4sJA/UQgqsqtkqD8
	QNWG+u0nxCrxwHCttBOiFQKoTxAIe3kGcCTWnd+5S+oF+8P+WQ15UqqKsMzZRHKsCJ6ta75aJMp
	Tb48EpRi5M4EfEkG0HqrZp4fGJ2RYatk+DUPzrUje0hmctxNVbKbchnSXUDIgATAXf2/S/xJ/1t
	yAvHKp293J4R8CaCYLF2xgMohC4FIxi6CDE7fOPBcxxdSArYTnseL8OTFilP3
X-Received: by 2002:a05:693c:414e:20b0:36c:49a7:86ac with SMTP id 5a478bee46e88-37968b8ee68mr3649203eec.37.1794610640558;
        Fri, 13 Nov 2026 14:57:20 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:9:8b75:c381:2810:3097? ([2a00:79e0:2e7c:9:8b75:c381:2810:3097])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm9566278eec.4.2026.11.13.14.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:57:20 -0800 (PST)
Message-ID: <0d02b1fc-a6a8-4250-9d59-b11a6d67cd21@google.com>
Date: Fri, 13 Nov 2026 14:57:16 -0800
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
Subject: Re: [PATCH] power: supply: max77759: initialize registration,
 configurations
To: Christian Loehle <christian.loehle@arm.com>, sre@kernel.org
Cc: linux-pm <linux-pm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <e93f0875-7350-4208-b91a-4aeda1fa7cd7@arm.com>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <e93f0875-7350-4208-b91a-4aeda1fa7cd7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 3:14 PM, Christian Loehle wrote:
> Booting a Pixel 6 with CONFIG_INIT_STACK_NONE can oops in
> internal_create_group() while probing the MAX77759 charger. The probe
> only initializes fwnode and drv_data in its automatic power_supply_config.
> The power-supply core copies the uninitialized attr_grp into dev->groups,
> allowing sysfs to follow an invalid attribute-group pointer.
> The local regulator_config is also only partly initialized. Its unused
> init_data, regmap and ena_gpiod fields can be consumed by regulator core.
> Parsing the device tree does not initialize all of these fields.
> 
> Zero-initialize them both configurations before used fields are
> assigned.
> 
> Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
Reviewed-by: Amit Sunil Dhamne <amitsd@google.com>

> ---
>  drivers/power/supply/max77759_charger.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
> index a93adb266f01..e792327ff14f 100644
> --- a/drivers/power/supply/max77759_charger.c
> +++ b/drivers/power/supply/max77759_charger.c
> @@ -683,8 +683,8 @@ static void max_tcpci_unregister_psy_notifier(void *nb)
>  
>  static int max77759_charger_probe(struct platform_device *pdev)
>  {
> -	struct regulator_config chgin_otg_reg_cfg;
> -	struct power_supply_config psy_cfg;
> +	struct regulator_config chgin_otg_reg_cfg = {};
> +	struct power_supply_config psy_cfg = {};
>  	struct device *dev = &pdev->dev;
>  	struct max77759_charger *chg;
>  	int ret;

