Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD33558E2B0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986551; cv=none; b=T5GMeSTrLL7fSXeoQKJaqn2/QsFqLfOFE20H1wZ1VPM1wcMLP19Z1gpMCy3vnf19V0cuKQQ5jk224CZweM+ShrKfrVy8jOpwr1l9WN2T1iWhg3wZI8vGWBbal04Un+t19esdnZeyYA01Cle4QwLuB2WIM8ONt22AccDhSkuOmzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986551; c=relaxed/simple;
	bh=4QK22JD6oH4SvxZHmOyYQJJkExZcrvgo8YM1Io2s18M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=A13Cn4+5vOyqLh8P4G0oZrF5FO5FCv2AeEU+ajL8Kr2/K4X6uFPDsLtF9Va+Fqifog24jYpwTn1JtPUl3OXQ8NU/1qN0UNTOo0AUmPwO/uyTxsFRkAJSKNvXRnlRtTPu4zvfhbIXjCeeo7Q7cjQCnxPCMYJjzD3ecjQ1+2wbqME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLL5rnvK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLL5rnvK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so6331949a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986544; x=1789591344; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oN/gqs4AWaGEOYc4NXETn7MgtPOtvKlXrZlfFK+KbqY=;
        b=rLL5rnvKxJ7bimUEcTFKJMabTEqZECh1pV/CVR3V0vpTtduiuEKKDH14JkcVkTV45d
         1X3JNvE+5ko7Ihvn8ahXUTqh0ngrHVK5lGNB80LtJbLAepPvIcFM1JmR7W9/JzK1UN1F
         QC+5ddYNQhk08DFWGt7G5OQaH9Um3qRp0mRQrHHmRFt7qa8UGAFah9fq/kLcOrB6CCXS
         K3m/RvXf9GUkV0CAhd10bPKJeQQfoPS/bl961dDJcTFxHNdMW7YgaW/VsHBK8wB5jo9l
         5OM4Yn+MEKIM++DCpv9cDPEnmF631Ws6RY9dWAaTFUE1h13FdtksuMFYg0h4sKT5NAoO
         vVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986544; x=1789591344;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oN/gqs4AWaGEOYc4NXETn7MgtPOtvKlXrZlfFK+KbqY=;
        b=edv8M+TuNTZmpBFJoLmAzePHGyAIJA3FwUvIczNM/jbHrCLvXMGd7XTDqkMwbsPtXd
         hoy34+GQAqj611hQZKo6qTRm8GBGtGl22sLqKnv2ntlv+sXQ+eTO3dmDG/5CfQg5lw37
         J/YNAos95rHdmvwJOK/dcUbhSonXoIV754IOWKi4F+CSdUzKECK7bmiey2xBn6GkXGcf
         +2q0rldB7pKfBzqXfh887hXEEbbQRyoDG8JIrpTXmFkAChTmX+7z4fR5nb2vWSUFZ0Ci
         Q4/b1VBrdpqaJ1IMCeTbfilheH+bNFBHFMsQpHEzoL/pFsNQE/u/XkKFSKeHzW6RhfDc
         ChcQ==
X-Forwarded-Encrypted: i=1; AKwUvByqRhSgsPnEXJO7ZpcUhFV0Zy598d/4q/IfXuZa93eOrU2qM2tkE4jD3EaZwfS5W0nf6g0fqTcxe5rYi7c=@vger.kernel.org
X-Gm-Message-State: AFuF++kdBq2W8n2n+cvT/pFFGeHbl7d0ems3NH38uc/LM6LL+P7kOm3V
	xcBaLgnQrqhyAjZqs0sqTpwJzIJUldx8GNxYJ7x+AGeRlsyfQkqb0G8y
X-Gm-Gg: AYBFou1ySgCo0fSsIcB5wo/9astExgbRD83wGovTqZcgEMw/oFN35tvmEsM1XubM32f
	vm+ZdYm6b9IVJDyvLX+xnEp+j6lI7lYAwvQzCSAFQdLoDNU2dpxLYsJw1MtTdzh+KH/bLlo4Q0b
	KjDh3RnN2eBvor7IhiBFiDWWpEE2Iee25T1dFZxxH962UTinZoibU5KNzf9ROCZs22xExhamm8a
	P5Qx+Uv5UMUcjQ4I+HU23jPx8PjJ0ccTyDbT60CJLn9LLYO68gRujm9EvFLYoSoReBv6Tdyqae9
	xVbO9hhPLYz7IAMn7cBsxvfeBLanfbjHzMB/9oEFNahETlqBLwcTUihZGxkoPkPyuuzefJw4eQt
	R8BP+XfUhBY/2clIEFXSLcZKOYhL8XhSKdD8FClbJMPUTUca5+TCfx33/kAJvQ7IzOk3p0LTskX
	V1ompqtDbscP6clXztafjsVPV7vqV0wUlsRoGrW53OPoSaty5kAZPxXWbJsA+PpsNYwwtRfyksL
	l049PACyvtNHcTlPmNB8WPEf2H+/atyJq3Ib6G/cMqZl613FgjbOCHgIECsIUua9d/RY69084Xy
	LDT+lx1Uo/Cn+LbjdWvXTE0aZjIuoPLjk88ZR9RmnullhqTKdkkImhAbMbbilO0ggBLpg8gGNtP
	WYqDQNHE8vXJWbJU04ZDN
X-Received: by 2002:a17:90b:578c:b0:398:e6b6:acc2 with SMTP id 98e67ed59e1d1-39b261e7649mr58879248a91.12.1788986543953;
        Wed, 09 Sep 2026 13:42:23 -0700 (PDT)
Received: from [127.0.1.1] ([43.227.225.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770a010dsm1270437a91.3.2026.09.09.13.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:42:23 -0700 (PDT)
From: Nikhil Ludder <nikhilljatt@gmail.com>
To: Emil Tsalapatis <linux-lists@etsalapatis.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, horms@kernel.org, dsahern@gmail.com, hawk@kernel.org,
 razor@blackwall.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf] bpf: fix reading neigh ha in bpf_fib_lookup()
In-Reply-To:
 <CABFh=a7Z=heZODVsXwisY3VwULDy-Rq1hwO09exgX2d0-KzgUQ@mail.gmail.com>
References: <20260909024011.1252694-1-nikhilljatt@gmail.com>
 <CABFh=a7Z=heZODVsXwisY3VwULDy-Rq1hwO09exgX2d0-KzgUQ@mail.gmail.com>
Date: Thu, 10 Sep 2026 02:12:14 +0530
Message-ID: <178898653497.1776876.10402414041023036972@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, Sep 9, 2026 at 1:18 PM Emil Tsalapatis <linux-lists@etsalapatis.com> wrote:
> Bot is right wrt possible lockups, please adjust the seqlock
> accordingly. Also please
> add your full name in the SOB.

Will fix the SOB in v2, thanks.

On the lockup: I don't think it can happen here.  neigh->ha_lock has
exactly one writer in the tree, __neigh_update() at
net/core/neighbour.c:1495, and it already runs with softirqs disabled:
write_lock_bh(&neigh->lock) at line 1384 covers it through
write_unlock_bh() at line 1524.  A reader in softirq context therefore
cannot preempt the writer on the same CPU and spin on the sequence
count.

The same pattern is already used by the other lockless readers of
neigh->ha on the tx path, neigh_resolve_output() and
neigh_connected_output() (neighbour.c:1610 and :1639), and by the two
recent fixes this patch follows, 57549ab90791 ("net: bridge: arp/nd
proxy: fix reading neigh ha") and b824059a673b ("vxlan: fix reading
neigh ha").

Am I missing a writer path?  If you would still prefer a different
form here, I am happy to respin.

Thanks,
Nikhil
