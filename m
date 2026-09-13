Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE95B214813
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789291893; cv=none; b=SrOXRhzxm7kved6yN9skaPquwvPWF5mejaRTNy1Tnbi4HNUB9CmimxtabM2kfMwsseGqELAwJ69rpIMDWs601YB6ONtZcSz57EQT3GmH2L6n425i8EyeOn4SJf8M1HL2LOOkCmUsOGJ8TqXHRcY9rbUXjEe8qyiBo1U/P2KnezY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789291893; c=relaxed/simple;
	bh=xB5jj8VPvBnGrXDhKdmlbyncIiPk1DJUxDep5ugNJCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FnzddWOoZD+jbIEb1WD6jKLqzWn4xSe/CYruNiClSfiAPz3fxANnw48KFPkY2nqHKWhDE9tjqLBYYdG2MmgWkuKXB+ikYv3rWIjX9hCSxC6Gfw2r5WU/CM25wt+fpARyy+gXH3ozcZXIFTWxHKtolxzBDu2LJfyNHoiYe4NQfIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcLcZ5a8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcLcZ5a8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso23145325ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 02:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789291891; x=1789896691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB5jj8VPvBnGrXDhKdmlbyncIiPk1DJUxDep5ugNJCo=;
        b=bcLcZ5a8DOxb8NmSw2onwbJexq9ZvcVI1bEcyaVGrc98NhBLXyjJfK/12ATbGRxGYl
         40X1SgI7Q8PIKcU8JFNgOi02srf/NeZixaLYhlWE8sPwH+5xSAuJj417Q7+rijxUq3Hk
         HL/fUDu47XlOB5Eb4ZYIF4bpPkuFVkxAn9KvMhTJq1/mj/oIdOLys4sK85B8/j9rrcqA
         jaG2/rI+jXTwsi1ZLU6SPmbP+HtosxEtlvCeUk7iysuRx95yNLvJ2KJIuRgI0Z606whA
         vciGxcE/H9rWjjnXKjXcIDIYix9lfGlFk40NyY+8Q0BmaSxvVOhPm1ZqSk3VPF+UuPts
         kBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789291891; x=1789896691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xB5jj8VPvBnGrXDhKdmlbyncIiPk1DJUxDep5ugNJCo=;
        b=nS930o2fXb8jzYHuOD8RGx9JDAhEfwoiL7BEXLNf75ky/WwdRcVYt5+0DLy7UznWFS
         pK+0mB85mv8ee2ctIlLhLMVhGZZWkbnNfd3Eze8dKU7DW4e9CToWiBMMGUAY5F+m4RS6
         adG8iGyMI1amTa8SNEYY/LDPFnSvWCHdgznp6ExiwLNhx2MNrP8eNaiNsNZJ2OvOuUyN
         weiZoGCdzqa05QHBgHHcCNJUHonsnERSQTYYrb2wOWFUr7qms2QYgywYN9CUgpxghgwh
         LB7sJ1YCoOc2on7OMVDGc0GwkoskiPLgTIwsY/O6E6KAuLgCOpoHmn2rrCPSGToecH/R
         eRtA==
X-Forwarded-Encrypted: i=1; AKwUvByORW+XjMfLvL5+LQPMuAzBc4nwQOwCZl+YistOHa9yd+ROn4oCaDU9q7/QaQrD5xj9XDu3Gur/9zmXPMs=@vger.kernel.org
X-Gm-Message-State: AFuF++nw5NRPWeW8Rs3XTufSrobDgIjL+g/XV0B4HV5P6zZqHIHAkSjb
	b1iApAaEghtgqQ5ERzK4E5wxTCJL8y54G3Li+VkVRLs0jCBDx1wJ0Bg=
X-Gm-Gg: AYBFou0G2Tn4WlFufLWtoCt7Ke1O/dQWJVF+WneDu00bEEWDuuy7hf6XZNCMWU4e1k7
	vpmsjc3RbCbRBrH8vUG3pauC51bzD/svhSzXH6A7u/uWyUTLFnvQCLDyuA1p4BTn8CjBfcrsSRZ
	cOUiwJZq/Lb22ttcOQQeOs/KdK7JkK2kuRTeWi2u+jBpi8ItB11YlWGOt6AVAYUF2yI65neyCf5
	Av7sPagebPpKIUNb2R/7iJMiVOdTmH8nVjwTXfcwcBisv67Ayiglqyb1/1kHKslubxd71ZR3SvC
	keIGKuobJQs8IGsSVxyXlIYOYIlPnyXGCzcNj8W1pifhjHslw8XkIOXDkivjqwLZj3TlyJddgMl
	2I+r/9Zwd1mDF9YJ8pFOVi+pxCDrJpvZN3h0MZ+SVEMqMhRwjZlOaY1cftUwEwLCnRSPmmHUPJ9
	yuTmGkD5I6m3uR3FDgL10ppUXDTeIcCq42nkXoB7szIjCv/YfTjbfVTu3+vJhKTSiKNE/aI7deA
	euY4xr5hAsuLe05BgM4YOfmdA==
X-Received: by 2002:a17:902:db04:b0:2dd:3ddf:b87a with SMTP id d9443c01a7336-2dd3ddfbb26mr152670615ad.0.1789291890999;
        Sun, 13 Sep 2026 02:31:30 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:b91:ff81:c860:362e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff67aasm31954125ad.79.2026.09.13.02.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 02:31:30 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Adriano Cordova <adrianox@gmail.com>,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v3] blktrace: fix the field offsets of the synthesized v1 record
Date: Sun, 13 Sep 2026 18:31:24 +0900
Message-ID: <20260913093124.717495-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913091321.B3C061F000FF@smtp.kernel.org>
References: <20260913090232.715798-1-donggeunyoo.kernel@gmail.com> <20260913091321.B3C061F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 13 Sep 2026 09:13:21 +0000, sashiko-bot@kernel.org wrote:
> - [High] blk_trace_synthesize_old_trace unconditionally parses ring buffer
> entries as 64-byte blk_io_trace2 structures, resulting in an out-of-bounds
> read and info leak when processing 48-byte v1 entries because the required
> dependency patch is missing.

Correct, and as the patch says, Adriano Cordova's patch has to be applied
first.

The read side cannot know the layout: magic and sequence are the ftrace
trace_entry header and neither writer fills them, and the sizes overlap,
since a 48-byte v1 record carrying a 16-byte BLK_TA_REMAP PDU is also 64.
His patch fixes it on the write side, by not recording a v1 entry at all.
With that applied this patch is correct -- measured on a BLKTRACESETUP
trace with the blk tracer, reading a partition for that remap.
