Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA77632
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643489; cv=none; b=Fo3YMepRGS8HMusEI5CUE1phaLOl8WheDnji39vQUbIydRC2saWVmn0cTMtJQA0dgo5OzXRcn9ho5mrGif3tl8DKXXGbgqVDAZljj7Jmc6f0iiZfvE/G5nhDwegPgQfnu2HrPvW3U2fmL3dh8cvcgbfKQ5HmkLQkiwVgqZNw0Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643489; c=relaxed/simple;
	bh=K6rejY1PiyjrRi5fjv/FpvD2GeFIOd/rznJ4sRh5qGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGmiTl5GvwlHYIkME49/sE2NlF4cHbbf6MHQST8YylaurKQTaL65uRvf0x+fva1Eh5sAiSYVks2Tqxns0C2hg99Rat7TjpltY/UkB1GV6NlGADxl0NpjET2AdmCa8fwiKstNyDBL73971sjFFkxck+q0p+ti7oqoS3V2Yrk1giY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFwcXpPb; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFwcXpPb"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-1438cb9b3a3so2353482c88.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790643487; x=1791248287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E22AfzmQFmy3baYsl/FqRMEYfQ92PfmP91jOLK3cr5Q=;
        b=mFwcXpPbdcJbZCdCtA97yvmNWXETu05Y05f1k1U2ejJwZItKgnWvdgfm7gQ5YncbVu
         8DmtBbGew4JUYADXJ3KYuWiWKS3yDnJdtb52IhOiBVS/8N2YOPe/ZKWnEjoXzmDFe54R
         XZNtEM5u7qys3FlcTzvy2akkyDGccWzUvMLpV4XFXEJDO6aVvsEwwUXiaWITZh6jSxUr
         PBgP8BLxJPQ0ftDNdl+SO4tPR8t6pqvgt/2aFTJXQixwBYC0sK/dDwz85T8qHS2aGDe2
         5l8NykwxZy1zZEu12PUkoatMuxbla1wHa58I2hj+CxRuvUES0MuGjkQLs+gIsGmIt0Q2
         FrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790643487; x=1791248287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E22AfzmQFmy3baYsl/FqRMEYfQ92PfmP91jOLK3cr5Q=;
        b=LOPWYU8Bz6C38ksowl5EEe6qOOEyeGuCN4y12JocHcktZvUkKXw3ozLFWX0vECXAEK
         4FD0uXjH4MZGWyrpifBiYNpz7ecBLF8yV3yylCj2MsLYknbBOiyV1/ZUfNYoUAapbQUA
         j6lJlrLrm502x3x3lF8w+v5Ak8PfzqfS73nM+tSyFyLgrrRtv/PxDUkSFRMwObbd6BXe
         LcL18AsQiMihTh+VkwJUAT2GU7D5Fj55N3mkueOAOkqlfXYkVRqIXm6AqtTykrRj285V
         JYdF7wt52qh99rggDFP6o2EoDamg6vzAGV0whgvvFq0iKXsvAjOxz+12UQ2d4cPOtobU
         Yd6A==
X-Forwarded-Encrypted: i=1; AKwUvBzr51cLkTd+zoq+fSflWNJuSVOVpXHhWmGqQTqnCf0uJpm7NRokNvx9kXyAX3F3bfpHCT5MUPQ7HQ9u74Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mIu17KOd2MUGLXGs09wmi1iJDWNAMAmX6M/TqOMAS9eoh+HK7C
	kRYKv0wV/XSdgVcYwboMM2PN7fRvCdSidS7LJnqNZ1sV5kTsadqb9Hco
X-Gm-Gg: AYBFou3MbYsZiFB1GRtMjgkFlwHYV038Hkkku0cKfe2VZEtapPcAnNZFc1Y8lgmV52z
	HFOykY4KPwA9mseAfep6Gtw6FpwbjpV6GFvvTtDuX4QjiUwu0Q4O8N96oj/LTmz7cRF5oJA4J7A
	DRoXkgXrTG3ji/ZOxeQwppbCM7Nz2rgmSwfYPBL01U/9/9fvW7hSsilZoRI4MjioCFhdB50S5DC
	FJgAb14iXXE6HyUvqtLHzfeofDDcW5Y8DwNBZzJPc63dx+LsHlYZ2EKgYUKuf7iqNBw03j1ZLLv
	HwvXT1OV1jYfXGCMKDPun/uGDcUZ5zFvu+ZuwWuw3fC+e5Vy+UMBn8Fuk+VwCJG2pvbtdJMutIu
	4i73Icx56hu3ZbUxJG+y7LOkeAcTswDTzfCYp4NttzsUGelIJo/Ocx4Zw0fjMk+bpXVXt1IBjyA
	CCJRMAiWcFqw01RZ45PJlHT8+JvqZLwV9NNHJ4VAGl4KOwxp8z72TOlwQNeHqJhyquMw8Rtyx22
	d8=
X-Received: by 2002:a05:701b:231b:b0:14a:5284:1bf7 with SMTP id a92af1059eb24-14a52841df9mr3805513c88.14.1790643486645;
        Mon, 28 Sep 2026 17:58:06 -0700 (PDT)
Received: from wujing.localdomain ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145aa0cb6b9sm25673546c88.1.2026.09.28.17.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:58:06 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Wei Liu <wei.liu@kernel.org>
Cc: Qiliang Yuan <odys.yuan@gmail.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	linux-hyperv@vger.kernel.org
Subject: Re: [PATCH] KVM: x86: Clear CR3[63:32] on SMM entry from long mode
Date: Tue, 29 Sep 2026 08:57:55 +0800
Message-ID: <20260929005755.64126-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arqvqW7g72AnVsLK@google.com>
References: <20260928-kvm-smm-cr3-upper-bits-v1-1-138f52dd531e@gmail.com> <20260928072534.1987-1-odys.yuan@gmail.com> <20260928174243.GA3705413@liuwe-devbox-debian-v2.local> <arqvqW7g72AnVsLK@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 28, 2026 at 10:42:43AM -0700, Wei Liu wrote:
> Please share the Windows version from `winver`.
>
> My colleague said that it had been fixed. Maybe the change needs to be ported.

Windows 11 Pro, version 25H2, OS build 26200.9457, with WSL 2.9.3.0.
The host CPU is an AMD Ryzen 9 7940HX.

This machine is fully up to date through Windows Update, and the failure
reproduces on this build, so the fix does not seem to have reached the
released builds yet.  Which build or channel (e.g. Insider) carries it?
I am happy to test it.

I have also filed it as a WSL issue, with repro steps and the SMRAM
analysis: https://github.com/microsoft/WSL/issues/41709

On Mon, Sep 28, 2026 at 11:19:21AM -0700, Sean Christopherson wrote:
> Ya, I'd much prefer to get this fixed in Hyper-V.  If we need to carry a KVM hack,
> then at the very least it should be limited to when KVM detects that it's running
> on Hyper-V.

Understood, a Hyper-V fix is the right answer.  Since current released
builds are affected, I can send a v2 that applies the workaround only
when KVM is running on Hyper-V, if you'd take that in the meantime.
Otherwise I'll drop this and wait for the Hyper-V fix to ship.

Thanks,
Qiliang
