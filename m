Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661373;
	b=zRImVe21+f7prE2kw8SbTPWYirBDwPzHAYiT0FFZOGtb7d4A3m5DlcEBHUb/au/UbDyo
	 e54uEHZ/L6MQlI4n5t0FwMytkcbNz0iPi7/V252DfnSQmui9EXG+bwXlKCz+ABFtYuLsL
	 V1bdMCY+BpTxMKTfoGeUZU4vCkQX5dHktjfAvOjNBJQV4HHakFo4lpozbIT/zAucOucJW
	 1UfepUzq89yu2iBAQ/9f7ECTzuBc466Bvj6uXRMEQJ7pJVBD/J4HG5JufD+OmbdgkAOPq
	 3iy4/UNzLmQVJtDtaC/DDjzTlxihrVfMrBzFPoqiIVLV2r6JrlHQKpPqCG2CFKalY5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661373;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kUCaeQ7sG5StNzdvBgk4fCZ0MbJMpzHorIATBWryCss=;
	b=oHb5F0Bq8hskVQ27WgOMiOeJzG1xT/Suzz16g8TFgtiZ/pB4m7NzUqVGniL5UboBcP0L
	 /iUOepJTTInTymfjEyfRdFvG0WUMRD0jXp5hY6gjRbipcthnvhzQXtcKosYQubv53W6C3
	 oWHq+inLa26JsKZqOye9hgDYcNVL0HxIRpyJg5AgTO1/Tlg5B6QfY2Ty56o7M7S9uWc/J
	 hQeeRxEBIIo7522yvp37pBTIT4jUSlzei61HGrFo89pEgZ9U14+k8oz3F+jro8UfYPgO4
	 /DfNdmdlnO0pzmDDDlyal1MTFY4kpC75k5BO7mjAGEq4YIDoNx35jd3Qi7M/ebhchFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65361606A31A;
	Thu, 22 Oct 2026 09:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65361606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1158193ecdfb11f19a56ed5b684f684d-20261022
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9b8159bd-ee27-4c56-b73a-3c4acf52f909,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:c0bb6956b6916d595d1c3350e7e9c607,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|817|850|865|898,TC:nil,Content:-10
	|-8|-5|14|50|99,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1158193ecdfb11f19a56ed5b684f684d-20261022
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 301557609; Thu, 22 Oct 2026 17:29:23 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: Re: [PATCH] ALSA: hda/generic: Use "Input Source" for the capture source selector
Date: Thu, 22 Oct 2026 17:29:21 +0800
Message-Id: <20261022092921.2084573-1-songxiebing@kylinos.cn>
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

>That can work, but I'd rather check further why PA doesn't work with
>Capture Source.  If it's something like an element that doesn't match
>with the actual input, it's a driver's problem and we may work around
>it somehow.  But before figuring it out, it's not wise to blindly
>work around something just because it looks as if working.
>
>
>thanks,
>
>Takashi

Thanks for reply.

What I found so far on the userspace side:

- alsa-lib's simple-mixer layer special-cases the exact name "Capture
  Source": it does *not* expose an enumerated element with that name, but
  instead creates one exclusive capture switch per enum item, named after
  the item (simple_none.c, simple_event_add()).
- PulseAudio's ALSA backend resolves its "Capture Source" element strictly
  by name (element_probe() -> snd_mixer_find_selem()), so it never finds
  an element and the mux is never switched.  PA also has no handling for
  snd_mixer_selem_has_capture_switch_exclusive(), so it can't consume the
  per-item switches either.

Thanks,
Bob
