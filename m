Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541959;
	b=pREvAM7Ni3/TBRsGJmuwqwtXv8RELPDCAOaZXhUak674LYa39FnQgddPf5HRrzuJBg+b
	 +df6UW1eFwdCgWXasnPxlitCXpjV80DOM0jrJWv8ylzn/d1O8T78zg4zJ+qsUTqfZo1mt
	 FEPopkMVfb5bSPb20gMvuKg1Gvo9GsRGxp4sHaNmbm1vvcUzlQoXXCWnmyX9GSGujr7dx
	 qMCw1XUVSlINgOkMQslnZlXLV+RlhPYOrhjGH0cM6jCx67lLO/RdX1oJuEj9bgkzPcBGT
	 Yn4rTHjl97TyGxYOCzN+tiQgqJbUtRCuDfPHP8JMz8W1CAgmyUR1JRW2ZcCjrQoPhqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5eaBZnDCVfRabxJIJDdDONm6fhD1rR7hUy8thDW0u7c=;
	b=IWj/LpOZfyX6jeFMRT1oOj8PLgcsw2xouRBTDuxSkRQ2DzhWTHRwdRaaPFppFRekFzmy
	 8UNEOfSBpbcbacHc8619EyP5rCBWI99iakmQ//42Kh9/6xMWFBUolsdkudvtl8xLuhpgY
	 8jEjcDnFhb71Pniusm3fcIVLllLyIaHOxLA/EsQf1KKe2UkguIU4AtuwoPfaLVumB2Qx4
	 7xoqj2T9EqX4S92EeylnGdm7LIJpKuA+9xSUD+jMw1w2FzLNUPQni1h+/61i7S6w8mGcL
	 SvXX/vLlcrnzKrcVK2w2xq0OIYInxIiY2l8wv9oBzIkbP5ojnfCLU8KtPkz1H1JpTYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=aTNUhhYB;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F87F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F87F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=aTNUhhYB
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so144903a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792541959; x=1793146759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eaBZnDCVfRabxJIJDdDONm6fhD1rR7hUy8thDW0u7c=;
        b=aTNUhhYBPXb4Fb5KI8FnGv/yl41UzhK7F9zKmhigXfUmtVeyLgADuCyMCH6nMOONuJ
         Q53U/g7I/R9frRVQWqeW6wCiR94UNCRDBaK9dn5+YyK+TMxBrARynGwko7IQW//0vyta
         FOuBfj4pIkPJIq78Wua+g1QbQi6BK1akPFDHpkihop7w/BwfBrP3s3t5gOtMTSiJszTn
         SbkA/pthRTVAhT85nxpEDBaea53ZJVfF0eJGSiP5icDzV6Rsyt4djG7oZb5ENUNpxyzG
         SgHHUX1p3GN7LO5sK01zDd8WxfeswBb2mHjdiQhAoC05Jb9lZBjFNHBgYdq0BUEuef4T
         fbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541959; x=1793146759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5eaBZnDCVfRabxJIJDdDONm6fhD1rR7hUy8thDW0u7c=;
        b=grFEq0rmH+DKDWpE4YV/D8KJG39W/f06C/7yXW3/PQNSh/C7rTrkJHbMxcr9uQSYxu
         cTgRYYfwczlLikHGd7lFktGcqMHBKUEki5EjG5EryeOXTmxsxSkjGa0jiufuq3cjmFIr
         vU9hb0azFqujexiuSuYS6YA/buIKyd7ylhEaeqyWVFhamHpO2XSKFA7tocBD4VEXh2Bi
         ThvMPsmEcGOXzv7nQXbaD57zvROKylTo649G0rUSTH+FzqFG348JR7Kx8m7dOI8Udv+N
         KdnWaBSjt+KGhlGoITLPqwl4xcX5FJww36m5h8ajheQegqo3JBGaS2WPd9UACBCagKsF
         A67Q==
X-Forwarded-Encrypted: i=1; AKwUvByj6p1qiyuZMFluveO1RhYoMXStxMJQlkxXnoUm87mVGl3ktiCxGoWuCuoWfSEfewMn3F0rBOGbEoxMn30=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoOUAueoae7p/+Yv0XZNpHNSBjQnYLQ5snUYWth4xr0CCMpskK
	noirM+0Q2Or/xq9SiGU1sGl8u+G7GYEStjuvSAN7AxUicRnTgWO/Be5wbBfDK1M7Cl8=
X-Gm-Gg: AYBFou1DP2ViB7Ov8ZX6ynVCfGRzjTmMnHZ41zVd6nczc3lmPbhfNTK85Gsq0X0ZOCQ
	AclxdtVXDjUvXO0itjF8/sLytI5yBDN5ajlmcTfSN5uJEVljrrpvTFtsBn/1uOnzJO/vDtKe08j
	0WS5IEKWCoZrOb+Fvxe+WL6NgMQ6i1sSDDy8PTYPdRKwYIvzqNtbVDVRI5/sk8GJmCDRMajbjzo
	lceY900RS03GCqlWtWlLRp1kUZjg7wDmA696XiCNSa8rQsa31rqPzD2HPdnzshlZ5VxiUithTyD
	pZPRnpAllYlHoTC9Q11a2OrhqTz8Fx6eEgn9RKLNyA1YmvNJSfEvf5EbZ5B6LXYPh1YSDGhNFWw
	iUO2NvhUO/XPQTtp1cf/lH8xCiOW6xCrYe1kyOwXLSUN4Ub+Lpos04/kvrHraUQgJPncvPDKc3t
	eo9xcz7AY3AxEaz0lbjIDrsW070TY8d3z8Lu5Y0yvCofC9PP9LUPaEN0X2cYi9+ITFHZE7UGfGg
	ZlcPx2yFr15IMdeE8GQ5b2CQTuFma5i+684Ey+1kwmVhjIW56HJOVIrCsOsGvJ1wKoCVUC+gK9i
	M+s=
X-Received: by 2002:a17:90b:2646:b0:3a4:ca46:8d44 with SMTP id 98e67ed59e1d1-3ad86f1c073mr414697a91.18.1792541958529;
        Tue, 20 Oct 2026 17:19:18 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:e416:85ef:f22:6c5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8021ac2dsm1570973a91.5.2026.10.20.17.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:19:18 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-reviews@lists.linux.dev
Cc: Bart Van Assche <bvanassche@acm.org>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH] RDMA/srpt: widen the RDMA context counters
Date: Wed, 21 Oct 2026 09:19:09 +0900
Message-ID: <20261021001909.2343045-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-179333@kernel.org>
References: <20261020155725.2251969-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-179333@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.

You are right: the indirect branch of srpt_get_desc_tbl() bounds nbufs only
against data_out_desc_cnt + data_in_desc_cnt, not against
recv_ioctx->byte_len, so a large table_desc.len or add_cdb_len lets
srpt_alloc_rw_ctxs() walk idb->desc_list past the received IU and past the
req_buf_cache object.

v2, which I am sending now, bounds the indirect descriptor table against
recv_ioctx->byte_len the way the immediate-data branch already does, in
addition to widening the counters. Thanks for catching it.

Yehyeong Lee
