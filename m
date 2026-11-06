Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932001;
	b=sORxm63pgYXU/ufvYSaGIzzL++HipqZm6CIQxn1m0CdqMsPQGB36k/cUMvoFZCaCREuX
	 LZeKsxvejXTO06As6CAGyQz+gyyhCTp6EkpURFb083AzQvMIAXGgEY8mxXR4dw4hvmhnY
	 l17XxWssHZsgSgSykqrmECjsi2H4yF87WUHy6wJ8g37xLG1mtPffeWlqe0zBJmD24HLPX
	 XnA90Kn0sFnlUpZlhFY/psowxggW1J83V/mUXXVlfjyI20bo1W49Fw0/kQojDFCEZkSke
	 7/0NtzGyD7QNpcO8e98AxZmRguVJxOFKnJ4JH/w7t8ooVpHhEgUgmHNuZbksCmhFG8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932001;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=67ZG0C954WH4z0hhj8FLydkFM+rD3K+nD2mWHyKFNLI=;
	b=Yd/y75Y09YdpRlRVXHj2WUrPyXASOP+jNTtT5xJCuWckMFb4mM2R09Pb6zAk8Qvju45+
	 nljCsEgBqCxUR2XaQx87nEYkptF3PpTU7RpSpe3/OqHRdkcyQIxZMcW/ml+3ZUB7uS2rp
	 Q7lmsLhnG5S2DoOUHPJ0O/6cgsZFz+RsjqldRPplajjRY3wY8Ra9ffJKpz2BQNiSBuTDq
	 P+loC5tn3cjmg1fhqVjF2duR8jOtuiKkG25o3TqAe0NBxkJkro7/Qzo9ijijxMuzJKb8y
	 Gd7PZlSABAzGnfy6pyXtpF+3OnJGtRbddW1/HLckzF1wtec9nmepmj/96jgBnVXSx8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE903606A31B;
	Fri,  6 Nov 2026 02:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE903606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7800f40ad98911f19a56ed5b684f684d-20261106
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:38c38c25-175a-4c65-ac52-fd7aa8749463,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:fc2bebf96f51b8357e197c781f36c292,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7800f40ad98911f19a56ed5b684f684d-20261106
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1725219923; Fri, 06 Nov 2026 10:26:27 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: laurent.pinchart@ideasonboard.com
Cc: chenchangcheng@kylinos.cn,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fail probe when no video device is registered
Date: Fri,  6 Nov 2026 10:26:24 +0800
Message-Id: <20261106022624.42438-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261104074103.GA3896730@killaraus.ideasonboard.com>
References: <20261104074103.GA3896730@killaraus.ideasonboard.com>
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

Hi Laurent Pinchart,

The main reason is still that the userspace app uses a hotkey to call the unbind and bind nodes.
When the key is pressed continuously and very rapidly for a period of time,
the previously described problem occurs. Previously I made the following patch:

	diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
	index e289cc71ba98..c08bad211408 100644
	--- a/drivers/media/usb/uvc/uvc_driver.c
	+++ b/drivers/media/usb/uvc/uvc_driver.c
	@@ -1973,7 +1973,6 @@ static void uvc_delete(struct kref *kref)
					struct uvc_streaming *streaming;
	
					streaming = list_entry(p, struct uvc_streaming, list);
	-               usb_driver_release_interface(&uvc_driver, streaming->intf);
					uvc_stream_delete(streaming);
			}
	
	@@ -2021,6 +2020,9 @@ static void uvc_unregister_video(struct uvc_device *dev)
			if (media_devnode_is_registered(dev->mdev.devnode))
					media_device_unregister(&dev->mdev);
	#endif
	+
	+       list_for_each_entry(stream, &dev->streams, list)
	+               usb_driver_release_interface(&uvc_driver, stream->intf);
	}
	
	int uvc_register_video_device(struct uvc_device *dev,

However, the testers found that the preview screen went black,
so I considered whether there were other feasible solutions.
Later it turned out to be caused by the app itself.
After fixing the app, I tested it myself yesterday,
and the above modification works normally.

But I found a similar piece of code/patch in the community at the following link:
https://lore.kernel.org/all/20261022-uvc-release-intfs-v2-1-901bc1c47cfb@blueye.no/

Thank you for your review. Sorry for wasting your time.


--
Regards

Chen Changcheng
