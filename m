Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463239;
	b=YcA+HJyxp4afrvem3ZHQv3/fWsItUgGp/6O/20laD8vVi6Ktp2JMwHQnWO+xvBDbEhWK
	 19kLQprSYnjmPLYaP3PGQzann9ZJJ3jqEVPZWjZfzARTqQ441KynoZsSwtzf33lpSboqh
	 SBcIcji9aKr0t1i1Pm9RBnG4+bDRTeenqMxJNe4cnA/zpRtBp/jhGhizvQKsfTwNeZl11
	 Rz5iMjo7RthUSzbCSYhKG0rQYEzsT20F0B4y9v9a2zW7AzDmSf6tM7cbLjhVZrEF1eEcA
	 0KLGMvdGk0/6+qLug+Y+eIVEikyDGTz8trRm+iUCFA7AIi3Z4bW5N03dOPw4NXr2pxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463239;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ny194+ai79GB9X1VpaDkzkAqwfF8grX3ncvPdOU7FA0=;
	b=aERwA/skGG+fg9esiCELT3EIgtqXI2J+Eo6RcRiD/qQugvgDDbLnkSf815FNn0VT1fVN
	 F4VinrMsNB1GFzChPJUc09xy6d9i7LBvUcl0CHNmbJ20f1hqYi8oJQGr/sfZT3GPj8owg
	 noZUysAlK0mHjsWsSfjnGbeIR72Qnt+JaizGfFsX1bzv2WgZt7QbhUPMzZud4ffqYeZbC
	 qSxo/J0lIn96DxPABDyUbz/7DeBFkvEI4fmaDiwxCqu/sAqF7825mVYxWArvtA/eq4JaR
	 NmYVeBwFOTMSD/hmVVpn1vpfPNHQGt7Cgv/lq4zdfORijaYjYVH5/yUJOUJAeQ+zBSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD16606A31C;
	Tue, 20 Oct 2026 02:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CD16606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c20e5646cc2d11f19a56ed5b684f684d-20261020
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:56e6fff4-1327-417b-b34f-10d44f755cbf,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:1d71a68e37344f5f8d2b2ae65dfc69a4,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c20e5646cc2d11f19a56ed5b684f684d-20261020
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1581795797; Tue, 20 Oct 2026 10:27:12 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Jiale Yao <yaojiale02@163.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH] usb: typec: ucsi: acpi: Check ACPI companion before use
Date: Tue, 20 Oct 2026 10:27:07 +0800
Message-Id: <20261020022707.3691899-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261017064321.3816776-1-yaojiale02@163.com>
References: <20261017064321.3816776-1-yaojiale02@163.com>
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

Hi Jiale,

A heads-up on the history here: a functionally identical patch was
posted in September by Yogesh Gaur:

  https://lore.kernel.org/linux-usb/20260920090711.300-1-yogeshgaur.83@gmail.com/

Greg declined it on the grounds that the only realistic way to reach
probe without an ACPI companion is the driver_override + sysfs bind
path, which is a deliberate root action, with the resulting OOPS
being identifiable by the taint flag - "if userspace does it, it
deserves the pieces the kernel ends up in":

  https://lore.kernel.org/linux-usb/2026092130-thong-secrecy-1dd4@gregkh/

The open question left from that thread was whether syzbot still
exercises the override+bind path - if it does and keeps generating
these reports, that would be an argument for taking the guard anyway.
Yogesh's version referenced a syzbot report; yours does not, so I
can't tell from the patch whether you hit the same report or found
this independently.

For what it's worth, the fix itself is fine - I reviewed Yogesh's
version at the time, including checking that this is the only
unchecked ACPI_COMPANION() in drivers/usb/typec/. Whether it lands
is purely a policy call at this point.

Thanks,
Huang Wei
