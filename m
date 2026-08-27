Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A46947F78C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848262; cv=none; b=nWcmo8tuqrTQYhntRr621vyj6DeGemHJsfNEjvmsT+mq6CdRkYdNJQq1jqEZuj7rLc5ZvKPDkuLOSIzhcQwlP98NA2cgs+HoUWxpj7Qs86ntL1bO5QCoAt0pCJMAnwWOHKUJPg3yy/+xfRnQdm4LHzJzg1kZQOSsEpzVe6Rn4Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848262; c=relaxed/simple;
	bh=Q7OU5Jz6IQBMs1spEvrVx8dsBO8QJhIHsIwAADhDZF0=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=Sn2vhLhBNq76G8cwQC6KZrcsJiVyxEYDfvLjCzve17t7S1kWd1Is7+7dYCDIDFn0f2kIgs/M+y4x9Pd/AxaXbEl6rfFRBM3Zg+i4872DpxrurzHCR/IpoaiEzIdFjQeIGP3zHx/t5Dnror02SQt6f496xpqJnRqeRYAyy5CtVvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Ch7NMVUO; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Ch7NMVUO"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90cc64f7f86so1271616d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1787848260; x=1788453060; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dq25/aBtrpBpx0nZ2dCJgr2eO7iV5tGb9Q2RS6EzPiM=;
        b=Ch7NMVUO+B69x8WhWm17WiQd0VbYvH7C1fK281mttc/ITu40Ju86ZLst2Qy8dHBz+f
         xv9GakndqLpr+dT//OIVMViHUCVTfUqOPZ+DmNAotFDn+szK5trbtFTfe0jd4J0nJMqs
         iAShvLDzU+EQhxNlqD8X7vO7MLhWCMyJ2jDi6WcUt3GgVF1ltIoneYXosLC5Ap5sgCjS
         JTHUqlj0x170DjRdUhzR8GSZ8mbHTP1XiJ80QHOHrSI2aJYXMRU0jIPi7+j8j9lm6oz3
         aMfvyF9BsPe8MEQMzPvAdr3LYjGJjpNkkq7D52vCe7t3P5z5XS7P5Gu9g1o2/9clfpbC
         Ct9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848260; x=1788453060;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dq25/aBtrpBpx0nZ2dCJgr2eO7iV5tGb9Q2RS6EzPiM=;
        b=MJDnprQduy3XkhKFchMFzwE5sWfeyqDh7E5vlaso3dEqSG0LDQgzxZwxLYXbi/3sOq
         X64lBpxw4u+kwNTSZiSuFYJY8Jdel8yvnVPXXY1tFK03lhPo9N31NYO8AMZ/esYX12HY
         nnj5aEP8ecZhatsOQRwYId3V+50JgYlge6C94sltGtEx8SIzEtmpxfVXuslvh1f5JTMc
         lDwsl98mT5NRoHFLkVb2SHS0B1vL3p9OdV+UT1k/7frW//zU5E76kgY9YtLJi+gT/1yU
         /30sI44FLKV3p1KpTdeGYDIwdRvwMqRhy6kx0iFSuHi+UwfSoVJTXXYq3c4B8IbBRvia
         eAPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1R6ygroBn+nIwwITvL3EahXl5ba7r2rbPT68Nhij0d+afzm6SF11OD5HEN+9ZQM+xCn+MJpqcyt0sfns=@vger.kernel.org
X-Gm-Message-State: AFuF++kBVld5blE/RlUoZVwE2++GPTv9Y6prDARpRn0Bx0MEErRF2aBY
	9gKYmX3/YdGvO6VGcGjD4ZpVG3I/tmXZDagKir/IKBS842IGdtIulJI6/GLB2Eoe6g==
X-Gm-Gg: AR+sD10wWHGmoIDUG7IZUqtZjzRlKkDsJ0E+Yq0P9vBkFAQIAzZSyUf+UhMQJrO3sOC
	B76JsXqjbPsWDF7zxO9CqNf7Ug6ZbWRiY9w7ZZ6Vfo7CC4KBvlDs8KTBxXVTIprNTOK8ldmSdfF
	LsPqSZwFngD6IDpcqtyXeT2QRUzImPzssHRAigr58XSd5QW1jzkL8G8Jtg0aUzUqdbnEzAEj+LF
	uJGyewYLLZn0tW6x/M5xBwM1PNEmH4Nyf/6HBaJazaOxP72fzC7S+k1DRjEkEuwGl9CgzYC4P2h
	eZ5n/fM4EH1FFjUpkRu+pr+bDt6yJoHJ6VOQxsjq6cHqVqSWetE3nSPJJkj+2lyQ7bE6LJmA6IQ
	lYtl/4KvL1zZyt52I4vTVqq1fmHSGIrcnxTlF87kOLtWl8pr+wGGsfad3CAauFAbumjw3d+MsuO
	slogiU1nt5wCIq2MRC1Ixc+1mEYlrC9nWt5Fa1+Yksmd+MW1n8ESDQPVKOKuPMSqW5MYsOezYzN
	ziba5+1WTQm5FbWRDV+LpG25M0GKtcIrA==
X-Received: by 2002:a05:6214:2aa8:b0:8ee:fd0c:5d96 with SMTP id 6a1803df08f44-90ce0c375b0mr6387676d6.7.1787848259896;
        Thu, 27 Aug 2026 09:30:59 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cd741629esm20326666d6.49.2026.08.27.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:30:59 -0700 (PDT)
Date: Thu, 27 Aug 2026 12:30:58 -0400
Message-ID: <e7bf759345415ea1935fc845506d84d9@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260827_1122/pstg-lib:20260826_1402/pstg-pwork:20260827_1122
From: Paul Moore <paul@paul-moore.com>
To: Cai Xinchen <caixinchen1@huawei.com>, <jmorris@namei.org>, <serge@hallyn.com>, <amir73il@gmail.com>, <brauner@kernel.org>, <caixinchen1@huawei.com>
Cc: <linux-security-module@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <lujialin4@huawei.com>
Subject: Re: [PATCH v2 2/2] security: Fix call security_backing_file_free  second time
References: <20260707080615.1235830-3-caixinchen1@huawei.com>
In-Reply-To: <20260707080615.1235830-3-caixinchen1@huawei.com>

On Jul  7, 2026 Cai Xinchen <caixinchen1@huawei.com> wrote:
> 
> I found the following path:
> 
> alloc_empty_backing-file
>     init_file(&ff->file, xxx)
>         -> file_ref_init(&f->f_ref, 1); // only 1
>     error = init_backing_file
>         -> security_backing_file_alloc
>         -> rc = call_int_hook(backing_file_alloc, ...)
>            if (unlikely(rc))
>            	security_backing_file_free(backing_file); // first call
>     if (unlikely(error)) {
>         fput(&ff->file);
>          -> if (unlikely(file_ref_put(&file->f_ref))) // zero
>                 __fput_deferred(file);
>                  -> ____fput -> __fput -> file_free(file);
>                  -> backing_file_free(backing_file(f));
>                  -> security_backing_file_free(&ff->file); // second call
> 
> Currently, only SELinux has the lsm backing_file_alloc hook, and it always
> return 0. When security_backing_file_free is called for the first time,
> the blobs pointer is set to NULL. Therefore, double free will not occur in
> the code.
> 
> Fixes: 6af36aeb147a ("lsm: add backing_file LSM hooks")
> Signed-off-by: Cai Xinchen <caixinchen1@huawei.com>
> ---
>  security/security.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Merged into lsm/dev-staging, will be moved to lsm/dev after the merge
window.

--
paul-moore.com
