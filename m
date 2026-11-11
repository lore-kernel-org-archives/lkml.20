Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436165;
	b=fg78MvgtWMKXsEAhwDX4QkpIl9nWzeLzsiZ4EMtmTI6aTZ/1sVRtZNZTBoYU+s2wPMDe
	 djTM4bev5U7uVfrLvOAyKuNIdm3gn4TP1mj9+sU9b1OhRzFc/q2xcjxzKLnFRvQQA9nSr
	 eSxGvNhCfd4y0KAC3DfWOmhUirGDVhFJixb4ZIqMi93sCmqhDw5JUZRGjphWDJcOVZ2yR
	 NQxMyKWeyJvWPldlSOpGbTsQpxZShCeKzmpqZbFQx5/WoZsGNNIMjS1RaBJ2zqTeIWjyI
	 BAmHDPWLOG0vmKJQQEGCrYa60YZqVuomKTD5Uu/IsISxTJBdGcOnztjdcoFhs0I1bXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VhufRV4BoS98pezOde2Ss8la06aT4y3vZY8jTMf1PWs=;
	b=cFlvaQXkZOZ0JfqybjLCxlmcIOs6gqvJEjxLOENhF4fUk0gxCU6so4XpGE3Agb6+UEWm
	 lEGPd6bb8fLW5XXV0LA8k9QLP5ME/BrYlLTbgxvqm1b4BJkAmt/hM1WyVxZbcE7jVDTcO
	 YXJliZvWKCy7fw/Zo7R+e+E5gTQl0tmiYMI9JLS8FeNprKdYsriO9J/dw+6sjtzYU92Ba
	 uT5254owiLagCnJXM2dJaMnabTBjoPFkZB3OsegLwGCGUMMAleT+JhvWhicfcb25sknml
	 zndrBrGUTTQvUfKm6tBwtaVH8CvaCw0cUEFmX1sumTKKJalVhrYp+ikSZ1eu4utEFtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=UBFkvSSO;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED47606B377
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED47606B377
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=UBFkvSSO
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eaeb7fdda2so2215293e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794436164; x=1795040964; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VhufRV4BoS98pezOde2Ss8la06aT4y3vZY8jTMf1PWs=;
        b=UBFkvSSO181dGTbEnl6AnPlOEkQY6F/N95xQxRJhz7c5IRO+VEbXWFIAEvayCl/kd5
         XeIOKPIflSGTa0amiUI8hlmChz01GDdMJoJXIkPvK98reSRtBR1m1PN2vN7xIi0X5cRy
         k/8OwfXIJR9a+GpkSMTKBHAXotf6lbT74Dxn4nCF39EG1vsYs+l0x4yZ05dNsK2F8Rso
         OkApORfkZWbfd437HGZ97KSbMtLEJUNCYRe/Dvf6WuJILzoV5eNpOwOWh8qaO2J+8M/9
         3/QMolihpp0Pu27cTdtC1fJ2EBc+eWuuYZvgLLSTxjca8+wEb1qO0xhKn0DL2G5WLy9E
         6aXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794436164; x=1795040964;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VhufRV4BoS98pezOde2Ss8la06aT4y3vZY8jTMf1PWs=;
        b=RZX8hnIYpETe/7MFeWpLG70X9gvvR4HY9mWokusG3COPkePaRypXyjSGStAySkr8Xg
         agVdFnRG7dtus/zV3WkLoSpFHCCzSMwocfw2EuFs11T8YSdpCokhF5FBby4QvFZyLikT
         Fb0slyrwhV5hL6FwUK90v/Ac8wfYX27SxP9GM9ozLP0i/hVysLEIXg8wKYNk2waGyvsK
         ZBawfe1TDScyAoY8aT0fZuYJAfr3uo/jKkkEfIs7MkzX8G7iWlWYgwDVY470AqKzOtGT
         Akz5wstcv1Nxp8jtZY38bY7tuGE3Zbrq2RBmt+p9TAXAydALWivNFsfWVn2RD7yWedjp
         KXhg==
X-Forwarded-Encrypted: i=1; AL+hErG4nRaMjfuDsOTLRK8LKqfbVidi12uVSHM90yaGHxj2p2gxftJMJCPV321Uwhse4bgiY6y+OMy0LfKF48g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O8QelnVtXZVUvMtIC1OUsP2HGGEBzurkI4kUPR1qM2QHUEKlZ
	cqvDQ7wlljOskklodarj0f45co026vAvgk54cRb5Ocqb45qbVKRfpkbXn7vbYg/LDfs=
X-Gm-Gg: AYBFou3dSNYIWEIuQ0AvEvmb2uixsSoHtd5t6lZSjEnV27bgD0gd1ZO+uUCueknVJ0P
	w4IbNxe3kC0a9K4KURoAjpTxsaVEHWclr1c4Yny+nQRXVyTNcod0h8SmtF6pqwWXRM1rUAX/Beo
	5uWRfjoYC+Uaxa9QUwiZEvYlA5eQhKrwtLblnErZfrn+q1eo5S63Fna87s1L1wcwH8TTEPBIbzV
	7iOOjM/r/dSe0tKrLQ0cr3624y+F8UAlM65ZjxEoLGLSXfX6BIeJtkEbKueU8BGGwxI0eOQGxh7
	vX4+6Pjc1jFf1pw26ME6/rFvIudwFre+rgZCkyAgwXV2WOhfywO/4sM2UzllTR+ZSxz3jhF+N/R
	ZTnm6YRIB3oCmlQOeB9XiVEMMd1HtG+xy6HNKXnU8NsJrQ77+w1TGAocKngHdGDcFDAeduETG6l
	SKlooqPZ7l35J1u8vCY3ncTrdsmawfA5xAhOjkp3jQ5lPzdhwUXbJqrzoQUb+Z+K1/NMBFFFN83
	pCsd4w9tHzYh6PijTn1jnFwvs+ULoiP0ddENepN0wiURpTcIJh9xsH7aR5jmoDTjgepUKfEoY7i
	uxwc+gVIVnfXAwL8oR5xOR9MbhNN9kFFSLJx7YHDUa/QLQY3Ckd2D8g4fvJxK5S0MuGUbSRKzBG
	TWYk+Qve1J5RMRWaC0Usin1UV7RCiKBgEDwsvZhjGznRt
X-Received: by 2002:a05:6122:4210:b0:5ec:d84e:3833 with SMTP id 71dfb90a1353d-5ee1c453cbdmr1849715e0c.14.1794436164290;
        Wed, 11 Nov 2026 14:29:24 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c58ee8csm4508834e0c.6.2026.11.11.14.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:29:23 -0800 (PST)
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
Subject: Re: [PATCH 1/9] kho: Reclaim the metadata page left reserved after
 kexec
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chris Down <chris@chrisdown.name>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Breno Leitao <leitao@debian.org>, Alexander Graf <graf@amazon.com>, 
 Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kernel-team@meta.com
In-Reply-To: <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
 <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
Date: Wed, 11 Nov 2026 17:29:20 -0500
Message-Id: <179443616043.2329176.17166425351392983946.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2439;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=jGQo4CvboZX/j4iYyskgIcnUkGUfctp7MromfOrLaYc=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq9OxDl5eSqxBhOZE5p1XG7yi8PQ1rOiwUmOTWN
 tSoxjgP6WuJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavTsQwAKCRC7dyhM23N6
 3uNSD/0Wo/iIWR2aXRe5YzNSrRfo/731JlX1MXOtpy+A5vTlCNvhVm398rzpLHqepWduInwcdRK
 4tex7caWuDlEdOt+RIVRYZ9mDjBo4xRQ0pvDBu9TWfu/8iU6zATD9T2YuP0IZnK23JCBq2LZdNL
 Pd1ZB7+If5y2zy1PJcSHbWDjJR9cu52ZsvA6Ni0FgTTyy3SdqMWwntgGPXP/LkzxuTKVIxTCew/
 zAi8DC6COcIzjFKPckc3lqS4x+o2s5Zwpfgfa/yAKCJIXNcdgmZhS/bqjRG1k30OiLRzjm1AUH0
 +/Wzasj+qb7r0d0gsdRO44Q3LUAgYoBNNtbFLy+xdLMwqLcDpWFCNFIsuQoxoTLzbNi/ldIvWM7
 Bhe1ME5c/vfVxRfgVtSpaG6iwt7oCEesTRczv6SaBP0L2VXQcphd+4/BXqpxAX3OQlRgygYDjh2
 1FlvPx3aw7hsvLSA1SpUCaE1/h4TboRhZXeYpX7Qjfo5WJMt9pwdUSkpQoQ/IZ0H7DlnI3dcKAJ
 LKGf5Y3yLsfxcsbOghJ6yLAHz8Qa5p2lyNP/Jke0X30ny06+HzRS9+hTk2lJkxIc+bfFW/kZkt1
 l4/OofVK10BUEKi4onJaayj27ChYPFFdnwt9J1sO+PHCisIKLgi9L8aR/AUtsyOX7ZBzKO2lVH8
 P8fa89xifqHqa4w==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> After a KHO kexec, the new kernel keeps the page holding the previous
> kernel's kexec metadata reserved for as long as it runs. It only needs
> the page once, since kho_in_kexec_metadata() copies the previous release
> and the kexec count out of it at boot, and nothing reads it again.
> 
> Free it with kho_restore_free() once copying is complete.
> 
> Fixes: 76aa46b9e404 ("kho: kexec-metadata: track previous kernel chain")

Do we really need to apply this to stable? It behaves correctly, and 
your patch performs a minor optimization by releasing a single page back 
to the system.

> Signed-off-by: Chris Down <chris@chrisdown.name>
>
> diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
> index 902d171a780a..f9d2cc5999ee 100644
> --- a/Documentation/admin-guide/mm/kho.rst
> +++ b/Documentation/admin-guide/mm/kho.rst
> @@ -120,4 +120,6 @@ stabilized.
>  
>  ``/sys/kernel/debug/kho/in/sub_fdts/``
>      Similar to ``kho/out/sub_fdts/``, but contains sub blobs
> -    of KHO producers passed from the old kernel.
> +    of KHO producers passed from the old kernel. A blob disappears
> +    once the kernel has read and freed it, as ``kexec-metadata`` does
> +    during boot.
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 6f1f55fe3181..8a07783326a4 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -1782,6 +1782,9 @@ static void __init kho_in_kexec_metadata(void)
>  
>  	pr_info("exec from: %s (count %u)\n",
>  		kho_in.previous_release, kho_in.kexec_count);
> +
> +	kho_debugfs_blob_remove(&kho_in.dbg, metadata);
> +	kho_restore_free(metadata);
>  }
>  
>  /*
> @@ -1859,14 +1862,15 @@ static __init int kho_init(void)
>  	if (err)
>  		goto err_free_fdt;
>  
> +	if (fdt)
> +		kho_in_debugfs_init(&kho_in.dbg, fdt);
> +

so add debugfs node here.

>  	err = kho_kexec_metadata_init(fdt);

Remove the kexec metadata node here. While this is somewhat unintuitive, 
I do not see a better alternative.

>  	if (err)
>  		goto err_free_fdt;
>  
> -	if (fdt) {
> -		kho_in_debugfs_init(&kho_in.dbg, fdt);
> +	if (fdt)
>  		return 0;
> -	}
>  
>  	for (int i = 0; i < kho_bootmem_cnt; i++) {
>  		unsigned long base_pfn = PHYS_PFN(kho_bootmem[i].addr);

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

