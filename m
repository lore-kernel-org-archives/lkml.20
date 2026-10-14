Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D313F6C3D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792004902; cv=none; b=MAAculTWeAy+m5T2pB3CX10WaoNYvfdaLtYjzw/FHbwyZAi0XgC+4HWa6K/apbKpklfirZqQxmQ8w7dxYhpIk+oMlN6kZHSUk2DoM1oyRKq5zugozOtfjjiaffKxMht2S8eQCblWamhcEoi+zaMVbfvtvFaCFryBwlMl7XiK6oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792004902; c=relaxed/simple;
	bh=RUtgd1IDUTb+Lnsw9nLInOzXrLSRgTi7g3GMx/iOGkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxnVVdqOVxyOejwTJZS8lzoPLaot72dncYA1WbBiKFlQCF2z30OJC/r0WWZ9AOYDRwwGz/OW3nNP4Vt730hGQStQSL8tc6Yxpt+uFu0mMY1U+qojUgpnUxUjYgnnpS+5qbz8Yncbuj0clpbwG/OxCPQavI+reDynW9iY51/BSTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=kHuXVkcX; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="kHuXVkcX"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1438d9363fbso410405c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792004901; x=1792609701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoT00FAkkQX2pY61Nw8OJCiUbTKBvWhFM3ATJilN3vI=;
        b=kHuXVkcXZqmRLOUbiHxxkv4sKARfN9agAWKpRAQSVDKMmRMT36MUxha0dbTJg06bbR
         pwtGkzLzdujo3XuHyJDNVomRJ3ZBvCSOKVmZmsogdRp8Mu9LZCAp3NzwXKmSgThQ8FCG
         1cFJ/VFDmJT9DVcAWKJYXpcCw4dhHeGc001TpnFdsIZVVqGf4YCyJprWNA46fSigFV2q
         MwWC+SEkrbaYRIxUReCRiA8mCNPctGQR3Rffp6OtYOjPpDEwqKAJM3WActOKTEKcor0O
         HGhVHri9L0a4Ez7B6a8Ql50ryow9mw6DeJu5prtlo/+2XvVof+NGKpYiHsB2gWALtCmx
         tR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792004901; x=1792609701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoT00FAkkQX2pY61Nw8OJCiUbTKBvWhFM3ATJilN3vI=;
        b=kCemwLAEyemPxf1Igb4izl4wQsNZM9Db9a/rK/Q110GZFW9xhpLc7MFn95cFE6LyDv
         XwK03Z3kcbSriHbpnuwnb/lUTxpsx4FGs9pmowjWrcPeR3woB/HU/lf3+KeoiyZ/WJcp
         JmbjCtXNg7+rfDe+9cjGlithimd6Aer3zFp7G3HHs83NXBG6O0pLq8zPfoZuMSFcJnm/
         a0A0p19e58PhGaCyddWzhXyrv9wlD/0eJjjHgL4Oxj83hEPVtfJWdqKzfEUZPFSv7jU8
         yjEcYXjx8BlekUSUChz3HghYmlBcUqidPxwERiwBgF7m2TMmAw/5DPoRLqXvecqLm99k
         uEIg==
X-Forwarded-Encrypted: i=1; AKwUvBxjUXQCSGex8YgaazsidgfCLn8KU/FUtmvnRVHz6ro4hn+YQa34CRl6EHwXX+9WELuweq2sNLBlePDqVmw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcmpeluCwsIvVYfH7McJKkksPc6CdbukyLhFz5vVlCLYe0bCLO
	W66ujpV5QDpRD5aXXQSrJOW0ffhpXud5c3P4ktguEYdJwKqdFrVC5flrxHHdty1MUVw=
X-Gm-Gg: AYBFou0Wg65NQMd+ILZ8ivQjvK34MJWYjShYSsH4zDKHT3MyrfCXy1HHu+8C2rW7xj1
	i+Qxu8wMI9twVv47PezUQSTKb8xRfZHzavUG4PGOhnzElvG4rUq88Ixi4OT9bTKciFHn377Lq/Y
	AvRd8RqDtbREYfdpGysU2bwfY/HknXC3AwO1bZEIrB+TZSiXUtjlWiUeBOlpuCrptEYe6DPSEXt
	qes3QWDWHo5EXA6QpxoaxuW4Q4GK2bdO6K/N/LxAhwcTkSdgpRubLyO3tRD9TER/9g9C/Sawvc0
	SbbXXENcoryHDnldBPMifWCttb41LS8NBykDsCj1NHrmnm13uZ9zYDqlCF6Ky54EYCa+tiwpJY6
	LwZbAbaqd7uZODnXz9LiZt84Fi34jIT0pg4jIVM6lxWQX3docbK2JX2msf7hFfBGjg+Eer/jKn8
	dTrA/khiOHcjLmuuQUyAi4dTxhXWDT2PoMmMIBw1SpJBBuRXLHLpmq1M/AnAGZ4l0HrAbIs/XnK
	MuhX1/jPbMoREGd0Yyj0uU+JCTtIQHa0zfFgr9H2Lzx2MFT484IGkJUOL6NoI9M51NtINM=
X-Received: by 2002:a05:7023:a4b:20b0:143:3769:c680 with SMTP id a92af1059eb24-16a1555df9dmr21612292c88.25.1792004900520;
        Wed, 14 Oct 2026 12:08:20 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm48064953c88.21.2026.10.14.12.08.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:08:19 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: dlemoal@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	kishon@kernel.org,
	frank.li@kernel.org,
	bhelgaas@google.com,
	gregkh@linuxfoundation.org,
	sashal@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [6.12.y] Please apply one upstream fix
Date: Wed, 14 Oct 2026 15:08:15 -0400
Message-ID: <20261014190815.23455-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Please consider applying the following upstream commit to 6.12.y. It
applies cleanly to 6.12.112 and is already in 6.18.y and 7.2.y.

97110d42680e692020154f9aa89298c038196055
  PCI: endpoint: test: Synchronously cancel command handler work
  pci_epf_test_epc_deinit() and pci_epf_test_link_down() use the
  asynchronous cancel_delayed_work(), so the command handler can still
  run while DMA channels and BARs are released. The fix waits for it.

Build-tested on 6.12.y (CONFIG_PCI_EPF_TEST=m, CONFIG_WERROR=y); no
runtime testing.

Prepared with LLM assistance.

Thanks,
Artem Dinaburg
