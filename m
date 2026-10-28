Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188288;
	b=DcUrw+4AFGj9im7TWXhYynT9d+IRboND2doWr0z6gIxmzNokzzP1n7ovD8MKZ8jIKfM4
	 T5dQQ5/SwbNQH4z6P5KdF3j4vCOK75cUZXgKicZhC4BnI/ZB+sHp0+2fOUqrRw/aws3NW
	 XHZF2dFpMC9jzN5SG1glZDl/vt1rLRYPEJhFXyL2lC3A1s7pjIhWq2eS2d3fvGAqOvgOE
	 BZt7nl5gMlFMYINykqzy6/IY9tLZKPp6cP8NtJYOEboNul+2uAH443/A4kGjtAxQ6helj
	 4OjuCGi53ttWvGUuRdo5TE0Qhg5r0L7Kn3+owWm37yliSyDzaowhPlB8E1+gXxu29TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D5eK3OYxooGR+Ub/eQArvzI2ld0dXQ6MAm+b6bma6Gg=;
	b=XNakolfiPdRdBkRc7ceTFDX9/P6d7hJLu/qa/rfNqVVJi4drYDryBFOn6e+3AqmYkglh
	 8WAmV9im8zI8m/hid2pUAyS9b9fbINjCmgjYIH40S3TMbdyP2scEvi1iI/7w1Lr8CulRl
	 szOGyf9XoaLTqYPxpcmDLNlDZOeaEOmPAxSjGgT/RPpHc+ZUuI1wQsECS1UBfS1/AN/5z
	 zKBeGj1bjD3HtNLnKo/BhdITu2UKLZE3ecdzPOaUxOOLE3gmIFpDI/2CAIxt6vR220C7r
	 8NXI4D8TFcs4LaUL7t0G66l7Nnm9lqfplVoX2nPLql7O+pdHV0x+XA2klN/g/jkH26A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V93HvWF4;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B832606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B832606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V93HvWF4
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e04773687so345987f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793188286; x=1793793086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5eK3OYxooGR+Ub/eQArvzI2ld0dXQ6MAm+b6bma6Gg=;
        b=V93HvWF4gVsvGpl314PMh2JpbQW3bZjFTnKefla66L9rfKfmRYPcigQ+U+wlCMY8Jp
         2+vcgNoSXUCjaX3oFmX5Ko/XBMF1wnnBZ2Ud3pXIesUwcp1SFsoUAx8NKAiBLSPNrCb/
         aHBfhTg4W889MCfuWYCVxDx2SjOon9yT6zlIMNGwQeaaKNk38wcRyx7/sL/TQPkV1A7u
         l2XYVd2VjPbJK7Tku334lhdnBf6157CFfwKagR1uQOl8c5eNlT51sIt/pbotvjffUmGZ
         Yhz7S4esDr0mi8U4gKSvnOEIH5J0UJXdZSkxqfGvXJkijzpVqThDWLXxuRnYxlnWfvfL
         FL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188286; x=1793793086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5eK3OYxooGR+Ub/eQArvzI2ld0dXQ6MAm+b6bma6Gg=;
        b=WnzdCZWMJsxBJ6nTGhyUPIZ1ZuWYtuxdoFHZpcAfVTmu3+Mu7r4HTWBlfNWDA+Fo5R
         MM4ksIWXiLv8qdKfLUvpyip8B4wZ2VI9HppdzX+NhMt1Zb1rFE7V/1o9uwsAmnHvmJNO
         gxd7VAGVZYhQYfQ3mQ3EPPkYstvvjPI8o3Gm68ZSFz+0LhA0i230g1+frP/pMzt80eQw
         GCPFGmYmLq7IqvqmW3cS4eolKLwSfDlV3NETMmzUkAXB3NYd2myZUOLpvK4z/mEhmEWi
         trY+h2Y08IT5g1nAXpjdobP+1Ch6N7iw2Y6g2oI79Ypo+1aozEVn6Tg/b5hG4XnFnEP1
         q4jQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoJ7x+dMT0JZcT/liQguW0BIDrYELmN9SOz1TSaVyVPd0yqs1+5zc70vlkO0MZof7NukPe+Udu4M9u4VQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMoHWcjrKNx/YI9XsbE3iyED5wQV6iOstTXQacDhJujzTaEJnH
	tWpsHCMbzUcbVsvW0gpxvGcEuQEJ+mATOiOFJllyu1VvhwhwIn/2lBpg
X-Gm-Gg: AYBFou2jSBon+iqO0IF2wSmBdRv2Vezh09vzbemfdD5UR58Cx+8sf3P/OJ+c5aVBBFC
	fwjwVMTPqZ2qnzvk1Cyfa125f415kpII9O0lxT3dVNoWsZUaafhr4fgJ8wVRj9B1dKP0GJ9qzPB
	GY01xryZgPdJSG83yLUT0QxBBua0yj8PUPeOeniwi06FlAz3Ew/jcKCjI7w47wDx/BlexMvhM2y
	vIrl5ctl3+Xv6gM10SWf3wjvbvSC6TIY9k4zEpG6Iq2JIEG4f7CCQISREsj7GNNjfh4pLvhelGs
	jhcGU+7b61IEebvVwJsIlfAckBbEMneSId7/NAmlpdvBk6fu/qNryvYmrHrTWcWcBwkrh8RhSZs
	mYga7Drj7c3Bzwh5rcH/jZS8aY6DXqAjfPsUrhbH0Qpj5/afcfqDiFfwsAQ4EwG7Jmk9Lr5Oz0K
	pO+0AWMDA6naDQKrBdise38I7z5zL5MRmkWAC05GEE3G0TNxAGALZQaj44RSkI0KPROoU2RLMam
	wLt5A7/T6yGOhUAwI78DspPFr5iI6XiugpoCtaqFAcaLdtvmwNHEWogueEIUmLDn2UPrzz4jNgG
	46+2tbvo7Z+X6OLS+0Ftn/wTvp7jp0eVvS7vhnUOwl9Vzjrj6BApfJwC19fc5wwfHw==
X-Received: by 2002:a05:600c:8b05:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4a967202925mr42842605e9.19.1793188285694;
        Wed, 28 Oct 2026 04:51:25 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:47f1:8a3:6e76:cd9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c9f150fsm37684425e9.10.2026.10.28.04.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:51:25 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] most: configfs: ignore repeated create_link requests
Date: Wed, 28 Oct 2026 13:51:20 +0200
Message-ID: <20261028115119.902049-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

mdev_link_create_link_store() adds a link to mdev_link_list even when
create_link is already set. Two writes of 1 for a device that is not
yet present insert the same list node twice, triggering a warning
with CONFIG_DEBUG_LIST or corrupting the list without it.

Skip repeated requests until destroy_link has succeeded, allowing a
later create_link request to create the link again.

Fixes: acdbb8975373 ("staging: most: allow speculative configuration")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/most/configfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/most/configfs.c b/drivers/most/configfs.c
index 8f5158d95bc38..73794d2200125 100644
--- a/drivers/most/configfs.c
+++ b/drivers/most/configfs.c
@@ -122,6 +122,8 @@ static ssize_t mdev_link_create_link_store(struct config_item *item,
 		return ret;
 	if (!tmp)
 		return count;
+	if (mdev_link->create_link && !mdev_link->destroy_link)
+		return count;
 	ret = set_config_and_add_link(mdev_link);
 	if (ret && ret != -ENODEV)
 		return ret;

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0

