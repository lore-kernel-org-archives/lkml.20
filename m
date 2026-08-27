Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75902260580
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787798716; cv=none; b=rHNEpbgqBb/qclStZj8O50X1yz5qtIGgbbDT2E9V+40YtvmEy1JptvLSWWcEneJ1MNKRFiOthIXOU3csFMwpY7EKSZi/ANbxUel3Zv7rp3UsWJjiUTf+9IMeNw5L0FNMDU7SAstXacF+XWdzuMOzo3xe1FBwnG1NIypBAMiXqBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787798716; c=relaxed/simple;
	bh=2vOrKENcc98okWMDEDOuzDkJNH14RR+7WpEOwi0YJQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IdxyeKt43GWrMdsiTzwf/tj1R5YT9FuSCd+0mMiWoCC7D4YYa8bbbz1H4h0RAQEoDQ8YbF3bPWliPhdoDVs3fzxrulk0ws90RI6OrdBDlBuYEpynT3ewYAeyxbLtafzzjyoczOHypBWA5xiqlZUDD+1oq66p/HnWKrs5gSnS1gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4cc37600a1c111f19a56ed5b684f684d-20260827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:49a27659-8d11-4c5f-aa7d-3d332443ad4c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:9447a778819b87a361c0153b70017719,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4cc37600a1c111f19a56ed5b684f684d-20260827
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 104589409; Thu, 27 Aug 2026 10:45:01 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: hare@suse.de
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, dwagner@suse.de, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: Re: [PATCH v1 0/1] nvme-tcp: fix wrong status on deferred digest error
Date: Thu, 27 Aug 2026 10:40:00 +0800
Message-ID: <reply-hannes.nvme-tcp-req-status.v2.20260827.liuxixin@kylinos.cn>
In-Reply-To: <22ddb116-840d-4d6b-ae2a-5bdb755273df@suse.de>
References: <cover.nvme-tcp-req-status.v1.git.liuxixin@kylinos.cn> <22ddb116-840d-4d6b-ae2a-5bdb755273df@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py

Hi Hannes,

Thanks for the review. This is not a wire to host conversion. req->status
already mixes wire and host values. Digest error stores a host SC. u16
makes the host SC explicit. __le16 is endian packaging for wire layout.
The SUCCESS rsp branch overwrites with cqe->status, which is wire. A host
SC must be shifted left before nvme_try_complete_req.

Without DATA_SUCCESS, digest error is deferred to the rsp path:

	req->status = cpu_to_le16(NVME_SC_DATA_XFER_ERROR);   /* host SC */

	if (req->status == cpu_to_le16(NVME_SC_SUCCESS))
		req->status = cqe->status;   /* wire */
	if (!nvme_try_complete_req(rq, req->status, cqe->result))

Both branches pass req->status into nvme_try_complete_req, which expects
wire:

	nvme_req(req)->status = le16_to_cpu(status) >> 1;

SUCCESS is fine. Non-SUCCESS still holds host SC 04h Data Transfer Error,
so 0x4 becomes INVALID_FIELD, 0x2.

v1 changed req->status to u16. v2 keeps __le16 as you suggested. Please
take a look at both and say which you prefer for merge. I will send v2
shortly.

Thanks,
Xixin Liu

