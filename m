Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793243122;
	b=gh/ti0hNZiV2qjK9FhhtOL55jiA3obcHtaZQgjZP4dr8KHf//rqgbw8VsZKJIS6thuYH
	 c5FjEHjHWru2NthPGv9gELar7Um7CLhTYcLF1SfHqXFKIzdTIIkTGXUZLmnnwH6So5n8f
	 eXwHRhsL7gLlU4sief7u1R2cps2fk1nebBH25iR+/LV/wq6273zsfL/CVhv3KPGyMYWh0
	 DH3Bnp9txatJR70KdueaNdpqeCzddZcn5hGyCTZpB4BrIBNgYHaN/h9Zx6ruCcskIZxmA
	 x3lpYsyopMich1/vdfKL965qGQsoWXuDl75WaEGzDQdKmiOGWWv27BmG0C5y3XNrvzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Qt+rBjELLMxb0qTKo9uNTiwBY/+V4YZH/Ya3Tn3lncw=;
	b=rvpk5X19Koe22/ngTtVbDhmZX8dOxi3SuTBtSo4wzwPFLBfWxKqLdvKvA8xezwRDfY8C
	 6vEzA4g+sHPQYfDeXhoCwFeC7b1EDUpKdOVSOhHmXOmhSwNoZW8DjXE+Ehj10VTjtsALf
	 5YNh8xxZc991ZEVjiN1F/Zn27E5bFLjVG8IACM1MRu+R5T+mTe2NBbt/VQm5PsTk8JzHC
	 bAtEphVu/adftcEhanGKjKiR8XgqzWvgVcTMRsLV/KN6zFPRTBvKye73jgTg3Hn46XWeX
	 lhVrm6UwDxVC0yRWBI+GmOiOosaoIQMvtiD5Onl2OPin0o9Q+AS9NXNAn65tv2KaahQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xHNh2s/Z";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9CB606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F9CB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHNh2s/Z
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so891717a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793243122; x=1793847922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qt+rBjELLMxb0qTKo9uNTiwBY/+V4YZH/Ya3Tn3lncw=;
        b=xHNh2s/ZBjEIdJDX4r+dFuo8rNJ9MVQVAR+r5+cnenMwbZpMBs1xnjBlakkyac9yTO
         8bMDjuugxd7EriUc3d3oVvtIWW2p3YbNJ6KsEsKfm1ubZUETX0TsFQzRwNVFq/3LHMUv
         XupBgGrNQPXrLmyVezeYmQp08Rnt+GIf42xgjCkAl2khgayG0W1ZslJ/HRhejgKgtgHn
         aFTEyIabEusutC3KAy6fFI5jwEfnN1Cwnh8aBLn4XOw3TnjNw0MbYfUpudFWA9sLlVpm
         eYZpu6l7g4dB6hYU0VRew9uzv8fblmkebY0fmLw8l+APd394gUkEs5tyKa6ZltcieY09
         Ysow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243122; x=1793847922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qt+rBjELLMxb0qTKo9uNTiwBY/+V4YZH/Ya3Tn3lncw=;
        b=T9K0viUF5o0fS66IBJIgQZQ0tomrIUdCEOOgVx/3ldKOwDoDAfNZTfhwbSBL6cXQ8b
         5rZK8eoo/1Qfvl9ZmuEwFqS7VXF3eTG0np/l/GilzZaafiWW5iSF21gzuAbvmwGIiP1H
         HP5HqTR322jPyCYBmNKGESsduaJceggOPm/dJ3BBPvj6d5ZqPoeltroUfXRL4INiKJJ4
         D5jLnxf2mBmw88SXaC97DKJecX8WRrF4jTQ7TwIeaVC3sUsnrN2ijnzDxtnKLpllsPSy
         87A0R06TzAxbF0mUdirvPQsPPTrjdR+iWI14mMp6sJJBXWx3ZupvFbQC7xk/3gSCV/Uw
         yghw==
X-Forwarded-Encrypted: i=1; AKwUvBzbSrEa5gGB99cw4jKI3vXWXeMZNzqp1VCWt/gKGaXQ54GkdC8/mO3ZZt7Z3PAICP4nOLP9F6LcpmNrXvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL5tmWZR9NoiVbWns+y8y9twHeBZXt5M+z+cqHwf6VQJyyhzrJ
	l2kZIp93Vd/s5YT62I3GzmNhie2ymM5lMpp9YpC/edqdmWIsol67LQm7
X-Gm-Gg: AYBFou3b6I7rQhOP3MZeTWbBAzw7ywRT8vZXGWmIHky9zaEvTfxBCNDfk7FmqI/JNnd
	KDcknalYTmdIQQs6R0Ke/ROs/ZVAkcDSlvW2ss4azQGl/M2PuQeJAgixio4rVTmsf8iR9RsMA8g
	KTmjjtL+UAoTjg9RTOlmQKyYz5oEwJqoUuDLWIRZXgAjqU0sBKGXPbf3/zlcRH5NjoKcWHaFsP7
	nVVBMp/LPL71rkqPTB07YvSGjx811JoW5DWvdV8Qyq6DGFZnHTSCaoIEcPmZGVL2ZUlJwn8iMi/
	F7yVNW9TAhK7p3bj9PH+lf7C/3tz26saTS+RGNT7ucPhADtD3JpIybBQTX9W9RIWcdBRSI+qZwh
	qib9213rYy4hEggf3GnR4hYKdKUQCPYhSRg2Zk1F7NB0pcGyNI4AxVJljEyiHKbLgLtKG0XZ3SC
	Vhyw0p5jDnwrkmodux++gQML0j4VC8FKpxofo8q6uHK2FRldxPojcRSepHB1olXXqlH2k9jXmIx
	yYFgZ6u+yqocAwg1UEqFtsSV1ZqfCP0Uea9MCQFIkVD3rDwKfWOCZ5xQjr7VigmJjwL6DkEOaEC
	5MUPYi616KS1IU3E7rzrm3vZL/pjcjBgqdgYSYwDfSV1n484iVHi8w==
X-Received: by 2002:a17:90b:3810:b0:3ac:b08a:ed2c with SMTP id 98e67ed59e1d1-3ae5822fb8amr3357641a91.40.1793243121828;
        Wed, 28 Oct 2026 20:05:21 -0700 (PDT)
Received: from localhost.localdomain ([101.44.96.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9583c1sm1932931a91.10.2026.10.28.20.05.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 20:05:21 -0700 (PDT)
Sender: Yilei Zheng <trilithzheng@gmail.com>
From: Yilei Zheng <trilith.zheng@gmail.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <djbw@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Pankaj Gupta <pankaj.gupta@amd.com>,
	linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>
Subject: Re: [PATCH 3/4] mm: add shared read-only vmemmap support for FS-DAX
Date: Thu, 29 Oct 2026 11:05:11 +0800
Message-Id: <20261029030511.12004-1-trilith.zheng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <4c9741cf-ac62-41d4-9c7a-7d5ceea4a8e1@linux.dev>
References: <20260903122128.12264-1-songmuchun@bytedance.com> <20260903122128.12264-4-songmuchun@bytedance.com> <20261027065723.66564-1-trilith.zheng@gmail.com> <4c9741cf-ac62-41d4-9c7a-7d5ceea4a8e1@linux.dev>
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

Hi Muchun,

> Thank you very much for the test, so in your scenario, this is also
> the behavior of your real workload (mainly read/write-based, rather
> than mmap), right?

Yes. We mount read-only rootfs images over virtio-pmem and FS-DAX. Most
file access goes through normal read/write. mmap is only used for
loading binaries and shared libraries at startup, which is a small part
of the image.

> To be fair, it does fix the issue, but it's not very clean. I might
> do some code cleanup first to solve this more gracefully. I want to
> move the initialization to where the template page is allocated,
> similar to what section-based vmemmap optimization does.

Makes sense. Initializing it at allocation time is cleaner.

> Thanks for the analysis and suggestions. However, the reason I
> haven't sent out v2 yet is that I've been trying to refactor the
> vmemmap optimization logic to make FS_DAX support cleaner. I think
> I'll probably do some code refactoring first.

Understood. It would also help if the refactor could support subsection
(2 MiB) alignment, so any 2 MiB-aligned device can use the optimization
without padding to a 128 MiB multiple.

> I'cc you next time if you'd like to help me test.

Sounds good. Please Cc me when you post v2 and I'll be glad to test.

Best regards,
Yilei
