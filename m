Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CB34CC270
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453809; cv=none; b=Rhsq0ulXT6Nsr1/PEXa2FcStMDLtdQZ7K8BGpH+vanKYioFrMVYih20g+/GMuoecyqpjjynRdOySZdt776zwKx/h91VUVGkkRc/jkXUpF7I3J00qB+k3mRM/IIfpd/MbKwgxTWfeaOB7F6QTYkGqKOnnm9nhu9cYYfUJGPfqFGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453809; c=relaxed/simple;
	bh=CXulU9ugcVs/yCyjMFB12dfhXuE9IH7phZFtkCoFrBI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fLMXYG2MHIXRdep+qoBWfa9wy4WV3G0wO3d9A2Kitd+Bm6oppWXbBmzhaL5WXwLtFmjZBN+LURR44mWNK3rGFKaFxnwFHucA/PWdVjkGCPc6PqnlcGw3KlMr3/MWxswz/mynZpPeXLF/ixRHYKUuCEMbaSuq7dp+eoUe/XhDapU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AZBf8kMJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NVW9GEVf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AZBf8kMJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NVW9GEVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788453807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8sg4Ic+uUI0uGmJLbnp+7IK0wyVe9CAzpqU2xH+Oy4=;
	b=AZBf8kMJCtONmXIgwta5xY1AOYHUHlZCULkcHF3C/Q3bLd1ai/KKtozVkGjE0x5+C3meOk
	vYb4Aqh4lte6L+8qEaPggJFi33Luu7+X/QN2aiLBHZF+nUa6KhMjaFIjH/jWA9MbntsYzN
	yLnTmqn+Ry2LJjpnN7aeXTz4OsjFnus=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-JSTcTtggOPONZ_OnXtTtlw-1; Thu, 03 Sep 2026 12:43:26 -0400
X-MC-Unique: JSTcTtggOPONZ_OnXtTtlw-1
X-Mimecast-MFC-AGG-ID: JSTcTtggOPONZ_OnXtTtlw_1788453805
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec3146553so717802185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788453805; x=1789058605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8sg4Ic+uUI0uGmJLbnp+7IK0wyVe9CAzpqU2xH+Oy4=;
        b=NVW9GEVfN8LNsJcDUxITXOQ/bcHsNPrtQoSWpU65z5HnuJBLmlJhXzLgMamVh8XeQO
         7c+AcIBw/OYg63F4HEit7ffyy3FnwR0aRTefdPdhDzR+ub+j4C3nl7i7/IzxRIJ3lGEa
         9iT10r+Y8jf8dCoG+nIffwGZuN6TfhqAS8pqB98OWqSasQS9iIN8Vxf/D/vA7q3jJNFN
         1FH77GzgEKiESQpUgZyR4LbeY83ckoBsMUItn0YuFYyLatZM7JHDZ2lXCAOgb8IiaxMW
         0n6ZAvQloMFbXuv1J2VS6tGzasqJInWfYypse7Y1R1014yftSsRfq/UntkAeiR0lq7CS
         Oa4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453805; x=1789058605;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8sg4Ic+uUI0uGmJLbnp+7IK0wyVe9CAzpqU2xH+Oy4=;
        b=sRdzN8RDwMNyt55gVBTJ7OyWtMeMZu953lvBwysIeZbKfH89NqQnRxdOdEDj6s3q4D
         K8/4l9Y4rwSrMUdl7l91wEKaO9zkcfnxuC05hiW8UbnQWf/NyB1TDmeUopQ7kPzzzScH
         OaBnZBaFKZiI7xFip7BythQWe02r46auGiKuoE0zGDKX5X4nvp/R21NbEvVFPct/DgNh
         vyIWtejxdad29IEvSTo0xHKau/Wz+hVcaxND+Ik3qmapgh2xCh/DEJ6u6pjAA5Ol8Gbp
         Yi8Dw8WFNP0YHlP1vD/ZXou1QeVQY2hMBEwEjl9dwXCEs4g5DY1Tkldi7upIP0yYaQY4
         Ecmg==
X-Forwarded-Encrypted: i=1; AKwUvBzdvD6lMOxa+hd/VcxldXjPpY8oH8s37UEJjB4KCMrd6FlzMAChmqnNrtCZewooTEsvUvYpOeaikbEZL6U=@vger.kernel.org
X-Gm-Message-State: AFuF++mFW01viMuYRQ1MUPI6xgP2BgmSMc+9uVghuy/YZxUHy+gy3TFR
	7cugdJVLnk+HQsFn/e3Ybats57yypAkTVhCk/d4WpenGLF8kuncrCEE/3h3wxoXWoPTlqQaDIbM
	KU/G8DXqhKjgzQkib9lkUdl2nG1uBL2SzfMeciLZe88Fg6+b8J8vaCuFdl9+NgCN8TA==
X-Gm-Gg: AYBFou3uOllrvLmFU/ek6/GddPfilCrOj9DpHRUm0PQ5epeurQqeXISuDfpOG+BW0MN
	qFIkECaMIppZo3fjtUHnoosfb3O/EW3QUXxSuetmqH+Oxzi6CAnQ3o/bhxXXKCcxH+0qfz7h7Pp
	5K9wV7QlwtKdhYfkLll/Ahpo5PI3X5nJgk4zg9YKe/C3mh9D+2MlqKRB39/79NV3XcyL+uOCFno
	WPSnFfeh1yYoyK20tfL1P1d3hv9DJwAVeiSNJ/v7H/VhlCIJbcPRWYwBSHDrJ+A3jM1l93Ipik4
	1kIGX8VCpJkJijMBpczttR0BV+Ssy7bM2L+s9z2w7Vs25wBn2oa7OC49FQBXVhJbyJ2R7H4jIbu
	Vhno7dv+L4lTosMvpzjuBNPes9u+vDxoZ5EQP5Cs=
X-Received: by 2002:a05:620a:6187:b0:939:6df3:d7f6 with SMTP id af79cd13be357-9396df3de25mr992454485a.49.1788453805439;
        Thu, 03 Sep 2026 09:43:25 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:939:6df3:d7f6 with SMTP id af79cd13be357-9396df3de25mr992386285a.49.1788453801386;
        Thu, 03 Sep 2026 09:43:21 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee270d0sm47491336d6.18.2026.09.03.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:43:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
References: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
Subject: Re: [PATCH] clk: mediatek: Add missing depend for
 COMMON_CLK_MT8173
Message-Id: <178845378565.22448.12859439275506649984.b4-ty@b4>
Date: Thu, 03 Sep 2026 12:43:05 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=317; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Y+oggqG3Z8L+JxkjNpwIvq7dXqEwG7Da2Hajvvt/Msg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmLp4vln/w9uWnFpMnBh3+s5IzyCRo3jTeQ88mBbj8y
 GR/EvCgvqOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ3Ahg+O86/dGb5RGeNw8x
 nv+Y6dMhWWrzZE5A6oGlMo+NmKP7Cl8y/PfOydx3s8egMeH7vrvRv2R+z3jEeTuj8P9/m8aGvU3
 r23kB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Mon, 31 Aug 2026 08:50:56 +0000, Ricardo Ribalda wrote:
> clk: mediatek: Add missing depend for COMMON_CLK_MT8173

Applied, thanks!

[1/1] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
      commit: 84964d0ce3faed815e1b8e048ce5ce1c93badb18

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

