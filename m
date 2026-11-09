Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253707;
	b=5AfIJkHq9Q9anuH8xqD1AOlO9FDA9xyxqxE0hHl1VN02/UFJyKj+NjOL2n1MqKA+WkdJ
	 5+bVkrL0VFuo6voGhkycKePesggh1VdOo6XwT8/Llfv6bDF59XqC2Ht1+h/amv6z6WODj
	 bSBMFswZ5C8bRerMZp4Z9mBScTdYwU/joFCwTle86I8XQoAWEXoEZg3K04ocAkip8He5s
	 5Q4ePPBBdjEBwYypAuHaLgsHxP0IEmwzeonsPQj6WAtz4wZMuMdL7voFq6frbYP7dhnHk
	 0N1/pfMHzw/jtlSkIniErTrzBO5AygxJJ+fYXXOoBoQzqeeosgPWLJsXB8wdBxQoMMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zIOHG13Qku7I3M4LMmNicqKWCM5oJcm1CTDilGVoAb8=;
	b=dxRPiEN6qWX8Fe5yDYS104ggyWoFZ7QfCQKHMNHTF1G3YNE7dLqITWeLDUXGXZ1ue3Qk
	 QSeReo0OGl0x3TngzWwn8/wzMJe/b8S2ECVIjZ3SnM7i4SvNlq6iWyS/mQyGi5nJ5+fU5
	 alx6kobGZvLDY+yfeyz2KH4GPXdZ+BYzVTdJ6SadfJAfVVgiMO5h82BlMJzqZzPxecQco
	 YhqOV0a5Cw3oA7FptNfS6IXj9WwspHu819MW3VOP5Z3yhOKJGVDU1bCGvPbVlHEr4BvbQ
	 zWmKGAKg1PuqsaaOX3rJa8i3BH/395MdB8jjONNgh7BLQMOXQ9nYljI7PDe2lekIZ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F/Da1BX3";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288ED606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 288ED606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F/Da1BX3
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37000e7234bso1660603eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253706; x=1794858506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIOHG13Qku7I3M4LMmNicqKWCM5oJcm1CTDilGVoAb8=;
        b=F/Da1BX3Z0rwbH9MUtbdPn7lpC9PbdpfMPFkuyApexhhk8QWdw974+ql+KeOlJZ3WJ
         A756Fh23CxaNDENfaqcfleQo92rz0Ja5bg3wBVp/lYyngVBHuPIO1vS/RJKQkVkQ1cWa
         bmgd+NIxs5xzoDR0Rpme9PVbYlvMw40s1xX+R7i+CY2G6zviG/JLRJvh1OTIHzsmWjbS
         MkSlRfNT7O0nVWhqMFC8/sSAGXN28AB6jIlXO1WGgBD2SpbjcELrd/WqBDiMRsBhQAe1
         5bQKG6/eQIDZyI3f1ny4FWl6UHckO+cSMv9DqEmtGK/EAjUzX0cI56NyCSnWWkcOoWz4
         hXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253706; x=1794858506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIOHG13Qku7I3M4LMmNicqKWCM5oJcm1CTDilGVoAb8=;
        b=pBvt6wMtUj5MKaok9Ve9TFhEH7HCelpZY0u3P7P8pR5lK0oM/NOm6mpzAnC9SMpkav
         unL6yQHypeEGpGI04sXFuizuEpQTbU9r8dI6vPXPU/afprrIcEerOEKEB52aVh61957D
         KAjs++V0DPeknKCz1K/hY2u2UdtW6Zjp6x6gl9Lw/PVbetHQgAtg6MDJzpVjJZpFViPW
         U6JSk+XSaFlwySUAuXbbm1WG3Po/ZfK4H45lqsO9cCXmnIFBUjBiyk5HLqb3Agogb4hE
         qGkB45neISckckptdyWWyI8RjFJGgq0++31gi4W+U63MQ48luI06pjSWbRpxykvlGrRW
         XS2Q==
X-Forwarded-Encrypted: i=1; AL+hErHPbEvKF1T3Wah6ZhpFV8bBeYV6t2mGo6SPpfHcgMmHCGSMsG4TM1gCsBdkLK/jamA85N7bJqPM89cdGZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A09mmi2BNZcvT2msYoxgqp6V7cw2qyJhGVvGZoRchmf0Lpss7
	Ah6ty9Rmj3W1JpIETbhMkLKPREFcFC8WiFSNm8+v5tdlA2JswbR2DEdH
X-Gm-Gg: AYBFou1a5dGITr88aJi2zExVhjmEu+9kZMmFQ1HlvcO+aeLBh6YsFvyVwkwSUFL1eXV
	5/HCylRcY/uE2Rfk5zlIsBvJQDTWqYl9QVmHcUUzdAjBxvBlh9CVj+2lW92YV0MrTS0erEs3kbX
	AhIEY18+M8nayZex5SL3irEjQ8+MF7qG2d/+hMBVb23FT/kScl1K72KyT1GgbxIw8UqS5hl9rLA
	XdP+TH3s+vqgeInsOfsWokeiywGqKa7M2gViQ8mdP2jlhjfZFxfmcdz7wtZDKCuICCu+KeC6/tw
	enRGSU7sFCGZjXATF29/jXkb2SHv1GXhmGb7wBZfKEC2cnWMMLRxHS3lb98dIyLW6wWNpM3rmld
	rDRoEVYjEbu2TdYUgXZK5jcUHc/NrbfhOJPiRp+RlvwwAtWF4xtjM68aO4SWI9fKO3rijkY1YSR
	5RN0v/bWTNa7Os2G9dXMiWYcNHkRvdLj1HXKM0ikcvQPTIyLzG0tIfnkoFAxu+hLSog1MVPpe40
	F0g/8mj1ivZ7GJSnlJGzAODhVZNA9qEY6iD/trH33JIG1h+fB2uxFhVTGTB5OfJqln04t2f1m2O
	EfeQRQ4jBSVgTlM17ZqHHL2ibXJSqbuh0wsAUekN/qiKuoKJlBZ9sILaEOenZdhS
X-Received: by 2002:a05:7301:d184:b0:36d:a465:b38e with SMTP id 5a478bee46e88-3751c53689emr407134eec.5.1794253706090;
        Mon, 09 Nov 2026 11:48:26 -0800 (PST)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm530164eec.8.2026.11.09.11.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:25 -0800 (PST)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: Sahaj Chaudhari <sahaj123.sc@gmail.com>,
	j-keerthy@ti.com,
	nsekhar@ti.com,
	prabhakar.csengg@gmail.com,
	avinashphilip@ti.com,
	sujithkv@ti.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] gpio: davinci: fix probe-time IRQ setup
Date: Tue, 10 Nov 2026 01:19:08 +0530
Message-ID: <20261109194910.2282454-1-sahaj123.sc@gmail.com>
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

This series fixes two independent probe-time bugs in the DaVinci GPIO
driver:

1. A file-global MMIO base can be overwritten by overlapping controller
   probes, causing BINTEN setup to target the wrong controller.
2. Per-bank IRQ data is allocated as chained handlers are installed. A
   later allocation failure can leave handlers pointing to devm-managed
   data freed during probe unwind.

The first patch derives BINTEN from the current controller's mapped bank.
The second allocates all IRQ data before installing any handlers.

---
Testing:
- ARM64 W=1 Image builds passed for both patches.
- On AM642, a forced asynchronous-probe interleave made the baseline
  compute the wrong BINTEN target. The test redirected the unsafe baseline
  write before it reached hardware; the fixed path selected the expected
  target and verified readback 0x3f.
- With targeted probe allocation failure, the baseline left one chained
  handler installed; it was detached safely before devm cleanup. The fixed
  path left no handlers installed and reprobed normally.

The private baseline and fixed kernels showed unexplained
TAINT_MACHINE_CHECK bit 16. No BUG/Oops/WARNING/call trace/SError was
captured; the cause remains unknown, so this is not a clean hardware-health
claim.

GitHub Copilot CLI assisted with investigating the bugs and drafting the
fixes. The submitter reviewed the code and personally ran both board tests.

Sahaj Chaudhari (2):
  gpio: davinci: use controller-specific MMIO for BINTEN
  gpio: davinci: allocate bank IRQ data before installing handlers

 drivers/gpio/gpio-davinci.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

base-commit: 4fc2c9ab68f4324bea62cb5a43e93392225f1d11

-- 
2.43.0

