Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729888;
	b=hDHyUWF/orVv4StCXg8hZslrtxOnGnaPRgjhi7JAdZO2fnrdVuvLm9JjgIV5jyZnUdw+
	 vMC+beHGSprL95SsepOPysRriN6+xl8ied09bFiLd6DS1ut+wW0wCr3X6V+ksPjNq93AF
	 uXQ0cHM7qqwRKwmNKBervfnk2OldHYV9+++jCuW6dtfxbCBAFJXUQOFZPShycEDipm5Kd
	 Ficz6pPOELv9ZJWe6o5EgnLgyXa3gbi2tf7P0PEG59wcw035roPiVH5ueCi5fmfzvwgQa
	 FVzjMD4kFlhZHVjGnW2WZkoGnTvo3NMf01rztZEbq/4oSo4TqcCygY+5CGtVGMDgXbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=UTXYGVplWAO8VvUr57iHtg64uySoLqOFfaNXV4F6AE0=;
	b=txhynjVJYyvyEla9CTfguamWmQpz6S2Lq+y7PplVF48fqFSkkeD8rLMg2Dpo4mG9ayl4
	 cJ7emut9KKUxjqj8gM9H3ClRxig6IDMs3lwcdi1twTca/Xz5ouWjsnc63TqQwUH2D9vv8
	 d3jGrZXjowWNFTeu26ahHopFjU9No7wV0iPKLwaMksmcwriHslvLpjqmu++NjgKS3W46R
	 40XY8btpGt0uCFMMVPEmODnc9nC/hwkLwdXDLuM8NNSX12h8b9/VazFRUEce4l473zJXR
	 w8TTaIJJQAQdUfULCaEyO5Zws0lXMXCPkDEax2LA4eHkEdhe5YO++TFOekNGKpYocAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pouAy1+o;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A76606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6A76606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pouAy1+o
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso2118750a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729882; x=1794334682; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UTXYGVplWAO8VvUr57iHtg64uySoLqOFfaNXV4F6AE0=;
        b=pouAy1+ok7smtwkWcvXNMyZ+av0YOdP0F2CTGZJOdo1h+iagn9OJO5sfsRkmcddUsw
         /Z/npUVUN5GPnT/E9FigiZbxl74IB5Nuz4RC0yOOKHHfGNW6zJA8m7jbSQTn9U4irWsj
         XvNRItPUfHKulRKzdu7VGzij4llfxI7+zx9vvw2DKTps7MupL8YztsuLMMzNdSrZEzFr
         /IUbp8dxpt71AtJmpe6ZsnL443v1SzH45RkK7sWebng/CrGRt8kY2q5neiOxe+MUZpIS
         YYtsSyTn8Sz432BXUbsql1oJYhZP7lhawuqZnQYPO6fV/Da3R5YdqFW213nIgnI6zwsU
         AfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729882; x=1794334682;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UTXYGVplWAO8VvUr57iHtg64uySoLqOFfaNXV4F6AE0=;
        b=Z0gpF+XaOo5VqOMs6lLQ3HB3D6qubly0HSPeZNz4d2ENZuYm+dT+w21Mlu1mKn61/w
         tHBgdi54O7c0Jy9x4PmoOjxuxEgptjakGHr8i7tg6Z1yjvcUTXvggRc3/GnhAvHFtXID
         eme+Dxfpa38fFIsfYi6Eq7aZg5oZKGjQtSvcdFLgpydeGVeJcvBwrAqNkUUZBYZjHHB/
         /9quS8HEnB7thm5GuQh3/DwBHq9SDTenQX3pV3Wz9Lk7L0BPJEZYBkiZzxaxl2SSIbgm
         JhN6DfS9zyYUsnVtW7bTGsp8+G9PBTNlhoFTsJzlyahDAEGs55iHqlQeGsKLb7qbNZQU
         Rtrw==
X-Forwarded-Encrypted: i=1; AKwUvBwvMoiAZlLoexxP5Q1FM+ipwKK32XxS/p6eHiFyWuwR0CIfVvazq4YD2yTRvfzYrYxW2xe5x0+JWgpKAxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Of4UFxyyhHTDJaVa49gZS2S2OEl+5bE13FoBrI1bL6eUTFL4m
	weOzU+pDRTk5in6b/zb0HQzjd4y2MF2rHqYz8Uu3TJQyKYCC0ECytJ9u
X-Gm-Gg: AYBFou2gEiEdROUrDtc0DckNNNYLIeLxx8eetQWz0tjwWBdavc9qf30BixV1EkipdqL
	MXYmetgDiozEpD3jQBkmSBhOpQs6Mf/g6NRiEiPN3vA512jkt8FS3gv0cj1vwHzyBYqYr8msgb3
	QhkNtEN/WWZomS2GaP5czrBOlaDTd7CXK7MBiwU2Dy8CNh7qyXcVt+F0XyMTVM8uJMMFaHNBwzt
	9uWlxcHbBSdEhaHkKrHwW0LRc7ExG4WKwp5Kseypt09fDwE8Rp0nqWkNtz5GaKItDbe2UmHO5y8
	ZOHtQfyhcBn6iiAxlRaq5l5iGsv8bVEfzH2MgGlfltGqntJY2vBBY7VRYRIia7TttMI+U62xHmC
	RyZlOnSSDMMvLCS/p9Q9v9pxR58dnwp+bX2CgwEg3N00VsfdcaDrPmxtf6rF/acIrMAoGSII1wM
	HAWWvQRp3yudZsdpiHsaEmvGI5RQn1DAKq40r6NRg0WS5YgOJnfKCKHpWtafjZtbypbYW5bU4kU
	zLTy3XAQAAfmyoggx6ANvE/svNE23GfPRI5IaIL0IGzlkHJ7x5EnVjcMzZb1GuBzCCLghJPy70z
	HDov87/qrNFPNDa6Pye0CFYLI3AtqN1fh+TQJTYEC8zmpvCshFBM1vG9CVgB4kG9dRpWmAFRdsl
	mtlm9HNDDXv6NhwjosvgxEw9c8LaEZCyEUZoUBhx1eiG81R5uMHv+BEU=
X-Received: by 2002:a17:90b:3d4e:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3ae8981e41fmr10183965a91.37.1793729881831;
        Tue, 03 Nov 2026 10:18:01 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e087csm5445702a91.4.2026.11.03.10.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:18:01 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 18:18:00 +0000
Message-Id: <DMLS6BDLXMCV.1C0EN486O4XLV@gmail.com>
Cc: "Jamal Hadi Salim" <jhs@mojatatu.com>, "Jiri Pirko" <jiri@resnulli.us>,
 "Martin KaFai Lau" <martin.lau@kernel.org>,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 <netdev@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bpf: net_sched: reject bpf_throw() in qdisc teardown
 callbacks
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "shaos" <shawnq1@163.com>, "Amery Hung" <amery.hung@bytedance.com>
In-Reply-To: <6AEA1AAD.2E7977.08739@m16.mail.163.com>
References: <6AEA1AAD.2E7977.08739@m16.mail.163.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 03, 2026 at 09:32 AM shaos <shawnq1@163.com> wrote:
> A BPF qdisc's generated reset/destroy epilogue cancels its watchdog
> timer.  bpf_throw() unwinds directly to the exception callback and
> skips that epilogue.

That's a bug in the verifier. bpf_qdisc.c is the wrong place to fix it.
gen_epilogue() is a contract: the epilogue runs before the prog returns.
bpf_convert_ctx_accesses() puts the epilogue in place of BPF_EXIT
in the main prog only. The exception callback is a subprog.
So bpf_throw() breaks the contract for every gen_epilogue() user,
bpf_testmod included. Fix it there.
Then bpf_qdisc.c doesn't need to know about bpf_throw: no BTF id,
no QDISC_OPS_KF_TEARDOWN, no forward declaration.

Like:

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index ead7871..5363e88 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -909,6 +909,11 @@ int bpf_convert_ctx_accesses(struct bpf_verifier_env *env)
 			verifier_bug(env, "epilogue is too long");
 			return -EFAULT;
 		} else if (epilogue_cnt) {
+			/* bpf_throw() leaves via the exception callback */
+			if (env->seen_exception) {
+				verbose(env, "bpf_throw would skip the epilogue of the program\n");
+				return -EINVAL;
+			}
 			/* Save the ARG_PTR_TO_CTX for the epilogue to use */
 			subprogs[0].stack_depth += 8;
 			insn_buf[0] = BPF_STX_MEM(BPF_DW, BPF_REG_FP, BPF_REG_1,


> Fixes: 7a2dafda950b ("bpf: net_sched: Add a qdisc watchdog timer")

With the fix in the verifier it's
Fixes: 169c31761c8d ("bpf: Add gen_epilogue to bpf_verifier_ops")

Pls add a selftest as patch 2. bpf_testmod_st_ops has gen_epilogue().
A test_epilogue prog that calls bpf_throw(), with __failure and __msg(),
is enough. See progs/epilogue_exit.c.

Pls target bpf-next and cc ameryhung@gmail.com on respin.

pw-bot: cr
