Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793595180;
	b=Bju6Vj5aeQTudb61q9uTLim6cbcAszNNPQ54Ym06dpC3tJTRfRmohdGay6d5aQEF9+Qt
	 Dtw31HfXcs32FWLjBjJlidtFTCS1VhvmemfxVuHu0GGhGwwBfs7tpzSUX43vbPmLx2h+/
	 +Qr3e8icc2BlmYFubmR1sCo5nvkzDG+qNU/oskXtyQ3NQozGYmsiSjKGcOitIwrAPbv37
	 ALgeQTJKcbUlRVvBYZLIFuvQNbc8pf/1OfLT5BjpJb13aarCm0bD/Z9SQNnFAlvx5v36o
	 lct6pArvb31wSdq47KE5nQvS59LX0z1ca2qDZQ/MGcjJb9Bl47lro7TdNlqbM224cxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793595180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6oqpKxk86SD+jV+VPFMFYNzOMC1DXOMLFvPv0KulzKw=;
	b=Nf1QFgpCnU5aBXb4siJKe8BFP8kX4roSJH/6/DV0m4BbvZP/hRhq8TxwjKkT93jl3HkV
	 sohB8/suAUWmHmyJxd5RwBwCeWLFzdEUJ+vvb8nQ0aZaooQ3IT+qd9w61pORAjUxxof1F
	 rk6392C3heVwCZe3mABjTl0bwWhrQWOw+RPRWYM7M8cladJosVCyMIjpGBYPi6Dho51Hx
	 dN3ot2Q8yu7Q+FKrXSJg0TPDbr0M1rr5zk/lLFPCnXt6i1KfTkokTsV4iZmzWt4qr9lG5
	 10wOi4BX/Dg2H4RgIXxCbHeg7UBOpUQTqu4uIhGQTt6e67nifunv4CksbOQ4LGROiXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lASZB/KX";
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6A5606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A6A5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lASZB/KX
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7c3b75caad1so1828044137.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793595179; x=1794199979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6oqpKxk86SD+jV+VPFMFYNzOMC1DXOMLFvPv0KulzKw=;
        b=lASZB/KX/HqBoVzMYFVffaFpFtLUvyrLFLWMHtQ9badZty8fWTGJJZOdReNMH/qfYU
         acLgFq9PXR5GoieaLe7SkT1WRk2W6t3DPKDfYtgUUwyBPAzpZYy1vuPTu3o7GDITF0PM
         UcYWpK6YaFOhyojkVEhD9oppgC1GkIrCB58SAWs04mvlhQC5qBd0Ztama49MRXbdKovN
         BdLHT6UuQFmKv/YpT0WQOaClEzsQfe145oEh3NCT8SSg9gkhVdH4dp5v1J5VtWbGzTnX
         48pH+FrVW1kVXsoVXiUO24IXbGJPa5ZLZmAcS38rSOd7W8sF+M+wJDvId9cEro/UNLx9
         hbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793595179; x=1794199979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6oqpKxk86SD+jV+VPFMFYNzOMC1DXOMLFvPv0KulzKw=;
        b=YwrXgtLbaNY63f9/LfJ3o/e5vNBG1S0EeWcl5NZkt6I73X5wdwe8bAN42Yfng4STsc
         +pTKl4mM7hrvqBPftjWV/3meUVQylZvbARTvaQIt1IDlJwzP7tpbxZzA1Hua5eOVPn6+
         K+UVMh/EOBhyTWNeFSObFkdSLXX4o1LPzqP92pJY8quqJ0ixk0mJdNOjAaaWXfWENdtB
         aFMLv90+6xy9xUGsbkNbHy6j/xzJAix6yZ3jo6nro/RNkDloxO3irhwwgr+5VRoUE+Jq
         COtIL16hnJOKVnAe27GhL75uoYyvwN7J6Ij3LFdS8hiRb7sif2eATV+2zK4Ori+pxDk/
         PVSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzypa+32zFEQ+iTW892EiSvfyxYg1PFVgXUQKbiTW8qGyLJpRW60zIFU5NWdTR4oJM0gh6IMNJAlKhM3uc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UfcAvKDIiY8UYgmLlMIuQxnvvwzWFngY/d25ugM/H8pWFjf3M
	vxyBktx0USX28XlDkEUggfCyTutmhK8cTdvgmG0BOVnaEw6GDcW0Qdq+
X-Gm-Gg: AYBFou2F4thX10mbVggsHA7NaWRmrGn6USkCKybKBavyxq9WgWUgs3QOWiRefYsNW6s
	p0GQv7/frpijMct+wfwUDX1gmxG2J8N/MKfdE8NSIyUxkzbvor/snsAktjog+HMOmI9LS+jjEy2
	7UF+Oqk1tPU9eD5ou4PPJVTfPRDYvS2FHFsBzRxg0T0skvJG/NaOd1fN/GP/od8X/pwS4rck2zd
	PltP6Ka7bUlcaKQ93v0H46SWcK0HdqmOvqgQIpT1s9b+1FeBhPhB7xNpy35EAgNZjiaoxJ6mi6X
	7tKaHy2OigCDOyvqzYyzmEuEMSwHPrzAUukp0ZMIMfaACf7WFQ/MPzhG3GgAzTCgqV1Rbvvp/CD
	oQ+QiLo/wRuMLevRdpOHaBeQYMak85wONPquyBDZXLv+Xj2fhQOgpLgNfgsL7N88pDeUjGXi7pU
	pLKNoISjzBscpxs959LxSWG8TKEhPP4baRYH32iU92J1jB+LY/USXy2f5Li36sZx39aooDbowxQ
	hAiI3kpdTxB2NoYtPCWNbWaiYZdk1E+dKlgmceyARjZVH5pI+7aHabl8wqS2+bYGPn5Od1Dj1t4
	HfivbFH/XvxiuNkI4EMK1pKSdg2/SaIT17M9q4rNJyEnH6cZjtnk0PhgGhc=
X-Received: by 2002:a67:e102:0:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7d0728b1cffmr2728316137.4.1793595179009;
        Sun, 01 Nov 2026 20:52:59 -0800 (PST)
Received: from bridge.. ([2804:14d:ba6b:8339:72cc:e44:b5d6:98cb])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4c1603sm10652171241.10.2026.11.01.20.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:52:57 -0800 (PST)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yun.zhou@windriver.com,
	syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Subject: Re: [PATCH v2] fs/ntfs3: fix double ni_unlock() in ntfs_readdir()
Date: Mon,  2 Nov 2026 01:52:33 -0300
Message-ID: <20261102045233.16718-1-christian.aurichzm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029052102.1585462-1-christian.aurichzm@gmail.com>
References: <20261029052102.1585462-1-christian.aurichzm@gmail.com>
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

Hi Konstantin,

Any update on this? The bug is in 7.4-rc1 now and syzbot is still
hitting it. v2 still applies.
