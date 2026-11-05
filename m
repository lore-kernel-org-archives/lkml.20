Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845918;
	b=5iwCS64pCBZnpaFGiPfTMFef8Xs8xnmg+QN3gqqz6kOn3qaRVTHH24hTk0gIh2AJ14lO
	 SIhqM0vUSoSEFws+eVnYqo5WRdb6l/1COvNWFfkt0rB1OKyY15o8XQ1BRXB4DVwsE1B4J
	 F4saaB3kbYVeSdXuh9rd+9U8ReNZEE2/Sdd8cfWQSeWgBBQGMf1Q3pNyrAhqRKtRTtxv5
	 M5eiJJ8yood3URa+AtTzIc44fVALHyIRG4lHGbKI/U/IX3cklI74P5C6dudJVNXpseeXB
	 xyxZXdBGFZgL6EaTu7lwwMBwQjC3jKsbBeGawap2KvrALa6VSDxfNqPubscxF6ooQOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BBLE+9+yWyusDlKB+5tR9LXP9RfzUs5nseTcOEGR6aA=;
	b=zAhgmFvnrbojeqiY8QxxFYMAKrOcGYNYuuwmrBgK8y4ui69j4g+yNyzfCm3OKbRLUxpm
	 ba1BVAy+FvH0HMfeKDHbRgmG1NibVG1wpoLpCkDznpdaN0mbjJSIZygUlYJ4pN+SVxRwJ
	 kChGwSG/+8uGlto1cIwhY4CIpL0bi4oZX0p0W4At3dYGomwokbWP2ReJpSvwiBVL+cPl/
	 vQhVz1YvIHDnN4B//IRp1k6e2zubQDjem1RcRtb00B/UuqvD1Rb6lDF1wpZqnA2Mmklet
	 PdA7KYW8OdCwabHGTAZ4LMjmTkDMeojICNjKhzi8zggwyty5Bh74JqowJNn9kLmR5ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DED606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56DED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so75313a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845908; x=1794450708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBLE+9+yWyusDlKB+5tR9LXP9RfzUs5nseTcOEGR6aA=;
        b=W1uRJF8nLsskKCC9Sg/ntZF545260DD8MqgSCGv/bc4dH6kHep9TC5ZoVTnihtDSyc
         yGYFawblVARJ6stVtvmdK7xMb52AIUOSnSwN115Ay7gzKjUysbPso+qukQn2SCvOJE2J
         hpz23KBOpPLJyWnd59iZiOt8cDluB2V5GUtPp9+lAf5RnlrV6bpry4y/tavhIQ8r53KH
         h8JQpmDZVES8wGp3vYavgdvkEppfgsBIAp/so5+qcjBLbkClu7cnJlwXG5+0bVXb77lc
         9AHa2IIKtGDEg/r1FjS3xl5SvDWReHc6ZhVozA9ymbcxWqG1sQh1DMYU8OrAHXP+rsw3
         VCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845908; x=1794450708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBLE+9+yWyusDlKB+5tR9LXP9RfzUs5nseTcOEGR6aA=;
        b=wUcusa/cvbAYDMrz6aMLuIm5qMN1shnTKjxmpHQWddoj/Rc8+HHXkDoD3iGoiU1sao
         FtlftIPDaG2lr+zGeM9+TskPM6JvkY32AAhkRAw23eP/t+lBLBYxDWB4vQboyMOqFYS/
         xiuPJ7lb0TxIvrJeblXlyYbepTD1S/JWRgiy8mt82/bH7K/5Ho/LecsdBjJ5MivOIU3A
         wHM66AuOfkvtvAsHWz6f4hMWXTtmVmqi6qxiko4E9YxxWUp57XKlPKcufgcbq4pxXLsE
         l1z/5QuCnrZm53zNoTONj1R1BCEJL3imHOA8QTwcMkPtNDaWtbZ61WmN+0m81RnuzNgw
         i4jQ==
X-Forwarded-Encrypted: i=1; AKwUvBx99o1bzrXSSg1cKJU5s/J2Xe+Lor9v0LbXq5+w/ZvoZINRLZfdYmsAWkBoFylc7e4qwah3z+kL4/Owjho=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j0FpcmFqJsgwt+qbyUo/v34i0P+zoPChvm0gd1nWIzYuqEG3u
	0oLhvNnpr4F41CGmAIBbz6pXHdygtv3aN/sBE1a9QbSkscBQMcWNUZnZ
X-Gm-Gg: AYBFou2yjisevDh9uzna4f8edN9ah55QbgZYpAx05z56StvbzaQTJSgpuq/ZtGB5SFs
	hcURMKdF1dSStwlV+rSTgH5BtRdVcsjTOkXeGDygTkAntgbB5+HYfV03OKaTrzXFsbfR1Ameg11
	djY2IpB4Eu7hhOSGml7dXEIEMkz94hd29iAb/zJTeFQIC4V5291SIe6lcKFzcA642J3RlTZtgQl
	3lGcB55Eppnx/OYP57+8MfnGw/Jmh/0Ucaq2Xq6Q+lUhGkPNHMldMfDnhMU6EuSv/NokSHAoBeC
	pAOCtjJv7tmOYZeN9o5kR4tC9KHmzp0vRzyIIA6b5UNlurTWHLMxIzVROFFsKs1YG13VkUVPUfw
	ChU6nuTSVjSOb5i9NKV2RVJRUOHaV/aHnGhlZ2LvPJto6T6KA9c6efocneM8zvXgctuShZp20e4
	Jkvrz/c0qKhBmyoWXb8zZ+nh1mjOnd33JhSQ1+GucqyeFFxjfApKUBXFXb3jRLbl5sWhYcOKN+8
	hLolTRmcmDX1AnNUNhr8B8D4EwsR6ka98eYJy5TR3Jb8cWxHmpwRexLg1273NsJTHDI9z7yM5sm
	P4WOqUzto55xH1IbFHS8AkKdQSRbs3L4IXiUV0b2WYdku8Jpx9v4q6mNKrIU8I4t5ZIKmD12q9T
	xSZkQyrfIuRiszCrKMB13K9bgyvwzIdIRVuQ3kUItp7wll9k=
X-Received: by 2002:a17:90b:1c08:b0:3b0:9409:6970 with SMTP id 98e67ed59e1d1-3b0afe01674mr954771a91.26.1793845907457;
        Wed, 04 Nov 2026 18:31:47 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.31.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:31:46 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v16 00/12] ALSA: virtio: fix capture lifetime and accounting
Date: Thu,  5 Nov 2026 11:31:28 +0900
Message-ID: <20261105023140.18373-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Hi Takashi,

This revision addresses the two Sashiko findings on v15. The series keeps
its twelve-patch layout and the same base, a4311e9447bbb219044db38897f95be112f46a8a.

In patch 7, ordinary capture completions must match the next physical
ring slice before advancing the pointer. An empty STOP response retires
ownership without advancing it. A gap or out-of-order full completion
reports XRUN, and later completions only retire ownership. This path does
not reorder completions. Valid prefixes, empty tails and ring wrap remain
supported.

In patch 10, staged pointer and ACK callbacks require a prepared capture
epoch. DRAINING alone no longer permits access after RELEASE. The explicit
PAUSED/RELEASED pause-restart case remains supported.

I reproduced both problems and checked the fixes under ARM64 QEMU with
KASAN and lockdep. The completion tests cover seven cases at patch 7 and
the final stage, using real returned descriptors with test-only ordering
and status injection. The ACK test uses raw userspace SYNC_PTR calls in
the post-sync_stop window and after an injected prepare cancellation.
The pointer callback check is synthetic: ALSA HWSYNC skips that callback
for capture DRAINING. Prepared drain tails and paused/released access
still pass.

The six changed stages build with W=1. Stages 1-6 are unchanged from v15.
The combined build also passed 70-second RW and MMAP capture, RESET and
reopen tests in ordinary and staged modes. All fourteen captured segments
matched the QEMU sequence oracle. A separate v15 comparison confirmed
that staged paused RESET already discarded the old partial tail; this
revision makes no new claim about preserving that tail.

These runs did not exercise physical VZ devices, NOMMU or KCSAN. The new
reproduction fixtures are local and have not been uploaded yet.

Previous version:
https://lore.kernel.org/linux-sound/20261105000915.15177-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
