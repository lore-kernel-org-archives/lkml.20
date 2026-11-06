Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793927113;
	b=GbselEj8UdX5qx9UXj7PMBSnp4mrRru13t4tJKKsRvEpbs/TNZH3VW6XbnrC8vWLiHFL
	 jVjWLBAb982IMskcBIh+DO0u+/JOW+EU+0rTtPIbcJC5PHjLyZp7M8KwJMsm8TCHKBELw
	 t6i72oodQrJUtgkbOK7PQZec3xZFde6SQCm38MXFPsGESVX1TuAtM8i9AyzPEjSJNrWoT
	 NLyW+i+urRwa9Zcb598riyr22TAY8QAT4rDZS7CjKY+MKdvBMDoXmet8UCiP2NkbiHJJj
	 kttj2ZZ1S8i2ezy7cjfyfgXkDt92U6pbm7W0TzbIFPu43Z46dQYfKrO9LEQUF65ckmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927113;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jjwG+B3tZIjtKqU7w7KLKnwelQuKI9W7MTYdbhkPXHg=;
	b=jMtuoVWE454BTmupyoKAnzoEoACAPL0j5RZlKVx3ttMbwS+Nri3sZbls0oW79A+C3tkR
	 QToGOV404208DCihRSnCdf1SLNgr0GcFByJ89WGJEZTl+1gLdLc46G7T9Bx0ELm8OJdaC
	 mKGaPRnqfzHuKbN+yinkBi2dgRhoTWAlT9Gk/bk66mxv6NU8RU09bWDOl59UyAEDvkCpE
	 sWHzOCuC3vlwOJe23E+ky/wOlsFPSaLHBVdDMcE1JR2th4SHjY+e0tqxahFZQ/5RGOzk7
	 WZ7hrHBy7KOqbNojXbBOWzmwT3kqu4g1sWENPCAfpCwM/BfVka7YATswEqy4mNBTbgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AIv217xg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A70606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AIv217xg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4631F0089F;
	Fri,  6 Nov 2026 01:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793927112;
	bh=jjwG+B3tZIjtKqU7w7KLKnwelQuKI9W7MTYdbhkPXHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AIv217xg5z0cv/jelnhecDyVk9nXFFenoqeuyTOZORKsUu777sQTcP6QYS6pi0jTE
	 hg/+KS5FyuxFtxr32Uy0C5BtJMFStMsH1COM/Km8fqNDiSbMRX5PaMlPBaWAfW1yua
	 CWnEzjO9o2GOHZSGMvShUxQ7xJdrwoqJeUCRn73SVLEhNO3HGmK+kFl7wo/Bu+O/c4
	 jUktEcUI7lNuBozO9rC4UhVDKqqXHwiRZdTTJ590wmcnrHz65a8tocdyMLVWLXmU32
	 DyLcOEVed9oHlURqV3jg4sTSQaFnpsPdlnsuunenO877eiXVX5lfssD9tegFJOwREv
	 sai7Ebi1BNT1w==
From: Sasha Levin <sashal@kernel.org>
To: Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Chuck Wolber <chuck@wolber.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 03/20] coverage: add a common debugfs interface
Date: Thu,  5 Nov 2026 20:05:09 -0500
Message-ID: <20261106010509.3646950-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <27596ddc-6624-49b3-9ea9-891f477eee38@linux.ibm.com>
References: <20261103015238.3780910-1-sashal@kernel.org> <20261103015238.3780910-4-sashal@kernel.org> <27596ddc-6624-49b3-9ea9-891f477eee38@linux.ibm.com>
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

On Thu, Nov 05, 2026 at 06:49:27PM +0100, Peter Oberparleiter wrote:
>On 03.11.2026 02:52, Sasha Levin wrote:
>> The common reset never touches KCOV, whose coverage buffers are owned
>> by the tasks that set them up.
>
>This part is slightly inconsistent - there is a common reset attribute,
>but it doesn't apply to all coverage mechanisms. Also for gcov, there
>are two reset attributes that perform the same function.
>
>Would it make sense to only keep the attribute in the backend directory
>and possibly mandate a common name via convention?

Yes, that's cleaner. I'll drop coverage/reset in v3. Each backend keeps
a reset file in its own directory, which is named after what
coverage/backend reports, so gcov keeps gcov/reset and llvm gets
coverage/llvm/reset. I'll document that convention in coverage.rst and
in struct coverage_backend.

>> +void __init coverage_register_backend(const struct coverage_backend *backend)
>> +{
>> +	if (WARN_ON(coverage_backend))
>> +		return;
>
>Can this happen at all?

No. The backends are members of one Kconfig choice, so only one of them
is ever built in. I'll drop it.

-- 
Thanks,
Sasha
