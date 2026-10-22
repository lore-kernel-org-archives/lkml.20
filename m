Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656563;
	b=kmNz9SjhrqJE1O+KgRBOy93dN+il4Rl0FdZbqCFKBH2TmEW6fVeVohf+HwhpYTr2x58h
	 hyRX1it80tkHDWH3hd3GmYtc3TcpYICzZu+HFbigUEvCfzFkW+APUI8Nuh0MNO2GrJe9E
	 zsNXBK1vI7CmK5SJUYU7gd7ynF9Na4qNnoyMCw42JcVeZcgHV+CShZePxeqzrN4hhT80t
	 Kk3/pl6eQViaIVDSpDdAgqNDam9J07d8GyMf6WlvujEJyOE20JlqpQ6WuPrrAckoPqTjE
	 RJWeoLbZpXe5THLjuZa6ENiL2kmeTJp8pLstHDb2wEU+7lkgXvBAbR6jfCVodkvPEJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656563;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7IKrN4Mg0p1yUHL9E2wI4cdaqSrdLTDY+pZzs5j9FuY=;
	b=a/jpQZdAdsHy2wMyMm41XTFSxTtlmmNQ2s5go1T++KVuA1OarYocFGpmETlDnd8kTNto
	 GvKmEazay1CFmYc6un8DOW57VzTDWEUnFu4Fj8XcB0RrObR/SWoS0Mr2FUd7Ps4tMQxb1
	 YbQLG3BfMdWMU9ANz+iPtwzw/ug5RYjyY8Z37BGbyP7bvKdD4f7BgRSzudZ0ZM8SpWtVD
	 tD4u1RdSImywBRqiYgYksA45H/GPLkPw4jv/OTbkaJGLlB2OrqJ8gLoXq+3NRMAbvDc9E
	 uiCXWCJM9c2nvHJad0A8AqvQaKyZS7gV+RYG5piSy7j3oay0nbjqhF4u0U24vXcqgYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E54C606A319;
	Thu, 22 Oct 2026 08:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E54C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: dadd8e76cdef11f19a56ed5b684f684d-20261022
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4dccc8a5-ff1d-4a93-b679-03fe595960c2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:dbceba3df68f3206760bb73bf330df73,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|817|850|865|898,TC:nil,Content:-10
	|-8|-5|14|50|99,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dadd8e76cdef11f19a56ed5b684f684d-20261022
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1876524480; Thu, 22 Oct 2026 16:09:07 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: Re: [PATCH] ALSA: hda/generic: Use "Input Source" for the capture source selector
Date: Thu, 22 Oct 2026 16:09:04 +0800
Message-Id: <20261022080904.1740256-1-songxiebing@kylinos.cn>
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

>It must be rather a problem of PulseAudio, and it should be able to
>handle Capture Source, as it's been used for most of old AC97-based
>cards.
>
>Reverting this old behavior change (since 14 years ago!) is just
>no-go.
>
>
>thanks,
>
>Takashi

Thank you for reply.  You are right -- changing the name
unconditionally was not well thought out, and I agree that reverting the
long-standing behavior is not acceptable.

Would it be acceptable if I add a flag to hda_gen_spec (e.g.
use_input_source) that decides whether to use "Input Source" for the
capture source selector?  A codec driver could set it when needed, while
the default behavior stays unchanged.

Thanks,
Bob
