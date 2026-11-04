Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780317;
	b=OxFWcw+vUGMoRrL82mMly/e0Rmr3pkYM50OGvazBvbwrO6fNYX8W9C5YDPoMF1Gec+gI
	 eLKQQZYz4XHPa9Arx1ylyOL3eCs4rwUSoOM3hiZfLtKL6Xrcmg1THFiduFogWujPY25qo
	 r2fsASvW9uwF2Gz3ajKY11BFFP/BkZiSG9CLXtzBUBeJ7S5+JQgtRbFOFJNs0nxS5i8PQ
	 huXDE3tSNxnmTSOdy1HTRGy45bDh0MgI5GI+ul1/mNsuaL/aCWfMM+3O/n4HT57Dmm+Ub
	 R6ZACVapG8KeVVljEU1NRS2Hx3gNtFuH/DoH6mb+FAZwBjLe8O++kNzY8C3iANSYhrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/xGQrCG52awzzQvRBpYcgebHANhUAFtZZDu5vnu6LgM=;
	b=aJ8NaILoYEHkUu/ru80FELR3YDx0t1sbhcr6mOIQVU3HMtyC5xyaw9gcbH39iEZAh3gx
	 jyrT2nGOkx7swHYjnv5aVtAd/Jhb0aerJJ1VCXwL0t+zfKfV6cW4dIArZwQI/2G9Sxkhe
	 g/M+GOKlvc6f2DnERTmMaxiHugqNuuqwznjABxgKUw4YiTJ8lv9IncyqSLekJEhELrYFB
	 pIxaYtnHPkhdr0Ar1j7kwlSZ9Ql5b45hSA307PjZgdlhfD2lF9cwvioanpPZ+aKcKFsQW
	 Z3E7zW8s0lYKlq5LJXZDC4gzQLhvKL+IAamGckKLnhH2etfQUENmG0CrYFEwITflY6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=trPGchLL;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F65606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F65606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=trPGchLL
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed0e2015aaso1281865ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793780316; x=1794385116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xGQrCG52awzzQvRBpYcgebHANhUAFtZZDu5vnu6LgM=;
        b=trPGchLLxNv+Q6MOHIQy4X/xxQPg0NP7rUuEoFtxGVRAcHa3/p1aYbC0++v8jOKe2D
         nlGSg9xYN5SzH5sg5AtdBpcj2sdseSPHp7kERul/CpF0qbIixFIwIka+kjjtZeOY/d6J
         UubjpWtKec4GvMC2u0V/1bMZsnZn5yp4SWwjBUFzWgudnvQKP7JGtk77VzQ2PYGyAWr7
         uSsubujlgWf9aXSpg4Sj1HUqw6zEO5ch7vmdGaMtGCeP//CKvt7e8pzDGFRwmsXH7uX3
         0ecYP0+F+R/dCkNfYygPm+RW0mF038tMfL58Rf2YURR3WG9q2vh14XRi9ykyAflT46RE
         uaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780316; x=1794385116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xGQrCG52awzzQvRBpYcgebHANhUAFtZZDu5vnu6LgM=;
        b=VDIvbEqPUlfjggAiv7qZuA7MsTEPUPSzfdka7Ju4iyopXIt0qq3ZZHSKL7mepDLlqL
         /AAbQF8+e0wMFMuNYc8RB0o/2RyqTm9GXaTzHCbygUy5xwk23HwUi2nAcOfBleu3exL2
         6/q8qo4cGn7SQfEQs10Nx0oRO4QDhTiVGz+ZfSSJKZFMEqPqBrYKibYEC144weQ7NJvR
         G3eiaBsMCwJRbHk6tMXcfQpEJwx5BaPqdR9Hj+EnadlQZMEngyYwdIVNMQYmPt3SJMTv
         KljwjG6QeIkO+ma1hZ6/jI4eqVo05VCRMBTBjKkf9K/mq2uzQO5Pt5XSCrMcRmhK/Ebk
         vhuw==
X-Gm-Message-State: APuU4Z+G7ssrWSuIBeXfuMNvCi7Ue4VB4mMgpoF/K6l8pH0Qy5XxBCv7
	Rm1PdRZCX+JfdBK7e1WraRwi8HT0U6HBzl8lU9qpW4NlaOH3mqOlzcr8
X-Gm-Gg: AYBFou1W0HPXM3n2xhjMHd6Za4j5XK2y6v33A87LicB6DF1VnjmTUyGfW97KIoEuqCt
	BoCCzu9ZUye8/IRG3gNOd4mHu3AQVJsC5WPjcw/LTWDgmxI4bF/xM/hnEtQQCAS5B9USOejIiJz
	vUilBUAqMN9MjT2zc/BgO8ySn6m1JezUffUcuRfThYH3XjcaZTUcwqV6EpgMTtPeYkbJaAKdlgT
	TActIZh7PdQnzCASUunvVBL452kZpIYzffm2XJDHZKQTgbwVz+ILjkUnLtn6LRijHmz1Y1FNnOa
	PVU08+FNT7dxsg6DIseRNDBxabIvtuh1sT4AhLfXDqBcUiwW5DvjQNm3Nrh18kCWFgWMiVzj4XJ
	LVqM6kbuqOUo2qPqA7z+dJ6JGubHkh4DkBNOJqxvYFROwpC9kUzZgPst4Twkch1pToEpgMXvKZD
	YHc39D84MxwWG8R97bX+So3qdHCTn+fwEqG+qB0DPSEL411OMW/C6YxkX24W9HGkmMAW+E3253h
	sBQIC94KkttvU2SQL2skq+eHrlJZM6bIJTMrHfFWBuGvDPUQni6JsC1/dYVf0VJNkrxtPVR2qPw
	O1vSob9vybhU+dcqUojG2WC6YoayKKrXRw==
X-Received: by 2002:a17:903:4410:b0:2e8:4f03:dbce with SMTP id d9443c01a7336-2eb364e0848mr143879485ad.51.1793780316075;
        Wed, 04 Nov 2026 00:18:36 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091f35cesm4521185ad.71.2026.11.04.00.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:18:35 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: arm_mpam: plans for the SMMU integration series?
Date: Wed,  4 Nov 2026 16:18:31 +0800
Message-Id: <20261104081831.312940-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6fd6dee4-7bf9-4fd1-9ad5-43e262dc6f32@arm.com>
References: <6fd6dee4-7bf9-4fd1-9ad5-43e262dc6f32@arm.com>
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

Hi Ben,

Thanks for the pointer - I will follow that thread.

Ping
