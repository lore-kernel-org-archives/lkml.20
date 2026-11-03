Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711063;
	b=Bcti8V4mUNEdSSrXgbFQbwXf6AJS5h3njBFTY96CJA2cMScOP1KV8wTF8Go9RhUweohf
	 /8kP798lMZU5WOvUyC1hubASMsydVKaupdyK8AjfzZOHII8w/xfsBOiLRvzh8znyyzf7X
	 rhxae2SkrhhMXRNMafUSgrrqCmgKrPyWEXIdqyuj80L1NQSpSNOtiZN0DCmcgjSEGMaz6
	 ZTxnldxuItKdkR4/Dypb6P83mB+Wwjcy8fEhnqTtwqeCgKEvV3MgZKEHcBBn9qyPC3GaW
	 rAGO2S5YalG1t2qjlfTm60iPa88MdiCVI8RQyKWamzXdwCKiz8SaYVJyTyBMkR2k8HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hrz0HS4K+HZzYid2snb5+IR7NFz1RNPakoEoaqHrluY=;
	b=2EeWIN5Q96vWH0xerYEV3ZPWxEt5lySjH63aIlAoxMhRGSRknCzt094HP4eApK4M98vP
	 qWaRvixfB7Nhfz3sn/hb5ZJujlTQ5G4Qc3EQ08TV7aJ4JqKQZo4Mf/YbmwTvS8TG9XPiR
	 rW+02lcTTMMiDM/GRkr5oFvhsCsFdTvpuGRBcs5Nrg4T6lfHba4bPMRIISosW2OznUwaN
	 pKMHXeV43iIlQWOZqO7uzDKPf5JzRtplzjM+b0GWwi4UcV9c9Q2RHGOvsnORH9wznrPr1
	 1ZBiHQKVgdL3tw3ECcIJswSKT4uw89s6pxd7632f96T7TqjV/y/vMplQrYNfbVoXCPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jfTU9IJ5;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50AF606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50AF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jfTU9IJ5
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso1437358a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793711062; x=1794315862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrz0HS4K+HZzYid2snb5+IR7NFz1RNPakoEoaqHrluY=;
        b=jfTU9IJ535MeUG8o1iDTqc4DK8Z+RI6JLIR91BZ6dNkfDjOEsh7Yn2H5gw2hAtNGnO
         LjYDgB4JN9AKz1vM/Djlmqjj1aCSXQ9p5+1nTv5AHMlcEiOVkAkj2WrOdztnCeJv5jL4
         psh0Jq2Y3d6WFJWMqYsfYBxWC6RLVxLjAje4n8Z9FurJ79WxOyAaqUpLJeey0OcNK536
         OMvOmOBKpjrz3QrWzEokuX0VzYZiAUoPa997R1esVqRRdGxFmhp/cK2QVkHWd98Ke6jZ
         1ElEeY4tYKq47GH7Zl6+DJ4Ogs9YpiS4Y1ARqR2Kb81fhNPY2nRczTVkwO1el8E3CkMD
         Fg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711062; x=1794315862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrz0HS4K+HZzYid2snb5+IR7NFz1RNPakoEoaqHrluY=;
        b=jg7KdXXh1XNJWXQeU2BR6vlrBUQnu2UQy0hKXjuKZi1UpJ6Jq3ywKlXi/cBv3kC4Nc
         NfAklzX3ELrfQ7YNQIerf8yqiHHiCv3M8JffQwYV+YhhQfy1AcADpnlBkUUopNgTDYGR
         t6g9DMqqyhJ5RWGlBENf1fomxYqMK/RqoxyU8hxVoUjJusGVllBoy/CpcMr9Jkg/CEJ8
         fYj7hzKjUVBC8Qv1os/7BJIbKjQDJ2j/MtNvlKtcJfw031/ZuvR8YKp+dQYntGApplwi
         m1jfDXsWNkzcquzJ7ApxNjVU5TV75WYy9q9Uceblxpoy4RNj0KSYQYrhAOKg+c7OIKL2
         +s2A==
X-Forwarded-Encrypted: i=1; AKwUvBzp+8cYPN+kqtBVed3xTuOrIpvjNy3xNgHtrNfjfgRorifjFo1M4MZAaN9TgW//90WwEs5XMJY2R9FzU6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wepKv9SOVcrlFSf9K3ep8u886rl6p/nuCO/lGhG/GtklncHDU
	Fik6wKwMblcPeAPvpgp4KJbPQWoiPVtJXGY5vndjslzg2t2UZ0mdc+/d0tCfNs/vDAk=
X-Gm-Gg: AYBFou2yg7kWurbLkVlE4ZlQeP3zYoyygE1EpBeFcs5ZH0RfW9On8t9KtSPj94QUFEc
	OAAgxndvZZEuIiEy97SLYjoGpl6a+H8DQlZZW+CwrE0FYe8E5RUmmqEp0D30PQeHZCwLfY2oiAq
	4cHwOWdmwYXPJAcoBGVjQOxEf0QQBAaPfOLIJCctQtmQBjg3rm92JHuerglUmXdnrJ8i80n523t
	EJUEIHWfCHa6Qczp0OIg1LycvdvJL4Lr/s452EF802VSkbJKCeE6YVby+UXEpz+8bLzr3PPv8ub
	p6IA8DepfbgExR7LsLWpD1qdt5x6Dy4haMiF8DMzppbGpzmZFlM4qiYnPrH8Vp9WmzgNbIQ6Xgi
	w1ssRWfeeKXOhZx84TOYATBAAXGBAbhVuOFjnMNX4GohdWMATZ8WAYS+v26xnAoYa/ECGti4axD
	kRuDnoJIprtYNBW60+0ryqCT0jGqshW72yPZ2uQGXn79l0lxTZMFYu5764bRk6wdgfcRnBxJrke
	H98BOjHKuB39iOdI2V3l0GX6RSM2zJuUc/CgnULpr+qCflkwbvJ+oRsjU9OY+EfL85GCDVLO0Q4
	Ngq3Xu45tE/V0hUTNsYdpnWZUsG2JVnUCMBgb53hUVQ51eNt2V7GmHAw/ob5eAdsjWw3/9nD+vC
	3n34JfxLAreW9tza8y7sjig0+03nWjZ3vuNGaCA==
X-Received: by 2002:a17:90b:3d8a:b0:3ab:9f89:e1b3 with SMTP id 98e67ed59e1d1-3ae89764eb6mr10599503a91.40.1793711062055;
        Tue, 03 Nov 2026 05:04:22 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:2da3:4696:4c5e:89c1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm2265061a91.13.2026.11.03.05.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:04:21 -0800 (PST)
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
Subject: Re: [PATCH v4 0/3] IB/isert: fix the device removal use-after-free
Date: Tue,  3 Nov 2026 22:04:12 +0900
Message-ID: <20261103130412.1530793-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103032924.1073138-1-yhlee@isslab.korea.ac.kr>
References: <20261103032924.1073138-1-yhlee@isslab.korea.ac.kr>
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

This series is superseded by v5:

  https://lore.kernel.org/r/20261103125955.1530355-1-yhlee@isslab.korea.ac.kr
