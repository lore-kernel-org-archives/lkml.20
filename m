Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650030;
	b=MDyjydIU5iawpl4uVaADjbq9I1Ar9ARA/t+dUfhM5yF4eWtroXxervwooXBgO8D0M18A
	 dMnaDApKcyfEbZxiuhjAs8pjrs5Rgxw3t8lNx7ShVx8aZYg2R0D2g7XZkJIWTuIMddJEx
	 0tVPZxL0P8rq3oAF3Kb7rDp3aO+ErNst7ZY2uM/smsFjgPOdpy5Ga0vpMW0j2ifwcaSeE
	 2aEn6EldlYT1lHYjtwOoCQKL2BGniRd+R4ZQ7F3WLh9iCHPkow8OSeg20wN9tP9D5t14H
	 Z4MRE6islYPnps8BRoDs9k8dM4pzgBLqsTyiDhPIsCB1OhWKgppKuVhDUaPnxlREMaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7/8HuPceBZBfGGeVO/XXQ2vRNqNpaLoLdRBKADlJzxo=;
	b=Ug2ZDTMmS8RfdIf2iRh2KyBUWIxNQVjrWvGAmrkauowhgCXsrqHlqueNVEK4Zz4Ar4yQ
	 ha0FORg9SeCT5LaC0grG3aK6gUfg4kXeFtUINys0qFFfNXnYJk0v2rIDxa6lvn0QcGNxg
	 qX3rxntqGeR+s6fa8BlyeuYchSKUMdZT+zozZ2UyAELzkPIwucyjH64KFF8xxxWZKtBa0
	 BKO7pRadAnTEmf03TR01mgKpFGdJFY5XCv0MXnfKEsm8+AB4XGV9aTjlCD+vXxVS5lK/c
	 pIARtV0nW+AyP2urLOdJsWsfNPqLPY/J+D2fizN0IbVo+iSYchkuVy9fGaMEz092TFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FA+t6d6d;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FF4606A333
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FF4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FA+t6d6d
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d427836e9so274089466b.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650029; x=1795254829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/8HuPceBZBfGGeVO/XXQ2vRNqNpaLoLdRBKADlJzxo=;
        b=FA+t6d6dYl6tm6Nm2Fz6b2bdeewz/D8kjzVL0gLOAQIrRCtEM+24URZfC/aF66rCIm
         PdPknUtemzUCSGRGK07OfuwXgYbBXebmzG9v3tlGvVANnOm5la7uqyf05LcKzmFka0+d
         1t1lCINYb9qGcZeyUshEtZ7OPVDIjpXElEQy8lXIedjfPJocCkztCSefZsirgcbYWEZR
         CurllVf49t3cJUJ051fn/5qxfjUG9Jj5L37rCBpQQd8UoLRszsJdprP0768yQH7k/YZx
         xoSd3T8Yh2J/9cV5wzKVUqBW27l1zzmfp3SEb0ImR3IR+cLTRyK+ZoP54SrpTXktEXM3
         s1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650029; x=1795254829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/8HuPceBZBfGGeVO/XXQ2vRNqNpaLoLdRBKADlJzxo=;
        b=FsJNZBgbY2DukIODofpnpg+S16/gmR3r3uWcbN3TEpPMklP2Efdf9bFnwJpD1RVSAY
         cw3fWrdFy56Is78qsbJiMb1lVAolyLwjWaq4FbUls1ujae7xtWQ/SKLg5ZCIgBNkcsAC
         d+uXpuNMH+dRSOEUJgCjWVVDVf+rRgSVtHGroh79ySwew1kJTLVKK6a59rOSY03ILF8c
         Z8uQ3ibICNLACPvHZJB9WrwM2ryk+zSbwP9U9cm1TKlLy8xAfQ6vVv5ngDZsxLMTIWtC
         i9HImrsPi//MhdDIW+8ckS59pseE/FJimSlNX98Ffx/vGb5yXUk5jYINhK8WkJqCn51j
         JVtg==
X-Forwarded-Encrypted: i=1; AL+hErE7TNEA50tVPRXA6bnr9K0XEpiGelNBk0TsIgWLJvRqRNCXxRVic2WUSM7GMQ5wmbpYaL1dXe9wT9bHWqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QbMG8Xty5PgJ8YlUdpVY4PN+9aqDQK0h7epRelNYlcKBEjlnp
	y7AH51ORhwWtzaZisMvDgQKLVzxK/OQwkP1kPpX9l5lbE0qN1FPV56lE3DEZEGL8
X-Gm-Gg: AYBFou0bNv+aGfyyZLQSj8Na6BDuU+VmVVF0R68UnQi0ftol8DV0qU+iD14sodeA/mt
	AHK8N7CrUSb3RJjBZyQeWQGe4U4Gfn4rrhdtXgWTsOY/Ac7IniTRZ2YE3cud74kcl0ev3q+EXye
	vFWMLf/hnODzDd/XZEOb8kN1/jrG4qv85tJtAmNQvGjD+Im1zWW5T6+hMmciyU6eM6bkDfe5dsb
	qd0HFQTtpa9MrTnE+tBbM9jQLF+lsJN7fQl5vh/FpTpMvuPK1aQH42J/XR/It2j9dhiLL4YO0iC
	FlfKXVv7WZRi2Lm49nr+3g82zhp8iywrmq/dWL5/ILMIWtdrppF1HIEYVy5BzaNQcz9mfvq+p5+
	zeyJbHlUARzrYk64tJlRnUL+7K0/XtwkYDVZILotrZcPAUBOcDwX8lWnjrr26cXLNlnD9p4T3YC
	bJDYU4mKB/H13pLKi8RYhNWJgQLh3WQ39fLId2EQhybETfe/18AF3FY6BdmK7CHXHxOAbTDftWo
	D9aRMlaLrrpLK/DGt8StvTNBGxcwwXi3iU3N/Vn160aH/ORH1F+GQyj+yqRkbeRLFdp8HRZK8jf
	eQydejOvMs2eTiwbigUa68RpC133rRyzf9VY1YwincF4nvGyPEnLPbMVaa3C46J2ZyMQHNI=
X-Received: by 2002:a17:907:a892:b0:c46:cc9e:a143 with SMTP id a640c23a62f3a-c509637d486mr421299066b.26.1794650028869;
        Sat, 14 Nov 2026 01:53:48 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236d4sm197311266b.18.2026.11.14.01.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:53:48 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v2 1/2] alpha: parse early parameters before reserving contiguous memory
Date: Sat, 14 Nov 2026 10:53:16 +0100
Message-ID: <20261114095335.1283016-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114095335.1283016-1-linmag7@gmail.com>
References: <20261114095335.1283016-1-linmag7@gmail.com>
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

Run parse_early_param() in setup_arch(), after machine initialization
and before further memory reservations. This lets the subsequent CMA
reservation honor cma= before start_kernel() reaches its normal call.

The parser uses boot_command_line and guards against repeated calls.
This moves all early parameter handlers, not just the CMA handler.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 9fda01b73b18..c7b7ebcc47b6 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -579,6 +579,9 @@ setup_arch(char **cmdline_p)
 	if (alpha_mv.init_arch)
 		alpha_mv.init_arch();
 
+	/* Parse early options before reserving memory for DMA CMA. */
+	parse_early_param();
+
 	/* Reserve standard resources.  */
 	reserve_std_resources();
 
-- 
2.43.0

