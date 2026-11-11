Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383571;
	b=StffP3iqYVzNrue1rrr+LJhFyWnPn5nBCbzA7/miibw1mTY0DWkDyMSMt3KJNwnCQSSR
	 wAYgu3L9cXiJ07L6xDlbh4GLE3pJNwbV18fNr4Txg7tFYVyBoXY9FvSBdBrh9iLpcP4Q0
	 Q8+H09VNLWlDrbQyhM8n6/10Rj8E0wHFpJKLo+MSzCRT4SS1NfnpbbGaDUv5W48QNcfJB
	 iUpDCnwn3KmtdWIg5TIzqFDvzyyGpV/ScSWD8uoYLSZymGzS4rQNoZw+tPvdWHvYDS4WJ
	 doehEHYHEyKm4CspsfuMNAG0QzpjRms0vZtjlvbQtW247RJVIFe6gXuSOq4YuUIpPBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=59sgXJgrAjzlF6lUUIt9hHd7ZlSVCeSH79v3f3zBjaU=;
	b=NykUyBzDtFYd73r9qPpthKbPHymT0yLMyX0x2WZxVRZDWSzduXBthgG3LcYeu7FMN2Qa
	 /v6xv2+ewvoi9T5wO19pOD/AzV74BH0vDlFE5cfFk4zaxPe4giSPkHlv49bv6tEmmjSII
	 3j2eSK1VkikRY87ppFj1h28Ln0A8qyL5K8reEySvf8rKubjCRoIY3wEm7RFVY1uESJfuD
	 QmeEuc+1P/T0iDS3oXsQaUVUlZLHwhhGTgbLDUNuYvqKT+cUXWf8SD/kRaKUiT9UDrmDK
	 WsgPBNy28TjnBEWN0qAkQ3TcJq2G3vChwRDj/olGx/fRkjlI3hrjOnP9FNGCQwTLfsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=rg0AnoZk;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F7B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F7B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=rg0AnoZk
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2eb0f1b592bso11220915ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383571; x=1794988371; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59sgXJgrAjzlF6lUUIt9hHd7ZlSVCeSH79v3f3zBjaU=;
        b=rg0AnoZkPwtV1r39FwY0fYtx+B96qCAj4XVMip88C/9myzm80RBPFU2IAquryZOpEw
         HdyksEXUIKYlStPIHQFe+XswkRSfDVjCV+PuDM5mPVvVsB5Zhzq12JVethAv4uT7qDLh
         gLXECA+eszlPSiHp3RlqZOoUtxhu/9gEEG7ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383571; x=1794988371;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=59sgXJgrAjzlF6lUUIt9hHd7ZlSVCeSH79v3f3zBjaU=;
        b=bgqJ9k/RAL/VCLGOxpXzRYEy+M6lTiKVnkF2OiDh6zFXmxLNgxEgVUxsz2L9n/pI6Y
         JRyrb1PkiDqGARwrKXBjJuhf1UUxd1Nj5WLCzlonqwo4fmCgId0OKcdXHI2TUjS1dtx5
         yjYQGH1VngrQ0Z4WZm1G9QSSq8Bw0FpMVqZ+Qx5RULrFIQYtmeioY6ciE/98ys3MwuLn
         L76Sk1XEIFYd6v0GGNMMjEnExAFHAzIqnNo2lt+frLgoHKMutLE6vRN3jGYl6r/v4uDP
         CTllH2FYaLN5BbSse55JA1GATuc26WIDq/QKVzF8K6hWBpXknPrIJ0Mr+Qjya1KFlZbw
         kBAg==
X-Forwarded-Encrypted: i=1; AL+hErHnjb1z6P55nJyTQE8B93fIoEHwarIrGE1VWQN6CNe/7Fn+FTwSgBgTmrCdBmQ5kYW14Ell91M9z7U/1k4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SuWnXTQbejgmGwF//NzfF0GryG9ZVPjQ6zriZq/2tqryQ2yOj
	Z8iYusnKLEn7U4a0+G17djLR6mZqlt2y0C2ONPcqbVQWh7+aurokKrGyukKrunB3Nf4=
X-Gm-Gg: AYBFou0q3CqW+1cTAU71LXiNMyv/Sylvro/t80m6NlWAYDHyipfczQdfvyrdW97aX09
	X9jIUMWPlqhkvRZIdWZaWLPwLIVhuUxOHVlAB/bux16HrBOcPZcOwSQ6egb1geOB4DRZgcuF09W
	kSvMaB6osgUjFk4ojTL9J9qm0fW8Qww7vWaf7Dbr05zRocHN04ZkotwLWEAKsp9uGga0yPjmIfZ
	wZoiSeBafBqNMYwvjSm76WZ2+3bBAixs/L1y4iHebNhOrWv1xPmBPy7yAtEVDcrvtCctPM8BTf4
	kVbp99YbjKmL8Zp1OGgC+S0iDHV5JCZL2S//97/7sJ8GMYBlWtPu7CNph9P+riqbsht0NrvCl/D
	4tBscsLMJn19gMXYBh1Mn2pRMTD5UF0lCtbooHDsIPVeQcOMbax9m4GVJGOr6W9Zhw9w6bXBrWo
	XWKA79P7vUvlO1g0Qd7Tjg+C9GtYvtbIEaZtNAd5lYfxCpKPJYNJ7zPtHLGfgwkaN4QjBdMThcv
	U1xq0GQC+HM7lMk80XFyvMtIDmTeJeIiJwIQE2wj2HSO/1Zpgnw1OR0VZuo0JUVi+PQGA3ON1GF
	0DtZ4Z6oSg/h1yF4TjWAIeEScmysYOTcgfhNmxjkPBdHiqSoeN2zJAc1pBb7M/aFlzT5ku4VKde
	Hzg/EVejmd6ZyOQ9bQkLygMaG+IoDW4l3CN21/vsBfRU5CyfovBSm2CQc84YBi1KNsIb+EB9/MG
	Fu9ZsmBFFWpNdIwNHwUNFC8By+cICoNNBwFIWz5YweAfXheBIWXl/k
X-Received: by 2002:a17:902:ce83:b0:2ed:205e:eac3 with SMTP id d9443c01a7336-2edd7673ee3mr20690885ad.12.1794383570630;
        Tue, 10 Nov 2026 23:52:50 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm17541865ad.71.2026.11.10.23.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:50 -0800 (PST)
Date: Tue, 10 Nov 2026 23:52:46 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 0/9] kho, liveupdate: KHO/LUO observability
Message-ID: <cover.1794383544.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

At Meta, we are moving towards using live update on hypervisors whose
VMs can't be migrated away first. We also want to preserve service fd
stores across systemctl kexec.

Our kernel rollout is driven by health checks from each host. For
example, an increase in rejected handovers or retrieval failures may be
a reason to stop a rollout, and the bootmem size and sequence number
help us understand what is happening on which hosts. The series exposes:

- how much memory KHO set aside
- whether the new kernel accepted the incoming handover
- whether LUO could give back the state that userspace handed over

We expose these in sysfs so the collector can read them without opening
/dev/liveupdate, which starts deserialisation, or depending on debugfs
or the kernel log.

I also noticed that the incoming kexec metadata page stays reserved
after boot, so free it once its contents have been copied.

Chris Down (9):
  kho: Reclaim the metadata page left reserved after kexec
  kho: Make bootmem reservations visible to fleet monitoring
  liveupdate: Make failed retrieves distinguishable from dropped files
  selftests/liveupdate: Catch incorrect file accounting across kexec
  selftests/kho: Catch missing or zero bootmem reports before kexec
  kho: Expose rejected handovers that look like cold boots
  kho: Report how much handover memory is preserved and restored
  liveupdate: Expose the sequence number for consecutive live updates
  selftests/liveupdate: Check handover revival, sequence and memory
    stats

 .../ABI/testing/sysfs-class-misc-liveupdate   |  56 ++++
 .../ABI/testing/sysfs-kernel-kexec-kdump      |  30 ++
 Documentation/admin-guide/mm/kho.rst          |  19 +-
 Documentation/userspace-api/liveupdate.rst    |   8 +
 MAINTAINERS                                   |   1 +
 include/linux/kexec_handover.h                |   3 +
 kernel/kexec_core.c                           |  26 +-
 kernel/liveupdate/kexec_handover.c            |  82 +++++-
 kernel/liveupdate/luo_core.c                  |  58 ++++
 kernel/liveupdate/luo_file.c                  |  16 +-
 kernel/liveupdate/luo_internal.h              |  34 +++
 kernel/liveupdate/luo_session.c               |   6 +
 tools/testing/selftests/kho/init.c            |  24 ++
 tools/testing/selftests/kho/vmtest.sh         |   1 +
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 tools/testing/selftests/liveupdate/init.c     |   5 +
 .../selftests/liveupdate/luo_handover_stats.c | 258 ++++++++++++++++++
 .../selftests/liveupdate/run-vmtests.sh       |   1 +
 tools/testing/selftests/liveupdate/vmtest.sh  |   2 +
 19 files changed, 624 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-misc-liveupdate
 create mode 100644 tools/testing/selftests/liveupdate/luo_handover_stats.c


base-commit: a0dc8eddbfdb6dd9c5c2b70eb66ab49cb1978425
-- 
2.54.0

