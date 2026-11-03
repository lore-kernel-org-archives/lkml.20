Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680268;
	b=m3lXLA63gjnB905jNS3sTu4/KSif6q1Hp7kFrRrYemf7ApUYtjFJq2M71RdA+TpWBUlK
	 ZKUfn7xzVl+NTkfPtGGGtsM8kKrz4wz87aEFCuNR5MuNr8cC3Dvwc52IaEqFb17ZzDWH/
	 xAasIJgfYMaFXDm8YOfdBRlB3j/9KUijiDeAMpSWEp7H8NU9nhw1Gj5jDMRDfc5LAs2u1
	 g6J4hR29V5imn0xPImJQno5AKnWKx8VWRZLIsiTLD8oNk/haBZuXZgNRhA+flduSAe8s2
	 9jPxD2LhOcV+pzhwAE2IbVl4ShybpuMBuXTczcGlXQmEBA2lwL62MhIp0XKQhxNAMpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680268;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=CwDJSUczuud0Q9XBv7a3So6TD8KsAtJlVHdcOh+Ol4s=;
	b=q7vcfz0khSfAVAiAZqGjDqY6S7TIVr4DuTTLqB9vkdDuFV8jlKAl7y94e0JL6NSxogIx
	 oh/d2G3en+44j6J0kim3IFoDO9hb69eHfOvDxbvXlhTB1xIJU0WVaOqf+ks3BlfmqTOqO
	 H5KuApqDNoUCJTuOvaMLPkzhAl0ZpLYQXKiGXY/HfUYUxCaMdBlY4OBLeo2Y2DcbF8ZSf
	 KDTKevo61gdH38yq8oDZfubQbkhGbyXyTCVctO6qND5daCGllIibrbylqzJUSqtCxY1VH
	 vzEiTY8TH7yrmyZiSMMYzqWbWJgMqBf2aM8Wy7eo5MfpnkdGq7qSJDF/qbvGWUxCQbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F84606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F84606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jJbHB2G1Dz57HRy;
	Tue, 03 Nov 2026 12:31:02 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 6A34UwH7027396;
	Tue, 3 Nov 2026 12:30:58 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 3 Nov 2026 12:30:59 +0800 (CST)
X-Zmail-TransId: 2afb6ae963831b8-30b9c
X-Mailer: Zmail v1.0
Message-ID: <20261103123059667zqKLXZXpg5bc5F5FV7Xy8@zte.com.cn>
In-Reply-To: <49cebc00-3827-e24c-3e0c-74ea6ca8c7e4@huawei.com>
References: 20261102214531231UAVA89ay_BDVcwFmrv8cq@zte.com.cn,49cebc00-3827-e24c-3e0c-74ea6ca8c7e4@huawei.com
Date: Tue, 3 Nov 2026 12:30:59 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <chengzhihao1@huawei.com>
Cc: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAwLzVdIHViaWZzOiBoYXJkZW4gdmFsaWRhdGlvbiBvZiBvbi1kaXNrIGlub2RlIGFuZCBub2RlIG1ldGFkYXRh?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A34UwH7027396
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 03 Nov 2026 12:31:02 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE96386.000/4jJbHB2G1Dz57HRy

>  From my perspective, I'm not really interested in the problem scenarios
> triggered by malicious fs image, let Richard decide whether to merge it.
> This series does not seem to introduce any issues, there are two small
> nits in patch 2&3.

Thanks for the review.  The threat model in the cover is the only one the
series claims: mounting such an image needs CAP_SYS_ADMIN in the mounting
namespace or access to the flash.

Two of the five are not strictly "malicious image only", in case that is
useful for Richard's call:

- 4/5 is replay: a node that was corrupted on flash or written wrong would
  otherwise let ubifs_recover_size() extend an inode to a bogus size.
- 5/5 leaves the image unmountable after a single removexattr(): the
  underflowed counters are written back to flash, so it survives remount.

The other three are mount-time validation of fields that validate_inode()
and validate_master() already range-check for other values, so they change
nothing for a valid image.  The patches are independent and any subset
applies, so dropping some is fine -- I will leave the decision to Richard.

Both nits are taken: patch 2 folds the size check into the existing
ui->xattr block, patch 3 merges the lower bound into the highest_inum
check (that one then reports error 3 for both bounds).

For the series: I will repost only those two as [PATCH v2] in a new
thread, each noting that it supersedes 2/5 or 3/5 of the v1 series.  1/5,
4/5 and 5/5 are untouched, so I would rather not resend them -- say the
word if you would prefer the whole series as v2.

Thanks,
Shao
