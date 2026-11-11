Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388497;
	b=upgK+IsFSkETXuhoVWqrK7UCXg+1sYFp51pPjFGTJ6xBIt5owv/B60aES4AaMAnHm5OY
	 J5gLcYVs5PikJQqFTgLnlyo/ZA2udsWw8pHcoX4vviksmbNkyPU/Duyu/vqCxLe70uZPt
	 M48zs9LVDAz4dAIU9BD8Bs8uViCwPzm25NyuRColxc0i14l9Z4o9GhFZ2q40EhhHDv9If
	 6VEjMqz4rOzBj+XXpoNd291ZSGlK1XtnTSXRLIQVKkUsCslLo2tmVtAm44X/0+5Sqxl+o
	 9GL2vDhfOt0T21NLtbn22u2chnaSGFA/om1BvBjc239je6g7tEdLRvqusVmvnYnftfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388497;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Message-ID:Subject:From:To:CC:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-MTK;
	bh=zvaUldV391V5uNeMjr+9WAAbMevw73xdsml0k5INe88=;
	b=tn7sG6MVGdnIXeVTXUbMg712+P4cTkOXKgQDtElLYF/8dx1AECNATI6Y7oQPg7+TZ5JN
	 guM/7JcLAYGQrA+0dSj13+j0cxIlwPOlP9t2KK0yydMq/ZiLNgo5r50eBMQudLZCbvnBa
	 VQVSX3ra//a3p6FeoUwrtsNAe1piezhXjiRI7GOHjtTN4sU2/nRfKxgvzTIYJV2VT1wvh
	 uZAjQzULeWX8bTkkhtTO6tMXr8uchcCK2JGIyGrtErxlM9kJdTvrKc7Ig0E9GEFrfJQcV
	 MTvems+e3D1JmrntRXCN5nAtCRQ1vbvcRV2BMKGqaZXJkuMD2Abf8mbWa0aBtqXty/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Iu1mFkUN;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D37606A331;
	Wed, 11 Nov 2026 09:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D37606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Iu1mFkUN
X-UUID: 58f00800ddb011f18dc8c9802ae25ab1-20261111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zvaUldV391V5uNeMjr+9WAAbMevw73xdsml0k5INe88=;
	b=Iu1mFkUN1qfFbTxDATBi4zHufWjXAqMgTLKFyL/eIu5Ooy+mGSzChu1cz08wsGC3n5Vj+Y9lJTWrIwEakw6H61+59TRNgyQvhQFK+5i3iJ2t1ajo2MeZS5EFJJFsMc6CM3iCTXt2oss1FgFuUiKXu7r9JK6IkM8yAaOx9Wo3Vkg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:38b42ae4-17b2-4cf1-9617-9a7929c9fad8,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:22c8bdd2-e65c-440c-82e1-af2977a3d424,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|836|865|888|898,TC:-5,Content:0|1
	5|50|99,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 58f00800ddb011f18dc8c9802ae25ab1-20261111
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <allen.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2135581844; Wed, 11 Nov 2026 17:14:50 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 17:14:48 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 11 Nov 2026 17:14:48 +0800
Message-ID: <ea313f0127e2cfa72a3572f1893e59c6e2c22cd1.camel@mediatek.com>
Subject: Re: [PATCH wireless-next v4 08/21] wifi: nl80211/cfg80211: pack SMD
 dynamic context along with frame
From: Allen Ye <Allen.Ye@mediatek.com>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
CC: Johannes Berg <johannes@sipsolutions.net>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Jouni
 Malinen" <jouni.malinen@oss.qualcomm.com>, Aditya Sathish
	<asathish@qti.qualcomm.com>
Date: Wed, 11 Nov 2026 17:14:48 +0800
In-Reply-To: <20261106-smd-v4-8-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-8-62e39487f51a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MTK: N

On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:

Hi Pooventhiran,

A question on how the context is collected here.

> While packing the received management frame in nl80211_send_mgmt() to
> send to userspace, nest the SMD dynamic context along with the frame
> message.

On MediaTek chipsets (mt76), the dynamic context is kept in FW/HW, so
the driver has to fetch it from the firmware with an MCU command. This
means the driver has to hold the ST request frame until the firmware
replies with an event, and only then pass the frame up. Holding RX
frames in the driver is the problematic part: the frame has to be kept
outside the normal RX path, kept in order with the frames that follow
it, and handled if the firmware reply is delayed or never arrives.

1. With the context attached to the frame, how it gets collected
depends on each vendor driver's own implementation (on mt76, this may
mean holding the frame in the driver as described above). If userspace
instead queried it via GET_SMD_CTX / SMD_CTX_EVENT for ST preparation
and ST execution via the current AP MLD, as it already does for ST
execution via the target AP MLD, the flow would be the same for every
driver, regardless of where the context is kept. Would that be
acceptable?

2. If not, could the frame-attached context be optional (e.g. behind a
capability flag), with userspace falling back to GET_SMD_CTX?

Thanks,
Allen
