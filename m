Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880468;
	b=tmByy3kJIbN6M8qQuyqk6pQpoXUAIxMcb2VDmrHPC7iR1R0OhYfZGMMCW3TrvwdvU9Eo
	 gro1MoPdOfsWIQOyCqaWa/ZJbn1SMm+lEb2eeHZNY/YVVcOgUGBasUSDaBPXetF1wMSV3
	 0aAsKfQ4SuZrm4zVfIma+Ss8S1Naa4ZjTdFjYEpIDuy7oikjXaMkAgrBjNCml9FNuGagZ
	 EdnwKf18XOt4+Jozkk802+nJAWhleUVYsfDvtCqsJO45J10/tAJlYjQlvWugTFgYnvGPj
	 IqQnNtGThQ3/7pueRqMJwk0XQdRi60RjRsVxvgZuozr1xo2MNa1vKO9Cfs0uQLmsvhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w8LqwAm420t4vMGPQi+EWJzp7fMp2OcaMgt7Y6fyyHA=;
	b=2We8HtN3hcPY67XBEUdMu26HAmx6BHCa0ki1POiYVl33WsK71EQOqkQnXqvQJCPQI1tV
	 3YYKYTofUpJjzCvadFROITKQ64kY+uyYh+4aom3ZwO1C27+IUj7WwZkl+EuCAwUGMccs6
	 M9W6dxIAlV6H10W3IpS+4jFRp4B/pH5ieWxknQvQxUmSANgojko5FCq7H2JDXfhNqiDF1
	 hHGUD9IDpfwnh0SJ4/wivmaFYtmEhs89DpEUX4VKId8X12gCe2rXTQKNlMDwLXrIWqKiA
	 vGFNILBsorHfRZSNYzX+zWzieN14FHnTxsVrM4GyB5a7mO2LVSFmjnvGtZtPPvlo9CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cG5O3CQs;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D9E606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96D9E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cG5O3CQs
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3719e3cb82bso447315eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794880467; x=1795485267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w8LqwAm420t4vMGPQi+EWJzp7fMp2OcaMgt7Y6fyyHA=;
        b=cG5O3CQsdjEq6FvLwWnGU8cLdvFFlnPqB/58pOGag4tHmsOjTkfYwYzPsaM9ZQabN3
         uAW0RPxv1qxvUHvhunG3vqIB77AiTdd0nZQcJOus5vjjmdfbwnTgRPRtHkAEbHYxoxC7
         WVBJ6cBiQTUUFjMjQNDKiaxYFO2vXhyNMdVtBcmGcm5KvX7s3WWmjKK1H4F7OiIxsQzU
         TQxd8cFOGBHQLch8wBPC2nIbI2WoM7CIKzATW0Vd+qu9MR8P1PR72i642KOKIRQsR/ks
         ejfhI8311RwVteja+QzD5QjrdDFSXA2DbNQ3I2jFVQCzvUDq5m41jC7U5AOBCUzy9CXa
         urAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794880467; x=1795485267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8LqwAm420t4vMGPQi+EWJzp7fMp2OcaMgt7Y6fyyHA=;
        b=XpD+XMBuGFYcvCOfNlkO4i3VCMRcVPen54FsfVRleTGINWcCpnqDxST27I34s8zxS9
         CY4z7tb3abWnbXZOvpxZ49fc8zzscCOR1y1/y7nlw5NsxSZduwiTiCikGmIKYC1cutNA
         rHcYaskWr9CMcUMrmUmsyuO8j+9/fzakYe1oGzbdHk1YYIjY1VkkRkrhQgCJMT+keDqQ
         KLu+BqjrEFuI8VnpI0DxMmjeDV86ndI0tXx2VoNZ781V4DNw/p2LY3/+AyYXKzL0WCtt
         C3xX+tdN2WljjCCPBWxrErWyLajCpEbZIgfeS3I8s/T7OnQxb9Cvan8qIsEWvGFCS+NN
         u/kQ==
X-Forwarded-Encrypted: i=1; AL+hErGWaUMJ7MNchEjQk0rkRzUmxUBajH5NU6B8xNsY2SjAK7zHD8JGkbsbi3ZvwFx+r6Lhs5LkcJFLadfgfI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eA+cTChM8ue49+BhtXR+24BY0Yt8rFXlp3/cnqrSHcPK/2xSK
	rhzuyjogG1yv1iaRJaoyqzvPFTMv/MY57esoMYG8+yGY6BDCnGOK1y4E
X-Gm-Gg: AZFdTZdTzBiUsl00dA6HXHsJw7Z/MmHJ4+CF50qXgl4YGHmqyAARc2zuPYghY85z5wO
	tJ6sp8m5vstNtwGcULmAiaKMb+H6/Rwq4qtD8iiYf/kkTxeIH3SpkwRakCxqMpNsIC5+h/Gsj07
	fzZt/Z51otQj5WJ6rXOyyGnrj6D3m6nPeOi1GAV/MvXoKAHOXxdAgIxMH1H4ymamhXuY3R3D5Us
	IfAZYQZyF7JFVPHhjkYv5/drXkdE11aXEN8UdubeZFZcSuxEppQFyJxLTixO3sTeabVbLMpevDV
	F3HDC6YXMP9vJTcEsSZ1teoSqvbWrPjI7qO5nKJKNcxTpXeG7aduFTKOY+1vxAuNGE4o+ahFlOz
	43zuMLEtCi2z2ABXf0rHI0RMBWWPV5vUT1ZvRcVL4CBDa3kgQcbsP4N2z/FbMtjGmGAtxsjW2gb
	GtgjqnrfwhwH2nT7H4+P+ivZNURV3+QNzf0JgD6ESIoZNUQiYRCT2iG5B1vmubKeWtnSOXdtNhK
	ckJlD6ayXis+I+itQTki3wzxpKHBj3EAhD8MJM4S68jk92ofw9vH9sWh0G8RUUIIBo3Wp+Fc4xn
	qO0yilAUy1w9SZm2+7xEf4LV0xKuM8M+mg/Cr0PcxgP0gm3dctWzzl9tum1QwQ2fnhTmoVjt5io
	Hg4QwzbfnOfrHVVWsT7o=
X-Received: by 2002:a05:7300:c00e:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-379651ecb3emr20449628eec.1.1794880466543;
        Mon, 16 Nov 2026 17:54:26 -0800 (PST)
Received: from localhost.localdomain ([188.253.120.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm34139971eec.4.2026.11.16.17.54.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 17:54:26 -0800 (PST)
From: Qihang <q.h.hack.winter@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Qihang <q.h.hack.winter@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] iommu/io-pgfault: reject partial faults after device removal
Date: Tue, 17 Nov 2026 09:54:07 +0800
Message-ID: <20261117015409.25492-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
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

iopf_queue_remove_device() kfree()s the entries on
fault_param->partial without unlinking them, leaving the list head
pointing into freed memory.  Since a74c077b9021 the fault parameter is
refcounted and can outlive the drain, a report that took its reference
earlier can still list_add() through those pointers.  Unlinking
instead turns that into a leak: the late node lands on a parameter
that is no longer on queue->devices, whose final put does not free
partial faults.

This needs a device removed from its iopf queue while a non-last
(partial) request is in flight, with the caller not blocking new reports
for the duration.

Patch 1 unlinks each partial before freeing it, matching
iopf_queue_discard_partial().

Patch 2 adds fault_param->removing, set and tested under
fault_param->lock: a late partial is either drained, or rejected and
freed by report_partial_fault() (-ENODEV).  It covers partial-list
admission only; callers must still quiesce reports for the remaining
lifetimes.

Both patches are scoped to fault_param->partial, not the group path,
the attach handle, or paths that never call iopf_queue_remove_device().

Verified on v7.4-rc3 with KASAN + DEBUG_LIST and the iommufd mock
driver, its caller-side IOPF serialization deliberately removed and
test-only delays added; this shows the mechanism, not production
reachability.  The runs cover queue-before-removal,
removal-before-insertion, concurrent late reporters and re-enable.
Each round queues one partial before the removal and then races the
late reporters against the drain, so a clean run ends with every node
accounted for: 1800 = 900 + 900 and 3600 = 900 + 2700 (allocated =
drained + rejected), counted at a final removal with no reporter in
flight.  Nothing was left on fault_param->partial and KASAN stayed
quiet.

With patch 1 reverted, the report is:

  BUG: KASAN: slab-use-after-free in __list_add_valid_or_report
  Freed by task 1: kfree <- iopf_queue_remove_device
  56 bytes inside a freed 64-byte region (struct iopf_fault, list.prev)

With patch 1 only, the same reproducer runs 1460 rounds without a KASAN
report and leaks one late node per round, which patch 2 addresses.

Reachability on an unmodified production kernel, and any security
impact, remain unconfirmed: the test shows memory corruption and a
KASAN panic on the modified mock driver, not a user-triggerable bug on
a stock kernel.

An AI coding assistant helped find this defect and build the
reproducer and instrumentation, which are available on request along
with the KASAN logs.
