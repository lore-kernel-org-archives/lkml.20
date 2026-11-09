Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213870;
	b=DbHKvyq2LF1Kg15OH1bEwl6rGVnvbMY+cxjZKWt0xon14xC5H6u3PjfNOn+IKsLIVTrV
	 CSAB6gVaBXklD2jmOapmIZx+JdiFtB649uMuHei7xxVrV7b723dK1QrhAAWdGqkjDuwP5
	 cVGke87Gzp/YDDqpyJU2UAAWYt798LPNgpLP/mTB8Nrhnb7oxYGx4BnYH4Qp8LavT0DPf
	 n/dQUTcjmv7C4YmwvDiB2ynqTZlRX8j2f9S/r1dxxiBD/0s+rLRwedet0+oV/kl0hOFU8
	 56Mp9jh+qyKt3AJv4onJebbuecjvFdq8Dn987YZFgBsV2HdPQZKzbQRq4EPb/zn0HrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kSWF2kuv83msu0L1SOhEm6iVW6rIPqvCwEF2UoZ5xlg=;
	b=wf+CwNGwXX2sqlGRQkll+cHG/tPX/Mq6BhDJYS8lat39wjIEpzcasq7fMExSrc/pDXk4
	 qbUh2zmDN8EL7zn9I0yLeWHIp4vHDawSMe1xvabwSvXCrdaamE5o3XrPmwFb+NxkNN1M/
	 67O7ehAsf9iSaZrjIeEMaObnm9vYpsCufwS130TKAj/IlOxSlb6xfwX9J6NHZrWH6NuVF
	 hOZCxVK4d7mdEiQtMWSPPnBjqPIKTksDzasu4/T7tdSCiyvL62NFoFrsT7262s1DUgoYZ
	 3rPHaRl9jHyEvrLef832UiDNGm5Dm2GbhOHW9NqwjoAAHFRJvMiY142/GxRI0Fnw8pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6cNtGK3;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CC1606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CC1606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6cNtGK3
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06e79e152so256588b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794213869; x=1794818669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kSWF2kuv83msu0L1SOhEm6iVW6rIPqvCwEF2UoZ5xlg=;
        b=x6cNtGK3ePw318rIzwt0OFqFCFA9OEIncfFgZbuEzg9b59N1TYpAW/T1mmJGvPgwjl
         FvNInd8U5QKUU5MUilph0RK9qxp4mSv67cyA110sKrj352y7h8cHRK5utB9KSSbhB6VW
         xuWFx5eogWt0BNbTE0fsTkDwRaDPvssAPArt+88W/dFqqlBm5obog40uWk9xwndFS6H7
         a6f0TKy4NHYQnLEWHfy876tISXw/+mJzbNTsQDqXva9pQGfV/9ZqRBwp0k01eTzKyGej
         KwCbRYFLmDnjtSRHrMtDKFO2JNTlNsWgORSojOapdzfUKgZDY0EduxArBcSEwLng5Yiu
         gFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213869; x=1794818669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSWF2kuv83msu0L1SOhEm6iVW6rIPqvCwEF2UoZ5xlg=;
        b=MfwKWnlqGNZ31eAnHvDprzPZtlfTyZ8PqhfQv+N4RGGsxK0bY6F1ghclA+VDo5nO39
         Ofey8HMtvF0C6j+zmVVOdnfiAjuZZ1my5YtPt91zMbTcRjGM6vzn854+mv4dgN+uC1VC
         4vqe6xqTazCqJkZhAcmRFEpWRgz59mgYJ8TB17M10HVa9i6AonPMyjb23PAkeKQcrG0M
         YxCB63dxbi4Z+jLMdTLJpx+czwOW3vdQ8x1KcIemX0FbbTI0BbDXVTUsqRbbjHScm28E
         lzXQDxYd8XKb7/LKKAnK/8vOWoVaIVxv4WhKibbakFNqbw/6jS4cLlUSlI7KlgbvsnWd
         24gA==
X-Forwarded-Encrypted: i=1; AL+hErEUkRsqpS+BHzVSdNGjejYug01cRtXGWuTI3yAjx421sD0mRxq4f/R0CDCYrcUFLZvAxVtUClGf9z3jdBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z++83fgmF41OPxw8Cb5+wC7GxElfBNnSXndkRTy15vPWL2eThZ/
	sn/wc4OnoDFXRWPu+UUzDcNp9mqtz5u4XC5YbZDQX6J0KnxS5NzbtPOQ
X-Gm-Gg: AYBFou1n1Rp6Kl1ZAfsZ3DVEzR60TWfezG4xKjTk/ZFTiTvwRtd4EM0tStNr02VUtDS
	Qbo2qZQcYfANR00RIj90rgSv04lBn2zdKBvFFCVfu2KMkkrWeIkcAe851SXFzipFx0gtvVcLSPg
	Fx3pb2uwYQxxyoaamHIXYYYaJNyujDKKXdQkm3nMD8Eik6qm7IKC26BbNHisyHdirf2ie8azU0/
	ey1Opb2u9qF6JcdOQYXmqO66zQQPd+KOVCSjvT4ElNA7MaNe/hm4aGllGChiZqhRNrDVQA67gzB
	17naWHxc9eM8RnmGOwtPNSo2FMsI4ss+r+6DEFx0gy4Hl5FzaOfo1LIntGwrn99IvpWJXqDii69
	Hw+M+MCRfDtkOBXLcx9UsPyCPC1EjBq8okbZNRwUvAyXODxenVSNHQF7liU93Wt9zvIn4lokwz5
	Hl6jqq3yHuARH0sTMyT+ulOScafMqr2SmLTLjH/zoam9NSMJtE0qEz1XKZIAvwnM9Qq2ABDwosn
	XWSgOYphF26IvEgA5qwJNA5CULm+LyGW22OKA1KCEbwSNXPUqA5IYh4ygA3/JGjLo0mTxb0fvot
	rmXVHm7CHAOPvsj6hTDajq8VETbID3peIenFfiF4gaVXeZ08IQcH/GMSdCYR8tRAgv3aP9Sg9w0
	5kCOsSyPUBNiH1UVFjVL8uGd58o4LBntsu5fPREabVQkj
X-Received: by 2002:a05:6a21:e58c:b0:3eb:a628:1095 with SMTP id adf61e73a8af0-3eed2c07761mr2906916637.20.1794213868862;
        Mon, 09 Nov 2026 00:44:28 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb96816fc6sm1413751a12.5.2026.11.09.00.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:44:27 -0800 (PST)
From: phucduc.bui@gmail.com
To: wbg@kernel.org,
	andriy.shevchenko@intel.com,
	David Lechner <david@lechnology.com>
Cc: andy@kernel.org,
	dlechner@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	m32285159@gmail.com,
	nuno.sa@analog.com,
	phucduc.bui@gmail.com,
	sozdayvek@gmail.com
Subject: [PATCH v4 0/2] counter: ti-eqep: Fix runtime PM leak and use devm_counter_add()
Date: Mon,  9 Nov 2026 15:43:40 +0700
Message-ID: <20261109084342.51865-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi,

This series picks up Stepan's v3 [1], which had no follow-up since
May, with William's agreement [2].

v4:
 - Reword commit message of patch 1 as suggested by Andy
 - Add patch 2 to use devm_counter_add() and drop ti_eqep_remove()
   as suggested by William.

Link v3: 
https://lore.kernel.org/all/20260529095834.2561-1-sozdayvek@gmail.com/
Link v2: 
https://lore.kernel.org/all/20260525152137.7428-1-sozdayvek@gmail.com/
Link v1: 
https://lore.kernel.org/all/20260523184448.7609-1-sozdayvek@gmail.com/

[1] https://lore.kernel.org/all/20260529095834.2561-1-sozdayvek@gmail.com/
[2] https://lore.kernel.org/all/20261106193208.4136410-1-wbg@kernel.org/

Compile-tested only.

Best regards,
Phuc

Stepan Ionichev (1):
  counter: ti-eqep: Fix runtime PM leak on probe failure

bui duc phuc (1):
  counter: ti-eqep: Use devm_counter_add()

 drivers/counter/ti-eqep.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0

