Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794722734;
	b=xk3Aahd2DXwqsBdlXUsb4DfQ7p+kUpXslc3jBKaZZIn4SC1i1KpRKTlCLVtbN35KyuhT
	 XSidZdjm9DXhniy/yGMmZ5h4v489XQDZdG7C+YyJCg+p352uAglqeTz7DUmv6gCpuvtWx
	 IsTNaHu1sMFti5JggrbIK0bRpb7EyflnDvi9bwWo92QoHiZGXC+NMr/5Jb+3PxNNOfEGK
	 lHEQqYUKFIzC7MkRJPQzOdU00TamiZEpnZUSzBNtS1jerkaKIA47VSXxP6Ov33AqFtw+t
	 E/TCXR7jKdwW6v/6zRNcAA+WFnPN3r0ZENEzKhTS8C6q0Nrn4i/3NGJVLkyQcKV7M4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794722734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=oMjYG3/Fyza/CbXoIQUPnk8H85cPMajtM8cpJ9BN7sY=;
	b=l0yATe3NfvTuR1R2eW1DkqFKXIop3drVI+GP5XAhLvhSQJhlWNQXFO3nIWh7G7lPT32t
	 RHCRP1sQg5Qgrla3RuYc4qNMi6fQOQfww4mlMZSk1z57iwIET73Yo3lxneyKA02aZVdJQ
	 P0S8awYMbhHsv0DyR7ZBYmS+yglU/EF9ctFKBNDjMaAQW1xmaoUuMDXF8yvgr3k3+T4X9
	 hwsuYOhiVEk1jCTBqaWWsFZwyzwULnAPu23gLTBYWfzkbzQiguypdjSpiUDAu4kDudQXA
	 OvMVDU77e8JP5m296+NxR0q9OIYA59kXvsozR+mHNJLaThdknXbOlFWcK5KttFdLePA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Ex0dpTqy;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73012606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73012606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Ex0dpTqy
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37d424f1ae8so783774eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794722733; x=1795327533; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oMjYG3/Fyza/CbXoIQUPnk8H85cPMajtM8cpJ9BN7sY=;
        b=Ex0dpTqykoPa4BfHdTk0OqwomvM/HocAwdQvSkgohqwpHIOc72uEaUq2drwtGZ9c7A
         DaYdfvcVuY9TlYwMewWZEl5aojzjnEM1DTjMIoFdxUak9OZWGsJKUl4Fo4m/quiCNp6U
         A9icyPKPMIzlxGLwlX1ZULqBTf4mbWPDI4jgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794722733; x=1795327533;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMjYG3/Fyza/CbXoIQUPnk8H85cPMajtM8cpJ9BN7sY=;
        b=MkIHvgicMC0XTz6CWzUgthfC+UgAA+4CnhoCXmJ3lR86MBqb7URvKkjzpkw4UJZfz8
         zmrtBibynVVbsPw09y9mxlSML1v+OHC81pqRGT3EcthOkuXjbXduOxrRfC69gjU3BG7V
         ftA3kN3+4x/qVY2JADhISoFMJ8a2HD6ZaSxWq1DUrydr3vB/Ku5ad9twUsdIcdhyv3wK
         9b3JlALoI5TxjMCcLqf90dCCRiwADtaNK0H564VaC4za98R7y7jutb4DiVopTRI/ydSJ
         48wUrI0mezNJjxborYIpXWvlTEstTa4PKxqr2cih8If/SB0brSKDTEnJQzuxgCftZu3c
         cNag==
X-Forwarded-Encrypted: i=1; AL+hErFaiNSbpKNx6M8vi9NYmWrmxWMvRLQgh9K9gwhF03Kca5lPOdtejSUFUwoDkCgLqevbZQEJ0EZ9A5/6OX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7rY3qrEuQHVQY5alrkzRO1c6QL8KRtDrvF0PrZkCMjkBY4MmP
	OCKp3OAxF3E21VKmUu+16Ko0aJDItgex9oubyJzYXvkCGhR7SIrek1TrrdxDBAZzx1wf6ng7d1d
	jyW0uM4FNdewW
X-Gm-Gg: AYBFou3bA7X/+1nZCVgRgrX0r6Vvg9pAzSX2nHP9O/aCE8naEBxptsmWSxplCSD1SyZ
	A879lYpdy0ApnC4KyBtYy4mx12hqq5xzWdyldPWOdZbmvaI6mzy0RVbwhFCWOs8FigzKtZr7Fx8
	rGZN6BeOSHxPazUGNQotyi8676MSuR3+ZQSxtvdFbwsPR8O2yr2lZqSOjKq5wPdtGM28w7kcd7q
	OuKRU69VaM+dVIdnhziqcjJQuNKbY2xq8Oc7IfJ8hq14XqUbrFYlFLlPvC+BjjsmkUhU6U4FET2
	Sm+po986BLdDUHCzx5u9135KhDLN2tXOt/0IOLEZBaBk9yEuD20FGeaJ+F5VxUc3vbT4z6U3smN
	esHF6qDwA+5MsIDGX+NLGFQXTFJBZwj1VeS1UeQKtyn14o57EZSuSLW2+vRvplR3KAcKoKR4Vls
	lcP2DNzMowJFd2BzX2VsQ4uvUbgYubMPOJCSG7Ht/k8db2RCSk6WVMQlmywc9y+b+SbVkuNBy/v
	9UNT6jAEuFlqAWxYr/mx4xiL6cyYO6RVHMPK/sacajfN21/OSTB1tIMkSqcdCUOV78qEQr/Td3F
	imCsvGkXuwzA8BFFomCVDwvuA0ood0I5cDV56Rd14+ruuOfnZQBBt6SyxvcC6VPIWl3HLHvo+ne
	XvjaZ8keUuSYqXSQ6wiHOEGF/i92weL/ypv2n5Hnf89GncjifOZaIJXzTWQmbwGizJbvk1vLYQq
	EM6NehdcrU+QJsxSG/qg5bIeyBSTo/Z/1qPPMQmTOSN4R4BBweTJSuhX+kza9zvPK2
X-Received: by 2002:a05:7300:7481:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37966e3aff8mr9995533eec.25.1794722733483;
        Sat, 14 Nov 2026 22:05:33 -0800 (PST)
Received: from [172.18.0.2] ([172.56.232.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm39445329eec.21.2026.11.14.22.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:05:32 -0800 (PST)
Date: Sat, 14 Nov 2026 22:05:28 -0800
From: Chris Down <chris@chrisdown.name>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Samiullah Khawaja <skhawaja@google.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 2/2] mm/memfd_luo: keep memfd frozen until finish
In-Reply-To: <20261110175855.2437084-3-pratyush@kernel.org>
References: <20261110175855.2437084-1-pratyush@kernel.org>
	<20261110175855.2437084-3-pratyush@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114220528.f7d9874a014dbb5d@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pratyush,

Pratyush Yadav writes:
>+ * Restrictions
>+ * ============
>+ *
>+ * While a memfd is preserved, and after it is retrieved until the session is
>+ * finished, its size can't be changed and holes can't be punched in it.
>+ * Operations that would do so (``ftruncate()``, ``fallocate()``, writes past
>+ * the end of the file) fail.

Not a big deal, but there's one more thing that fails in this window and
isn't listed here. Adding F_SEAL_WRITE to a retrieved memfd before finish
now waits about 150ms and then fails with EBUSY. That's because
memfd_wait_for_pins() sees the reference kept from kho_restore_folio() as
an extra reference on every folio. Once the session is finished it
succeeds straight away. The same already happens while the memfd is
preserved in the old kernel, so maybe it's worth mentioning here for both?

Also, fallocate() fails with EPERM in every mode while the file is frozen.
That includes FALLOC_FL_KEEP_SIZE inside i_size, which neither changes the
size nor punches a hole. "Operations that would do so" makes it sound like
only some fallocate() calls fail.

Otherwise I've tested this across a kexec and it works well.

Once those are fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
