Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AC0324B32
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259605; cv=none; b=lQNUyxHWcPhUPKW0cB7ntFsjD4HbB7qhqq76LTUWWCpduFQIUfsBlTckEst8t52voeNgK2hXoXxfqrdbZFIKwgX1ygFXT3tBbrwK1ByAWmrWSJhAdVLF3ObTw9QSqgYjqYsCfHxxqa84CWTb8rood/XQJaYZYghCZX////KLxp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259605; c=relaxed/simple;
	bh=b+5D799ouQ2Iwsg6VUg6t0MfL2oD3ffXyjOVQ+RJMK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ri3fQerCjLsIT6FpnToL2K7E9AHZCwQ8anUvj9rIbyDe4+gjYuNSgFkeG8f7zm7Wgsc8i/+wrt+61WUJISJaClDVZLagJczUC2RBKlP5KAZGkRwlUicGFD8gHocSyqIMwqTAxxDR6r+3wYPyBCEAW5Ri2H1FXzVIA3aBtous3xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5QchNgl; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5QchNgl"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfdd431dcso929989f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792259602; x=1792864402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4U2BjgqQMIyASOu2f7QDzW/sels7LA7kZfnUoXucck=;
        b=q5QchNglt5qDq7AkaZN4hgbJwUWSUBVuOp2Fds9plOWXz78hpMmw907402V2IeOZUm
         1P+bZJqgBoBseabzjipV6qB0IX7lY4lFLHeo/Rnymljq76S2i3RfejymsXiv+eu3tXbR
         skCaa9fQbH2e3GJmGdVGvzVv8uSDs+gnOJDxJt+nwkiRMgX1IpYYKfi9hf2b5BQ2BSF3
         rKvdo5M66KteOf0d0jhNKW17OS5P2ot3VpUcN+RmSKNuKx7jzSXQ/8LD01dlWdqHlvmb
         ReBNcALecWvPG6CBpeMBPZTETqxz9E+oqQRKNWwS9BWPAex5nkJNow4Bb4EOgUy9jPE9
         U07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259602; x=1792864402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4U2BjgqQMIyASOu2f7QDzW/sels7LA7kZfnUoXucck=;
        b=nu9FeMhblU59I/M4E7r7+Eh1nrOwn9tecPDeWZkR15XyKmzaHZMuti0/m98neZVfol
         5NbfVS9sFFo7iKW/CeJGWhVR1dSwJsutu2Ac6uEshYi1HHJttZUHWgZthcOLOr0ivXPQ
         MJ22iHPNdJZBqhNC7yJEbCnjXRhHyVqx/zcnv2qKoVk/zvCMEK3JXo8aEqX4wOl3z9Ip
         D82TjQddfc1N1knqukHBlaHeApoDIHa/oORd7V73N72Wk0P6ZJuBdYBGmC4HoG0DGReu
         cLccKgpZEx3EwYfwDTNJrsvghjrmO//kp7fv+eJsQPxKlKPhw+zm5qYbBgdHhCIWwVqk
         y1Ww==
X-Forwarded-Encrypted: i=1; AKwUvBx9+QyfQaHSDZoZzSbXryjzOmq5Utw8dYcT6kfjodS0V/62kZuGkDepI/tF3Q2yLWa9IgIXxGsfWeWNU6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwd9FATqLS7kZwSYKLCg8Am+RBooXf1g3DNLjiRPkx+67qgTxE
	ViyECPhtqGFs+37i2zTvBhxXUhVcU1GivA/dTXlToMlGm0cpl6yqVu+c
X-Gm-Gg: AYBFou1Ku2eqKqKxO/Jblc15ShHo/+vWHPiPP31MAS+dMUaeflXJvNRuJaZvHx+o4Kv
	00iaf3I4Q89vEW7/B2Or6IVPkZb7p1dP/cj6a6AEku5D2tduZZtcnJMY/xxGc2X+8O01NXjhHBK
	EIMSvAvRzsbJWXxa1cvlV1xxjHMci4dd2g8EmDSRZAtG1m3IBcxCHccvn+kPw/oBh3snxw9KlKg
	qfAaxeHN+Jv+JDBE4H4eR6zQPTlU7NkKuC/zlrRMd37bdFdiqjam4rAD1+3KetTA0g/ng9x8ybM
	TODDtZzDsTe1ITOcT0HRAy88tJ2swWdCDG86JewwBtzuqjphIlR1xQx7KLfbthGAcEwCDIMnjZr
	DrAPq1BOtW3RZ2q6i+5qJLBrblrGUR+y0Fi1s+XfxC8Md8VwCt/HK+ol8pgO9LTWWVEzxO5gNor
	cHW5mPApQQfGrn1QdS3s5SKjMl+WoGYnplqNVG/yiNEjZflS5jFBNxwuAPKFbutG60QQ==
X-Received: by 2002:a05:6000:4b1d:b0:48b:437:8fbb with SMTP id ffacd0b85a97d-48dfae72117mr14846838f8f.19.1792259602249;
        Sat, 17 Oct 2026 10:53:22 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5008e7sm12247801f8f.43.2026.10.17.10.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 10:53:20 -0700 (PDT)
Message-ID: <85ab08aa-9ab1-4f32-b16e-10e778669e24@gmail.com>
Date: Sat, 17 Oct 2026 19:53:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] mm: hugetlb: group CMA pool and reservation state
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com>
 <100b5e1400e692086b1af70e88732faa5a638be1.1792136742.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <100b5e1400e692086b1af70e88732faa5a638be1.1792136742.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 12:07 PM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> The HugeTLB CMA areas, total size, per-node sizes and percentages are
> stored in separate singleton variables. Group the runtime areas and
> size into a pool, and the temporary reservation inputs into a separate
> configuration structure.
> 
> Keep one instance of each structure and preserve the existing parsing,
> reservation and allocation behavior. This separates the mechanical state
> conversion from adding support for multiple page orders.
> 
> Assisted-by: LLM
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

this LGTM too so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
