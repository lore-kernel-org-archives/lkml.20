Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144627;
	b=xpbGZMuISZVYQdJbrrb0g43HhXrZrmEwhBtcb1hsal21U8TlAtl/XI2HzT1MFPOou9gf
	 BBKqNQLgP9TnVaBs1WqEa84osrMOjgpbaLrtHLsyx9O3xEvBDRfttiOwfkkJE9jA2/KYm
	 ktNT1q/UhUx/w0kD6imm1xHl4rGdlnWWvES9FLd5+1esX+A2t/M40MEgjkYokxQSZ0VTu
	 mFU5Kaiz7gN4EmamLM2QktH9tGgA18pA555Dp4he5zuzgwNXEGhSQvhaGAGoqMZTstSFz
	 QL+9ScZhHl52U1NKFMi39RcLp8Irnvc3iBm8uJ0AWSKhhzHPgWfTLAHqoyw8EAJanIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B4qnDx0k2bpcfJWg33p4lPdO3IoU2oz8ozCUQhYAFVc=;
	b=Nnb2nZsy7USe17+8J5cqUd2FBbDcgiRQOtTcVSlqE8h6f8Jqe9rNrnz/aVfQoiAHbs4B
	 z+aav+5aSUIPrIWu4dwhw90IYY1Fp1IYZPgl++F06FHmNeX3g+QsSpOTNa0odNqJ3P8UQ
	 RrKD0FPG4merivkJlpkDuCfHOzUKUCYXBp1N1q2jMKICt5Y1hKqG3ThDIVGp0pd4fDIlj
	 hVAs65CzMD6BtqITcV8kD0ilVGIENwkUT0sK0ztTIM2dtIlAgIl9gyxW0ilDaPu3XElkw
	 6Ji5vjkdCdCYS1+cMaRHUAxC3B++wra2sLqzWcSOhcsRkBGiw406k2sRAhKdLZoL5lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6zmHtmq;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE28606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE28606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6zmHtmq
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd69954c755so314994a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144622; x=1793749422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B4qnDx0k2bpcfJWg33p4lPdO3IoU2oz8ozCUQhYAFVc=;
        b=q6zmHtmq2+2xjpS7gExdAApxbJkj+K+cEA0LVg5vkiYpGPCes1JeeGijnyIsqU9VpE
         p22carrUCVNOpsQYBYxl8ihVNDdTBzV6pHTBRaq9AeKO+d7YcQ+5oORhmPbDA2vkAHix
         zJlTcgJo8Q+VSbvE21OVcPYTHsZus9AaYt8pk4zWZ8twC3oqJqjIHRsrJafrUqmHW8NC
         EALiGi0q5ck4EKMH5ecYRF7kT93ouCNgQoJ8BPSogRh7PDIWh9L2Yg6/ymAJFFOapcfV
         +NWXL21YFBgEECJQxkTPJHnudk+yMnqbn218rR6ouTRjJicthHA8+iDJcgAgpAjVR43h
         jqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144622; x=1793749422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4qnDx0k2bpcfJWg33p4lPdO3IoU2oz8ozCUQhYAFVc=;
        b=PFmzAJRwp3HBxek16J3Z0r5aOkjDf9B/sRQe6rD1JBW5fM29Wcvi6aIHJxbcO/Muc6
         s+ViMynMXLevhXgyGLcYO+KMhteLnWceqiPmx4J+bC3RcT+/L4aXpAbJUktlJaQubivr
         AheooIMuKWHKHK1CPuHzPxH/0WEeXqm+rQMQn0e2Jdi9UA7GiCoB1/GGsCdcduJPIZ4G
         pQRNA5R1gZu5Xlqks+km9/+VcfOx4SJjx5zs1+QrM08nWdmLxvXL3dYsMdGTWI0T75DV
         rswo8xa47xkU7RUcQirm5nCmstHvdo61P1bYypOwztHwg1oWwc5GrkQvKmu7QWWwXTvG
         +4Ig==
X-Forwarded-Encrypted: i=1; AKwUvByLDKL65QRPWFjrwu6ZiNhLWiAEB4ZRW/OST72UH48b6D6XKA7AzBHDcWSNTZqlSaet7CfzEQ3LuI/I3/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWTTVrKLurbbrJHN++efaiVYZhKL5/ycmzrQIQ5kwf1kDPgqib
	SR/ogBbt9aWAgtjhogEPAK07pPbTd+cYJfID5fk6XoUWVGD492OEtnEZ
X-Gm-Gg: AYBFou2gDATTEdl8NRQ+Cf/ByP+CC3heWRsabbsEFybm4IPcZ6gph/wxcp51H1/4QpC
	BMOfWHmyiYdQWhdm3qssluZVz+mVQVqArN7f/ctMDhDA1PgDs+HYZE97wpnJLYLtvCkzMbF9j7y
	BaP7ULiNbcsoXU4eLqxDxQx4PdaQkqwOFfKGp6JZz0/wNjLdd5uHWht3VffsPFxKH0HOtivasf6
	Ly8azb7chUanKb28vmTBoSDieWtG9A6Xqdof5Zc08l+QhjxLFSFkNsc04bsXH+Q/401za9Pm5u5
	1Y5GbsgioItjxtYUP4WXXmXOz0HKOrgPV/RVtivqczTjIOW7qFr9cByiiYzczfTejpikY7lIZyH
	6hu5K5pQ0C4vIMLBaj3HUXAsjcTmtoXRZHejNQU6daFrzRO8gtVgKSpmzsFCh/F5vCQ6TspF9PZ
	H6D2a5gWJwow80pWM1jwreQOpCAZA1LwRq4N/BCfLlumR0RtTE1XzYSAGC7xt3rVZNWEzHg4bC4
	dAbY8IIE3CJf+JyQzG7+gE4hydZ+4sxMwTl0O2vmcFNR+rPVImNjqRQufbM4TjSL9nVoqql5n0v
	VOE+h8h31/nLf1fIDjsd6QmAnJRwU/+jzMPpw6+432Frx2T8MhdeV0pNYTybOU+L69Yq/ul4Njt
	V4bqmpTBOiSFJQHO9jz1KImcrPmr3ql5DlU0NtGACOtZLsIQ=
X-Received: by 2002:a05:6300:8003:b0:3e0:b937:883d with SMTP id adf61e73a8af0-3e90234d178mr489806637.25.1793144621759;
        Tue, 27 Oct 2026 16:43:41 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662b9f5sm542507b3a.21.2026.10.27.16.43.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 16:43:40 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/11] ALSA: virtio: staged capture and dsnoop recovery
Date: Wed, 28 Oct 2026 08:43:23 +0900
Message-ID: <20261027234334.32551-1-mynameisjune111@gmail.com>
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

Hi Takashi,

Thanks for checking v4. I reproduced the application problem against
sound.git for-next. The two dsnoop patches depended on nine patches from
my earlier submissions that are still absent from that tree.

This version includes those dependencies in application order and applies
directly to for-next at bcb4494239f57c98a8ef576566b03f2935b3000f.
It needs no separately fetched prerequisite patches. Targeting 7.5 or later
works for me; I have no deployment deadline for this work.

There are no code changes from the previously submitted patches. Stable
patch IDs match all nine prerequisites and both patches from v4. Patches
1-5 cover request lifetime and error recovery, 6 covers teardown waits,
7 adds opt-in staged capture and pause restart, 8-9 cover ACK accounting
and period work, and 10-11 add the stop-policy annotations and dsnoop fix.

The staging and pause-restart changes were previously posted as RFCs.
Including them here makes the dependency chain directly applicable; I
would still welcome review of their device-compatibility assumptions.
Capture staging and the VZ compatibility options remain opt-in. This
series does not add host audio support to Docker Desktop or enable any
host microphone permission.

The dsnoop fix recognizes stop_threshold == boundary as free-running
capture while preserving bounded-reader overflow checks. Returning to
bounded mode with a full unread ring reports an XRUN. Paused ACK and
period-work errors arm synchronous cleanup so the first prepare can
release queued RX requests and recover. This fixes behavior introduced by
the staged-capture patches in this series.

Previous v4:
https://lore.kernel.org/all/20261025064038.81674-1-mynameisjune111@gmail.com/
Your rebase request:
https://lore.kernel.org/all/87cxsv33oq.wl-tiwai@suse.de/

Earlier submissions, now included rather than external prerequisites:
https://lore.kernel.org/all/cover.1791881787.git.mynameisjune111@gmail.com/
https://lore.kernel.org/all/rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com/
https://lore.kernel.org/all/rfc-v2-vz-capture-compat-0.b9ab4c1540dc4691@gmail.com/
https://lore.kernel.org/all/rfc-virtio-snd-capture-followups-0.f2737c95c12e45b4@gmail.com/

I built a fresh ARM64 kernel and modules from this base with KASAN and
lockdep enabled. All eleven patches passed sequential git apply and
git am checks, and checkpatch reported no errors or warnings.

On that kernel, all 16 paused-ACK recovery combinations passed across
native pause and pause restart with one and two vCPUs. The first prepare
recovered without a preceding drop. The native pause-release regression
and all 13 mode/lifecycle cases also passed, including shared dsnoop
readers, client drop, mode transitions and reopen. All six QEMU runs
confirmed the expected module hashes and produced no KASAN or lockdep
diagnostics.

Earlier v4 validation covered 16 paused-ACK recovery combinations and the
13-case mode suite under ARM64 QEMU with KASAN and lockdep. Earlier MOTU/VZ
and KCSAN results used the previous base; they are not new results for
this revision. Physical microphone testing, 32-bit builds and forced
RX/pause interleaving have not been rerun on this base.

Thanks,
Joonho

---
base-commit: bcb4494239f57c98a8ef576566b03f2935b3000f
