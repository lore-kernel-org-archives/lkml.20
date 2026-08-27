Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC9037F8D6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851978; cv=pass; b=Ue6vquKAxCX1cly1doAs52N4KyedxerHNvrGAMyXqe3Ag/spQX/Ejgse1gTg/U6vBDaalnoKEweqaJW1fB9iN2dz+eA7/P1FmXhNtOfvDaeFyXJQKDu1KImudsnAe4WeZp1DXE8EH6dT4I3OuBg4vPXF3tc17EZPcZ85YNx4Q68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851978; c=relaxed/simple;
	bh=3JUS29UpP0tjMzt5rlQ6iVe2Fv70kH7TSVP13qbejKc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tAK5fpxLhOJv6VuFCBg1Xd3x4l2bquBxZvDuKkzvA7rCfcS4n7TzIjfmDS7PwAcWbKEFLQ4e6fa1k/zBa89wvSWNE5a/XoEhpfh7CEgMUkR91mVuXQOFF98JUpZbR6IT8V+qqAo9vAg5Is4nf+EGeX1/ELQx3RDAO1QR6QTngOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZMv71J+; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZMv71J+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d7200b2e15so987175ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787851976; cv=none;
        d=google.com; s=arc-20260327;
        b=hfp66WiGsEtU6zf/ZeB13gl2Vhx71Pt7yCVv9FBDLYJOjOcJvuo/Yr2yLbKr26JP3k
         jYSdxKEqAAhhS59mNvAPuCz5KjCLmvp87wlUSuCWjjFst3vMZXUw19mEGD4Yrom8twPU
         b57amVcfhD48kaBEx4G7/Y5NZIDGMJ81s43NPoguxdqC3Ty6WlvHWlabHLowpv1T3C0b
         X5hCwC5H+1YmLcFzJ7RwSaZt58j8lhOVwUhnFX0UcHpdrhANhZca5fWQd2hirOKZhTj/
         SJwsjb3ZNv17coG1D1Aa5gquPobWPzm6+hw3iHNJYBAmOxk0Gj7I3tVstdmoZnf3r//F
         lZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=vbKYmLU98l6vY14xKmLi8SPVCiSpyKCJuPRcxtrBtD0=;
        fh=V9AeBafJgTW96HdC48wsxGAfd7Fe9P2uAL8tLCjpUN4=;
        b=Ag0CLgdjeAWF6XTEECZnD2L/cOnuoNwwGygVOdO5RgjpzdJf3hWK9DPd3BLo7OHq1b
         IYTaA1Rd4fT2zFIFjD1YUjqmSYwUBhfA1nay26TPJJ2Rpi+vMdsytqUlrzZPuoo1YQF5
         jObwp22HdZW71LPt0KrvatyKd/hWAW2tAv/kZam2Q8Xk76keKLBiU9dLZQwckmlrzIQC
         XKLKnR5d4661D8IBrpR6EKVnRDEo5F1LIFCkq6UCPmS3n6610HU3kMPJYp/LlfjFKEl8
         kT8/dZeYnM5B2y+4RVdUL5/C/+ii9Bv9rvjvGXLArqGvIpscFyu9T9iZGh3qlUvxLskp
         5LFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851976; x=1788456776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbKYmLU98l6vY14xKmLi8SPVCiSpyKCJuPRcxtrBtD0=;
        b=TZMv71J+JzIBSXhkZbEPlPz637/P1w5QtMJYe9wc2B3/5/sVm4npkbtoFdFk5qFZZc
         Sql+mWDnh2glG5oGnKrrJPXFYIqRRLVyaiSdPQRorQWh9pfBVskmwXt7uUhe1fnfi+/Q
         VGDp7puw04Ixw8hsrLzvWOsiogt77goMs/XQLmw5EUx8uPFR8OGIovhwAP/58mL3DxnE
         ky5Aze7tTWzSVuIt7f/O+MqRxElJl/sHSWqKb3V/y8GAtxpc/JjSOzgjJE09rSJIK75g
         BA/mUeYg6TawbmcWroEVsWvr6C9Gx5tiQ6i092ktLO9OTtAPlu/lcLtBD1+5YQJkABpk
         dcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851976; x=1788456776;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbKYmLU98l6vY14xKmLi8SPVCiSpyKCJuPRcxtrBtD0=;
        b=WIcn6x/e8ZxtMBho42WTKSMLtzJMc35DOTReh4sgQBx4DmCZvbCqEinhpAbiIoN4zJ
         4MDaC0RDbm14MQnht+w8AFX+oUx0exKNGBGgqXbU2ZNUiimm1M0kzdswXDK3TuCbf774
         Gb+a+Ur8+mqG7PH/okxMwXiiMCrrJCixT36Dn9EGvNPdJbhlCj/D0sHNZHQjf0dwL1w8
         A6ZTsQbsMcPRfDQ6h0/cO11E9AnMFgvqWgKuTXGteYdcQ+sEaIsgOdd4ait1JTipVGuc
         H/iSJur2x1YQbCt82bPQflYvSVUkWP+JZdIZECfTfBCFb+AFit6/SC9P4F3RtiCRwx40
         pKfg==
X-Gm-Message-State: AFuF++lUXNBVLc1TJSPNtbLH3SjtVY13V8MLsfq7KH6U3NffhySNSx1R
	nXix6TWHbwjiuOyJPs1ejSheUdg/40UL7qAcFsLP6OeQTkvBmhYngEjjGAufR7t4UAurvFjA68E
	ojeefqit9mG3taPtCNSer9nb8hAQilT2Kk8mQOls=
X-Gm-Gg: AR+sD123i2nz1ZLOsJktcFz9gnzgtRpSTDB1lXfB9eB1h71Ck4kaK4tVR6RapDjMNc+
	2y6CgCo9ldM+A/ZQ438BDh1a0S7cEDCZ8clUto99GaAXnDxMGps+J+ZKrtVI6fRu1KzYVwJo/6L
	dEaxifhVcDRlhCmUb9uOxOpIGdWcO2ZzvgP8pxdvAIlgsGc2nKMknFa7jF+1HTs0SQsxJmmPW5J
	2KVEdbkjOeIhSyVfUqJersVKz5W5jDpZd0+1PI7HjWqk2ZfrUEngvVknUsX0JpvIYLAuR7oRwhT
	OX7EN0gH3EyU39MQxltBKyH2k9lMJUM+H9/49u/pTo9bUSg=
X-Received: by 2002:a17:902:e549:b0:2ca:6eca:492f with SMTP id
 d9443c01a7336-2d74df5f87cmr7374385ad.14.1787851976378; Thu, 27 Aug 2026
 10:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: viney kumar <viney.kumar@gmail.com>
Date: Thu, 27 Aug 2026 23:02:44 +0530
X-Gm-Features: AcwNN1XO8q-N4xTBjKw263XYvJBVkowoDLNTZyMzjC7g6h2IsnOgGsQNl5LeRTU
Message-ID: <CA+NqQMLJ8-S=S3qUyJvj-aJUbcZ4SV6akn_RhQWuUSngykQ2pg@mail.gmail.com>
Subject: [QUESTION] Memory isolation between critical and deferrable workloads
 in embedded Linux
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am working on a memory-constrained embedded Linux system and looking
for an effective way to reduce RAM pressure.

approach under consideration:  To classify threads into categories
based on their importance:
Critical =E2=80=93 must remain operational
Normal =E2=80=93 regular functionality
Deferrable =E2=80=93 activity can be delayed or suspended under memory
pressure, till memory is available in this category pool.

I am considering assigning a shared, bounded memory pool/budget to
each category.
which would be used by all threads belonging to that category.
Query:
1. Is this approach effective for managing RAM pressure in Linux?
2. If yes, What is the recommended way to implement category-level
memory pools or memory budgets for groups of threads in Linux?

Thanks in anticipation !
