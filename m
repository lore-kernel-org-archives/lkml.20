Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0ED46A61A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200188; cv=none; b=RR335DvlSlMsi/Hq8nLwQRTRm8Qcp/l+pT5REMv+ERafiOzG0N3H7LGo55H9gNxct2pp6mi6BLYX93bwUP39HrYdXp4KtEsq4D9J9LTlNcUQIihA+v7DouxnejkevVp7RiX7pgeAY1ipsuce4MFBI7Bqa0P3GlJJ4Jq+QLeVKDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200188; c=relaxed/simple;
	bh=qZ4v0kBxfDXm7A8WfOWaQ/C+eH5jnmKKTmhXmNhd0cA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8vvT09ny4Rb1WulenlrExdZd4oxJKKzVximoSBD6oIzCgrXSsnPBlg78FTGtBKl5TgJj/jXG2rW6MOHd7ZkWPkwbG1LysXNxsiRp5hTcmBjYoLG5QiwlleZUOW1lzN/haTCqNR90NXKCwASPi/ZM9BJCnKQpBRYwQMMna4aX4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tB6nOlDP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tB6nOlDP"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-484392e3d33so953889f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200185; x=1788804985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLrM5RSXKjrTQOiCSWE6R3cx3gDtx4FYgQOFBGhOjsQ=;
        b=tB6nOlDPT+TPaPzl6qO0XEcZdIsNXkOTsDoklQTzPokXnrv2QLsXDSu0GVGEIcUhTo
         7tvYFGps7bW4KrtNXZPdwmbsyfZxpKM2EiNHQpZ/ZyXQFhoKgq5cgLXX4xybgT8IxpJP
         g9D4WF1yFSElKboOQpGQSX80oK7PDzGtytwpDPacfaS0W84/DuyKMC31XB6BVhqA+c8N
         p68mLvz+3Y0sFIEZhJTAc/kdWKPXgHZ4yqg+b/WMiWwQnEKXwQ5ajBjOD35QpQWUeyO4
         xQZXOOP73BDkRyFcaSmtSX0fjKPHvz4PJLr+pc9LBN96UBrAvxNbGmT/75uZlSOCyEJm
         vZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200185; x=1788804985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLrM5RSXKjrTQOiCSWE6R3cx3gDtx4FYgQOFBGhOjsQ=;
        b=ntTgBPRo7bH2hEd7U96ULu0bYwvxRFQLMVz4epQjqt7LWlVPTxCVg+Rzve+fabGA8M
         1FiAip/IIX8uaYhFuls/t92Ak4k9eZauypmsw2yqGk6b7lOlGtB+pSWMqVhJyFbgGeNA
         mDNVvFxwcUD70lY0n8duHbf6PUA/1tZwboR4rgnBHIujh1OrbuSgbMnE3hUpVk6ogXWo
         8LBUrlxy2qQuK0xSBWefXTmjQ55ynenDlSdN5fVr5Q+of/43CDBZCHlCBx6OAF0lAnmQ
         NGM5R1d622N3FEMAR8HcOI4F3O6iF1O5a5ba7Og/gv5K3uPoZgmqsdWSBGzp+EeeZ0Jm
         btQQ==
X-Gm-Message-State: AFuF++lWH+2rDqr9D7dhbhAMcjwnW3SYSqA0E/WfGGjaw+LV8IZZ1GRq
	fATnkL22H7DWR5HGmAmQzUJ4Z0jb9Gml/JgOLbTpTUwbRzSXzRzP9zTPf53J0w==
X-Gm-Gg: AYBFou0q0mYS9A20db/n9qUeJCJIdYFWh2pu+xuQPjmGFEnQZBAetVPVEho6rOByQrR
	oxXKR7qclLA08Lx7eqQKkhKW8b9dLo7URvzMsEQAI3Xox0RqQqCC7y7R4vAAow9DRzHzEWeTYKB
	5VjAV1MspcJJeBNOPnLhboDAIKiDMJfIuxJDovxrebrG7IYzt+2bpB559N7WCpdDw6g24yeZamp
	8/kVroYRGDyVAkf4qevzvsmDZ8Kxz2iZuIo1bVRERQNyGdKRvYkAikeTnRTSY96wJmzGyR0FTh5
	3pXQSJL83DsAr89WRHKIrOf8Q4iAz4O/Gc+Vnx4DhspWFHvX/1hfrPkMGOsvDL9EskCMZH7AACu
	lUqCDxvOxKVZfZo1O8b4J6YUmrJhGeQhkmoAFSXxXN3wbsftMrXDjVB7F/Cha1Stp20ZW0L7TF4
	wG4DcjQS9cLDXxy3szUCwXy1/vEUNWD3M+/bedMu385mPOIPjuT0+VbT7xt+nvQctCOS0rm6HBJ
	TZkREn9+q3r
X-Received: by 2002:a5d:5d0c:0:b0:482:d94e:f33b with SMTP id ffacd0b85a97d-482f782a855mr45747177f8f.0.1788200184870;
        Mon, 31 Aug 2026 11:16:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:a74b:bc2a:bdfb:30ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843310ab29sm16350515f8f.0.2026.08.31.11.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:16:24 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
Date: Mon, 31 Aug 2026 20:16:10 +0200
Message-ID: <20260831181610.316648-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <amsBU-5t8pmSLXBr@kekkonen.localdomain>
References: <20260717132021.18034-1-fernandorimoli11@gmail.com> <20260720163819.104130-1-fernandorimoli11@gmail.com> <20260720163819.104130-4-fernandorimoli11@gmail.com> <amsBU-5t8pmSLXBr@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

Thanks for the review, and sorry for the slow response.

> > Gating the clock lane was determined to be necessary and sufficient by
> > sweeping the register at runtime on a Surface Pro 9 (IPU6): every value
[...]
> This paragraph fits better to the cover page than to a commit message.

Moved to the cover letter in v4, and expanded there since it now also has
to cover the bit 2 question below.

> How about calling this OV5693_MIPI_CTRL00_LP11?
>
> Didn't IPU6 work with this sensor without setting the 2nd bit?

It did, so I have dropped bit 2 entirely in v4 rather than renaming it.
The macro is gone and only the clock-lane gate is written. The remaining
macro keeps the name ov5647 uses for the same bit.

To answer it properly, from the runtime sweep on my Surface Pro 9 (IPU6),
3 trials of 30 frames plus a 300-frame stability run per value:

  0x20  bit5                    300/300 frames, steady 28.6 fps
  0x24  bit5+bit2               300/300 frames, steady 28.6 fps
  0x00  power-on default        0 frames, "stream stop time out"
  0x04  bit2 alone              0 frames, "stream stop time out"

0x20 and 0x24 are indistinguishable, and bit 2 on its own does nothing
for the link, so bit 5 is both necessary and sufficient here. I had set
bit 2 only because it is part of ov5640's canonical value for this
register, not because anything on IPU6 needed it. That is a bad reason
to write a bit, so it is gone. v4 writes bit 5 only.

While I was in there, the same sweep also covers why the value differs
from ov5647's despite the mechanism being copied from it: bit 4 (line
sync) breaks the link on this receiver rather than being merely
unnecessary.

  0x10  bit4 alone              0 frames, "stream stop time out"
  0x30  bit5+bit4               2 frames, stream collapses
  0x34  bit5+bit4+bit2          2 frames, stream collapses

A bit5-only value recovered to 300/300 later in the same run, after the
bit 4 failures, so these are genuine value effects and not a link that
had got itself wedged.

Since v3 a linux-surface user has reproduced the value question
independently on a Surface Pro 8, a different IPU6 generation (0x9a19,
Tiger Lake) with the INT33BE HID rather than OVTI5693, reading every
value back after writing [1]:

  0x2d  vendor value (control)  30 frames, 28.65 fps
  0x24  bit5+bit2               30 frames, 28.65 fps
  0x20  bit5                    30 frames, 28.65 fps
  0x0d  0x2d with bit 5 clear   0 frames
  0x08  bit3 alone              0 frames
  0x04  bit2 alone              0 frames
  0x01  bit0 alone              0 frames

That 0x0d row is the test I had not run: the vendor value with only bit 5
removed does not stream, so bit 5 is necessary and not just sufficient.
That set has two limits. The register was written over I2C into a stalled
capture rather than by running the patch, and the write lands after
stream on rather than before. So it confirms the value on a second device
and IPU generation, but says nothing about the plumbing. Both sweeps are
in the cover letter.

One further change in v4 that you have not seen: the bit is now set with
cci_update_bits() rather than cci_write(). The ov5693 does not otherwise
program MIPI_CTRL00, and the driver also serves IPU3/CIO2 and Rockchip,
so modifying the single bit leaves whatever the platform left in the
register intact. On the devices in question it reads 0x00 beforehand, so
the two are equivalent in practice and this is just the smaller claim.
It was suggested on the linux-surface thread [1] and seemed right.

One consequence: Dan reviewed and Jakob tested v3's 0x24, and since v4
changes both the value and the form of the write, I dropped both tags
rather than carry them across a behaviour change. Both are asked in the
cover letter to re-confirm.

[1] https://github.com/linux-surface/linux-surface/pull/2171#issuecomment-5298352360

Thanks,
Fernando
