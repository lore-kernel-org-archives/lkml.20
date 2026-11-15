Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745483;
	b=4DdUL8/raGTTGbO0XdtxszLT04/nztII7rmGHcRflk/djmLiYmIn1PhEOiZEitLCwWm9
	 FaK/cwz0oTme8WX39Bh1VL8u6q4RBgmZGg7HApGpHiyWrswIvyr+SxiXE0QTsMCcLv1O8
	 Qrq70WZygwIlFplZdASeo7MQI5bxwXUSh5tBiodbx3XQiYOOM1o9zY/E4AaWXtv4CrMk5
	 URdQhJlak1pUBnOexhWaSX9Edrev4EZAuRYByRAHIInk42PchSLNZb4Db0W2vRxHoU4Kx
	 3N0gv6fPutMujOV4xlmGxTznyXyjUmffro9d6fbEW5GR/5Ht/9E1hhA8URYChQ+sJhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dQeEdUb5WctY7WhUyxm+UbBUn6wGpNRQb78S7LtXpL0=;
	b=38gNUzOtb5VF775GbCdaGajw8maOG1uVlHsdZzuTD3x8KgaDFIxuNSda294sFYx1Kbjz
	 lXciqsddGHAseLmw3ml/KFXl8vDYndaIXPCqbWWq4gD8pIHlD6TekTM5XAQ+L5lSgtZNe
	 36SNrSIjKvNHT4pOGGxHmksZZ/5L/BbhS4+zVhXt6Duib6UYG9xQ3AOgrZ5yCgR2snqZw
	 IOBHnxTdHT93sMDZbW+icL2qlMC6YORqv1GJQT4B4x+VDFPnAf0dF2Cohnprl3q+wx0aE
	 Ybry6bmdRCAb1UUt+RKe6/FwXhOHgjuQvYr3XHkPxoaeHRkouYFQNr41eU0YpIhTCIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mkbshFRq;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F75606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F75606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mkbshFRq
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1933167a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794745483; x=1795350283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dQeEdUb5WctY7WhUyxm+UbBUn6wGpNRQb78S7LtXpL0=;
        b=mkbshFRqlbPWSsPZT8XaHyIMifNRB6pxVZHt9QipD5qOBoIhUdWRvBJYbZKYswnB1x
         25mmXMSYkrtegHBQzn5L/D0Gl/LpImeb3HtkKhGmXdj+E7aJ4A3sCeUnvFogscUaDpbl
         2kZUjmNiDELSEye71UJ2t12eM/tds67LjYa2HQsyIYsZ7V4+/zds7j71fUL9Ao0fUZS2
         TTg46ZMr4cDl8njTkBdMsrcP0qvDk5zlB3pR5CwidwDRnN3dF2sE9xJAPhIenf+CIjiN
         SmTGqbb8Vv0L3LQXzxoTxS22Ko6g2iUxjGVcYS1UIO5syQuAxrKzhacgOnVpMFngePPm
         O85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794745483; x=1795350283;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQeEdUb5WctY7WhUyxm+UbBUn6wGpNRQb78S7LtXpL0=;
        b=e9llzbWXf5obT8cvWqM/vFWfjRbdjFc0TZn6Ne3Nx2KT13ETZS4u9aaF1CeZTQJyUD
         Gm16BWggyUBWXb6zsq56gThsQqYJSo7mrayyJgv9hrZIi6keBT3cOCNX9C4rxFiKxPKS
         4EQM96Fv+LmP5/Q/MrgLxim08pCO3uriQSpM9bYneHcp92n/VJnbp4di47Zvpw2r1wrC
         +1jqYQMRyg78EDkfKCl4kqH71isl2ZWl4f+sb6i7pzGQu3voWAgVY8Kavb5aJvqGxztn
         CeSYSVL4K19ixis3DUxRDoysHelo0eEt4Yf2ZiX/eJuIQoMsd4YAk59A0B5RB+gmygKf
         Qibw==
X-Forwarded-Encrypted: i=1; AL+hErGF7ZDwyRps7LswPDI6ZyUv/clSPNjA1OlQzVLvpsoALLdyB+kwRanMWynA48+57FHQqOa95gkV1SwoFKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aGaywFsBUezciHO8O+8UpxKV8CO4RBdCHqZyRtT3HR2DkgV+0
	2crJMZ8womfYKP808BFW+LL4eDB7eUfp+SMMg729wNJwTmcMP2DrCFJZMkiqJcA0+1E=
X-Gm-Gg: AYBFou3Ls+uS/uZscBSH0N5sWn2KXHSuCTP0UfeuRnqinfHGaQI94fDCLcZpKxlqxv0
	r49RApnBVQA3sqIbDhWY4fyeWdfLpTG0Fsv4yXLSsdyMq4UJ+UyjYtl7SxVur/t9vc8H8qpbVS0
	lWL9e+LlJxSutnFuz/kPTcYbbQHY+h1g13eY/sdEXFKw5YAecBX0TkRR8OzOXK4bWFulr1vRxyi
	iCmd6q6UO+Gt8DJ0+d3naIIZC2bej7j7WnR1xbkPfLqZ2r4KOUww0fNZTUMY4RmL5sh7qE/jo28
	AaAiwQ67OM3P3z+KV6OjtCfOtdFJyP3K7czlHIpg4GJ6Nnl343aq/e99y2IqfOw7GJmA+0LSunx
	EKD++cJIqykFgOhfDhVzDMAcB0XA+hlDrkoQpAx6Ts98hYm1JPVICckSWGsevDGZQ/bxIuT4nuD
	hYdpHqu1WkWZQGNyAkfMFM3gSrduT6wiYRUx1O1YjaecbgkUePYxPA+/krp+lItFL121YfCTuPn
	xHkfZdQ1Cz0pJf9UbqTN6qyV5To/VEY5Mz5AnycF+vLZTNr8UazWShjru0NduQ9F7YHNg43ahPf
	kqg6bvhcNQoW28CmNKGWLMRkEF9R4AgN/6NyU7G8O8BofKjs3OFhbf6OM1a0DtOd7rZUsTaAivo
	+nl6TsLeLfx9vhsLPMPYhiVqB5UxYwGGtvHELGw==
X-Received: by 2002:a17:90b:2246:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3b1b0a0e12dmr8088877a91.35.1794745482838;
        Sun, 15 Nov 2026 04:24:42 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:35d0:694a:1071:9bae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec3af2dsm12253371a91.9.2026.11.15.04.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:24:42 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] scsi: mvumi: do not free buffers a timed-out command left with the device
Date: Sun, 15 Nov 2026 21:24:35 +0900
Message-ID: <20261115122435.1446891-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114014430.489668-1-yhlee@isslab.korea.ac.kr>
References: <20261114014430.489668-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v2, which answers the review: 2/3 also stops the
probe loop from reusing a timed-out command's buffers and frees the
command on the duplicate-wwid exit, and 3/3 waits for the event work
before the host is freed.

https://lore.kernel.org/all/20261115122153.1446810-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
