Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573114;
	b=2Udby7jDhpeVK7cdGa5KiN0SquD+Mic5PsfBzYFNNY5+X7jc6jcqj/yFQlPQINS6D2Ar
	 uq/NQV254ofnHCCjpTsU4LnZwQvGglsLcV5Mk3pKG5XDtpl+OmsN1Wh7abCMCr3EalINp
	 6MITK5hH22ioftZcZ1RqKMJscB+r9X+Kj5rHaZPOC37TPZX6rkCIKfstA4/5B95eQrMXe
	 bUrLbX8yRgrGaLMAvOv007y/XV36uRhay4urjXAMzqYhMH6semd7YWOVE4s5JupZ3GPyi
	 hYEEALqbmg1l2Y4mzPavtomqvC+UtbcBRdqtlunPaOcdx/DHbQr8/VeE5TqCRbkGgiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h57GRlCyH5Qwzw7Fjj7aWeliQUGBEVr9VFDUhDmpCbw=;
	b=FeovRfrAXgIAk3+BwyaEqQGjkC5IK6tbpDi6oHSrwAh6wyePF9Tq0X79A8/dh06jdJOU
	 IxVtWZBxvYcVl7fnyWUNnsnw5rCBufxfiJDcX5IT6/4rW+euUlyAlmC6/TUWlzzg4ybGM
	 q+ehiDsNHnpO70QznmCPucHSjMEyAW/d06Fx4I0CI76J7bCdjuEkdpJnaOlFHFU9e4hC+
	 fTEMIddgsyyaYi7YHWLza+V5nnIAaPJ94ZXuuGtqDM2qz9ksgW0BsZlm8LPSF83VjzGbE
	 BE8b80dVc3Y7W5I6jYpMGUu4FtRBmY9FSLFZFEcwfegX1auRpdKOqncdFtKgzSywLog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYfc+A0M;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CB2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61CB2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYfc+A0M
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-372bdb942dbso991739eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794573113; x=1795177913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h57GRlCyH5Qwzw7Fjj7aWeliQUGBEVr9VFDUhDmpCbw=;
        b=gYfc+A0MoFCp2PcKOIyeHRCc2Ey2SiL9xW+BZlS3UJoiB6ox4Q1N0C6Jxgbtqrcl6M
         d9tK/NyGRHtH5dpmK78mZFwOCB2brUSvW6mvhRxvzZgqfI85bZ1shFNXHlH4E1r5dl6O
         WwVI+SumqfPCIcdlNwdjc5DQ/C4oBr76fgfYQUW70sgmHeDTF6GxSkLNg2cjVCQrnJkw
         Sjf6XtzRi8tBfCqiW83Y7izfhV6y/h9p8Qte9/TJhMiN9D3spyLoQiSMbsfzne6VZQZD
         HsI0EHnOub8Z4qoeIFRcwyV5XZBOlJt84pwHwifLLDa2ePr6XaF8NUpDwZJw+c3CX/Q/
         PrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573113; x=1795177913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h57GRlCyH5Qwzw7Fjj7aWeliQUGBEVr9VFDUhDmpCbw=;
        b=w1dYklz0uMdSJV1aa/RVAaZPhuKcR8T98e98g1lQ4fG9J1Pq+/Z3NTJ0CAeS7H5nw4
         +qcS3IM+Q7A+xCEQge5R4q4XdpvSj23H6Skgvyox0UIqk8jHsM9WRC/Szpoac6aIbyj4
         bl+wakwbyo7DhhfzpkwFjx07kfswEDQpLlAcZQHrS2v7Ky9R+gYiWSl6eRFZ4oKIBIFZ
         zVqgX/twP5BN2IiXvvgYOIMU7JwjnndG/5csShmzUI99lgb+GGNz8eKX4wQ1gBDmhp7l
         9gBrhQdBkUQ9xmVY+aHIKiWg/srouy29/10yOsF4/ESMBjoYizRQ6nxN15tsew2orpt5
         OO5g==
X-Forwarded-Encrypted: i=1; AL+hErH+l62XW6vmNPS0GtpH45VKUTzzQ6jjZOVnBzJ+oKbSzivJvXOeCfELhCDLFlvN1BeTH/OI/maDQ60Nh+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/23KKA5SWq4XfWDRXQoJzSbXJFRdjBH+leSsZS5dYz52epcx7i
	fQXYQC6Hr5PIcYPoe0Ig0+io0nIXJ066OLP360KwrP1WbsJfcikcL9V1VvyaLg==
X-Gm-Gg: AYBFou3T9lmuST5nwF2Vqo/BqSvNL7JfXAwVI6c5V4R2M1CLyZRh8b1m+hvcHp5maJ5
	GMSGxR5eAwo9KZJUnEmKi9MOxYUQlFXRU8FZwigw8jkQxpVnV2b1sxTNAvKR9q5XkCTaDRChYUE
	I99AVzU0fTDgDdDaTuRau69lLVP6ub19GLowtDaYVKgcXtV/m0L/o33NaI3gVW8ym+ENvXWAAhL
	1JkJ9uBvkS9W/0fFPunocl0G4hQkHpxVaXdoTvaVh9ZCeOFHiUGR+DfczgeCvNprsnQzlUCAXkH
	xHaekYN5qc4X1QGltWsR2A3zFLH5j7piG+hHN28GLxVG4s2XYMhzJhkzhjKI3QFPXS6j3CXCVzi
	Snklivv6aBf4jnYen4tcFsSbQumzFSeoAX9IaFm4U0s+jIHCl/oo8AESGkTTmIF5boHPTcbEIwX
	WzW0JT2xCRLxQoGglLOgUX/ASB17jFdsyu93KyDB0yHbm4cjo+9U/6RZzYULHWf2VyK8PL+6Tou
	wJw/j/x52ghDh8neP9Og2tDCk8b516Pl1Lv/Ww3fK9GSZ9Z0PH0w6jNVaDn1UEbdjnHse+2vBZz
	6+sOq1Pp0/9CCa7DTMYktjYOdTXe16GKXA==
X-Received: by 2002:a05:693c:8206:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-37966e3ab88mr2258546eec.7.1794573113194;
        Fri, 13 Nov 2026 04:31:53 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm7215936eec.10.2026.11.13.04.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:31:48 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 0/3] powerpc: kprobes insn page fixes
Date: Fri, 13 Nov 2026 18:01:35 +0530
Message-Id: <cover.1794572365.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Hi All,

A few fixes that came out of looking at a W+X warning at boot with
KPROBES=y and MODULES=n.

- Patch-1 fixes that warning.
- Patch-2 (reported by Sashiko) fixes an oops on book3s/32 when a kprobe has to
  single step an instruction out of line, the insn page was in an NX segment.
- Patch-3 makes ptdump show "X" for kernel mappings on e500, which was noticed
  while testing the other two.

Ritesh Harjani (IBM) (3):
  powerpc/execmem: Don't leave kprobes insn pages W+X when CONFIG_MODULES=n
  powerpc/execmem: Allocate kprobes insn pages from the modules area on book3s/32
  powerpc/ptdump: Show the exec flag of kernel mappings on e500

 arch/powerpc/mm/mem.c           | 12 +++++++++---
 arch/powerpc/mm/ptdump/shared.c |  6 +++---
 2 files changed, 12 insertions(+), 6 deletions(-)

--
2.39.5

