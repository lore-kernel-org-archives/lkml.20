Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793712928;
	b=Dp742FUMOn2b9qvG9C7nsOZukmc0YiNeyuQSWPx6zsimpH9YFsDNS9yMvllANxyaj5bS
	 LqrUPrK+HCoAsJVRICmup0XOVwD3atwBO7u8Oqtll7UxTRgBVAEnMWGuo62rALjyxk1VH
	 up7SuDuFT6HUCjf9TTNFyrHzeO7l4DQ0B4WB25qz/Q7qUQ2SMBWHefqvm2nYAHwLDIEv4
	 lsx7uyF/EgvUwXmY7TAQaZnly9up4uYk3ZorGfHj7o5AQC2otDwC7+xAtCh5Npirf5PJR
	 fne7nYMQdC9VLBe4GIdRk13CZWzyyOmbyquvwXmoBfKE/1RGyB/+w1vRDi98dEPv5Vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vu0K78tWKPRRB4KpcMXUbkVZ5p3gn0R6DubwRz7qX/o=;
	b=MJXkQDFZDqOV4uCzLa2ZPgevE1kNBWis32Bf3Dh5TqPo1osWg7OB6D1Ut9aiShaauX+5
	 jn4MqQ1qeQccjG9O5Z+CGV0fCkD0fBT3uRyvjYz5YtzMdmAH9I1bM9AH5uxNJmM4LXbUW
	 xG827o68wvy/Y70KqHmhA/+UtWX31LSDezqQWtKIuAdAoXl1BV+opcakyyt1toRzNIZ2W
	 8cc2O5TXplSpOGAqbOJTKdR5UKkAoC3MlXW27OETbq8ha6HKbF48lpNDLxtXcvCixk6Pf
	 SAIwp5x8h2BcA2vrXCADmJMtc5VKoGTFF4jCT8PLq10IkG36Yb8U0khbw5j73GtbhqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KW+Ic/e/";
	arc=fail smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CF0606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7CF0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KW+Ic/e/
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91b52ba422cso55719336d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793712927; cv=none;
        d=google.com; s=arc-20260327;
        b=I8ylcq0QXD66CUd1imUZzQfkuDUfeFgcbHyzHVTefzg6uL8IRXZmNATDlMhP66NcX7
         2RB/Lu27fvvKvmI20N4V061SkzR7UqWjTDIECYsOu7dSNroec54a1HFDj5jgMrLchf2q
         n/0ooviYP6ZuRkb4JGsYI7VLRoV8F5fEG5RG6/PprXNjzprEtoML3kNoyDg5gyjmpyc6
         EmabqJMkoTsn3S+g2RjQcRy24F/BCy4oxB6Z4NAmyrZal2gLI3/Nwlewvonh2HfJabNq
         OQiINg4xWUbBhEKqVbm0WP8Mb2pwngFpmAuNNUi3rLE3nokNUhnySCM9aczAcXyRRImA
         sagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vu0K78tWKPRRB4KpcMXUbkVZ5p3gn0R6DubwRz7qX/o=;
        fh=938FuSgqWMjz0dBPHJJjU3lCPDFWE4a6Q8ZtoEVpkyQ=;
        b=Txb4r7hiuhwfpSNbufl6lZb7GDd7BUhYbxqopMdKZmjM23bQbD6oc4vBfs5SSKlR/X
         +NdxLV7UdeG9uS2N3rxqh/eravVLqvk7C083aDMKyI/piR9Zm3sbuTBS5VygKXUoA2BA
         c0q7iGNv1btwxE7G47979ReCtRXmJCzKbIOl7nquS2eZ02T6wBFunOtN42+cROqpH91+
         1Gogz4UhamGWtim0kgb1loohaiOEA9CdlCFrD2A8yMPYV1ZfdC2cFert4gqtWx/zyJHQ
         hILwtL3hbGawDjrKlt+KnB4x2gQwiahD6NYxli0JB2jYMJB6QHOZk0PMmp7O/9y4hz+C
         T7wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712927; x=1794317727; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vu0K78tWKPRRB4KpcMXUbkVZ5p3gn0R6DubwRz7qX/o=;
        b=KW+Ic/e/sanwS94J8eBr1TZtKcPHFbhLU621ClUnKbdA7PM4QVsM+UCClG5Ij7V4H3
         /xjttHW1kna8fide0hzK10prlA6hTgMCGXVN8wnPvOr3tDW9WjTEvmrzchgIWPiaaFsv
         PqNd6IYnsQllyQeS7Z8Os06TFz5INzMCj8uWq4aiRFxkfUAMA4DyLmUFBLExy1sjzftg
         avF5Rx+U9UzsJMlfgPntQpQDctWjBexz4LMI2j/IjVamSsilr0M5W3Dl713x0EODZQnE
         lZL1djAtXuThvrmRpSP0i+tXFvwqWUH5+sFbHYrCCr+2ODl2Un36w0Ud4R12RFfZKy9j
         6n2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712927; x=1794317727;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vu0K78tWKPRRB4KpcMXUbkVZ5p3gn0R6DubwRz7qX/o=;
        b=16FgMzB0M3w4c7MQABotwiVIjjSBTpQKdXnam3aif7/zAUGWpgOuc+Sj15teTrRG9a
         fnPNUnHNXOonZxviiFH7VitpVyPVKaZdU6RoMy8P7YRIEWY3sYfZZEFDAPe2uykCATGM
         Zd2tGdTVrQhR2swdtKjcUONRidMUHnPZA3eAO9DP4hAmUecVu7sY2YE72Yvl9sAq2bm/
         5gumqm44JlwEGK9pOV1Jk51e3Gr1FbOefPWJ9R5ApTqCPkytkBgle8Hi4skniuuvFBN3
         UDYUVfzcle/Bx1KKn4/ci/IOohiblCueSWXqlK4Vf8MacHNfOduio4S1IejiV9p6znnV
         Mvxg==
X-Forwarded-Encrypted: i=1; AKwUvBxAw0hVfTxnNZ7D/2GiZy9OQUU2p+Bciz1IqsPbiUKPKJIr8fXJkl8f5ud7laIop+2lfhr/OPr2jy18P00=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xQn1Oga9rL5PcTPMEg9qNtixlf6cSfJNywEwa+oRrOye9huEs
	squpf0u91KKYcc23WnhMV31QhJqrp9cg+mXnBPeImiW8DJRRE2eztKhPblxg82P5jLCYJxhUOpe
	3qRvBITPu/i095xMy6KfIL+mLtTM36YU=
X-Gm-Gg: AYBFou34BZVBQSJKxsicbAZNSUOVE9IGjtKg3J1rci2H29i9M+ERiyzGPyFPAPjjrf1
	zld7zTVnFgkVjF/ZAHcafKQ1auSKgZGPT2L7j7baILCMwI+Ry7H2rocyKB2PxxXSKe7dUeQnrDq
	iBEx1ouJM9WuHMasovO6J1n7MS/APV78mXCcwJrO5eMe0eYx0w1MEIhuAkT0gulk440b1SJ9dHj
	2+l5h67NdA0kGH60shGrttXe98Gn5IMrcqQ9FIS8SYX6ZIVrwAOHcVdjrmgYCsPBKmG2HM3GDTy
	OOVQgswSlv+fT6gbkoMOIkHqHAwS9gdrN+lGPjcIXOI9uNIOBXPj4urIxXfEXaLGzgHS2TOw7CG
	Ad+g5Ehb7mjXZBtvYmEOrKPCaKflESF677xz7wi6Lz7HyJSeWScF7fqt13LUi1anK4A9tLFPQ1h
	Kw6fDaExmoSTHvX014UT8XjsHVdOErj6Dl1eJUXdVuHFqwFhrgQhjvFJZFE/DIvscwgEt4q7s7Q
	3fOrnOnFfc5o3347043AZY=
X-Received: by 2002:ac8:5a04:0:b0:535:25db:17b1 with SMTP id
 d75a77b69052e-542b62a459emr219845171cf.17.1793712926548; Tue, 03 Nov 2026
 05:35:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793375024.git.dzm91@hust.edu.cn> <5d3ab0955918e70da23a93660152fc04dd6b6913.1793375024.git.dzm91@hust.edu.cn>
In-Reply-To: <5d3ab0955918e70da23a93660152fc04dd6b6913.1793375024.git.dzm91@hust.edu.cn>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 10:35:14 -0300
X-Gm-Features: AclHuK8S8korg0lo55k0S9wVI1USPrHDOOcCDOlEptoSQCalIEkoG6x1QaJd_rw
Message-ID: <CAMAsx6foaQng7_Awy9qBLtAx=8m2Z3NU_cU3aDNdhW-cv=x91w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs: Correct comments in Sphinx dependency checker
To: dzm91@hust.edu.cn
Cc: corbet@lwn.net, mchehab@kernel.org, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2026 12:56 PM, Dongliang Mu <dzm91@hust.edu.cn> wrote:
> Correct typos and awkward phrasing in the module, class, and method
> docstrings and in source comments. Leave runtime behavior and user-visible
> output unchanged.


Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
