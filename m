Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894091;
	b=xkfYzZKYGsVWuYJDFMijlsVEDvW0Fbtr5H9Dr5tIWY5rlvepbMR9eqwMFfPTIcxNumk+
	 BJ+1lDzSCP5X81shAFBEIkm9PI+ACOa2ONvn9W1n//iG65lc2L6liBA7EiFc6rxJi9RDP
	 mikEXg7GB2R35G9aZ/fn+eePlvvqDRICSgdUNYQ08xS6Rd74raDEOJwdJNOwPSiWmX+O5
	 VSQ2kqJ4AAppdGqUEsuABGDV618qzCX7Z+KsrW+RL+rlZGp1RsiqPCU7IfH7BwTxU5qV9
	 D/VYL+9SO5EFv5QKv5l54SYh6cuwAkgd8i91kSOLJVROQ7Wwy5OX0352vNGwVJMR9uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TXnRscLI+5p2iZDtjZSChWhyaXZPY5sKSAAfiOfGpTs=;
	b=Xjzq8I9dMMQv0DTBODHvK53gU9Z7+ysRZwNyAZENgWzq4N/2X3qSkXURMy8VZjqGqMWC
	 zcl2wfYhdrMMp85nwU1xhaiNx1xXE5u4mAYm1LJHqepazg6DsWXyQQBNsPJ2+ncTA1sNz
	 jwqErkjWhgfE/Gx01IjOHFiZrq5ZJC42JoanpDSHUaG+qQUAIJFRlb20GjdN4gAmGinQv
	 N9LIb/79sYenlbwOhSWT3s/kJzjp6Jk0UPH+tWA1C3Auf/DLO737THmzEWybL0pa02tSF
	 dq+XiUWQecFh9sVT7YcO0l5jc7Bt7t4TC2LjD3rAK1RT+Chr40jO5jVVFead+lluLBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSawB1nA;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C88606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C88606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSawB1nA
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso26658575e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794894090; x=1795498890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TXnRscLI+5p2iZDtjZSChWhyaXZPY5sKSAAfiOfGpTs=;
        b=iSawB1nAf40dzs7ZN1+RTexY5htMcnLfQniuVkWyIpeqeLVSCcaBotb/94OvGvxaFd
         O1ub2Bof33/b7u9dieLD80J8pUtsta8heN66MOBQ/XSJlyCIiqY7eyTGONQM/0ftf1Ya
         E2vQsTZjyZMiBYcqEhU0ETRugiLCL+MsFwdmb0bSp8aiita7mKoPVucgvNJMKIoCATey
         1v+zm4cM9arBYTKv9gVgfzBBoAo4z0cbAoZVlCBI6Hfz96+I5kkZU0LCtb5SbtXMlb9d
         zguZ3cbkOSOAqSb3e9cPUsStck8DD31Jh/MRaMfdyK1FRJVw4YNlaYVLQS69iA7/X007
         j9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794894090; x=1795498890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXnRscLI+5p2iZDtjZSChWhyaXZPY5sKSAAfiOfGpTs=;
        b=HE8a3xy5TrtRe3CWX+mVOoIkBUOIn82gkGiAx0zcpzdsZjoSqupkKV2GYfmN9TxcwO
         lGZyDD8TlJPM2RBN82LMfts87ae0MyKVNapT3+BiuXFTaWgCdz4FGV5MCmNjvI2hdAMb
         sV6yBn6FzHG+J4/ri+Gdvyd3j+Ow2G3QJ9N80uZM9UhB+DVNJ84Giqpkg80Fjp+N60VV
         hyeqmHFyaJKOZnnU35qTMbrBUQSDw4Xr7MwmfiOnMWHY7wTEzMwo4P3qAKif778F0qP5
         /rGsjO52fXu87KGbZ5jC84iE5egnEnk4YxSm5J6o7uJfntXHQGNZvGR8ztamkuombIwj
         pCDQ==
X-Forwarded-Encrypted: i=1; AL+hErG1qEoPUht9ScmHr/3gXqAL4TTJNP3WCPDb1+6z9WObnYR4f2lKbdcx8eAKAn5hzOFXpGTf67pgOo3Ffoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VTS2oiKiGZf84Xl5AYVl5oGg6HjKmMWccKC1/FV3+OEdLsGNe
	64rUJBlCbP86D46P9+2/aWvuq0VTNe/J6Z0INkvEV5fEizwG4cKYBOEgJxnRS9B1
X-Gm-Gg: AYBFou2PdRS6JG0mkQDt8ljDj8xLCdaBUPksqsaGaHDaI6FYY8IVT6LjW6EO3QPaLkY
	rpIwcCWI5bvJfmsqLZO+uhfWPa+EIAfI6WaqMnLCVfpRyY5RoVNfW4rexR2tPjUk8FwJN/MrdeU
	x9FgXWrNJm6t6QAORoe7Z2DyntwC76Tb6S0KoRitbZSSgI+3bcLRtdbRlHsGWWDxAPkmvxjtdId
	Mcsnu3p9EJtJT8ji2rDAUXmsnne4rXqQDV/1tCkOgv7a6fiZtYdbS/ll5wHZ+vl6BTCntcjUzBI
	rb2FrYODFz/nY4cxtt+5MssC8MVB13YpDlrTN1Do9G7EFOqQw+UcS+/BmvYishbaTNiBFvRRn+E
	UgddyX4BL49z+Vdcq4dy8DwxqkWsDm+Mf9Q25D4V5LyW3FBF+h1h96Wtkcn8T14/bfe9akWEtwq
	4z46IWdEOfV+HRUqdcvjBJegGtyHJCSgk8L1in6veBFAe6jlTh7eb/nuogjzZPrNo6JGcB2QY3O
	g9gFOs1ndUkJTUcLEBdAHkCXNB72LvPm+2CVuSCW8J9dKsOa++V7DeDu7ybXF/vA1ifwym9EV4h
	DvRv1JqoBEe1Q4YX6nWT7HiB4h697hf51SDwjqr4j1L3kA==
X-Received: by 2002:a05:600c:1f96:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4bb55a4d2b5mr282862915e9.14.1794894089563;
        Mon, 16 Nov 2026 21:41:29 -0800 (PST)
Received: from localhost.localdomain ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb68c00b10sm125348055e9.0.2026.11.16.21.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:41:29 -0800 (PST)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: dmaengine@vger.kernel.org
Cc: lars@metafoo.de,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH v2 0/1] dmaengine: axi-dmac: fix incorrect segment size calculation
Date: Tue, 17 Nov 2026 08:40:53 +0300
Message-ID: <20261117054054.22409-1-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.47.3
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

v2:
- add reviewed-by line
v1:
Link: https://lore.kernel.org/dmaengine/20261105131547.305510-1-matsievskiysv@gmail.com/

Sergey Matsievskiy (1):
  dmaengine: axi-dmac: fix incorrect segment size calculation

 drivers/dma/dma-axi-dmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.47.3

