Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789408;
	b=40oDa5/mGt5wk2DBpJvpaBv+9RhGgQJfmFSLEbsGfArwqfOC3Fw1pPOt68JwE/FXg/0y
	 NX8XTozGl8HjARnk+0HOLLMGn46lf+1910NbRaBXisismqTx7gSdOnCSD6gGtlIBg6Nqn
	 /ZE+frXVIkBsgU0eFkK/RFU41Q7uAiWka+YikGCoZJY4lb3PRD1Bn1/ZVoeLR0qwv6LLE
	 5rZdOYJlCsRfdBoxrZkDbC+EjEvuVjGDs3dJmCcd3fdjEij/U0EAG/BmHN28505wOLf1A
	 tmdICIBo+DhQicHgyueH6kJ6ddAAVwJEdx8KBGZ5u4zuiaKbjBM5lz4lp4e/dgh5N+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=w50lkh7YHn9snryw9lhNLJWggY8UYLvhDaLVNDzLe0c=;
	b=b4v7qN8vjg/aKlPzAPZekgghV8MrCdezBrcQ+1VOYFpr3fEcCwHX9VVjhAvKkhcl2Osd
	 UPUGrD4SpIIS2t0l8GWfNYoTvW1FJ6lxPn7Q/0Wjs27Z0RfP3+EyWuGBCVnD9XQ7x6hEc
	 CIxSbQ3isTode9KwsrCXIICW3YyOqC7rnxHtJ2aSWedylDUPVrfh2I9imuHL0mpUP/N6u
	 cSFhYajReaQoIzVzR3kQbag6Cs3XVJybkYAT+boP2RC29neJaSX+bkrlQE8WGhm2zCSgC
	 4dWlDAveLU/D/OzB6rMRCJmhfuEBU0BioK8yRuhGjhGWcHXhYXdGa4jvuG/dz/bwhtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o58LIewA;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB4606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85CB4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o58LIewA
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so5029225e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793789406; x=1794394206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w50lkh7YHn9snryw9lhNLJWggY8UYLvhDaLVNDzLe0c=;
        b=o58LIewAGYiaDgihcQh7ZiCaDAvHmjIHETk/Lgu+Hcz0VsPJP1ZUj7EZTAInf2OrAA
         bl9dQPkPpoeBrKH9ov9SYm3Cn+8QItK68zDcLQkQ8EnnLxHkYKHCA8L91uYbiiYcHwMx
         t0OXTjcECPYfsvjIrTkm3KmB2MoXyP+TEkwrT/E9cURt2ZZNm6LnfytqWuKLUswotnUj
         dBFxwvrPTJI3EhaiWTKdTXvF9rfMJrFtt7iHU0iUt4xU6y5abyDS4KvGJxZm7VouhWOv
         S8Mo1jnL84OXIjKEPTKvUrx0MbYMpPW28TQuD1abhCQXk6PsAPfcwzx1e776a8Z2HRkV
         4uRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789406; x=1794394206;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w50lkh7YHn9snryw9lhNLJWggY8UYLvhDaLVNDzLe0c=;
        b=jYXzLfs5xp69NpjkcGYbQSVNGXenK9Sv++PPi7E1WBEtrAixVKMr06ASYI/sQtwOWT
         fzRUq1wTo0XgdHoliF+NiYSiGVTVZpETAfGPNnqBbqzDvnhlGE6St8Mp4WWzRHipyI3c
         l+bWXXpGB7D1XJkJ6If380CEKep6sfXuqOFeLuYHcMDRfX3oNmh5o1zyDs/R2i55nT53
         /zaFgRAH+iffFEAAYCO4f8fqCGJvBRlX/q87W305H/7cTWRXokOdHcRQydkzbYHQs86L
         MtirlXdKcVQJ7fy0xPjRJttbzVroxAhTSlHmhdtp8GTpEii3FK+HUNWBUKGyjiYk3lWB
         1buQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6bscZIUdI4tV3CktR7nms6T+C2uqMq2TkOAF7F1iYj5B+qafQd2fKS3G0moNDejXZLtPAZ3MNaYbEQjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wpctnbJMcpIWxhlYk0eIv05Li+Wn2a77V7zvG4wZ+jjBGsUF/
	HrjnOtraqyCP5BzV+Y6a0p0O8B+Ry4bpCk9sWQqpUHg+43DV4oTzqpdR
X-Gm-Gg: AYBFou0ZvRqacoOjrQV0F+HcEuYSSbgj2i/MBMAkGklPTyunhBpiMrP7wkopFvmLnQ5
	9bB5/Zo4n54SJiOam7Xh0Nl7EWuOnliwTXHNQKwT3dKNi1nV3eFYbhhDhtPm0RUgEvU2M0ARYaK
	NzW1aRXqPEtArQArT/6NX/S4NQeox9PfVhnVEFG5pyKOvbBEofQQqztvNavGUN6SxYXMJfRygPy
	DPjCvu+ORzkfp9yI6HAwvHLn8uczpCPP9p24yTV1rAkWfGevi+AlMENSfFYO7V5N7jWnNOn4IVQ
	ktinpuguXlrNyO1m/2/QMgYxD9SLLjKd7WyvnDF9TO3kQROuDUNlZuhvoFuImiqruWj61oQmxYW
	1CR12c9px6ma0p3S4TRGn/KHzhH2SEFJ6Woonx0DHSbIiY/pAq1LRz1yaWWFDVAIy19a4orlcv6
	Cu6A6MWInyKRQEnXadYgXyjGYDe+x8Rg/EAoIZHrr7KcUnVIPWtxVJz/iwxLfYCl1A1KF/doTeI
	VR5A4vwvi/Y3EI+BTtVzAgB0ue12EMSTLITB2k5jVRuCkNPdQZlGAPW6X9P+A/2PgqdrhFCJN/y
	0fIyw6xdlUbTMVh+BmNKq4PYBCZnFXUPVJBbURfXpv/f
X-Received: by 2002:a05:600c:1909:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4ac18b7dff9mr356197145e9.21.1793789405877;
        Wed, 04 Nov 2026 02:50:05 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a555e59dsm145066805e9.0.2026.11.04.02.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 02:50:04 -0800 (PST)
Message-ID: <70686061-787c-4c99-ba5b-ff982c8cc2ad@gmail.com>
Date: Wed, 4 Nov 2026 11:50:02 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] memblock: keep reserve_mem regions out of KHO
 bootmem
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
 Alexander Graf <graf@amazon.com>, Changyuan Lyu <changyuanl@google.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org
References: <20261021211058.83483-1-azpijr@gmail.com>
 <2vxzqzhhg8l3.fsf@kernel.org>
 <32dd1f28-db55-4674-99bc-74d9d3ab25db@gmail.com>
Content-Language: en-US
In-Reply-To: <32dd1f28-db55-4674-99bc-74d9d3ab25db@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/26 10:16 PM, Jose A. Perez de Azpillaga wrote:
> On 10/22/26 3:37 PM, Pratyush Yadav wrote:
>> On Wed, Oct 21 2026, Jose A. Perez de Azpillaga wrote:
>>
>>> On a KHO boot, a reserve_mem= region that can't be revived (new name,
>>> size or alignment) can be allocated from KHO bootmem, which the next
>>> kernel boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG preserving it
>>> fails; without it, the next kernel's memmap ends up on top of it.
>> What's your use-case? Why are you adding new reserve_mem regions after
>> cold boot? I'd rather avoid making purely theoretical fixes.
> 
> I don't have one, I found it through the TODO. a different reserve_mem=
> in the cmdline passed to kexec is enough to hit it.
> 
> if it isn't meant to work across a live update, would you rather have
> reserve_mem() fail on KHO boot when it can't revive the region?
> 

ping, I can send a v2 either way.

-- 
cheers,
jose a. p-a
