Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC5749F121
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288412; cv=none; b=L5FTGIqL4VH22u8J/9rn/xT9G0RoN8xwypn9r0hb5ZtT9C+ZK8SImPVdCpKHUGcvowGR8qi8aI6CkjSbCZn8U4l4SbY2hK/VUKyGktcEQIEnJvDlWv/IeLS511JXRbZP5PKQaKJlkx3x7qc/a6xGDtcfxE6hgyo+20Ic9iemVwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288412; c=relaxed/simple;
	bh=u9aKuWIlOdLU3GPM8gMlKCH3MNfkxf1V6v2iJ3LbpUY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=W8LYp2Enj4ZRdltOWOh5FWuDjQ+uJNOCzsKoAxW0ZZ6JBn5iRMcW4kdGH01nRHjTJ4fA4qziSgIRnDzJTr8+DEGH1XEab8KiEl4WcAqIUKkqMEbM9IAgk46w2ilDnfcu437blzxWCtSBFoPL3la+Y7OfOV2C6g/1lRw5tuQKh2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3Flt5Gj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3Flt5Gj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so1315485e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788288409; x=1788893209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HjCQhBzt7RYcOnaReR32DP32WTYV64asDdP79SfbZk=;
        b=o3Flt5GjRY6jDgVBpWdNVHsHFhg6EqJ07bOnNgSqTiBlXX4zGuCoLVtZuGdOe3ZS4+
         Cac1NVRpaD+Cm2E9KqwC7nT1hs0EzubgIIEMJX/PogXZq6ad6J7nwUF+r3Ubv3EcKMjj
         A02aULurhJpqepJLN6U79Qmp9+qhdAxdvU8aZupJEGzDnmCdZpd4vDljjsb13xFWvrEK
         /4T9lu4q54ebu+Uc6Aa8oLiOV+tIgB8jzmrb0QzJ0ZUuQXb2IpVhLqyAJFk4tF8HxAiy
         s4V4A0KpWIZxZVbcfoKh0p+CxEG0K7vOaIrMpd46A8nrZ09BHxq5U1kwnR4uOn2ziyP6
         F2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288409; x=1788893209;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HjCQhBzt7RYcOnaReR32DP32WTYV64asDdP79SfbZk=;
        b=Km4tlfpX16yCn0NPloin9gi2+QkPXqghf6ug9C59vP9ytCC/kzMVsthTrUhcY1m50d
         ECll7shL6u2P7wNhvFofN4SFrSVoHrd0H6IYKFXRUBdzFVrsM3PXGbHqjaNZyZnUyHkM
         zx4Xx+Q0AsuO/QhR7XH51mKFzk9e3qEbyJ7bh7o5ECUJW+8P72ahL85HupCFxZ6YroYc
         vclPq5OLdeKKdPmnpG2B7g6esIkKHIGwW5uurovxd8K1LrasSEKSi4bCAGmWT6eunFR8
         CO4cnBfSshQDvrvZVflfFN1G8bCdqwZTI3ZlXFeAu4yOTjaWQbBSRsC8sjWQ90pWzd56
         1gWw==
X-Forwarded-Encrypted: i=1; AHgh+RruC0Lm9rvil8Bw2mlDbAt3MQL5A87zMMhSstTls92pyUJt1kMtb7hrecWxVw5WqTqV5zGtQkiIVG6ZDv0=@vger.kernel.org
X-Gm-Message-State: AFuF++kIAIuUmKaui4nJwF7oLxVkIbcJ0cn8sI1vgKHtmwGSs8hTvv2s
	j0xJHP9+l7ReoCjDF9GuICYylnDdKVjrl4gDdFaPquFbNPV4BGAzOrkG
X-Gm-Gg: AR+sD11/OJIAiQf/BwUR0guBOLCbVq2eXqvI1tO6AZbVn4UDIlwottC4Nqce2VshUV8
	vkLU3uDtQ3iHIXM7IEAFJsQ2GlMiS1MzPUCi0JpmAZJCA9yO3jjsL2aG6DvPlFGIHm/rJIBZr37
	oHELVmaGZpgTeoeHPAcwfFvORpG1DLfVgr8x+ZwwAEsKTQJ04RALPy/e9HPpcEaegz8EGIJZhT2
	GJHl7+8aDcZJfr80Kr0gp4r+YU4Cu6zsQSSm9vm1zGFOuK0Hpi5s//rIGmnFjve5NCaytJmbat8
	jaqZxpZYN3FoXJYdxrn53sRLcK6sV13RORi6SC//7dU1lgy+6dHtXqnvphxLtaJktEQpDLSCnk9
	/OR3LWIazIwdb0rtF+wWK45gQsm6+Vys6lZ5eoODCCOUAhi6yyimyQgY6zUMrABv4bpYJ8CP/rH
	uI7IeF4Yl9Pmsux9x6XnEqfD+2cUPR9+AjDWu3Gx5uiNX2bRuwsdaGRrFl3Nf/gybufbm2VjNif
	49lvVHdE6VYCmdjBMxbxea1QoKK
X-Received: by 2002:a05:600c:870c:b0:499:dc34:bdc with SMTP id 5b1f17b1804b1-49b91c1c401mr656955035e9.1.1788288409042;
        Tue, 01 Sep 2026 11:46:49 -0700 (PDT)
Received: from [192.168.8.169] ([92.241.26.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeae34sm873420f8f.32.2026.09.01.11.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 11:46:48 -0700 (PDT)
Message-ID: <85c21391-44c8-4f9b-8053-37c24c9c3eee@gmail.com>
Date: Tue, 1 Sep 2026 21:46:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fil Dunsky <filipp.dunsky@gmail.com>
Subject: Re: [PATCH v4 3/6] media: i2c: ov5693: Gate the MIPI clock lane for
 non-continuous clock
To: fernandorimoli11@gmail.com
Cc: dan.scally@ideasonboard.com, dev@berg.pm, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, naeemarsalan@gmail.com,
 sakari.ailus@linux.intel.com
References: <20260831181858.325109-4-fernandorimoli11@gmail.com>
Content-Language: en-US
In-Reply-To: <20260831181858.325109-4-fernandorimoli11@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Fil Dunsky <filipp.dunsky@gmail.com>

Scope: patches 3-6. Patch 1 was already in my tree and this machine is
INT33BE, so patches 1 and 2 are not functionally exercised here.

Hardware: Surface Pro 8, IPU6 Tiger Lake (8086:9a19), OV5693 front
sensor at INT33BE:00, OV13858 rear, VD55G0 IR. Kernel 7.2.2 plus the
linux-surface patch set, not the v7.3-rc1 base the series declares;
patch 6 needed that tree's duplicate OVTI5693 entry dropped before it
would apply.

With the series applied, streaming from the ISYS capture node:

   60 frames, SBGGR10 2592x1944, 604661760 bytes, 28.64 fps
   MIPI_CTRL00 (0x4800) read back over i2c while streaming: 0x20

0x20 is the bit-5-only value patch 3 writes, so the clock-noncontinuous
property did reach the sensor driver: the path from the table entry in
patch 4 through to the register is exercised, not merely "the camera
works".

I also ran the negative control, with PCI_DEVICE_ID_INTEL_IPU6 dropped
from the INT33BE entries and nothing else changed. How it fails is
worth recording, because the obvious test misses it:

   - the first capture after boot succeeds, 60 frames at 28.64 fps, with
     0x4800 reading 0x00;
   - every subsequent capture in that boot returns zero bytes and times
     out, with nothing in dmesg;
   - writing 0x20 to 0x4800 over i2c into a stalled stream starts frames
     immediately, reproduced on three separate streams, while clearing
     the bit again mid-stream does not stop them.

With bit 5 set, the same script captures three times in a row without
trouble; I measured that with our downstream driver, which writes 0x2d
unconditionally. So the entry is needed at stream start, and a single
capture after a reboot is not enough to tell whether it is present.

The free first capture appears to be particular to this machine: two
other testers of this series, on a Surface Pro 7+ and a Pro 9, get zero
bytes on the first attempt as well. I have not been able to explain the
difference. It only affects how the entry should be verified, not
whether it is needed.

Patch 5's precedence rule is exercised here as well: INT33BE appears
twice in the table, the generic entry and the Tiger Lake one, and the
bridge connects the sensor once - "Connected 3 cameras", no double
connect. The two sensors that take no flags, OV13858 and the VD55G0 IR
camera, are unaffected; the IR camera still does face authentication.

The teardown "stream stop time out" appears identically with and
without the series, so it is not introduced by it.

One note for out-of-tree builders: patch 4 grows struct ipu_sensor,
which moves the CRC of ipu_bridge_init() and ipu_bridge_parse_ssdb(),
so with CONFIG_MODVERSIONS ipu-bridge and intel-ipu6 have to be built
together. intel-ipu6-isys imports only ipu_bridge_instantiate_vcm,
whose CRC does not move; an unrebuilt intel-ipu6-isys loaded fine
against the new pair on 7.2.2.
