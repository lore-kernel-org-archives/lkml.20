Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467964;
	b=QlpLwiTY0363/LPlGGM9K0Ix4wbU+9qH4onC5ItHkSxMqq6NUM1g24wX7EoUg7MC0CnL
	 AiBN/yiBm3yl9ZFGVaV0FgKpglb40UVFPCzAKNFYsPxcc669UXXO/87W0jOhVokOH3i9J
	 Mrg7gItaak29quBt+D5E5iW/yVdtAlbfT687qjyoO0Mr0uodNTCaYp0iNMFviMQezo5WJ
	 /6UkXwBKFyZB9gyp9xerDfWDz0LZ7B8C4BerTTYdfwmT+lVrCMo/YRQCiVdQ9Mo2HGZad
	 60667kwbsybjggba+0dhx5V3MWmMQYt2C/lHzR9YJ+GEUzL6A1BreYJtFba0+vtb68Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467964;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5t1IQ47c0TX9II5SZS9sRg3rlhGHOvDYZKROwdCbd5o=;
	b=5bD2xjUYOr+iPWJJc1Xw+dSr6cV4CDyt9zYJ86BMFMRzhijxA2M1RcN0Bd+PiigdQKYJ
	 OEPx2T5uMf5hFJ13UPfgqY5q+HBjZ66l5LhsEZHRED7n9LKWfLv9A88Z3QS1dURqEuLSC
	 34OwOxmOAJYImT/nGW3ttv1WsKbU5V6IXwG3G3zSCsY8EUt41FxwnBNE1UAwJDCGZtPr9
	 qsuvTYg8v9O+TpLldnd02hgmKrw3gSx0yc8ysnGS932akpAXdmW2wRQV1fXvEIwBQscFA
	 vrD3SA9cAxyO07CGTHXZXt7aHVKzhpHcPIk8m0yTA3hyYExhs7mi0ji6BZPqAqZEj4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E563D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E563D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so3117345e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467962; x=1795072762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5t1IQ47c0TX9II5SZS9sRg3rlhGHOvDYZKROwdCbd5o=;
        b=u8RTpuoxkZya5spEWR0VJ/0tkk5ncjBI+ox2xHSGAMdulEZbqgJgaIKoRb6ficDiFP
         PsRiIpu+qYVa6hT64ADxbVHsaSatM4EMewg92Z44wuxE7slR//i2/MVfA2cWx39YICIK
         BVMDrhTiGSVEsKF4nDx7YLNYXSTagFBqn8DTaC9ZR6qMtAwwn+E2t/Awvzm34ea7KDkR
         yQN1iv2uMF3Mq4t2HGSyf2rvvtr1dcDEpfdb0XXkqG0IMTkn5Wocp3z8bNaW6L+pWF7k
         BzGIh67kAObL7kRDtIGLTHCSEFJh1m3PWhO+3emdqjFtdMfL2OcsyDRDK81NKzIqWNDz
         zKsA==
X-Forwarded-Encrypted: i=1; AL+hErFLlrOaSRwDCWbukaxfpqjFeOxSoHaLC4FRKs4WSGfHPiGUoMFMIwl0wvYvXYBTvWpRgN1GwilUXccjX6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZIgElqxn+/ZK47/jVrfJpXVXIdJZrraJ3qz9tytoGChY5faXZ
	dTMTFOzLZCkBZnK6s1KOIUOgbb1GaDSqWGBJUjyQ05MjcsHX8gEn++gn
X-Gm-Gg: AYBFou3KFShomT7OBf/dwraUqlYtgmgGbehEsTucQD8+IR0RC9UUPYcC6VBm4jXjsYM
	Ngp4QBfLcuranAi8pSVN1phvWjNQpU0WtxmEFQBcgkaAKZSPL4x0kim4xj0fsEcyLBBDuz+GQcW
	IhYWMS+oYQ1mI3OMZUZCnGk4VG0g8kKw8wJrNeeJQLYb8KqPd1rwRH88o+k51nQ7HXfi9ATQyfM
	0/bcg3+L2FcAvt6K4g/9L2gIsScXm5whoqNN0YpVBUJpQzVPszkBasbB30hOkQkG9X3o3E9pHZ8
	hN+CBa0fNgDXEmG3jjhn5l+sOhFwMxpTE8SwVJRk2LDeLg9ibfRDFvqL6uSzE0FWh0wcMNgnn9h
	+BAwU2/Kkbmo0482SlD2SacPJPycIznK4l9vQmKAyb1j25xsLq4HECP/uaielLTbgRySbh8tZ7s
	9m+AxXTQEkSQMSauj03LIpybIsES/CU7opnCU0119D79mkPVshvFMeKwcPOc2zCW8xe5e2texJw
	wIyZ+oZCwQ21ifoXXeNF0SX6pKycaFchldTFIPsZfOXnYoahb1DpThYcNrMmuxWeweHqs93ll7c
	Pq62Paurrl/96bRhBoEDcQhyrUGeMUOgpipqMUyYVZeTcFVGTDaNbse8DJZycwRV6VDcHpPqgaS
	DvdrDpovSe4o/JXnToflMX3XjXxR+ppb/UqXkJ83wKdvClqphMu38wLFeMGjd
X-Received: by 2002:a05:600c:8903:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4bb4e2e9c80mr27941195e9.11.1794467962133;
        Wed, 11 Nov 2026 23:19:22 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm11633378f8f.32.2026.11.11.23.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:19:21 -0800 (PST)
Date: Thu, 12 Nov 2026 10:19:17 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Alejandro Lucero <aleszlucero@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] staging: octeon: fix probe error path and
 pow_send_list matching
Message-ID: <avVodR7YhtYHN20R@stanley.mountain>
References: <20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com>
 <CAHDi9tqk3rHYJZ2Abu5Gn-=xVhA_AawCX9VRK_Nu0sHmNkeM7w@mail.gmail.com>
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
In-Reply-To: <CAHDi9tqk3rHYJZ2Abu5Gn-=xVhA_AawCX9VRK_Nu0sHmNkeM7w@mail.gmail.com>

On Wed, Nov 11, 2026 at 09:34:30PM -0600, Alejandro Lucero wrote:
> Please disregard this series, I sent it by mistake. I will send a
> corrected version shortly.
> 

Please always wait 24 hours between resends.

regards,
dan carpenter

