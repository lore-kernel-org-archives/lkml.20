Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53833194C96
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173055; cv=none; b=ERgOfT+y3HZxH4Ok2j6KDivwF3fwDEqI98UgI7gf4s06Dl2pxph3m1C3SUhW2qkR625d6+c/+bi3CQFDXuwBfBSroJS0wCBQ37bDQk+oz/oWlXgagY36piqVKejdMG/wNcconoIh2Kopfb1ynKwEev2qiehi3T7XY4NP6yPKAN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173055; c=relaxed/simple;
	bh=vKZbfu339lBD3I+7owcC+zyR9DvZk2xDRM1VnbxoUD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aHUkeES6iOeUzcVqoQcX1pygR9uCZJJVbFfP1hstn3ACkv1kN/NjaEv9HcCImtaFComg9mQVfqcjXpKZBKujIWmzfl5eS2ZEatQOVe2Pc96nNc166iFfD8M1ox9B3Wb4Jswu8CA/DLBYJVOLm2dObfJ/4O1KLAyoBL538x4FVWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F90zAfaC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P3eYI0YM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F90zAfaC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P3eYI0YM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789173053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vMBB68k8eOZX9nX6OWvjbHaAOl4ORk95pI/5ECFBVo=;
	b=F90zAfaCTnoYy3MHvpJUnBl5gnyavC7OMN612tO0KRiVv2q+tElm9QIzn8CRmC+ys1h8yF
	7Xn1NVjIUIgoxA6n32/NUfIANFzF+61jSK6tjBFw/NIJf/s+OMFXgJD18eaADOBX3nGPXk
	TH34GNZb/CRV+0LlFFeYbaNZgSwRHZc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-VYGFQj9UMgO4KZ4-TrbJDg-1; Fri, 11 Sep 2026 20:30:52 -0400
X-MC-Unique: VYGFQj9UMgO4KZ4-TrbJDg-1
X-Mimecast-MFC-AGG-ID: VYGFQj9UMgO4KZ4-TrbJDg_1789173051
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e80ce3597so28146096d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789173051; x=1789777851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vMBB68k8eOZX9nX6OWvjbHaAOl4ORk95pI/5ECFBVo=;
        b=P3eYI0YMC1pOH05rS7hnKQQWr+W70mR70RC7Mt6TQkjxiqZfUGBwRapUXo2YFx57Lu
         Nkj2pBB9xyMAoJBaggoeN3yuhWcE6/4tTF/rxnLoav+5G0KioijXOHsKadKPbTb207+2
         AWdwu3ighuyvtH6CQLJcZZxK542BpMqp2Ify3Slq24Bl4n0wxKLpOMLQcmt6FdrjGHe2
         rqaVbg55viWQx2hcAVfAQN2YS16CvMFfcciT2kaY4gQdeK1twseEhufs+XGdpVgzTxqU
         gt6uuQrIJAaaTFyiPeimp9nO/43kgkq22TZeb+OOBBiUiCYC+7KlwJkFPm6tGZIv2JAr
         pYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789173051; x=1789777851;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vMBB68k8eOZX9nX6OWvjbHaAOl4ORk95pI/5ECFBVo=;
        b=bR78TWyG8cwDNYOvkLCNzdnK4y+T9ciWJUXtVyuoc7xN/bDEEG0jO7D4Yuh8LugqLS
         h2oxHHrcAN4qi90OvOnjAb6l8WWyvXp5nwflCDWwtbpyRXSMnSaD7T5gpUMxyAGc6M0d
         nlXIc2BvdEC0DdcUSkR85QO9BkDmBjyJdj+hFu2EoyvaTRSdmdAoUzCVu5fh9/6kOVED
         bJFPobel8B31nvmMrXFeZN4Eub6jlFI+wQ6mhJn67AWuOhmXVSevB+AAzXPAJOx54BYA
         PNOoI4DumO8dDN8Pqdt63w5JaPbh+P2btuCJaMXh0VQBe72BlM8V11mOvlrFwH9yOo5W
         SkzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNx2n/gm6AgL6aMaI+3Gr31uLSgmxVwWEh2a0Q3eb2BYqz5OsE5D8JqRheBR0NKguj6oYht4FOfuc/XhY=@vger.kernel.org
X-Gm-Message-State: AFuF++mFCekleASLj3pQ8xhepKJyACeH1eeFk7RqWajU2VQM0AhLVBFF
	i/wNIkLAUal6bnvlOBf17gcV/D/zPt6qWYxqhSQwg+IikDfMzu/AsCCXzZ51AwlRKZIyjvRKTbV
	WR4kQNZtd2iV1XkpqIlMS2dtQREI5oEZ7oK7eOWa6MxQ7axP1hcvKHKmpTFHU4HG69w==
X-Gm-Gg: AYBFou0Jv81FFcOP+kadnCuK9R5HI8YNSCfgFdptiurSrVL1nC3hodA30iTxjxRtm+f
	p8bFPgG8WtHDQqGH73g0AyI8ygYAujbAnq2QuQd29L3m3cYeqCaLcAw9cJtmuJLZ4XJ1ufSojxj
	+8B7yQ3jLZgyfk8C8kJfyPjoejDVjI+o63zj9f28dMHFpfbzbTnLObH9Bh7r3qutZVYDPRULWpo
	G1DvpkQIjZEdtOqCCpHq+YU1FCgfuZWBQ+mgCCdrKznV8BsLb0H1LgyprzSVI56JkV6CiN88rx9
	Y2TzzRVgISqE4uZpdzXKLmS7s39+R2HqDobu5oyxqdQcVO59DqCJ1ts+vL0LZPCtuCGlbz7GWnn
	DB4Jl282DJcX/6eeOxGyMRml43+UwBgDT143kT4+A
X-Received: by 2002:a05:6214:f6e:b0:910:3fe4:e767 with SMTP id 6a1803df08f44-912120e27fcmr90311206d6.25.1789173051569;
        Fri, 11 Sep 2026 17:30:51 -0700 (PDT)
X-Received: by 2002:a05:6214:f6e:b0:910:3fe4:e767 with SMTP id 6a1803df08f44-912120e27fcmr90307096d6.25.1789173047878;
        Fri, 11 Sep 2026 17:30:47 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d51f4sm32995096d6.46.2026.09.11.17.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:30:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Pengpeng Hou <hppiscas@163.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Andi Shyti <andi@etezian.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260906033651.84082-1-hppiscas@163.com>
References: <20260906033651.84082-1-hppiscas@163.com>
Subject: Re: [PATCH] clk: s2mps11: Propagate OF provider registration
 failures
Message-Id: <178917297065.837981.2231676629415391817.b4-ty@b4>
Date: Fri, 11 Sep 2026 20:29:30 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=318; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cvd5XU2Bw/KJUcvrIFJB31t8tTRfednBzdTJ7JCC5hs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKWzDURVt1mW3yjumDLygmbfldOmyzUbt85xyBSICGmz
 Gfd6R9XO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZgIyzpGhmlPCyZOv9PVaLG0
 m6mmMfbPI/Fbxl/+l7UsP7bp447U3OMM/3O3zl15LoHNoMDB1Z5rfl4oU+nUSwz2QpOtSzgMkq9
 78wAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 11:36:04 +0800, Pengpeng Hou wrote:
> clk: s2mps11: Propagate OF provider registration failures

Applied, thanks!

[1/1] clk: s2mps11: Propagate OF provider registration failures
      commit: 276741aac3b56ba50bef59715ba18ba3f0b953a2

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

