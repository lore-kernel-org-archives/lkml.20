Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB558379C39
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699477; cv=none; b=d5RLXuUePZpNsY/w8p7dtINRN+xKwUGjjvarwQyULknPK1ap8UVCvzVlKgGtQCiUL0Qok4o1FHMt+RnFfLF5QEv/F9I8WffuuWmxUbm9PqySFlSCaBL2NQ4BftyQOirmZIGeNJSelKKEfn6R1lIeUv4dXCBg1vlw+c/2y0KRxJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699477; c=relaxed/simple;
	bh=OEOaxWs1n1KEj9eK+tEAQuvbaxH+XlKjURmSbxlf2rU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dfMSs0Bh6XGokdwtIUClWsXP5n8PSoBZmon/f1v2xzaQZ3T4MAu1QAc2uoEIvOJtjMgZCqp+jrtR7RoJDoFGOBd0WaiSDAKMBCBWxZ10otqWvxHnce9AQzJiw6elJFe55fWrbABtldKLbaWUMqo/m68kZ4znWC+Oudb8SP1ZUl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c3ckEf/M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dB8HAa/x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c3ckEf/M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dB8HAa/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790699474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0GhJ0I95kTI3KJeAMAJ7HgttEnRh8aoToTZ3EfI9hs=;
	b=c3ckEf/MWhI0rWkQjz7FqHPG5wB+XJUuQoWfYlWS71Pi4/KInMulH5Drb8Gir1oUqkBs/R
	0CwJKw3wcjzOlz0/c3OFQF8ChyFe+i92qpPFddwYB7rwnmfhC3AmE7OSAhBn1CItgR98Nk
	BsRtGrp3qRcgGbCHijH+ckchM3ssFbE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-re0YvTxrOPCgl-2pcKagyw-1; Tue, 29 Sep 2026 12:31:13 -0400
X-MC-Unique: re0YvTxrOPCgl-2pcKagyw-1
X-Mimecast-MFC-AGG-ID: re0YvTxrOPCgl-2pcKagyw_1790699473
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-89bce1a2012so27433427b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790699472; x=1791304272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0GhJ0I95kTI3KJeAMAJ7HgttEnRh8aoToTZ3EfI9hs=;
        b=dB8HAa/xvy52dI9HzELpHCBESUkP3YZ3DJyr2SxnW1xbSlyxygkl71Y7qk0AWeWWLz
         A9dhbu7qX/Oqbh0GOKFgiC63OsJWRM2DP00b+wt6B+S8IpOXykioxaKNfyc9/dveh/r+
         1EM8ENgqFyfDL88j7G9OMOF/pyuLEXiIeuIin6NpXy/93OY1LETmjfG2tG7eMwshphML
         48QsTmc72w1LnSjUWZzLu05jefkMlI4ZAShsTKkRsrsyVdJvgTVcxSBIm5Ohq6hMuXaC
         u/CSzukyOx0AEN/M8bRW5Fx+yFTwkdnl0e2tNaTM2iAWuco8BqBnleUfcsUdXx66Df1A
         1OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699472; x=1791304272;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0GhJ0I95kTI3KJeAMAJ7HgttEnRh8aoToTZ3EfI9hs=;
        b=12pXTsk73n7kCGWAS2yxf5mWzO2wFy6dmvNSTDT/W0p9HX/0E0YLNnMlwj6jkdjBH7
         p+Qe2JO/Twa1V4D1RkCdI4Bap4jt3c1XsXhwSUl9v0kyYO6/HqIUpfuxH3ggDtSnkd+n
         JP/mVsnvc/tqMO7Nu06D4xZlEXlqVZKMYO+GNn/8HuuSkZ5MYuPc1lDKHFhGwrbZL8BT
         fvapcnjnGoajaeAgU2MeDjspvr2niicuMNKq6UFlr0wmq1ErtxxwR+4hm4qfJXmRc+RO
         ozHj7ENtYJaY6nXsELCtqrxH/lv9CGCNfmLbyPsNuKKJtcFUW8GYOUDiLwvGGaVk+4g2
         +tHg==
X-Gm-Message-State: AFq9FYJInTx5VM++qXqki0MA8I8TQxG1BrEsFEI1Q+SGpvIYTTBZuMaR
	0y0DBRUk7JquVpA6DwG1o8W8D0Z5g1cpdAc70Z4r4IFPZxeN484dkQIiPFeS2gkTPCTOTA31qHz
	HA8JvgVUWnOSf1Laq0kKlKLOLhZmknrNFerRtO6t3AJGlkTrz7hWacng5fpLdSD4+aQ==
X-Gm-Gg: AYBFou2iqisINXafLorMd/OnViR5sMR4HMU2tsQ2NBL2wN6t840dRC8Ga69Dp6DZGUx
	v5q9p53ZCNA6SgLCm9qStal/v4oWek8dtvUESAQxhL8nlvrzND3cqYHuN12cc/5EZpfDmOzWK8v
	6tHsR6CPVgBc8VzL5Y2r/6QYIBAtkVvcKNwuwEYQhCGppRlAgRHktwsczn70x0Zw+BtB8Ye7Zsj
	pUax4MOVjNgjhlHx2Hlcfwiqq1avbW7vMkuXlx04RjnJd8Ojft2DAdClS3hNTZdurnVgt8Rsboe
	3hCOCrIjOxBy43QTxjKCrSjsVHTKXHPS6PVBm3VlukYCuWDp6E2Fxmmgnyp7ERFaas2kDREd7B4
	oZAkrxQEkRRNZDjE4o9wCtgXayGXOxbf0yfYuwnOx6ZDYYA58DNk=
X-Received: by 2002:a05:690c:dc6:b0:873:ea3b:6c08 with SMTP id 00721157ae682-8a64bb00581mr74547167b3.1.1790699472604;
        Tue, 29 Sep 2026 09:31:12 -0700 (PDT)
X-Received: by 2002:a05:690c:dc6:b0:873:ea3b:6c08 with SMTP id 00721157ae682-8a64bb00581mr74546737b3.1.1790699472127;
        Tue, 29 Sep 2026 09:31:12 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d395791sm14017306d6.44.2026.09.29.09.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:31:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
 phucduc.bui@gmail.com
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260724065658.20405-1-phucduc.bui@gmail.com>
References: <20260724065658.20405-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] clk: rs9: restore cache_only on regcache_sync()
 failure in resume
Message-Id: <179069944424.199845.126587794600582656.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:30:44 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=343; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=VAScFuT3EVDoLBHZgqe/DLNe+zacgtutjjxzN/a9rpw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2Pz+zQTne5Kj2Z2mfDxdTQy5MWer25Aq739S0BX6nX
 dttOKbXd5SyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARgTRGhmezBee877/HZMyY
 zmL95arAlKVfU/5fjLRYbjl3b9nsqp+MDNPZWN8XJry5sT24+UtK3dab/t9O3/53Qtv6HFvm6o9
 H5vIDAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 24 Jul 2026 13:56:58 +0700, phucduc.bui@gmail.com wrote:
> clk: rs9: restore cache_only on regcache_sync() failure in resume

Applied, thanks!

[1/1] clk: rs9: restore cache_only on regcache_sync() failure in resume
      commit: 29e5259e30012bfb0f48345ac7d89999f17e1f26

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

