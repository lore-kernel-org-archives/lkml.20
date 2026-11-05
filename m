Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869574;
	b=kkb6ewa+f7nqX3bfK490L0Mv6t+BtGNUO7J1rkq0+ECeFuLBmkjhgNqz/XuVmdTLIwGv
	 aSO6gecdnaJ1o69C3e9eNwuZB/eF83oLs0g3W9IlkszE0nf4zHTBYl8A2sZm9vp4ofPex
	 mNlP9awrOUKLYogv5T1CcA9NmShWGwV0T91kD88R6duC2MCyFtMAsp0/WAQ2iD4M0+hzn
	 mzp6hauI1fbzv+84E94d4oGjeY4zQxhsHYVe6F/UVxxSfz16QWk7aAoIY9yhm4e0mOFSP
	 sJoQDde4DjhtIhYK8T8v1w8ccAiZ+CtBNox3xHe3As/WmzMgM88rcM3wDVUIGst1tUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869574;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=S/z4MBkJfXgbYdAPBfUZ+O0s/ICHMkGIYV4qN0m0+x8=;
	b=F5dyuBCn9DFRLKh6Ze9uDAfWAQUT4wLIaKyzSY8zH1FeJCYuuDlbbScDWHBjLDlFKm6A
	 9TX6Pg+vD+HfYGsJHUs8RIuiXhqwTY6LmHBSweE2yaTi0LZMc2MutmarmKFyefpoU1jzk
	 kWa19UAMUXiqYwRLdDIHftQ38M6DbWE0l5FhhC8CbtUfMSIBqYzt25sXR4DCV6yhb445h
	 l29PXCCRLA104wdkuX/BscjdqywwAgxh1UpFzLlxqj1lGqAjDESPapkJUXO04EZAq62al
	 LBwdrHMgAAtGAx+h5aD2qUWmA2PVzYDQNvRDnme2oU6D1zYIkZl3OiZ8uvmMVeuTFTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=NU9+OAFW;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABA1606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ABA1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=NU9+OAFW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=S/z4
	MBkJfXgbYdAPBfUZ+O0s/ICHMkGIYV4qN0m0+x8=; b=NU9+OAFWHeORWIquBNhf
	M0joZcSfpQCtKawpVwKZR12Ad75U1ggIFdRs0BtvDxPI3uC/SOtgOrz4uTwjUefO
	p+dWVBUloNok8SQ6G24RiUmK21shf7RhgBP9G4RsV6gL7Qp3zSeZquAuO4bLK5jW
	fPxrKkiFC4QpVnWGOFreublFAu2HcQcGpQQlKpYsPVXFRnyEwB2jHv67RLLR4w+L
	dENoQUtzvt0MCNAVlwSYthMrvr2Z1Ktc48j3J0T+pxBD7q1fW+U03iH1YuFynVlY
	7GH0vI88GXMJrKN4MqWmNRfboOUHGnwT1bj64G2aSvlVzluxWz8iGP+Y6tdNQjYx
	iQ==
Received: (qmail 1080283 invoked from network); 5 Nov 2026 10:06:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2026 10:06:10 +0100
X-UD-Smtp-Session: l3s3148p1@wtl9zoNfqOrAwtcC
Date: Thu, 5 Nov 2026 11:06:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auxHASG78dTviSz8@shikoro>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>


> Reviewed-by even with the "# subpart" still appears in person's credits
> and reviewing entire patch of 700 lines of diff code (like Frank's SPI
> patch) is not the same as 10 diff codes for one driver.

Yes, if you want to spoil that, you'd need to introduce

	Partly-reviewed-by: ...

or something.

