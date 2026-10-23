Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722679;
	b=ZEq96VuU7uiog5OyxW4324lvhVh0EO1A8CcRQbEfX/nAeb4iy+2RDNpSRKsc9l8DJVIT
	 3I9IikX4Tv6tDMNyYL6bDDJQEQANL11YvA8LoEFpRmro8A8sjE+L0biG1Nx2+21Nlwj9y
	 DGmN+TJq+t5H84O78tk+IcBfyRirbje6W6bhBMCFH5kUyWxEhbhRPqkNrhlhcCNtU7UWg
	 ODEk7wMZnkm6tyNe0lsDYLFqD/nwTWZ6pNG6rKISCcOJ0mhZVVjjedUgGxtdPosGIW7aH
	 DM9clZq/kII7nNpDgqEzfLFo+lXSFNGQvqmZHsyyuycKfvCqEMkHqPI36FUeeOwfswA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=S1AF2UytDZrLksg5esVe6mH/dBIR/sAfPawxfA5KC8w=;
	b=AE4jWJMHQP81/FKGTqL9t0H3sRiRohLHrmkjluinxiKjNesrWQ6hyX7dZF2T0wlK7xvS
	 uEgnx4riMbUtjhjzU+YvBWLLc1qC1KuXgJvwvKXsMLTOeKoDIkzhu/dCAsDYG7r8nHr4w
	 6gkzbOECX3N/SXY2CqqK47Z7R/UI97Oj9AJKbwaUkuPlLKKhJ/H3xyRqMLXeSGFhWCSQe
	 TUkhno2MSKbMrQYN9oeW1q5Q+2O38ctUa4bjYaFYZEBzjkKd67BYUeipUzGj/aStj6U8C
	 7cwYbl1wvB//k+d2jQ8O5jR425Tk3pYF0bVI5uG9SkYNf3ATbiwOZPbrPahoTcOffrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KYCzpD5I;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051AF606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 051AF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KYCzpD5I
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e987b4a710so7547525ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792722678; x=1793327478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1AF2UytDZrLksg5esVe6mH/dBIR/sAfPawxfA5KC8w=;
        b=KYCzpD5IR1M+2IIDBjWscNKgVBti2KOnv7ywu8mpIgngCL2c7B4RMNX3iouL0kK/hW
         zWOGSc6g18snoUecATBy6hh6Pu/LFq4GxD500hZiz1md70sMraNVQvH8As8IApgeUfiP
         vonBJkK6s+ivhEOkVOYpnGGMSAM/zfJldVj/8jH2ZLs8amcr2Dq18clLe+oX575qXIKr
         zDj89+gMaiWBR6h3gUE3FEK+OrTticREPbe63ueJHYzZ4ximG5O2DunfhmD9Q57IjJF6
         tdmMnQFZmPZlED7lLK7lIg+9P80OVfC5RGVDUu2nEP4niurZJ/gjCABuJySqw4LxYroN
         0OPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722678; x=1793327478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1AF2UytDZrLksg5esVe6mH/dBIR/sAfPawxfA5KC8w=;
        b=hJpy8xrqin27KqlJhAzKjv5fe+sEXsYqmubEdzWQb6nuHd5gCpHX0rypWMbGbfgrZb
         Drc9aWgI6LKDIl9KgoNGAw8rDb5hO7TQOsxw9DyYfkifVRqACgJMHQFzAwAIRDpY2YF2
         1OdHthbInPD0rpzBUD5BvUAW1S7zgzTWHX4hfE93IGpOInYN5ayIf+v53MdgR/lILrAU
         I8CLwUeieQxGsZ7HDNGCMZxqiIjMoGH3wpa8myBHRa5rwxzYAb+zP0QrJm/akblo21Wo
         LjyGPHZa3fv7P+uuB8qWUKmBdwFqRM6KTf72r6UlTHAVAhN1ykaeVIUc6Q6TMn+3khMZ
         TEkw==
X-Gm-Message-State: AFq9FYKF9EDKExB9hIhR0cxGuZDK2JE/di/wvr1nTvuueOS61WPzHK3B
	qfL6rX85lRDke2VnSjE8YGOSbsxTs9tmOUIvHBZjhxFUt6YKKsRj1qMX
X-Gm-Gg: AYBFou2xE1spVYF9PZV2riQqWTy4rrFPLskiFR20BndWMoQUjRKb9rF65EQCN0Zd4JG
	6zRfU7h83UtBYPPw6hdSjUYKTNH2JonrF1svVNWcpkqrV97d0yATb4+qiuOK1nAbMw2AHGlloeI
	8hDTWglwEd3VFAf2PlKjr3X6jfKZ2T5i14n3vfdt9D4AR2JcEq0Ccm1sCoWcg+9jf5/OV3AAwrX
	QKzMcI5mITM/afH2g1b5erp8btdW45Xkalbxcjp9P7ixXSpp/CXfMmfz9f2do3Ejp++alOdy6GS
	whzV1YTm5ElPyvpj9i4fmsXF0frHuTnMVEzsAYe4lGozX61+laKsDNgce7nlRCIEpPHtFyMQ1TZ
	9jh5Z8zNfWRrP/jNbx7VKm84PQvRsDCB7beeUF2Z05hJokiViQXPxuSmMEtD9QSAx2Ty9Pilg9I
	Qziv3KJDgVpBqTw2YlUgS1WhnJJvNqiJ2u4pGigMi5HE8kOnBFQBJjFsJerfpFz/57C29sccOPb
	Jd7prsHTiWAIJ5G9A1eD+w6LIxnJZDtEtnqBxYhFFZ9oEwicseeIckaNeMXcRZ6yZWLvaYIOQ39
	UVmXGPF20+o8RfkJAV2h1n4SCN5UUJ55p5xvqavea7dulhLuJ/E=
X-Received: by 2002:a17:90b:3b8e:b0:3a7:96c1:f6f6 with SMTP id 98e67ed59e1d1-3ada6f35f81mr3174897a91.34.1792722678131;
        Thu, 22 Oct 2026 19:31:18 -0700 (PDT)
Received: from localhost.localdomain ([240e:46c:1d00:19d6:7438:ad54:9ef4:bc36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba89a40fsm279852a12.14.2026.10.22.19.31.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 19:31:17 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	gourry@gourry.net,
	david@kernel.org,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com
Cc: linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH 0/2] sched: small changes 
Date: Fri, 23 Oct 2026 10:31:03 +0800
Message-ID: <20261023023105.28829-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
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

These improments are found in the implementation of BPF-NUMAB series[0].
They can be applied seperately.

[0]. https://lwn.net/Articles/1101442/

Yafang Shao (2):
  sched: fix stale get_pref_llc() stub for !CONFIG_SCHED_CACHE
  sched: use static_branch_likely() for the NUMA balancing tick check

 kernel/sched/fair.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.52.0

