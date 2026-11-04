Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753037;
	b=zq4bC5NNPImVdtkbm+C0LkDPC/8YqEWMbZzXfu++PrWHjU3yGW6PAGy9LzSzRUkvA62w
	 SLG9V0UO8EYxy8Z62C0mPnwnzmV86KP7eV0wCqogHu1Ld8HgAYYqdegmHzfg8iAIjB+wC
	 3bD+FWVPfEmWO1H+oZ49e1hmmyiDQ7ml6JJyJHvpcRhIw8+NwxIP2yLkFYyKXhhhwbkmE
	 C5SgacJzXAB+hbpOUX3p+kQFOa5vIv87P6Nu4huo8e88wxDlNvJqK8kdyg2t7UzSJ0V34
	 8PzkZeA14wnIpkdN1d+eLt4wtQo5bhN2l4/2kw9WbyTPnFYBsBRwhNDTt5R63oL4jOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8qRp/BwQBEaKjJByyj+gyRQztnD96+imNxep8e/AfWM=;
	b=qISBHaOSpdnjpvQOM3A8tt9UbIQcJE3VMaYB2llUfvJ2MC9sjAommsVlOZWMrAyE7t9z
	 kwpDcJdKf3hTqYaLK+M/Huvd8sJgRlAEkf2qa8qT139K3n/kzPnl08inEaT4f+dpXS+24
	 80DOp7W7QdcfmUwWmV3X9GDwNALCbAs4Xp4na0oV72vfDlsPITTmQ0h53zH1a8rln2/eT
	 aOGgI+yCDfw4v/+pwKR7YqiBmUxWWU8HGbb/ulEaZFV2eCGkJzVzPocVFV5dnMAHinAar
	 OiqQQ2a8zPrY7tQ7EzfFd8hjjiTGagCpt0N0/Vi+CPofsL+B0P4U4Ea29zrXgnz1zbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=jO07yc6n;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0066606A339
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0066606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=jO07yc6n
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so28003137.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793753036; x=1794357836; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8qRp/BwQBEaKjJByyj+gyRQztnD96+imNxep8e/AfWM=;
        b=jO07yc6nRLiWKhwl44KUm1HjezR0c806TH1txeu+TkAiuBJZUYTjCvm2Gu4+X8IXDK
         anrgepMJzdixRVLz0b5bIMCkjKTTt6jyeh97YUwRSizjY69pF7gkSQRQg3oZxemSV2/Y
         9m/US1Jy8Ko0/u7N7X0gECl9Z/+yNeP8EWQ2a1tna/LdJd58H3Gw51xyWnwFPgHhYdoN
         3ixtPYcEhdDsEqmpfJ7CJq2MXvB/mMGobXnJ2vK9XO205dqGYiIm2etbPC+pDWmD3Xqe
         ChidxTH2uNDSVAGdKcS51hPU07jUl9UxxC53kkBk+hUDmpJU5Wyn0guM4i/fF86H8eE3
         ee0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753036; x=1794357836;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qRp/BwQBEaKjJByyj+gyRQztnD96+imNxep8e/AfWM=;
        b=2Z+ZrtQHpCFJ6aX/UYyuvBpTbFUXX4mCn+WDm3gGVqngswuArgB7SWoMCVJmIcNn4X
         Ukyi7a+B6rInilyaFqu3wpmpVuRdEekg4RnU0fNhx6AcH/LZzsu3Lhhk//6U9m0RRU/b
         9y8UIIfR1h3Ih+D1XrAlxi6NOH41oCQijVw1Nn7UoreMZtQ5XptQryjuF0ICDY/045Wd
         RNS38oTaj1ViMkOduf8mOv1jCzXQFBuc0BuBD6c3oT+Sommq3wBraAL6pSuohrZfpB6U
         G1lfsJZlBnu1zc3hmCh4P3Ysp5bL/9w+mCTNc6OOaUf7HRVf0P4QubnJO64akSNhyA7q
         Fcog==
X-Forwarded-Encrypted: i=1; AKwUvByT+18NpnsLmr0xVDaqDG0eatNJxRUFMxJJtkmUgIOmuoUKQwEmSw0/CuVgaNl5Zs1I29E4TVC3debRR2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DnSmAHO/TWU2QGLE/3RGSGlYJDNZuvZ+SQbpSgEO7Qwq19wVF
	S3HU3BcYYC9udMW+IE6Lp4u6fGDAeZ35qsd6pbV5FXCA65xjjAogrGTAE020P2rQjXA=
X-Gm-Gg: AYBFou2Gi0TIiRPw3BV47CiQDSHJ+wgyOWvZXcY3Iu+jDV0Zsb0dwWRNv6muYYXd9y8
	wAfSB0r5+OwioSBwi5C1d9iAT3evsiUOZCCqCmau8P3qMrEYP9eyMIgzSQdjPBCaXO6HaAIVmOf
	y1XMk6F7L2bmM1fukZ1Vi2aIybBa0TybGO1dX8Tc1lpZia0NH4gisx915Y8V9PoZI/o4BpfJyOC
	luChGez9ZXjvfGG7lasdVfV7xxBp6C31iSd8/LTATLbXp+km8F+fKM6FTWQ/PGw5ptla/f137SR
	kcOsSRAraxtRCOmG5AtH+8w2WGSEAAmdKIcAYpzR5Up25v6lsZQTg5YI6b4dw0EPIBAq0kTwHc5
	SzwodyqKsQ75wHPYKon4cLqB+Tey2s0cO/TElig84kEjsM2eEGNHY4U8glO8Qmha5s5zTxj8nEq
	QWp1L8O9ThXB0Q7y2r+58EeDKR72ihGSYJToMc3OLAIn6/da95+P+Rew5cfOROVy96eg7Pm3Bgk
	c+Nx9/DRuZ4Zh+tIsMdT/d38eEf4tcSfN1BXROdj6E3q9h9dNbBYV52eheJ3TbwCzRkoF52GbAb
	3V9D0P3jMfbG3jR/mfoCCq5ECRA1BOpdGX2z5VEU75sWAR599UyMQXiiHyg2QsE946WD91ytAl0
	O0M4KfB7zKXj4Ct1N7bVZUToiIEbCjSsRdXHQICUmZi0S0kKUXgl0TDkOGNC4IMyV7A==
X-Received: by 2002:a05:6102:5126:b0:7cc:9f01:1378 with SMTP id ada2fe7eead31-7d07227aa1bmr5468508137.1.1793753035777;
        Tue, 03 Nov 2026 16:43:55 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fef4ed3sm527432137.11.2026.11.03.16.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 09/10] mm/shmem_luo: Allow retrieving tmpfs files
 with O_RDONLY
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Christian Brauner <brauner@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261103010216.3447716-10-dmatlack@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-10-dmatlack@google.com>
Date: Tue, 03 Nov 2026 19:43:45 -0500
Message-Id: <179375302574.727293.7162114309691231709.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=YJNHuLpjxIokzzpeqa7IUF5TSeIz4RUMcZp7xbSVc0o=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq6n/F6EDZbzsbaVPLjMR9sGnRAbDjC1Ciq/AWa
 k9NfuYfEceJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCaup/xQAKCRC7dyhM23N6
 3lCsEACbXM9A4HxMiLl0Hu2iZsdE1Zmu0oXPj7p9V/8TudGtpt1T3tZNzMqRg6mcMoIdIXCEIg2
 JGGNbNtFurmX2M5+0ioNMR5zbXreBE6AuMkYyEhsz9mLhC6GBjKjgPj2jwt+KnOABcJebeqvRKd
 y4Ya+Yp8Es0cpw17FEDkCzUKbK3//D/WIsWKUn6UM7hucv2w/fAkxpXo5BN543+YBaI8xkMMVRn
 n2g2UW/55sOqpWCgyLP5hKC7O0nH80i67ccDx51adPqeWorKXdA8tAiJGEPA1HvKWrQDq1M5XiV
 TL4ToZhvaP2cDPZOzpWQ+SgM8RR5rEbNjx9HbRyEDqVkGL4ewRKR51X3p3i1MjK/Icggu6iRZCV
 pQA4W2yUN0jd8+lNPUAiYVySmSCxilvwg6NSyXvMmni81dEPk1fNTTLz0RXPakYv7ZOo3Msi6nl
 7tFk0/DrvNUKZ0r6ofwz0pJr2y99tYr9lo1aH+1zucM2oxgldSBR4CeGzDL5Qw+ht5ewGuRtCiB
 ipQP2XasfAbUcUZS6qWGqKtqHwJTzTNR0SpjLgOb1maNy6iJzZa9Ft7S02FAM7S0MoEuYDPga+D
 8lVnnR8pCfP6Vv6S/s9t7rUIlGpD3nal/TBbtUq5aGwpDr8N80Ks9Ddzg29Xk+EE4VtpUcJ5HMk
 PbRmcH5B06b972g==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> Allow userspace to pass O_RDONLY in struct liveupdate_shmem_retrieve_arg
> to retrieve a tmpfs file read-only.
> 
> open() requires write access for O_TMPFILE, so create the file writable
> like before, then reopen it read-only with dentry_open() using the flags
> of the writable file, which file_open_root() normalized, and drop the
> writable file. Like open(), which grants the requested access to a new
> file regardless of its mode, don't check permission for the read-only
> open.
> 
> Retrieving a file read-only allows a restored binary to be executed
> before the session is finished. LUO keeps the retrieved file open until
> then, and executing a binary that is open for writing fails with
> -ETXTBSY. Being able to execute restored binaries right away matters
> when they are needed to finish restoring the system, e.g. to bring up
> the services that retrieve and finish the remaining sessions.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Link: https://patch.msgid.link/20261103010216.3447716-10-dmatlack@google.com

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

