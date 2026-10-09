Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9FC44CF44
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791567259; cv=none; b=QWPYE+0U7LoAFFg1+eTpOJ08cNSaX+w4T0iRRAedkGby6IUSg+KwFq5GMF2Erencawghxhqep4dZNv6hDOfRERQBsutnjQlbSLbNLSIPGZCCiQfkJ6IMU3UiEnjRjSBPIXmfp66yKsSOLSDe5jEwyt+yEymVV/utWi4JXJyEI/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791567259; c=relaxed/simple;
	bh=4QzvFpJrMIBOFL1LClfdnGhTbQVQVWWI+SlIcvg95ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jO/M+dQai5FmGBbmlaaeBSO/x5goounO4xGonjgXhnYALFNM6cg286Y66Ve8PB3SMtnQBf0XZq5phCz7iwDmCQjQfl3NuZyGiFI0mYp9re5Us61HtvmXmyGszWX3xMmGi0GWN8m9D+Rb35U8WfbghodWxwEt8GGXEajUQlkA03w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=Yua6chXR; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="Yua6chXR"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e76469b93so389055085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791567256; x=1792172056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwD4Whw0BsO3CL4xljsuE9wjdul1Y3ABr5wVzug+v1w=;
        b=Yua6chXRFeG43IGQ6rz0wJwiS+ZsJikqXnfwVGzxSfvLPCe7rUkCI7RUJnau9bjhl8
         kgeRz43OUXNSSQphvMOsc8C6fqI+gmaXG9JUniliBBItKjwMSTvubTLoM7MIkcRIaaaf
         6HW/HdLJrQdmBquzkQdNLkRhr+jhoDRtfAKfLTzgKSqPC949wEXIZUNG5NqPtoKpyckc
         L14LbKpMBzpa+m3LB0OdqchuYSmxVDqipcyb94C3+otykzdii3LnJJds81LlEgYoTP/N
         SBjkb0HMcv+71o39WTMUPAvNVkdsm2FewHCkMvJiT4gJW614hOQwcVbBrqFbFpUQQClP
         pD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791567256; x=1792172056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwD4Whw0BsO3CL4xljsuE9wjdul1Y3ABr5wVzug+v1w=;
        b=xT7tv+oyMiqaY4BEWf5E1xpDvF+kQ9x8SdTW/IACpFu4LDB7Z98xmjDDANNUM3e3VI
         TrHsLnpfIfNnZkRXXLjUDKSzgKDQ/oOrS9wHy15w5Yu3h7/8Dkv5kY8ic9O7SOJ/36fv
         vspDFu5L/IBNaksh/PBG9tOCavSzORyO2s1xt4HiwmyqKhIp888I+Dt1DBIvfK5y+usc
         fi5G2ILZB1DQw5MMvTHGxmQRqODEtW6aiw9UHHRaC7dTMNn3QIwQn6AR29tZh3VFzATN
         nmsm4s9Gq1sRo21WdXhkwKqz6O1iG8X6RwteTZklW+cjgAsMpIhQi34cGFyvUEWhpE63
         F5sg==
X-Forwarded-Encrypted: i=1; AKwUvBzd5rJlISqUHQU0Y1XFn4MwqNx28oyLtB7w9L0llJlA8xInkb1RJdaZmSfU54pIxF1JsYzl5sjY9S96qRE=@vger.kernel.org
X-Gm-Message-State: AFuF++kA52y9r1WFNkKHkZayb14n7SLasVV/72e57hRERNcREST8emPL
	9DeuyssA/geUT48XiXcyMfGBDY8zwqEVIzETAdTJVaJ2VEy4424rUA48atXObd3A9sSkavCCOzC
	pB0WiyA==
X-Gm-Gg: AYBFou2G3hnCTR7f5OhAj2KgjQHkQKQK08jNOUEE7tGgSYt1baKYeIgCU3B6Vep36ac
	vMqahOUiJy1oQsGtCW3s1mGVLsxYy6r+5ajlINscq/sUdfASfd8JrpQBzRdd1ulZddmwGBde2pd
	XMFvWUAzE4FHMwUTu1alL1tBb5nmgFl/yJXesqE7uwigMxbUd2Pp4gZbEEHRo/w9ZSUOsujty9i
	8qzbkcWuk3qWFxR2kS5Wxn1uqv9h/oCQL0xLJDHPsWQ7q+m/oJ7iXgHYdZuEKizH6fkyZb2ejJ/
	iXeAOrHZoGClqMhKbziG8Rxoc9PF0MCIYT0R6K2KDnQI5sojhd/GE1GTTZfLVxtzSp6jBu4O/hz
	dRknhGU2KkKvydDf8JxavqRapRWNBr2rCXirw18M5l3XJBUcnzl2sUvjAlUGV+kQTf7mOL87Qm0
	466AZzBqRjyJzFPrVdpXKgVRGzT+r8I/kqJimEW9P043q5W9DtI3kgCGKnQ754QXgJz5Q0Hnnfc
	ixYQ6x3bCJmi3vYdDfoJUAKMAyV+D35
X-Received: by 2002:a05:620a:44c8:b0:93a:14c:32ad with SMTP id af79cd13be357-93ebcd339d8mr378214385a.0.1791567255058;
        Fri, 09 Oct 2026 10:34:15 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9720f19sm238494785a.4.2026.10.09.10.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:34:14 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>,
	Boris Burkov <boris@bur.io>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hengyu Liang <hengyul@cs.unc.edu>,
	stable@vger.kernel.org
Subject: [PATCH] btrfs: return -ENOTTY for unknown ioctls on the control device
Date: Fri,  9 Oct 2026 13:33:59 -0400
Message-ID: <20261009173359.3486877-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5ab2b180884c ("btrfs: factor out validation of
btrfs_ioctl_vol_args::name") made btrfs_control_ioctl() store the result
of btrfs_check_ioctl_vol_args_path() in ret before it looks at the
command.

However, ret is initialized to -ENOTTY and the switch has no default
case, so this initial value was what an unknown command returned. As of
now, every unknown ioctl on /dev/btrfs-control returns 0. A tool that
tries a control ioctl which the running kernel does not have is told
that the ioctl succeeded.

The issue can be reproduced with a simple C program, run as root:

    #include <fcntl.h>
    #include <stdio.h>
    #include <sys/ioctl.h>

    int main(void)
    {
            static char buf[4096];
            int fd = open("/dev/btrfs-control", O_RDWR);

            if (ioctl(fd, TCGETS, buf) < 0)
                    perror("ioctl");
            else
                    printf("ioctl succeeded\n");
            return 0;
    }

Before commit 5ab2b180884c ("btrfs: factor out validation of
btrfs_ioctl_vol_args::name"), the result is:

    ioctl: Inappropriate ioctl for device

After that commit, the result is:

    ioctl succeeded

This patch will add a default case that returns -ENOTTY.

Fixes: 5ab2b180884c ("btrfs: factor out validation of btrfs_ioctl_vol_args::name")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/btrfs/super.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index 823a58bd2685..acb704b20c2b 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -2291,6 +2291,9 @@ static long btrfs_control_ioctl(struct file *file, unsigned int cmd,
 	case BTRFS_IOC_GET_SUPPORTED_FEATURES:
 		ret = btrfs_ioctl_get_supported_features((void __user*)arg);
 		break;
+	default:
+		ret = -ENOTTY;
+		break;
 	}
 
 out:
-- 
2.53.0

