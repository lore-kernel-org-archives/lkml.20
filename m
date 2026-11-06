Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991708;
	b=BQoAlmZYsIY3AvIOSpe7YERLkv9xhtc+VQAIXwbb0QamV9S64bYAQVur/wG0/V+2mGME
	 l08YaWfm+KWvINDkJ7j8eQABE035K/1+W/VvZLpSklA8GNhEq9MNwk+F4tKurbSN94kgh
	 WjEkyyyOg1ZotA2O1wcbtt1XrPwku8xrXI5fqi/hD4b1ZM6wAqsWdupy3BvL7LJx/mGrc
	 2zKKltAaa29y7IB/mXO6tNrAQfM6PdHHvk+kt1UbVWaqQWKOCkFsYoi97fElLmtC05AT5
	 xsU4eXAZoinszW/pRI5WK9OYmEel2vvqZgMFEHzmW0HpjftaAr+GyPl/1hPJ4j3ntqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1Gdrh4wEdBMHBPOr+MFiKo+xNYI96TJ5s+2kswuBKKc=;
	b=CR8nBxEYMpwQ1FER0kI5BAdup1tOsc3Q3mj/kAwCbwrbveG39YNLob7a1uv9cUIjvXO7
	 T2MT8oqPQmJmH2L8fkHZtc5sNfQgpElicwVgcR0FArgms/HI5V8dyMxVW6QOXQyLeSVnY
	 2R6mDWh6CERWDEopPyq2kEuvHJrvgWHwToa2+3JNWU+t8lpxe2mTluYwxQv+u40K/NzCe
	 lHpxThOiLz5rRbQYWxvSRvi67UnBKjFRCxLyoHIW50gXVl/qE7BKKt7qf8u4kfz1XbNMN
	 3bemW9fpr93J0RW1eWigG3u3P/ILwWJAgmtoU/eyGG2dn2AlZzQcgUY3DsEC+41jYDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ovZXyJBD;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=2apbjIPn;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4E5606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B4E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ovZXyJBD;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=2apbjIPn
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6IvO7Q2647585
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 14:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=1Gdrh4wEdBMHBPOr+MFiKo+xNY
	I96TJ5s+2kswuBKKc=; b=ovZXyJBDDK84T13yCHFkFxGeuKGHjGBHuuRjbBeC7d
	0oS+HT8+fRUcnsK9OU9SBedWWyF6Axn7d6OFZhRMQB/DPvFJTlyb9T7T3ToSTwRb
	Bms+nOGBVWQulVpn+FimaO31r/iFEwgWpKi59zgshY4A31D2B9CzxQ8CxJCVOSc9
	gc+WVwpFgQxVgOywFf6wrwaHDznjaFWw3SFW+Jd+vRdKHfDjWscTCzv6XXRShWPs
	ZQguodVPGHaMFU0wVzSOTm/r1Wu9DQlw12tkq1O+Mdy1nGPLsfAC/1h3p/xifTHo
	VOeATxgtwRpc1WLV4MzeGAOGX1ywPWFdVBFv1cx3rQmg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hs3pc5ym2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:01:46 -0500 (EST)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-998a2b06e4eso120989241.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793991706; x=1794596506; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Gdrh4wEdBMHBPOr+MFiKo+xNYI96TJ5s+2kswuBKKc=;
        b=2apbjIPngg8rnAEezd7T8jZ2GQwhhM5CeuYmj0ZhOY7/m9yYxTJZlEW60fV2uZ5jwS
         gilivmuuCazZuYDajexsLDoJVwf5gQfV4FmmYxREhXZPxaUe0iytyakUqxufTb9LTbZg
         QDRtAAWNbquR2TAjPfErrdchCT7EPnEfYYTgfRX6LRahza9OnoAPBZLebKbsjKdB5ROE
         iCWNRYRJAzAI6L7GpDkU5s/RpMHUF+o7/yG4BKlOrIC3ZDcWraGUGGtrowQmZYj5ShzZ
         odmeAs68gm5hRcTIko5mmiR/DV6qkmQVk5mnv9xgjdbFfofJkS/MKBLhbVLJUaEgx3Z8
         D7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991706; x=1794596506;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Gdrh4wEdBMHBPOr+MFiKo+xNYI96TJ5s+2kswuBKKc=;
        b=tpxei4eQ2h+/oQofFCNrpM1slrL27c1qpqtUSumZt5cDheFte/u/UNzdRod+Csn6op
         c/YbqXF8dug9D9pHCdjuwvr9ll3SXWwPTftwC0Y1t2B5cMG8+TCoobRrYvDLQV/yxuex
         91MLhSwOzu5JxMp8sQw8dXlewL2DqPQijSr0BzWXp44afUfD9jvl1aaBBlxVF2km6ot/
         qFPBWhgTqd4fqZbWMW0fLrqBs84pVZ40AqCk2CSdzoPMs9UA9I6V+3SCzsrSJn7ULVCT
         m2NprPEIlqaLbKR6wlAc88ZYEix3Owsd4Ry4lXOLJ9Ljoe7BKHzM+fzIrG9QS/sM9vzW
         OiIA==
X-Forwarded-Encrypted: i=1; AKwUvBxNzA5KZWl+g6AXBRWAYQj8TaQYAiJbhBUGlC3Npwim0aScUwlkQPdSCI99naRyvWw4XC+7SGBCDnfrJc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bBajhH7suynNGG/GzugwPDrtuGs6QGSLTTQTdVn6bXjBfd3pZ
	o/vxmofPVWqYnf3w6Mlgt9dh04dC3Gu73CmWJMFSN5YJj2r0jiYchweBEwWZH0ryboS5H77mBZX
	bvpmV/9gfmLqHZzKj7SCpztIhI0BNpDHdmjJruLUS+CIRTer1byRFm7xBYgDROg==
X-Gm-Gg: AYBFou2BhH2qvII+I/8UggsfR3jb2SbgsQR2ycWQHak/aR64BTOO7hMIqD2cjg3HbT0
	T+woQFlS34F1Y9IektGpctTEhf9vw7fPuP5jMr9gr3RNG73XaSDM1/9+qWSEiym7dBLSbASidHc
	UxHz7Bj2eLItsagF5GZt5f9V4q7YTE/13sYQDzx2oE3eulyRVDDoZM6MACOYtz6rbXOd2wI9b7h
	bPrOJjyXl7PBtO7wkkpZIi3TwE4o88RZSXc+6199ybhlk/Q+lG530DmjxCbb0yB5FnYh7a+ZAuB
	DV6U4dnKyeWDv81wxtdWSC3W7n7DtTarGrmrYaze8RckuaJbqxVb/InNuabngFhdq3Ja7JTZVyu
	EN9+7Ecj3I8Rbtw33CSwH1qzJuUzPMQtFe9SXymgmNnrvDAgJ1/7aM4fFRbA5sOQVS2IMZwAboH
	8B6dKsu+wvZBYEg7Ml9GPF
X-Received: by 2002:a05:6102:54a4:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7d2a16eba5dmr1691793137.34.1793991706237;
        Fri, 06 Nov 2026 11:01:46 -0800 (PST)
X-Received: by 2002:a05:6102:54a4:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7d2a16eba5dmr1691523137.34.1793991703397;
        Fri, 06 Nov 2026 11:01:43 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-224.net.columbia.edu. [128.59.176.224])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a71bfesm27276376d6.25.2026.11.06.11.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:01:42 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/2] iommufd: remove the last use of
 set_page_dirty_lock()
Date: Fri, 06 Nov 2026 14:01:18 -0500
Message-Id: <20261106-iommufd-folio-dirty-v2-0-3f0b0be58c4b@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAP4j7moC/22NQQ6CMBBFr0JmbQ0t2hBX3sOwKO2MjAFKWkokh
 LsL6NLlS/5/b4GIgTHCLVsg4MSRfb+BOmVgG9M/UbDbGFSutMzlVbDvukROkG/ZC8dhnEVpaqK
 LKiUVBrbnEJD4fVgf1Zdjql9ox121LxqOow/zkZ3kvvsVCvm3MEmRC2WRtHbKaSfv1repq9mc0
 SWo1nX9AK+THz/LAAAA
X-Change-ID: 20261015-iommufd-folio-dirty-8abff4281f3a
To: Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean-Philippe Brucker <jpb@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793991701; l=1664;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=/v9Cq5RBHqPm5dYVRd0BBFfZIinHb5elOrJG9qNMuNs=;
 b=VqR1IDMjKgEHAcXeFY2Qa1MqVCmF+aYUMFO6uHZDkNoQFXtyWzyELjq9wDSQVYm+QY9mcQ5r4
 8mJI2BQbDz6Af9m9B4ONtGc8yXuJCQqKbPWuYjiCwmNDR2MVoZoLfmM
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: Ye8h6-qzYRtrEHuKaSFNnG3O7TlK8t8V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NSBTYWx0ZWRfX3b7fms3x/Xp9
 BRDRcHQkT+EzHoQ8yFaVe6PX04hlh5ozP6fGXxYs3rE0Wu85EJj3rPrYrnaWiBH6qwFdbBnCkUP
 D4YNhwmepAo/evhrqe4mOnkbDFvnrhj08d3LgEIGlj1sc1q10gJi+nCHAW7lQos5Xxi8bH6ZO0c
 zPNbE4JtDtknPuyl3SqcdriSMssxlMwLjEv3Zp3DGiTVJPMYJgUp8GnaMeOQFhC9GjLD1PzELQJ
 nidDK/fV1ZVzr10YJyIUzl755izzP1OX7GZbZbDjNPcjkv1wjnfbwv053drQm7LWu9LvHA5s8xM
 mrHag2r57SfKFLPV/4+fgAnQ3tRHoH6Qbeay9sM5f96AR0Tnq+Y3TMlt5ddSXEMb6j+L/MK5IHR
 POrNWAcwsRzDkdT75d3LLs0mjbPFa0n3ApQrXsI2t3Hq5CYvCEnMIaAwxE+CXa3YQW4GoTM66S1
 UeNx8c1ckcMm0DmW93A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NSBTYWx0ZWRfX6zmPDhhTkeit
 40Q6M7QyPF7RLJB9ARtIB/HkUxQTsyoom7hpIlzFEU/IVulXGVc/FN7Dx+TB0Jy0bAEj49wCXUq
 Qb9QuVVNDZDBK6NR+pG8XgDnFnr3nviQvm1AyVrwDI/y7OO9FeRB
X-Proofpoint-ORIG-GUID: Ye8h6-qzYRtrEHuKaSFNnG3O7TlK8t8V
X-Authority-Analysis: v=2.4 cv=EeRd0/mC c=1 sm=1 tr=0 ts=6aee241b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=bIa82ERlpw6mw/X9g1H6cQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=bC-a23v3AAAA:8 a=J-kmklhjSyCjd-MEBfQA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11958
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=10 spamscore=0 bulkscore=10
 malwarescore=0 impostorscore=10 phishscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060075

batch_rw() copies to and from pinned user pages one page at a time and
dirties each with set_page_dirty_lock(). The second patch walks the pfn
batch a folio at a time with memcpy_to_folio() and memcpy_from_folio()
and marks each folio dirty once. It removes the last use of
set_page_dirty_lock() in iommufd.

The issue fixed in the first patch was found while testing the second:
iommufd_fail_nth turned up a dev_iommu leak in iommu_mock_device_add()
under kmemleak. The fix is independent and could go through the iommu
tree on its own.

Tested on x86 under virtme-ng with KASAN and lockdep against the iommufd
mock driver. The selftests and iommufd_fail_nth all pass.

With ftrace timing iopt_pages_rw_slow() through the mock driver on a
non-debug kernel, slow-path writes to THP-backed pages drop from ~1310 to
~930 ns/page (now the same cost as a read), and writes to 4K folios drop
~9%.

---
Changes in v2:
- Add tags (thanks Jason!)
- Allocate the fwspec before dev->iommu, per Jason Gunthorpe.
- Fix the Fixes tag, per Robin Murphy.
- Link to v1: https://patch.msgid.link/20261031-iommufd-folio-dirty-v1-0-2cef66d2d6d1@columbia.edu

---
Tal Zussman (2):
      iommu: allocate the fwspec before dev->iommu in iommu_fwspec_init()
      iommufd: copy to and from folios in batch_rw()

 drivers/iommu/iommu.c         |  8 +++++---
 drivers/iommu/iommufd/pages.c | 35 ++++++++++++++++++++---------------
 2 files changed, 25 insertions(+), 18 deletions(-)
---
base-commit: 04bcf84613346b973a8cc0c59238b6b5bc902688
change-id: 20261015-iommufd-folio-dirty-8abff4281f3a

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

