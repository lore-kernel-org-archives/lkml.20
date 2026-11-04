Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779216;
	b=SmTR9LlUl+u4tctLvBaSC7hADZLMfoRvzGda84VbxdQaSZKoF97OgaaNVoo8gD2pbhip
	 f9s5dZzqlzKVUA7MmsaUNZbe+pSmv0AvKsZZHS/5SCX9xfCO+SkvwnQ4wgyxSsz4vtHxY
	 KxVqrOr9D4ttQHkA6u3pGb/WsciThTEw0SA2f4zA2fmzLX2H5dvSejZmC899HTAQ2Jpr5
	 dqgdI+0qICXHugIulCU8vBc8kZGXsqMYhuy6qLdg2+ZSLBrTGjOKpTo8ZF6Z+WKPA+kxe
	 jOsrr4q6gD1uPo2F3g4VwN9FS77GFv4h1EJqnTi2eWPoIGdDQdBheFTJ6einQpC4qVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3J5U2FAeFLLXR6CG2lJiwfFE52kTArm5g7+TkN7ZkP4=;
	b=EhI51Bd0Juxb5LovcZULVmUBif5u0s9eo+OAALwnEDLCQL8LofBzZ0N70oGHJceMJWLY
	 +4NT6Iqhj3bMhV3T7mJfuaASCJDVH29b400ie0PlmAwqZqjqmn0Vr6CQbRr823pA9lHHz
	 S6hJxVQPq+KP0deM0mgx1M+enT26INPY/Zby9aydpq8EM4aj79Gf5smeTCvfBl79a0I/f
	 eQ2YgL351q+6WKLF//sdrQBZXfxtwnxV3mik55vl2hDV7N/g9tUu/7QhhocxLhGl0NWgu
	 n2gx5oUcjHP9aZsX5rJ0a07XRBlNGc70+oWwx7IJnk8ypBssZj5PgEeELKC9bamnKJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQZuSX0g;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F703606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F703606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQZuSX0g
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso202562f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793779215; x=1794384015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3J5U2FAeFLLXR6CG2lJiwfFE52kTArm5g7+TkN7ZkP4=;
        b=SQZuSX0g91oWeZSAP/p1U9aBnfZPE4Yzg8WfAvzS6pjsOG8d5mgQs8vqxpuSjDoxdp
         RRt682n1RcNg8uAgeBawgF7qNEbDESSSI+RjNsdkB3O6FqwxEvRzmzTAPbndKR0tAmjx
         47R/FpUfbrKsit8Do9I3PFqUdtQijOq+OQq+HQNz21Z1ouQTNJucNEfZgj0Uxdop2JOC
         iUaGjLr561695Bgh8ZH4IE1C5nIRPEE2HDfExE94944zTlCvR1OO44qqPAvW4AAT/lIv
         vJymfrHZeoOJTzFrS4iucUswnaSshPEGLsRyqESzvADPSoT+PHhG+jq50Rn9PN+DmOT3
         REMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779215; x=1794384015;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3J5U2FAeFLLXR6CG2lJiwfFE52kTArm5g7+TkN7ZkP4=;
        b=RG6IsclGbf3fNCbO17SxWsJtiyEitSZvs4/GkVoRhIp1cKpKvaCAQFEJ/2WVlTFLh2
         goIqsBQR2LcaGxLnbHODEBjcXjiEvhMp+o3vxtuf1FNICRXF+CUCo+JzkTKgpAkX0wfT
         h5z8ch8Q6ucIFmeSg4A7Fx0ydmyCg3KGod0RiiAKAG7qynBDByuNd4RrMwQEZvKgnC/y
         +CqUwoosf5GEHqzjFQ5zOtMA+jeM4JELkJRyVP8tDIIti7B6qrRDQWSFKc71WI8DRjlq
         HO5XxfpyFIIZZ+kErrp0cHoC2Fz3c678fjA2fLzzlfEG5tOv5sKLkoXwDR1zdFvOML5q
         YRuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdIDxVywC7QhxOJlAgqQIL30HB2dmOlD7jrqExXgbh9IN8aG+TiX7o6SNX/8Hb46BYuypY0M6e4h4hJqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cLVDbpqzU5cdeso4OZSwioE31Anx0sRrgM8bvzwOpfhLD+Ay3
	JwH6V/1iJT+7epy024uASjdFvmbVtfQcT/c3GwfJDFCVc5jj0wt3vFt46kHs1Q==
X-Gm-Gg: AYBFou0+zl4ipzydTpMX/9Qh6VXEYE7k7XWzJkAyVcDbnJnz1IJLhrDFAcIGlRuIl/I
	NTOyIdNKW2CC14awyC5b8zH/dbeWqrDZJYPZBlee4P7nEU56m/kvO/JHy5umC2OC8/8e4ax8mh7
	MnQZ6mNuJzuip5CLrgua0FsSauGUXBav7LB0NjgzDWE6OLsD2BkVK44e0pSglGvZyt4roEG14QA
	5uuXGXO8kEgvnm4cJBMgNmAO8LOLBH2Z5AvTpw3/nJfDvz7YMcyWhh3bzDlAg85NEjrs7LoCKY5
	7WyvT+XGZa86XF8vukIPV7OTMWdxkAe5AjUWHLODY7CisyEjfAkxm19ea5HRuej9oIgghU0xm8V
	vplmZDQvyGpRjKlVTiRrKXNyzZz254JASYXpplM9nUUF2/hnNT/ps1LrtpP0X9Qe2xv+pycw67m
	xfjBaItz0riVIqK7LZBRca7a6IoFSjGuXMSNmNLVlNGo9lWeDO0h9KoWhp1n5uEw+rBnTOJx1zO
	ROv6ImUpP+R6JtBXruwPe9baZGKL+hLR3zsihIqo2ot950edaUxSp0i2vOMNkwqtzyILzQWw9Nj
	MYZtHY+th+j1Y3Xk+2V4DPkYbTZVs1YpFfxKnd6c9OEAnQt8AcssvGMjk5XcYEDPGYsGVXeOJfA
	ziFzIfGtb6M0dwidrtghsMWudblNdVzW96lON3fE/oh9sT51A7mxtJMaAMSySOWNMFi+8vl+rB4
	Zc/8SGo70I4h75WJP89V2L2cD9r9frBzBNH90XiEaHg6elgATqn9rdWTfp6lIFhynYRINwZp/Cp
	7rkEg6J3bqvSmULB3/PK4M=
X-Received: by 2002:a5d:5f89:0:b0:490:2033:1477 with SMTP id ffacd0b85a97d-49020331482mr1365594f8f.56.1793779212966;
        Wed, 04 Nov 2026 00:00:12 -0800 (PST)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18104bsm2588704f8f.6.2026.11.04.00.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:00:12 -0800 (PST)
Date: Wed, 4 Nov 2026 09:00:08 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Maria Sheikh <mariasheikh812@gmail.com>
Cc: outreachy@lists.linux.dev, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, jic23@kernel.org, dlechner@baylibre.com,
 andy@kernel.org, gregkh@linuxfoundation.org, linux@analog.com,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: addac: adt7316: return 0 in
 _adt7316_store_enabled
Message-ID: <20261104090008.00002b25@gmail.com>
In-Reply-To: <20261104041237.7978-1-mariasheikh812@gmail.com>
References: <20261104041237.7978-1-mariasheikh812@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Nov 2026 09:10:45 +0500
Maria Sheikh <mariasheikh812@gmail.com> wrote:

> _adt7316_store_enabled() writes the config register and returns -EIO if
> the write fails. When execution reaches the final "return ret;", the
> write has succeeded, so ret is always 0. Return 0 directly to make the
> success path obvious.
> 
> Found with cppcheck (identicalConditionAfterEarlyExit). All callers
> either check for a negative return value or pass it through, so
> behavior does not change.
> 
> Compile-tested with W=1. The disassembly of adt7316.o is identical
> before and after this change.

I'd move the testing info below the ---, as it's only compile tested.
No need to resend however, this can be fixed up when applying.

Reviewed-by: Joshua Crofts <crofts@kernel.org>

-- 
Kind regards,
Joshua Crofts
