Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0C13CB2C7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699579; cv=none; b=qQRJ8EJVKQGiJzZJukyhT9IWXstzFLpy0UemUnStsfek3IIzNN9B/8tsbUrgfLjPg9mTsNronS3pMee+0yIuKxRqYH4DGgnzG4eDtO+7Lpbz57G9M0PL70RN2SPtm4Vrbo0dTd5X8UevIN0YuH8BUXiaOKyA3PBte6Js8eEhiUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699579; c=relaxed/simple;
	bh=lFCZmJXJ95RTTOtWoWX7ltmEVnrMePDVdpOTnlquqzE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HYk1+e+N+FIvlo+CgRnfsdQjmtzzkKnc9ZdeU3szfAAfXWN1CLq9dYQAGDp5144XgmQ8vT3IlzqCCrJPIZFih82LXqDA4UsQalMq9uLXTxClagBS2Qj1Ywp19eLF9wEwvGgWUxwiqLGZGc2d/9BkbCA7WVxTKiibkaZZfJ6GpCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gz/8etlC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IYm4MQdF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gz/8etlC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IYm4MQdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790699577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3EP9aKTlXkHqpKd+LKABOdIxzdfpeBaYNQWJ1ZcxYfI=;
	b=Gz/8etlCpzRd1/bhDgEV6aZlCrTh0Mstdf9UTmH+gz4bvEMPqlVKOnNJFJ6Eu7E8Dv8kyP
	SG7ixrNhN0BxVkGTkK66o7E6gRVq2UVY06l/tE4WijeldI2tdHubVZ9PSXex6/HynT+Fii
	MdMEQi5ejLnnO6nO/H76H0s897IorZM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-hH7_emefPGCu8e7QPlZjrg-1; Tue, 29 Sep 2026 12:32:56 -0400
X-MC-Unique: hH7_emefPGCu8e7QPlZjrg-1
X-Mimecast-MFC-AGG-ID: hH7_emefPGCu8e7QPlZjrg_1790699575
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c8da50f4fso65987896d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790699575; x=1791304375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3EP9aKTlXkHqpKd+LKABOdIxzdfpeBaYNQWJ1ZcxYfI=;
        b=IYm4MQdFsjmvtmQzxBTl0L8oB4wU0kSj6RBXHdr/X9xBA120PiGy99EJ0Ly8viRAzl
         IUfkEGB2y5rcbRmyLQ8fpfeng6AUWO5YGtqkkB83yrf0CwHj/uLPvSWw+k8t54iktFIw
         ghHnnltVCQHEMLqJSQ4ovWARbyHt+uLP1LcwMsZhwS9vUmVO+l0Xrk8PvlY+T4ub3i/6
         reuIDClqsOLhiZphMUhg+ofuSCFJjGMj0n12aGtaNy57mQnwwiHrd0a3nMTz5Ri8jIv7
         Ff7vh8h3XGZQe+Q51TMtmOFzXCpr9pic50fHRqdwPDpan1HtnkukVN+ed6TE5+khqVo+
         hVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699575; x=1791304375;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EP9aKTlXkHqpKd+LKABOdIxzdfpeBaYNQWJ1ZcxYfI=;
        b=sN70QQkfryifPZaaSzWFZQOH9QCa4wL95NAYPbVtvl6+jtGvKcyoL3j8JR73nBl/jI
         UxrRLpPKMAhF3XUVFloQIoPVUTAMAwq2yDDd8VcDg4F/S7QpOkUauRgrhy08Grz3eivv
         r0NkGkUeSTBnRAx5mqDEI0leEScU6QGRfA5IKPSLUhEDEsA5fVcB7dQ3JT+cRq3ti0IU
         NtsS/rSDh340Q2gJk6aaDru11HI/lk1Ok96mDKtYkii4VLV0EqTlSfpvhmX2Hy6GNajo
         Ed7qQtgUGNQFKqfuIsBfy6OGrgoVYvqK1IWznxDG9k5xkbWRAft4rFULy9ZNXwQTqlNI
         S/ag==
X-Forwarded-Encrypted: i=1; AKwUvByan4X0hkxYP96bkTTbqkIFtwCqBXExmF81DIn3IEfuwSfRnMlzpnL7C+XwXjWrb9gYm5zP5nNdNcbKjko=@vger.kernel.org
X-Gm-Message-State: AFuF++n5ykFJZB5xr9OumV2SxAZvVa2R11+ZXynFAvp/Zyoq+Xr2r8Fk
	nuK1UH4t0Y8UVB0uK9ODtxrZUoZ+4vy7FW7qDCKH5BhZn8/hFKRu609ejayxsLBq6GmNdd6/N8b
	fsMFtwzj8c/G8htGoj3UBvaMKTGULOeXqxm4C4pxKa1bD3TwMQjAOqGaIJx30VSULEg==
X-Gm-Gg: AYBFou2aBnyGx3PJHzwwq38YCoMBu6u74T6H+ivLth5HpBTmp9Hceo9lhL4cpx3Mhn6
	SNNP0oDLxGbXv+HeqFeFPjKqAObuWBuQE89mmCY0ZKQ9/ja7LgeLeoR8run6e9g806VVryNr9Gt
	TCprurtxf7VpsYaRfoAA7Inhpud093LTBOPK0ge6ikeNVjWsL5D94zESmcfNoxAcGIQdXSC0iUJ
	3KcVy3rNdCjyE8HmkyXl1N6YjF7FjKGr/ipT53TUfetR6jHu5WJeBS34IqsLaA5s2So+4zQ4Nfw
	ybhSYh2ZIwPyM1cKRWBcVhQojP7iQAZMRf4xX6p4U7xydeQljO85OkoXeoR1wE3TR0wKzVu3qMG
	bMuB8KOtv8v1qBoWzRe+XESE5cp8fsACWxLOV1HRbrQK2+tqxNqU=
X-Received: by 2002:a05:6214:19c9:b0:912:517b:7bcd with SMTP id 6a1803df08f44-9142f9c5065mr274823816d6.44.1790699575283;
        Tue, 29 Sep 2026 09:32:55 -0700 (PDT)
X-Received: by 2002:a05:6214:19c9:b0:912:517b:7bcd with SMTP id 6a1803df08f44-9142f9c5065mr274823326d6.44.1790699574678;
        Tue, 29 Sep 2026 09:32:54 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d303590sm13921586d6.17.2026.09.29.09.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:32:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, phucduc.bui@gmail.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260724074603.28731-1-phucduc.bui@gmail.com>
References: <20260724074603.28731-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] clk: versaclock5: restore cache_only on
 regcache_sync() failure in resume
Message-Id: <179069956807.199845.7176756163346289190.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:32:48 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=359; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bx6Ay08Z3QW0ef7Ln4icY9WIwx4U+10IZuZxuaLdFYw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2vzDx3NXPvrDm9Mnb3i6Mf6ep+YRGRtaE1V0Ok2rWz
 b8g0uTSUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEQ01jL8lVsRueBxsMRMm1VT
 rk88rqS6W3zh/+qWDRbd8293qd5+H8nIcFPpacEcdVbR0xbndJqb+9r1877437fNjOi7O9/i1eV
 MJgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 24 Jul 2026 14:46:03 +0700, phucduc.bui@gmail.com wrote:
> clk: versaclock5: restore cache_only on regcache_sync() failure in resume

Applied, thanks!

[1/1] clk: versaclock5: restore cache_only on regcache_sync() failure in resume
      commit: 7b283b8ce37d40d22f41bdc20b407cd76fe86e68

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

