Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98843468C39
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005164; cv=none; b=VwuiI17aq1MKk/k8+7i3FvCgJzjLf3Twnojnat7qkVl/5NdOXU/ovI0KqzFRWotulNgxv7llACI0mhGNs9kP/dcV8F1+jbgNxaqha8eYiHznb4B3ZTOyByMFGe4+GxkZM1rsXWKyPZyNg0SB0wEob+t4KFuX/D/s7PKERym7tWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005164; c=relaxed/simple;
	bh=pRta59JtulZeIsykJD35tM5ia0Lq/sCYG19PMeRfN3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uhkmkp8K6V16gFve0YZSiFDO8RYFMC2E1bsaluA3OoZDIcoyHY94Qc1CL1LDIMc0ElfYNXgd92SY7Eg7esZWBiLDwT8stfVnXZuXnTu6MsjhONRNeZqbzpw4sux+sLTUfk1wwYSHj66+s4UVhM+iIEi0VKwFXG/t/2V86wyDclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=faJxll+V; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="faJxll+V"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535a54bed9so1951329eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792005161; x=1792609961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRta59JtulZeIsykJD35tM5ia0Lq/sCYG19PMeRfN3w=;
        b=faJxll+VuILK77EN3dLjSVc/kLOpn+vXNlgBT9DMQgMJQ3GJe5pw6V9j4fwMnL6Kpd
         0uBC0pMI/pCzrZJMTUf31Zn/hX9vcejhP/vK6kwscIoWP62XvnG2NEmvQjMhvxSt360D
         MKxdsOVTJnn4oxkuOy74WxlZItXYgAvaXZ4FkC36DjvgOM2gA/+X+HS4XuzVm8gn+gpr
         FXDdv0OGAV/7B6S7UhSch0g78FdkTFoNrEyGt6vGt4EeKajpz2cTNr+1gvljQ7Axy8Tn
         ibXqlQTvJ3zuhZqUxVv8MKd8fVHNeuNaHpxNEdpcxK+atcI4HHbtbmSIMeNXiggzYkGA
         wsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005161; x=1792609961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRta59JtulZeIsykJD35tM5ia0Lq/sCYG19PMeRfN3w=;
        b=SXKVcgVJ6dB4WpOb40zG/Fh1CME3exAn7GE+G2Cdq8KgcQqkO8HuBUjhchNPpclMh6
         TLmhizCKAr5TEULf/Is+NkznIykDGW2KwEDjg22xkc3oDG9hVaJCtTJAqYc4+43cFTZw
         luIHwlXZ78yxrKoJW6LStSb7KxY2Zs99ekTX3qefTzPuCZOeaQi3jS/2Wa3voI0TN0Jw
         9YLFZip3hgabT3WjK95hlHIqa0XebZZtwQa1Z8gtAoBTPotLelE9wsh8i/fM1GW2J0IP
         8RDT70u483pvRGkFSH+OwSpumsUPT8n9dblNWJnnhqhLrZgMkUhEtvxp5luu0VlV57Ba
         1XBg==
X-Forwarded-Encrypted: i=1; AKwUvBx9P5AfA1hwx1sbkH+GKuyl6y4Dgahww+KFE3RqzeesUtpWyyohlphKe3pUhlge489EPAEsjZFy+rv64QU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkJCbI5loYkHJgP3+EifXnQSQgBOojWdvPK52USpFIaGIDiHyE
	5XJM5J9UDsXPXKF8bHFZgmFKI63jk2OTRU+6kIeX2AQd9/C6PUo8tjNUq2+4VoGw4ZE=
X-Gm-Gg: AYBFou06PSdQrj3AFQ+G5yW5abPjHFnRNIAcPJ0d/K2hCAasevlXPxUz4EhJr2LlAmX
	jMfqkM5Ag++bRHIOcbHgVFi6ND6zIfigsodfCAvkkgsOV22lbqAp8wRv7SxTzFxsUWct+2R5j9q
	r9YDrnXbhmxKRztwMKmu/4LkyIbumVgdenCyJqt3Do6sHJC8CDC0QpEaXoaLMGiTzl7844s7gh/
	MlULAtz2dfqnvzliKLf08KFeSVJ8PSeKeCkB9caIw4LRvzEeus4Wun9B3U3OPufYWEUizVjDQ68
	7Z6WPK5+N87lUCJ7gOPOyjguQzvWRZXQf15+6pvNNoQPDK1Y81TB1WQvJ4/sMOucTBVJrMBj3Cj
	VVoJi5OHOcq8J6tmtxwwLCmeHL/4JlF5dCIQP/KPunPjORTTu2MUwWqYuGQNFzhr32eNnrdZMhI
	FY1rlbqMxnndXbGxB3ZSo/fDPFdcrKcoI5PLCOepcgfhjIDKgQ5QKpY1UbzFmiZQ6sgkaxEVfeM
	JrqmA6efhBZ1YC897fb+g5h7c7R5rQv8pWgl4Tfw0sIC7MbBzYmoujVvNvTvsKui+ppI2I=
X-Received: by 2002:a05:7300:caa:b0:35c:ceb0:8bf9 with SMTP id 5a478bee46e88-35cceb09059mr9595489eec.38.1792005161316;
        Wed, 14 Oct 2026 12:12:41 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm54329888eec.28.2026.10.14.12.12.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:12:40 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: axboe@kernel.dk,
	cel@kernel.org,
	hare@kernel.org,
	hch@lst.de,
	kbusch@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	neil@brown.name,
	sagi@grimberg.me
Subject: [PATCH 6.6.y 0/2] CVE-2025-38264: backport fix series
Date: Wed, 14 Oct 2026 15:12:34 -0400
Message-ID: <20261014191236.23696-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Please consider this backport series for CVE-2025-38264 to 6.6.y.

Apply the patches in this order:
1. llist: add interface to check if a node is on a list. (prerequisite)
2. nvme-tcp: sanitize request list handling (fix)

Patch 1 adds llist helpers to mark an unused node, test its membership,
and restore the unused state after dequeue.

Patch 2 initializes and resets NVMe/TCP request-list membership and
rejects R2T processing while the request remains queued. The code changes
in both patches are identical to upstream.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

An LLM assisted with preparing these backports.

Thanks,
Artem Dinaburg
