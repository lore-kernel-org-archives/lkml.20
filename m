Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368261;
	b=vnTs77w4YyWJsHblXbu0N4pHSPUsyKIPSXlo+rJIjCxsPDK66llXBHte8eaAbf9aC8Kl
	 RtOvak3eSTzfpsjNBDvjoQPzezaGCz1lF8rQ7qEqwLkLbvhSx5I5S74sJATsuiaqXnEzK
	 gOvDbqXCWyAfV07rmm+VRdasQBLTNc/YmTepgvgvd/9UU0fBRL0EkMuklqpqFwd/NzdX6
	 Cztdd8tyVb+oyzJnOCRITsHWWBEiMoU4VysLvf+oSeS3Xc4/pr7KmDj8ST0yznILQfCLX
	 QmG1TfTqrSSsbT5KL7J/hvYjoKtBJ0znr0raXd9kViYiCmy+0WSEb1Xul6MVZ2dXOhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368261;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=WZm6Ui0hK63YavF1uUPDflys0iexgAevPAlf6/md1AI=;
	b=ArpWmpVqCFEyzUu6LwpooKFbJkHvOyx+2Y0K5QeTY2b6trJb/6QqlbG5uGlSudLKyGkd
	 WQk3DJoyJgYj0WJQzLHC9kGVp8YXJhpvc2O3TpLJE4sU75NyP3EG1OXRIysaUZlVnfsFO
	 Mt66ObWdA1DPp4OuTso16yiOayIhT6vo1uipe/WRQJa4SA1nH5/mN2zYCgI6T2671rC/5
	 J4+dntYN4ztbsXCXRZhiEb7O1OspvraKkFPgYvUZDuAy4EBtppBNQz58SQG+NBDGVf1+h
	 bsrwNMWWl49ElSFiZAkLZT9nZ8g8o0rPDOO5uB2aaH65fUFV8MNwN0c3Yzw+SNPHc2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=MifvZgkj;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F85606A31C;
	Wed, 11 Nov 2026 03:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5F85606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=MifvZgkj
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AB3bIukD2020572, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794368238; bh=WZm6Ui0hK63YavF1uUPDflys0iexgAevPAlf6/md1AI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=MifvZgkj5WPnrJZ/4b3/CdZHPLHvIXOkdEe4ITGQb+lo2jAE5BP2PXZJyHAxdnR+j
	 612fdz7zfKE56YW/XIrp3n4wiHulOB2TrjCYriE/7XfXYTHk5TOSGI4pra0CJAuRUZ
	 HPFLFYZZMU/KO4/GkMPqKBzmC2vUo8QaKjz4OKCrhZk7DRNoyc9ICfXpqczg1Q8hma
	 v7e1P4WyQn9l/lfpdDvK6cc08AYgDf5glljD42wL20eHFVc1AZpx0ONbeWcIxEFXgz
	 IS4BS2ptTnXXH86pMNf2lPLZ6Z7XxhqK3L0b9nakKy0xVS4s4mGZblJEMP0J8YvdST
	 4vSec0IyIwntQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AB3bIukD2020572
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Nov 2026 11:37:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:37:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 11 Nov 2026 11:37:18 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Kalpesh Solanki <skalpesh942@gmail.com>, "luka.gejak@linux.dev"
	<luka.gejak@linux.dev>
CC: "kvalo@kernel.org" <kvalo@kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 0/3] wifi: rtw88: firmware recovery fixes and LPS hang
 handling
Thread-Topic: [PATCH v4 0/3] wifi: rtw88: firmware recovery fixes and LPS hang
 handling
Thread-Index: AQHdb41QSnErllZH10GRoAb+TdNRY7coPI/g
Date: Wed, 11 Nov 2026 03:37:18 +0000
Message-ID: <3fa52468b46142639eb6800cb52b146c@realtek.com>
References: <20261108142708.489067-1-skalpesh942@gmail.com>
In-Reply-To: <20261108142708.489067-1-skalpesh942@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Kalpesh Solanki <skalpesh942@gmail.com> wrote:
> Changes in v4:
> - In patch 1/3: Also clear RTW_FLAG_RESTARTING in rtw_ops_start() if
>   rtw_core_start() fails.
> - Add patch 2/3: Prevent double free and sta_cnt underflow in
>   rtw_sta_remove() when recovery races with station disconnect.
> - In patch 3/3:
>   - Keep rtw_fw_dump_dbg_info() in place on first failure.
>   - Restrict firmware recovery invocation to PCIe devices to prevent
>     scheduling while atomic panic on USB and SDIO.
>   - Explicitly check rtw_hci_type() in rtw_fw_recovery().

I can't see v4 in lore nor patchwork. Please send v5 (identical to v4).


