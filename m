Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F77383338
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018537; cv=none; b=MltZtTMaOWx6TrePrSVszEZ5VTJ64juE08skMNm6pPMSW/l8IPprIWZaCRzl8hu8MVpl7dWDiqyn0Q2OcbwPy2O7epgVQJYQDIFb+ZMETBvXVeZXt001D6d15JxYG+sjOA35m7iTDeRQbzdMC+1Udbd5+LIM6SR+DPxb3EI0Cn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018537; c=relaxed/simple;
	bh=e3sIKtRpbFRf5PL2S0UghV7GT9zAOdrng4XZYq+Guws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M6F5usFocRBZMArbSfKYcoljHjEc8//nLXH8BOibUYBzlrG7Qj+bEr1O7YErYxj7f8cRaiSxKpIHs7DNdGlg3FftxD7nqniBhfAq4RvKJuP7jI33B8OofLoAvtz9EkP+4RAh5oNJRAj6VqjJOgXWXwvsxvFhvgGZGt/F/Fmfd94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=h2Cw5m7T; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="h2Cw5m7T"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55eff0so506400266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790018533; x=1790623333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bk7JZc4hNA76VOHfcQArIGuYp8mR4aUxSNBec+E39o=;
        b=h2Cw5m7T8Dpaks8fcGdENay27K5DSPIx9Av98vAPKQ3/8nGWt9ZKfqUOjLMH2Qk2bt
         tdI42/5dWBSFw/X4amxVoGdpuCYuSz8a+k9iPC0sFXN3A6oDUsgylUZQUly0+JqeNIWK
         QvfEFcRs4aWSr5YoFeky9+CZAkohV7MP0nv9h+wrq/o1dR9jGaq2R2cr2IfrPukSHRcA
         2DTUEsAFAWpEHNI8GPJU1Nji2oYjI7fBVSnBV05NURWy/5rEI51W1ePDMU/B2rYzmhas
         YxtSZVfKxysfUGp76+LMImzkmL1HLv2Aick+UAJNMD5gY/rpHVvYnPEdluJjBLXOOgPt
         GcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018533; x=1790623333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bk7JZc4hNA76VOHfcQArIGuYp8mR4aUxSNBec+E39o=;
        b=qJZpVnkY9QLEyxO+hR2qAO5H5XXsP85PASWSuJKVGDiehKCtIuCOASODrA2kdUUv7V
         NkKvijE3WkA6qSdgH5AVIguqfdC2//4kXnioWg3rORHzl2FTA33xgYdNLzwhYgTo2fGC
         v8hXN5cLIBg/1sNjDundm/8x1G1L9lXr6rzXFwelePffFpn4HeaGTlTSkw67GlovLyBd
         3y3xCDT0GhlEV70qSAI0D5s4RxWUIqNVUzsMCeKiR/HDnGLaiZjdgNO/YbNccYWbS/Bv
         OLEPdVx0mqA2k5XdLXovocsWrSMNMuwvbmZjtAotLztDTOsyBHM6Lw+X8v+WFDT2+jlL
         s3KA==
X-Forwarded-Encrypted: i=1; AKwUvBwheEC1/sg6zFbnJStl0hgLmaclMdpExYk+kq1oJLpa1am0hHckokJ9woIp15rG3dIQqrjp0jMlnPYnHLg=@vger.kernel.org
X-Gm-Message-State: AFuF++nLX3/l2xHm846LoWH98lh0pI4fbGrAv0R2kjjGz2Blow2bmlpa
	jBHuoJC+PVW7fknLEBem/flKvs5KZyYEatu8vnQXijR8ms2pNnDum0MV5Qz0ae9EBZQ8
X-Gm-Gg: AYBFou2TzhvTpraJAinIYo1HNGjeHW39BrdxZ7DBnibGKeFakSInzW4WAfCzjPA/IhP
	UwPAXuFHKrQxSnHPCKZy4k7KjdnPhyKRpBceDgyCAlScTazd1E2mPfwxj2wWUSvNI0ud1q36Ovk
	qqw+cC8CslC7f5JtECM1bbLDNuKwph9W8wgTLG1yQRZ1hglJcittSlAZQJp7ApeOGMh4rZ7RLGT
	jweSZLwZHU1HtSQqhneVj5qNCEf/mRxlrchYlCf6WPaQ4/s6tYzwy6CfG2yML5fMBYlQwIPFpn2
	dFRJ3sIpVMTqqV1LjuhREuQgb/EPBgt0MSiB3P8xBrOZ01l5HErIjVS4fBIzCJxAeAKQF9a5ufV
	UoiAwrNFtBDKyKnNkAPZjPx07t/l4AOrjLMbilSRZAScyulOn65OiZVO6FkiGexTbuDDomhfwYK
	LdOTjetkVqQ6kiL01ma/2Zu0WRtlsciAZ0hqrE
X-Received: by 2002:a17:906:478d:b0:c25:5faf:b207 with SMTP id a640c23a62f3a-c2a1565b58bmr937608966b.3.1790018532498;
        Mon, 21 Sep 2026 12:22:12 -0700 (PDT)
Received: from cachyos ([151.38.78.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358868e1sm341089066b.47.2026.09.21.12.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:22:09 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	cenzhang@linux.microsoft.com
Subject: [PATCH 0/4] fs/ntfs3: tighten restart-table offset validation
Date: Mon, 21 Sep 2026 21:21:35 +0200
Message-ID: <20260921192157.102738-1-giulia@bynar.io>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series makes NTFS3 journal replay safer when the on-disk restart
tables contain inconsistent offsets.

Patch 1 checks open attribute offsets in the dirty-page walk. Patch 2
checks transaction and attribute offsets in check_log_rec(), including
nonzero attribute offsets in records without LCNs, and validates
allocator offsets against the on-disk open-attribute table entry size.
Patch 3 rejects restart-table dumps without a complete header, rejects
short open-attribute entries, and requires the transaction-table entry
size to match TRANSACTION_ENTRY.
Patch 4 bounds the free-list walk used when allocating a specific
restart table entry.

Cen Zhang's earlier patch [1] checks target_attr at the redo and undo
lookups. This series adds checks in the dirty-page walk, in log record
validation, and in the restart table allocator. It can be applied
independently of [1], but [1] is still needed for the additional
validation at the redo and undo lookups.

Greg KH asked on that thread why this should be fixed in the kernel
rather than in userspace fsck. Checking and repairing a filesystem
before mounting it remains the administrator's responsibility. These
patches serve a narrower purpose: if journal replay encounters an
invalid offset, it should return an error instead of accessing invalid
memory. They do not repair the filesystem or replace fsck. I am
proposing them as robustness improvements, consistent with the kernel
threat model [2].

Each patch includes a KASAN trace captured using a crafted image before
the fix. With the series applied, those images were re-mounted on the
same x86-64 KASAN build with no reports. The series builds clean with
W=1 after each patch and passes checkpatch.pl --strict with
GIT_COMMIT_ID ignored for the KASAN addresses.

[1] https://lore.kernel.org/all/20260901174934.6275-1-cenzhang@linux.microsoft.com/
[2] https://docs.kernel.org/process/threat-model.html

Giulia Aloia (4):
  fs/ntfs3: validate dirty page open attribute offsets
  fs/ntfs3: validate restart table offsets in log records
  fs/ntfs3: validate on-disk restart tables before use
  fs/ntfs3: fix out-of-bounds access in alloc_rsttbl_from_idx()

 fs/ntfs3/fslog.c | 110 +++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 70 insertions(+), 40 deletions(-)


base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.55.0
