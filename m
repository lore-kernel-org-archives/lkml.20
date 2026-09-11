Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4093542F6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136948; cv=none; b=PQO+dUMgWlhyUPxj1xQ36RJ9l/hNefRWMp9x/kW+2GHoEb2YcX82bkfiWq6colF3OpNlkaUjwB8hPVQcXOVFh+SK28TpZGQTt3eoNWm4a8xTpZOczVPwB7LV2V78MdpfGUVtxO1m2yQtU2RU9hXyzepa4w7XAbbq8RUt/60jwCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136948; c=relaxed/simple;
	bh=weYNExnFHVSMTQgSwhYXQaxh4W7zNAE4LHJld+/adxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mY8Miz9Je6HFBN9sP4/hnAwwYY0IHLd6TKXp6twQ66sOfc7bzxL6ya/bxoO8L1f4Sfzprvr1gm/aOlWbc8rKCuHSlYablK203zB6TpORFIY02BEzKqe4QtcxoyAfhXVHp0neF9Yx5Gk/6lnZ4i3RdMmYsuRuFjWopscvcoo5eTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDZOAjRa; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDZOAjRa"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso952395a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789136947; x=1789741747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hv0L1jHYg8hLNZMz9RvS7HnmE7O/YQ1CikcR5vW7J0=;
        b=NDZOAjRagBHJXCbdTkhCivoEv9V7cUUBDRwOpkKKyVvAS91NarqkgXINBhFSvPDMWk
         0WPqROjV4Ntu0eRcxjw/X1R8Zk0Q148MRaDzZhOiU/8v1hr8l+rHvxbD1sKSrek4WTZS
         L/xkoAhLiiAnkyPaAbf+S6mKBfyGvHq2BOVuhz5nEOivIqfpKo1RMbnD645v1Ifl+vCY
         1g4CEJWILMJAc37TfvhF7Dl2S6VJaNokAZ+Udzx085KkmQ1PjXTtt/MPPxbcNDQgekzq
         ufG5KNhTSei7Ca8v4XLmvMNoXIiIkfGoNWJre3++hg+J/cs7fiPBSnKBDAIdW5XxXr11
         /x6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136947; x=1789741747;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6hv0L1jHYg8hLNZMz9RvS7HnmE7O/YQ1CikcR5vW7J0=;
        b=f87FN5RmqLaTvrsWowP/ecdjp2rpqvRFi/NVXrACMyCCTbZfW7txUKUPcmQZE0tw9U
         yRZmRJRZbOqTNOqanR40PMQBfHA7P05CcFi4k0vgxKHtvfzmbfRcS2cBcfPUMfemEc/F
         I9Ih1btAUl1X15em5JvJX/KNR8T7c/cXr7+BYNai5k1BOGO8ZHIzwe8fcLzD/zz4MA+6
         BYBMXoPtajGh+mcDO+spm//e4/Xgt5Fv0tjXizW9hlFnDIBn+4h9LbCSvC4nIKedOpG/
         zvaCAv17/jhPFFBRScipil0lpzRIvDydF1NrQjUzskh8qHhitZxG0L1gIR6hgh3TdoUM
         MsKw==
X-Forwarded-Encrypted: i=1; AKwUvBxj9w0QHrSlwrGOYJJ0KKF6V/pzU9n2GHfL6bUras0+SvbO1dgxMSFA5NhMWyd5Pr6HXbc3aJDeX9PFEtQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lCKw0ccRuRSaGQcPxADxa9kw4LOC20jJREOcs3tgYfIh4n/zSg
	m8zpgCboMvXMp124x7t8Ardi+rz3O4DvbNBRyqK0DdFqV4kyo9YVx15r
X-Gm-Gg: AYBFou0EFcpugr2WzEw+6wV+6KVxVm7yRSzVMRY2eXeW3TcelVoAcA3YKnSYrb6HgDD
	wrsTg3iLsM95H7HCXRIwDx9WBP5Cz/cFwsznZikD/MJHH8iwcBiA/e9rDPpJCrK03VzpcAc9gdZ
	eclPNFIO3zmBV72OHr08P6D2APO+NmM/iE1wPtt06F8CdlpIeNjGK2P2+XdYyxT8QRZCt0ifhTq
	AucoSh2gmjVOgO2zdKIwmHmDJ2WCASgmMYrF6sIy/5Y5rffO24RaErzyruHy3MW3cBs2c9Pfcci
	009iV1qyQcg7GbLMlIGGuc8BbLJTdsfNZlj/BygzyJP3ZSOCdA/kMpOEr28OXn0IEzk1gv2dxGX
	HNrZIcrKkkVL1Alh7DsPi+T8s73fGJLctirJMpZ8A+RQ1XFQUqmsRi5a0PDe/O7sG5Ocg6ZnE3d
	GXCQu6/CoE79oWOJWDt2O8ncMd4A13Kw4CqJRG9iD3gax6oI/fRAtWLJdv/mpDwkyOv2LonLlkJ
	1DXOL0i+8yEFzrFbhRyEJbepwhdHQgzs2QIEAiKnBL9RiUv
X-Received: by 2002:a17:90b:540d:b0:380:fead:448d with SMTP id 98e67ed59e1d1-39d9c0aad1fmr7684181a91.13.1789136946708;
        Fri, 11 Sep 2026 07:29:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6585f94sm1270948a12.25.2026.09.11.07.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:29:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <407b9420-0ec6-4d95-960b-633677edf760@roeck-us.net>
Date: Fri, 11 Sep 2026 07:29:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] watchdog: omap: Preserve OMAP watchdog across boot to
 detect faulty boots
To: Diogo Ivo <diogo.ivo@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 thomas.petazzoni@bootlin.com
References: <20260911-omap4-wdt_boot-v1-0-637d778a4a1e@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260911-omap4-wdt_boot-v1-0-637d778a4a1e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 02:17, Diogo Ivo wrote:
> Allow the OMAP watchdog to survive being stopped on kernel initialization
> so it can detect a faulty boot in cases where the bootloader leaves it
> running and the watchdog driver picks it up during kernel init.
> 
> - Patch 1 removes a duplicate omap_wdt_start() call left behind by
> cd004d8299f1 ("watchdog: Fix OMAP watchdog early handling"). This is
> unrelated to the main goal of the series and can be picked up
> independently.
> 
> - Patch 2 adds support for reading the watchdog boot status. Probe now
> checks whether the watchdog is already running and takes it over instead
> of blindly stopping it based on early_enable alone. This introduces a
> regression possibility, explained in detail in the patch's message.
> 
> - Patch 3 marks the OMAP4 watchdog node ti,no-reset-on-init so the
> ti-sysc driver stops resetting it. A detailed explaination of why is
> also provided in the commit message of the patch.
> 
> This series has been tested on a platform based on the VAR-SOM-OM44 from
> Variscite, running a TI OMAP4460 SoC.
> 
Please address the issues reported by Sashiko, or explain why they don't apply.

Thanks,
Guenter

