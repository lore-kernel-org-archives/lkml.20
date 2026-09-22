Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864B05616DD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092628; cv=none; b=L0NhG8XyC4ektdh5NwgU5eYhJj/oCHiPD3+3PcgSSrABYXzpYFtY9pvcQ/3M0o7VVtWsZ19zAK3HEhk8Bg7HdD9djzdL2kDYsz9fvbiDp00FpeUVz2xk+ko53GGgGM98cyGGpgsPo/fHWRuxfPZ0z848ohN6jhLCuDTd8g+4wFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092628; c=relaxed/simple;
	bh=jSIUxZgxSgiyI98U3LfbBokr7Op6qXNEjRhaQVim4+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rhJRMEpLOdagwoeCrzSJYj41VAnQPwtPsPhjDk1j+WVXxv0ujyWPSCLZicMjJz6QlHLhx2zEHpFFKbXAaNRkQ+/0le15DnhTHVKzCaAaNek9JrFEZuG7En1oWFkuJYp7mBpR1+hnlS5WMy7xCoEe3zH/GeNH5+txdbnp5r11nbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMHrVbIz; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMHrVbIz"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87c90648f99so86243b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790092627; x=1790697427; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nINCCexQBjGgqV0IoOg5XqmsdvBTBAWyhS9ytlkhAs=;
        b=jMHrVbIzSqUZNI9kWIiJ81ylSNoC6SK75489YGjl7A/VVWhqFrEwp7vu0tLjBIEPHf
         Aw7ZxDcaeLgXvywsQTz/E8IXUSxLkL9T3Lbu/ezmkLtc9qZnQEQS6T1pu+PK3ed61s2G
         96qzNVOARIvNkIJCjJ9ogqRo1DeI9IGKHy5Ycbue4/ZgM9hOLQ5d1yslDoFzwyjVzzKa
         5P+T1tCxpgooygt/XzECd7oTffNnKnoH302wfG8WiwQ+wbafxmTiuaktrsKl5sBqV3f2
         WoFEhwYJsklOCbifxNcT0XB4OoroErEe2w4Y96D8bzfUwhoGLhJrZoJwf65pxqqdI29K
         qStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092627; x=1790697427;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+nINCCexQBjGgqV0IoOg5XqmsdvBTBAWyhS9ytlkhAs=;
        b=qN2K7ZpyQKye3/aU6gSbcRjQ4Rk13B7kIuggRZ7M4nUGTGjdYG7hr0zMVxuDg9whC2
         aw0Dn8LdpA+vuSr1+WOnlpfpgI+QYExMfrc8GXSmruNuJp4E4vjp8UxKbO+C29QVs+uy
         VxO7+3pw5Tuhwyp54GZpQfougJaKogRyKX66FZmCn1qq/8sWoPcpS/mg2UHkQCudqa1U
         2NVTTIyykWso2HKkiU/yEWKNEv1vQ6tJYkesn8fzGB11OOkh95Pnodh7Toc36H1GGP2r
         tSO3t43H6rTOojB8+pR8Jlp03w1TelWsBKQFw3SKnJYaa1G3KewMtrbjpkyAEhSHqSYo
         rRng==
X-Forwarded-Encrypted: i=1; AKwUvBzsoecA8N9oURMknAmaxyNv3DaZIHADC4rBADZlSjQEayjxy61qOqkq8JFh4SHIuuTiG4owbhEA6tcqm3A=@vger.kernel.org
X-Gm-Message-State: AFuF++nQZiVsn4wndtikEgOyPkzS3gI28pSj662fmzNRPocQEj2sgY+r
	hMG1YIw8LoqS4K1FF/YxbrS0GcrtdQ/AUkRlqcgHRb2yjIoHD2NqFHmk
X-Gm-Gg: AYBFou2xmMS4C4L0hXdvdW7sLbOdMwf6rDJ5orPtgwqtYgS4MQX3u8qjMfievBwOaIU
	qCjdHE4cMYxPBTKd2mtrwtrTVjsRRX8bGyXjbtYYL2Xd0dKjVsJbOJOpc1BtYfbwSE+OixPzjy6
	gQa45rotl796a/k13AxQK44ELP7i8qEHbLYyK74V00ZKMy13qb8HfuYJpMV90usEX98YT/PlsxU
	kjQvtxeFjBCrawQjvkweEjPtVA2foBDQhvjuk62NRwYvP3TtCUz4kC8W8XpCt22qQKYXsMevdPB
	VaDT7WIyCx5HVujuswe5hoeFHqFmExubJjhnUCmHaFCn2+9NhywPS7ZjUMB5c/Ik/cPItaP/fUv
	gF7QPmJLcBYikmdsIpR/W97TCHKG9YqsO0pejOPZyKi/4q3GTBe3S25QrIVI5GTLzG/3n4XM6J7
	uKGjigZtoo3LxACmlOBDSKFBQphI181NtvfVOIuKgrWg4q1GijRXOFs70VuqcyJ3yM66aTRXRHK
	FTeO9hlWR5f0Hy5708Jh1s=
X-Received: by 2002:a05:6a00:174c:b0:878:34d7:6a30 with SMTP id d2e1a72fcca58-87d1cdc154fmr17054b3a.36.1790092626666;
        Tue, 22 Sep 2026 08:57:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1b0b505bsm18582b3a.8.2026.09.22.08.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:57:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 22 Sep 2026 08:57:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Vincent Donnefort <vdonnefort@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: trace/simple_ring_buffer build failure on parisc, sparc64
Message-ID: <5574c9e6-9ed2-4ee6-a2b2-fb6ee81e83a1@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

when trying to build parisc:allmodconfig or sparc64:allmodconfig,
I get the following errors.

Building parisc:allmodconfig ... failed
--------------
Error log:
Unexpected symbols in kernel/trace/simple_ring_buffer.o:
         U __atomic_hash
         U trace_hardirqs_off
         U trace_hardirqs_on
         U warn_bogus_irq_restore

Building sparc64:allmodconfig ... failed
--------------
Error log:
Unexpected symbols in kernel/trace/simple_ring_buffer.o:
                 U 
                 U 
                 U current_thread_info_reg

I always thought this has to do with my environment and/or C compiler, but
it seems as if the problem appears to be generic.

I have no idea what causes the problem, why only those architectures are
affected, or how to fix it. If anyone has an idea, please let me know and
I'll be happy to write a patch and/or test it.

I disabled CONFIG_RING_BUFFER for test builds of parisc and sparc64 for
now, so this does not directly affect my test builds anymore. This is
primarily a report that the problem exists, not a request to fix it.

Thanks,
Guenter
