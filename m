Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920725;
	b=wNkl2lNpurGRSHxh/F7+mPSmTXxASEJZ4681S16+Bspj4lZ/1GoXqj4L94XhFsvIYOhW
	 4dyYdPNglXueUwKEGvrLVI/AJKwWOI1+2ZM7JxoSFL6GqPRndUS8HNrJTMxVWUchs1e6/
	 EXxrLCQdUfXFZo1/apLicuOuClxDArxgAs1ZFF2+T3wEM5Y+0a8GPldXszFr4KIAgCxQf
	 OzXQC8V5UBt2Xk/sg0b52SdKrzxhYxrNANxwZITnYfVOCAR3aOooHoLse0++qp29GSb9/
	 tIRS68swAwNO4XnR3huJHn1oGAdeDm/QkeCvwhWdAEOU6T0+3xoqUEcHZEwwaNTuyYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
	b=KIXZXg3NXewpIwfVYKlqDY2ot7OazovSJTtwYNOk7h2h3CgF4IMHCpcGjfuivSczB5tM
	 3ug8WCL63c07WXK9vCRjKy3QSxeBGAdd+QTFUPHfgVJXBAUuN51zUS9xJZQpWBpt9uOVb
	 YHn/zq2afZ22lWWs5n9cOLV+aISPWr+24z5B1Dcg3oP7fmlEvp128W+cCm45UdIWba2gc
	 4ZSjf0gmysvgxWyTJjhe5GtU663WRva7UbF2k8HYDNRih5xJwwtGIfQIe0XOsBf2EwUV3
	 wAZW37L0vbDWS3P/96qctDAB0WxKNf/psH1xaJS0nKTTQOnHaWwNeCMqiPxFD+BGjPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ixg2FElQ;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D37606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D37606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ixg2FElQ
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b7efd3bc26so3368727a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794920723; x=1795525523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
        b=Ixg2FElQ4K8R/ky9HTvGAJuCEGYJVX7TUpi5oiqcBsN7Ib3dSQlPZFiqoWifByTrV0
         PCB1fdjPoxuSx7k6xU5Xs7JACbWaTU6J65zOLIeWvkRrpgrHEvmv8OR7AC8g6GgagGzZ
         rlAv40uJp38V1S4cuqLdlXuoeTFIFYLtiU93vLGg5jwPGFQSoUNOE+kPZLUGKa6lapxR
         oWokp/R1jGHIF5AJUY9RcuVHCm56TbQriYCRtLKpzW4hOx9oMb5aeeUk60mxs07G+NOb
         re6d/LK/Y6xYh1CxsjDHWxaD3+MG0VabzTA0xd6exotZwAYLSIFMC7ih7BLLdb3e/uK2
         Z68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920723; x=1795525523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
        b=S8mFqiV6FpfsP++bfDWqhi1LYd2Bdiy8rJyo8t+QmK8xS/5tvIqqfefUaDLKN2LI3z
         eNdgTBfG6RVbII5LD15835TfCZ+CRtQbPMnP3nDciIiCNU8XlQ2Jh7HXuAFt2A3/MQEh
         kzdOdyiVsi8a1beZE5pSI5AeLZlo5ImC6ezyWH12/wq4MxyB8WR045QfD0+6S0irNimb
         mzp4aOYpK1Mwb0S+VY65pxtwmyZauHdInoZQ9LUFM6Sd/dzuTtDjnq84buFtJ32uiK12
         X6KtcW3HBHY3lP2PC4n+ShH5IO8pAqeXWjlGy+FT9ZnvnIAN57BJSNh4LvPvm8pOoU+O
         CXeQ==
X-Forwarded-Encrypted: i=1; AL+hErEjAEyxsd6xLvWqP4nGlDrODircITQe6cygs9P1vQ29jSkfR7aVZg2jR9xCzbX8xBDR4YQj+3Vif0NsW1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+3Cnri+fBIZatbJmksHHhjbNw4DWwEi258zwPRvasnyshC9rm
	S99EYTI2puoybqGrt+STeT7Oqev6i3YY4+zkRtFUWf0RWN+ZM2caeLXd
X-Gm-Gg: AYBFou29As8d/otiyY0dmGAxjtYUNSEaxjq4fV/Hrv26z0L8vNUDQqwokoHlIxSxwfD
	C6IBWdeWryHlQUNXB+ZTwmN1BO/SeaXvhYd5l+AYKjFf1+hCXWsA4zB5OLBAR+0AqKtAFXmnTc6
	oiSlLZxUIFLYp2vhmCAqVEIqv91QZACfAXo+kJ2X2RxWcTiz6sWJYaDO/oSDBcCRImfE0/EwKdV
	z2XeuJs7XLSvVH6KKZjgDbPj8SG2pDb1Eq1gj3Qqi7dq36pLImzjZLEH63nCuZ09z9VQZAGEZ6I
	rfx3gJBMPajrnIFeX8nvmBV8jljrl0326qN4bZsilslBmHGOt2nefHZcYPjM0yxEXOjKCR2QKMl
	EJHl+up9/SMT1mrvsLEQ4g9oFg5TlRX+16OCz5a6pTNVsNoIW6mLJLGDqTfByFeWzUs/SHRCsdJ
	/bxBqoDX5Y9My8JgVY7Kup3ArfEK7ZsMnl9oY/xpoDOFVxMO5nWndxb5MgUzelawqActFDMTE3k
	LuT3h3KWDrRlKnfPfXrNrvhlgN1DL+L1DBPY25uJH4NUFe5CwFzlYniqhJ671KIAVt9DPe8A5FZ
	SoArgftm4Lk5CUcbbQQGcNcuQXdHjmhE8Ow1Lupvt4leIEHwrBA7PivE+Kznbt4MUL/Pyr5Qytn
	twhErJrifkKGw7j6/CIFrG3bhClCyW2xKPUu6a5Pugt7DhaeZZmOv2So/NdfJBzHpLH8=
X-Received: by 2002:a05:6402:912:b0:6b5:9849:e328 with SMTP id 4fb4d7f45d1cf-6b7c0d12623mr10169278a12.39.1794920722795;
        Tue, 17 Nov 2026 05:05:22 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b8786f205fsm343922a12.22.2026.11.17.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:05:22 -0800 (PST)
Date: Tue, 17 Nov 2026 16:05:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: atomisp: remove unused functions
Message-ID: <avxRDgUd-uygzKot@stanley.mountain>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

