Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471411;
	b=cbgpaOVIb4eDiIa5SJt39MOPArTrpJgo7S8pVRekMb6+fF3HEC5OpPFtRpLDYsPym3R0
	 1FOKX80UFTJEBbmhHFpjAWwTax80ahxXffVfd5W9iIdcAyaZLyBZ4E864CmqTYnLBnEnr
	 YuKXGPURiB4p7IXRXGFPVat8S2B+h6S5jzoRtpphShynpt6/qHprLwraSOOojFF0oPQ8o
	 kGK6ljF+NPL6rUApK3UGsv897+mfbrMxjmfb4QJwKkzb7JLqYdklzTlEs3POIFK9b0KWs
	 l8sVw4CMFIN9f/1hicIVB0JOYfOV9SWivEfrchCxCNF49ClxHMqcma9fbM4rNWOuoPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7a0tlXjZIjM2y8jRkqPsXOqBGSfZhqpDFXwLVtg4q7g=;
	b=HuNRkZUu8IqmtoPewh/uZrplDeBSOOanr05PLjGL5fUAsCPZtzvXQCGvRHNdRSt0osC3
	 OUbW66QMUi5ZWGnEN1lDsVFSyuI46nrGavKzxbGnMS9JE2DY4UI3BYo+JoUdANz8Y7DUh
	 +oiCuAgRn6U+oUI9W8RD2XA3onimu4ncv8tcDn2Xyk1OokvGEc5r09Vf1lxVc2MsnJ6D1
	 HJL7+npb5gyTFR+jVJ8XBnuLU3fC/qdsGYrsV971oHruPWvsuRQBPc0tKGgvfe0yxp0mU
	 QshghKrJhFlg+4TG3NJVbdN3ms2gLsPJOUKdBADG9/+ekZx1i9ISSIpgmm5effsUHHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoPdHi1B;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D2B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D2B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoPdHi1B
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2eb0f1b592bso15432785ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471410; x=1795076210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a0tlXjZIjM2y8jRkqPsXOqBGSfZhqpDFXwLVtg4q7g=;
        b=FoPdHi1BEIGYGOBQ8jpJJIMmkvpoD/bZN9zxseg4DWxtKOIMnkgyW2NgswJLpCTZGz
         p1+TfM59lcC2EW57qxPryBMIphXUQabOQu4Jx3o0cQEA5eVZW+q3z4oJDaTU65prWjun
         xPePBDtG7BRbz22ciNdE54qMSG4epM5qM0kXyzzkDipV444UesJJDbPG36nehwmBBehr
         XpRkNix741MvHry8gMqmK4NqzYLWkh2hZ5suL84EPYn1Fx0TkWq1AU+EG6SsbPXWULUX
         KOumUjbA6kskBFStVoYgOt8c9Gmi/rcShFFGhETqGd0IDRbejzeHrKPwCPTnsu1EVgph
         a86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471410; x=1795076210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7a0tlXjZIjM2y8jRkqPsXOqBGSfZhqpDFXwLVtg4q7g=;
        b=H7TNuKskoPmRGIJMkKjVkiL1iaqwAi2gnJZAHk6PeKn3soQirp/+AMx2jNlQ8UA/Fq
         gFm+88lrMWuyxP33DcSfVCAINJo6gW/FHCWkqy1cV+lEFEO6HVK8hXdGbNzjcbWmHQRc
         L9ceaNdIXczmssAqAdk+0rfCPMLTv5rbzJHJQTgRRfAzARxs2M1PyZIHQ5GRYfKzPg+Y
         Js1WbI4ZyqXciHJKsLFdmGkvwb0sbvhHvR2fbVThNqOb8JBVaR3lC9EOOLi+sy6IKVDt
         s+yDQcIgWAoygV2prpABo2aZr4UnYmhipHqDBu8Wbch0Ic87l/rKsjv95dWpGXkaYt6q
         8bzQ==
X-Forwarded-Encrypted: i=1; AL+hErHqgdHg4tlknlbFyFSecmAGdiBrJyGMbw2ZeIaKqNNvPRyGoPRMWUzcCGlddb8upOEmolaCn292DUa1Qcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z83uIQVWZWvRaMbhI8AGU6cHjS6GuIKocZH6O/rVfZJw/bMIDIk
	oWCojWCUYK82TZ1RtFxv4OTePwziyFsbG8W+arQevviO6V4aWUCizvdZ
X-Gm-Gg: AYBFou1NL2ciAWADiDbvdwqS9BuMUurSTrPOMaubz6qMqQLk2DJqxVBsDd57n6XlOCW
	rJ1DTTstQ4/ZkrVC6UOwIV1398v6fTxA/T/PQ0sFR+KkdZEy6yqqd2QH8vh2zPLUarqFCAqAYQK
	C/AbeOyDP5aiTeU23vmn18yXAg+MNr/w9qgTdGxgdbmaTKuLgt3TvhqxSC4N49Pfi9vM9VoH0zc
	sSQQJfAAjO2QbjLz4v3bgsGbCuXopKP10YFiKHzAkCSxp0PnknwcJzEBAQpWLk55gutQmRzIZjI
	zcwz1asp4ORuTIB8kW6ZMCgrTChD4PSGmtoOUlsOm0tMrGonwSRCEvkjSN2nK+poKb1q77yA4NR
	iIvqzUPMBDTCRuQCJtyEhtxMe1iut7hxzlqq6zjeEnDiwVBmLLEiOVtN/CoCFFrSkHmclAwlWL+
	PDIvS84kBWUprcVvdUofMlbZFmBEXHW8zK/xe2cAOBsGxogAjTtIAZHEl2Ije9HeEVlUWzAxZfo
	ZbDvbQBOMr2aGZiKpxq0olNfdLnH16bHeBVyFzeub3dbBFyg2Bf9COQULndWAeQ00Cxxfy7Sn0d
	mttyVnoLuJYHqUbOb3a4uCEfVGa9Bs6BAvtgLiRz7hXHjU5KOg+oHkWvc+vPakD49EN9lZvCKjG
	ffZbkuOF4
X-Received: by 2002:a17:902:f707:b0:2e5:38bf:cb43 with SMTP id d9443c01a7336-2edd7432537mr55445995ad.2.1794471409521;
        Thu, 12 Nov 2026 00:16:49 -0800 (PST)
Received: from thinkpad.tail59a646.ts.net ([112.199.224.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4dc3bsm29970705ad.17.2026.11.12.00.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:16:49 -0800 (PST)
From: Hang Zhengyang <hang.zhengyang1010@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Andrii Nakryiko <andrii@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>
Subject: Re: [PATCH] uprobes/x86: Emulate ENDBR as a NOP
Date: Thu, 12 Nov 2026 16:16:42 +0800
Message-ID: <20261112081643.3983403-1-hang.zhengyang1010@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112080406.GA2668804@noisy.programming.kicks-ass.net>
References: <20261112-uprobe-endbr-v1-1-284a47a5ae3e@gmail.com> <20261112080406.GA2668804@noisy.programming.kicks-ass.net>
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

On Thu, Nov 12, 2026 at 09:04:06AM +0100, Peter Zijlstra wrote:
> Uh, no. We must not allow uprobe on ENDBR. If we ever get userspace IBT
> (people are actually looking at that), then putting a probe on it will
> make indirect function calls #CP.

You're right, I missed that. I'll drop this patch.
