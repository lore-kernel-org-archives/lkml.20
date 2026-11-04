Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793765126;
	b=rutMx26MlsmsVXfWaXMj9jEtjsZOn9/Ms8uFRr/zMZmikWnuIR9nDvGtGFWQBVdybO0G
	 /JeOaXtZmJ5n4ugdFRC28GlEd4suJi8hg64uRGw+3AEuNl196OVf2CBF3A00L/bwZ4ppJ
	 05Wqg5kJarHJTCIsVHsfliUGIRqpVRZ1ZQ4sNCnVkndYNu6fhDvkrHbow2e8CLRPRZ/kJ
	 +8W0LRfsLnB7HEoVjgfaPFXwMM7cuFEG36nw2h7eKYxRGXi1MEobv5tTXMyH8MND59qSb
	 ttOIlkPBT+MCDh7i0aYnePBIYjL5IatYJT5oiGXCwZBYec004D5tvRsIaeMiID6lwSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T+j37Bvrvm5b7s/8uMkhPBVmT5+ES/aAdwRW0vQZhyY=;
	b=FMfyhxibuZlo5AB1NGe6jQOcHVpp1W4qD7AVoajmn6rnAsAhhaoyBCc8U3Iyv9zRX/AG
	 +XzT+J2SmEUBPyhLEAGtErdk6U1hxVVWe8O/EOotHU+Cbv86DJV1k4JPZnhZ1Kt+U7YDy
	 U+D68U89mbtyXo+e6ozBDfZWcQmVkmY0PIJ8lEGdrvzXdakxi+MC8xCtM/NpjE74KaoZz
	 34SJo1mtr5ctrfoK8+OoM9wKsHwZsVoOXrvNWMb5AFQNMvD37QT2FfJb9nanmIVomrYoZ
	 +0CDX1xzS+LZH4JPpKqbrho9oDsKF3sQOsaI7AJmq4MnzonMs0AMgcmThnL0yDN/upw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lQgCf8Fk;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F4606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA7F4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lQgCf8Fk
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e831e86ebfso1663475ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793765125; x=1794369925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+j37Bvrvm5b7s/8uMkhPBVmT5+ES/aAdwRW0vQZhyY=;
        b=lQgCf8Fk/W/H1qJuGTKkIbLrlKnXkKqxCXOhS3tV7Eu7U+fVhPo9nb8yLLixdFyQFa
         LPRjYf4ZjsXpIpV4ekdgLGX/T8O3Zyhjf5iK5Fpc4pt10M74Z0INpZ8EZ5VybwsC3YpE
         3Tu4T9YBF8xuYsMtzNfC+j+14EuldYyICkcK2qPSEq96RYY53YaNqgLwJL6BjiSLbDza
         2amGqz1zdXDAOc8/Y6Dtgz+DMNehkJ6zixyw8MsDbYAXMzmYKF3Vp7FLRUuL4/fWKlDk
         zaPcWvxhgXkRPLivzQlWBAKrfU6Q9lC6MJ11Ri9VMSsHQlmSonWg0NfcG3yz+XaSSRUU
         Zdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793765125; x=1794369925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+j37Bvrvm5b7s/8uMkhPBVmT5+ES/aAdwRW0vQZhyY=;
        b=R6LjrBiC09G6QA4rUGDMVhxuwjGg9puuhnXMh8nkzDHlmhxSrrDLmx4Uy+9yOFaRVp
         H1AJ6ESz+BD/HMEK9PIQi9ONy+Rt6gOENzkwas+t9Ex8jx9Hn6Sz62czckoL4ltRUvh0
         +BJHwMymcihwCgH+nXiYw/Qcf6qOcKKzJx44yYmiaLP9k/QwesltCMYo5M+sp2TWdiWB
         UP6ET7m6dKloFbxgCedN/8JQBKiwYFMQkcKH2Y7Cc0VDH2W4lMsnuCkfKkuVbKLMwSvP
         1bmP/LjZfMcj/929cZYu3ON/NLV3+BGIRFTautQ9GY4uFAuZsDewWhZdoZ8lXHA3Pm4n
         rzqw==
X-Forwarded-Encrypted: i=1; AKwUvBzfzadxb9mY+y+557Ywmy5rNAANyPbWaTr7DYgKYXBmwaH2PRxMq1OmmEGxWoFIHa0+PpvvVs561YGWaBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GSm8A7ZJCTdOrU1bFYK+LOBvYGj9oZRcNdIyxY7cysXLqo6W5
	aJ7Y4LW6HxpJi7At016qbL6gar8lnA7mZXVie0pAzBsIbKEk4SxgFQB5znwiujvg2j8=
X-Gm-Gg: AYBFou1HKDvRyfJ22HszzH2d0Osfaxf1HX14MgUcEzUZmfwWQXQdUJMonC5L6IIfcU3
	VhcFKQ4iCNCs4MJJGGUDPQghQ7K1zeWN73NCXszqg0l4J38/gI1OzqpwIHGd0i8pKgBnUp/k/0u
	xoqfJ7uq4UC4Qnvf0UmeZ87w62Cm6v9WyqzuTJnP8IdjyNAdf59Xc0obulqZlIf2D5ar6ta9Rkx
	MiOGjku1vLbzxXd2fvQydWpNigCwkJt1li/QBHQr3jnEQmFxnwt11GZuhHq1gPJPzbn2XMqwTUS
	h/spbws+z6kQ4YWb1MJHzkkkxFQQ5GZEHT7myvd/9cv3AUD24Xp6Vi2A0Fv7Phl+/maEQXTh+eB
	e0RxG+7xIU7YIaFKN69+DmSlWbgvVI3uHA5oPCz5IobIrPSuuR9Zb1gjabdHjV1hKDyr9L8cIhc
	XFdM9616Ofr80vPqr8aZccCf4CffOoqXGMc/pDawWhjKX76jF39hVuRcWc4PXWBCOqOkUMsJVWQ
	swKbdBFU57eTSSVCRC/iupGd9kkq8qVd9B0FRIcWouTaiFOzwrc5YPnHbRfix11yTy1I/AV74pq
	OFwCvkfC9SauzgFHKI6CubYfi8NS8Vcr+GxnyifJakw9k63rEsWqZUJ8GYUkO41TMVCXBAX5XTP
	reSdc+oS/qie79ZkcH+0npmWGqyAkXMT5pPa8
X-Received: by 2002:a17:90b:1a85:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3ae898194acmr12972752a91.36.1793765124818;
        Tue, 03 Nov 2026 20:05:24 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:744:cf40:a7b2:e78f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094d70a60sm873913a91.1.2026.11.03.20.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 20:05:24 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Sagi Grimberg <sagi@grimberg.me>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Christie <michael.christie@oracle.com>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: Re: [PATCH v7 0/6] IB/isert: fix the device removal use-after-free
Date: Wed,  4 Nov 2026 13:05:16 +0900
Message-ID: <20261104040516.1844951-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104012219.1759523-1-yhlee@isslab.korea.ac.kr>
References: <20261104012219.1759523-1-yhlee@isslab.korea.ac.kr>
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

This series is superseded by v8, which addresses the two Sashiko
reviews of v7: 3/6 clears cm_id after ib_drain_qp() again, and 5/6
looks the isert_device up by ib_device pointer.

  https://lore.kernel.org/r/20261104040318.1844865-1-yhlee@isslab.korea.ac.kr
