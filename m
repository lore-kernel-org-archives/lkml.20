Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B7C501281
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698081; cv=none; b=AUKPSLjec6OYdwnGCvOFyVtwMTBYkGNQUXyHvj9ovoCiXN2iSNwSNvGpPbwpKFRQM2RPC9dgzi86Z8QqiSHiryXZ3ML0wjjusuosAfRgEdQgWT455uM5q7qNt41P6HbGLhlJxYgALmx0tOCL82om1CmqSRW3CC9u0qZyRw9Uf3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698081; c=relaxed/simple;
	bh=oO20afitQI3DRoBEJ+TYTGZ3k4nyS/yHP02w42WrpM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MkLVxhhew5tSxE8IKcKymAtJspkQci+62HZz2/AjTtlr0zhRUszbvqLfp6sBMEJ+KkMK71J7B/OAAd8JFSHVAMtMqEQo32hHs0Em1SsOtLZNALThezCWkfukaF8RCwZ5m7LQGCL/WfDdjAjfukuxCLMPxGG3lPjIGGF7FIbT/3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QqFGpr7l; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CxoH9Ds2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QqFGpr7l";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CxoH9Ds2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790698078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YICz6wkOnVYmVxpwpf1GoF6EDBToHXCYtSEDFbfB/RM=;
	b=QqFGpr7lGNa8eTVPqvPIpd/v7izSZOsEko30eGJWtjT/cKBkDZMp/yBJLbm1+pGPPEgeVG
	aUk6/C9D+1sv7osZPeJWCd0AnM9Eng+bv452H2GUQJuhhiTmYns3JJ2NhPvIER6BjMhoEX
	ObbVkeb7g2CJQmLVtblJkUJSTZFe5vA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-QgtPI7e-OLys-GryoITsVQ-1; Tue, 29 Sep 2026 12:07:57 -0400
X-MC-Unique: QgtPI7e-OLys-GryoITsVQ-1
X-Mimecast-MFC-AGG-ID: QgtPI7e-OLys-GryoITsVQ_1790698076
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5328dae1305so72933631cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790698076; x=1791302876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YICz6wkOnVYmVxpwpf1GoF6EDBToHXCYtSEDFbfB/RM=;
        b=CxoH9Ds2ARZfsdH0wvHPlvg93wGI2pVCbbFL6t37PEeCgnzYbwXlmk9aQ5yhlKI/1e
         RPRKTJaVPbyH/Fsb2BBgwNtmVAcJioYy+A81eTDX4xqepT1oSo+bi42r+cEO6ag+vrF7
         VeJfGOmEYw7+o+GSfBA6wPYvthEVe1lOon8E9qWvcl692Qoj2eU58qofD3o832JwrGPb
         DKn/Rq1LOKnbyxShJV4+b57Qy4xEUXPpXckvwkVuAxDVeLlOG3tkFgw9RLAllMt2laem
         ai6SzfeZMXgqhrvrf4mKpGh5jQFzj8Uv0yFrSJ7SaydZFpMLNL1Hyu8xH1ODbUO5PWOi
         5vUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698076; x=1791302876;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YICz6wkOnVYmVxpwpf1GoF6EDBToHXCYtSEDFbfB/RM=;
        b=gGSA1vkotww9Kecp5gWvwJgyg2vyfKqdODNCQ+pQ5EUj7Fm1OgNa7sJrYgzg0UFvXZ
         apCeARzjzB7u51arIjDzzSga9fHcwxIUiVLUenrDr4E9Gpn4Cjt0dnaRiA1A69Zod2OR
         A2OxwR0fnQLFee6i8Q7bD0B0TtQMcpQmshKiE/wDJrhqkRFWl70ZML5FiFj72tjJr6bd
         KhVLZvozteLD+zw/HFvgM2Rwi3NecVWIH24PnkyaNh1hAPDaJ1UV3ICvJRQr6HwcfvPe
         xJMeBaspBInl7vY9gI5YrCz9CrvhLpV7i+27pQX+yeSNIOk2sb/Rt4Xel6Sxw6Mq5V9k
         fvsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuVxFbvrcK5rtJ1PO+/qVPnsrW91Zc3myrm0X+oeTFBYWXz5ZTIxN8koMsoP3e2ntRQkFFrbZqIsfZJqc=@vger.kernel.org
X-Gm-Message-State: AFuF++m5eSjjs1zHdPsGNSDaJFBWz1pdPuDsDsyd77OyiwxRaNRixvQJ
	UNOUj3u7v8+YDGBKHoJvCGqbpyfDaq0E61MS1j9WigeCZQnbX57jTbyKTBFWsxP8qVxz+MksdSE
	QPkmJutaLqFNlq/6HZaJDwLfGvTi79LGmK5BAUkU1aInTghHgTp76sibYLyZVsFqS9w==
X-Gm-Gg: AYBFou0eXXpqvNuku15jRwUB4/ShPL1SxsAqo64o3Dx7ULV6CLFI94rvr6n2+qPomim
	vxGgLW9DXws2Ns5JtgNysVd/9jxq7pbmH+++rFHMDEc2Spsh/37La/PeGF38Rr6ZYb+AcA7FmH8
	O4JOrgtyi2BOMT99ug0R4r+oNbTCReiZvEgS7fpg4YWJGih3cdxi4bbMF8HFPXvPicv7yu+dRwy
	mfOrnsI+6glqgarmIP3lbSDPgGf04sE7cSuDqMUBHiO9oQas2VvGV5uCg6vZHYqtMmfDWbEi3xp
	I7rZRTHWeIysvAmr4BzBMOq0es5VINEPrnOdVj7upUgKUac0DMMyH/0a8WWn11fx7LNfG9ul+TB
	0q66Fyhq6BytbDh0paRFM6ad+SbRF2PWBZss7YIr7VWnwyf2f6NY=
X-Received: by 2002:a05:620a:4381:b0:93c:7955:afd9 with SMTP id af79cd13be357-93c7955d94emr1435196685a.52.1790698076391;
        Tue, 29 Sep 2026 09:07:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4381:b0:93c:7955:afd9 with SMTP id af79cd13be357-93c7955d94emr1435188685a.52.1790698075843;
        Tue, 29 Sep 2026 09:07:55 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f4c06a5sm2828085a.22.2026.09.29.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:07:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: kernel@esmil.dk, hal.feng@starfivetech.com, mturquette@baylibre.com, 
 sboyd@kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260604064314.3772678-1-vulab@iscas.ac.cn>
References: <20260604064314.3772678-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] clk: starfive: jh7110-isp: fix refcount leak in
 jh7110_ispcrg_probe()
Message-Id: <179069805856.199845.4030674011944202692.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:07:38 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=342; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=aDDleVR0etIFnvKWHzkitvvdqIxKDBW1b3ZUHEDccRY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2Pwpf9/BMceonriV3lBM1e9Pniza9DLq+cUXppA/b7
 0+/O0P9T0cpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATKYpjZFh894RSWHDcsnl+
 hUklcyz2m7oLMM2bnqAqrHWwMv5VoQkjw9f/zVHJk3V2WfGHecwWE14qMcngxbP5J7unBn37fE8
 pjRcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 04 Jun 2026 06:43:14 +0000, Wentao Liang wrote:
> clk: starfive: jh7110-isp: fix refcount leak in jh7110_ispcrg_probe()

Applied, thanks!

[1/1] clk: starfive: jh7110-isp: fix refcount leak in jh7110_ispcrg_probe()
      commit: 1c4f9480473917558908c083d1293b4ebb3d50c5

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

