Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126489;
	b=fFuIEOo3YLj0f9d7QetxX1vEhVF0o39XC6LN72iRu2u6dBW2lm4g69KAuWn+dc8TmMlu
	 OKxEU5NDlpRFK/6iQ4JDfYxmsjiXfsdT1xAdLd6co/TJfGxjOXE/cK0xiKQTc2U+Du4zI
	 +Ng9np5+q8aVjqgEAJxkCLzdKmxr56F6K+7uoWHA2B3F4hXO8Mc582jjt+UO38xku2FUL
	 wC8CBOFod2C8Dv42BHdBcaogrXDiWt1EULJR2Om6Ff1H9JxbYHw7M/tFA1ky4bXo0Aqor
	 nYWI4YEQr/FHCQURYsaUybgK0MSX8asCMZN8h/e5Kt28f310iXVIe2SpDs7saL9+HEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Ueqp4ooYCIC0ww/I1nNHHuU8J5a6V0zw1krZPC0NXzI=;
	b=Y0RW9YhN+A6LK+hSdwATot8ahPkvpMhcLVrISjXhuMVc2wTIrkHsCGWDTMlgXzkaZT4Q
	 d2DSc5hNDywFPMik3Tq0ZmafgjWLFcR/l7mmFA4f5Wy9ZrI4wqpqxq66k3fHBe+9A0tCS
	 ZK/5Kh8DCwgFJrD+up8qdoMbHWq7FKOwRhLO4PrX03JiKLdCw3bajixJqtlDOE7GCWwDP
	 zxlR3HJ2SRl1peD8s1O10dgaQrHrsoU8nHYhpSRaEA3503KmHFxDCOS9qPNCa22Rdc06T
	 KsePrFqrEJktCuDF7jT6QP1hoXmCa2Qkitdp5uPFlcxPeo1XdIINzmfg/7sOZc/wwcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMcgWaUI;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD29606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD29606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMcgWaUI
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35c76e9614aso290590eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126488; x=1793731288; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ueqp4ooYCIC0ww/I1nNHHuU8J5a6V0zw1krZPC0NXzI=;
        b=NMcgWaUIy5IbpYvU1M8ji+8J0udcnMxFTkFc8wRiK/ySQoIVoqU6lUrwAj5UA4fMZx
         AejLPo8Pxd5VSPvH/ZdUMq8EZhnPPY6tCBnghLR8ZfD2Xowd4ZTrc8aFziGik8BNAECc
         lkfdF6fMdDFjPo/BheY94D3GweY+Hng/WIKviypsOy0Ytz/CJjslGtzsB11fCWQUKvGH
         vc3cj2KzbZIox6q5nXhuMav+E/wX9bM4iQgy5I/0MjzPv1DVmf66ZBxfXNUnItaZa6OY
         EIImIkClQdDHzU8Mv8vGhvcPkLGPu5RvzCX0QLF2XWQnngleEGf6wG6LMgar6wGWmZ8S
         UhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126488; x=1793731288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ueqp4ooYCIC0ww/I1nNHHuU8J5a6V0zw1krZPC0NXzI=;
        b=YnjBWtHtdIoZuun2LX14cIWXBYj+DFsOhmP4kZUSjuWcy+1oL5krd7/YtuDorsW9r4
         VwkM66dbAUQQguovE2lKOi3NqhEqezfJUnaas5pKMADLIxAeappakmStKbVsOX/4DEAU
         0Xtrt+bP37CJqIajHg/+z7IxqLmv2GlSPiUXu0Sq3Il/mCDJ+M5OPXTd4gPHhjbVo8+2
         S4vgKgW4ASTrwniJWUqJUqDgvKzk+oDwh2Mut96nsyVeeHtGXNbVHedBbpAlvDcCVgVZ
         1HfryVVkGl7UZ1i75s5AGwi/2R7HOTNbWoLByZElVaUF5l9NoaVnnYlSPtoHfnhpB7ts
         OBfA==
X-Forwarded-Encrypted: i=1; AKwUvBxxoYm0xBpwP+guYrk1VQ/4Cevy0dhRabfij8zFHbO4fl4L4ur1R4hi3IhBg3szE/kfN5i/IStxHNHLboo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpc0mC6tMez847HZagFJ88/01Z039ExOzRocNCQlOSGVcE/8Bl
	gxmmm5Pg/OtA2/h2/bmyTYBoMmBnWT3it3yiv9wg+StbgKFUHYazARjzjGzHyg==
X-Gm-Gg: AYBFou26DyZOsCeqslXVEyegZeiotiQy+dbHCfDbR35LO3X3xFpwINdRnBvRPcj1ONM
	5Cna6g7xt6chl6ZNMdAHkleBNtuwTJDeOn80rxOz3BmFu1rQFFKmSMsmmNu7y8E+n5T5weGut7d
	86Hq3DzbvCFGjftAPfl+q/5Lhdq4JKiSvHCugplrdxb+B2S80Vs8l9weRyq/BbeZagreMscESuw
	k2N+2Izt3/teB3cOeQuHRPTi1iDkzgdp1alPhJxBNgdZ37In1mzU9pgiANGkbhr8w4WY0KMH1uV
	hf19BzUhgKQ7qtL7YkiOAt3V9lHtXaeVMy4pKYwJK614n6EC7yX/vp8ZOF3YQ6DPBRBoiOi1Aur
	bx+8NyXILVc065LEAZg9dF7DfLJL4s3JQGl/g2aYsXN1flClkwY8Dh7jbAzInRsH0Hr0+h6AN6h
	AbcXkFVs0hKZBYwgTg3883DEexPW1OyhDMRvvnCHl3ssiaqlK2RUfCoOKqocHy/sXD+WFRWzRnR
	Oy1lVuKZloN3PROmf+mkQahEI2nuVkS5njQtL2+UjPGqgJWBfYO32uLX6MIjfmjE7FQIctrrDWP
	98HL0sd1v56uuj9eSOFtmc0aPao77vhvG9FXkUHBGQBd7qFCEHTiJ/5wY4pQUZoWlKAvR2Q=
X-Received: by 2002:a05:7301:d185:b0:35d:eafd:5737 with SMTP id 5a478bee46e88-36a20418d01mr392582eec.22.1793126487975;
        Tue, 27 Oct 2026 11:41:27 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm60615854eec.25.2026.10.27.11.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:41:27 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:41:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?utf-8?B?SXbDoW4=?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: evdev: propagate EVIOCSFF copy errors
 correctly
Message-ID: <auDwT-N9DzZZ9BJo@google.com>
References: <20260831152156.166514-1-ivanrwcm25@gmail.com>
 <20260831192752.258550-2-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831192752.258550-2-ivanrwcm25@gmail.com>

On Mon, Aug 31, 2026 at 04:27:51PM -0300, Iván Ezequiel Rodriguez wrote:
> Return the error from input_ff_effect_from_user() instead of always
> mapping failures to -EFAULT, so wrong buffer sizes surface as -EINVAL.
> 
> Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>

Applied, thank you.

-- 
Dmitry
