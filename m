Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390822;
	b=C0Kw5l9iwgvpkunQXK/b2SpwUVLIcmiAC1vADa+hCyQyb3TkBzvPAJfuJpKn2zgSaj39
	 w6AoenPrixz5A/TwOpaBMVnCYS7Fry8FfyKQeuqjVUfOSS93E2EIBGdhmvHeqQ9n3K21E
	 s7mPi9ksnI/BmkMl32RZx4Qs1/+paKQO8Yb5TKtnV3b6sVYu2/BklX07b98gmqgAxZY3t
	 pevhjNAglx0Rb8VyFpM35YPK/VBdOIvpPO3yeolS17Uk7N4BHNlgrZySxxLVTcQY3RJfs
	 0IUuDazRV9Xf6jrFbrRbO1Us5S8cYTbomeuhtLjKUs2vfwlTZdF0a+LGMAkPDyTJa8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390822;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rSBRyWxD/L6iGcMkwcVuEPYbqUn6cUjGSKoS/CpmhzU=;
	b=YUgeh9BsIYO+Zr937L4WVkSxm8Y3OuHbDHmXcUORqoiguvvNa4MwKI+R8lCuPxm5kNxn
	 +1d9rlUpc+gKEmsSRJzWx3y6TkKqLzONkDLt0fDIYhK9qm2QAKPsjhWg/6Zz29aW/Y9Ge
	 FhPDSx4LXum0md6P7BJjVF6mDrTVDox4gT+MkgRAkOuZvvl4WLWIqfs8+npEM3T4zNge7
	 a2P5zGoaWEOx8mnnKaA5YuKOqHNHZZCfsdZyOyux7UHCgNBMh2dlsajzr1KmuxJnrvmUn
	 xRRpL3S6dBx8l3BmOsRyXEwgaBZO8lfM1sakQNxPQZFjh2c76jIGWe77NS5jz88MZ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D3Ac2KbB;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QAZxyDbv;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FDF606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1FDF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D3Ac2KbB;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QAZxyDbv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793390820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rSBRyWxD/L6iGcMkwcVuEPYbqUn6cUjGSKoS/CpmhzU=;
	b=D3Ac2KbBQAJT4WIklU7PccaONq4n5+7G/WUHM6RiroD9DpoW4dehxcIRkG8UzVIgKCVLo+
	Kb0FQHfuCYptBW1FGC3ATpGvGEdm+fsEHCy9Eyj0K5+zkhp+h+sZiH8Lte6Y9KhFWWBHxX
	pY3h4JcJeFEcQ9wsH5TQhaIOzIaHxwM=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-vASzN_2PMsCHo_MRXSqe4w-1; Fri, 30 Oct 2026 16:06:58 -0400
X-MC-Unique: vASzN_2PMsCHo_MRXSqe4w-1
X-Mimecast-MFC-AGG-ID: vASzN_2PMsCHo_MRXSqe4w_1793390817
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so4057851eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793390817; x=1793995617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSBRyWxD/L6iGcMkwcVuEPYbqUn6cUjGSKoS/CpmhzU=;
        b=QAZxyDbvM6LMaXvonoV0ftSTB2L1rd4+qz3q/gVDBBGZVpLJH/gPXJDo2twqsy85FD
         E2pehJbrCKyTvzIBNtOfGJP1VeyRMAqMxlMaeeDgemdvOkxdbKOCNBYfqG8p6TsMsxy9
         i0D6KtN5E8T+UmVh8JcmNBlvaEArl1LulP/HjU1jkJyG902tUbAQyDc9FK777RBXV0Xq
         H2H5amtII5jME3OMb8QMKlhpk8N89r7Tan5boQCD+pL8nHwvWprGc8oSnV/JftOvLamo
         1/EA0a01p0EPkhAVdiVUsPOpGJV0r7B+UxE8byngddh3RUnx+OCSnsOfmsPPzWMaz5uP
         Crag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390817; x=1793995617;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSBRyWxD/L6iGcMkwcVuEPYbqUn6cUjGSKoS/CpmhzU=;
        b=TShAgFbs2at4edBhm23qYhuJTNiE4jcXsvmAfiFS75uZmyzQp1Cx1QxseUTZjklEa0
         UbmIGhnovrLu46HrZcsk9DRM2bcEb63oh9orMstPeRKzDTTtUL9sPRnxbFV5wOU+n4OR
         /GT6Fg6jxjqpP3jNOVzmxIHRbNsGgImjPC4F7yZwwcMbyTBLmC6yX760faXH8pWK48ik
         rchHaOHB5nWYPF2ro/yVsHIsjuYSjWxAE0KdZ93p4EyTynSkFracHaH1naza9gGNVYQs
         F5kKlVXaR/+C7ry3/gD18WAZaPgYjkKP3MKi6PSnyjEpJfwRtZyq1ssHAnRNLBSLuwu8
         vG6A==
X-Gm-Message-State: AFq9FYI7LAjnQOPNR/tKGa5T9xKtf2k+QtAT5yOdJvYf4J6T2jc9b1EQ
	yu4VhgLKXR2Ly+5FpglWypv/MmyFr2wYSP5muQaXRGfz0AjJRCa5fTuLEnIFKFFhVcLGs0YuVC1
	BYU145UijA1kfqMRJeIqcWhlAmb7dJMjc6S8EZXlXsqJzaItbS+VP2Y+jwAdFwWI8QOgTmoZFNP
	R4nN49He8behm0gZPLzfcXaDEPFkANAIhD7f8MhzQGLllb1WEA
X-Gm-Gg: AYBFou2fAFKEBpUEQiF0GpJy8Q5ORSyPurnHq61v9W14jOf6Az4KeU8+YRdtTpY+uAG
	aiMNKyqkX2YzoFF8WlUJzJBCFn0nRUiJYeOahLF4NI8ihGNtbKPlhLYiKXrx1J5BY9zZiydv29b
	7aSnCpdMoM/QDtk1N/5nc+3sQEgoiS5wUuLIB13tlqctTCcwjnzdX3t5YctujovzM+V2emLo0rA
	DEwcpe4fOUoZUFT3kcjUFMJ/G/MXXydsdPFu35o2RDix4jZ/hrM9R2Bdh1ZfBELwijwdzapNh/G
	1Omt2RYzTrWCBbBMwNkZkhSXsxkztN5pkDMJeiycWmJ5wsuutNqzeXl2qbG1dlW+JpQi1jaIcpK
	IZ5P6qEQ0cj9zdyakTj3Pn9M+3B8r4MJk2jWxmoQQQy0LXZP9SZtN4E1yEvAb6dTpnB8LkEK26r
	FqYAm6qAHCHW7r3w==
X-Received: by 2002:a05:7301:490c:b0:36a:1819:4d0c with SMTP id 5a478bee46e88-36a42438ebamr4845650eec.41.1793390817141;
        Fri, 30 Oct 2026 13:06:57 -0700 (PDT)
X-Received: by 2002:a05:7301:490c:b0:36a:1819:4d0c with SMTP id 5a478bee46e88-36a42438ebamr4845613eec.41.1793390816512;
        Fri, 30 Oct 2026 13:06:56 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm10581834eec.29.2026.10.30.13.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:06:55 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v6 0/7] tpm_crb: Add command and response buffer chunking support
Date: Sat, 31 Oct 2026 01:36:42 +0530
Message-ID: <20261030200649.357508-1-armenon@redhat.com>
X-Mailer: git-send-email 2.56.0
Content-Type: text/plain; charset="utf-8"
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

The new version of TCG TPM v185 [1] supports sending data/commands in
chunks for the CRB (Command Response Buffer) interface. This is in line
with the initiative to support PQC algorithms.

This series implements the logic to send and receive larger TPM
cmd/rsp between the linux guest and the TPM backend in chunks.
Currently, the TPM CRB driver is limited by the physical size of the
MMIO window. When userspace attempts to send a payload that exceeds this
size, the driver rejects it.

This series introduces chunking support. The driver now checks the CRB
interface capability for CRB_INTF_CAP_CRB_CHUNK. If supported by the
backend, the driver will slice oversized commands into MMIO-sized
chunks, signalling the backend via CRB_START_NEXT_CHUNK, and finalizing
with CRB_START_INVOKE. Responses are also read back in a similar chunked
manner.

If the backend does not support chunking, the driver retains its legacy
behaviour and enforces the standard size limits.

This feature also requires the QEMU to interpret the data in chunks and
forward it to the TPM backend and subsequently dispatch the TPM response
in chunks back to the linux guest. This is implemented in [2] and
already merged into the mainline.

The whole series applied on top of for-next-tpm (including prerequisite)
can be found here:
https://github.com/armenon-rh/linux/tree/tpm-crb-linux

[1] https://trustedcomputinggroup.org/wp-content/uploads/PC-Client-Specific-Platform-TPM-Profile-for-TPM-2p0-v1p07_Pub.pdf
[2] https://lore.kernel.org/qemu-devel/20260601215410.517009-1-stefanb@linux.ibm.com/

v6
--
-  Rebased on master and the sparse __iomem warning is fixed.

v5
--
- Split [PATCH v4 06/06] into 2. The preparation patch separates the
  no-chunking send() and recv() from chunking.
- Fixed block comments to respect kernel's preferred multi-line style.
- Added citations to the TCG TPM and NIST FIPS documentations. Explained
  the logic and newly introduced registers in brief in the git commit
  message.

v4
--
- Rebased on master (or for-next-tpm, both point to the same commit).
- Resolved one conflict in PATCH v3 05/06, as TPM_BUFSIZE is declared in
  include/linux/tpm_command.h.

v3
--
- Split patch 2, so that the code is cleaner.
- Re-order the buffer size adjustment patch.
- Rename crb_trigger_tpm to tpm_crb_start.
- Add dispatching logic in send and recv functions. Chunking is
  separated from no-chunking for clarity.
- Increase TPM_BUFSIZE in the common file include/linux/tpm.h following,
  [PATCH v9 11/11] tpm-buf: Implement managed allocations
  https://lore.kernel.org/linux-integrity/20260125192526.782202-12-jarkko@kernel.org/

v2
--
- Add size checks before copying memory.
- Update TPM_BUFSIZE to 8KB.
- Commit messages updated to indicate motivation and logic of the change.

Arun Menon (7):
  tpm_crb: Add register definitions of TPM CRB chunking fields
  tpm_crb: Split start method into a separate header
  tpm_crb: Add start_cmd parameter to tpm_crb_start wrapper
  tpm: tis_i2c: Use local 4KB buffer to limit memory usage
  tpm: Increase TPM_BUFSIZE to 8KB for chunking support
  tpm_crb: Factor crb_send()/crb_recv() bodies into helpers
  tpm_crb: Implement command and response chunking logic

 drivers/char/tpm/tpm_crb.c     | 228 +++++++++++++++++++++++++++------
 drivers/char/tpm/tpm_tis_i2c.c |   5 +-
 include/linux/tpm_command.h    |   2 +-
 3 files changed, 190 insertions(+), 45 deletions(-)

-- 
2.56.0

