Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512856;
	b=OTx//wAG8VnZmJUC4GB1WfdNayuVLbHHwZOpxzM3TqhEWCgZg7jCBZgDnlLeYqCWuI66
	 7g0RVAIaWQTU3iTgcb2cHoFTmXto7tErcUVbtQ67ij6+0efUVnnPkCfHXn/unbDT3o8K0
	 iWDZbkSEb71DJIiP8lxNYXDyiH8TGCVpEDrdbcOGSN5sYhC7FulGW597N0VwqO9pWq1rN
	 50RO4e3Ryf4mznrQcgCcb0x4G3P+kClwgr3fWrO72HawP7GPRFjynLQ3FymsEkvy3tUfa
	 JiOd+1XYwucC5bU/4wKgXHFBg3ne9AZtkZ4axIeSNw5S1aAYtJsGsOdN6gSLqhQDF6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Xt96S1I6XPaPhNALy29UZt5PAba3qn+cljeyrpTAfAE=;
	b=tg/ZLp8Wm91GdoA8Upk/dOh74P3wzAakjKi4Y28hDl2QEgkizYuNFVjduqzSw5JAZ8xD
	 2f5j0BzM3ubIAw7cQu4T4VL5Cos43ULHzw54awcGEIzspW1JukK3Z9c0iCVDvtgAEf8sm
	 ii9k0Ymph6qqneHNxMY3kq7MCPZtcv9VLdUoye0EwtWniiTARqu1fo0l+93aISx+S72yE
	 HetsX096ryuqLjTqdL2GbOzKtaOHAfxLnrgxrCgM/NIKuL6LoHtJh6zZSQLoil+INpdZW
	 QRM/ICiMDQo2rTHgKFsjEr0/lRRSWVVOruVBR/7S3DFhciCHY7C5ZfrqqvzaRrnmxeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nZpRGDLu;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1C1606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1C1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nZpRGDLu
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1494700eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512855; x=1793117655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xt96S1I6XPaPhNALy29UZt5PAba3qn+cljeyrpTAfAE=;
        b=nZpRGDLuYrx6n2LxYzusW6X+h3lJ+Z2IfIjRyA4hEfFto+z9G3XPJdS7ccx0epdGy7
         s2pPIDK4tCsCvoVfvzt7C1i80OSOP8TuMMwEmDvieeurPAU+Mm5nbGo32cUO0GbObNB6
         W7oMvPoFDmN1sl9K7xA56LqDh5rycotP39IzGxrC+DTCCnFgPI0zw+UVKDTUNLGXZDS0
         NLbr/G7hm6Uu0DTVqrbCuL/zHmlMQzL0m0bqlKqaXN2sIiX2tsah3bobca8Pc2KzUKhU
         D1LmHzmAmFcZxtYoC3tTS3m11t2wnwjdWmP9IYSi2dm0oyxz1goInrGlxQj4qgxfwSzu
         8PTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512855; x=1793117655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xt96S1I6XPaPhNALy29UZt5PAba3qn+cljeyrpTAfAE=;
        b=QQ6kdiEKRu2XH6digIZdntJ5cStQ6yxLfH1kJtQVneLmLiJ/v8bH6lkhmQxUbKoUQ0
         Z9zFNj1X7Fsvc/R93n+uuOzTRBWQty+nw942ezDCof2R5v3jJ29uQSVs2swDkWwESwzN
         lxPOvQ6fkvY+wwkEJ/mkuydSXzCUvmnxs+pmlwwnjC0MDp107simC8uMtXjsYF4MTJOj
         5MaGtvKaANuDMLlGTWMVngJtvKbGjjpDFxlu7FwdQbe7LX1u7jmc9R6eZC2kF0mUUQIH
         cRI9mLV/a4C8//1KAaBiPg/kF/h6BipmWYFfflcMI0JAAnQILU5AIlhO/PaBogQ+nF1i
         ZFEw==
X-Forwarded-Encrypted: i=1; AKwUvBzbrEoNpRgmkusWkwqyzZp0ees8IXjOGDdGX78Ozu6dyhsCk6l3Fws2PNRWalGV0FIShwv0qG9/FK3ChtM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYEM5yfuSVcN+qDdPWSVBeAQ5CpxNjdvp7O9Q6WfjTM+p5gXjE
	3viPQM7mZL7QmmD8BAi8Th/Y0SEa/fzxdxr77JyCfsOOTUZRWHhcOQYy
X-Gm-Gg: AYBFou1gaXqqkOQ1jT/47/gY13wXxU0V+/vGBKO3oRgcRWgqGO6xgGF+aISjPR/ir9v
	VNamF4OZWeLYvxP3iVeTevoUardf6seWesXzm+QbXnG1nJlgfWiwvTfICjv+G+je1m+bqvb0MrG
	0wIiF4HbqaDW9DgZRAxq37FH0ovqykq88irL6KW+24EkHzVXoW079hQdeA3NHHhkin86XhyKLQ0
	y0g2LvTPEtbEVg2uOpCRTr13VvU99RG9jzlkdTqoeZFjR1Bv2tS4ZSl716glFrxqoi1+LTKyKjz
	y0yXUjcPCNwb7oQeKi8wNUcQ9t23y9O3XskQhGL1rf08jQ29utIzyTaQ1ehStnZd6QcjPaRLscc
	WEFbk4gid1HCR9vEBwMOaVWbSy87UEod/c98feEQj5/G/DpayI0pU4mRpyrjdKrirfg2NAYJSAF
	6MRmPTqOCSG4LlT6PpBBQ4g/zz0KcCpSpSgm1nUC7P7QPjvahjn7MRnmSBrd4XE7k+dA/qxAWM1
	/XoDipV9h2QGcPJFd2FIrlVBsYLy5DLMEw=
X-Received: by 2002:a05:7022:eb57:10b0:185:5a96:ef59 with SMTP id a92af1059eb24-1855a96efc0mr16486562c88.34.1792512855102;
        Tue, 20 Oct 2026 09:14:15 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm51060355c88.16.2026.10.20.09.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 09:14:10 -0700 (PDT)
Message-ID: <beac545f-9a17-4a47-a4cd-7a705302a35c@gmail.com>
Date: Tue, 20 Oct 2026 09:14:08 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 0000/1651] 6.6.160-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261020075535.084584701@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261020075535.084584701@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 00:57, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.160 release.
> There are 1651 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 22 Oct 2026 07:53:04 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.160-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

perf build issues are fixed, however we now we get the MIPS kernel to 
fail building with:

arch/mips/kernel/ftrace.c: In function 'ftrace_dyn_arch_init_insns':
arch/mips/kernel/ftrace.c:62:6: error: implicit declaration of function 
'uasm_in_compat_space_p'; did you mean 'uasm_i_dsra_safe'? 
[-Werror=implicit-function-declaration]
   if (uasm_in_compat_space_p(MCOUNT_ADDR)) {
       ^~~~~~~~~~~~~~~~~~~~~~
       uasm_i_dsra_safe
cc1: some warnings being treated as errors

-- 
Florian
