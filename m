Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923958;
	b=i+xlxantH9wToJiT7elDcX7LRbwVKxrqpU/0FFho6C+f5sYnC4SHFCa6xgrzyWsln/mU
	 8GWFpcEsYlYBv0bx1qtoH0zsegKb71mDEPVV3CyP6hDV+Glx7Ze+F1PtNx40rtn5Lhp7x
	 zi1lCqxwsxRloJ7djiFlPUVqnJzoiw8ABxTBwTr0617/CkbDq551UYycy20BpEGlJD+BL
	 atnM7O1/I/SMh8x+JbUZRAmQ6IP+NfYnN/yetfMveVerfO62GRcXunr6uJysqajUeWruq
	 pkrVEzpfu7duen1HhYn2O3E8hMPCiHhBghLG6GijeuEil52iQLGwIFk/f/XcxzojZwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XtryOjbj112s/FbZiYb4p7ikDeRzOqgkM1BkJxQSuEc=;
	b=c2jf8vCfG9/dGDcRr/vYaIjhdeH7QkW2u5JM598aNr1pSL3TR7f0tc6WxKd8DHCPGBO1
	 veW2wgl8TGABEG6ZV11jZUJpGE0zeDNgdRXGcNIVwQdpuvGGBTJ2/GG22i4RTF94+r5o1
	 r/IvPEofMzR8Pmdy0CirvGvDPPHZlTYSzMaiElzQlnVJuxHu2oEBESCR0jElc+mH7678A
	 2wd9jPyIxzng7T7AIgNrhlxyBBN6SNPbH8JPLZ+ErJug6Vr2SpZ/V/VKrG+S521NkF+1L
	 38qvI6bjQjx/evqyMqakt4GRuP3kPjU8ZjittQrEbvamu4XjsjlanYOJ14g/XZ8TDEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M9KIg742;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11621606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11621606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M9KIg742
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso2657166a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794923957; x=1795528757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtryOjbj112s/FbZiYb4p7ikDeRzOqgkM1BkJxQSuEc=;
        b=M9KIg742SBgIQeYompj7Fh94nLJshcaEeA2qLr+rgumLSfglJpZspU5ZdIa3jTpsUl
         YRv8u8G/OvsBIeyqLRVTU1OgarHC+6pJkt2bNnZSgZH1p3yZ52hsF4uQ2TUAAhXGXwlw
         KcDu5RLOp7sSzjStjr3AUKxUow74rdR7oZiMdgW6mMEdbF5bgrNMiYSKtmdIXyo2EXn0
         WM14Sy6gBUc/8IRPe8A5rC1Lb8rIVEom49QziWaeoTBDQGNDp975CIqZrlZTw6cPQVcB
         TiojMRBKOkr4lZmo3Dh6zqnIVA2z00wtVmeaOYo/Dteoejub2xT88W2Sj1h3aXuj79qq
         r+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923957; x=1795528757;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtryOjbj112s/FbZiYb4p7ikDeRzOqgkM1BkJxQSuEc=;
        b=U23CwLpzlLeMvwERSlfHrJuahRhEBPlZk3hXif9xjXjRr1BPHJri7iiwZPskvPuYG+
         7Q9cKvN0tlgYGIt8kMEODnKXPCchYQNYVwlWOsaPgqmdmz/jTRAajumE6nIDwntVG2Fd
         dEonFMbdv27/l70CAHZTMcMvmpvrcKOEFNEnP4SxlSADf68bSz/fdBSW5eYv/Iq2r3df
         xGK2hWIEv5mVhrJf7+hheQeJT2PKnYJsuDhe0UKvYFGtWUVjyW/BFiSn4TNsaxQ/R6Jh
         6ucCEqe4iZenohznyui8uD3N9sJiu35WJAKaLAGZiaeaVkRDDLnE3rupMytIai5CAHMQ
         PP1A==
X-Forwarded-Encrypted: i=1; AL+hErEouGt0yf67uDwerpcte+D3GeMfKu1WWyXvP4TZLXtSB8UT7bSDPdB+AE9go3q8XUOMKUmqMkSu0KgIuBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XaKKUEFHvv5j6/a5TDoUXdh3nVVFZM6IXaOdQ+ule/C1EPgPp
	aePK36oIThkUY4+vJ6wnHsgA9v//3LB7yknNLpUYyz7eTUhyi/9uKl6Z7tdK042Nt742krhI9Zt
	gQ2sw4/w=
X-Gm-Gg: AZFdTZeBtbbuq3BGUYWV69xYfMg0FN3q5IXOCZNTNqx+Un69DT1AQcBc7LIy/jjLKmt
	Tz077uMd2CQnBO2XiVb9eSb665XwwWKjFIzTKse1hrbR2uU28Op0yJp24FZP9DmDvyKC7uYtYAZ
	6LYp70A2yrMJEuXov90rS1CBNGi03uD3eOA8Hb610MM3RLDXMTbGwtIFNakVh5Gyyj++u1MrpC8
	e+Ru924y7VZrx+aBCG5R51KMcvCrfKF/woSAdVp7x0iDIthGE31i5AyngbP74JCuqHmFUI6g5we
	+GbkZYGuJwHJAdGWShbkQIlyTe1Ko7aj2ij/HqNXVDFiiukxIiukiVPNSctAk90hP3QPWNr85Yz
	+Ikxc28MMGT1MpL/OkZUOTi51RxAYQ6NGitvQLdUP9K9RQbw4yn35ntnK9+yYYM121Ojnt52ARj
	khNaWtVyEfOlvv120+6jbGabcYTouf49nvdUY84ZSAZg3gjgYRoSZkDNRRHUWwf6utLddsbUiD6
	IRQCVWOL2Z4nae7Z7YBELvRn4zqPcBDxhDydH5x0AgYr4HNyxZoZYv+q+6Fosu+jkS4ysJMZQgj
	8nUB+TkBWFGWqURh6QWZZ1u7fi71U+ffUmmAy9pRFycmDdgGifOFrBzYXigv4aHWssJRYkLXvyR
	kY2QLwYet5aDe6jm+iD63A+QGg3lTKRVB00Ne7g==
X-Received: by 2002:a17:90a:e710:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3b1b0a428b8mr11934736a91.27.1794923957381;
        Tue, 17 Nov 2026 05:59:17 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:73df:c7da:8e76:82c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3a21769sm11768056a91.4.2026.11.17.05.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:59:16 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] scsi: mvumi: do not free or reuse buffers a timed-out command left with the device
Date: Tue, 17 Nov 2026 22:59:09 +0900
Message-ID: <20261117135909.2090997-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115122153.1446810-1-yhlee@isslab.korea.ac.kr>
References: <20261115122153.1446810-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v3:
  https://lore.kernel.org/all/20261117134227.2077013-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
