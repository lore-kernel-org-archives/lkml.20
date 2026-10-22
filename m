Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637852;
	b=HxySLl/nWh7oRTgdtns0Wio7fSDz5MBdKcKnjAzr9S5uSEw/1oABQ3gKouiAstJNul5V
	 63brquO3trXy837gh9b3m/xo+mOjzugxu8gVTV0ThOYWijjT3zSAoBpho8bVzQJjZVNE8
	 cbw/WjyJUIHG3damNJmByZ2zlngs0MYCmlHe/6l8d0zG9T6glQtVIlzYZbNDu+M+iImc+
	 u2eUwyld6RptAFcBSOhbXDqVLy6xqSHPUq9h9rm4zcZBNXH8KBf9SAlAGJ2pMNjrHfc01
	 38wNeU2ymmT9JpqHLWLYqHn1AOHxv05Q+Xz7EslAbVIMI5D0UAwQbsKVO294mh0btqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=jbCDllRU5wYbKPFOhnGrl1xB/avA24qTnso9VdtaQCs=;
	b=jVsM+fTW3SHE8oi3vxCbn+4OpE6IvTmFy/YOyJaVrMcGU2nLw+AHhipF+3nSHO4dmIoL
	 YHJMohHdO1e+uUEAusVrOaoTh3WLmDv1nQ0NPUUuUOPzFUg3b3IRQdBrSrLEg8YVjeF0Y
	 3HXA+OLxRywiheYKO6oJBowik1FKuobgPmroQnnRdQIxWGbUSp3SjlddYqLA/4pD482IS
	 fsB3Gp72nBjDWKtws+dmEFyFmjY3koLf1hAupR3NTamDuFKUo3TvHHNlIiNaOKtlX6ZPe
	 Dz07CJ0KbEUNSVOulp3+D2KlYfk7fz2tiE8tuCD2T8r6EQpgKTIa4G8uXN9tg0VJPhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="koa/V6Uj";
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6437E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6437E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=koa/V6Uj
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e63ee7b4cso160238285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792637850; x=1793242650; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jbCDllRU5wYbKPFOhnGrl1xB/avA24qTnso9VdtaQCs=;
        b=koa/V6UjBswa4FuSyaK1aj7mCWWDpckd3P8cm34TWWyRP4wzh2NLGZFSH6Q4M4DXu3
         qzvnXX9HeaVR6rcKzXOZbL4uzEnVmqZL+MMzzyWUGBG2X6ItbpmKYvjiIE7ZPOD6pDdX
         PykgPTns0Qtfo8nduMQ1sHSyApXHEviCMbeUO00ZvHROPMI86Ykmx6SQl+abfVMyiKWf
         CvkbnJxDfiv3XJxFjZ82pcIdZyeNVZqTP/ETC6T9H+76M973HmqPv2qbgfT+YBQjViJJ
         TAOrklU+ENqV10WidZ/pbmFlwYkvtftj2K/YJxpRPZem9Bu3acDn5HeG7eCd8A/aUPfS
         BT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637850; x=1793242650;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbCDllRU5wYbKPFOhnGrl1xB/avA24qTnso9VdtaQCs=;
        b=nqFt9SFLKJ7/tZNxNqqBtwu29x9s0tvE9gl9CDl4YTIQASizvBu+cOXTlAOUfa4oMF
         V2sTHhcE7Fjlh0JHuf6p1epULYKc+9P1sIPhdwItRbljzUGKb7FIVShOGaqwKvbIWpyy
         aqwJ3W+5L3vkVddCS6nlBpoROr9LPTqHpBj/vF09BzkrozF99MVA1FmRWd3OTxg7e1No
         zxUkVm39yPL2ji7eR9XYc/zXve1vt2KmqRLKJ3cnUYC3NekJOZHJhk1fvWwoIRJor2+Z
         PqeVvOOzasYJKdW0rc+lfcHYQU9UtzZf3dcH08q0U0LHCT9wp1XQa5BSXp2GjcFHqyyY
         bs2g==
X-Forwarded-Encrypted: i=1; AKwUvBzVBacMpcZBfxwQTIGM/eq0ubvZWw0nIydhAyxsEtFf2QlGi+qjUC0QXw8CV+Pjka+jYvIxX6eG1abwfAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI30v5qcmXopJMP5grLb/L0mDlYz8Vb2rGvn5ijc58rZ3t1579i
	Ty+dNy/H6QA7z8cdC7huHHf9hc2rnXwOP3O3js0wvr/SlrfSY0xwgA4EzOWR33sj54M=
X-Gm-Gg: AYBFou0Zs1Twpgk6GuNggh7FPZSMUZQFvV7hZhW6SZkLSO0+hWe/sHMHEcl1S5MJMNl
	ea+Zat2eukkUWalov01TTP9H+rJhUF81Jo2WU7fYC2uAmGNUjpmLJZyItv7dgR/6Mdq9OTzGsBe
	bPZWP7yImJWLhD4SHwDPkAABWgoXBMavYHME6K5U2Ts4l4MzcjWV4JO/tBCVbUeukFxeytHjz0D
	YhsEPLliav1WN38SnFDlzaOqt6pHoOuj2z1Vd5weRxyeiLseQeIysFkJpoFPBccOzG3ionf/qDe
	bu1KWqFA28rY+frp0t50VUl8zDFm5GQiuTtOeaOqe2EYsB/W7rRuM2lbcsyjdoPs9EOq5qoPYFg
	t8SAS93S/MOL2lUEtG7mKyiIByPjI1oDxHsXl8VC5dFmcECG6fPJrq9AHTyMbMD7/tOxt8A6IjT
	pp3NbvT8zupU1psIVVNfX7FNCgO2DLmsdc+4yRXTnJ0OFTJWNlz+FUP+LeaH9FhFL4fpAByJMeg
	2ua/1uo5P3/fjy844VKxSGw10St5QDCCYkBZS7HV3RABQPMJwC4E+gZVRhHKYzszQzvrsUw3EUB
	wokeaFK1Ibiohjz8684sYYY/YrE=
X-Received: by 2002:a05:620a:2415:10b0:93f:5cc0:5978 with SMTP id af79cd13be357-93f5cc05b2cmr353949485a.37.1792637850409;
        Wed, 21 Oct 2026 19:57:30 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e30610sm406637385a.43.2026.10.21.19.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:57:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH bpf-next 3/9] uprobes/x86: Finish an unoptimization
 which failed half-way
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
 eddyz87@gmail.com, memxor@gmail.com, oleg@redhat.com, peterz@infradead.org, 
 mhiramat@kernel.org, jolsa@kernel.org, akpm@linux-foundation.org, 
 liam@infradead.org, ljs@kernel.org, surenb@google.com, david@kernel.org, 
 vbabka@kernel.org, jannh@google.com, hughd@google.com, kees@kernel.org, 
 mingo@redhat.com, tglx@kernel.org, x86@kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022015712.1297331-4-alexei.starovoitov@gmail.com>
References: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
 <20261022015712.1297331-4-alexei.starovoitov@gmail.com>
Date: Wed, 21 Oct 2026 22:57:26 -0400
Message-Id: <179263784614.2549665.557126403507804820.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-22 01:57 +0000, Alexei Starovoitov wrote:
> From: Alexei Starovoitov <ast@kernel.org>
> 
> int3_update_unoptimize() restores optimized nop10 in three writes:
> 
>   48 8d 64 24 80 e8 d0 d1 d2 d3    lea -0x80(%rsp),%rsp; call tramp
>   cc 8d 64 24 80 e8 d0 d1 d2 d3    1. trap new entries
>   cc 2e 0f 1f 84 e8 d0 d1 d2 d3    2. restore bytes 1..4
>   66 2e 0f 1f 84 e8 d0 d1 d2 d3    3. restore byte 0
> 
> uprobe_write() can fail with -ENOMEM, or with -EINTR when the task is being
> killed. When the 2nd write fails the result of the 1st one stays. Byte 0 is
> a breakpoint and it works. But the next set_orig_insn() doesn't find lea in
> byte 0, takes it for a plain breakpoint and restores one byte:
> 
>   66 8d 64 24 80 e8 d0 d1 d2 d3    lea -0x80(%rsp),%sp; call tramp
> 
> Nothing recognizes these bytes anymore. The process keeps the call into
> uprobe trampoline, which can be unmapped already.
> 
> Teach is_optimized() to recognize the half-way state, and let the 1st write
> of int3_update_unoptimize() skip what is already done.
> 
> The failure wasn't reproduced, but the state can be made by hand. Attach to
> nop10, call it to get it optimized, write 0xcc over byte 0, detach.
> 
> "uprobes: Don't sleep on mmap_lock under dup_mmap_sem" needs this. There
> fork() removes the breakpoint from its mm. When fork() is killed in
> the middle register_for_each_vma() removes it for the second time.
> 
> Fixes: 554ba38456da ("uprobes/x86: Move optimized uprobe from nop5 to nop10")
> Signed-off-by: Alexei Starovoitov <ast@kernel.org>

This was a nice read.

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
Gregory Price (Meta) <gourry@gourry.net>
