Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B20357CE0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967803; cv=none; b=tHEGr6q4/Z8od/76S4rZ1an41N7J1U9zTQTZSGyam7nPN8FR9PUIeXFpukRwvsmK7zh7YSXb9GGmXi31X/EEqXhxpTXBSf7nx9Rb9hd06yk6ZobFmY4OI5wDLc1/eXEW4ZLbm0LYnh1eeh6FQWSV7xE1lG/SaTryuizx74wh5ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967803; c=relaxed/simple;
	bh=IJXE/AAwLLrhFbKeRc/sXWo84V65ddEh+TuCXP7dNpQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=RAIRDhmKoxyKecZBxaCbG8exiz99rZkq5Ig2xosvazn32wotckM4gsVaJEoHTHJyrwfzmjiZ7p75gTixhUPCVHtU37VqoAJXvlJXpN/2XibWPlJBWQl4vc0bTMl2Xcmt0VjDIhP2OTcbS/ydw92/R4oaPdh/om/stPV8PZSV9pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GP24+A6/; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GP24+A6/"
Received: by mail-pz2-f36.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so2170432a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789967801; x=1790572601; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7srlCwAy1xF9AsQpfjjd9v1D7/IGjTVIP88iEg8tDSk=;
        b=GP24+A6/MqBqoGdRkb2Vc92pz5i3edq1W9LNqGsTF1fYTLtbmgGSmKYXlndnJW4lVj
         rkGkM/y59akqAdpRr/UreQmGEFYxrpxMoIkRfZIZBumQNTrsyUVLl6FDIz7/gqAwFA5A
         O/xEMY51krtiKGUcsyLVhaUzKs431g4rJf163ZplxS7iWlHaMkGosD4jea5/hvUzZzjD
         k2f5Mlje/xHLHq6JxZj+dn6Jv7Xrt/JcxapZOtv5OxTbIv5PXf56pf1S1yjfCRyywi+1
         BLhuGAfTmT6PEYy7x99K6n2LRxUeWJf5HY0rOMNtjbhKACjqdTFNqj8l+v+cuKrim/Yh
         YYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789967801; x=1790572601;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7srlCwAy1xF9AsQpfjjd9v1D7/IGjTVIP88iEg8tDSk=;
        b=k6Otext3oCejEMLPKcfIpj1Vali+AyZnT7AFvLtB4nn+1KhlgrNx5Iij0+iFn9wUr/
         BU4v9pl53u2DCgcoYjbqwh2kDwMKeKHMbgqWvPmxz5hbbo9vYngmA4dwxSsr2yZfH0/Q
         p4M7WdAe4UZSJv/BMtml5Vs4TLIuE8VuSz+y95IipJsYkAlFM97KZ7VzEW3L9QzgA8mf
         ofuy9n4gp1fS91pRxXqfGJh+pKkp+ig7dzwIHxstM7aopRO8midhdY+X7PC7Pbe30jRp
         8OyPxiSEPO09k1yLBDv7b2nmujHfI/5yA72RebSoJv8QtqBFZ+z69AmRaKW+QhHUZEEr
         AByA==
X-Forwarded-Encrypted: i=1; AKwUvBxE4Wu/u6dIAdI5OmC+ATTVjsTfMZeFXKH+NlqbL3o7P8MbUbc3JiaS/ndMLEfL8wFZH+1it0G20M3oz34=@vger.kernel.org
X-Gm-Message-State: AFuF++lZjN2pYV0Z8nfE6TlKiWYlm3Np1wHB3usQiFkhu0bPIetWy/6/
	fug1iaPp01VOEWzY7KWWRilj6+2TMLWvC4JuyeEoUT5fUAh5clLHcg3t
X-Gm-Gg: AYBFou26+XBy6rf7HVG4YVxXf0hplaSdZxszUW+xnDaxjW6lJW9EuevfUkRWe281iMO
	iTIu+13OuN7aL59l0wnOTpKHzklBHN4GD6pBpIIMDOKj0R237Wce7AhEe+HoPs8Ft79+lndKNOk
	eqksFO7xXo2bn6elR4ZrDTILTesyn/BKZNkF59rGWTJ5oaokyUUm8iNoLCg5w2l/rAlAZ83M2gE
	PGGW11ZaTu7kZQHEthMqQpvE7U3bu5bS98IxK0+AKs8kHPoSvltMVZ9Ls06jjJpHswUKDyMurhu
	xa4dx9B23hZbKF5ddryKhST+Ge0yc+tdIy7PHzk9WmeiRKas4F4E6pPrR4gM6GB/L5RNr0iwFqA
	sc9iHg8fH39X6nAZhW9avSDXHmGeD0JyKfKeUWyfeKukybO0c92orFO85SryP5rkSj+/X7/zE/G
	qMYGt5nC2bj0yPztRQtjSpzB9tayMLi/WBuIT7WBJqTrN1Xr/ITX44amL1hR7mgqcgX2ITniWSs
	WbV0z3usf/u+IlESoZf+WAQKAn1QqR8GbF/fHpf0DM3HjXkulIGSBUvaQ==
X-Received: by 2002:a17:90b:4a43:b0:39f:b29d:ba3e with SMTP id 98e67ed59e1d1-39fb29dc1efmr7820384a91.2.1789967801423;
        Sun, 20 Sep 2026 22:16:41 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f17dbdsm17114682eec.1.2026.09.20.22.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 1/2] clocksource/drivers/timer-clint: Add ZICNTR
 support
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Icenowy Zheng <uwu@icenowy.me>, Jesse Taube <Mr.Bossman075@gmail.com>, 
 Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260625134752.3107959-1-jtaubepe@redhat.com>
References: <20260625134752.3107959-1-jtaubepe@redhat.com>
Date: Sun, 20 Sep 2026 22:16:37 -0700
Message-Id: <178996779709.23212.17122297709908983835.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789967800; l=835;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=IJXE/AAwLLrhFbKeRc/sXWo84V65ddEh+TuCXP7dNpQ=;
 b=jcGPQvSH3J4vOJoQCuoWYGp03/nekB6xA5dqhb48baZTTERwaQyiyfyQtOVApCGjcF3r3hDCG
 5sSrzSSY6+4BODWmvljyUyZr79ekMF6uxiyH8PSgWUnJyf1oCrnOvE6
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

> ZICNTR allows the CPU time to be read using CSRs, which used to be the
> default. If ZICNTR is supported prefer using CSRs over MMIO.
> The clint MMIO is covered in the RISC-V ACLINT spec [1], which has
> not been ratified yet, where as the ZICNTR spec is ratified.

It's actually stronger than that, the ACLINT spec has been rejected:

https://riscv.atlassian.net/browse/RVS-3645
https://riscv.atlassian.net/browse/RVS-4913

> Using the CSRs also used to be the default, but was changed in
> Commit d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
> for M-mode systems") due to K210 not implementing rdtime in M-mode.
> 
> [1]: https://github.com/riscvarchive/riscv-aclint
> Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie

