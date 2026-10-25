Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959551;
	b=T8D+jAzuvwIDD/ZJqehyCw7zTSZnhhkwXuTJK0b2F59MmTl+kcBAiZo3e99P3U1uJRjp
	 taV3dpWZm5sFDjO9jzIiOWVyxy7hSHu5usJWnbzPfnRPxs8c0PNqFmSJCy2Im4rfupw9l
	 tY2vpCFCDlZsZNwKc5speHvT4BPu00DQfyc+5rl89JHzgzZFH9+rJxv0Cvloy9fy4rHHz
	 GbZ2K2JX0LI+0JGT6z+NDhLhZB5Vj7mmK4FEn1rQhflvRrtLVJv3JyQt1sTeCIP4SntxJ
	 JzK89or3s6UNBrf/zTCx+T7hP7E6U2Pbfic6L7Yn7sZgxF2BMPZ31ImQTnKI8H8viVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959551;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=38omCnsO4pVkAGZlh9VCUkEXdgM52Ut5/eZHNeUrnD4=;
	b=mFSB/crncJ5vkyjnffhxgTCr/1u6QEH1v0v7Z3WBgvtLavjYfYokX/JAh2LKShTsoDK+
	 txx4TQtPfOhrjHiPr7zl+cK9k9vO4b5kbMnjm1STbJI0kvtU+umGHJBQ+KjvcBbZkm6f+
	 X2Iv3tiomRmOMQAPRZ97GPMcx+peK/WPIxb41k5VKzQWf+19D1ImjYWnacEtmM6TCyf6+
	 2Z7pfvtQAQBNv92cxAoiZdTXMLRT6Yk0gIwwNSZwnBhbGpbhAGluskLsPedRNG5p1IOAD
	 Um5+w6SKqiKfQnIAItFiynMznaOsfhl1TMO08h47mI0MVeMHPlfOIQe8xrRRaL49H7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ai08Rdew;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=idE3UMqd;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561C2606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 561C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ai08Rdew;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=idE3UMqd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792959549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=38omCnsO4pVkAGZlh9VCUkEXdgM52Ut5/eZHNeUrnD4=;
	b=ai08RdewpgCkSd2IFZejSZOerCvWZmCZ7zeup5+pnv+WZWnhujzrJHBJTS/3ma44FOSqdp
	TDtu8Djw0J6x7jZrTlfaiG5j0dEqxDa+2JREuUxPoEuu0XnkBqdPMvSmzsVCYWdmAYHv6i
	fkgArk4t9QZKCOv4muzRSxKk7ZOYSXQ=
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com
 [74.125.82.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-IKHds1u8Mq2HTxnxyNT2qg-1; Sun, 25 Oct 2026 16:19:07 -0400
X-MC-Unique: IKHds1u8Mq2HTxnxyNT2qg-1
X-Mimecast-MFC-AGG-ID: IKHds1u8Mq2HTxnxyNT2qg_1792959547
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso4510019c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792959546; x=1793564346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38omCnsO4pVkAGZlh9VCUkEXdgM52Ut5/eZHNeUrnD4=;
        b=idE3UMqdtax/dl+u1EWX8lzLXUHssBV/OJlDqTyJ+tUlo67BIhfI/OKfXudRvf9GqG
         cRxKtqmGZDP4Dc6ZHtr67uV8Jq6PosNLHyarZPvGe8dtYrdIUdw7tN3M9OvpfhkZDFlv
         RvcWWW2JPq2FyRD2n1G3r4a7PdenPNgGAexUKRqJbXpFnA+FhJh8BBcR8JF+aGcWlLIw
         jLWxhOUrvdILjLezReWPVU22WJReLbdePqxmC0qq5nBYdHity1zyv7nwKZb8B5EhQSZq
         tnynhEGD89mjSE/nurszZWFqtWLMPOF1Kt2Rt7GMCjIasMyIaakVoBy87B8ueXNGTbyJ
         shjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792959546; x=1793564346;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=38omCnsO4pVkAGZlh9VCUkEXdgM52Ut5/eZHNeUrnD4=;
        b=IPmEEworfOAoxI8xB2esN/wBVBc8HrMNsn5ewn0cxi+NNOV1BB+Vs+aChdKR11c9KF
         7N2aSgbBKNoodxuM+MvwWhELL+FSk+R96S1giWG62cL4Tv7ODcJo33br9gvI9OQcYesA
         KPWzY9Sn8rX16kZcJQubZEaSDNvftBdcR5g6+iXL2etv+ULlin/VyYWrE1x6S5vcdwPD
         brrhjJqsW+BLeWyle3VB6oobBtvTozg6y5qrVpdDCpyL12aDFgKB/mQJXfTd684bfqZt
         CBuz2YYzyG59deeeT8x68kySvKwnwgM68dXtHVxHHYJFxs7ImEgtvM2Qll1NF1//WsSD
         kRkw==
X-Gm-Message-State: AFq9FYLpW81lclIBW5ZkF4DFAEkN+PsW3Z55C4CwSdu7ElAdX+uCSgAC
	I/V4zpD0NJU240yBppBtEuXPck2++h34Vw/5yPsQck2UsDRKFwnhJyKls0DSvNC1ZW9hQANxgWr
	1KQTGs0LsoQdD59MljYEBWfC3d1mK/cTEHDagu6ls2FPVSKAYQl2fybN5cKKrHEWVgskw15WepQ
	3X9/7ORo9VipELzXIPoTB0g14aeGK5US9fdZE1A23CcI9+c5HZ
X-Gm-Gg: AYBFou2zQoXHbTc+ztiyVygTFIFOnsZZNghd5FWZ7mBotnc2XBWFz7Rr/LZu2/9yveA
	K7y7NkZYxoRvTWwpcFhSuc4qF9o4ErIUgYovdEtkoWZsdL5pIJFBsepzaNEViR10lG4oKuacHWf
	BYXWcSjZ4Bqfz98hRTO67WbJLvPTRTwzZ5QW3Bx/ywpQ9br7cLpRB9VkIJAAujIXtsCBKpmTKYP
	soVONGgoo7eaTRfnQHrtKDFk0nZkg6GlF0P9++8yRdHDQgi7lJjg0qXOJtXxG1JaUHqXDLeAmw8
	3fOynLwjwT6OcAvG0QKX1OoDTDJojGwiAYgYsPyAnllaOI13Ew2lvPB3+TmXgf4Ac5UjpeWzDWc
	DrcvSPwO0Y4G1E/+1UcksUPMJhwoA22foIrOa49kT
X-Received: by 2002:a05:7022:e28:b0:14b:cf58:ce5e with SMTP id a92af1059eb24-1991b42085bmr10139605c88.0.1792959546229;
        Sun, 25 Oct 2026 13:19:06 -0700 (PDT)
X-Received: by 2002:a05:7022:e28:b0:14b:cf58:ce5e with SMTP id a92af1059eb24-1991b42085bmr10139568c88.0.1792959545352;
        Sun, 25 Oct 2026 13:19:05 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm17656169c88.3.2026.10.25.13.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:19:04 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v4 0/6] tpm_crb: Add command and response buffer chunking support
Date: Mon, 26 Oct 2026 01:48:52 +0530
Message-ID: <20261025201859.221991-1-armenon@redhat.com>
X-Mailer: git-send-email 2.54.0
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

Arun Menon (6):
  tpm_crb: Add register definitions of TPM CRB chunking fields
  tpm_crb: Split start method into a separate header
  tpm_crb: Add start_cmd parameter to tpm_crb_start wrapper
  tpm: tis_i2c: Use local 4KB buffer to limit memory usage
  tpm: Increase TPM_BUFSIZE to 8kB for chunking support
  tpm_crb: Implement command and response chunking logic

 drivers/char/tpm/tpm_crb.c     | 257 +++++++++++++++++++++++++--------
 drivers/char/tpm/tpm_tis_i2c.c |   6 +-
 include/linux/tpm_command.h    |   2 +-
 3 files changed, 204 insertions(+), 61 deletions(-)

-- 
2.54.0

