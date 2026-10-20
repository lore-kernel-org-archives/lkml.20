Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460878;
	b=BAa7thac9GtTVgcGKrThCYDm4v6tw6HTet0AVMrUMtUBrHUZkx3ClTTXlcQJRPcNR/w1
	 A+WSNN3kcy2GgWoCKOlvv4VEuhJ91L9FarlwmvoTHJkJvLtlSQ+6hBDfXysJcEmV5+psD
	 cjTs07g42nmoMv8jGxr8zM74e63RfoxlDjzNIZ6ACkanWADCFIYdxiHodCfOvTXGNi4fa
	 TeVhpV5zM7fvih7u7pYKXhpfTwK5EWjjnES247wqKa3lihixFVs+UPRZjM18wolRbN8oR
	 TyHX3/WGYH5c83xBETss+TuhV1n3v1HlQaOvPeAN8z79lUG76g/6nsLZJl11XxTR7kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IQ/Tuyn0JH1gUFDpwUT2+qvwHnCZOxuYKusSWI+7qzw=;
	b=Fuzz/1tIKlOBGFo7Wt+A8RIvD3dzTkojanOhrXXglnLVitY5e4BYqhJteKws+pfiZvlH
	 FHqscBwTMlTkgmHdYNqB78aa58U+ipfk7FVIo1UDkYTBTvh0YOQPDJxFppRKKYJndcKcm
	 EKIAtIbVcmYjtrnVUdnsVP4VjkUyP8etrzFgqMb7AYt+ImeOXwT/wDncRsEr+EIbCHa9r
	 G0Qn+K67vknn/BR60z6ZxMqUMYp3A7yrxkbiXOI6H5ApgfPHYCD9abEt6VJ3rlkCnj7t0
	 F1xvZODHGqfF6qmUo4exnNoV+Q0TyskZ/vVfx43Lj4d19c5gNSOvO5PIlO1wApjUhEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cTBtazj1;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CAE606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79CAE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cTBtazj1
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35b2c599f43so6093677eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460877; x=1793065677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IQ/Tuyn0JH1gUFDpwUT2+qvwHnCZOxuYKusSWI+7qzw=;
        b=cTBtazj10dBdAIyArju2za5IXQxY+7ntjIgt/Hor5H90LKUi4pfWoyaCNHYX6Zhov3
         yh+8xoTVshkmGQRDLnNV30hn8iEF4WjYgqni+qs1zC2Emx4cylur9UA5xgWCeV+rxMdQ
         bKHRAl26Ro6pFvb0Dilz+VqfJALgeQKDRuqJf+5G3mhSIkMdyI+i+PmPUM2KRwB6hDWB
         4ASXJlOFH1bI4DOzuDDwClMrxPol9TX8W24KbFoIqCXhXmy95+P/2x1TdgEET6Ablrnr
         LUUWW4TuGRXRUTYvf1Y8BCpxQVtCThK+BylSPin8/C32+7cAVRJCJTJCMNY9p/YVjVTR
         v0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460877; x=1793065677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQ/Tuyn0JH1gUFDpwUT2+qvwHnCZOxuYKusSWI+7qzw=;
        b=ItCfd4y3pxBEnMe0fQVzRxu7Ao7SM2wiol0UuDzg1BphtKTzPGg+EQbDoZohZtqYI5
         +ATghPE5VESzTClbyBFmtfMfZJpu1zaW7owkSdcEyyL48VEWIxgSy70cmE0poUKSFPCf
         WMzi6j9rvTENK8SfL3Z8rhOnQW58RCV57+Euft/8y9u0jUyLu62bGV1l1T24FGk6x96J
         DLp6y/Ki7y6dHiClPkQAkW6ztcJ/qUg3b7z3SRzX1mgAWDPVoTq2ZcEFYb6lxnY5uxOt
         ioQBgODoA7NXHRS8FQFObHRa7ocdfpDAwpU9YzPqOUfwSJOsyp1S3vvdndf62+3VYI/I
         yMHw==
X-Forwarded-Encrypted: i=1; AKwUvByLBoMi/VEqKRi7RAX/OarvAiWakrXMNuw7jMWLD4ph1fsmoGci/jZetkUs71oZTGFm69LE49wApey3ugA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOjrA9DqEq/2WU24WZuiH5hGfmOxA037F6q/jFJ/XPcy6mG84b
	cTjOaNJbcl43uaxUInQrRe9ajM20FYXdy0dggLGU3djMJWnb2Rkg0X+j
X-Gm-Gg: AYBFou3tCZ0JqWol3XDiaa/c7MTBa6TptMl2lC9fUDFZTUV6ioU7rMQvIcd1rprpeWt
	BrWc7xWDkX9YvKUpYQBg48BWBztqE5KyVckyAFL2UY+1oRWZJYxxWm1UAufx5PMp+J59Bfb4w68
	/T7LGSHnqAFSth3y7O0lSwXo+FWllE6hJZ5uzjAErYPrYvkS529iKSmzEysPK8DxWluKxJZVviq
	pZDKr6Kmc7SqJJWL2kkgv60JGcMYeYrecM6phH6Oe4cfEZLEGx+VWzeyLvbj90doAAbaXJqRMZL
	S7cYKmi8PXQqTzox/JwA7WV/XmJnsNQHAJZxrjbi/WQggl5zNTzJRrPnpVo/mfekPZzUhskqNJI
	fKf1gDmLiJbUX1W2OLf949abMaKC5qdRoU1OxYMG7cODyJNQwV20h/hqQB74Nph05ErWQ3e/HnD
	PAspUMN4Q669huqmt3iSol0GkMoHnFES3rat03xET+ZxJJPT5e12ihI+KcGmnRilbeDoM0yI4Yx
	haiWuKPLOqAv8PyrHg0no0=
X-Received: by 2002:a05:693c:83dc:10b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-362fa872acemr10206165eec.0.1792460877332;
        Mon, 19 Oct 2026 18:47:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm37173189eec.5.2026.10.19.18.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:47:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:47:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: reset: mediatek: add MT7629 TOPRGU
 reset indices
Message-ID: <6ffb487c-dd6c-4a6b-860b-f4e02d381cbb@roeck-us.net>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>
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
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>

On Sat, Sep 26, 2026 at 07:13:59PM +0800, Chuanhong Guo wrote:
> Define all seven reset IDs documented in the MT7629 TOPRGU SWSYSRST
> register: INFRA, ETHDMA, DDRPHY, INFRA_AO, CONN, APMIXED and CONN_MCU.
> Use their register bit positions as reset IDs.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
