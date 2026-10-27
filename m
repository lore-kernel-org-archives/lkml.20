Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793063864;
	b=KAcxUp6nURYC3E7e43OPbD8+rYZj3QHC00SrxW0zSp+JnPPLiaGd6RbjN3YbkMHLwkyJ
	 uaDkUKyH8KkBJDdZCB8ryFGfz/xJB810mbeul9pZznWWbvngw2E8TIg7/6q6rhVtGuqJ0
	 WjfjOUMoZl3/PQ11JeEQY3vFJ1QHLOrSvl0xgTCa+to2vggZpjJ65B6ksm1ae1bjW0301
	 jipGfHrovUos2oggHME3XgjmI/xVEDlMWXN89C44jCVXM9xwzDuabsUDuxdEpcLeDLBYn
	 98+HErun12dyYBCn1i/cn72+mZAw0W1mrdLghXxA5xBNiCBtkgkMCk2yxdWByeSaOsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793063864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=iiPmRn6CvRr3XqyVwuF1K5kxi2SD9m8ff5KTZX9HpcE=;
	b=xKF79LShp1uq72rAt3LlWw9tafGk0J0swid6ULxAPqHazbyIAsmqPQW/dv0u5MEMz1ef
	 BfHiQXeDsErPgGySCYoQ81b2fmOr8c0cthNzcDDvURzEj0a3WmcZtJrtVUHyrnc1RG18G
	 /3lv+Ukflj4NW8IlquveVEqCGvQ8XD1xvN84jhgbai5oIjj6MpT8P3OKKBm7BRivL/Rls
	 Eef92ofI/yIyt4LIjIdB6bobY/9e0KpIbV6XC/e1ban8Y+7VKHcXR1ftXG0pyIgHK8WwY
	 8laQXwk0A2GamXxD1OPhMTWgqR06hQLuMAm3GEvGi6TnCP6CJ/lDjNUyUXJjsCyXlIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NOEhDBP5;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF045606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF045606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NOEhDBP5
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1931ff67a29so2285932c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793063863; x=1793668663; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iiPmRn6CvRr3XqyVwuF1K5kxi2SD9m8ff5KTZX9HpcE=;
        b=NOEhDBP5ZvUKspYg/vcJD7F8ug7A6lUdaJDSc+OPeALtc5ekO/0eQgDCdNERInENa7
         51fcRIhPBmcK4ShVIah4M2FhEQBp9FXw3mxs3JZ92yycIc7s2MKuTQk5EyG2zmaEnCWw
         PSTYO4qyBmNwzOskn3c33FqCPUJE4OxnSXIa8gJUDYsZqrpV+mfdqqR1XvMSHlEr2eYQ
         /99FL1xgtknPv6WoK69rDuoM0YlgaeBON2+QCtk837QerBHj8jkN3vyONEvK3jS1eThe
         ziQbQcex8H1X1LCaqhQrW+uyc8/uHCw+DZDba6wwgrRAXCH8byBRGfXT/ZB8/jzDrQaV
         J6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793063863; x=1793668663;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iiPmRn6CvRr3XqyVwuF1K5kxi2SD9m8ff5KTZX9HpcE=;
        b=gUbzx0K1CqTKXRN8kASi7JRaeY6pfpPeBxYOL5xz6ajCcmY74+pp8GgQ/MHMiAZ+Nq
         FLrcDHTs7P2+eB+ga2mgn2nOL1lpeEHK10ONJ14wqOt10dfsUy6xL1gKLso2Q4BZMBSB
         4fIxrztpbyZDbB/arZPOvYFnP0mPgTsQsfVKawfXTGjGetWqJcg8HAGkJSTNvLaR9PRq
         tYCquK2QTbOBCi/+zpciOPNih9CbjOEkHr7VuPNglm15DkHUb6dM4K/7u+BJk45prgue
         zpCYURGax1D2orO/MK9/2wv12piT+6XMLjSu4RMMGvfbDu4uBgfDrTsGhxfRQ3F0BHB1
         xz0A==
X-Forwarded-Encrypted: i=1; AKwUvByiH8ETeayK+A8VcfeU0FU5xdalyTa0ZvGIC7PkYYFqpYciosaGd74Zo+wW/WOtH1p0gKmPvUdDDe88XIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ64/uPJUwSW00nXNgO36ROBSAcbXenDuoEETvCd5wqCFTkbuPK
	pvqqjJUzAxl941ABTGwZOieHg6aaKMvDSJlp7Bc16T1KkMyRCqXIOD/W
X-Gm-Gg: AYBFou3axBHhzZn/6Ncjp4B2lTkrGEgZHkT+loGjZmXLC+s90CmjKc7EOjBmUdR9DKK
	DhG/dFOPRRWFCfBVQVImOtMUdxjY+ejbX1zwu/G4PCsZPJHK6ESTd/xIU/l5ScSL8CySmbPH6Au
	sXHMEuvNh0KyuWLK5kCVlHfYuBaaId4UyXqOEovv5fxma/19Z2wC0WlyeBOQvi1ba8C6cCJk8ux
	jPGfvIss+V7VvTi/8vrKQbwthJO7uJZRSUKbcJjygavvuAhPLHnOm4WbrNsS8P3YPSZU3uGqShr
	DR70CkRlGRXBgv5T1b4SoTj8lLGnA827HbI2mrFQNu14zhtzCF4gv7FaStmzcVXWWGSCvApdhqY
	+VAEWEdQc3hV7UFROyz5ZrWrhYYXK4riQJSOZj2tMEWgCoCjxsCjQfhCdL6aATmrJrQE3koCdxL
	RSKAqNz9B5amXgbgHFUdX8ga7pQdRjpoXYFKKNgXnMRXkcPDZhv5eksgipLvJV8lnt21tXdwQAz
	QI6xUt8Q6UecDKtXOUARTdVdu4oQkuqDASqpqZzINAZt6aLVmJGNw==
X-Received: by 2002:a05:7022:297:20b0:196:82a:b80f with SMTP id a92af1059eb24-199374f3409mr10733011c88.45.1793063862576;
        Mon, 26 Oct 2026 18:17:42 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7e73sm29204728eec.20.2026.10.26.18.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:17:41 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH] powerpc/iommu: Fix an RCU read lock leak in mm_iommu_is_devmem()
In-Reply-To: <56f0c45723ee53149a21ceb599010e957457afd8.1793044370.git.bvanassche@acm.org>
Date: Tue, 27 Oct 2026 06:43:59 +0530
Message-ID: <bj8g54iw.ritesh.list@gmail.com>
References: <56f0c45723ee53149a21ceb599010e957457afd8.1793044370.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Bart Van Assche <bvanassche@acm.org> writes:

> mm_iommu_is_devmem() returns true from inside its RCU read-side
> critical section without calling rcu_read_unlock(). Neither caller,
> iommu_tce_xchg_no_kill() nor tce_page_is_contained(), drops the RCU
> read lock, so every successful lookup leaks one RCU read lock. Fix this
> by calling rcu_read_unlock() before returning true. The pointer to the
> list element is not used after the RCU read lock is dropped.
>
> Fixes: b5952f8125ae ("powerpc/mm/book3s64/iommu: fix some RCU-list locks")

Thanks Bart, but this was caught as part of Clang's context analysis
work on powerpc.  It is already posted here [1]. Could you review that
instead?

[1]: https://lore.kernel.org/linuxppc-dev/04e4dafde56fe4b055fbd763dc0e119862073c6d.1790590014.git.ritesh.list@gmail.com/

-ritesh
