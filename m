Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631940;
	b=ym3CIrAQI+l9OvUVq9H3H2B573BhOiRE5E5C15m0MpJ2v7LDroO1JZ/8X9AcoOyYIuAi
	 zOZz8PZ15wJLfceo25vctwhuzYpOOTj8my/klzkXIPHAHEBMYBw8zzvc2fObn2twkACYr
	 DZL3tVU2wL4/vNxdcVqlwCjuuJhsKdsYnJkqUf+Nt7l7Zf92Ql4otv7pSjyDXTszSafWo
	 dRa3SCcfaMYarSOdHH5XivldC1irepkAF4PoYtly3XlA+CP5qD5A5gYW84LOj3/xvuy1P
	 eQeK3c7mA/RlCPBJhQSEAGs9sKBK1qkKwsNyDIZrnk171IHRJrtSUJKv8gWWWX30nXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=16KmY+5SMzN5j7+9R15dmTI05WFHA1t98OiX21uElTA=;
	b=lHPhH2JS46h/zvZ8F2rwIXQ83W1lZL4KGnRsWhUJmOD8bavYZiY81x+yEY0VvVHnNBZn
	 tnV3Ch/2rDBlIbrrThiR1VVTHn/2MjZbkCUltB5947xawJU8lUiyhRDQhMLymOPesNer6
	 CFwoSLCISkpf2GOhrAYIc+P9dKVIk8emYeT+coh44pf2thTnToS/mVGF3NjSqtgu+Oqbh
	 Fgr9o809GHZ/LaISUEU4/aVlD1JBnjh/6J8bsh1McIOuNY4i2NQkIoD9lm/il8S67oEIR
	 bhr5QJU/j1ZgA7abNTy9XUm8CDX5IHneBzMP11Iy3BXZSaTrz8F1VLpMjKc65rrf32A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UoYunkSY;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114E6606AE97
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 114E6606AE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UoYunkSY
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so32085585e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631938; x=1794236738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=16KmY+5SMzN5j7+9R15dmTI05WFHA1t98OiX21uElTA=;
        b=UoYunkSYxQznh5bFA75G99i2y2WW9E086osI9oKEp6qIqKaUZRR8w4CxHUrPRkqq5S
         FfmqCJGlVnKa5ovIyVvTW73QdAbq7tDgFU70uuBcb+R92YkXxYaOc6CL8ZMXYWHPP754
         wnsrxDcNSQBDr4jBTgmIADLNqhAKGAMdasjK3IrK0W6zgen1NiBV5tV2pWpdcjzjLeNI
         cBi8+BY4ejD39ai1Abt1TdY+LOIdW/wMxJ/Q8fXMJii7S0kVXjVQQPDvpFRIa95v+eWH
         QOTM3mH0vfW6dScDz4mjR07lz/jXDaBKe8q4rfMgUMR2OvxIGPW1WvDHBlLe8jXj9orb
         jxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631938; x=1794236738;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16KmY+5SMzN5j7+9R15dmTI05WFHA1t98OiX21uElTA=;
        b=K4JeL1aRtDtjnvrC5sU0BGIIFMyJAqIsA5dlloUGBJjyAlaCCYuvck/8Q9C6O2P/f7
         ksMRIpojUSglEhY7/IwZBMo9VyT8iUESBapfuTk1FFbCfaTnX1LMey6V5tUmzdj1H/Yc
         iq1a3LbGubv9grcRztPhVLq8eNF2WKu23iNzP4eDSgIGBI026P0/IW6W+Kvl7PQTzxVw
         YO3RKPqQ2n1nqeneTvV7ZZ/OzWkv5w5vd/noP+YIUhCxGmwl/9fpCi7kK1zNTtc5et0s
         DyOOXqD5HqEg7NO+RiAhoWhJg1mVxFL9/lNV6IYgtfgW+x9FHzfQfRKbWSKuYQU/hDY6
         ocxw==
X-Forwarded-Encrypted: i=1; AKwUvBwqmmaswIDecBD9EXiLK8Eqtvs82HuQYx6qQVJhrEgSUmgsq8FyQ8gTkH7mAZfZgHEmIay4ndnyJhHRs3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2hvjtft1SuAlOTl6OmNtw1J52Co/n7PfZ/E4FrXr2pwbxMmU3
	RvAIVomRMySjGt9jHxoW8djh2Tk6rrSrmI840cYNjfJG4PNcSf/WSzu5
X-Gm-Gg: AYBFou0hgqX5c2S05QTCqumw4Bhtf5oPkTBq8RQHWHOGGl8c8z8S5YYE3blicOBTMQ6
	tLKMYCu6sXX39u4K/JvWm5ePrtGYvtTes3tGDTrNmIsjCY0drpyzetusXzaBVWi8y0i8t4FIO84
	H5TrUg03Q4JpZ3u0Vw3yHG9iSeY3lXPwj0VWnJQIPiOOapKwfLLQa05D4WFAUhMXIEcH934QRBe
	4xXYq5N2gNX0p5uiXuSeH0d6vatpP7bLXJmufPrU9mnPfenV7eLvWmv1XLya997adBWKNvWZz0D
	0GP9ABtx+kDPueq0Yq9m74KJU/iTMp9tjdIW3BPrEFXj8XnQRXenLuDmWJYjFio60hecE2ACiNk
	zRzghisnZ7cFCW08ZBZ6GXHTyKqxF9HCAU0eaLNjMADZhOkb0vOQjRpNSBTVO9nm6zs7daXc1GB
	B9/RwVVZ9XT7Ekk3bmQPpuiEns003NfVHPA93YCckn6+KVumJwCJCx5popT+q4fphMrvxacHfgq
	SCk0TGB6unfLQ2fZW6rxPNj5G2GcVjRjZpGkyUH9Y1ZqC3i95MXd36RpqJSoQ5+NH7Uz9IbuA8J
	m+dFfSn+7xUq1Ft0ajpB22rVE1cdBc4s1q1UU5y0S27fU3aAdV5MSTktYBUNvdf3
X-Received: by 2002:a05:600c:83c5:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4ac19329ea4mr206305535e9.33.1793631938076;
        Mon, 02 Nov 2026 07:05:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ad414e298bsm128041915e9.2.2026.11.02.07.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:05:37 -0800 (PST)
Date: Mon, 2 Nov 2026 15:05:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Joe Perches <joe@perches.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos
 Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang
 Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan
 <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr
 Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102150535.6c5689f6@pumpkin>
In-Reply-To: <87a4nrfgjm.fsf@trenco.lwn.net>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
	<20261102093206.50b6c9ad@pumpkin>
	<20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
	<CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
	<87a4nrfgjm.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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

On Mon, 02 Nov 2026 07:34:37 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> "Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:
> 
> > So it occurred to me that it might be actually better to stop sending
> > messages directly to LKML subscribers and only make it available for
> > download somewhere and as a Lore archive.
> >
> > Is there really anyone depending on receiving all of the LKML traffic every day?  
> 
> * raises hand
> 
> Some of us crazy people really do depend on it, yes.

I certainly scan it.
It is also useful to have an archived local copy that can be searched.
I can see a point in not copying all of netdev to lkml, but there is
little point not copying patches to low-volume lists.

David

> 
> jon

