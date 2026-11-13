Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559041;
	b=IzdGAVh0rXgbhIacmex5l156IScfckKUEQc5EW3Dy0T2qolZX2EK52b220E7tOFb4aGh
	 TQZ4QpRsM5pVYpLNL8TEM0WxZGpRPUvqI0jtwcJ2caaIeLNP8xXfL0V9Km663j8Ncrjka
	 V9JAlQHATRU9WyLlgDiJLkHPXUjaDC2YPCAx/Mfg+JMGw0gKDeqrWmnKaSsPWPhyPYffl
	 EvbAzsmID4wRhthBnMsmLbHzFs5eAogTij1BBTiLbu9/CNkw9iUp3wAlb7LfeHOE94zkO
	 8ny93HLdoaC9+rtif4tmOI4tCqFFOIIyaoPkfHXIJwGJjQ3JsAGhSCYAcSq+oXUoxIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=LGw1WVYMB7/uWOhnON2ZjpYzLsk6t5+hMJ8zM0UGs2g=;
	b=EDm1nZsn4QXpfgJUEjEDbZ410m8zTW3GkAhxRpXoFbC+Wlt18Watpnm0ulPS5R3RmSC1
	 MrT7Yp5JUUXQc6jGOAGhqWukmKV5W3Ap/XsDhaoiaIiKqcPZwq649n0A1XpMnR6TfsMJZ
	 05tUFZwVWtAPwE/RwR+JcEp2RToiw4zEfX7415amKwUIT7hCI4NFFMOyDMD6aw3KyP8Hz
	 yrTBx8q+qh/Iv0I5m54kaNgQ52vafz6PNHJg6CAuHJKMu90HvCzajueJ04af/8BZ9Vusg
	 tnyN82BIjgt/pVMfJB1mppq/NgpLFkTdX/g/tZtUjLsdEDp+VUrqPjdGd5Hx40I+UYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tmjQw0pQ;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB28F606A88A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB28F606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tmjQw0pQ
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8bddb1172a4so117622b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559040; x=1795163840; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGw1WVYMB7/uWOhnON2ZjpYzLsk6t5+hMJ8zM0UGs2g=;
        b=tmjQw0pQSib2E9G5EeUrL7fmPrrQv2E6TuJQcMRdTvsLil1PGiKARMYgWxxgtjpD7U
         D8ZrpoH5U5flbwu/h7KVX5NrmLV3fdIafeqEcJJAA5xX4UW7xwi5Fg5P77Ia15ZLzgd3
         0ey4Vl4Pai6+zDu5BHc4wpvH6xq86TEe632QOxBg7YLbvHM1IFFqoFcLIakOlSTuaNNp
         ZkDD+t/lkwZxk8dVUeSeYnkjkMrRjYuaGTMJJzdbIZTzqz1c19uhzHPCBZjGrxrfug0U
         w89dMZGxaY9FmbbNfdEdlSg+jKmgW7tlsG2onob3Gn3SqzMNd+pL6F1ct6GT5QCBuqs2
         PBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559040; x=1795163840;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGw1WVYMB7/uWOhnON2ZjpYzLsk6t5+hMJ8zM0UGs2g=;
        b=mUDojjBun6RSjcGXCs8ldO5cOWfV/5lKpFShf5/bfHW7lMpGOOLNrfj7dkIcMmeNI9
         k4B1LNbSctjGMIDd/KyzAQNa0n2J46rUeisvsBN1t0ATlma1JEvyK7YP/cDG9Z6+NP0w
         DHt2sDDxdDECWvqIve+nk6Pt8Gz6NbwWwxizu1HPpomY/KQKGlko7vbOjk7FXdAMgCH8
         EXjlX+XRiAfnq6JCefzXNfXKbcKEiE7zZys0aUH2vO6n0CYB7SvBD0mbRWwcV/98gsxD
         w6WhsG4DsXWXV7e7pZHz9nNm7BwUwVU/iMgUPGGhHaNc6YPpSbfvfWspq7YqstZcQn5V
         V4rA==
X-Forwarded-Encrypted: i=1; AL+hErHcVruLIJjnVI2oQjLyPdIttYE0EfU/4+VjsJQL5R3ACcNIcJuWz5MXtRBFTZEQIaCyfi/TaZcG73bhmo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ewqRX7E5yTgk9S3g9lJxM0jSuZTLVQJwxqILA4dyxYO1jnY8f
	fW+YLmyFrjM5OxaKAbn1jRN0j3J3Xa1OxMqW4TVjoV1mKk8LA36Y+dHQ
X-Gm-Gg: AYBFou1oAaa2kaFk3HtBIq32b1yKz3b2dq5fv0b8jasEf+NGR/N9TTHGXO7WS/5rVa4
	XpWZvWcFE07Ldg9T1HuO0BkjghSSV3LfpBZ9pZDWi2FVFkIhzJorfJEzzW3uFbprmjUcjh0xhRA
	Tn789C7Q2bKN+qkKcOOT991fjGg5idb5DA+fOpSdNm1iHIcGv9dwQdgUY2cjuPa0TVmgLctvXB7
	9XA5iQ6wEz6pNecdZud29x8HDec0sJShPPpTCvU6BtYa8HIem3Ds+8e8nTueNElWy44oEwiwC6I
	xQvtuzQgUmHLXJ8q9ycHoiFN4GrOAGd4ieBGf7vAAQSOGO+HJZQQebfbtaKswFJNwOfZti1A9I4
	tesVDwY2gldKSMlwRpWF6bxmcYTj3+KRCINPaPUcosf7dDnIfaOx5ZSdVBGAfigymVL67f5DfnH
	gRoFqD6bxZ/Lu3p51Qh3QYEPkka/66JsmLmnNhO7qTxs/vKX1fR9gegQk8MCOFNfAbb8znej3AW
	/6b1iHY+z1gFyevBBzGauulR0HIk95ajXvbcxX/D6O0vUeJ2sVrtiuSCB8AyhbavDUzlueN6E8R
	0VxejHHqEYRfzKNUn8M2WZ8LvQizZQVt/9U8y7xhY9DWVabSXNXZWOKPYjrVxH9F1beEVMzpWai
	XWSEbF7Pqf/Gvrb0v53g0P5TdiX0=
X-Received: by 2002:a05:6a20:eec8:10b0:3e2:2228:c62c with SMTP id adf61e73a8af0-3f7a74c090bmr1701640637.2.1794559040122;
        Fri, 13 Nov 2026 00:37:20 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6db53sm747372b3a.21.2026.11.13.00.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:19 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
 Nicolin Chen <nicolinc@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v11 00/16] iommu/arm-smmu-v3: Implement Runtime/System Sleep ops
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
References: <20260929034510.2023173-1-praan@google.com>
Date: Fri, 13 Nov 2026 08:37:18 +0000
Message-ID: <179455903885.2418534.14656921897583011972@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Pranjal,

Tested the system sleep ops on RK3588 (Orange Pi 5), MMU600_PHP, no
power domain in DT, with USB3 and GMAC translated:
- s2idle x3: OK.
- deep suspend x3: the SMMU loses its state (CR0, GBPA, STRTAB_BASE
  read 0 at resume); your resume path restores it, USB3 and Ethernet
  work, no errors. Without it the SMMU would resume in bypass.

Not tested: runtime PM, MSI restore, CMDQV.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com> # RK3588, system sleep

Arun
