Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585688;
	b=uazpm0vb0AvZPF9tLHZy1qigXNbbP0IQgGaxtm7dGHaG28a726AXiW6HTcrosVunxYQb
	 zW2/B2HfWtPa5LB9b2kOgVKR+p4LxTxaYcTD4bU5izRVeaZ2+5DQz7Qc749JmHM6/9lgc
	 jvLX4cSff9NPho2ianeRcg0KdVPQFwwyixK5VK5DdT5DUHkqPJQ0ipoVIDNFn+r7xmcpc
	 ZLvAz90TJ8KR4V7UOr+62tywUGEFI84fVtbuE+JYm8kJjuGwXM7n4k9IkpAgP+wSnFomX
	 oTkMxdI0QvDuVvjfskc59n642sWfFG9ZcibBInjctmuIIGxR4GeoDiTbejxHdPCkAuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0eU6RtwaBGBVUdLrxzNH+pMOcJGbeX6TyDSST0DZFlQ=;
	b=jfR4j+wDBe1AM7iYkxiUbYVLegTXvI2DKYR32/Pr/JRtRMllGbXwHJyZshGFydhyRMkO
	 e5BPncYC6p0u7KIAb4eRFG4zXMEfckpW5mzNNiIGaBU+VAIOdTvIak1d/N6nUo/d8ab6V
	 HYu6KfnU5RtmN5PmeFHoKuZM9hFrLHYf3FWVyJ7GymlWnzPQDvqtGJRjmKyeUd8LJpljC
	 KbCi8Lg+3UTPON6fihpjJDhV3GJlSUN9oc9dXlblKZeQ4zvErwnfpGooYjZzv7Wkzo1XJ
	 NJooKccrpM3V3WxwtwhseVijpmmDPthsobsWSnBkOgVjoNl8hJoh5T7AIfZa/wEHoDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CsmirpcJ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3948606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3948606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CsmirpcJ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33e623bd651so67156eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585687; x=1793190487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0eU6RtwaBGBVUdLrxzNH+pMOcJGbeX6TyDSST0DZFlQ=;
        b=CsmirpcJlZUVZQAFipxefTs8JnRPOik/dZDs6oytiYK65ls7Ll4DnzOSuuYS4VeYAc
         xkktwKXQ8tQb79+dhpsdrYS9En+YayXrb1ppjHC8YCuZA8s0F5M8a9SRVkrrwAMJgYsj
         ARTwt21HZ3Ro043jDBtBXXzdPjb4PFoW3W4pA4X53fIUusgME6SDvRwW0Z+eQoa9X+Su
         9L1pxRq6pGJxY9Pt8ODVDhfG6WQ4WgJC6ncD1Kn4CTMNtZX/oJKgRl+jJGBiyoWn7lMV
         gJsryKeD/pMI+IuAAmjVkZpAayYlqEu39+q1gmjtG9opqPpv8TOGupGmZZyBM5+D4Lv7
         zJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585687; x=1793190487;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eU6RtwaBGBVUdLrxzNH+pMOcJGbeX6TyDSST0DZFlQ=;
        b=N87eu/gmNAX9GMdUD9bdIznkcFHnkeRww7vKd4CuX24F/ZSufbG4MBzT3re4HyJlqS
         XWXp/Aj/Fxo5fxYN2L1bpT81a9MYp6Fy4fbF0i7GZ/IZ1tKsnJQ3l4d9gKEE3gsjwqLA
         hPDkJgrCndP6PBlnAbwsp4sk+/PbY2SYSDdbTN4fw426SgFSDkM7FGEQklKadrbxmflE
         /M5iGGMOKYx94DP+Ch6QCwv7fLLfjOvGBLeCk0SuPMIHa41Pjmn/iKP/mkwWDv6RB8zG
         10kf1jD92WaqPaFmosilwNXlz//pcmMq0B5hID0GB8jxnRyRp5ViXxbVNFX9pMq8pP1P
         AKOg==
X-Forwarded-Encrypted: i=1; AKwUvBx16lWAfxixZP5mPtiPzCcM6a8hdjdTMc0xE8b4rYLYbn1knWmWhFdm1YBSg/8mpl6mA/3nIQBhrRgHXfk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZsMaReFmb08eboCOGdaIF51hG1SDZ5iDCg0bm+1MSGMlGIIxo
	8fvC5lXkkHYCUPuRCFxB0DZ966ae51a0IfykYVgwshNRpLC6JDqIdOvl
X-Gm-Gg: AYBFou3y8jpBVd6/oQ0OtHp4J+Do5rXaATx7D4T0/dQtDd0Wc2c3phMvT/nFCUdVi10
	4mzIP50a66BQX496tEifN6UXkMjMXanpUmwtLzpt27aRGw057LOniMrUJttxaDC10U05SU0Tyfw
	GgFKJdfO6JyfVitVNkVt8n0WChEFp5c4bpFWqpus2iYH6+PM+I0ttOlNYWn2y43MwJhewEtNx8O
	0CEVOsGzYDNArE9FYxmQE4Tm59qooAHpG6A94aphSAUUbwR46azG2IyBrlEn1idlvgk4qK3VWQV
	Fs+IKfr38AdUYGKbsJvv4ELaj7i8W+q7ZB+1kLSueOPZWhAkSZerKfjnXnwMekySG4G2rMQeqdj
	jvBgPkGJdvsVyTtAMX7xjsWPBDXNEUAPm2YmVBBjavSHUk/JaUrkaHQBQYi3nly3r7kA8UfQAUK
	3cNcnevXfwfK0hsD+1hHfqkVviI1OaboRIjSnb8ZRqQObDwQr8LdxPea9RY26H1XJHahCToU+lM
	Nc3FIlmrBhV1wLpSpWvRZxIhU6FFpr0sd9Phl+HRM3+1QnCyyPFyRSpB+GDOD2KOuA7Qi/OcZcJ
	18/UctyBYiJVbv2+XA==
X-Received: by 2002:a05:7022:f519:b0:14b:edb2:c3bc with SMTP id a92af1059eb24-1909acc857bmr3334418c88.0.1792585686379;
        Wed, 21 Oct 2026 05:28:06 -0700 (PDT)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035926fe9sm4935059c88.2.2026.10.21.05.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:28:05 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: gourry@gourry.net
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	dave@stgolabs.net,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	stable@vger.kernel.org,
	weixugc@google.com,
	yuanchu@google.com
Subject: Re: [PATCH] mm/vmscan: reclaim every zone in per-node proactive reclaim
Date: Wed, 21 Oct 2026 20:27:56 +0800
Message-ID: <179258562954.2.15216681747698947501.node-proactive-reclaim-review@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019185002.3428594-1-gourry@gourry.net>
References: <20261019185002.3428594-1-gourry@gourry.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Including all zones makes sense here, since per-node proactive reclaim
is not serving an allocation. The existing GFP context restrictions
and folio isolation checks remain in place.

Reviewed-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
