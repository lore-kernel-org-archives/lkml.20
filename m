Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845925;
	b=XDZzBsiwbhdO9dH8aPGE5QRN3lqCHRuV+sV54JXg7vtuLUiu4dM395aPukgRcelH6MGm
	 x2e3ddEjOKcFpM3ULPY3Rkis3lRE8k/rcSjcUOHT+gauPvC1w4MWkzwcIXjDtFFkZTS9d
	 JK9UaJCokqkh1w8ZAJEAn77a5Rh+qwBcXh+1ZyflfqluDIqp4SDzg3sGvexfYen/hQ9/a
	 eW8GbRdUvGjbp+mMEO9/yFnUid3IzagxgbsQZollDSs0B7RwVoFty/dtoBwUHnLt/lD3y
	 GYMJZqAb6GLUfuzwlMy1W9yy+7mQSc9two5gy3iRJzjxIndrF68fMt/Yv368jT7/y1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845925;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=raiTjx+BmSkMR16aTA0YXPp0R1Sqdpp0zR0V56k7sp4=;
	b=Dnre3IB303kTTQtjdtt6NTiXywYi8iM2K9rrr0W7qxaQuz9ryWRCHozmzvN3pRe8QrGT
	 3hdRiwDTtnmjxChwEDjRwVTQlSr1ZfhTXMuXEfuclzE0iH03tIIaLfGPXKNKJq2h7jqjH
	 b4+g04TAh4nuB/yqUQ9FC+7Yxb+a8kfZSa5W65TZCQbVLSJf1kCxGJUdqQ+J2ODDqfuGa
	 OSLkIEqSi3niNhTPtQpocJhcsSt3tZd5PWVHQ90HVTQxg8XPu9h2jr+m8gFjNFhfhe/kM
	 qo3IobHs549xt/CbZksirbdnIc9W0faFbipUjBnUbUhQTE6QMxpDr+QRr0jyXLzXb3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B64D606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B64D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIfwS2162510
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:18:43 -0800
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hxp1gjeep-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:18:43 -0800 (PST)
Received: from twshared77744.15.frc2.facebook.com (2620:10d:c0a8:fe::f072) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 16:18:34 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id 7EA1F2F08A7B8;
	Mon, 16 Nov 2026 08:18:29 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <axboe@kernel.dk>, <hch@lst.de>, <sagi@grimberg.me>,
        <linux-nvme@lists.infradead.org>, <shao.mingyin@zte.com.cn>
CC: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
In-Reply-To: <20261112220058755zQhw_h6UkcVSjRnu478lb@zte.com.cn>
References: <20261112220058755zQhw_h6UkcVSjRnu478lb@zte.com.cn>
Subject: Re: [PATCH v2 0/2] nvmet: fix file backend short I/O and LBA range
 checks
Message-ID: <179484590951.648177.11841424492574370118.b4-ty@kernel.org>
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
X-Proofpoint-GUID: CnpTUVC6MvHGZWrvmzPvWLt9b5QGCK6F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX12ppnPx4QJ9A
 17qQymnruPKoFClqlZfSXwy5Li4Axz9/pL/ogqIApud95I+DCOFPhVVUAtvVZAc6Ss7oUTEHLGr
 Z8SjkoQlOmP6pvznp8M6zbWv1ePMjIdaqvjxv+8dofPfi1KkVXMz0SmSVIJE72DgWr0e/Qw/Bc6
 1DAuTlscwgB3s+xUWO3YeC9vIiBpUWDBb7hsDy2dX/b0yaZyK5mFWP1gIP850RnN6BTXL10WG6Y
 vAeFCcMaKiXbwsykoZPI1FHWemTzr0qo0zyUns4Rximzx8rsb0uBZ6WouLs537RF+PDHOnPdh6P
 zBje9wqqQZg0gWNZxRzLqI0k11Eul036dV8UUfCxr+D27IkWksGY9wboO2vU/rCQqGMXhkbAsgf
 vuQB0mhia0DgmIp/WHba2W51GXkKDRwdu7qz3WU7zFpR5gEreRkwOjd9gouni53sqd0bEk3aBv6
 hrED/FR4zp2qP+NsU6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX7lJgXas9d+/B
 /IB85+SV315pmyyqLKe8EHf9ubXbCPWS6MVMhP7M9ESaZQSxjw7ivjXUAMrlxPv8zEDDb4wGbRT
 u13zDLDT/EjXiAsoFjthzS/15fMG4X0=
X-Authority-Analysis: v=2.4 cv=aMRlOr9m c=1 sm=1 tr=0 ts=6afb2ce3 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=1RTuLK3dAAAA:8 a=VwQbUJbxAAAA:8 a=k5peSaqcjJABVPERissA:9 a=QEXdDO2ut3YA:10
 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-ORIG-GUID: CnpTUVC6MvHGZWrvmzPvWLt9b5QGCK6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01

On Thu, 12 Nov 2026 22:00:58 +0800 (CST), shao.mingyin@zte.com.cn wrote:
> The file backend computes byte offsets from the LBA and block size with
> unchecked 64-bit arithmetic and does not handle short reads or writes.
> A host can therefore make the backend report success for a transfer that
> only covered part of the range, and a large LBA or length can wrap the
> range check and reach vfs_fallocate() with an out-of-range offset.
> 
> Patch 1 makes nvmet_file_execute_io() stop at an incomplete submit
> instead of advancing the position and eventually reporting success, and
> converts a zero-byte completion on the common path to -EIO.  Patch 2
> adds a shared overflow-safe range check and uses it for read, write,
> discard and write zeroes.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/2] nvmet: handle short reads and writes in the file backend
      commit: 1738de07a79b9abdcffe03571c442033b80e7fed
[2/2] nvmet: use overflow-safe range checks in the file backend
      commit: bcd5316e708d418f03707c183571549ad878cfff
--
Keith Busch <kbusch@kernel.org>

