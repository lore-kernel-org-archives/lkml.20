Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A9E23ABB9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950986; cv=pass; b=ezo0Nz6LsX5OoSxVo7aVSOBXdDuJtwzbQWqCC8jg2R/DvBhdRsbD+HzAjdiNiNXDD1lbDNBHnW/iKt9/elqj2358dVdNQVb+ce6Fc4jnPo3Zm9EZAVGbEpAHGzmhBXDFBaAuuqb00T7wuzqTH16uxgkN8Koc/tf0f40pryJghN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950986; c=relaxed/simple;
	bh=fbdJgvOiLac+N7V2H/t2voYvdk8syWy7cBDstC4esp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgyAxSjEJ58xhfTlqsjkq3md36dG7q9WioHrVvzQ8Wp4KHIHh+3DMEDuzdttnwlpRDvihOmL984KeVQiU7vanOFueO+QT4OhMMSjGUFY6ukL2FkhqeIScErLxZkMJwBmr9HDgM9h1NgwhZ6TTZf1GOlNiRp+oUN9okh9+LFwnFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K727ZcLa; arc=pass smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K727ZcLa"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e402001e8so16249966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:23:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790950983; cv=none;
        d=google.com; s=arc-20260327;
        b=Ca9pPiBtiK4xRiqd746Mn6LLNljxgYLn1LBuFWOoZUh7m2eD23XfG9XZsPdJf6z7vv
         JpUH6xTxmzca/XJ/G6t5vBFSBLXFL1w1TbkO6CVR0m3Xof8f0iPzylQN7jYLFoDvd9jM
         1PKb0ZpF6733E5MRSfhFvgL+mO/34eqqmQooLg+MxpDVaR0QaUK0JBRM3vX0SB9rgrKU
         /P0+VZY+yfcpdtaBztDV1it/uSXSY12/gv6+c5NzRfHe7ToJmK7obKNd/1t6b5jS5Zh6
         iUIx43ChfXVyqXZPTNjBvc6Pfgi5IzrK8U06BuA1zBcEq0VwuJ7Mt0FgytnIS+wKwvPc
         9bGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fbdJgvOiLac+N7V2H/t2voYvdk8syWy7cBDstC4esp4=;
        fh=D9dGdS/yhXlKqayA8Yeiic6ZP2lzPGUICknZ9tYvQWk=;
        b=K5PbrYfhbpdWgexTWOohUQFkI4jVqmsTsZRn1QX7tEpZLrKwB6d/tsrtLq1yWAe5BS
         chltvJC3pbP2oRUewNCOtcasFSWPO50HBg8GR4X9nhTzGBbGdcGts62qxL1a8njfp3yF
         wA0UxCm/Vq1WN760Q3dhMRWKk/nyZFTGKj4vkR2b7hASVUw/GFOn5R7lv1ktO3IfIP6i
         aV7cpB+aKNMuXdxhh2KCemdpcXI94LQX/ZS5wJMmyPXMGCtSIlZtu8v/026xgBc5sb/S
         sfe4foRj0sLyMthK+PEo9fLrJbz/U9iYILI8re/hiYHl5wv2Kvtg+FHiNlHSC5fLgtOk
         2Yhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790950983; x=1791555783; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fbdJgvOiLac+N7V2H/t2voYvdk8syWy7cBDstC4esp4=;
        b=K727ZcLahsiXFl9ljhTq9839N8JRutZSUCZIeOKiAJ4VhyxuSke4Vqgv0UiVr6CKKs
         3lAxmlq2XILzDUCadpUdFoml6yUWjz5r1uwgE7c44Q5Rm9QKD2d2hDcF2uvJxAY8D2FR
         vXHbOBPEf4t3JyBFpdeGcVDbaVqttUD6f5rVNANjLYx3GYNZqH6BeZFUeKXect43l0nC
         x6i8X/ICnCUBbuI3nmQVuTBZHUEsVyyzk6vu2xHswwIYHbAoQ3kZF40+OaCaHoX1dIDf
         jvb8vAw0u8FSUlij0DLaZ2ytHTPNruaNIz0G7MhMh9kd9g+smGpalIw1vgkTQZi++c0u
         t64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950983; x=1791555783;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fbdJgvOiLac+N7V2H/t2voYvdk8syWy7cBDstC4esp4=;
        b=kz2Cj2OPCmMn4UoJgYA96KsHxqo6mv7/3memFfpzOWHvyVlTBUFwzaPjHyGxEDgojK
         ElMsEVt6A8JGYcei3gZfirLWz3xWHac+qw6ollFZ+nfskXYYcjBfgA5AWSxqeuQ5iZRS
         r9oFWSsvsKBarHTKyDJwgmPVLg+na8OnlXYGkLU5CFzJk8sQVzqUEEkyWeQLKSjAm2RI
         EEp5hkMZbhlvZCcYKT43BwOb03hVVlpURlooq1JCI2PuShVzC1A2zQvNly6tsHdFogbr
         7e8vp8donbqW3QmrN8lMbPfYS2IM6GxIJawTCaRNsnD/FQ2cZqTkm8hxo/Zcp8GtQ81Q
         IdLg==
X-Forwarded-Encrypted: i=1; AKwUvBzj+1OhM0LPMy2wH/FjF9117lM+0r0CdOEJv7MxuyCkv2TzUBG/G3JtDAZZW1N1I5iISXPC06JtHp/B6x8=@vger.kernel.org
X-Gm-Message-State: AFuF++lCdr7kHMy+i3EJtbA92ZiQAEuhx9qR1PVeh5qAP8+NI0IqVaYL
	EPCIphuB3VBCPApkGOtlct/4rm7836KNOeutmkBS4rqbNoxn99On7bammxRuDpYdfQXJyKaP98W
	SWs2hduaq7pmYFbGNZW9TlB2bdRs1IVU=
X-Gm-Gg: AYBFou26fXtrBpskllsdlRhd6NzTf+1q72Tgc5j9NCv5G67VQ9A8Ya0iTnPe1Zip+po
	82cNC38b0yQKiMlmJnTS4m/tn+p5NsH45PZ32Y8VvnRgUsB9bN0pRqz0IWcv7boF/0yvs7ccQW3
	5H9d5l/fFRJmI6NXhjam+R8f3BdK8hD2cufMKr9R9/oMgvCRDK87olCrbkUJaWgRojEysRI12b3
	YpU8KjNE34VXbs1UHGqTl5LZX7ebMaHV145QcdOvyBLxfbsI7utw2Rh1Tg3O96ulbwhsX9ON1dn
	u2PTkLl6EP+YcIoOfXzzm/MkDeuxrB07OsxT8QsCjgAPmrNCXuK5BQ==
X-Received: by 2002:a17:906:dc92:b0:c29:37d7:75c0 with SMTP id
 a640c23a62f3a-c2e4a9b3933mr229815766b.1.1790950983438; Fri, 02 Oct 2026
 07:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002115850.962676-1-o.rempel@pengutronix.de> <20261002115850.962676-2-o.rempel@pengutronix.de>
In-Reply-To: <20261002115850.962676-2-o.rempel@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 2 Oct 2026 11:22:50 -0300
X-Gm-Features: AclHuK8FwquojjJt6tk83Vx2IuLXihfbekw0Fk_thDrubBdKP_mNo6oPAfZ5sBo
Message-ID: <CAJq09z6FNA8a8Si_z3-JG7=aqBjsJkgNypW6UcftDOV2WCiKbQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 1/8] net: ieee8021q: print traffic type and
 queue count with %u
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Switch the out-of-range diagnostic in ieee8021q_tt_to_tc() from %d to
> %u. The traffic class count num_queues is an unsigned int and the
> traffic type is an enumeration, so printing them as unsigned matches
> their types. The print sits on the range-check error path, which still
> rejects a negative traffic type; %u only changes how an out-of-range
> value is rendered, not which values are rejected.
>
> Preparation for the inverse helper added next, which follows the same
> convention.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
