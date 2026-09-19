Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB6435CB91
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789816732; cv=none; b=m+kaqbKmIIoUWOK7C8Dn+U2XrmKeND1hqLXUlwF1wg6hU9J+5VS+f54CXaYkAAuJJY4DJfxu4AVjU4nIIed1t5wBPsP4suCqbjqwmqKgnAkt/WzfemTz4Igkx9EJznZxJGLH7AFWtFU4AbM6J95OU8l1fv3OoJhIY6jw2V4cvO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789816732; c=relaxed/simple;
	bh=ZNT/ezdyK0uCGoV0N7AbHPn+hcODMVsRLObgHQrewII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRoe3dL82cPIkw1vh3An5X3nehX1tCxkNZ1X6Yh0D8YevpSWzkaW5b3eTMh4O46U1b+6wXh3YtETbOCSAn3rxlQdU9HsFFpIDhRql6HyaZF7L4Spx49SoOHqq9nXSiPUwEZ720TXCreHoJRBp6S6qt/XSTeSUaqykew0ggDBcDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sq+b3MgQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sq+b3MgQ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so1512931a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789816731; x=1790421531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L39ypsoCsaXODRPsYiAzziW2qCyMrLIBDm6+2y7I9Pw=;
        b=sq+b3MgQxEuQbzZRP1who/KCSrKq6c+U8n9oKvm+taght8MC7y8fSNJWksDmEC5aTU
         z1ScnpTWbA6ZpwDmDcm25lKiThNxzuNT5XG/RsYMoTLETK6T1kcJoTk3ylOiKrkNiYLl
         mBr0uyBeDHUDr8zFO+QXeH4A2N2h1uf8/b/bZOx4chsHzQ+Zb4fcO9iuytF/rVKz07O4
         U/EPlbx5ODhiL1oMWWMRSBAI40B9ED8jXByYydZFpm9K9ORPY8kzaekPsNMY5Kneh8O5
         s//ymZncTuL5twEKHJUyc90CET/6c4VE9Z6iP3vHMzLQ297wh6WsU0cPDSX18gQM6QP7
         Qi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789816731; x=1790421531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L39ypsoCsaXODRPsYiAzziW2qCyMrLIBDm6+2y7I9Pw=;
        b=xT8r561+wppwWuXzcaThQ54df2XILLNJ6gW96jdM29T395Uv+JZG4Zhrgqtn/F5MNJ
         xAmsllwTYmiFQ75j1brTkFFsvD7zhUJ2vC4JP9dBtowMABxNfWSEc3gWTjOx9G5UYHQq
         rEzUrMta/eed6Cq4nTMacnE7nynmchg8Oxk3pAH+2hkzGOW9zv9rDEsoDtm61kpRGDDI
         xMfJQTIiXxcNbP5yKxM+5OqR3PdpYImjZa1bJboDtk8kDQGoed94+T5QODA7SIftxo2v
         CdXWhLQfXsgO13wdT6v16DPVA2zlSF09JlERIhORbEZttYhkE9SUOz6HJgyWHFKqiRqM
         xQQA==
X-Forwarded-Encrypted: i=1; AKwUvBwltha2FEYlWstnm6kJpG1V/nRI6rYAWwsJI7Jf5kpdjPWWBSvarAPGK8DvqzHcLGs8n01Qe6Xm6XvjQxE=@vger.kernel.org
X-Gm-Message-State: AFuF++l1g4rTbBJe2qqSBR4ORveaWH3fVNXZPm/qvZFO7QZTrueKeTvj
	ZvdIml1vp5OWITdAuGcBTH5eLRtb2+584slcdX9ysOirbQY1/0wDHULA
X-Gm-Gg: AYBFou34MfiOuYMDwwqdfxoYVYUdK1WuaNz3bxBL4IJBnUBYKJzOaYTB70BIZc1N6rM
	J+/CSU3tCH8GGs4oRX0fakcCP4OnVpVI2YEO9e6Xov+9dm3cqVv2xPp+KJyN/YYLcBhAYMBE5RG
	F3Fmu8NJL7xdinQ9TfOEcHYmdUueW8KRAQUQehNUtqzWwcCwAnr7lo3oO6Bpvwfv6u7YJ6sd9Dr
	0uFogl1FSRPu2DFBri3whboXS1tyIzBH2N4s2YUHaS+VNhTiM/+NpvsyPw/+GgtD8jZr6VmOQv+
	aILqtfUoscmVQD8XdFVgn5wzuWT/ozhUG+rsX+lYTPW7LlB3ZSRusCB3KP1pmCkF3ZCY+10xqnh
	MvqSD2ApK5kgS/Ly7TyA/bALfNeU8RaxltAlX84KqrchVjydYGM/CFxBThs5Sj2zewNxBV6SY4Y
	vI6VB/ZAkCUT0QkaGYuxj/VPpw7moMZm0r7W8o/mhSAjChSZB0kM8ySrsyQJsDgGZaS2dNDzyQI
	656kWIsW0RUdpCkEuuPuLACPGNUISBCz1Vj3KKTIetSK0HDbKUCKQRfAnnaC1c6IfXOzdR1jcfK
	6kvg2QE/CJkggH9Qw3J31ChKqg==
X-Received: by 2002:a17:90a:d410:b0:39d:f024:c7e2 with SMTP id 98e67ed59e1d1-39e54cb099bmr9731882a91.4.1789816730922;
        Sat, 19 Sep 2026 04:18:50 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-198-121.dynamic-ip.hinet.net. [36.232.198.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c4bc0d2sm4086100a91.12.2026.09.19.04.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:18:49 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Barry Song <baohua@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mm/memory: reuse the whole exclusive large folio on a write fault
Date: Sat, 19 Sep 2026 19:18:43 +0800
Message-ID: <20260919111843.656-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8cbbc303-59a5-49f6-bc14-28fbb58350f0@kernel.org>
References: <8cbbc303-59a5-49f6-bc14-28fbb58350f0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 19 Sep 2026 12:08:35 +0200, David Hildenbrand (Arm) wrote:
> Please don't send out a new version
>
> * Unless a maintainer asked you to
> * At least one week passed

Understood, sorry about that.  I'll sit tight and wait for the review
of this version.
