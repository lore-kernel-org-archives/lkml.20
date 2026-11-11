Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368303;
	b=jcnG+29CVTEj8d8KQTyxtEJlCMUAu1l3m7DcJe2xKNKx1cSoe1Cm8xzoHGGB3gvfhgZs
	 LtWpHiJY7J1eHmKauIWhotK7pG8j+1hbGPqVo3e4Gi+1U39+gJtnZs8Au9OfZ1zEvyUBa
	 EBcauiYAxctzdZhhx5tm0O2uDZpuU3mtnIPbN8ZoCdOvGHrmaI6GQDNna9HyrHCdDLUBQ
	 Rjb9BmPYk1P+CAKuBgrgZl4hhHjpcWDgRL7RNFlbEwCTGnTuhv+BDywdMKeGda/s0y81K
	 QyDwEJRgShuvXyEu2QoAAoZHIb23CwjVTcq/UG5SKOY2FKn9qbabKrBZ3myH18j429w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=Pzim6goyEt9kVT6V/QtQQEQa4Z94Iu/LPgGVG9QuKw0=;
	b=KpuCPvFlxflXi2I56GAoo37VxnTkr1z919gzpz6z9zuMAI54IfbxuqNMVIzTuPVO31Sx
	 EZ1hl1M/BqQcwyjgER6Xy61xBi9KhJn8/51ydQDXoPpRfnCYxzJQRDTLLMpPIAtsGCf+A
	 m9Ao0ARbOnzFJhwF2MGyZB8b3yaMLtOlZ3kOfKcAuLeCkloFqg/0d7hqWolUDjnzQDyuP
	 9p+6e9mShswVKoXG9O7yaeBJlVyl2NJ5rcXcGclfPOFcwgZSRljk7S2hNuRLAQJWlrGgP
	 bn8JrF//UNRUD8dpqoFlzYOVoF/7xJi1tlLAFIl8B6jO2y4OUUrimXmhIUXM2OOQg1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybXkobxj;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134CC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 134CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybXkobxj
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so136073c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368302; x=1794973102; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Pzim6goyEt9kVT6V/QtQQEQa4Z94Iu/LPgGVG9QuKw0=;
        b=ybXkobxj9J0O04ELlSZc88FfwS0J9xd6sEVcL2MLQhauTkPxb4SasGIoYtubuBiSpg
         id/xDSxTY8FNMtFQx3oppuqSuq3GdmgAkrQyX7TY0uOK/KWHgCJ9cv9pKKo3tO0D4tro
         ogQRxQZagtSVpy0ECSiGNYutbnBPYIPkOzZ5+UA3oKhNeZBiitVKGSf4cWNv99r2XmKM
         rWwXU8VFg6dw+tqB+kjgVjBI3CmqyhCGvRoczqgxC4IpA+jVrMgiZukhugRqNCemBY10
         thGoushkFsAVfDNofuf30uDENB+jGLS19Iozh874oJWZh8Ohfh/6gBKPHWQdJc1kNR+q
         KzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368302; x=1794973102;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pzim6goyEt9kVT6V/QtQQEQa4Z94Iu/LPgGVG9QuKw0=;
        b=gzQEWJ/nI/0yRTV5AjvhZPzHxd/tbefJ7Gr0riqltJvHxfNLirxur+pb8WnolDjpTl
         /7RLV/a9QAJzCdqwIj/eYo758h6Y/itlyNTy0AGOeWF+6/47mwoRC7bAeLb83FnMtwAy
         o9C15+/ttFe7clOpDcqhNBqCnGV/gtv5ZDECLTUFOV2y8cwgPvYx2Kb3lG9gCABb4JJ8
         9TXOBpk2efNAscpKV8MidBUXdRT9z9LYy/MVGIcCgATBKCFXyBjv9K6V8N0z184KwmEq
         eHSkVvq6ydq7l5OZFsRWBCGOk6q7+el5rmzYCIZoAE4D8lKEi7qACC1OCh0fjm5YM3mR
         6epA==
X-Forwarded-Encrypted: i=1; AL+hErGhfj1oHtOnhpWUaJzNeYsg/CxTnkWKI7NHfDpoIGNJDylTrMtfyixDo/1b8Y5VQ68HK019Obyg1rM8/+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zcB5lLfH5E+zV12Qr+ez8LC+g40OsH6IHcjMzsFkCAOMBClcu
	g++KeGUQr82hyHmxiLrTbcjaCEP0SmDiE2uLYZSPbVbQvTGItp6wsJT6
X-Gm-Gg: AYBFou3B76EkeXzsK+aeCicxXVCvnljyWqtXmcFXNM6Qljmvri7VTcDBgLAtZ8LlalE
	x4UlkrCIPC2r/TZths1qM2oBmgQqhRuTDMnsp7H0OgCvnvZN+8CZdxUMrFabj7ikbChVm0UO9Rz
	xsLTaNbPDJnxzTUyFWwJiTA7DT07kZ0RHEnXPY26jdmovxWvDjepIpIhA2aliLR8VTro79Dmv/G
	NLI/lwaRK36t9QMranHELtkizQ+zRgCN3g0QLaf7htaJ13LCAVSR1DrodLY8RQdMO+j5c1HDsPI
	qOaZs6d40SYocSzwmmXkqnq2ypuVapzR+FrVKpN6snMNmPmL+qDHtOFiNPAnLCFO3witdzHIF98
	1saUGtijqppUIFYPWG57GH4nsUD6yD7RGqssb3AbIfZLmTL7m+mpBvP08LKyAvgg+vTKhoDsVgM
	bKJ0WqIVVlUtsceZWIzXhlAP8U9pmrZJA4YvqqNMufoJGa+zD0mfDok1S98gSG/K4OTeZn7mqxk
	QdNZymnx9V5t8OBC7Xhd3uqI/1KYEaQutzw4Eklt8HarjHrNmwISqE6q8N3ZsPNp2AJYEn2d6v5
	Wcb1YPGFDnqnWpICp8w/hQWdSn2sL63CZJrBXTZjyxsBGqE0gA==
X-Received: by 2002:a05:7022:296:10b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b3c0365599mr1047190c88.45.1794368301885;
        Tue, 10 Nov 2026 19:38:21 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm23606052c88.10.2026.11.10.19.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:38:20 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: mdshahid03@gmail.com, maddy@linux.ibm.com
Cc: mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Mohammad Shahid <mdshahid03@gmail.com>
Subject: Re: [PATCH] powerpc/perf/vpa-dtl: use GFP_ATOMIC for DTL buffer allocation
In-Reply-To: <20261102143719.165508-1-mdshahid03@gmail.com>
Date: Wed, 11 Nov 2026 09:04:47 +0530
Message-ID: <ld7082i0.ritesh.list@gmail.com>
References: <20261102143719.165508-1-mdshahid03@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

mdshahid03@gmail.com writes:

> From: Mohammad Shahid <mdshahid03@gmail.com>
>
> The DTL buffer is allocated while holding dtl_global_lock, which
> is spinlock.
>
> GFP_KERNEL allow direct memory reclaim and may sleep. Combining
> GFP_KERNEL with GFP_ATOMIC does not remove the direct reclaim.
>
> Use GFP_ATOMIC alone to ensure the allocation does not sleep
> while the spinlock is held.
>
> The issue is reported by script coccinelle call_kern.cocci.
>
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>

This make sense. However we should also add fixes tag and tag stable
so it gets backported to stable trees as well.

Fixes: 4708fba19ade ("powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf")
Cc: stable@vger.kernel.org

LGTM, so feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

