Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793035424;
	b=j+NClWDXg9nDCzp+nAtV98DNupkRA3+PDxXF/RzG8s1YKTvmxZdc5s5KyY4EnHYn9CEO
	 rL3iYLIQMUe/qpRSsWQ30syAR7d1+vofvZ9+MYlhzxDMBV3ntrO8kc+rQmKrOjgF+pBpY
	 bCfPW7LhXhSB0y8z8mblEFJlKOOOA0ub2eQYwNlAEMfPYcoxaAr5M7W7uUQOJSgr8GNVB
	 W65dQkyz/A63uUfRX9Hw2CVfrAUQ2pvDXTFdK+t7K9ch1jitm2EDjWXcCjL0ieehb+Xtq
	 dW+yJLcVDZUSsy+1l7WZf6meDhgqLc4YiKHioEUbWurd5HFzs68RclB4+JxLjkcY3rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793035424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jD44Kw0dc/uZl0kPgBZraW0M3ZJSTyhJfpg/xUqpERY=;
	b=eunVO4ojsPancxbV26VHCmzgHCO72JTgULAc5t3OWZwkkKQmm11cUX5oaHTIQa1txPx/
	 MubIq1bTW98l8inzqaulAIP21mSkOaJAmovvZWNIkdO5ZwWDzOCme6M5PjrohTKqJQzKL
	 LC1CN37undMUfK20N5PmzS9cyCc5ywBWmX4BzaFepaEvJFtsL92XvWy9Ty2XdYkBo4CzP
	 vssje/25lqS3hjs3Ktx2VddMwVmt2ioNOsZGxYSPiIrTgvyFfotCMshuA1V6UcXoLPIzY
	 NMlheVA3Z4iTe04Ere8RfhmOrgxofCNCrmpGxNp2P3UlIfCNay2PUKgkjhuHFIukcHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EIzLkdvx;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6535606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6535606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EIzLkdvx
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8ab395abf79so28708207b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793035423; x=1793640223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jD44Kw0dc/uZl0kPgBZraW0M3ZJSTyhJfpg/xUqpERY=;
        b=EIzLkdvxzGbu+/yOwDI+TRj9y+p6mf6dGjLrgEqgx7T2HJDW3+a3VxuO/F2JpB23N2
         8+qYT8Tck6rZ1GoCyjBSj2MYSMOW5a0jSSMJEDqIvfU3Hfo45Oy7OqRwtqfKbUUS8xsL
         ac+t6MHzrYjkaUPX7kHdaJDdcRjY7txGNoZFuj8hrJjdEn0OHYi8FOcBA/O9F1HJANvE
         MJff4gPgrr4TmSScAgzgVYVxwmHOdQ6/QQjo3omWHJE0a4cU+5gMphEqsAiVnXLMeE1g
         ZN/jDg9amsfSHh7BotWpuI2RmsziGmpsjy7cJZetzX3h0r4TqheNKgGHQX4UXj37sP8v
         dMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793035423; x=1793640223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jD44Kw0dc/uZl0kPgBZraW0M3ZJSTyhJfpg/xUqpERY=;
        b=YrmmVltl1x70C2XpxzSl6gwQWXHV19tS5F9C9wqAc0GWjMGdAjScUisWRFf/lu2ZgF
         WXnKT0RybnyNn9+7AicklfW3Cyy25rccEiZPZTE9EUSpkpRHPcTvQ30LrdUQmI1SS12x
         Suze5xTQ1eMb+Anej3lz8dmslSFQL9K2Thet9k4rga5S6uX4G63fnXa2PxK8Lc/V171g
         KPzU/DOvntwsUTVmPayNRwVN4HyuMXxD2IqdXxdECBO3Bj9pvCJ2M3gu6CHM5OcIWdxm
         bbivytV9lLZuZ9xRENT10jM8sTZsFpUyPpqJsh5EryETOugC30+wlv7xS8T0fwOZbF28
         jgEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvl+vkJJkRhCfXMByn3EOS7sapyLJVTcD/m8LCUPATxLWHNcUo/GSMv64blSo8z9SJVxt86atwVXOLVOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkR6DpYpeXC347SWkNc0qP4Z+1Vw9hW3bXaY/vctsDxzuRL7nB
	JuSMxvLX40ImtPFL03QOaBnRkTjqVUPMDsep8X7FKZkFKpsTCKkh4VPP
X-Gm-Gg: AYBFou3/Kc9CYCZxv3Cg+pgiU+8+n7DNLn+6iTNX+gZYHrRg+HSxgp1TrNjttNgT9ZR
	AmE9bzPyqE4kDxoeXxBVWmFMS3gaMbh5PJkzVKHH02przneF9u+gRVUS60iaXUgGoQ+DF82Xvca
	E+l5b4FSM5XLcZZgSq6/ROx+kAA2/Mi414yLQdDyR8uOGdQZbYHEHVz1lNP6QS+KqPZvVvtbuuZ
	L/02CqBmvAf8o8evXTPGcek4f8vQLWYIhZBujspmrHWTpnb0URfgVAoOstSivw4UsGfz8LZYa1h
	ad50mfh4PWAF38zDQl2EETIOxXLQxQE9PBm/uJEvFXtuwPz77T7NVA5eN1BcTkHlzYkVlgzSumZ
	UF7BSiBJRWWMCMpEB+LqeR20VajytuhCBMU/AdebiyTFj60aZWar7MuOsZ6fSUPBJvmeXPDl/iw
	ki5gskNrjr74+gT2Duh5o3bC8dee4BEjXBNOAlN1r+TLRvGz1SgeH+Hsqg9N1ilepbwaE5KqkY0
	H8lEUweUG9zJ94C5lbENNO+gfWHCW4yl1kdt5oCq7LJ/KZ8
X-Received: by 2002:a05:690c:c510:b0:8b0:a587:9447 with SMTP id 00721157ae682-8b166c6676bmr60645827b3.38.1793035422833;
        Mon, 26 Oct 2026 10:23:42 -0700 (PDT)
Received: from WillzDenali.lan ([2600:1702:7a80:3c5e::46d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166e9fc27sm35090107b3.34.2026.10.26.10.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:23:42 -0700 (PDT)
From: Brandon Williams <turbine.bmw@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Brandon Williams <turbine.bmw@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_sync: Reprogram the resolving list when a peer's IRK changes
Date: Mon, 26 Oct 2026 13:23:29 -0400
Message-ID: <20261026172331.33873-3-turbine.bmw@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261024004649.56724-1-turbine.bmw@gmail.com>
References: <20261024004649.56724-1-turbine.bmw@gmail.com>
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

Hi,

I'm withdrawing this one too: we no longer hit the problem it fixes,
so I can't test or follow up on it. Please drop it and the BlueZ test
that goes with it.

Thanks,
Brandon
