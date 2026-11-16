Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794789960;
	b=dkMULkWEHMr+FItClROPXKLPihMeUpDbUHkpcn2hyuG2NrV8XBy0qR4yPBpdX7qExt9i
	 0chfHfDPr8s4vmVTlHuedHuxbtCGKMrS+6OajL+dMPrysLbfLrJKgnotP/FXD3636CtM+
	 w1Vn5PG2bRRXP5nyPY1xC4lTaYRub48JOZHrFO8/jiNcW0NHNmPYDO/HqN2ZCo9XXeKDB
	 42yJ0wUVyfCeNJ8ubztbBwc7+/LabwfJoGPU17cynNYvxpXty2PJrbLaecyKnCAmbWGNj
	 lqY9soCquinV02E1fOuTwWOLRgldI9/wo/HrJC1/l8NHAEiTZhdHfGevSVywzbAYiAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lO3Cr5SSAZtOZOOCaZ4gKS/kULSO6nzv/VYrrhRFV3k=;
	b=oKZ+LzTRWJDxH6Uny2NjhbC9FQRfkmsR2RkJtbW55IdR1LYg0eZtbAgJRYho1dyR5oLg
	 NjdZsevvMPlGoPJJ7FHzJzUv7ia+1vK9cSbW5n7CFWD6WOCA0opOJNPAOoE4z6oadmU+K
	 mUV33GDOr90t4yPTEe/G6p86xgqFB/HyO9eZeEpNC9kvOxyDOa6X3AukTqFYiLGmMWMdo
	 /Llw/TEYUZX5cXKcyFXyQOgZ7E3fbe/SRLhFNmZRMJngPFJlc8+huiWGT0oEEZZ6DzLF0
	 UZciBygzfUuYIHXUD8ZwiNDoBR1ke2TBI7ya8leqjLtuVxFU3tM58nxYCJR1JPFCKrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Xt03lFTd;
	arc=fail smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0990F606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0990F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Xt03lFTd
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-71ad099391dso503192eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794789959; cv=none;
        d=google.com; s=arc-20260327;
        b=npryfZpSgR0yQ0m38RvK/an50V+383zNSLf5xlwYMU97OnnXdnzBlwUunEJnkbE+eF
         KoOR0vfB6ko3pPrbPcOKKi+75TpzcHjxjYjCss3BRqQJsJEFuz9sy/BQJAtPETAvO8W9
         VS7O4fXXoLTmJibmiqVGKD++opN59ajzTye03tQj+L42g+XGPf1ebYWmnKKjbWDt9tBb
         058M6AK/n40zkbhP3sL5AGIxMEVe10DKkh+IbQj3Rd2P6Dzlt3Ju5woAnSgxt4qxbPZJ
         HzwSqpChKxqXCw7a6Tj2NMW3CN+m8tACUgZQ4BGyo/ibuM9MnT0hoY2n8TELRp5jPg9m
         7nlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lO3Cr5SSAZtOZOOCaZ4gKS/kULSO6nzv/VYrrhRFV3k=;
        fh=V8txNX4u61idOuqmTqKleJgEF15iVwKCTuqf/bZzvzM=;
        b=UYHpnZsBJt9QqCQGRu4BleZWD52F0jDxsgnxXQyqb0f0WPycU5x2GSfyFXZJ5UMjaP
         NDzNQrqANFe30r0YfjzRtvuVZY7/KANMGSQ9f1w2D0cbGlXgBv3MjcN/XmxYEyX2HeEk
         uFVfmY6Aj1X1d/W7T3eMloqUiXYkl6BayrgwBCnHB1/maopiKUoceaPi4aMXnaaKMdRZ
         vl3fwn4kLBq4PKpKuqC67wWNeRCVGliOMBCQTRuCEjxsH20323nfVvq0rR3mBFvewLVe
         ARO8CvMm9x7EgyIbDk0SJOSnGg5gSCXtN6EkA/yZZTFK6wTSsU3CIlRx0oUM+xpXG+fs
         /YmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794789959; x=1795394759; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lO3Cr5SSAZtOZOOCaZ4gKS/kULSO6nzv/VYrrhRFV3k=;
        b=Xt03lFTdg4jLInQcl04vLeXF9oJW0DFBwZLBN6a6UP614RusImFX02ZlrEXXz3F/ep
         FI/p/57ji0nH0Q/LBj2Vr5Tn4kQ9X0yEFhbcaIipNU/5Dht727hz9wrlYC5v9Dw24gIK
         gcndx96h0ysM2nC3pnuIqO7q2HWfC7yPwMymAp9Vdku3yEN1V2Og7zQOZ14fDuYFsTMu
         3WKaUgWtbxJLvpq9v0jiIsG9cRZAqum8zzpd0kZsrPRCsAMjhZR7M+XVrftklhRZ3tPd
         1OzvmXEgMo6/bzkd5tw/o0lbIPVzDasw4K4X/njk7mkw7MkFiZfaLq2snUGjJCuM2qG6
         XfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794789959; x=1795394759;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lO3Cr5SSAZtOZOOCaZ4gKS/kULSO6nzv/VYrrhRFV3k=;
        b=vIXHuRMNsbYwMHH2yDVMQfbUspXkDgN1ktPQ0cL0/V3E4gr0WQUkN+yXAZxu8nl516
         jheBQC+jm43hHnyYHXPXkBYv1EYEqnSUr92H0BDXp/hbjDfgs0r2V1ZEBg8OOXAdEK6V
         vxeXYF9hd9Rqb4UGmSwAG5CfhSwMKml3Ygj67a1CiJaU90cnsKboA3WyMYtRiNcMOy0P
         GETQ8e2Z9bTn3v3mXF07/9T4iacter/tulGN1Z7dRqccYM2YKq4FHXAv+2YUFs5Zouqi
         dIE82SflM6cDo6qQlGxn4aphHNVvBy66rhYbK3WvzOQ6q7sBwhOKMKS4ITbg7dAi5g4n
         hBjA==
X-Forwarded-Encrypted: i=1; AL+hErE6uC7bwMhOGJZJHmOPxAUv+xLPqxicyovjtyE/ffqVsNr++U+6A6SLJEtX7myLyCAaQt56ijnbDl9gjpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tp+GbGMlAuif3yFtEBGJL8Dxvwp9QS7VPsmiVpxT4ZR158nze
	4IPR8WF2FcGmLwBCFF9NEJzX+GhsEGZ99Bzffr5ics51L9S9WjTKlP2JmFiZPRi+l7IiKw4ZXiX
	Lz0pWjQDiMCyGeab6wH+86lFcYg28ZumpVYEbvlwEqQ==
X-Gm-Gg: AYBFou3nqXW6ekl5IGUlhNTIvWgz12GvcpSUD+JMjGzOpILky2tfVC5hliK7FrBpRm+
	s44klMktGTbfngg8f7UQAqzzhRcFkG0bq5HIsVLGzy27XmYZ+ZsESvj/BQhFNMYZrP55RMM5LEl
	FYh8IzVdTstSPpBoU0ig64VuFAs44V9REylCCXIhF6MbqqOBu40cLV/p0nrITzSNFoMfliPMItP
	AnvRM+bNNY56ZEw1ImdlYaXBLbC3AZ6Th63ID656KmXK2GYWPmEthfdvYAjpexsHotKJAOKsvNb
	iVwPAFJUZ+kqQWoPlGeW8FW28xNXHsYD1tNbpKh91nHqdwYMvLz+18eZNhFnCzfAEo0sULHlmqN
	r9mlyKq20BhQ/n5CQLtXLEl4KNxIal6SHELenwG8tAFgsO+wVeh4LsBtwkJ07jhBM0LXhYbvSVe
	8uKd0KJj4QIHE=
X-Received: by 2002:a05:6820:4101:b0:716:bd98:252b with SMTP id
 006d021491bc7-71acc5342dcmr3472073eaf.26.1794789958914; Sun, 15 Nov 2026
 16:45:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115214702.50817-1-emmaonana18@gmail.com>
In-Reply-To: <20261115214702.50817-1-emmaonana18@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 00:45:48 +0000
X-Gm-Features: Aa3M54pgGbrVncF7OWBfNtWTvVm2wgZ0k6kyExGgK-4Hkv46OrR8Lf1HTEPy_OU
Message-ID: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
Subject: [PATCH net v2] selftests: net: veth: propagate channel-check failures
 to exit status
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: kuba@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 22:47:02 +0100 Omokefe Emmanuel Onanaroghene wrote:
> chk_channels() reports mismatches with a "fail" line but never sets
> ret, so the script exits 0 even when channel counts are wrong.

I found three more checks in the same file with the same problem:

  bad setting: XDP with RX nr less than TX
  bad setting: reducing RX nr below peer TX with XDP set
  bad setting: increasing peer TX nr above RX with XDP set

Maybe it is worth fixing them all at once?

Tested-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
