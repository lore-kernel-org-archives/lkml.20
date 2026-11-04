Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818630;
	b=RhMJGCSo67EKC+kYbFAmeOmWSWXFoSFbZYsagCt7DL1glV0pN9j06MX7YWvQf0jSuHnx
	 fq5BuwjAMT5wrIBLUL1/Js5fEA0pfU7Ofmpy6lh2Rva8nRRRHUpQZXT7H2HjF2xxIJw4j
	 fEjwcZuKhD7wFoOVg+S0sCWNwNne1DMzG5tUR50gzeK1NXJGKMy7CpMLPJXOq7u0rNav0
	 7ytRaIqxWA9Usow2OggWm0t47u1ulIuO/Ud1xOW1slXJzGzG334KcWEuB57BKL0nC9neJ
	 ini1Bn6gxTALSDl7IFLJC/91w+tix0nZCRJjSdyYDBsg2HwjZMLpQ0EAxZmeQ5hh6NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9KIi3oyLyMDdsznEK7o9dw+bnJIKiQjdBXnibwTcAOc=;
	b=rtH10mnpvAOLTOWlHM8gc8Efh+OcpxD7t/nsT2R47WHGiUTB56XrsU+d9MV3fY8r6IvT
	 fZ7v+aRFH4V7NZ2LyYeiIQWARVmVoTWJTddiBBLDojDrHJumrUiQ9+qqqoYpxwEShSZmi
	 RJSpIK55ArLIiWHksz+Jhj0/0GjAH/r2jcZlAFScRO5P+OU7oZEUZ8KusCJFuuWQTFoBw
	 Awv81PoWsSo1Yzu2Y03WTzJkBtjkshQb5FTxXt7wqZrXVrXTJ748JLD/7earBiPWByDMZ
	 V7eZ5MG1vn37lzu8S8lmNnpT3jXjQ0C7s0rjyKrPGd5j3lgxPIcOMz/mhLbjkap3Jvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=SLnJiQju;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D645C60A2611
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D645C60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=SLnJiQju
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9906c85122cso357023241.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793818629; x=1794423429; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KIi3oyLyMDdsznEK7o9dw+bnJIKiQjdBXnibwTcAOc=;
        b=SLnJiQjunXmkDVW/PYS+03gFv0c/y/Udv8Ld4iu90iTjBuPzmUnZmx+/mozwdLaf+Y
         qe47Kw0t5f0edaUT6dHkBFOL6f3q9pbNRJKkutI5+ywmxnpjmmXL5IwKFiYeWab3jqYE
         W+QeGBpfCTP7I9ilY0r6v1/9GV62Y/ttFTmWwW8amYipNcOUsRlHU8SrAMMmYuBNjvoE
         rIDM+CTauWNtNbLzS4Uxwyocm4TkIJiAwdv2SyJU49hQNm79RehMLzT4E/MocJO6GCr3
         v9qupcA+hyaHhZ0ItAa2YGa0vRXVLi5imfDo75XXao2PP+VsjkVaMeSHxMURVygkWqnk
         3E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818629; x=1794423429;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KIi3oyLyMDdsznEK7o9dw+bnJIKiQjdBXnibwTcAOc=;
        b=puGmd9qS/ub1s3ayvpJr5MIi9xOBI0Ea8fEA5jmX0gszQCkjrGRck70pEtphZMafG1
         ShnAlgnX2s9VgmofAdjZ3QAm5SNgz1FjI4Dvo0K0rHVgN8DqDcqamkTPH9cNyS1woKJb
         deGYlzmHGmy4WzQ6UnGv/a3L85ZwMntQeaSs4XUw2IFNciyz4zWzlUCgUTHnBx+FhqFX
         /ZFkqFgW4xJtoV1hMLL7nH+bbDf3NokApeTFE4iwR0pdwXmCpJAd5ZhTC7ncS7dkyvSU
         rc/ysHcxtHARgUI4mSKkPO/SGHxYoIlRL9g3KJb2wgqnhPbfu1urPjlHJMAe7NQQqx1O
         I/TQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLOWS2Y7O6dAKsHSzJuBNSGE+LXul5ArqLuJUMD3Ndjlu+5gH43ciGSn1hvsaFl1dRuvafX92GaUEva7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mhAZCbpyZGuPOmM+IjVDxluauc+IHAkD52uRblCM85+wCySHM
	nBJ9hXolyJ/fY3FWPz0BkQWY6vPtv61ocUKyYZ0kslLNqyVOcxTVUgdOfET6eJY223w=
X-Gm-Gg: AYBFou1ClzLvP+6bmUlpSezkrSROOooNUkii0yxQtKTQgODpIrbvGQz6mQAdV7wGXhM
	4qtUoyOVHmm8JhQjXIT8Z/RzGHUuwsaUqN72Z+x6tLziVeL62Emm/X3taAayqQ0Dw36FjaaAIgo
	LytLem797VZBWBi5haM2f+iogfvZIBb8ZR7XH+LaQClUPQKGZpyrMuEw8vwVG2Bem0r22eFfUgF
	lnBC3JaPvaFwtdWFa53YDCakjgWrpf3t5WyOwMsAlb08/2vG7QtA8es6TwFa4xSNscXivqJD/dc
	+rOEygpSdD0GZ9x6osCehRK0IMUdvFKzAOS6k42uFc3IYEfGXT1BkW66ulwqj7YM8J70N0Grim6
	wTHWE6FmUP4agv39w5sG6qrSgYhqRV+AaQU5TyfWVk0BkT0dcKsP5gia4/lSOGZJ0hCg1CUnZo+
	uMWcL0neT1deiTh46MI5oScu23SbH/19V+UC/AZp2hdmcZ/rQ12CdFkgIXM93HxqHcKCTGXtvUy
	uw6G61Sef7H5GFb/g17b/obte09bg0+QFhpnB4e+gSHNGerQ1idoErmntLe7UtA1CJBxP4uuyLf
	1rPXRp1EVRzGy3Ub18HQ4vz9R3ZF3bRnzdcEuPH6I8A9Uc1+4eR+xG1fZeaziP++/ZqYu7rzh4c
	XsZA5c18dKl+RGWfK8S75KCKFIgkDe28r/9SdPm2rhP9a
X-Received: by 2002:a05:6102:50a5:b0:7c8:4efe:5243 with SMTP id ada2fe7eead31-7d072c0ccc7mr6799566137.14.1793818628571;
        Wed, 04 Nov 2026 10:57:08 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-999f3006224sm736210241.9.2026.11.04.10.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:57:08 -0800 (PST)
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
Subject: Re: [PATCH v2 2/3] kho: skip zero-sized lowmem and global bootmem
 areas
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>, 
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
In-Reply-To: <20261104-kho-bootmem-sizing-v2-2-b0d1a834780f@kernel.org>
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
 <20261104-kho-bootmem-sizing-v2-2-b0d1a834780f@kernel.org>
Date: Wed, 04 Nov 2026 13:57:03 -0500
Message-Id: <179381862329.2089669.1920221634983746197.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=659;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=tKyyhUM8sc5ijUZp4wf8V84jsKcj0GIXLoP8Jnk85qM=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq64AC4+9Eu03z8RndZYwobpMiNfkTgoWl1nhsO
 iersuVtwoCJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCauuAAgAKCRC7dyhM23N6
 3n+cD/9jpTwQSZe5gdGUGgfWk1XEfJgiRBBToUCD7hLIUPN0f/0cdUwMSaewgWjnIEdWwmUI3cX
 AQ2dyOIItN7AdmFr/dPD833nnnX/GdMvITYVd0Xp9A+ElDgvYS2cRlizoNWpRZVgIW49L/KZ22x
 Fvxr8Vctlg82aQ1rWm4Bpc14mlvduoD8+N8LVGG4wFoun/qTG4YvaV0LWvtGBLHZmFYLecwnDGJ
 IZJ/Uz5AS7D/VdLvWF4RF+7eJl4JMt6gTQEbdeVfcZWZCX+p6vOkkyX24Iy110qrrdvVFaufjpr
 XseoEn/cLnxiIg5Yzgun4qT+CpoEn/W8JjvwznOw06geQzUafuFQP8yHbMSdgWfOiB6HkfPfoCP
 QIALgM4Q8u7r3PcQpJd1VnQTXuWMPCV8vEzj9tiw1TJvhkujDlbDoe1JCPlwBAQJibSRhqvfqec
 l1dQMbzMd2oC0wRKBz0NKMkxxZdbYTt1tKClUM1hLhwEyqqi1yzARs6jOnIr1X7Ey5qOPYZ5ouj
 KFoj7dpUPeJgE6Gk7vA7t4+VOXxl0yO09J+ST0GTgEGrSmaHibGONMY4E3yWtcEgJTz7a+koxFn
 J8DSpcUQhLmuEq640zd8Nre2wC3ZFqAsZH556R6i1tFo/QoV0ka++Vany7L1zJajvRx9pUeiLPm
 cZDHnRFI9/6kMmg==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Wed, 04 Nov 2026 18:50:10 +0200, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
> The lowmem and the global bootmem areas can have zero size, for example
> when none or all of the memory is below ARCH_LOW_ADDRESS_LIMIT, or when
> either of those areas is explicitly set to zero with kho_bootmem=.
> 
> For a zero-sized allocation memblock returns an address without reserving
> anything, and that empty area is recorded in kho_bootmem. If there is no
> memory below ARCH_LOW_ADDRESS_LIMIT, allocation of the empty lowmem area
> fails and KHO gets disabled.
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

