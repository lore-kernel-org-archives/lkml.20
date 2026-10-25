Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792954073;
	b=hJW2/I6dJg8CUh3YXvk8Q5tPKbT0Pm4YBc6dyjSU6yPNrSqt7wcvaLu/9+KTGRUCwzQJ
	 nd2MHag+gPDsXNqGXMEpcX6A8WUg8IA8f3tNvWLSFJ4UWLPqL6adgXlUa7Q9nGCq82Viv
	 y1E3shGzNMLR7Evus9RMe8tk39g3JGdtNGVtkrkUL/hktPwwlg68JIZJnDT3/y187ZXwz
	 DeUTtqozckbX8F3mMakoBinZLdGgTTqz48fQnhjNduWd+Xkn2JndlBsaMoomIX7ATm6hL
	 vk4bqxCA7LS+HeYo5Ry8lsnLGiN9qIQgHXPHHiAYnjKoASTeo2BbIhGXClcqZoRjLVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792954073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VOCIkcKgCSX57LQofypotIDpkWBFLUASfshW5R2G7lM=;
	b=tHaDj4p3rWVAVKlE9x3vUyAF+q5QfwOGPH9G2pghRmlFcFzBrVRD+enMFjahn14yy+Y2
	 DqWLALNvrXrygulg9BZV7GePIS1HSpn+AYLi1doI4jB9XymDNCFf1Hx1hbUCUxerbBcaz
	 4eWcW336MfL7HIsb2jv6WYyQRunHwYwUHXoFjynL9zaBkp0Rwj+ix8Uwx/Gxa/oqMN6g8
	 Huk1I9RyUK4tnyApfYMFjuTLWEpc6ZLXsl2OFDQzyT/Ew1s4jWVw8ms10cCz142S/RqBU
	 xOpN3gqor4bfKuss7oH6aAw46j2/5mjTxC2TcyKqv6yCo4+0g11C8sqZewUdHbddkvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l0A6QTVH;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F46606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F46606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l0A6QTVH
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1130276f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792954072; x=1793558872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOCIkcKgCSX57LQofypotIDpkWBFLUASfshW5R2G7lM=;
        b=l0A6QTVHPin0eH1+xnSaLQML5IYQNeSrdYtlsLsiCPMyNnun7hUAV7vx6EOcvEv+eX
         6nfSIIeYqhj+Gll+lNpctdEed8QGZ/E7pMPbrQbZsBf5I8dMF/3jfl+YbEyH+rR+9SrF
         GDAPt5tfNhlFMIH/WEiikoVhhfzeCZau4onnQmyxoFedfzEackOZx9Rgk+VNYQYU1XrT
         7FPYNfPcP+ZNrVtC5sNiZvswC4QaElSE0SkOieYWbDuonCUu7eT6Y4up76JUWJdhm41k
         avmThVXITY6MCbIjH6WpxpHs6g/HqHYUFDIbM16alxpYp4xioDh+mFyYHSBFSEQS2CJ5
         MoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792954072; x=1793558872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VOCIkcKgCSX57LQofypotIDpkWBFLUASfshW5R2G7lM=;
        b=fh0DRYxQSDlu6mkilaOng2iYVe+M8DSvT2txF2H5hIKNx0+CyX07zKG8zsAnC3y8Mc
         NdANaVzt3WkQE1aCEm1CnhxAMidEE7JkjusppWFRfRbFVk/mApb+Y7v9tebC8X2V6ODY
         eVFlh92nENJ2drj3cDSxtrvGIcQhTt2vUpe42oOjt386LM2xxt49s1tBRVH6As0Lgyna
         4CZNHs2Ohjm2frkCsv43lj4IzifSIMmcP/9ljJ6XYFrFGyJQnFgUmKddrqmiDHPba+cD
         2GPSToZ4DmUZJsYtZj1QVouBc1uZQ0H++/KwKmQ2yhIdEfCPE4nPWBwAWm0K1KIl2vw/
         qJFg==
X-Forwarded-Encrypted: i=1; AKwUvBwMxOwahvkH4JlZLnaM934EeOFyltk1aKCCAnHUAgKKSQ8HKg6M+0CVFvu02FuPZkwTtvWHgC61lGXy6KM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHK3J0hNTfMZLZdTq7qY5aynzTxXqoSR5akVZ7OrrjqNzM3A7a
	+0upiej8VZqD9L/uqq471f7yDCaHH1NOyqh7oI6Jc+k0sc0wWwt5n8ze
X-Gm-Gg: AYBFou0kUo6awbD3vW3MlHHglQzOLRkHPzBYeO8rNOkfnT6ksJ36xP7AuEoAJQj6rO3
	+6Zc34Mm017PrY2mW3nJKVUY7hVeDIfpiaeGqs1zaYVkCTmJ3T3iG5H/3myKz5Tob9sk2OAfD7n
	sVt5/+J1wdp5n3AAHn6uGEl/vNhYeDJ/RbnCRbyUnXox9IxprVf74FteLrMh3BCKq4INn3J60wa
	ahSVTwGr5/d2+gOqUfUKPm47Vy2C56Un7JiINs/kiWgn2WpdvBqtSRrNZxmeGI3KCdQAuIxbbwz
	5A/WbviUa/ZmkH16qThnG3Zry+Ttgfjkvr8fjbov7/sDmoYlBB1gvZEo2Ax/SLkZBHremSOQSZ7
	U3VMlyUfkNr+2N+R/HdwE1FQHfOQw7iOQImSQSfU6btaEiihBv8kcKZQuic3QQoofVkBVjcNMHo
	N4j6pTGZpLg/0RbTQsHSKDNA6KdnjAdMzcU3AB1F4glJg8MZ5/DRk5qdv1CUZqx+VRt+iCMknMT
	I+6+tuZ/S3XH6a+TP4KOW+DT/aABFZ7IMo4Ql7HPayWSJ4sYnupTgZYsFymFAuVcfptPs2GJa+6
	qOzqEs4=
X-Received: by 2002:a5d:5d10:0:b0:48e:1c72:abc with SMTP id ffacd0b85a97d-48e3eb9890amr7896007f8f.35.1792954071610;
        Sun, 25 Oct 2026 11:47:51 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm9979793f8f.13.2026.10.25.11.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:47:50 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v8 2/3] wifi: rtw88: support channel switch in AP mode
Date: Sun, 25 Oct 2026 19:47:49 +0100
Message-ID: <20261025184749.1045907-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <796598480d47c5bf474d11828769e864b8209558@linux.dev>
References: 
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

Hi Luka,

Thanks for the review.

> Would clearing csa_active in ieee80211_ibss_disconnect(), same way
> ieee80211_stop_ap() does, be the right fix?

Yes. I reproduced it on an RTL8822CU. mac80211 refuses the next switch
itself as well, so I will send the fix to mac80211 separately.

> Maybe rtw_ops_resume() could restart the countdown when the AP still has
> csa_active set?

Agreed, v9 does that. It is not run here, I have no 8822CE.

Mehmet
