Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C20C4E431D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354350; cv=none; b=elBdeLJadrfx8Jb9rSgoH/h5xMMJQflg5M75EaIRYU936dL4xMJ5c/ZQRuShuKzNKpED5g80H0eeo9mufWeC2QJNbmH96nJsS9XsveZ+/vXLvvXeVMDqbCejXNP4kcRKPX3y4Ep86sVOsgpbirPibVefc71+79QqWqYTWIvCnyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354350; c=relaxed/simple;
	bh=KlAi8xHnnOFw/mAVUfZ1GHm5kwwuI+phYGNF3RKELvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVbi3vZ7Qm6x5v/zSbr66V2vMtNTwlLJ7yDiMqSASmD0CAke+tvD7Uc1IYrnVFHgQXaNfSKLQb7WWJKTWHdOWFl3GI9qBAOjIUolh41w+faUZuP/tfR+pC9/oYgQqKu21xwvqnxam9zcM5hq0GMcvs0CXftXPEnUmFkL47ig6qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnp/unAj; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnp/unAj"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cc46c7so109369785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790354338; x=1790959138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ST+t+OHyPOxhwcwtwjmxYDqoKgl4pMnoZVmAn6Uok8M=;
        b=qnp/unAjOISefdNdI1rFz5ZDX34aECjUkvwBKpt1kLiRwas/ABAZ2RHuYK0vhYKgN2
         HaiicVjRHoa5IsQiVWdwozEXSjPLwFrunQ9zLl/Yf6VpPXCDq94Mc6bYKak3DbcErpwN
         7OzzDik8onwuvtj022NEZHZuYnXUcnvpEHBGReC+w7M2Ft7edhNvT/AnVVhzR070z9Y/
         4tBtPbAYgWMZQOi0O2johw1GHFNSBCSls0ye/0c7MIFGERCUWM53ttmW/lfytkyb/TLZ
         5HKH9lEDEo8MFT/O57FQivcZFCy8h4DcH8RliHdrzNLNqSBJHC5D5kkG1h+uJIY4ixdG
         JZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354338; x=1790959138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ST+t+OHyPOxhwcwtwjmxYDqoKgl4pMnoZVmAn6Uok8M=;
        b=HPRSI+TySYwbXwikMqBgEa9Q0/mVNeTy9mGkIQZx2g7lTOmNykvNdgILCQy2A7h/OM
         gxC3pJH0umz9SeQrkUNCn8WwTHeazwCUnMEvVCHWSNXynjcJ1L37hENMWfeKMp09BXbO
         MEATjKnpSygLcFMF7biFmvaNZK2JHdTXrlpegrTMwSMcimcNk0kRZs8JwtqNNw6MRoJP
         T9UmqlS2bC9Q5kiR4Z5lyFrCKL4pkfHqqX/TxrIrPFltSsPnYFzaI65rq+b05+/bS1Wk
         /lW1nje0z6Npj4RIwJOC4NLzniZwC6ig1EGDk1mTahWN+UI71jcQEXzdyAnve6BqBjdC
         ilHA==
X-Forwarded-Encrypted: i=1; AKwUvBwYoS7KnQGQqF+OiaUT0pBVfBuyUDDmCpNUkI9yaHnUGs4TK9ifL+I4Qyhw+Q9fjTPIDMdhG9pwxyd/o9g=@vger.kernel.org
X-Gm-Message-State: AFuF++k4p2LN/BDggKRXxzNkAGJPEAD9ZlQCt9I8/S7LoZzy0A76mZ/K
	r5T/9rgpQpg80nwC8yQeWrKdiN2gpBBFLy+/UoGA16pT7kCTZpKP9eC5
X-Gm-Gg: AYBFou1suFdIhZgEbTaFAt84EXMmB2irT/AIncev2K9MG0e6KeFrPlugEmDwmTbsUu4
	lCkdgWigbeEF8YXEnQs1bqqkxUzg0shJyMQHJgq1GH5mp6r5tW17CV2fqaYXThTIjNZQ841MAwj
	w0jqNRJiYwUuRkUWtL34iGUxmnYBARPLU2xnhDNj14YSVJdJTe4tcbuf1ExV9z7qSN4umTqoCe+
	iI3rhugBkgLOJOYAv0yM5x4KaKaVVouKaLGyicIaQpnRhatSOwqRHhFcE1TOPedqQotVWQiuZLB
	tCsgEB5QPNOUioKcuhjMTXRRB5ISM5H8dDZBhXgEMJ08BEEiz+LXRtTL+NXsepzV72WHbWHxCCN
	Z7LUfjtKFPBwNZGMjQIiL5yTbZmFbh3R+5SXycOJI/2frO3sjSE9Ioe6A8wMwLOizjOUt4bBtN6
	bJOPJIQ3uoGimOzGB4mrGA57BMilQpSOmpF+Ri7f8x7Ejhu43m2rI3vVoZ9bEHI1+DIwfE5M/X+
	DNqcBVauBvIWGYZzEea/wQUhuhxO+HvJARKK08mXFXUP2GTn0Kts7q+UA==
X-Received: by 2002:a05:620a:3711:b0:93b:e578:5838 with SMTP id af79cd13be357-93c43b86652mr598453885a.12.1790354336954;
        Fri, 25 Sep 2026 09:38:56 -0700 (PDT)
Received: from kernel-dev.. ([2a01:4ff:f0:3ff2::1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dabed8sm20923566d6.12.2026.09.25.09.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:38:56 -0700 (PDT)
From: Uzair Beg <uzairbeg11@gmail.com>
To: krisman@suse.de
Cc: io-uring@vger.kernel.org,
	axboe@kernel.dk,
	asml.silence@gmail.com,
	lin2530632123@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] io_uring/rsrc: allocate io_rsrc_node from a dedicated kmem_cache
Date: Fri, 25 Sep 2026 16:36:07 +0000
Message-ID: <20260925163607.524636-1-uzairbeg11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87jyom1ju2.fsf@mailhost.krisman.be>
References: <87jyom1ju2.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gabriel Krisman Bertazi <krisman@suse.de> writes:

> Not opposed to having a slab, but I actually think it is
> unnecessary.  see patch 2.  If we do that, we actually should delete the
> async_size parameter in the opdef, since it is now redundant.  But
> see comments in patch 2.

Sorry for the slow reply, and thanks for the review. I couldn't find
your comments on 2/3, either in my inbox or on lore, so I may have
missed them. Could you resend?

For context, 1/3 and 2/3 were both neutral on their own and exist only
to support 3/3. If 3/3 changes shape as discussed in that thread, I
expect to drop both.

> FWIW, this is exactly why we have the (*free) callback, you should have a function
> for your specific type used as a callback that does the kmem_cache_free
> so you don't need the if/else here.
>
> But for a simple kmem_cache_free, kfree works just fine.

Agreed on both. I was guarding against a mismatch that kfree() already
handles for kmem_cache objects, so the free paths did not need touching.
