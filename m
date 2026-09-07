Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75F43B47E3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795438; cv=none; b=Jupa6xsftdklTO9ZDBFIpDN/l4Glm3iXbNnZ2OcLpP5nl8dNpclTLGwLvi5K1kxGYC5BMVoXzdw6TJjVejNnTEfbM4bzvYNLwy5aJPT1Ak4t1yUkM+97Y5eHxVsBxogZX22VAk8S17QTVbqSc4cO+Ts07+GoRvmYJ7GEXmBMK14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795438; c=relaxed/simple;
	bh=OAARye3bqTwYbW4R9i8hEdUhoTwMnRP1LZaGR0XvoSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FB1GqttCo/2I+oYpmW8v8oeQEn3QNTA8hLg3o/apMJ2W1ZYCsfJhJZXIhDF2PjfwD11cyERZ3RjZMNx7XJYywNIHt+8l5bmJanb3scMJ9FuGj/X+Yy9wJbcgU9dpIca/qxQnZf0yxhrbVa7OmtGGVxMsG7bKjiAps+Cqka7XfFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+3W+e1+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+3W+e1+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495590dde14so53162935e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795435; x=1789400235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwmjFU3bbTIZNihHLqre37XheLVH2NBtdBfRtXysiDA=;
        b=H+3W+e1+PnV4Ek/4ourIs8vjKykypxxsIy+fIuoBHWdJwssJau679ZoottG9yPktym
         GHCVCv1SgQcrzP3R5PkkEsZHaa0yo5aUYrZNVnLgEMAuO4YFdfYLO0DTojyYGaLXq4A/
         olNh6gyLBdzaD0D9FFiyYWsqPdtvxFri3OPCNpzk2b0ez95iiUkxMC0l4oSCqQDx+bGl
         GJn+08heUdNbm+f/ebqmN3T34hjzt0UHp+bFBHr4JfX/Fn7zdvVwE0VXU/i6wx0QhzmG
         WSXM7cfm+zxPBhDNwp+R2nKt22CZPMpaYKNfbLTJol4aDJmogWNwGT0yQKLIwIE2SpN5
         nwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795435; x=1789400235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwmjFU3bbTIZNihHLqre37XheLVH2NBtdBfRtXysiDA=;
        b=JwJaXe8P3CH8KhVWVecEB8kwocA+XsFs2LXEiyiB8TjPpZqtFi1wFBqUCJZrSpnCIu
         ik+m6IMz8OghvvFLNRIHXIdVad9ZXU11DEukgOlWsX18GqwknwzxtvJ9j9sxWL3pzIY0
         x6QpP9kMHuXKQiT9DYORIqWxtbJ6mllQoqPRZOEhUXI0xMfJb1DhKZzQFNgWkUgoGAMF
         P6NzfaTOHfQ/ZbiKHGpzrStV7NUl1+/WAh/HDaEQODlpsngclLrcZTsfMSGjJqn0yQ/X
         2HQDuPcfe9DQppWBYXIIV2wTA0dYOAScsdLdcOi1NElcl9UZUU/Aq0tWCC+kY9ng2ZPA
         2rLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF9xFWpOAvGAObfH5P59afhLmokZjkI0hXQ0wClUMGYm8D77TM1L/iDUVomYai0V97aJQOe5dlFJGNHu8=@vger.kernel.org
X-Gm-Message-State: AFuF++lehTA2LehINPF4vjow+AUFj489w7INguCDPavXHSPPaTQPkCTO
	6c9Aq67eKfX3nc6sd3F08uA9IRbbIVY7zg3AW670jJg01dLF31iQMWhWS/g0RA==
X-Gm-Gg: AYBFou24Z4wN+kFoNVfYXgwam+rwTXM/L1G6bNLYlBdX9sqfa8567lzzx807R1NnUhP
	clYNtiP2yQmImN3qf/q892JBcJO852kryVGZqs7NKpdxVBIzfZpQis0ssO8+goLeAoMLlZ1BOZ/
	uUZsA2livwD8RBWP0td2AT5Pvqaq6CCPw0DGWYnDmDbuT+P7Vn0lPQrtcfc/6BEhSA+/j2ZEt8K
	LbIgWAHvGKLu4DJcsSnUmKLAmwnV7ZND+YewveUfaNap+00IrnpSZ/lyYUQ/3xeQG5eETlpH7iF
	DqhILMeOq+9oXDLv4F/+3Rj+VghPoogdQAPcXSwLAX0o0B4KExiIkXjR3tvv6WI7TTGTegpdcKM
	IzS/wDXQ5F8vx4ToT8yosyrShwSFmYb0gmb+CctUUkPB7x+YHXJhx7Jzv6OMXQ9L51oM1LOOqhC
	6xcZ25xWEABgh0GUcq457CZAJqIQNNyfYpnOLPrSAapWGUgto3jAQThbDMyCmqcK9E4SmhbFoua
	jD+fKEfsUkyuVV93M4CIwPPOnETloIMMgcSHOJ/dMyY4tiGIf6xXXSErGAvSA==
X-Received: by 2002:a05:600c:8b11:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49cf82417f7mr549249705e9.10.1788795434804;
        Mon, 07 Sep 2026 08:37:14 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6158e9sm404982005e9.12.2026.09.07.08.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 08:37:14 -0700 (PDT)
Message-ID: <2520c402-e54a-4451-ae2e-9ab9816c11ed@gmail.com>
Date: Mon, 7 Sep 2026 16:37:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] net: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-net-drivers@amd.com, linux-kselftest@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
 <20260907044635.7141-2-hemanth.selam@gmail.com>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <20260907044635.7141-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/09/2026 05:46, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
...
> diff --git a/drivers/net/ethernet/sfc/mcdi_pcol.h b/drivers/net/ethernet/sfc/mcdi_pcol.h

mcdi_pcol.h (and the Siena version) are generated from firmware definitions,
 so any changes you make would be overwritten next time they are regenerated.
I have forwarded these changes internally, so they should reach the firmware
 team.

> index b9866e389e6d..b00e7c100566 100644
> --- a/drivers/net/ethernet/sfc/mcdi_pcol.h
> +++ b/drivers/net/ethernet/sfc/mcdi_pcol.h
> @@ -5736,7 +5736,7 @@
>  /*            Enum values, see field(s): */
>  /*               MC_CMD_ETH_TECH/TECH */
>  /* Pause abilities to advertise during auto-negotiation. Valid when auto-
> - * negotation is enabled and MC_CMD_SET_MAC_IN/FCTL is set to
> + * negotiation is enabled and MC_CMD_SET_MAC_IN/FCTL is set to
>   * MC_CMD_FCNTL_AUTO. If auto-negotiation is disabled the driver must
>   * explicitly configure pause mode with MC_CMD_SET_MAC.
>   */
> @@ -10173,7 +10173,7 @@
>   * configuration.
>   */
>  #define    MC_CMD_GET_FIXED_PORT_PROPERTIES_IN_LEN 4
> -/* Handle to the port to from which to retreive properties */
> +/* Handle to the port to from which to retrieve properties */
>  #define       MC_CMD_GET_FIXED_PORT_PROPERTIES_IN_PORT_HANDLE_OFST 0
>  #define       MC_CMD_GET_FIXED_PORT_PROPERTIES_IN_PORT_HANDLE_LEN 4
>  
> @@ -13547,7 +13547,7 @@
>   * an ancestor of the current user (see MC_CMD_SET_VI_USER). Note that LL
>   * queues require this to be called after allocation but before initialisation
>   * of the queue. TLP options of a queue are fixed after queue is initialised,
> - * with the values set to current global value or they can be overriden using
> + * with the values set to current global value or they can be overridden using
>   * this command. At LL queue allocation, all overrides are cleared.
>   */
>  #define MC_CMD_SET_VI_TLP_PROCESSING 0xb1
> @@ -21387,7 +21387,7 @@
>  #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_ALL_MULTICAST 0x200 /* enum */
>  #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_PROMISCUOUS 0x400 /* enum */
>  /* enum: Allows to set the TX packets' source MAC address to any arbitrary MAC
> - * adress.
> + * address.
>   */
>  #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_MAC_SPOOFING_TX 0x800
>  /* enum: Privilege that allows a Function to change the MAC address configured
> diff --git a/drivers/net/ethernet/sfc/siena/mcdi_pcol.h b/drivers/net/ethernet/sfc/siena/mcdi_pcol.h
> index b81b0aa460d2..4d1da698c524 100644
> --- a/drivers/net/ethernet/sfc/siena/mcdi_pcol.h
> +++ b/drivers/net/ethernet/sfc/siena/mcdi_pcol.h
> @@ -6861,7 +6861,7 @@
>  /***********************************/
>  /* MC_CMD_CLP
>   * Perform a CLP related operation, see SF-110495-PS for details of CLP
> - * processing. This command has been extended to accomodate the requirements of
> + * processing. This command has been extended to accommodate the requirements of
>   * different manufacturers which are to be found in SF-119187-TC, SF-119186-TC,
>   * SF-120509-TC and SF-117282-PS.
>   */
> @@ -16293,7 +16293,7 @@
>  
>  /***********************************/
>  /* MC_CMD_GET_LICENSED_V3_FEATURE_STATES
> - * Query the state of an one or more licensed features. (Note that the actual
> + * Query the state of a one or more licensed features. (Note that the actual

Neither this nor the original text makes grammatical sense; I think the article
 'an' should be deleted entirely rather than replaced with 'a'.

>   * state may be invalidated by the MC_CMD_LICENSING_V3 OP_UPDATE_LICENSE
>   * operation or a reboot of the MC.) Used for V3 licensing (Medford)
>   */
> @@ -16798,7 +16798,7 @@
>  #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_ALL_MULTICAST 0x200 /* enum */
>  #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_PROMISCUOUS 0x400 /* enum */
>  /* enum: Allows to set the TX packets' source MAC address to any arbitrary MAC
> - * adress.
> + * address.
>   */
>  #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_MAC_SPOOFING_TX 0x800
>  /* enum: Privilege that allows a Function to change the MAC address configured
The other sfc changes outside of pcol look fine.
-ed
