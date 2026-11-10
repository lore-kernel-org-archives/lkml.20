Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313144;
	b=qaM1wpPKrPUG8F9kNN8UvZ62B1S2/sM8hP7sgMS/jAU7Om66xIsx9kg8RTq3BwiCwaro
	 yihTlMshfP9ten6QYb66pDIBAonAxtdMIDV5UNy6LAla1jtNClwX/JbWMCHoDONN5OXrL
	 9hGVwfwUTTzdIPq6dh2m++PY0K15qnZOQYvAtf1CLXbWksatcVay7pwRyYzVBKFj9uOpb
	 rpDX8u7E/7iitSsL1/JvLwF4duBFOY0jDGMtUEPiaGYK7+rfqrjKhRr3JzQlx0iTmeaYI
	 2P16C/UIvrUiK9uXL42d2BplrrPlfDigwKMaRz+FrfTlMgHno1EVCYPRiEOEV6BQglg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313144;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=DJoXiCBdlUX6P7F/sHPq9wTeXk/IjATyg4uv4A6oh/s=;
	b=fzu6ELpkJQxGQsJ00jH18k0aDEK9hXyThNjNAGQ20ddiUgMmrojvrml2+hEJ1R626raa
	 GDdZQd2Li81sbm2aij2LcnJ6IezDYqsaAn2JDVt4pp88J6SJE+5z3um+LJM0vHCrpLtPn
	 3EkkYILPF7SnntOmQxeAVtqjhJiEeMK12Y35CyxPg3TRsV4fWRbG17KumjXb81hFAiE7D
	 K/DqBRL6FlQvDIGoJQzIzyqPa/G9gFks8r4nx6xBpy5vjkzNmICQGrWzBG64dZCwCGMWM
	 2Z1HothuctqDNKeiVKjkOUH3CcKmxCJYO64K7LaD0/vOn/p28SjJQ2amrIMsz6VU6GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D900F606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D900F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1044167f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313142; x=1794917942;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DJoXiCBdlUX6P7F/sHPq9wTeXk/IjATyg4uv4A6oh/s=;
        b=ZrVNyRNr0zBsYTsevZhj+6j5F+tOhZrjTTFmBXdpG+IbX8gLnCLBDHcg9GKqwrWYDw
         bPA7NBhSYsfD3ka86IBriuz3orQlmII+VbdVdOTIX6GOe7yJNThlQTywQfwkXcvoWogG
         SGHgtuYSw1MgW0M5Nv78cLdmp/OQV7Pxq+0DILa32m/YW9WQdynTkHXZEjHfWOqqrsbj
         raq5JzYXoVjQ289oP2XVhpx74ftnlv4jmpnF3FK3v5AdMDGy4r4P0XRErHB8E7LlOjA+
         jmq8DlsmVtFHhYbe1Gt15AKuWoREqvLJNaulaujJ9mDpTZ0cLKkGO1DD25bm5t8XPxsj
         keEw==
X-Forwarded-Encrypted: i=1; AL+hErG8Is9N4F8TlHmHa5MPiuPWKBLRhhOBSWk2M/iGRgIAzILmA7Sulg1XUxcCcnP0WyLjOX6mBLF4zTWj/To=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J3TmQYJfNPKOuiuKuKwSKmvHceK5R0/pU7DGHQbATpyuk0l/t
	/KSWLiyaoPkLIJtjY66GvaVsPViHttZuKRdG5AvMlSv2TJNNUJKpMoBa
X-Gm-Gg: AYBFou0ZKm/WLb0NFNLsqy6HFCryOslpdJwwFXor2Lf+TGIK12AHf7EPfHEXTgSCoJ4
	OOobnq7Er4DabO1KqdMGjG5sUEwWxXJqPzhFm3nQ2xsDom+ezI1TjHi4/Tpg5bgw8d2aFHCAQcz
	W8BsqqD81SJZBHeYFh0FQC7ZdG87LnmLGfjVnUAqIPVM/mW799Yx4OJ/yhpWXdmOHPoy+QcnkW1
	7Gb4nEXvVVjdDOyipA/9P4vFgGD0/MCbjHNdQno+JyrFpNgtSIC4tNVwutY2nf0tkTLAhtru8Qb
	vSsEG4ZLvl+SQAq5bse8iX0XA985cQKFhnWNj823Ld34PmLy1XTdOvehuFXMcSk/VAEhOmmshlu
	L00lgUS+2ky3x3MY1mPkCnsiznQFsdlPvh6XrwSf7Ab5N5C5YDu/agLjXUNF0QxHY0PKE9raRai
	WEk0N0PE6vd3XT+T5I2IMksWEWSoVS8vsTPIhiliNEwoSj7YgnpbPD+GDbQDtPCwlFSXtlY9GHG
	rQ/HjhVU9jDdsPAHiI9MZcSFSzSMsdn0M2hxBxg/YxwFsTYmc2Kw4oyJ37zKFI/I55CCmqjC2cE
	H/KKPqxD02FJfSan2Yr+fofZHEw55nrl1IZSu681nQ81Obtcvi3lmLm9CZ08yOH4fSsmOAFbibB
	NBs7nDW8ey3DPCX148K+scT50ScAHwPv/RS4XjG5IfBJMSUaQuUkoyaWHeXpctacL4fcRejpTO3
	Nl3lvNCFQPrcU=
X-Received: by 2002:a05:6000:2511:b0:492:20e0:f200 with SMTP id ffacd0b85a97d-49842870943mr4544422f8f.14.1794313141971;
        Tue, 10 Nov 2026 04:19:01 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c2793sm4715458f8f.45.2026.11.10.04.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:19:01 -0800 (PST)
Date: Tue, 10 Nov 2026 15:18:57 +0300
From: Dan Carpenter <dan@cryspen.com>
To: aleszlucero@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: octeon: remove unnecessary parentheses
Message-ID: <avMLsZaC_AywFjUs@stanley.mountain>
References: <20261110-octeon-parentheses-cleanup-v1-v3-1-ea6d4ecf2ec5@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261110-octeon-parentheses-cleanup-v1-v3-1-ea6d4ecf2ec5@gmail.com>

On Tue, Nov 10, 2026 at 03:37:24AM -0600, Oscar Alejandro Sánchez Lucero via B4 Relay wrote:
> From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> 
> Fix checkpatch.pl warnings by removing redundant parentheses around
> conditional checks.
> 
> Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> ---

Search for this on lore.

https://lore.kernel.org/all/?q=cvm_oct_common_change_mtu

I don't even know how you are seeing these warnings because I
changed checkpatch to not warn about it.

dcarpenter@stanley:~/progs/kernel/devel$ ./scripts/checkpatch.pl -f --strict drivers/staging/octeon/ethernet.c
total: 0 errors, 0 warnings, 0 checks, 1037 lines checked

drivers/staging/octeon/ethernet.c has no obvious style problems and is ready for submission.

regards,
dan carpenter



