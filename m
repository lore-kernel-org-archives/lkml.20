Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297762;
	b=n22sW/kBbEj0kTDYxtN2bgSmLA6EAu2p9sA3csT9IiG25JYDmOXXD1Q64FrWaDVNjrt3
	 YJbBGL3UqoA/VW0XdXuGzVrkwriBuBVAlScWBPICga2XITlImwP+yZ9h3c8qhPeB5gaxf
	 Q5jOT72lEBftGuajI0PHHZ35ao5TtAU2w9VGbdX3pDYezJLTJENg36RidK+VRGwime+AE
	 SeSkzxRP5iAhgf/mWcyo91nGZDlQ6YOqr/QyutNgvXx0X4Y69EOZo6S1hWyAaVPm8rqdr
	 2CQ/NXoAr+Vp8IsNmuddMJipSY/PhvfPSETSllIuW1gJpKg3B66ZvY1Bp0/GEdv8cbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297762;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UtHIiSkqX2bxSTjandVXhxVopv7WL1ebZlXZPqH7xYU=;
	b=iV8hGV3Tj95PTW0VgPsfApOotakPIvCWZFTp1bMu26W6fgXlToNUPStz8AZb4E0adgiR
	 zTqzaUO43H/SNviifyLUKzJiTpImrZIteDxSIhXb2FIdNgXgmeGsiP9HRI4v8hDcr+q/d
	 6A8k8ZoHr7OuVmjNwB6BBZEtXkf7k5fsIakZDU9bxigpsjfmBE3lHunD+s5KE0lb+b45z
	 s9+Mbbeuk0gHd1ElhQErkeKGs24yNk94/xLkW2n+wY206WJ8xV+qnakbtnLEN+sRhXFxu
	 X7UEtFhdOvoJhoFo1HKqF1yISy/WKa6km/M76OuOw/wToAO5/vsvTzhTNWvHGc6SqdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="W/EGHJta";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZQdqC4u6;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC66606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC66606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W/EGHJta;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZQdqC4u6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793297761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UtHIiSkqX2bxSTjandVXhxVopv7WL1ebZlXZPqH7xYU=;
	b=W/EGHJtaM4sl4ONXG4Nl8T6OkWalxagH3geSZDqlV1Svo9kgTWzJlM2SdJMemkWcLXnSui
	PBJb4Aeg2OoSfJYZyjbgYncUJEBUzvQ8MfhyZZJaDXJDJmDhsoJXovUlremLFVdorOKMAO
	Gq90tIjsTBs4/WmSV96yU9xrGybTn4U=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-xCKQ_7zIP2GN884P3qxjRA-1; Thu, 29 Oct 2026 14:15:56 -0400
X-MC-Unique: xCKQ_7zIP2GN884P3qxjRA-1
X-Mimecast-MFC-AGG-ID: xCKQ_7zIP2GN884P3qxjRA_1793297755
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so3116968eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793297755; x=1793902555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtHIiSkqX2bxSTjandVXhxVopv7WL1ebZlXZPqH7xYU=;
        b=ZQdqC4u66b8CtI3GKrk6PVPDK2rL6BB1LCqVoiPmxEvEqTXlNYbfwsVyz767qKVbML
         m/8PxY8x0uTR/JF8AsgpLWlUviGCQ8m4iWj9uuUJJlrM376hOAqxFRtwB7nEo1ANNNB2
         KFAlyd50GZjYw3uSjutjuRAqkPdcE8khsL8hJ08Vo5vKReK4Upa4mV3ugpSK1/DwxEdM
         g+nxOD7EPfP4nTsh/BBicknM8LLMT8M1D0RQ7c55uxhNu7B0jOmCdSH+8VnvxSIRsXf1
         sZnSmg0DbkQq3w6QRUHRuRAq8tjrjBHSHuQ0Hu+p0jevVNydhVPcTDkhqttWnixFaxp9
         pseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297755; x=1793902555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UtHIiSkqX2bxSTjandVXhxVopv7WL1ebZlXZPqH7xYU=;
        b=DqGt2TJFxq8vRSFJ6s41BmiU4DvJjOm/mR0IC9/6GjLVN04TlbmeE9zKhBET1x10Zl
         j4yeqriiibD7nERMhLeHvLhDN2+3651k6y93YdWJmdKf2/mUD3iFXZa7c8fmo8rShz+o
         HLQ6RHFmoOqC5Kt5oDOUf3gNyYRn3CNkgJq5bTZbkIK/dYZ4SWyNpsK534oEDF5RugZw
         TXujsV/3kHLjJlAsdrNqSZeFNp4OkUPKzlXzTEv/MJgV3Q2dKk4QNtE3+xy3jkxX78TL
         mdDLD2WmOoEp7d85VrBmDZRYLJfHU/Ux0ip7aBRFhiQYmPb/CTf6K3VHo5fB8RWGx7ap
         UlkA==
X-Gm-Message-State: AFq9FYLxdrah3cNfP65f3pnmmsecuqncehvHK2vCZHIjAdkt/Eldh6MJ
	aUcuRoeJznOvrgeslDW3J7mtE3UQ8nCuMH6IIE0UiEDoYZiMkFfoy97WQM48BNfFyK9RyQExLcx
	90Vhdm68uAeUTlK/0iOfsWseQ/D3fmR+tx4c7bS9a2gZX56RjNF0pvCyw2Wo3lVRhCPG7brIT4z
	gcQd2mW1X1bDI/Rg+wrJJQOZpH6mdWSDPM+1nXZc3QrBiPkpKE
X-Gm-Gg: AYBFou02eBjTHM9kaihOShuTo5cY4chFdJnOrHidTXEBzsYS2kJh2VzSzvD1UD/W+iA
	w6per4+N43a1gvYcbcfBkXQ35pe36e9FzZZa1E/wjbTSFX+3V+FxFFgho03kyVqjwY36vfXZZSz
	rbukbjGSjjBgV/4ULSisX7T03FPhrRj5jWtau6qmPjdWPlcWtefdLeuZqrvl0o1OUlxDBzSHVdP
	a4PZgPlmlNfhtnBGaobZzSjf0IhZs6C2Fl1q0kLxnIgHFsBtrf81jUp5+wZsxh8Ef7BxGM21N4r
	u6NY2dsrxYfI1wyM5v+Nnk0sFp4V4OKmQe6gCEPX0JZBEIyFxMqSQbHYjTZH9zrxX9vmOTQOly0
	xEZ3d++zBkQhvU7R5bu0Z/ghq+7S20F+kvR82Ormrr+RjR5xqfVGcScovm+icCVLYlYGOQhDQVt
	DI8Al2n0bDEknh4g==
X-Received: by 2002:a05:693c:6211:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-36a42417707mr205744eec.30.1793297755062;
        Thu, 29 Oct 2026 11:15:55 -0700 (PDT)
X-Received: by 2002:a05:693c:6211:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-36a42417707mr205705eec.30.1793297754300;
        Thu, 29 Oct 2026 11:15:54 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm259163eec.4.2026.10.29.11.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:15:51 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Peter Huewe <peterhuewe@gmx.de>,
	linux-integrity@vger.kernel.org,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v5 1/7] tpm_crb: Add register definitions of TPM CRB chunking fields
Date: Thu, 29 Oct 2026 23:45:35 +0530
Message-ID: <20261029181541.99505-2-armenon@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029181541.99505-1-armenon@redhat.com>
References: <20261029181541.99505-1-armenon@redhat.com>
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

From: Arun Menon <armenon@redhat.com>

Post-quantum cryptographic (PQC) algorithms can require buffer sizes that
exceed the physical capacity of the TPM's Command/Response Buffer (CRB).
To support these larger payloads, the TPM 2.0 CRB specification [1]
allows for data chunking when the physical MMIO window is smaller than
the required buffer size.

To support this protocol, the TPM driver must be able to detect the
chunking capability, and signal the backend using specific start
method flags, also known as the control area start register bits.

As per sections 6.4.2.2 and 6.5.3.9 of the specification document [1]
Add 2 new bit flags to the existing enum crb_start and add the
capability bit.
- CRB_INTF_CAP_CRB_CHUNK: A capability bit used to detect if the backend
  supports chunking.
- CRB_START_NEXT_CHUNK: A control bit to signal the TPM to consume the
  current command buffer, or to get the next chunk from the response
  buffer.
- CRB_START_RESP_RETRY: A control bit to signal retransmission of a
  response buffer.

[1] https://trustedcomputinggroup.org/wp-content/uploads/PC-Client-Specific-Platform-TPM-Profile-for-TPM-2p0-v1p07_rc1_121225.pdf

Signed-off-by: Arun Menon <armenon@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 drivers/char/tpm/tpm_crb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index ceb4100ba400..d76f9e30f036 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -57,12 +57,18 @@ enum crb_ctrl_sts {
 
 enum crb_start {
 	CRB_START_INVOKE	= BIT(0),
+	CRB_START_RESP_RETRY = BIT(1),
+	CRB_START_NEXT_CHUNK = BIT(2),
 };
 
 enum crb_cancel {
 	CRB_CANCEL_INVOKE	= BIT(0),
 };
 
+enum crb_intf {
+	CRB_INTF_CAP_CRB_CHUNK = BIT(10),
+};
+
 struct crb_regs_head {
 	u32 loc_state;
 	u32 reserved1;
-- 
2.56.0

