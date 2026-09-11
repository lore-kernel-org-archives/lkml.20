Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD17D413780
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789170229; cv=none; b=kIrdGQaS781fCs16WOETolxPr0SZt+sIQ28zsao4uuEAKfqeUqfaRmMvFkilnCHIK5TZpKmP3Mqp7Hombyy9tt0ZZTke/8Q7stukjdqqm7yS3zJb25NjY39y1u0I/E7lnmDkKMQQlpuJVzle210eRMEgzQ9iTw2T3eKVRW9oktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789170229; c=relaxed/simple;
	bh=t+XJ1wAgqNN+WEeHaJOlrj19dPtIsMw6Tq49GRs9p+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FkVvvLKYSt20EhEypsa1+PFV2zQ+gIEgGfULk5ryVg1ZLTA5mIO+8yWeR4dSC4VQkGMy9rJTgiPlzGKWn86TH8zpSo54GO/ebjEA1ijs54G6/mYxouRI4HULrU/+oGBGjFaIyqrLXHARC8IxHZL2K1G+2PA02uB7KjFe6z1sk2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GVGIDskx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WPCr/vCQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GVGIDskx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WPCr/vCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789170225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrXBM6ELMoiHPLYGYVdC5KjRGl3AA5PVydRD6qLvBRk=;
	b=GVGIDskxhaOGTPG/0YdBaxd4snt2liOFLnCKuEu2/lBvorP0M6cq/uK4zzH88TnIoBkEHC
	WzIlyKNIbivumAN9O/C/g9AmzfQIh8U7+rmyz1y4SfF5ZG+w3KS2eRlZlc/LTz1C2fGIAb
	DrhBD+Ehi5T4vn9hAas+k+PG8eTZrQE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-N_6zv0nNMZ-jA6PHv-GPxA-1; Fri, 11 Sep 2026 19:43:43 -0400
X-MC-Unique: N_6zv0nNMZ-jA6PHv-GPxA-1
X-Mimecast-MFC-AGG-ID: N_6zv0nNMZ-jA6PHv-GPxA_1789170223
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8472ee1eso26502726d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789170223; x=1789775023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrXBM6ELMoiHPLYGYVdC5KjRGl3AA5PVydRD6qLvBRk=;
        b=WPCr/vCQnPwNIqduVwivRqn4s3AAGZGD75inAzVoQZnlUWwm8uSsVDFXf2Cu13ElCd
         xXyWumu3UTeIfl117Bch9zTI93pdHlBespxm3FQRKMLVwr4RuCLuTjlfLGr505AUVHL8
         rkfk0aBGrYwbw+lhtIUtLd0Kr3nbh//eUdAPAKQ2V2Z38x3h6r/VwJ6/a0y3BA5nOvAs
         hQR8JlgNiNEG0zASVs8EiIRwC4B2tQM6SU3rZN7g28gBS0EJbseHZ47sQnd4CieBnOT6
         2xieIWdhQ9XcCQDxnrgRpz01zUo0Ov6ekY20FDy1hVxbxaWoprSAT2OKnn8C2XV03Mxf
         IckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789170223; x=1789775023;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrXBM6ELMoiHPLYGYVdC5KjRGl3AA5PVydRD6qLvBRk=;
        b=YgPokYcBwNc/e0EhkmSYBm3ED+ufyjvKCGEuG9Fug9jRPpTLqUNwiU+DHxlOaK038h
         Vdyrua7fEiFYwAtYvSGYc1MP2/YqdzR8RyciGCQ1vm6P3q0sQJwsO8RAgvKj+aNnti7J
         IVzUpa0n+WbVe43ntP1Tt16Z8AP4thi3Sek3kUpYJn9sx03lzAvBAINwxEkcfHPZUQaJ
         MG/2RciUhIqpoj2VA+akmezksTUE5r0pBOu555c0Hm6oid5ru7kI5KyI1kI0jCvyat/b
         jAwXNhgPIoqc66GCAyIWDYZFHFQvXAGj9XMyyIp0pze5YTEysk4TieKSwOTYMs2zQtPu
         Z0lw==
X-Forwarded-Encrypted: i=1; AKwUvBzGhtQRHN3hmxE7l7UlCLQygSUbitHGT0Iyc26GSCvuoZJ6s8pUxa+TvykKrzj9pyoaNgmrqWOB6TYlWJw=@vger.kernel.org
X-Gm-Message-State: AFuF++mpZD2evOuZo/5mhtMFzUXE3J07PQjbFzl9oZLCA1tBNnjGk0ZB
	Qkil4nB3lFcilKKW9XnHdPnkyIwraiZmbnOC72nltJ2tM5i6RKVgsSYCyLAHKCr+h1rHoWxQZgw
	Ks9smF1lhXGKOI6FybOhTY+lgDACkH0cEPGEFpnjjYW/rrxJhec4KtzxsLRvxExnQKQ==
X-Gm-Gg: AYBFou1t2zsmJ0HvdwwTzblnyZsX/XzCj5UjuW/l4yV6EcLeVbgoPvtrykoH22dnMek
	dMs8pRFICjUTGAP34Ayh9xEtpCmrxNM/Lgj+VfJbgf1msvptZziH9j7ZT8gTAFQJCIGnbYSRIK0
	oMtCHEY8wsqovh6+FUOE9F6V1J8RRsoJ7J4mf4J0Fbx67bX1leqFKAv5eSDSufCOHFVMg9R+Diq
	x6j1mJq3nvBasy1uRprIYY4z5ep2oWiWpNQlfJwAchyJAc8cUxqiuKXrT6Dd3VNwIztiOtg/8im
	IElVNQDOF9s7HeRX3JpsHYKaWd8HAhRw1KlZgDx2I2d7a3W3xa+pvvO+jYZigNRVgNxIVDkwqUc
	cjcCY9WNy81hiIhaFIrTrLrkNUkMyQ5wnHmUCF1qG
X-Received: by 2002:a05:6214:2488:b0:910:c44f:a81 with SMTP id 6a1803df08f44-9121208cb26mr112458266d6.10.1789170223206;
        Fri, 11 Sep 2026 16:43:43 -0700 (PDT)
X-Received: by 2002:a05:6214:2488:b0:910:c44f:a81 with SMTP id 6a1803df08f44-9121208cb26mr112457906d6.10.1789170222734;
        Fri, 11 Sep 2026 16:43:42 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4b699bsm32669266d6.37.2026.09.11.16.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:43:42 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Marek Vasut <marex@denx.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1788429994.git.geert+renesas@glider.be>
References: <cover.1788429994.git.geert+renesas@glider.be>
Subject: Re: [PATCH v5 0/2] clk: rs9: Fix and of_clk_hw_onecell_get()
 conversion
Message-Id: <178917020377.797851.17967029704962049887.b4-ty@b4>
Date: Fri, 11 Sep 2026 19:43:23 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=775; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=wHbn7taKCR+nnBU9VHVAYBmu4IPghI0uhBpzOhfVAsg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKWTNKZI7e3WHeDw4ZVZ077XknYWVF4SKMrtXSaiPURv
 uVaF7gcO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIxj5GhscXikWsls33/XnD
 MK2+pz9VsX1n76udpxvsW6Z/1PLcoMDw3+8rU99h/qLj1doxH2UOhBxhNenpn5Hs/bX+wF7B4zk
 hbAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 03 Sep 2026 12:09:24 +0200, Geert Uytterhoeven wrote:
> clk: rs9: Fix and of_clk_hw_onecell_get() conversion
> 
> 	Hi all,
> 
> This patch series contains a fix and further development for the Renesas
> 9-series PCIe clock generator driver, which were submitted before as
> separate patches  As the fix hasn't been picked up yet, and the further
> development depends on the fix, I am resending them as a series.
> 
> [...]

Applied, thanks!

[1/2] clk: rs9: Add clock index range check to rs9_of_clk_get()
      commit: a2ef401bdfd19aa41d0e3e1b630a12fbc01ac184
[2/2] clk: rs9: Convert to clk_hw_onecell_data and of_clk_hw_onecell_get()
      commit: 07f4bac13786a80cd3e6547051376ea65da2f4c5

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

