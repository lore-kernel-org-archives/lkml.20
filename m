Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964AE525A87
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868092; cv=none; b=KFfyXCR0MHiDVxrvBa/0g91wqpHfOPj8BY0lG5Svs7U4QtKisMwOnMEmTQ0/itmA1r3+BiuBWiXmuiftYLeXa5i6w4hfORojDto6iXxeT1VRumGingVuEiKAiLBw42FiTnm3wmB8+dLQpdyrUvr6JZ07yBYzNpaRA6KObz3Tzzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868092; c=relaxed/simple;
	bh=CbC0+8uE1OCrfARV8oiwlbKpRtyXFAAlksVshEy5apw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eagEbbAguSR4anPJ7KxrmruP4xeNaqWwK4Xg/rtJqzUauLsMf2hKUK1dKsohxLm3SsCwg3tt+P7ZxhWwMQubv+2fQlpVrH5C0vFLMyFzR2HQJkYiNA6MXKWsRRykH9uLFYDTdCRsDohF9Rnf8auO5mutBNjMRQuqmjExlua2XiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5eGbNc8; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5eGbNc8"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482e4998d28so3620465f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788868085; x=1789472885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBTbkbKWNVRl47tMAjR1GYFqBM0RP6XFGBtroaym4bw=;
        b=j5eGbNc8SHT821Oei3cTsGx+FmvTyiIflUEX4oF/CXt+xrqkoGrABoAYiHcZY4D6j9
         EghEC/zxEORtAKxw2l1C5A35gHlGuuUKzrG+8dvwiaylxo6CBqqb6teUbMvpWQ1SXUtO
         aU6pZNxGz3RPcFc2zmuasQF3nnmmrW32wBLc3b6JN89prRUhvs75niC6/IsiiX4vWX7x
         ehq2qBysoDeA32TmyF0Swla59pWjbRM8uoTq5v+tYxYFnblnyorbzcbPZ6j8UbceQ1pr
         3NHYst0pOKVpzudxB7vdatnphP8ru5QZm+yQ8vwL5XVfYAN9QlZ2MzsRZXtODYBNW7JK
         j/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868085; x=1789472885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBTbkbKWNVRl47tMAjR1GYFqBM0RP6XFGBtroaym4bw=;
        b=WtSI0++Y13k1ZuHYiOq221W4LogkoULMSnlL3+47dJEEs0JliYEDnb+x8bT9X/SxES
         YAeVW1oGI1iCdGO1J+SLVOMWgCPGPoLnxTes9fDfK2bVaQHyqeSycpX1cZ+mtzBzLwM6
         I9CEup3s5n43i6/XvaRibz457VV53hwD0bloppZBf/juivxSP86zfSPG27+VKQlcWWpb
         TrxUV7KLLXgMH/1gAwoU6Tw/shfXGqzvttAS629PyEYiuHCCEpqaieGEiVtSOBlqDx2m
         r7UgjUHhcsPqLajtDHHWWvRO4R1HwrPjy5HSnivt5d8Nu+T4j2gPtynsB7xe8SlGTe8W
         XGvw==
X-Forwarded-Encrypted: i=1; AKwUvBw2imUB1ZBnr9Iyt6/BHEhf28brLr29Z9qXSJXAwrJoAotZZufuqbRPo9r+HxgTYn3ybwNC/FcX7ybqa0A=@vger.kernel.org
X-Gm-Message-State: AFuF++l94rJeI6RK7oKOQ++0C0kHgUnJDBgzo0ut9W2g43SSA9B50t/N
	VI+GqQeDX6zLgU2MwyyhWbaQicRlEqpml3V/Rpck8p0knw1aw/j77bwy
X-Gm-Gg: AYBFou2pDyskqwPFsbJHbgjG7LenF5dtvMdIyD987eFGemAYuAvqEDeS5h/3otMYyQb
	fLtqJoIBG03cFXwUNqnlvlbgXwGZhJO0YM7WoT3DRPXdqmAYHjeHtHa7CelCUn01RWr32vYJ9yn
	Xm9wJq62TlVAQewRB3aOuorLUd673/bR2J0mzcsd0UPL5PENcP1MBeA1jbYiOPaaQD0Dz8ijLUf
	FoHzFlf6xbZre4oBxXzcZarMRxHvEOdj+fU4f9ugMRSymAmvhSbgpqhDI8XzVw5B7li3yWJ2Vwq
	/pJj0+4jnMNl9/GAKc3j9HAIkfDUTzK1RmYHFi09S7N6JcTmVZbx9kzV+ev9Y4tcD79BYETop9z
	tInBkAdjDTBlx/5oxpKzEE2jOPRO15J7zcTyXUs/kFT6C74QGiksKFUmUmgcozCjNPSwG5j4Mld
	TqWW5QJW6jVFAd4qIEbcORv5q556TfYxTBbT4zmuiZS6+g8aiH465WO66sXWi9ZhO9IILOT2Jnb
	A==
X-Received: by 2002:a05:600c:b95:b0:49d:174e:2a1e with SMTP id 5b1f17b1804b1-49d174e2a5fmr67747665e9.19.1788868084791;
        Tue, 08 Sep 2026 04:48:04 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm288511555e9.0.2026.09.08.04.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:48:04 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: memxor@gmail.com
Cc: akpm@linux-foundation.org,
	andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	brauner@kernel.org,
	daniel@iogearbox.net,
	david@kernel.org,
	eddyz87@gmail.com,
	kpsingh@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	matt@bobrowski.net,
	song@kernel.org,
	sun.jian.kdev@gmail.com,
	tasos.papagiannnis@gmail.com,
	utilityemal77@gmail.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH bpf-next v5 4/7] bpf: Allow reads through trusted-or-null BTF pointers
Date: Tue,  8 Sep 2026 14:47:36 +0300
Message-ID: <20260908114736.5342-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <DL9V0Y6BPZSY.3J1EXVDXSHRFO@gmail.com>
References: <DL9V0Y6BPZSY.3J1EXVDXSHRFO@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review!

> We tried doing this before in
> https://lore.kernel.org/bpf/20241104171959.2938862-2-memxor@gmail.com and it
> got reverted, it broke all sorts of things and made everything more complex.

Out of curiosity, what were the main issues caused by that change?

> I would drop this hack and just fix the program. Given your earlier change to
> annotate the field correctly, I am puzzled why you added this, and there isn't
> any description anywhere explaining why.

Initially, in v1, I only marked linux_binprm->mm as trusted-or-null in [1] where 
I also needed to update a test. But I got an AI review comment in [2] that this
change breaks the BPF load-compatibility guarantee documented in 
Documentation/bpf/bpf_design_QA.rst.

For this reason, I took a simpler approach in [3] where Andrii commented in [4]
that we might want to look into having verifier still allow to dereference
trusted ptr-or-null into untrusted ptr_to_btf_id to help with smooth transitions
like this or just marked linux_binprm->mm as trusted-or-null (ignoring the issue
about breaking the BPF load-compatibility guarantee).

So I tried the more "risky" approach first. This was the full story behind this 
change.

To summarise: are you ok with removing this patch (and the next one with the tests)
and fall back to something like [1]?

[1] https://lore.kernel.org/bpf/20260811112154.94053-1-tasos.papagiannnis@gmail.com/T/#m295ed4ae8a717ac4cdf536585f150590faa2c40c
[2] https://lore.kernel.org/bpf/20260811112154.94053-1-tasos.papagiannnis@gmail.com/T/#mc0865ac61ab3ffb1acb720e42b35ea65469442b5
[3] https://lore.kernel.org/bpf/20260820131801.68759-1-tasos.papagiannnis@gmail.com/
[4] https://lore.kernel.org/bpf/20260820131801.68759-1-tasos.papagiannnis@gmail.com/T/#mf5cd6a81c2e8231999ed2e4b991e060cfc4ca7d9

Thanks,
Anastasios
