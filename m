Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845923;
	b=ca/SDxWeSi4Tyj0em3iNii29zdIP6r4ACf04qZbLLiOCqVERsZSAL9x0xe3t9GvQZ4KB
	 UsTXlZZRo6kHYtgl22PW2hen/1fmfr5yp5YTYebfpNUQ2+CFHzDqCZKiWmjB7RMiHSjRp
	 j+my+nwbXhZV8HbLgleNLxkRxR2jYDePx8zDOm/T2UDn/AhE34baHNS9CuA2zrNxpOy8m
	 MssJ/G4ZAnwRxkpKRU4onhwg+kImwO//lr1JdPhhQypintytVFmdPS7s32lqVk+JitGAC
	 0iXWpp0LW2EJW4+QRPsXac9nmUx9iTlCw2JExn/c2tvIXb5sxfBgvGHSisD8YU2C7sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845923;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=fFHVGW/qi2aH67mIa0HBYC7MRfeVrxQhZqbVRq/tVTw=;
	b=3U57EHzpj76SYKJs5DUBLFKVtcaqguWU9NQ/ChXZcQwBAnG0g4emLMN4kIj0fXLs6hqG
	 0XMrqwMHN7F0Q0TpVrLfonuCe+XEIgX1sTSPrSdO7qAaOIddRX3dt0nfK1cS24XaGlXfj
	 +SCMlR2rHzAJNkPuc9IHq1EmID8Pky3dI688j53dFXn00Af5UxA4+IgvD/heJzYCMuwxl
	 1vhklb2KxKJgEvQWM5nUIFUF8OfFtBVQmaoAyp46SsrAFwJBfUcbEYHqIbwc/eHAhcxEg
	 kzeMHcPN22Uo/px/1RDPOjTO/4+w2DilkI7zVLTdohGHlpgNkyWGccPt0ggdE/aBvKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AEF606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49AEF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIgSD2850982
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:18:42 -0800
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hxqtnsmhf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:18:42 -0800 (PST)
Received: from twshared77744.15.frc2.facebook.com (2620:10d:c0a8:1b::2d) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 16:18:34 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id 7A3D72F08A7B7;
	Mon, 16 Nov 2026 08:18:29 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Sagi
 Grimberg <sagi@grimberg.me>, Mani Tofigh <mt4022@columbia.edu>
CC: <linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <tz2294@columbia.edu>, <stable@vger.kernel.org>
In-Reply-To: <20261111-nvme-subsys-lock-deadlock-v1-1-1837b8e9076f@columbia.edu>
References: <20261111-nvme-subsys-lock-deadlock-v1-1-1837b8e9076f@columbia.edu>
Subject: Re: [PATCH] nvme: fix deadlock on nvme_subsystems_lock in
 nvme_init_subsystem()
Message-ID: <179484590948.648177.11478558432754935680.b4-ty@kernel.org>
Date: Mon, 16 Nov 2026 08:18:29 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-FB-Internal: Safe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXyG8fw89blRBr
 lGzbwfWUgKirN7eAelx4gAmcpeTXXbcbNLzl15rfVC9X22Onfd9Z1sF84+jhxTikJnSve4ZdaMM
 J6vc0HUt7b+vhc9AKypRIEqBGgAVBFs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX5blY+UoDCdVh
 e8DGJ3EhpWaGh5fI5YsclLr58AFrYP4uphmse+RJEEkOHCCM0NLjyWpRTuX86FKAwEB4+Oxdr8T
 Dy8YfeC0mxZYaqFlbv54oug8ZQYTZQ5vlbf0ojW+t2z+fma+gEvXgz8nKmZZPvW1EIxnewh7UpO
 OZK4vgEXoIbsV3NtbbG3XUYawYIRHj7BwhNMli0lBqjF6gVD8gOjfovDEe6UM1tPHy3WS7MmGcL
 kg8ijbT5m596uL3R7ZoZYVYdb1Ab/o6dZqmubSkYRt8EnQEhWu8zELsZ3IjXxImOt4Srki2UqSf
 N+T7KzOYG6UXP/7u9D2bAD/uZ1BGUfR5fEHOizdQfF8sZku0V/MlFLuncQ+124cxb5HmbE52ROb
 XEH+aX7zmMXDD3Lw2Bq3nR2FSf0tPxRL4B/KTV966HAwKv1ssxSTRUSMufFyfHMBuNGTVlOLM9u
 OHyq08G4QMboU31Khzg==
X-Proofpoint-ORIG-GUID: KOZp-ZQft9z1kRChGaUmFm5QOZ-S8pVs
X-Authority-Analysis: v=2.4 cv=U6cHnuru c=1 sm=1 tr=0 ts=6afb2ce2 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=VwQbUJbxAAAA:8 a=csGGxczj0hs6o8ZFVk8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: KOZp-ZQft9z1kRChGaUmFm5QOZ-S8pVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01

On Wed, 11 Nov 2026 17:46:31 -0500, Mani Tofigh wrote:
> Connecting a controller to a new subsystem deadlocks when
> sysfs_create_link() fails in nvme_init_subsystem(), e.g., on an
> allocation failure.  The error path drops the last subsystem reference
> with nvme_subsystems_lock held and nvme_destroy_subsystem() takes the
> same lock again:
> 
>   nvme nvme0: failed to create sysfs link from subsystem.
>   ============================================
>   WARNING: possible recursive locking detected
>   ...
>   nvmesubsys/95 is trying to acquire lock:
>   (nvme_subsystems_lock){+.+.}-{4:4}, at: nvme_destroy_subsystem+0x1b/0x1e0
> 
> [...]

Thanks, applied to nvme-7.4.

[1/1] nvme: fix deadlock on nvme_subsystems_lock in nvme_init_subsystem()
      commit: ba1213be15c613a1c03db69ea6480ca140a6ca00
--
Keith Busch <kbusch@kernel.org>

