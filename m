Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793552644;
	b=MbBOHjCrnOFC2yhTIQ7bi7G+RCbX9UDUh9qla3vuYrW3zdscASeWipOBR9d8hbZWC8cS
	 0AqBcjTySWhM3Dp28KLHx4Yecvi0nVuxzDm0nvFHBhLDlNLqMRfc5vND1KSpDl7VT9Fy0
	 G56bPfzkV4jxUFSiuZyZkgCFRzE3V7OHcUrvf0Xk5aKtoIbM3yCzV+2H5zveDOUpGdOux
	 EPyUN3LUT2y0W8ksO21GLRT9tWfTtfWtCIHRLvy34VxWkDY1xRBI1olBfEVsMpfQ5+IiS
	 hmc53rK3cAs3AdSytTDlWVgUze9liPFfGIDO07BZOn9lVu5TVfiKnnP9v4vY6/zxk0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=wz41j4zEOzVaV5OmMHgkOlnT8oYTQIPs1Ouv8G5yhhA=;
	b=jew+rpH9fUkJBuaQDq3SK+BFWj4JWBPmwEv+2bCON30qYf5soMwHFDxeUMzzUtyGZr+y
	 PNKmsIFz6GzqR8DzCLhNxJhhUVPT5+0qi2OfnHQf5++fsgtyE6WCuwK4kbF8SzIQCuh+W
	 VBgvOfQ4eyjsLlZ6vpwWvaBIcEpJf0JH8D0XX/IVZp16R9OhXjrRQXWnqJ3K2gHiq+K4I
	 lbYnx0E8C2+jxDxi706HBk/WLFizVfEFDQH2hBI3Mv4HmAq2yTV6AcmTB6NfCCcDqPpYW
	 UzpR0mpMuVi8lVG9zPPkkdvZD3qMZtFHEn71lAeUHno32gGtW6BbLVcyF4AtdiJfR3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zsTqLzrF;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B141606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B141606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zsTqLzrF
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so5859845e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793552643; x=1794157443; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wz41j4zEOzVaV5OmMHgkOlnT8oYTQIPs1Ouv8G5yhhA=;
        b=zsTqLzrFXBMEAnagbRLsMaksARQDFY7D7hjrr+cUlhpnCrrl8I5XNUm9u+t+pYY52n
         o34uRnqzlN5Ew/rFP6p37K5KyFM92nNkxp62PIZzz5eyu+pqNIs2vW/pTy2kGSmGROk8
         QeoHfd8OFr17zeRZWN5lnYlNAxLLG/caZGUZMTHGrlBrTOh5y+DU5y0gN5NC61TvaWiy
         seS9XkdUdFWDqBnoO0HuLD/M06flgZaXxZYzSQLvGRWu4oV3+ftXoc/TCSoSWaMi7Pks
         QvffWBvVba6sP+8BE69CA+SRbS9Q90b+ffjMgpwbxdTA7zDcqzPNLpuVGmouZ9OL15Xx
         hy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793552643; x=1794157443;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wz41j4zEOzVaV5OmMHgkOlnT8oYTQIPs1Ouv8G5yhhA=;
        b=GkYWSbiliPS2nvDCG1XygfPZ+mnFPgyMQA+pR6fi4lJ/mPqoJiE8GKFL8IUHmchTwt
         pezKUl/JA0Be1LMeDWyDqOaE5gita3OgyYjGkk7w41rKRXqf1KBtGbPuPBvEIgD++/1w
         4wiIu1tryHT5i5Md+VCmntbkLd2LTpg+RQ1ImFDwKupL9tFsRjewRh91Yeh+oIaIoq5i
         Ac/iop1h3feUU/cOOUlbsEosT+WuR32QKNm3ICJebqWbUBGnIDyLV0DjsL3lXqb8VSot
         Mj+ObN8/gR53Z+I2FewmmMM8WveI3IoCeFyBxcP06kqMrkebrBE3iEjRxd/nHkcmkiCo
         PieA==
X-Forwarded-Encrypted: i=1; AKwUvBxCZx63EwVpWcKJyhm1BC04bqsLEUQfEPnycSSszwbOJ4ADA5RpksyZ6a/qRLBePCSto+/HFGjYGX+LIAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYItf8jXeGqXX7IFQvWyiw/E7BhSihkJ88NSc0cgmzQykBERyE3C
	4XhbilDzuUU85om9oTa02JHVsMphUp43wfsq3V64J+J5etgCg8hx6k/x
X-Gm-Gg: AYBFou1M8ooZt+f/fvHKaUOZDDaYJx0uT459hEG/0eF/A057Ro98MdtFlwIk4EtE/SU
	H6E7dFks5/GjJGRPZvV2JOUXpE+jUDsKVH22m7WhHZNHfh0tvmI+Z57HGbh0UBiwTrRp5VS2MGs
	XVc31LhooRmsJqvf0ZEKMICadXXdRUXNcrNsJhq5kDwOud1DbxMO/XYVhNfiH9CRRyu1QMGW+9w
	HpzNoGL8EagjGhOdWTPsvR03tifcRmw9lFmsiM20oHS4Bvf8O4Zx0SDm0PXv9nmYbjci96njG/U
	d+XdyjlfiDAFbHIX+1T6//5qOB2Y0sQAXFSDOExA4ueY1VoW1mMXU3S5h9kmTEhXt4+KDaM0e2L
	szjvdXg068k49Oz2MsvXrngM38HmXBu6o+O8ovgs4gOmb1ObOQQzmcSsh0Hi0r1Z39KpIbms6un
	3dZhuoncujJlwlkNkmR5HX5DHz4CLHL8DjLIenyDqRsxGSx6NnKlsA2Hn3psQc4oYD7ZkaKeqT8
	635y5DW4OEizaPEdWIy4XWwA2k3SVKIOOFiJ8yOd155uYXDA2JdOan+YS0zii5iU82mkNtkfEdC
	I05LJioyoQdNRP3SpgaFm7JTnPoZYGjA4Z2pCOAM1ph/ZEYQZ47M+wc0
X-Received: by 2002:a05:600c:46d1:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4ac17b2cdc2mr184677635e9.27.1793552642439;
        Sun, 01 Nov 2026 09:04:02 -0800 (PST)
Received: from localhost ([188.24.195.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm15409766f8f.22.2026.11.01.09.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:04:01 -0800 (PST)
From: Viorel Cernateanu <vrilutza@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexander Potapenko <glider@google.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <kees@kernel.org>, Borislav Petkov <bp@suse.de>,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] x86/kmsan: Fix CPU entry area metadata lookup
Date: Sun, 01 Nov 2026 19:00:05 +0200
Message-ID:
 <179355240547.499486.15939101750691972500.kmsan-v2-reply@gmail.com>
In-Reply-To: <20261027162614.GB1779021@noisy.programming.kicks-ass.net>
References: <20261006-kmsan-serie-v1-0-07fa860ef3de@gmail.com>
 <20261006-kmsan-serie-v1-1-07fa860ef3de@gmail.com>
 <CAG_fn=X=edvfVtq35i7baEKems+ahRb87LY66xLwGLvW9BLZdg@mail.gmail.com>
 <20261027162614.GB1779021@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thanks, Alexander and Peter.

I've reworked v2 to keep the CPU entry areas in CPU order when KMSAN
is enabled. This allows the metadata lookup to identify the CPU directly,
without adding a per-CPU search. Only CPU entry area randomization is
disabled; kernel text randomization remains enabled.

The one-page offset error still needs a separate fix. The lookup now
uses CPU_ENTRY_AREA_PER_CPU rather than CPU_ENTRY_AREA_BASE, excludes
the IDT page, and checks that the calculated CPU is possible before
accessing its per-CPU data.

I've split the changes into four patches:

1. Disable CPU entry area randomization with KMSAN.
2. Correct the base used to calculate the CPU in the metadata lookup.
3. Factor __pfn_valid() out of pfn_valid(), with the caller responsible
   for RCU-sched read-side protection.
4. Use __pfn_valid() and the notrace preemption helpers in
   kmsan_virt_addr_valid() to avoid recursion through instrumented code.

This reuses the existing PFN validation rather than maintaining a
separate copy. One consequence of the refactoring is that pfn_valid()
also holds the RCU-sched read lock during its initial range checks,
which previously ran before acquiring it.

I tested the cumulative series against the same unpatched base:

- QEMU reproduces the GDT lookup failure and the metadata boundary
  failures on the base. The corresponding tests pass with v2, including
  the metadata tests with and without KASLR.
- With CONFIG_DEBUG_PREEMPT, the base hangs immediately after KMSAN
  starts. The candidate completes all six boots, three with KASLR and
  three without.
- On the Ivy Bridge laptop, the candidate boots with KASLR using a
  minimal init, and the GDT and metadata tests pass on all four CPUs.
- An x86_64_defconfig build without KMSAN boots to init.

I have not tested CONFIG_DEBUG_LOCK_ALLOC or measured the performance
difference.

On s390, kmsan_virt_addr_valid() still calls preempt_disable() and
reaches pfn_valid() through virt_addr_valid(). This series does not
change the architecture-specific s390 code, but it does refactor the
generic pfn_valid() implementation used by that path.

I also cross-compiled the selected KMSAN and memory-management
objects for s390 on both the base and v2, using identical
configurations with CONFIG_KMSAN=y and CONFIG_DEBUG_PREEMPT=y.
Both object builds completed without compiler diagnostics.

This does not cover linking or booting an s390 kernel. With
CONFIG_DEBUG_PREEMPT, the s390 metadata lookup still calls
preempt_count_add(); I have not validated that path at runtime.

Ilya, could you review the helper's requirements from the s390 side
and advise whether the corresponding architecture-specific change
should accompany this series?

I'll send the revised series separately.
