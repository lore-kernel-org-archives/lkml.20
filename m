Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94FB445AFC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753871; cv=none; b=eTKHpQZB3TedGpWJyVpKTyFEqY4E6Iw94J6DTJ7y0mqBB9qyM06NsQu349HrzNdms9CBB4VTLT+FuLYV5uWCFN0P9D/ceQsIUye8nMHpdv+jWfhFNgzzTBdSdpPvFzFnaVFXT81qM9fe+zHxVR1dLeFKnDl44J/xwvZHtfldvgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753871; c=relaxed/simple;
	bh=AGC23GphtnXjMJTjuZKvIzgHBrkaAvob99EdJZgn52k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=t3iPkeRV0k9+FY91MJd7HHKPWXoAEa8pfrHffgCB7YP/qigvTao5bRH2JL46W/ARw82FdGxK5RPGxE8Zo1fBs+ZDhnDfOAIhlYguQ15f22C2Cl5kL7o5d3+MTBQCFD7r/XzQSk7PwMmWMlQ9B+qijkgKsTPnsQhKzgbYdYvtbvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3KUVXPY; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3KUVXPY"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f6so7506415ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789753862; x=1790358662; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AGC23GphtnXjMJTjuZKvIzgHBrkaAvob99EdJZgn52k=;
        b=i3KUVXPYLIZpzT+21K9/Hq6wcnP49yNOkGgWwXXwIl0JkdDPRDudjBXqR/jvmZPalG
         oKXnZRsxGwH6kztgjV4qGANk8YALBTta3ZWTJ0/mI/6izHp24mBNlEGTpqmH+AlIGdUh
         U+1UMeE6GAbHC60YPU5nwK/XPl6wctyTHXml7lZLKd71dmrJsqE7rk56RKxKL+VyHUy3
         APDAXBwr8VxxUNXAgiJ8jtzvETC+ud8Bj4pF+l6T8PWPzdq4PXQTsPCA/R//e6lyNOcM
         DnGMRHIYnCQOQGvZlyuQfUh1fMXfHNmfdhIvgLUTJpkeddntSkXZ/qrpv0SIDGLXzsGW
         nNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753862; x=1790358662;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AGC23GphtnXjMJTjuZKvIzgHBrkaAvob99EdJZgn52k=;
        b=tPEzxD61zQF5Pp17GYXzGybt8Fe4zh1V37XUXi8bwz7ppy9je2atvkStsmU7aTRtsF
         EHA3T5tQtKBIe+FZf12k/mvLyySLsmj2eOckOC5bxXaRSwq4VCm5AVak7nXaNx1Heeus
         xGsQrpKlZT2eqYPUU317dL6jkZDqaGIrCiUeee38qBll3SbSV7W6NTjd3/j3Ud1KJ9Pe
         SoV5CqsPlmBntrB0p+XHiai/UwpGrd21wrYMMTxIbCNQVKATqcNVEgjMkAGcsR7Wm1gT
         WWxFEwqpd5WycuFwTEHSTV7C5Eq2gS7NbyHqoAtQQwpzjMUJRDdXVYVPtUQ9g4GdtI+J
         Trlw==
X-Forwarded-Encrypted: i=1; AKwUvBwS1NavzoJU3lmbDdjHAZGQ7198o7B5Y27xafpfCQWWlZWZDsHlSf4jEJ87qrkHAh9F1a5YV0IENxA55MY=@vger.kernel.org
X-Gm-Message-State: AFuF++nF6v3sqPznBJjVBtH18gGMMDAPiED/Qath3bZRDF1HCQ4WcMrV
	7DzlFc2WXPgaKybiCmZ/iX1SMaR1kWBTKg5lRz4qaWZInqmsEekIl3kx
X-Gm-Gg: AYBFou30WrlUtaM2FBec/KDSeYAww9IznjC/ZCfEmOHfnjWPiLOD1FM0XgfJfZp/fu/
	BI32fInPnmKNQKqzIMSBmnQmUgmAa9jNEH+QJ2jYqOrJfFATa2sg3L40K6ISIxYK0qbxJyR/asm
	wlW5wGIDxLSrVrwrhh2jJg0tt/wAUCtaJzvIiO6zx9syhxrsFMc3XRW5xTK49jJCGJqRwnqO/OD
	JFzSzlSbP2hD7qZHLcs47bimV7cgx2M9fYSnx6iVi96u2nHJBIVfV0noug+7m62aTvNVCa+hzWH
	WxIDE84wleymANgC+TB8bngwf87movGw6EM7pJ7UsAnEDvGR1g5GWIJaZ0H9918ZXlutVT0qOuP
	ybtLQCDGCTnGFQ0xuXbW745llslokhXGhFC/UUqf+AIMhD5q4YwqrDtW9GQnPERcGvKtD29V3Vf
	D5E0NOF3sfjbMjGeMjPoDqMpd7u9cPT1l0SQ1enxFCe6GZhOoNfFIMCUZwzgKMpW2SUtWa0z+Vw
	YEiU8GdofW/aspvRCI2b+aojaxOzLA9w5gSO6OznidnCynY29nL1Y8aNDQkcYg6VKe9ad4NTBHv
	G379
X-Received: by 2002:a17:903:2990:b0:2dd:c053:82f5 with SMTP id d9443c01a7336-2ddc0538431mr8558415ad.44.1789753862316;
        Fri, 18 Sep 2026 10:51:02 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba719sm421205ad.56.2026.09.18.10.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:51:01 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 17:51:01 +0000
Message-Id: <DLIMSLBJKPTP.30HFFHKGPF2R@gmail.com>
Cc: "Yonghong Song" <yonghong.song@linux.dev>, "Quentin Monnet"
 <qmo@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Jiri Olsa" <jolsa@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Shuah
 Khan" <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf 1/3] bpf: Report BPF_F_PREORDER in cgroup program
 queries
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hui Su" <sh_def@163.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <20260918172407.3459188-2-sh_def@163.com>
References: <20260918172407.3459188-1-sh_def@163.com> <20260918172407.3459188-2-sh_def@163.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, Sep 19, 2026 at 02:24 AM Hui Su <sh_def@163.com> wrote:
> As a result, user space tools and query callers cannot distinguish
> pre-ordered programs from standard multi-prog attachments via
> BPF_PROG_QUERY.

[...]

> Fixes: 4b82b181a26c ("bpf: Allow pre-ordering for bpf cgroup progs")

That's not a fix. Nothing is broken.
The patch changes what BPF_PROG_QUERY returns to user space and
existing bpftool will start printing "unknown(42)" for such progs.
That shouldn't go to stable.
Drop the Fixes tag and resend the series for bpf-next.

pw-bot: cr
