Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794133380;
	b=s//JQ4S5gMc4E3klUs3Nz4MF/A/QprkufUPmwyOJ0rTM+ztWSzpFBSRojjcEJRsT/JS4
	 eYKWx9cmzkuR2DBllL8CFJn9iw/hbOJE5gKsFs9NyovCFk76xrdM9+Fb1nWhlZjuOBOZK
	 bQM4Ak3mztqR4vvta5AVFDC2oyC32t/Kf9eriFTy+zL/33NLYPgMkURtD2ygVSNn4/fby
	 HqglAQUyWt90cckOCiSDIg8nWRVN/foPcxrwb03RKrJVCsGukt79La8HmVYBLMqEkzR2A
	 Xl1cpL/YhPT1yF3PBuSVzS137PkaWOkpBi/U3VnoXnTLVThrueuaqcPxkXDjFtu01gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794133380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NTRlnQ6aw/9U35t6NClVMTXH5guuqvWv4jZ/7tnzMkY=;
	b=jP52Yg6UpZvl7adHHMz5FRlKOr+1+QvzitWoH/CpKtCXLZNrdZbgDfBlEW6v+fXm9MSp
	 HhZFasmI0LO44M7+3uZgzn6MAM8X0a9oWv9vV4dnXIUPITmTj5POeKfHzOj0cSMa/Lvix
	 dyNFpQ/L58IhW47/RWnMjsbiZyxpUR40TesEhdPHB3N3A24hMrwcj/3ZYipvsg3zfK0PR
	 JB8d4ehiDCdjIy2GXVwA1pCx3Odh06DQmcxVh5QQTFLJuNJ104EH+InnM54kGC6/9oWEJ
	 I0QHNzJyHnrQXyCxM7+1ZN1YbbfUKZ1vwzkyBeCbCf2o5RMbcPPspKy8/w+fwGOC/xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2hs+fuQ;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871E3606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 871E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2hs+fuQ
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2bf046d7fso6145137.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 02:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794133379; x=1794738179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTRlnQ6aw/9U35t6NClVMTXH5guuqvWv4jZ/7tnzMkY=;
        b=Y2hs+fuQmoGA4HTnAhRO91RDE0wv9eQPsDc6ghq0PmO8PV1/RVRHgQVHFuMG062WcA
         mfxOyrsitX8v4RtYCzrzfG6vRVaG4J6NCtTWyBdtL0M5a1ESmDS7gsh9DqnMMUbIYQgc
         Qzf45yTR498m/DnGzfqF7P9wmNhQkpw7Me8OuTkdA8CB881YLGY6JaUxrWnJ6pbG3q6w
         0JVEwQ9mBhBxzsNwlMSH/oGpjQLB8vlDR/rPAAKN+G9pBavKLo4DtjmDxf/jnE7SiQ4l
         oJPgjZ7YWCXHVeeri6mxDB2IpKt1f9GBhzbr0Mwl5s1Vbo9L5DwTqD+2cMYv2mIuwsix
         2XGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794133379; x=1794738179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NTRlnQ6aw/9U35t6NClVMTXH5guuqvWv4jZ/7tnzMkY=;
        b=q+RuvXvMJRrNl45Vkq2WEORE3HFuQleuUs+IKAwLZ+YP6pUCrccQvf5DGeKxY7I1N4
         sdIaFHChevbKyL1AjRn8Z1ohb4FhFscpl6LA366NbiHc4PWuFtoSgv/nZvYJdIYLv6Jf
         ZxUpBVClSFqXJ8Ae7BWB2Up/129xqV6Ok/vICRlnPV7ATYuKleb/tkmI3KQuy7FfnKUT
         7VOdcMb4mkF5q5qoui/M8GApiCNRoaCVUpVc29/DN9YELwRJ0TQcqEFB5PjkEzwtW7cL
         R8M8NiwPb6Xft5eQ6O+0dNGRJC54FP9m/8yiskneNp1rJEZz9gqKgeir7cp1aarRCVfb
         MjmA==
X-Forwarded-Encrypted: i=1; AL+hErHDoVGgdlxD/ziNx/05+kNQ1GhUZeIdVKXUaOo0tftb7ZqOmW+pZTYtmfIwn5NSpKcEsBDQ/QJX38S2l+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WA1oLeE7tAijxMm2zxFDmdbs4V7y1+EMpsF9x25VP2dpZ4uH6
	yIKL6uKnsRL5suJluZH0NdSLSE5MM2LEMtYM2HW7N3dv+ELETCxaHV3K
X-Gm-Gg: AYBFou0PnXyvAIEbTApFmFvTqosetQfN6NYn0vLu9VXwiJTZfLTpOzuw7lo5RkAhz1i
	sS3hKEiB24TK0CTfiF5TEa5wa3OIhEUIH5lehmnYi3xSSCi1+41kXOjw+yYiSYgcCLVfcuMm/FT
	e/L4TFvhfpNz32z8diG5+1SxvjQG3hn/0yHECXYw+21bNyu+5vQ+Li5qqikErb0B3pxQASwo7/E
	Dy60vpCoAYck83NZGgFDUlKEYkn4rrPWekJ4y3fS7Udj/08FC2C+nOs83xYRPgNVAXFYbHx4/mI
	OmbXe6UtYav0KvklzE36IDfwlr0YsV5tc+7mVJN9e5YP2qX4wWzQnD6zBd+NIJ9SrvDiBoG1xOH
	sNEExwz+50ZuZxnocZkw/WyFxXYr/gp1viENpahivaYJEiC5Wi2d5UlQf+LXmzMMDx0u/T6oUky
	+2/pdd0V4YbVFAJI8quhbXa7FdM9/Mwph69MlvTs0P7X2h0B8ZpuW+5WfhEUSbHaRAWIpPBajSs
	qMJg4w3oTAT3kXBvV8FutI9/1TknvNNRcn0cysRP3Yf4AGkhaPSLlo+7TWh6lsVav4R2wRwf/JD
	5Qx7ixTSXbDgBXaKcvf5R6wscC2QC4O6gKe5H0Ua4944fwWVYN/jZHuUfrbT1SM4CQJ3ANInnI2
	pnHCBs9yc02/xfdPGEKnnEQZ2t/DM9A==
X-Received: by 2002:a05:6102:84d2:b0:7cc:24e1:77b with SMTP id ada2fe7eead31-7d2daab7329mr227009137.4.1794133379366;
        Sun, 08 Nov 2026 02:22:59 -0800 (PST)
Received: from fedora ([187.120.157.132])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c02a4da96sm1405537241.9.2026.11.08.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 02:22:58 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	trintaeoitogc@gmail.com,
	vbabka@kernel.org
Subject: Re: [PATCH] mm: clear pmd in pmdp_invalidate()
Date: Sun,  8 Nov 2026 07:22:46 -0300
Message-ID: <20261108102246.178548-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <bf5c4e81-2c9c-4f4a-ae7c-9edf6a524d1a@kernel.org>
References: <bf5c4e81-2c9c-4f4a-ae7c-9edf6a524d1a@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"David Hildenbrand (Arm)" <david@kernel.org> wrote:
> I remember that Zi is currently also fixing some pmd_mkinvalid() implementations.
> 
> Is there anything to fix from your side, or does the above fix already resolve
> your problem?

Yes I updated my kernel repository, tested, and this work and resolve my
problem.
