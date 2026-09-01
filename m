Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D316E442392
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250476; cv=none; b=Fs12cGQiXy1ADSEN2FOJTzn2A1gAM9KiIYfC+R9wSPlddaEFdRKT4HEg02RpaF+Q8vnkg+Dq0UArKxJehMkneXksrKiFof0+VzRyW0DklUDUW7vSrzB3sWsAlLeIhB7I2OJlTrliVhqea0V5BILLmlbZnWpHvn0Pm1h5EY3G6Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250476; c=relaxed/simple;
	bh=hC1h58ZXGlW7Qyt2CFxkT11Uz1je6tDDj63vOjFEPAk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3pMD3hvomqc7G+po6dkljUs8S/yL1RF0ndnfnlcIMF6a87ydrCM3sxR9UF7UuUmD3LLaBF5TOGSQuPCljrQaDONvsF0uzpg5guZbKEb41wJFy+6nDNrhkKwwxfU0fmGU0y9ZpK6k0CSMzijFVKotpr14YLli+5BJmpiY3Sd+yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMzPkYCO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMzPkYCO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6e954afbdso3670435ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788250474; x=1788855274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N35DlRlBLw418a0l8mNUqYvGQvXApXM5HfkSj/C8eBI=;
        b=eMzPkYCOAJDBNCZiAIJjLAiuw+35obx22EP46gZFEnF+rvy/4W48zGtU8Fvp1C9xGy
         Yll29XiVRBRA0qzKY7omPfucUqaKUFnmEnTo3tZTxpGfviE7o0PIApLINzgPTwv+QCnW
         /7jvurZEXED++CY2HH7Q9fMU0FCf+hz2bDtLuKt+GTA0NW03aiPQXPNsxcMMLaJSCWM3
         YnbNKPTEREFU1rbgxtgR7vurPaABoVkI0OV3EzPg1zARPUt0FAm2UHojhzUlKOY1nMdH
         hMGFhdg7ScxEE6vttxgEnyxz5XqMe2Qe/bRT/C9U5HLCQTlPEPh92hECVNLXW3SpwnHQ
         NWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250474; x=1788855274;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N35DlRlBLw418a0l8mNUqYvGQvXApXM5HfkSj/C8eBI=;
        b=Bou+UwQQw9jVW/n4FqbzakA2aYPNTTCWkhJnXHEcTWTmsN58sCrBmfd1C2ESxcXlF/
         VqC9PgbIRJwJvUi5QZS0y5QkJGky6y7XK5Ffg9Dx6M0tBqX5H1HpBKi8MTVSdzIEZKU3
         gOWYgdSyVUUWXH7529pY5HBz67SBUVdQR/3DmdkWHlV6Q/p0jzkPhmFDq464cu+M5Shh
         vFMVHXkP+sV8PIrodzHpOPgLe2afGqp5MBojE/2YZyx6+FCpBvjCKbmuGPAL+QksqkQu
         c3uxcQn0ixk92lyDeZbnffdR2fImtDNs40cALWZZ8YaDpkTQDcrD+rEFdLaj6e53NBJI
         ucVA==
X-Forwarded-Encrypted: i=1; AHgh+RooVXebvGMX1d2qmUrfzqGn8XGoPZ7hh3QBkAxqVl6j4Misb5im7GtvjJuGnWgGqtVjeXOmoCNDcU/3DtU=@vger.kernel.org
X-Gm-Message-State: AFuF++lIUjeAG4T0FFNPECQGmAm41/2cjecu/4h3CKwUAi1R5tI8rTeR
	0wHDRvEj9XKe5rDqL9R0boFK6b7YdTlpQxc8qIX++7JK9S+bDq+k6Gqv
X-Gm-Gg: AR+sD12XUXnCo/P7HCfGtltUBvRsdVBjdyqSKYSHdTDvx7LBfsZMqWV9IXo10QNVyXZ
	9teVWA+R4MNlp3Qy/5mbCi1lziVGDN7quugL7RscTfVjCOwhAqBEReY7nutkqsE8yflbC8WSUwj
	ZCcM5XeeJHcFxTqRWJHbtcKNquQpqWy1SJczcS5W0oHjRWmTkzEVXelPxRRMNg7jm/QZ2kh9Oj1
	dK0gHGt2nHOtTVW2Ufg0+XTzMoTeGCvPhbVleQyJkH4tYDxw62D64sq9cRZt2opG/rY1SFPMsfO
	Aw9duUB2OenuNAqgldLMr3TgMXewcT2jLPbqLktN+PR6o0z+8oHBc6+93f7g+CPU+0y1DFohIHn
	9226bGVxyNjunWpUWazJF5gTdWpoUzAmY1XB89EK38+DzmjUFGQfAdDTkU3G3c3K5zyMtEEODMI
	dUQPcTzCg6HFz93+NLHQVEv7APh46v1TGC/JJ+8IlXp+Mm0r2Np4e4iwIvakrKBbmnpSDjR/BD5
	8IGPWVdlzf3gT71wOYxDd8cAauT+eTzwxlb0YS7AyO+Cwt7fyk=
X-Received: by 2002:a17:903:2f8b:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2d74ddd684cmr449703555ad.6.1788250474066;
        Tue, 01 Sep 2026 01:14:34 -0700 (PDT)
Received: from nxpwireless-Inspiron-14-Plus-7440 (61-228-209-44.dynamic-ip.hinet.net. [61.228.209.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988ac7asm47305955ad.57.2026.09.01.01.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:14:33 -0700 (PDT)
From: Jeff Chen <chunfan.chen@gmail.com>
X-Google-Original-From: Jeff Chen <jeff.chen_1@nxp.com>
Date: Tue, 1 Sep 2026 16:14:27 +0800
To: Linmao Li <lilinmao@kylinos.cn>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org,
	francesco@dolcini.it, arend.vanspriel@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 2/2] wifi: nxpwifi: delete the station
 entry on the uAP deauth event
Message-ID: <apaJY8Xc+Dx3GXxz@nxpwireless-Inspiron-14-Plus-7440>
References: <20260807132554.888706-1-lilinmao@kylinos.cn>
 <20260807132554.888706-3-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807132554.888706-3-lilinmao@kylinos.cn>

On Fri, Aug 07, 2026 at 09:25:54 PM +0800, Linmao Li wrote:
> When a station leaves, the firmware reports EVENT_UAP_STA_DEAUTH.
> nxpwifi_uap_event_sta_deauth() tears down the reorder, BA and WMM state
> for that peer but leaves its nxpwifi_sta_node on priv->sta_list.
> 

Thanks for the patch.

Tested on nxpwifi with iw612 chipset.

Tested-by: Jeff Chen <jeff.chen_1@nxp.com>
Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>
