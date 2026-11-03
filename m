Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742206;
	b=e6rr1crfHvrtA/rXpUUH2EEy7eSzHnMzM4DjjVOj+DUV9EOrt1F704OVAAmsmWVA05zN
	 +AhiXJIujdyUA2irFYncm9/v+Ljhv2XQJWNa625CerldOlXQJV0CDBR71+TiHGtJ0VlJl
	 cfMhgjr2m1Ta7PKeEp2+LN+fehrjZRWHCMjTREvg81aAnOAwMg1qdXIaVOL+Oh+c+HrKo
	 kk/stEyjzl6DvcRHQwvkS9r8PAQfjoRS9Mz7q7rZcaUL5DvZvr1BSYStnmbgbIZebzzex
	 62t/o8aMjG+iaeutmBydkthqZAKCthxUNSwX6vqolq6GzhHwtdUq29YGHr5ERyjqwtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h157KYlb0DfhmPmvL9jve6/wgNUq9iDvWiOY4VtMut4=;
	b=3v3JrsgAX5OZPvuasiqfFXe2W43KO7+5RMVrvOzltlM7iQhMPCAnIbOgs4/WHhpn3mhM
	 SjaCAUTl2kESIGVBnNQNr/XS+hJDHqfYL+y+P/ulkfRmPF9wtSyn61M4AukeeDsiCFkwS
	 /gXU/mP3zsMheH7h4OEFUxI3gZ+TkVr1kfC2pv7WR68iQS59PtaF9gkhhKV98/iv25YGa
	 N5u2BxSNYXi9CvgdUfou5PsYduQ/K8fXusdNTPvx/Jqs5Gm7cmoQijtu/o4eP+g2mAfAP
	 NbdNV+gy2fCrLLIm6ME+fa3ama4Lflg3N2XVyuzKGPM5tqbdiwGu105NmV5hQIhpnKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o6ml8yeL;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417CB6082BCA
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417CB6082BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o6ml8yeL
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso11173666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742205; x=1794347005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h157KYlb0DfhmPmvL9jve6/wgNUq9iDvWiOY4VtMut4=;
        b=o6ml8yeLKlBikHlw5Xq1BdVtQBOQgyAPbb4WyMPMl8jr4tj9GSfj206WRpCNdI5Xc2
         0i8yTPB26UOorGMEsMpBNERdIDGlZPibrfSbUMhSGJUWlsZt2pkOiUiTmu00cVmWPYrg
         9/3R+bEq/ay9kluZakA+LOZMkxXm2Xjd87XNTe2ZYqnhL6cFex2daTr7ffWYllGFLweP
         JQRl0tj4P/IalLlgmDZAaYSgqOLzhOAOu4j/JgTCfGrIusayItTGtZuA6+4R5FmVvygw
         TeExlmLeMZ1Cx0e4VsJN3xCSzEgw/bdbK3GyNYzTc3+0itH74zhEaMHUGiks36AwbTU7
         UpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742205; x=1794347005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h157KYlb0DfhmPmvL9jve6/wgNUq9iDvWiOY4VtMut4=;
        b=oL8yf+T39EOmIBMtkw5p3V7aR9O2AwcM//3KrXyf0fCvcpku/bO1fVPd2gm6xIC+Tv
         /YMwXTNX1GW8owV7o22kdwObBy4GPGWU3SRkU2M7hJ9aZAMb0I6zavS3Hs2AIpwNTIWZ
         I2xFsL7BbM78Eb44LrwP2HqnJ7FOFLXfIJGsxRt0Tuhy0vFwIYqkHNDtWC7GlSQ8oFCf
         M2sqv2YTuNSErShE6BMixyXuy4YuPrQsmHfqmsUYxQj1UrqoBO63XJgiFwZmF2QKHtb6
         kmkOHhbFsHQCrujkUOA/ceFEwmwQ79kYygIuofOzU6c5ujVKDPLktM1U1beYcnrV8iKk
         sdGg==
X-Forwarded-Encrypted: i=1; AKwUvByz/pD9sLymlnAlP3FFxG8N0apgrUvaNb2heujxgFCbV2JmpHiqjgw1fff6BaJAuZ/TSeMiXNEcuSJxTEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VmzpwgtCXYWf8a+kYj3w8LXOXyG8fdv6+CKtJIA2JVB49Hbhs
	dt75UrMgEXOplOc1yWvv+mjrhRBiK6jlkMpRVA7zw9xj3w/wZg2GzWFL
X-Gm-Gg: AYBFou0rJZQZ7nZlfbA1acFaPfsSxXxkUsOdVxUo1ewX+rKfRsJz41qGIbUYYqyuh5l
	nZXObWvc80Jkt5rXoR8TtoqYKbi/SdYyFGi6jD1RBh/S1+13GKy3EdTIWL/Z97+88pD9iN+zBue
	X9BxlNiPlIxBta8GIbusCDl4mfTHbIgIcRACXIvXlHR+lpImdEuE2XigfgXVtz+EolShy+IOP/U
	pdaCFAV+2ZuHNa1egK+UOqWmD7JtQfd0jV2/ufdQdm7bJrqWk820/f1dGCpZPURa9pRFhskpWeH
	JYrvoYqfNVVCBs7rh4Rf+I99f+lgC3dweBQj647xEcD2XQDkz4seOv9+5ReOY4P083j11fPLRaX
	O6Y+XTCT7152bFKaeYow9WYdQhPmfhUIINCX/V1zqoDFb7kEye9PlBaWVDqpA3KHCBxiSagnYgm
	c4CRsWqWMOx2BCbm+g3hMT8dm3SfQ1TrsqcYA5WUPr1/xzbpJ9CDdljxjAkvVzXgnGo5S/mZCHL
	/CvMdI0pksxG4xGiytC07nvZ3gw0P0wiYtMVp6PX1+Hi9rNVNIfkdtNsVZBeOt6czjqTfgs1AqL
	Ylqqxs6SlpzIOsBJ78VDd/uh6uxi3vUCpzjZdfNLR2WAD+3AC6/QCfrrsx+SJaNSZUxqgLeB
X-Received: by 2002:a17:906:c14d:b0:c40:4f39:22e8 with SMTP id a640c23a62f3a-c4ca7acfb41mr1185122366b.44.1793742204578;
        Tue, 03 Nov 2026 13:43:24 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:23 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 11/14] alpha: use generic ptrace memory writes
Date: Tue,  3 Nov 2026 22:35:17 +0100
Message-ID: <20261103214120.1099893-12-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
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

Let ptrace_request() handle PTRACE_POKETEXT and PTRACE_POKEDATA,
removing the duplicate calls to generic_ptrace_pokedata(). Keep Alpha's
PEEK handlers for its direct-return syscall convention.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/ptrace.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index 4f857d5cbb1410961a78e4ef36cce4561a7ea7af..18860066156ae7fe5a062095fd2641c4ed0c77de 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -489,12 +489,6 @@ long arch_ptrace(struct task_struct *child, long request,
 
 		force_successful_syscall_return();
 		break;
-	/* When I and D space are separate, this will have to be fixed.  */
-	case PTRACE_POKETEXT: /* write the word at location addr. */
-	case PTRACE_POKEDATA:
-		ret = generic_ptrace_pokedata(child, addr, data);
-		break;
-
 	case PTRACE_POKEUSR: /* write the specified register */
 		DBG(DBG_MEM, ("poke $%lu<-%#lx\n", addr, data));
 		ret = put_reg(child, addr, data);
-- 
2.43.0

