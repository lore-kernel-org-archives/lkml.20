Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090330;
	b=b7Lr6IguiwfBSIAJidptToRUEurAG11tR6WWGwlaQBXllcxKNYUlDS4tJb3j+RcMLjwy
	 okPpN0WxmtVB8EMQ2HuyfT36FPiGClCpD6aY3TLdatonitOYlRDFV1OW/ogf10jlORTWK
	 7Ol2tr6EdjU7gSm9wSjW92JEDt1YBCu67H3A9L6tG6Z6II1u40EmKgSfF7PAj4Twqj/LI
	 ni0uM1pPsqg1B9V+xJIq3iq1tBl4EDpwsLsDbJ+ZaW6kiL1HhAENlBEF54H3SidIunJKH
	 LUtDaO416ipyfzbc9LmQJkucoJEm03ZY3ZYBxVbp+NHPQn9s/EnUco/X7+HCaAp/8hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090330;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AquImi31AAopFJBUwwrNyRH95KFOTSkbw7aXZq9tuy4=;
	b=CfRbHoURVgz+Fr9eWq6CWqI5wDcqaIDT51HbosOkd3gyiR/fGIAHtNT7bNCzshdLGE+6
	 oVcOqmehqXFX+PYvNzdO3UIBS26LW3nB1sY0sXQ2kFau1eybsGM4sgI3WFVzV9Kp0Ybjk
	 YOdO+V1946okoPodzEjoGclhdAuMQNtF+MLi7ru3JjtR1M25w18hbqkBbR1pOMG7iaFvz
	 wDHbYCaJei6+JOBShFepBlt6PvF08DxTWsztbfJoZglRpLP/7ebGsYigrU8fRouexN+pA
	 kkVbTk26THJsW0rLVEE8T8n5OfH5LeGA46s7qKU++5lMdJc7du3K6mDo3ZmzR9ZxcYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED105606A31A;
	Tue, 27 Oct 2026 08:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED105606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d0441c82d1e111f19a56ed5b684f684d-20261027
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0b1ad2c6-9b4c-483b-aae6-06a2935cc776,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:6d8276ee2c0a0d8fb99c303fe0fe39b6,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|817|850|865|898,TC:nil,Content:-10
	|-8|-5|14|50|99,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d0441c82d1e111f19a56ed5b684f684d-20261027
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 803423540; Tue, 27 Oct 2026 16:38:41 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: Re: [PATCH] ALSA: hda/generic: Use "Input Source" for the capture source selector
Date: Tue, 27 Oct 2026 16:38:38 +0800
Message-Id: <20261027083838.1970024-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261022025743.520258-1-songxiebing@kylinos.cn>
References: <20261022025743.520258-1-songxiebing@kylinos.cn>
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

>>If that's true, PA is broken for all other AC97-based PCI cards?
>>Let's verify the PA behavior more at first.
>>
>>
>>Takashi
>
>Ok,i will take me quite a while to verify this.
>
>Thanks,
>Bob

Hi Takashi,

We verified the PulseAudio behavior, and you are right -- PulseAudio does
handle the split "Capture Source" control.  My earlier claim was wrong, so
please disregard that part (and the patch).

What actually happens:

- alsa-lib exposes a control named "Capture Source" as one exclusive
  capture switch per enum item, named after the item (Mic, Line, ...).
- PulseAudio's input paths match those per-item elements directly, e.g.
  [Element Line] with "switch = mute" on the line-in path and
  "switch = off" on the other paths (analog-input-*.conf).  So the split
  control is usable as-is; PulseAudio does not need
  snd_mixer_selem_has_capture_switch_exclusive(), because writing such a
  switch makes alsa-lib update the underlying "Capture Source" enum.

The reason it did not switch to Line on our machine was simply the mute
state of the source:

- PulseAudio restored the source's mute state as "muted"
  (module-device-restore).
- pa_alsa_path_set_mute() then writes the per-item switches with !muted,
  i.e. it sets [Element Line] to off.
- Turning an exclusive capture switch off does not write the enum
  (alsa-lib only writes the enumerated value for channels whose switch
  bit is set), so "Capture Source" keeps its previous value.
- As soon as the source is unmuted, PulseAudio sets [Element Line] to on
  and the source switches to Line as expected.

So this is not a kernel/driver naming problem; it's a userspace
mute-state issue, and we will handle it on the userspace side.

Thanks,
Bob
