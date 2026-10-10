Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546BF26FD97
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791598268; cv=none; b=Og1x9JmQfvR9egj/q6sf5rjpSGjQVDFwGOPlNUSJ+79mwXkJLUYaYdJjdXNhm7zxTg0KDMnNiCEoO28MUBCJ7UEtl/8CdfUFxgEBRsCTorwaFDiZ+rgJFCf63dig/iQrckAuDi27I7vkQiCu3VeJNmYLi5n4+UwDtIFrlM2ASes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791598268; c=relaxed/simple;
	bh=En1ryKdt7KydxQo58i3vejglp8ezmRsPuj457Z5z6uo=;
	h=Date:From:To:Cc:Subject; b=CRvPjXcMfc1UCaiPLlt01CxcHI6VeZq5+VNHhOWtvdCwpwXp4S0OXWP1Z7OA/YPwEhHiFFpmIr0mPKExSPacaLqYP7rSn/Cm/ET7XJX5by5YC2Y5EP9YjSGugk6KyIPbJZ6ebQv8Xohv3d1lr0AOWF0TrMXsP8Uf7t48eNflYtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d3f94612c44f11f19a56ed5b684f684d-20261010
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_MISS, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
	HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
	HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED
	SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, UD_TRUSTED, CIE_BAD
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_C_CI, GTI_FG_IT
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c4742f08-679e-42b4-9639-0b99e2b3fa2f,IP:20,
	URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.3.19,REQID:c4742f08-679e-42b4-9639-0b99e2b3fa2f,IP:20,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:e05d1955835369e02df995000c9e29a7,BulkI
	D:261009193225U7GYPBLZ,BulkQuantity:8,SF:10|66|78|102|127|136|841|850|865|
	898,TC:nil,Content:0|15|50|99,EDM:-3|-100,IP:-2,URL:1,File:nil,RT:nil,Bulk
	:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,B
	RE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d3f94612c44f11f19a56ed5b684f684d-20261010
X-User: duanchenghao@kylinos.cn
Received: from localhost [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 205743036; Sat, 10 Oct 2026 10:10:56 +0800
Date: Sat, 10 Oct 2026 10:10:53 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: luca.boccassi@gmail.com
Cc: jianghaoran@kylinos.cn,
    avagin@openvz.org,
    linux-mm@kvack.org,
    kexec@lists.infradead.org,
    linux-kernel@vger.kernel.org,
    systemd-devel@lists.freedesktop.org,
    duanchenghao@kylinos.cn
Subject: Question about obtaining LUO session FD for non-systemd-managed service
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Message-ID: <20261010021053.KuJENWgJh-P8BG7PfTXkF4IbkNl4Qvb_gxgeKXxER6M@z>

Hi Luca,

I watched your excellent presentation from the LPC conference in Prague.

I have a question I’d like to consult with you.

I am currently working on the `memfd_luo` feature in CRIU. My goal is to
leverage the LUO capability to store checkpoint images inside memfds.
After a kexec reboot, the image data will be retrieved directly from
memory instead of from disk.

Here is my pull request on the CRIU GitHub repository:
https://github.com/checkpoint-restore/criu/pull/3152

In the PR discussion, avagin suggested using systemd as the CRIU daemon
to centrally manage LUO sessions and access to `/dev/liveupdate`. I have
watched your talk and read parts of the systemd source code.

From my understanding, systemd currently provides a unit‑based solution
where child processes can inherit LUO session file descriptors. However,
this approach requires the target service to run as a child of a systemd
unit. As far as I know, CRIU does not run as a systemd‑managed service.

So my question is: for services such as CRIU that are **not systemd‑managed
child services**, how can they obtain LUO‑session‑related file descriptors
managed by systemd?

Thank you very much for reading this email. My knowledge of systemd is still
limited, so please feel free to correct me if I have misunderstood anything.

Thanks & best regards,
Chenghao Duan <duanchenghao@kylinos.cn>


