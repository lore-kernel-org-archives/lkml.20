Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D4E317166
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922533; cv=none; b=cE/Vv8of0tHlnFTaiWkGdenJN+CyFhFQOuM7WoWvB83OfsqZV1MTy1f55BRybzUq1qeiC9+7bJVNmjZudfgxlus7rP1iRR0DaYdQWXx1lpTfZ6fOBrEo+QvtY4dRm30hfoNqpZK80kru24uAM9EwPssJG1RT/qHvf4Fxj8npFu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922533; c=relaxed/simple;
	bh=VF46/oKDHMnQWvthVk2+fNcf+7QGwMi5TBQgSB7cn8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+42occHyY89CxMRQAoBWYWW9W3XIjul39X/efHSgIVffunKaVUEbTzdSXfCmr7gplX4KkCMxGjgKe13czY1mt/dBrN6kNKmCEXMt3bk+AkXhqJw48E4W62AeC+kkuxEuGzksc/iT3f0OsVvR4BDvnppC+tiKaq5qmWEsOUPyOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJjM4FBc; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJjM4FBc"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-85339ed040aso4463048b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788922528; x=1789527328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5J7IAyeZaoyL8wmgHnVCp/5efuF05FkuEwo9R241gs=;
        b=dJjM4FBce/kISJBA6U8g4eathx0dI3tgFcOd+XO4hgAZRm6u5vqzUu6fnqMNv/2MrL
         mPvxmQrqLdoWJzqYXKZqUQCq7kG1OSB/v1ChK/FUqaEGHgjcQxi6U1KACy0QGSwX9IVw
         aRMm7pfpgXjb320WFEoRTdynbNvEJ+2CDSD35R9Bb9UjOP1fzPhpzziP9zFWnomnJVBc
         AxolKktuhVPv3y0mNIhkHxtIWougth+GDO7REdWC84S0MBS3P/QVZR6yVqda5GGpIU0A
         n8Mue7z9+n636Tt4x0G0MB6NPkteg1RNXr1rzjXygoYiR3C3lJUEfOd7APFpNc/d7ncF
         4CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788922528; x=1789527328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5J7IAyeZaoyL8wmgHnVCp/5efuF05FkuEwo9R241gs=;
        b=a2lcFcJBvzZZ0AkOkutTwFfQ5A3TMImaNKX++62KektV43NQA4yEIBscxidLaTEiKc
         y/zc1Csxf6t3tb1iQ/1iuN9bADD7Jt5Q63047siiw+rDaQrHo3M/6iaW0lmjRpNYvVps
         NNwLvlz4CZKkHCDyxMDMwLohXkn/Pcd08XgFrucofumVArta6ur/FPy8KWDyyk4EbQ/+
         MRN09u1uRQKdGST47tRA3OlvDpNu09OHAVNtK5cf62lHRr7QklX/dV1M1vu/QbmJeAfa
         rOqapj91mT8Hf73Doud3ZzA5QaRs/0awi/s8Imdtj//JV3usoZyhPRJU82/hQcDOsdqf
         NqLA==
X-Forwarded-Encrypted: i=1; AKwUvBxIyKJ/TReKWQGWqdw7mKbzEf98Fa4/u9EcCD07RXgbOPZ39e5J60vbiSH9aTDv76JEHHMWGzo650/Mz+4=@vger.kernel.org
X-Gm-Message-State: AFuF++lKsa2szgljOcs1kv843IvTrMuqxw+AVLMKOV+NIszJKIBNIZTR
	jgoMU5fwKLrFjDjAoHCW+nygeZtm4S21Uj6z1Sc041pOps7E9hlN/uJa
X-Gm-Gg: AYBFou1c5jccNJ3Q4YkZRG8jNT9cee7gWD/Rk6wj9zUPw+uyr8HGtKuYLVJoHxSbQj4
	UKrpWd3BFBFJkOZUpjS8Gyod88BxA+qnziTP3MGikSox6X326fgQwRCO/6DWmizc2zirKCFNAzp
	a+DpqTcLRdcD0+Ihhe8UCF6ihe0kfGGc9Qxsb2y9ncyNZq/MBw2Qk0AqWDJfYC8/SEqP5+z2KEO
	n/LbXtcJNOfPdwzxAx1/lFXCENC+BLLjefgrjMURmUqFIWJQCMgzBJMyGSkATxnS97EybVdkUB1
	cElvjFz/Q+uWva2I1s5Q18RbfdHS88sJRCYshhh/3eA6nZTmjwJ9CfGE0bx+YU1XIm5a9TyBfxi
	q1YBZMlF9EQ6A1aMAP4bNl3ZJKnUPJ3dC36bOIhWt6jUyLhREBDCCJk5LPYTGfHhMnWz/nPFfTm
	v89AbAzInKBqd2b4y+7njbzkbzyy3+GpZF6AdBMgOUiWERSOVUKUcigZ2AALUNj/lZtSwf8pekv
	eV2x1oSboUh5KyY4uOf1hdiBVTHOopfFAUs
X-Received: by 2002:a05:6a20:9630:b0:3cd:9f0b:f7a2 with SMTP id adf61e73a8af0-3da39ee15d0mr52148985637.11.1788922527839;
        Tue, 08 Sep 2026 19:55:27 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm37176647c88.14.2026.09.08.19.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:55:26 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: bod@kernel.org,
	calliarifelipe@gmail.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org
Subject: Re: [PATCH 3/3] media: ov02c10: Accept a 26 MHz external clock
Date: Tue,  8 Sep 2026 23:55:05 -0300
Message-ID: <20260909025505.89752-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ap_CGQTdNFysTLot@kekkonen.localdomain>
References: <ap_CGQTdNFysTLot@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Tue, Sep 08, 2026 at 11:06:49AM +0300, Sakari Ailus wrote:
> Please don't use a hard-coded value here. Instead, calculate the pixel
> rate.
>
> Registers 0x0304 and 0x0315 (both 16-bit) control the PLL multipliers for
> OP and VT PLLs, respectively. You could also change the multipliers to
> arrive in a frequency close to the previous configuration. The values would
> be 0x28a and 0x1b1, respectively. I don't have the sensor so I can't test
> this. The pixel rate would be a bit off, 400,307929 MHz, assuming the
> previous value was exactly 400 MHz. This would also require adding the
> frequency to the IPU bridge.

Thanks -- re-programming the multipliers is the right approach and it
does work, just not with those particular values. I tested both on the
affected hardware (Samsung Galaxy Book3, OV02C10 on a confirmed 26 MHz
external clock, verified via /sys/kernel/debug/clk/clk_summary:
INT3472:01-clk = 26000000).

With 0x0304/0x0305 = 0x028a and 0x0315/0x0316 = 0x01b1 (each pair
big-endian, low address = high byte, as elsewhere in this driver) the
sensor produces no output at all: a 3-frame v4l2-ctl --stream-mmap
capture hangs with 0 bytes written, no I2C errors are logged, and
intel_ipu6_isys logs "stream stop time out" / "stream close time out"
on teardown. Recovering the sensor needed an i2c unbind/rebind.

What does work is scaling the multipliers the driver already programs.
The mode tables set the OP multiplier to 0x0190 = 400 for a 19.2 MHz
clock: the common table writes 0x0304 = 0x01, and the per-lane tables
then override 0x0305 = 0x90. Scaling that by 19.2/26 gives
400 * 19.2 / 26 = 295.4, i.e. 0x0127, applied to both multipliers when
the external clock is 26 MHz -- written after the per-lane table in
enable_streams():

    {0x0304, 0x01},
    {0x0305, 0x27},
    {0x0315, 0x01},
    {0x0316, 0x27},

Measured on the Galaxy Book3, which runs the sensor on two CSI-2 data
lanes (0x3016 reads back 0x32):

 - Reading the registers back over i2c while streaming gives 0x0127 for
   both the OP and the VT multiplier.
 - The frame rate is 29.94 fps, timing a 400-frame capture against a
   100-frame one so that pipeline startup cancels out (13.71 s vs
   3.69 s). The same hardware ran at ~40 fps with the unmodified tables.
 - The exported controls agree with that: hblank 352 and vblank 1236
   make a 2280 x 2328 frame, which at pixel_rate 160000000 works out to
   30.14 fps against the 29.94 measured. link_frequency reads 400000000.
 - No stream stop/close timeouts.

295 * 26 / 19.2 = 399.5 MHz, i.e. within 0.13% of the nominal 400 MHz,
so the 400 MHz entry the IPU bridge already advertises stays accurate.
That means v2 can drop the second, hard-coded link-frequency entry
altogether: there is a single 400 MHz entry again,
v4l2_link_freq_to_bitmap() matches it directly with no index fixup, and
no IPU bridge change is needed. pixel_rate stays derived from the link
frequency as before.

I can't account for 0x28a from here: 650 * 26 / 19.2 = 880 MHz, which is
far outside the D-PHY range the receiver is configured for and would
explain the missing signal. 650 would only line up if the starting
multiplier were ~880, whereas the tables program 400 once the per-lane
0x0305 = 0x90 override is applied. If you meant a different baseline, or
a different register pairing, I'm happy to test that too.

Two things worth flagging. The mode tables never write 0x0315 (only
0x0316 = 0x90), so I can't say what the VT multiplier's high byte was
beforehand -- the driver now writes both bytes explicitly, and the
readback above is after that write. And the single CSI-2 "frame sync
error" logged at stream start is still there with the link back at
~400 MHz, so it isn't caused by the faster clock, as the v1 commit
message speculated.

Unless you'd rather have it done differently, I'll send a v2 of this
patch with the PLL re-programming above and the 541.667 MHz entry
dropped.

Thanks,
Felipe
