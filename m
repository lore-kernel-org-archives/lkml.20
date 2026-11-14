Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682724;
	b=GeqZuNfu6imbTx15dyT1QubwAZrQ92jmRJZJSUfQXEBmTnwnWkCVZtQXpPagmbkApawK
	 ArcAgZtJorP+sEYg1bJKwsT2HV8kuuRSdf/2T0VmuNKEjfaWHJvTY/42rgMjg6y/HWQsE
	 P1sRkMt5KurV5uEtHHjYnfspVslikDhKhIzEq9DPxGDmCpXWpCFV/YsHEZGUQYwfekc/y
	 cDbtlyw6pEpxFNXetsnuHUXtJ+JfuL3keazysu1SyD/GaOMluvujmk2wPMlHImdqOuRBL
	 +Zh8+y3lOS6LiVuy684ua81kwX2IDA5r+ge7xsbOG1OlRl3VY90/rx05Gq0BK0Fd8ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=fMcSbwNMVuFNWt2PwLWq1x2zQdIariZoeomQcnglzNI=;
	b=bVaY6oopkEU//VcEhTq+xxv8foF1r8v9U4CF3WGaSHAPw9MWMunjNVM3pWjviNF7LvVi
	 V5YmI3n3e4cEtYvL5yBsRkZbPd7KTg4iI0hcWk9A7+n/5G+WxhzesW5nNP1y8ytu1MRgE
	 n+fjlcGoOFqZGTkxUcovMXl8A6+TJuDr/6WSyDmdgmdOUtFn8jUwgA9wkYewDvFL4nU6M
	 eJ4tsqpofAf90yEEIH9XvlPqyrQQH3O9VTXm/bG+aOCA9Y1N64/e/py6mVTs524ltB8Io
	 HqzJ00yqWQmEh86RgOno9IGjNxxCqUhgahUjyrPx67LW5yd8S/MqwEifkB9+DvUoLmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=YFljydJT;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ED0606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1ED0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=YFljydJT
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jRk1D1BM5z8Xrr9;
	Sun, 15 Nov 2026 02:58:40 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794682720;
	bh=e1/Ez/h43f4/Alk6q3O4DTkElJ6uxXkrIVkjdt3GNQA=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=YFljydJTBeiracuHceVruwh4WJ3hJmYCYp0riookSAefz2m8nIn3PV8l18y27Bqdi
	 htdgCxQO0GD0o++9o/HN/vRau7vTEQrYj2vK0kXhDShXLb7hJ1sUljAa8F2UvuXpV2
	 VqmqajpQ85MW7ONNFd2wXyo2rBHd/xktWNXJtqJG7o7H9xtCVg1ubvbSleEPDEMofo
	 S01MOaaSUybdSr19D9bsLfbb++fUfR1nzYA9Ovt74eJVFB2a4U31Fl1uxA+Z1suplZ
	 THNXRxm9Jw/htAFjHcZ70U+FSonJryZ3w/zOSPNBqgVtujwumFtUhUsjNSN9RKsXvH
	 HR9oIotVX5DXA==
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 6AEIwTPw067780;
	Sun, 15 Nov 2026 02:58:29 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 15 Nov 2026 02:58:32 +0800 (CST)
X-Zmail-TransId: 2af96af8af58f20-86e9a
X-Mailer: Zmail v1.0
Message-ID: <20261115025832904-wsPy8LPoyIcDJ6FMU1_H@zte.com.cn>
In-Reply-To: <aviVQ40at8rZEyjW@gremlin>
References: 20261115004655564ix3vefI54RZ3HhYOmxuKX@zte.com.cn,aviVQ40at8rZEyjW@gremlin
Date: Sun, 15 Nov 2026 02:58:32 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <ljs@kernel.org>
Cc: <akpm@linux-foundation.org>, <liam@infradead.org>, <linux-mm@kvack.org>,
        <vbabka@kernel.org>, <jannh@google.com>, <pfalcato@suse.de>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gbW0vdm1hOiByZXN0b3JlIFZNQSBpdGVyYXRvciBvbiBmdWxsLXJhbmdlIG1lcmdlIGZhaWx1cmU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AEIwTPw067780
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sun, 15 Nov 2026 02:58:40 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF8AF60.000/4jRk1D1BM5z8Xrr9

Hi Lorenzo,

Thank you for taking the time to review these patches. I am sorry for
interrupting your work and for the unnecessary review effort caused by
the iterator report.

I checked the mprotect() caller again. You are right: when the VMA is
revisited, its flags have already been updated and mprotect_fixup()
returns without changing them again. My added assertion established an
iterator position change, not a functional failure. I have withdrawn
that patch.

Since you also raised the breadth of my submissions in the related
threads (https://lore.kernel.org/all/avibe0HG4ssUUuBX@gremlin/), I
checked my submission records to provide some per-subsystem context.
Below are selected subsystems with recorded Reviewed-by or Applied
outcomes through 14 November (UTC+8). Patches first submitted on
15 November are excluded. Each distinct patch is counted once, including
fixes and cleanups; revisions, resends, cover letters and discussion
replies are not counted again.

Subsystem                 Sent  Reviewed-by  Applied  Withdrawn
NVMe/nvmet                  19           11        7          0
UBIFS                       12            6        0          0
ATA                         18            5        7          1
GPIO                         5            3        0          1
target                       8            2        5          0
SCSI                         9            2        3          1
ublk                         5            2        0          0
PCI                          5            1        1          0
MFD                          7            1        0          0
ALSA/ASoC                    5            0        5          0
SPI                          5            0        5          0

"Reviewed-by" counts patches with that explicit review tag. "Applied"
means merged or explicitly applied by a maintainer. A patch can appear
in both columns. "Withdrawn" includes patches I withdrew after review.

For two concrete examples of accepted work:

https://git.kernel.org/linus/08a6572441a4e646c96c2b8d8ead9eea0e458332
https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/commit/?id=fe5988e8708e1d42cb844bd9ac8f0a51388061fc

The first fixes zone-append sector reporting in virtio-blk's polled
completion path; the second fixes a NULL dereference in target ALUA.
These independently reviewed or accepted fixes are why I believe
AI-assisted work can make useful contributions. I remain responsible
for understanding each report and for the correctness of each patch.

I would like to learn from the technical feedback and improve the
quality of my contributions. Thank you for any further guidance you
are willing to offer, and again, sorry for the interruption.

Thanks,
Shao
