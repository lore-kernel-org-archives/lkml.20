Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952354;
	b=DhsM9i3ZXHdikypESJCzXEMReXKx56aN9IATLFqF3FuL6O4S8i/OFOYQZpuowNeWSQtq
	 cy/6AJ8meqXnzD+WRyFvemmfHERjHzRW3ljks9FGjLHa2RbhyDq6ydZyRabjOAsQW5zmA
	 TGTeVkUntesWPQdRHGpkR4NrzkHmYWW6l/5ZYacnDA9wpiO30XQlYUu0cRP51l/cTf3Bh
	 /JJA+P33YRtaFFEiJvhMYw8CBjrAmWn6P2y5OPS9XwdF9MB0P5fwvgmjpqG3Ia4LAMjWV
	 PJr76daBGQvHu70eyE3cegVA58uHjlcTAWNRNicCzedL0zWb9AiQKDKB/xMvr644TuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zm2aYmxX6SYlgH0yTM3NHAOca1bMdwRynpuDzR86ld0=;
	b=akxy6p2Sv+ZqqfXm3cjfKRdJGuCTwpu7PXRfGSpvk8FpkLK2dxuzXJ+TLfS89zwXIiji
	 fy/8gZttRJ2b4ZtD9C09kIVBrPgzIhY4DTq2PQ+LLnU0rdrAetsfA8mamTi/zoyeoQhx4
	 MquqoKugDkl2mRutSAhLXOP/NuV/u4xE2qYCyS7c8g+1SgWJRYucAF0JPx9Fgbe3u2TsX
	 KByDdQhBjug5NsKxZOKL2vX2fffqfXv+ETfIK8VoYfeT6FNsnFrhjIBNOvYrNim4MFiF4
	 AHK+9R1h8qotMivF+nA7eGHX/pUikIHBxZBOWK3i9ys4IN4xN8hB8O+9q0nAKCsnQ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="oaWL0hP/";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9155606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9155606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oaWL0hP/
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23944165e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792952352; x=1793557152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zm2aYmxX6SYlgH0yTM3NHAOca1bMdwRynpuDzR86ld0=;
        b=oaWL0hP/yXSA52dIc4x/zUCYeMbaEE0jCVb3zOcP2bvASkpqyPrWxkEhROsB5KSLTQ
         J58vY9eieREt6Uj+QOFYQln4Z08eYw+9SFfv3irAuvMpcRbHan2+0nR18M/EUFB9pEI9
         sLRb1B5+jgKxgvX7fAwJtW+N4gxz5JjwC68aa/rLBU2PNSZ/vDwfyDwwBW+zGbNq8cXh
         9KGonJZF7Pl1OQ6WzWp3olyi7obQNUx9hqfH4gQLm30w1DgFkPq2OwvQOOTIlUxwxJCY
         uN4QOdXeaBTe67PI1zK7ZJdHHj2ggng2fBfBiJlZ4MIKtnmXjvjEVxStYOfjWMC+q6nM
         Lr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792952352; x=1793557152;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zm2aYmxX6SYlgH0yTM3NHAOca1bMdwRynpuDzR86ld0=;
        b=a7Djm8SZO4xi3CNvlMHWg1Klsr86ussWTTno+NEt4rjmKPmrRTv7axcZsLbDTiKNOJ
         AT10MoDfd/ksmr46GzC0MO8Dg8XWV7/J9oulVrPqERckUdzQsIV/FbW0RcBjwJWSnha8
         0L+tEr3ZGrlyBNFcxGjdByGjohBFbxmRnJPJmGPu5kC5hF2PxhX0XUxTuMN9O5C9T3mc
         4t0Yxptu/XPEeC56nnp0Ly3CTsV+BXzYZ2JcwcK6xLnA8NehfkyEF4DlrrHOzCDX7s3D
         Kl9CVgQ+VgQ64XEbZkoCXaV78GN5ntl1hATGqCHoG9xJlbbiRxUvUySl/ipV6bQXzFlB
         4HlA==
X-Forwarded-Encrypted: i=1; AKwUvByiu6bQULZt6sQhTzq7bwktQVlQ1T0O2maLgtnDkxRI7LsFWPZUzgjU/Uw3Ag8x/ZcnKcdUURbXqp6P5cA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2j21E/zQY+XN1VdhU1CHVbhDDJycFci5RgMAlyYZ+lnXkgC2y
	EPVS2P/fBym2dLIDF/xOUWuoF7ciUarem2FOcHGmVdxe8xm+oXzkd7j+
X-Gm-Gg: AYBFou03XUlih0s8no8RAkcmtTtLslRVqoTR2dCz/xdDNVPNM9ihu4QnhZnXWGHUPXN
	bZntGV4PnEiQE4SzkJbM2g2UdVO7VUxRlPiIY6IvQtvXMymDHmytXbmNvsGtTpy99JOaEyi/52K
	JcbfZLs3GA1T8gUJ90xw5PDFcvs3lPB+iZhiSvc7hiyUueUSp2aX97m4WjHEhYCkIHLJXdCIaEZ
	b/wTPSqWMSXF9yQXgy6n/pZhed8QB9CfalmQaSTAHVowHiF6nhQDatZZTxaV1c3GBaKbSAOCUzR
	IxYCuVKnZqU99xwQAZY9+KpqJ+PT0UWAhXqasq4ppW/ptVylIPt4km88y8gLvNfLK5VjG7oVkKa
	IzAPZECjw09N4B1zOBiekTLLBcOxo4+AxhX18k+jmD1XGPArG6UPAzYue0+YHaALhZ7CAruUpyX
	hvCQlvcScXR20FnMPbtU/VmKOPrQE38PFfF9KVfTyI7VxnieHA6qsvSf8sdmg6NHMHmFMdMxGFt
	NXtP4L+1NSgCOcwzNSyEinaZWK79AwiEM/eXE3RAC9f3hCUksNG
X-Received: by 2002:a05:600c:4704:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4a35acc2ea1mr76729215e9.35.1792952352084;
        Sun, 25 Oct 2026 11:19:12 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a293sm137475645e9.12.2026.10.25.11.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:19:11 -0700 (PDT)
Date: Sun, 25 Oct 2026 21:19:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Haasham Khan <haasham93@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: remove unnecessary goto
Message-ID: <at5IG8sRxSA1AFC8@stanley.mountain>
References: <20261025130258.10747-1-haasham93@gmail.com>
 <20261025162632.7186-1-haasham93@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025162632.7186-1-haasham93@gmail.com>

On Sun, Oct 25, 2026 at 04:26:32PM +0000, Haasham Khan wrote:
> Return directly when setting the mode timing fails, rather than
> jumping to a label that only returns ret. Return 0 on the successful
> path.
> 
> Signed-off-by: Haasham Khan <haasham93@gmail.com>
> ---
> 
> Changes in v2:
> - Return 0 on the successful path, as suggested by Dan Carpenter.

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

