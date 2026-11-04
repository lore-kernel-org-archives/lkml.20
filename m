Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755448;
	b=NVgxuuqaZZTfrShe1Hy/r4GwIz/6f3BPrKt3fkjJnrXTkZ8VRCcWFzqkSRyUihUFMHB6
	 ZqrqRNslcUf++sZvTxV2MsBSW7IrcnEdkUKkqgaCucQAuYogDtXZCOMVMPIQgCSpS8P/4
	 lahbXK36VM2NlR71GoPPelyTFCWfLUaJYqh95Xb/orsBZuYLUkx5gfoN//4ix2sJV+lDQ
	 eaDq2JJ4Wa0rQgnWBSP4l5ISBhMUH0Z+o/+TqjWmNxDh/qpGU1z1WhC0LGDkwhgQEjD2V
	 GrOY7aNXezyBZeAAGkzmc9HmDgpxqDMF+xmPPfsmuxchcbNbot3QXD99uEUntKpJaaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CyEBod8U9yrktbOchdQg2w94UgrKibnqgXSxsY325+s=;
	b=IfLN3k8HByJ85jUihoFYLRnukVU8NtynKA0J5D+Nc+2bOO41gGXt7vmFo/1AIjlrzZRa
	 aWVtc1cg86+RrvZ9T7aCd/WVm9+KcVk/2HI1hc5T8Xg+M7t7ybmJMOVoAnga+ohVqqmAP
	 vNVxrl7O/y7bTQUzRp0KZDpleLHByHTUY13dmRW3Wvqqx1QHL61AaPpwGgylPOzjveMhC
	 eZJhtZp8By3yLCszlrPZof/OtD5Cv0TdJ16r3dpf4CHrd4vIz4uW64I16junWyNJVzqjM
	 en6oGWgA+SNBguJEH+jlXBC3Xdhgz1FECxaR2kuQp2Xw61eK4Bzd2Q8j7hur76YSOPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ERR3wnij;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077F4606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 077F4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ERR3wnij
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89d6bd67045so57429b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793755447; x=1794360247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyEBod8U9yrktbOchdQg2w94UgrKibnqgXSxsY325+s=;
        b=ERR3wnijf1jsNe9Qdqkrh2JIJmXEevbKnf+o4/cuu88tzR0YfjP9dSlA4F57zxQb4D
         QKivwgmy/GbarHTPLM4iSd9WnrR1MwjBJP8Go5n66xS0H6BTDiRl8FmeH4U2j0YIgNs5
         RAGMiAZMw5EKRNQ+jAayyZSuSwQLTJTXdQtQ0+yxM1BVSy2V7vrx6yGE0Z9iHhLtn2Ly
         0reh6wCVlx7p4D4JTMBW23HwxJdfvFIs1r83PgfUZqgCK+MmPnIy/SW+WBUDYvUBAyrz
         qouD5g2fA9eRU+ZgVWGJkX7Ej3TpGus9gKsbG9bCfOLLWinmafn69IlIkNGvsHRxH7rf
         hh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755447; x=1794360247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CyEBod8U9yrktbOchdQg2w94UgrKibnqgXSxsY325+s=;
        b=Hxrpt0+zRM9iq/MkVaj1FEfcxWlaX1BGr8eIdx6r/bYasDBtldcGhMa1H9aXxJf7Dg
         S1WYV/RaFczGULZ9Y4T0Lpc5FFsT6ANcoagHa5I8c7ToMblBPNJ2g2K21jBM9Vp8UQto
         SsY1ukrHil3o8Hn66UDsvQWBikgfdVJDCLqCdmTGs1S59Sj4NXW1m9JKFMsVZ0aG5r9e
         ijo6dcP78QOp66IH1P/kJx84mJ48rRNpq6IFyQWDDrIykkskLp+yePa+V/U9lrZ+TUK7
         +NYJIPA4ogHvBaMStrLHXYyPRePs/SpnkCQacLTweMmX5DwNGzTNLyx85z+Qc3uYq4Ve
         M0dw==
X-Forwarded-Encrypted: i=1; AKwUvByjMF5/cva0eBUHaJ+PycB8k28/KztAKL5AuEXoGp2G0WvE2WJELx4nJqgMaNiotq5xxil5s4bL2X3T9Qo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5snnR2UAhgYCnzqrbNM1CHksfzTIhxi5sZ5oM9uIWY/lWIbVp
	WEGJmkHq9VUtwnVI4waQm9/X72mW7I/Tz8Uv53Hb1T/ntG1g2bI6mGjRP+Jdc0/Rido=
X-Gm-Gg: AYBFou1polQuLbrFAm9X4D265GPrrDmRthSFR0b/bcT/RfU3JRa9qLmbbF3hTOp43rl
	SIqC8ZVEz9hY3ur7L3d+T/uc0PFuR+AkKjMndNp1ZN+c2Q2Bfw5GfGEG9vIWiQm73mlhGHCZqr+
	neP1nQKSLG9hcvYDSeSfSenpGgrY45ozcJa2SERIEafUGz96kR+RkAtwPWp9rGzRM6EFsS4OpA+
	M4DqZt9xd3yjhiP/6k4olVDUs2FJNkMjnuDCVTaxfyxhQOWazV+dwWh1AYhsQ5/SHsH87bbih5F
	IkYOX/SQPn7EXOQA71PVEK6QnNH11hUVE7WphHSZvxlJK29dfbKCdIi8/3ZdjgEKlXU0y4owY7f
	wkduy761/8Wx9ByvD63JCNbFCcrpGsFhn0IkHbJDkol9GgxD6tQQIZYQdQCkdduxsJvoWvG15GI
	7XsxzOM2K93kYjHbk2Mfsy/ga6JLrUDydp8W6iH8PU7x8TfegBBZxIQsBWlnT0WbJWXDrkwcJ+5
	eJIjW6m5aOPno7NMbcROYs0Vscco/QAEtZH7QYM9soSmkf3pDOa6FjGrfuuG6LNmmLIyJk0Z2tX
	of4KqYO6piryrVMaWYw6iFMyRNWXHHi/VUDf0Q1OCyZB25PD+m68dYjzk3juR6Fy3zqK+Ex8yZy
	Ao1zd273OrYIKUBFzu+Z12Y+Xwxn8JsJslhQJ
X-Received: by 2002:a05:6a00:a256:b0:882:2195:5a73 with SMTP id d2e1a72fcca58-8a9bfde0494mr7910507b3a.29.1793755447467;
        Tue, 03 Nov 2026 17:24:07 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:744:cf40:a7b2:e78f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7cc082sm197577b3a.12.2026.11.03.17.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:24:06 -0800 (PST)
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
Subject: Re: [PATCH v6 0/6] IB/isert: fix the device removal use-after-free
Date: Wed,  4 Nov 2026 10:23:58 +0900
Message-ID: <20261104012358.1759607-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103223802.1697607-1-yhlee@isslab.korea.ac.kr>
References: <20261103223802.1697607-1-yhlee@isslab.korea.ac.kr>
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

This series is superseded by v7, which addresses the Sashiko review of
5/6: isert_remove_one() now sets the removing flag in the same critical
section that clears the client data.

  https://lore.kernel.org/r/20261104012219.1759523-1-yhlee@isslab.korea.ac.kr
