Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067781;
	b=ixSqHlmHsaUcH5AHiJmc78MXEi/oJWAaKbuSLWswKogdccMWFfk2dHvUIZhYfEChZO92
	 Wbr6mvGBDRjuV5/nKeWFk2j+XyU1cgb0rONe63LL1la5t5Lx1EckobQbY4H9ci4UuX8TA
	 +HR9kfwnslOydpFrAreqybiqP9Ez3it+ddVuLlbQBBy4yCxrkHTC3r7vPPqUNi17HYwK+
	 Zk6TS5m4CQzOmOK/HLRDmOkBzhnghQRmbm/dB9+W+Xj97f1W/rx7n6hsQP3anNenI8Haj
	 XzUNCpsH0+6CiAx73HYWuAbTGVwQLv8Co9Tirzcxjo3f5BxhEN0JhMjP6abkGKzI8WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067781;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uCtaYjamdt3JQx5Mh9z5scDb3e7lXVfa7H8anaD6aSE=;
	b=fl1Ub7f+yIMoRMD2P0709tcFDaIrKhaNwUXnVlBDox19JDQFHgy7T5evnKnDjaA4R91h
	 p48+6WbrU+RqhZUE9+mr9kwEbnCBG3y03Ps1XrScvb8F4CEpn+uSQWRNFRsq126ixHdWx
	 GegIV/JTqTPGR/OXUzrYOqRyVwPTjSjlWH4NWnygFq5ZsqMjomQOy6rVha4FM2BigxxCx
	 D9mbTnka/ZMQfpkBWU2MLY439cg6WLBlHKRVN4E3+/NFMUC0S5Wd1OgRJcHjqlGw6m+N1
	 ZCW8d4GL30w3mIsk3yTZKLn6VvfhwwOeEukdyo+RwVOfTZLsmXna910qVJ4lGrj+Pkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C44606A321;
	Tue, 27 Oct 2026 02:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C44606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4fe126d6d1ad11f19a56ed5b684f684d-20261027
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:04a8e8ae-41df-42de-aaf1-5b29f9a6718f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:b21f9a95c0bff60234aef0cdcb216633,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|817|850|865|898,TC:nil,Content:-10
	|-8|-5|14|50|99,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4fe126d6d1ad11f19a56ed5b684f684d-20261027
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1504159838; Tue, 27 Oct 2026 10:22:52 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: Re: [PATCH] ALSA: hda/generic: Use "Input Source" for the capture source selector
Date: Tue, 27 Oct 2026 10:22:49 +0800
Message-Id: <20261027022249.431998-1-songxiebing@kylinos.cn>
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

>If that's true, PA is broken for all other AC97-based PCI cards?
>Let's verify the PA behavior more at first.
>
>
>Takashi

Ok,i will take me quite a while to verify this.

Thanks,
Bob
