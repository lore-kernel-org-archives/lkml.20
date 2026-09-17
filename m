Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279C63C4168
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668022; cv=none; b=BdoiAOFEjqaKsdq7ZoJTZ1yJdjsxkn/4pPy4wYV7TxiQ2cltF/fdBcwmglVMO7vXpK4KH7QOz97XeIjnasMZG8meF2YvNj9utQdMcqL6eOwbYSAmFa7+4VTCnxVg4tn1nqwLQ9sYjQWntzf+TRL/bhf63h0ZD6rkIkXZtULBVmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668022; c=relaxed/simple;
	bh=r9ES15ZQ60J14H0mEKXzOZCuq4aecPRzPtvBjzRMZ3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qli188bvYgrXTpJRdQNSZcP4eDs2ND+BFILID2kRyyjNH0bfEvEqycCR4TzhYHpq9LBkS+X5x2ryn0xYVcCxHpYzqovLShG5MG3/NvC1S5ybGrTvOA/KZVr8cPzujCJjcP4jIZpXRnut0TkxnuLVimrkShX2p5cz2wqr1zxOKZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oek3ihr/; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oek3ihr/"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so1381533b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668020; x=1790272820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCYa7xbUQUXHtt05AGeI1m7rQB4mKruUeHiavBrEL5w=;
        b=oek3ihr/N7/hevJFqNsCaXQFybuzuyl10Wd6HENZ7zMgFtqCNDTIpZFkPCvvfmuS1c
         8UsXKqDcxiYSfqbFqTO3/xmzIp1lpD+6IOaloHCxJ55jd/qbrwxyZXCAd5EOfVnx0vNg
         x/66I0NumgQ7V8ezeXdVVcOt6rBS7ItMO/aVCNfDbrNtd6opYmqiahFg014ey0Pk0lZ8
         dbnsqKVnA52I1JAsqRYiQAHXp+UVFkJxqANyBVYkZ0Y1qVNGPDTt4GGVzK9LNsPMQ9mG
         02oYGKthzBxOdPhvNJEac8zjtiAhB887pMYjlN1pqHIyJriFmyp/LTuDYdZrOSxGT46A
         XD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668020; x=1790272820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RCYa7xbUQUXHtt05AGeI1m7rQB4mKruUeHiavBrEL5w=;
        b=pgDaIU1ND4pY2HNaZP7L5wXQ9ZOeXR2BT9RJJQatPWDF6rU23ISO6uUVHJwK69Ks5l
         1cRsN/7SR9wXEuUZ56xIeH9NrweAZDgV3FDmuKJwLHMYZtZ7Rer/ATGVxQ1BG4pemBmE
         okWBA4feFMWpAB7jAFiR2rYS9NcpBgbnBieH0qtB+SSfpK78dX1PdWJJLKvLIWrcUXFq
         /QaEp6PgW2c0wHU2LGZY/r6FuztAJoUpnQ+KNrpsnzTZVAisH/TJZ5DKvfuIKt+wqG96
         GisE/Fk4w77uWDaRU6m0pPIcYFv0Ir2Pw1IiutZfCd26f2Eo246UCVJbCwAWHuggX/Nr
         Ex2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwGVM71jXXEI3G8B5vKOcO3ppg76KnK8Kvm0ybCBIAl/I2hyydGYVLjoblsfVpWamSKjzzPUbDRMBTmIq8=@vger.kernel.org
X-Gm-Message-State: AFuF++lrO3W2uxma/pCEOVSC5Qg33RgZLQZ1GRkDXF0WNPFZ7xQ4jtn2
	JPrtVSOjZ5F3GqMgqEOdUhgWr0PjQm+jvIsdVDcDWvxdm03h+H+tZ122Mm0iTKAp
X-Gm-Gg: AYBFou2RJyAzoCQ5acQEkTbsdYPP67wWHz6v0u60SQgFS2sjXDWEOsVAprpXhfFJ8zi
	Lct+TgnAODIAQ3UBRdaMfyJPenBCvTJ8lINFaJRD8dlZQDEa9naG/tDO/6JvFwDKGleGVANPuGQ
	KoHuo60CO7lu4rezrL+EjG/2MJz4FzZzCRZA5sSq2o7WkZKzBMwzVSWKs8fdAp1Qai2vYahEvHX
	SHLcm6zlFzHcrWYvXFmoMLa27GnqU2L7sUZI6bWHIqbH0QLkFBuUrmnY/vk3MyDzFBsaTFn3x2u
	DBrtoc8r9qqkrfiApPztLe1w95NgTXjKr7UmEgpUybffGglqnEM6gd+X4QgNjBWqBZ2a3BdK7VL
	NOLNjCUIiY/ZyysPbVVq9tuUDd5PZu7RvHOaNUuV7GhQK9zLLbSK0XrKdqetNZEgyiA8WGTR7lY
	3eHSAAQsmh9gZM7Ld0ybb3wJwI7MeAi1WTlufZhyNyBRkDSDqadpP/Ij6nVzaXrokM/LhMB648S
	TlJjSCWUyr8VyGtCkiR1BpvcbUCNGr7NkzWIRJhdxxHXBUDyTmyujPPqkXBUCWhIQgIN3WNLluy
	hZfn3fGtG87h9e8dBm4oGGbZGaDfptpezV/hgc4VRJUmAw==
X-Received: by 2002:a05:6a21:4782:b0:3dd:85a8:4c58 with SMTP id adf61e73a8af0-3dd85a84d82mr1969849637.31.1789668019933;
        Thu, 17 Sep 2026 11:00:19 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.202.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm18580264eec.28.2026.09.17.11.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:00:19 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/damon: reject zero sampling interval
Date: Thu, 17 Sep 2026 18:00:13 +0000
Message-ID: <20260917180013.1279018-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CABFDxMHjbQhzvrQmRjo_F9Tf0_zQ20FxaSHFEQN8nfN+VgsF2Q@mail.gmail.com>
References: <CABFDxMHjbQhzvrQmRjo_F9Tf0_zQ20FxaSHFEQN8nfN+VgsF2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sang-Heon, Hi SJ,

> I think SJ already commented on a similar patch. please refer to [1]
>
> [1] https://lore.kernel.org/all/20260722094304.3132750-1-dayou5941@163.com/

Thanks, missed that thread. Same objection applies to mine.

> Can't we keep supporting zero sample interval and fix the warning
> or the real bug instead?

I measured a few floors for kdamond_usleep():

  floor    kdamond CPU (3s)   vs sample_us=5000
  1us      84%                28x
  100us    42%                14x
  1000us   12%                ~3x
  5000us   ~2%                1x (matches control)

5000us is damon_new_ctx()'s own default, and at that floor the spin
is just gone.

Would you rather we just document sample_us=0 as accepted/expected
behavior, or clamp it to that default inside damon_set_attrs()?

Thanks,
Karthikeyan KS
