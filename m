Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3261C420E7C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426038; cv=none; b=botR9SlHDrDwD59mntJRMLZ9+02mUWhvfUTaw1dgOgVT4akE1EwHyGPa6iaAEpdKbmdJaGc/H6jwc+DGVelsA9lm9ff9CS5rUBxivPssiis4eovnjeDAhzqseF/29YAgB/VofWTLx91t/Xg6rgs4uKUl0w2m8BVlvkIRItFCy1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426038; c=relaxed/simple;
	bh=/4j4hh9IfSjHBiMji1LzXBY4+qvVL/UoD1uCiHyYsag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aj0pIIPeOzdy/mjsy8iu12TD6aJNr5g+XAoBFa5q9MqjzL0m+2KarRG1tSWYpHzuAXirUm1E6vBtTNfPj/PoXhJUUgqBJ7Ypabhw9ZFi+gJirGricGWfq1cqtE0D4HSIWzqLg3ZXQ9wQylQDWs9sANqb3ifuBVD3JUoF5nqXHNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDc96USJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDc96USJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso3664075e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790426035; x=1791030835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RzMeIs9tBh62lQd6dZPpENkTHWEmBkK/bt48HVj5kkc=;
        b=FDc96USJwb/N2b/3ENhK44ELnp/7J8D6X9fahPG7k9HZQ04OV5jXJ8y2g4P+mQFFo/
         IYMxVOj3vXziRi7ngEB1eM6c6bC4adWi38GPcyGz55FTjdFwt5vuPiAeoEsuyAGcWHV9
         8SSRs9psVKpHmr0JQkZznx0AFGa39azVat7du1i+8k/7HFxltdscYl5lbI4Bq98KEYGr
         KS9BAzIyclkPZfGrQwMSX6O94uad06r+tF0IpEEO5lTmoHwLs7HJhdzBke+5zHyaQFIz
         Rfjkf8txBMFlbCtfdHF1BqQwgO3NAFT1O9nNWTV/BmviN4tnF9XAGTR3iX2E3f68OEdT
         0bsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790426035; x=1791030835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzMeIs9tBh62lQd6dZPpENkTHWEmBkK/bt48HVj5kkc=;
        b=V2oT9q0rVxS8BH/siwfdwdmDqBZL37j/VfkpFo0APAnWKDQJqCJDuOe3dCrgA5WrVj
         TQ8UGAzDE7lrvg3G8/AeUticJHtU+bvxoZvWgln/rPBZP0et6beOr2pk9SQe0r3IrK9F
         YgONcHOXvMkKTEg2pOFlEx2Lr944zi0nDdGtHprML5BhDhOK7JYqfPaqXgRD63DPB+jf
         JPUUGsbsDnAcqfajzBm2sasYwApPhrxWUFJDTmkXcjhrv/xb3r+sOYTwnOeNlx1IwScB
         iyKbrZrLEQYsVjRlR+MsHbct/tA0i5BJgXgKgApkrzE7L8hKbnec+IXKlb3MQDeUA3yG
         lN+A==
X-Forwarded-Encrypted: i=1; AKwUvBxrHWNWnh3rfqzAUkpD5fnntQ+cJucTxAFh/NBjnoA2oljgQqaxMQFYwJVaLkk4sfFC4bDy67Jq1YbKSj0=@vger.kernel.org
X-Gm-Message-State: AFuF++l6AwfkGeh/0p/dSjs98p9qR0nHnXCt/5XYgHFxRBjQgW100n7w
	xavISaKWxjudqNMUvPEgtu+dcKr/Se3ainUjOCgkWreejkmQJ/ljDIL/eeLY4u9LrfeElg==
X-Gm-Gg: AYBFou0CHMB9sA2S30sgujjQnKPcoeuqhSlP8pLbtw4L4uu8gW39VhxzwQb10RuuDB6
	JmwpMP7FCpUY+6NwDxhGQKkJQOkD/zNgRzK4vGoKOnCn4QnR0VozCk8N7rilwLihmsW+g+0PPrA
	hQdIxIR5JpwyMC4WxDE4OjwMBjnZyUOk+p/3uSLJqDFMhz2Z6tyb3E1Q9wJGnqO1UgGteyrbvKM
	waSNkZwrI0MdFXn+hCVRnh06+RHmZlci5NRl2J47twliqZ7FD0rd3cQTeZ7ZhrPG2Ss8Okg05Bh
	fAmTRRzlN3oeUOxzkNI2bWurA+4FeRgVnmyrBocL7N0vbaPHT1DYSekmkUkxui59PVJ78SK0RM7
	80lHN27T3eTRAtJS0DihhnaESPyjpPA2fJZjyqonU+7drHeD/+zTEt5zM9MZ3BBEdJD+EvumZII
	M/9yecpkpH/67WMOA7YzbjYSLa0QTrjAwJGZsFJylSJcWEC8mbkK7PZfXLrPGsyhQEGak=
X-Received: by 2002:a05:600c:c114:b0:49f:fe79:62f1 with SMTP id 5b1f17b1804b1-49ffe79648fmr12725635e9.27.1790426035118;
        Sat, 26 Sep 2026 05:33:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5debbf4sm264713115e9.9.2026.09.26.05.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:33:54 -0700 (PDT)
Date: Sat, 26 Sep 2026 15:33:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] wifi: ath12k: Reserve space for a string terminator
Message-ID: <are7rrYpcnzocHNi@stanley.mountain>
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-3-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926121250.3258285-3-yaojiale02@163.com>

On Sat, Sep 26, 2026 at 08:12:49PM +0800, Jiale Yao wrote:
> ath12k_write_htt_stats_type() accepts count == size, which fills the
> zero-initialized buffer without a terminating NUL. sscanf() then reads
> beyond the buffer.
> 
> Reject input that leaves no room for the trailing NUL.
> 
> Fixes: 8c7a5031a6b0 ("wifi: ath12k: Fix buffer overflow in debugfs")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

