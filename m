Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574648;
	b=rIge4bub0/CvBwe4dt7wxtJsG4euMC0UyOYAEkYmYadZ0Z96+Inp4rw6oC73UT77K/TL
	 nBH6gixoZ0MpJUJmI1pvXS+zaclL3cDPkWGO1HMY2GjXYlzuimJISBGF40dLtpXil3CON
	 Bjir5wN8QWR4DyaTO51jb+Xy50InYAcDgxX2kViJ9okcTKj4yXfZ+2LdTjQ4M2/uzN2Bl
	 B6HUdvRe+aEKCgDnlzAbqtCGl0A2ZpMNsPmhyY+5nqdRDQDhGer17OCFjMVZeAstu0KmI
	 HuHVMoH4N3m3exJ1VdZ835dnerxYhzgMhds2UXm53QoF10Mcrpjva27/z/dgGZVAycg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574648;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GDjWBMaaWCM/Dip/yS4QB10iZNdENkMyLTjWj9Cm2VI=;
	b=JwR4kdaaULdjEJxK0Tdt4L91Fq+25wX4RPBg9V2xkyGBf50HMonGrM5WWWf9EESsDXeg
	 mTBo6qDDulkP2astzFWYc6brgZTi6OlRNsx7yGL/RD7N8oFlhGeVZD0I9psdBEjgQE6bU
	 L0yNpvI6MFz8Vj9xUppwPLv7tb5H6cZERtpeJYikC05//2vy+1IIkczHIvrKycsFioWJJ
	 KkS66e185nWcdQltiJBFNNsNOsnfW9C/3AFqmwRMy2uuDP4pcU3L+aRoBbbmFRrspzfPb
	 oTc2iNNulShoP/soDQzjd0h7315llx4Z6DxstJBnAQypFDBAEue6qugSfVaazSHtnrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bjT9TU21;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Fsv3eCb2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51070606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51070606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bjT9TU21;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Fsv3eCb2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792574646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GDjWBMaaWCM/Dip/yS4QB10iZNdENkMyLTjWj9Cm2VI=;
	b=bjT9TU21mBVPRCZGtGDzI9tWux1cKm9o0SniMGrAOxDH+9VN7he3lqq4sLqMYiMFliCp6E
	R8zaWFS3kZTN3vCADiKHLOdMzuVui+FzXlrLIUYhz7pAFAfvRwnf2QHcjwUD3IkCMRcq4j
	ZnkpgGDlK0sVtW14ZaNeG2ufgcXGYfU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-Ec8-oWxcMwqcOlMZvubn4w-1; Wed, 21 Oct 2026 05:24:04 -0400
X-MC-Unique: Ec8-oWxcMwqcOlMZvubn4w-1
X-Mimecast-MFC-AGG-ID: Ec8-oWxcMwqcOlMZvubn4w_1792574643
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1dec05668so4021435e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792574643; x=1793179443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDjWBMaaWCM/Dip/yS4QB10iZNdENkMyLTjWj9Cm2VI=;
        b=Fsv3eCb2hvtJGyMxZkNIhOKkdSw2V2aFArwX//TQYAeuGpTLOXdRa4huZqbRU8sXQk
         LwNYY8D0Th2J9Cia7FHsxeRl0hhiouqZ220uXw62J33okW5ygtWX1obFeeMVarYii5bH
         Sx25R4AqX2nQ1Qye2morCoSMQbJMMOXN1BpS7Qz6/WvVyYxG4Zxo/WPV97CkOlsYQbv8
         P6ED2sb8nd5JsVz8dcm3QQPWx6rs6VFfByJ2WawxfA3FPMojG8yCTc8GnQrAFbOpaYAW
         MRc1QSLGKRl2S2Ml8n+tGNyYFzemhwc6jmmYTZwM+kTfAgJAfiiKqqs8sgsUA6a+EFrU
         D+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574643; x=1793179443;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDjWBMaaWCM/Dip/yS4QB10iZNdENkMyLTjWj9Cm2VI=;
        b=jj6qJGPYuQ/scVm5rbvcbnm4yOgeqM+ODmIW+pvCdo+CcuTzbDlQUsTwug+Sj9dzqR
         Hr3ws3ZLdiMyJ/+hbQLGrQPeJWA+XOQcggCHWciXWuL4glq15ZLDTnHhyAQdXNMtEM46
         EMx4Hey1EuAhaGsH/HkX/h1+EecE5jZECt7tQTE/Ce/HIW+IDuja8wwpmzB13sDb6MgD
         f7gTw2cK0sg7y6a2iyeXcmZGuBORiyWTq+N3laxfqzVMAD0m/1i5EzHVwPJfK0cM02W6
         HHGXiYWqMjpeGvjgnyZ1A2vpk1cLwr/hloa/k0YzwvdXGYl9A6U/vPAYrGxR85wwTrGP
         nwzg==
X-Forwarded-Encrypted: i=1; AKwUvBw7vmgEumRPYzsejKxPmAKv5/Xu2UAWYlOg6GfbU8YmHlakoFa/2hQmgaAKwfd96OU2mnq7qhJgjd6DkJ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsxBzEbBVaz2OypwBPRND5dAuOOM9VWLVfFGLx0IZkkRHMqHG9
	2j3KUzomsEimQSFp7XlgPHwbOAJV9AgyoWJDzmA3J8VUdgADs4nIedt+dlxNqjE709pj5PZTwBu
	2J7H75VwTGkm6DA2uhTMZYxYqSEFlNZNW8RdbF8iHtD/u4BFxqqTuArESvdFHXwBsYA==
X-Gm-Gg: AYBFou11Jz4X7WpXF36MtXtiLxci9j8aSlKO8QHZ1s3UlU5pPpIl5l942fRr5tJ25zL
	v9pL4f4GytGB6qDb4QzrQHq59NNoWXQjFnbTUu+Ld4tNvCOjSDyHZ1Gq9i58iCAN8hGELcW/BwZ
	zo2gFZt2LFe3C8yn6V394ZcDFXXnrzGzt46BTfLKFW2+KFGgo5AZYMe5LBU7g2qSYPFn3z6L7fe
	XBb3iytOB77ZkK3ZTit9eT6lSsstepLK3JUw12XYis49JUhH6vSSNlTNpqngr9ElBi3nBybr+2i
	4epozLS2L3GK/gbMRYyoz0zvhlwAA36rJxiaYz8v73pn7Dzbc189vlOksYR4V3HbxEDyXt+Y2Uj
	9Km9NoR63FlDtQ3yIfrnPNHRUsk4VGCZIFzRbgYJb2oTAbBllQVS0NbCJlbSSJkk+oXc9vmyq6Q
	==
X-Received: by 2002:a05:600c:3b2a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a1fdd4ea2amr27061105e9.27.1792574643510;
        Wed, 21 Oct 2026 02:24:03 -0700 (PDT)
X-Received: by 2002:a05:600c:3b2a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a1fdd4ea2amr27060065e9.27.1792574642667;
        Wed, 21 Oct 2026 02:24:02 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828ca3sm4279047f8f.25.2026.10.21.02.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:24:01 -0700 (PDT)
Message-ID: <130d9b15-238e-48c6-a293-f48e7d1ada06@redhat.com>
Date: Wed, 21 Oct 2026 11:24:00 +0200
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
Subject: Re: [PATCH net-next v19 06/10] net: phy: phy_port: Store information
 about a port's upstream
To: netdev-bot+sashiko@kernel.org, maxime.chevallier@bootlin.com
Cc: davem@davemloft.net, andrew@lunn.ch, kuba@kernel.org,
 edumazet@google.com, linux@armlinux.org.uk, hkallweit1@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, christophe.leroy@csgroup.eu,
 herve.codina@bootlin.com, f.fainelli@gmail.com, vladimir.oltean@nxp.com,
 kory.maincent@bootlin.com, kabel@kernel.org, o.rempel@pengutronix.de,
 nicveronese@gmail.com, horms@kernel.org, mwojtas@chromium.org,
 romain.gantois@bootlin.com, daniel@makrotopia.org,
 dimitri.fedrau@liebherr.com, frank.wunderlich@linux.dev, p.ameruoso@live.it,
 f@lex.la, chleroy@kernel.org
References: <20261016133107.54054-7-maxime.chevallier@bootlin.com>
 <179241678791.3135.1638003219102257102@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179241678791.3135.1638003219102257102@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/19/26 15:33, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] net: phy: UAF in upstream_port when connect_phy fails

I think this concern has not been reported nor answered in previous
revision? Same for the ops-lock related in the next patch.

I understand that the high prio comment on patch 9 still relates to
PHY-in-SFP unbinding and should be addressed separately, am I correct?

The problem is that the net-next PR should be coming very soon and
the backlog is still very long, we need a fast clear-cut.

/P

