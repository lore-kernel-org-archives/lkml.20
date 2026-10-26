Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793037110;
	b=Q9vRKvIn94sWSl8/mU55KEfkpKQyuI+Zjveow5V5CHip9DnVyZbyeYwluUyU11/dcIGB
	 /5J+Nk8Jw1YiU6hEYPzPGEEigqnTvPXX01YG6+ocsoJC2cHIK2rypHzTR2EUeagCUr07J
	 vlff44Bcd3Wp9UbAAg+abCN/UIdfLvZlL6F2XkJyP+gUczGQgtAQSEpnWNvFFQl9NjVVi
	 r23I1qMa8ggAQGWAlNMRxeppr+Jsla3JXHvCuOvhTxqAZb5XhiydC5y0VBJQ0sGbdS8Vj
	 sW7d0v2gKMyE4jRL0/yYnmnl2imIubyaNjVQep/QpmGaw0Pz45wf5S9H/e7+RWouOAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x5IoPxKCD6gSAuyfPampTFdrhWai9Fe21YmZghCUFXg=;
	b=hAT3hUIroDJ83pg7FWR4QDkmyCGjj+9xeuGqDLT8pLCtBKjH5l1cM4eD3+1FwkfjCVEI
	 tjFXVBoYP4BrET+nnHsCQij7nr7QdhW3WjBj9Lhk4x74+qdpaM4OMTZYYDDQflru74nqX
	 8qhHCXguye7L8Wh6tYl4C2SBl7P6AiPMOiTFICtAw++1WoAagSD9LMhOgV3y2k+O1lQRL
	 8HOGeWtm4r46dp1N1IZg7llYEN/fSzNyhtC5ZsWHCDoUG47W9jGkb+sRunJ5FdHa+UTiw
	 SbYgDNGGsEfdfNp+Rw/QU5IeXacNGa4DgstFTEZzwrIILxB656Ygyo7lrhP5Ceqnx/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PLrFlcyt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6DB606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D6DB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PLrFlcyt
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so1255a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:51:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793037107; cv=none;
        d=google.com; s=arc-20260327;
        b=e0KY+/O8aNF8Uvr7rh/g83HN072kk/z0BUNlfPzYCXbCT7z1yW78qe6VnkhM5NS+Sb
         I4CVnMUUMOYdWkcoPxEf+qZTh7/0ZKVxqRZPKZjAER9yhpb7kpivguvfp9WO2dBlT/dS
         dy4YG2qOLBqHn/Qlw2Jl2NPHWT0qTPZw+7nBCpQO1oYMweAdn8l26dujfqARYoLmJI6y
         ol65Pi6ptMN+AJnPf7c24f0bXSbxlnc9Q4Q14Ih1h6IaMfjTLpbTq7Euvl065N0KCV/1
         Eb1RNOMlSUOpTNhTcaPhA2p7tNabBPXe/JKAJx5x/JmApjyUdN3lcp1Z1tQcGI/pmDMt
         BctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x5IoPxKCD6gSAuyfPampTFdrhWai9Fe21YmZghCUFXg=;
        fh=ookGQR9QpDQHoLaBhjTSTo+90OKcO3nSbxfDmHe7KO4=;
        b=Cp5bWxzwJpDRSNTow3j4QlkGMgfmSGURqtUDlWr2h22h//2pkmESOxOYYEVpvgW8KH
         MrQ4rxPVi5i9+18RmH7SEvUJdKbdtRZPlrDiLPW8d2HiQ6u7JteRun5mk97u0jFx44YL
         8AM3me503377MS+UvwZTBPdQt+4QOMpdzM3H2SnDITsM1/yPSfXXfnJKwpCUFJ7wY3zz
         PEBNEchnz6d4h3WS4sQi7/TaqfChb2vSPLCwyzQKxS3eOCRjYTu+3+hbDV7VGdpIwl2Z
         iKrtVk3U1PkoKVL0RgX7kXqI6twxtAXA63f9H6FcpbrbqZffcqeSZP0354y+1VXmGSMh
         jclw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793037107; x=1793641907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x5IoPxKCD6gSAuyfPampTFdrhWai9Fe21YmZghCUFXg=;
        b=PLrFlcytHLhsfFUTWuDHcrUInlXtdj+Bn8sw4p/4CVQcjYe8HCudqWvzQ6wsbPYSP0
         K9b95dZ4gs6sUyI5I0vvSs0yEs5ttR+r65Oy63q/A0Rxrs/BYZ/115wxKJIhvPzM81D0
         M76oShiHIWiE1YehZaPK7d5w5d2Ra1+iGvQZEyasiDrZQkeIMKbH7a2744pEAsN7CNeg
         4DTzhijonK/RwDggd0T2MS6Mq6zY8Vdj/kD1OWigfQZsX5F3JiYv7EBIFWoam7Vge9bB
         bsiJQZeAfm7jTYb9LY0egWFKv70DHny3bb8/MGACF8IDPYC9yGa+5SUYxNWaVLEVQJQ/
         xcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793037107; x=1793641907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5IoPxKCD6gSAuyfPampTFdrhWai9Fe21YmZghCUFXg=;
        b=hi8/+hIGDe0BNshnbZSbOfaDY/mmeMKwwjjxnGjZfCPZlcpIe+3kzJpY5S/7Biy12q
         ROh6+cB4JQRpTiFnySqQ5CfwS9UOP9HaEPtAo1a4kg8phxRnGmeyFukXkci6Kmx9dZ6P
         LYo3icwaIh/mYPt3jm27yExAZZopBsXDZa9tXOtLrAjEBDYst/TlWwHNabOdYlAnxKTA
         IVBe9lPYP3c2BjcXdjU7YtOkm3erCHd/apYYm2KjQGHjK8UN1ViURC0JqaeL7M/wfEQ+
         GP3eqgplZNbRXoIkQ9z5hPC5FLUkytFiJd6lDknT38YgvyRIu6W6vwCAG9gYyHon5aym
         l6rA==
X-Forwarded-Encrypted: i=1; AKwUvByQAog5Fr+XHmLfk+ogBaeqW/+COXfP8/QVW05snaFL3AQunh7hRs3jObbaGbpPQbwADOTWVtcBvIPGSQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBTQRaERXbL6KSEGHvI9q5xS1pSQ5hnhOzxCBoptoJ/LHjZaoq
	hXRdrMNNO+jCS0qDIBDCuxhxnTwuCIMFyrVBG5Da3K0AySU0BHANYBNNVBtANIooWTGAG9/S9Wo
	V5ClhMH2UoyMa2eDVBrMkWEoMHWboNxdAWNbwf489
X-Gm-Gg: AYBFou37O9OhvsLoHkMDJtIuZt7DD2ELdptk5NcsjvAHmsk4KLIQu6mdjB4/YSOmCqa
	PJJiy0Dr7KHsShaGZ8ChVe3lP3kQll17WZNlEEXQexTvS8g6piZFeGtQksBFTQaXzv/1JiPmGZw
	pTYSvY27LDKRrpyF80Nx3Vpe2sYoG96zOjI4L4MIvdVec6oqJ5S2MCzhWmrmaw5hKsLAfmn4+g9
	JimFVVZ4I69xVwVc9FuolJI9Pxuq9BBYO2Av9cPLjGZrMb3XaTjDwJbCUslYuwyM5DkFhqL0N5Y
	o5nA0fFtE+MMkNHRXmB29tDZCnswHVjQYTQt/2FOsvlbpn2ZOa9nvwMlFtOI2JjhCj8eN/ln2Ro
	C2oXrxFNJOTeq3HBnjcG4EY8LBJOQ9luTdJ2SjA==
X-Received: by 2002:a05:6402:486:b0:6aa:128c:36ad with SMTP id
 4fb4d7f45d1cf-6b47c31cd5bmr1422a12.10.1793037107029; Mon, 26 Oct 2026
 10:51:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026041838.941-1-ravi.bangoria@amd.com> <20261026041838.941-3-ravi.bangoria@amd.com>
In-Reply-To: <20261026041838.941-3-ravi.bangoria@amd.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 26 Oct 2026 10:51:34 -0700
X-Gm-Features: AclHuK8ntyEgwPTHmatXufpHpq3GjNdwMAlW9fpSt7ft02yt5TrTtwxApDC3KgE
Message-ID: <CALMp9eRMNVHMtbN1U+X7Cdi0hvvY1nHZPf-kPZtFP62ND3jmsQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] perf/amd/ibs: Fix kernel address leak via
 REGS_USER and REGS_INTR
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Jayapal Ashwin Nair <janair@amd.com>, Gennady Kupava <gennady.kupava@gmail.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, x86@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Santosh Shukla <santosh.shukla@amd.com>, Ananth Narayan <ananth.narayan@amd.com>, 
	Sandipan Das <sandipan.das@amd.com>, Manali Shukla <manali.shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 9:19=E2=80=AFPM Ravi Bangoria <ravi.bangoria@amd.co=
m> wrote:
>
> IBS hardware captures a sample and raises an NMI. Since the NMI can be
> delivered with a delay, a privilege change may occur between sample
> capture and NMI delivery. Because IBS only provides the sample RIP, the
> kernel records GPRs from the NMI pt_regs, which may reflect kernel mode
> if a privilege switch occurred in the interim. This can leak kernel
> addresses to unprivileged users through PERF_SAMPLE_REGS_USER and/or
> PERF_SAMPLE_REGS_INTR.
>
> Fix this by using interrupt regs while preparing PERF_SAMPLE_REGS_USER
> and PERF_SAMPLE_REGS_INTR. With the change, when IBS samples a user mode
> instruction but the NMI is delivered in kernel mode, PERF_SAMPLE_REGS_USE=
R
> will source its register state from task_pt_regs(current) and
> PERF_SAMPLE_REGS_INTR will be omitted from the data sent to userspace.
>
> In addition to fixing the kernel address leak, this change also ensures
> GPR snapshot consistency, which resolves the DWARF unwinding issue with
> IBS.
>
> Reported-by: Gennady Kupava <gennady.kupava@gmail.com>
> Closes: https://lore.kernel.org/r/CAPu-DQqF0aF6=3DGS8Z6KKWeeX_V5LiXeKU_rJ=
QZC+uGg8zuTPNw@mail.gmail.com
> Reported-by: Jayapal Ashwin Nair <janair@amd.com>
> Fixes: d29e744c7167 ("perf/x86: Relax privilege filter restriction on AMD=
 IBS")
> Signed-off-by: Ravi Bangoria <ravi.bangoria@amd.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
