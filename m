Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9905E4A0904
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418286; cv=none; b=BheJWitt+lKGcDeFDIyXnBYLgsytTZahKFnoNUa/N6fz6XJXbkVUFJ2eYAYOTalMtEqAPUeAMdlw63K54O14PBKaRQKjx3YJh6/BGAKKE4x74LDgjmKn1lLOVgOBmrmt9HKp9fJ4YgQgU3dp1MJ3y/P0zm/3Ls8CzjD1CejfckA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418286; c=relaxed/simple;
	bh=3K7GcquD3EOR1oBksyLuzW2MO6AbtSZ9+wDFpYynp+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RafvE8EwyruQKskqHTsE6eMFnht9k21J3sTnkRDrGR0wc4iLdDlaFcaRihW2+FxoZ9exXv/dIUe9xHt2pdKew7h6tq03wXjQgSvM5plzLgKOBPTm6aixZhi8FFC6KUvmpjU3Jqw+mZckK2w+ft7U6c7iKECAqxOlEfzNpitPz4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hu7ZM8pU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hu7ZM8pU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so21318745e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789418281; x=1790023081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhEU0wHRURAHDPVBCdOLsIeyvo7dCcCPcPjIXRKdLFw=;
        b=Hu7ZM8pUs/Q2prh9xyvXD4FKuvge0uoTw96pGlc8RmTTRd4lWg0ppqMuER7NzJ54xa
         PRD8ZZu1355kZxZbWZzOkcUEIItO8r0QAwPK9nPqo5WOygAy9wK0HSfQHVfc3t/kFuuc
         IcttZBL6EIeOYNp8tCR/JQALCAjFjUqyY9AtZlZXcoZ57EWn5Sbym9Fh3/c3fRimGxIB
         ny/q6ZgnTDoSFXYtY/Vg6wGukuaIjTo9K7jeDXD7QEj5Ow/dgAcT9caJIGLSkQdq34js
         PnY56pPBZLqaVX9SPnfDGkYyp8tuO/6oUBUOACH8Phhs1xJHiVx0/2nYFxPoTcagjijo
         rXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418281; x=1790023081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KhEU0wHRURAHDPVBCdOLsIeyvo7dCcCPcPjIXRKdLFw=;
        b=hl7H630WBuE6JyDZghZFwQpYrfvoE6qaZzDMZAeP791IKsoIgTW3DQfSUW32mSvbvV
         XOoLF6X8E4MZhIb1P2EIVpSgnnkwIIG4O/RanxYAqKNBYitqZU2o+CFLppn8LTUtIscK
         t1MkWEFjckRU27AlnRhJ7tVgqH7bM6ra7yyMfoxzpVMpX+PvfcQqC2VpqttJGozEPoY9
         uW9WNqMWFerTwPZDibepSpOf/cH5dqjmGwhbPr1xQ11Fyenneqf/LSQ+/6CEvSNAn5uE
         PUdPFPTeVXwpQbr4fQuJPH0MZSsHdDflWJXmkLxYjaldBwTFD08vuB+WSPi9bub6LAQf
         sJOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOPxGd1EDj6VwnCY4mFXmnt47ndee1qViabgOXjUCyAA4+l2BIz8XbTCU/Q2/a1erV3JpluUn1T8TXSss=@vger.kernel.org
X-Gm-Message-State: AFuF++n/jLtzN5g9sLD0Sr8RERXlha8rJ2N8fiYtfdWUB+s9L2unni8h
	JFcbH+RZz86us84EZGYJiqrZe+2Qqz+PKAaJb/XMRvjOQ8JpV5OcZcsLUOE7Fpe2
X-Gm-Gg: AYBFou0SBsrD1eSeou49YnL9hy+/FEQZi/FxzrPeaUrPxn3q5jjsfbpKqJdGCA/7RHA
	SWWTKPbmbJLwDxr2+styrupkvJSDr4pr9olcWyNDbvQ7wtXcYXdeXIgTjb0jgGMhysykeLWVPgF
	VM8o0AgEW9wuiTWIRJZX9T29VFpDSQ3bAUB+/WhSBzaeJkj05ybqAwHHjvS0m8UEtwQSV2qlKCf
	2rqw9HRErB43+no/l9g4IlqMcDtm/uF3owEYDG/lQE/WCXAfJ7avpQ3krn5e0RVhxLd+0DR7ozi
	n+WU+6aoEvOqo4ekl/W88q/G4lCEGLILpOuxQc0G2SGpg6uaZPYkYt2z04wQ2RCr5yF3oSLTBmu
	gWzyLYlINUa6aKKUeoEv5cOOWFYCQ/OBW9+bLR/RfyLp+AkR9eepTxk3Hbh8kkeFudEqYSlEJXG
	vWWfIhXj7ihIHwIPa8YyqqxrXb8v+F4lhrxu6fZO6csCB8ZhYIjybqVv7hQdg9Tg4WmBhERzwdE
	B4lw1XKbMiQ/3hudhRoAXSCQ6y06w2S
X-Received: by 2002:a05:600c:c168:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49e7a662e89mr49849915e9.7.1789418280538;
        Mon, 14 Sep 2026 13:38:00 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.65.89.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm29391321f8f.28.2026.09.14.13.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:37:59 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: ipu-bridge: add the OV13858 rear sensor
Date: Mon, 14 Sep 2026 21:37:43 +0100
Message-ID: <20260914203745.6049-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913142034.5632-1-lsa.uz@pm.me>
References: <20260913100932.92087-1-lsa.uz@pm.me> <20260913142034.5632-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On Sun, Sep 13, 2026 at 02:20:40PM +0000, Sergey Lebedev wrote:
> +	/* Omnivision OV13858 */
> +	IPU_SENSOR_CONFIG("OVTID858", 2, 540000000, 270000000),

I have the same sensor on the other side of the IPU generation gap, a
Surface Pro 9, IPU6 Alder Lake-P, with OVTID858 as the rear sensor and
OVTI5693 as the front one. Your entry works there too:

Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IPU6 Alder Lake-P (8086:465d)

Method, since this machine does not boot media/next as it stands: I took
the tree it does boot and replaced my own OVTID858 entry with yours, so 
your line is the only difference from a known-good build. Your
patch also applies clean to media/next on its own. Only ipu-bridge needed
rebuilding, as the entry does not touch the header, so the exported CRCs
are unchanged and the installed intel-ipu6 and intel-ipu6-isys load against
it untouched.

Cold boot:

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI5693:00
  intel-ipu6 0000:00:05.0: Found supported sensor OVTID858:00
  intel-ipu6 0000:00:05.0: Found supported sensor SMO55F0:00
  intel-ipu6 0000:00:05.0: Connected 3 cameras

Rear sensor at its native 4224x3136 SGRBG10 off the ISYS node, 29.95 fps
over 60 frames, and the operating point is identical to my ascending
ordering, which is the part worth checking:

  link_frequency  value=0 (540000000)
  pixel_rate      432000000

To show the path carries pixels and not just buffers I used the sensor's
own vertical colour bar: stddev 479.5 on a 0-1023 range, min/max 64/1023,
bar edge where it belongs, and no CSI-2 errors on that run with the log
cleared first. Front and IR cameras unaffected.

One thing that may save you a review round is that ov13858 never reads the
link-frequencies property at all. It calls v4l2_fwnode_device_parse() for
the device properties and never v4l2_fwnode_endpoint_alloc_parse(), so the
array the bridge publishes is not consumed by this driver. It exposes its
own menu instead, and the receiver takes V4L2_CID_LINK_FREQ from that:

  link_frequency  0x009f0901 (intmenu): min=0 max=1 value=0 (540000000)
  pixel_rate      0x009f0902 (int64)  : value=432000000

That reads 540 MHz here even though my local entry happens to list 270
first, which is how I know the order is inert. Useful if anyone asks why
you ordered them that way, the other multi-frequency entries in that table
happen to be ascending.

What I am mainly writing about is your remark that the sensor also needs
power sequencing the in-tree driver does not do, and that it is a separate
patch. I have an ov13858 patch parked that touches the same probe path, and
I would rather we did not send two overlapping fixes into the same
function.

Mine retries the chip-id read in ov13858_identify_module(), five attempts
5 ms apart. Without it the rear camera fails probe with -EIO on every boot
here. The cause I identified is not a missing power sequence: on this
machine OVTID858 and the IR sensor sit on the same I2C controller
(ov13858 2-0010 and vd55g 2-0060), and the first chip-id read gets
corrupted by bus and power activity from the neighbour, so it returns
garbage rather than timing out. Reverting the retry on its own reproduces
the failure.

So, what does your power-sequencing patch do, and against which symptom?
If it orders or delays the sensor's own power-up then the two are probably
independent and both wanted, in which case I should say so in my commit
message so that it does not read as a duplicate of yours. If it subsumes
what I am seeing, I would rather drop mine and test yours. Either answer
suits me, I would just like to know before either of us sends.

I had held mine back because the failure was not reproducible on mainline,
there being no bridge entry to enumerate the sensor in the first place.
Your patch removes that objection, which is great.

On your rotation patch, separately: the SP9 rear sensor is mounted inverted
as well and its SSDB reports 0, so that machine wants the same treatment. I
will send the SP9 entries myself. Your DMI_SYS_VENDOR match is right for
Surface, for what it is worth: this SP9 reports "Microsoft Corporation"
with no leading space, so the exact match holds across two Surface
generations.

Thanks for doing this.

Fernando
