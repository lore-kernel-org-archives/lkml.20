Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488714A64EE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730338; cv=none; b=P0DVh87wtDzLM7kAQF6Hzi6fa1Gm9kMTlMOzV+XAsVGKSxtYYxyF3VFBFGld1ok9gr1oP6CkbUd8VoegN/YotVRw0oadqKyxe526rZpxkVKpNW2cYPqa2ToCzt5Gusb/lsmQVG6xPuEaO3dgsElghO3w19xvGwB+Z04XJLt5dE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730338; c=relaxed/simple;
	bh=Z7v4qnq8aw0x5iEmhBG1pSTK1bzA6es6jG4hCbsdcO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AbgeWUG2LV5aoz777s2sUthcQsj+GYoHCSU8SRk9WF+sFhgqvqyXFBzr4TD3cLMVOWXouqhtXQx9WL6Dh1QmZtMDFachPOrt87SzQQv7047GV5u8VfKOUwIuSZ1c+o8vvrEIBiki8eTaClggH1sXJihUhDqT3tEZ9z4o4G+BtaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jt4xRAbb; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jt4xRAbb"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so5252045ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789730336; x=1790335136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmpCaksYD9t+NIH9u4y2WiH2f+2khrN9+kqRKuQHjsw=;
        b=Jt4xRAbbctTppsAM2zeCCehJYAGtEYYThv5H2h+0003MoCcIt4p1RinisTH1oyBMR4
         /0wtjqVra+G830fZOCHXG0X2cQvWWjZGHlv6BvqNJlS5t0IIDtjGePnmagMRqWQUEoKV
         8uXtqZnYbaKTTHAKwJoeswjtiKocqnE6NuOLo+9b93+Zw0EsE8pxM6m7j72zom27cqyP
         CVLGteegCGn7B9Y6BbRvkrTnon6+t4jmZDaifLL5gh1WU3w/GBwFg3GOh9R453uuNw1m
         UnoS/j93wYC+PP09AdayzVrcA6H0O8u2W2g5t79xWAMuFxRcc90FKp4xwXZnglVSdOLS
         KCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730336; x=1790335136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmpCaksYD9t+NIH9u4y2WiH2f+2khrN9+kqRKuQHjsw=;
        b=F98tGE0i9PJQ49OFP3pteLJNzn5JTFWAqSvmnWNvZR0/58saoA6zoSB3RpSPFBV55S
         t/CP1IctGUPJRZ49qj4hgxob6fCZTmxJCNLiIQnc/+zw8igc+CDoUdl0KpVWGi9Z2/2C
         RDWq+DYNddW0xwrxjmHvwNxufbaTRn1pvOKFf04FJTkZ8qJLUmbSoUu3YI2FKdGAmK0Y
         8RadoRow9tPDRJwZT+naEnG27WTjSFuEBU15evZhWOg1rDSlz1a5yeTQGtBUZbhENZhD
         cKLucJ4n6BhO38pvhiD4eOd3Chx0xa3azmKj4ykhpFqO7t1TL+WjiyKdOlW7joDCfJbN
         E6Wg==
X-Forwarded-Encrypted: i=1; AKwUvByf2rRM5fUNfdRoeUwS+uIGqK1gE+L3+6XT4RaE7DJ7ol1OPEyulUuXTW2lP9dgt+1YZVq71FrwPt0CM+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ks3yF6ceUdOJS14i86kruTZIu2xpasD4ozQ3LnWvd2P/nVepxE
	JqZRKrewztIW9P+xRacZyOcC3NEpBSuBWg1vVzsPqXOaKwVkApFLenvn
X-Gm-Gg: AYBFou3He1vF8zkxKinrv8TEAsykdG27mNmBXG9lXS6agUoO+nrlaTpgWj1Vlo2mgjP
	l96o51HWWwuXgqo1Z9jDPldXPLESQ0hXpE8P7XYjETcvL8ai29waFK27DU9ekJnzMnlvXy/qD95
	xzTh0xFvi45NHUgzggYH1NHsbBREBYnecYtr9Iyln/qg8IY15ypPvW0v/k1qweUt36LjJZwsn8y
	J+6cQ0Rf1AVT5pLMiUFJ7b6PxVY+2spDM358+ZOWtnxxCPJfvZUg7Gzf81BIzxMl0our5EDGeDP
	S7xjKmD/AbIq7iKvrw3Hy9+lir0ckL0L/5PbHWOWB1N6vctD/LBdXgokMLZy527mGrm/1mvVazL
	GErPkZWCsyoKjk18Ehtq/sIT2eBqXqr61Cq+4VYqGSjrVeCdYxLSb23XVT/DQOgva3hWqToMAqz
	WCezF8w0xjdCXgCUDtDpGn3g9ClEZ0QirOPmp9JX3aCAJIQaEhTHvdO0i8J41ZYi/VGUTKIeVrM
	10+AI+CTZDqvMRF7F3tiLI=
X-Received: by 2002:a17:902:e803:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2ddb1b7a160mr42116225ad.3.1789730336227;
        Fri, 18 Sep 2026 04:18:56 -0700 (PDT)
Received: from csl-conti-dell7859.ntu.edu.sg ([155.69.199.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75c1f25sm5984955ad.68.2026.09.18.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:18:55 -0700 (PDT)
From: MarkLee131 <kaixuanli0131@gmail.com>
X-Google-Original-From: MarkLee131 <kaixuan.li@ntu.edu.sg>
To: linux-ext4@vger.kernel.org
Cc: Kaixuan Li <kaixuanli0131@gmail.com>,
	Andreas Dilger <adilger@dilger.ca>,
	"Theodore Ts'o" <tytso@mit.edu>,
	Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ext4: don't read past the UAPI struct in GROUP_ADD
Date: Fri, 18 Sep 2026 19:17:42 +0800
Message-Id: <20260918111742.827428-1-kaixuan.li@ntu.edu.sg>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917151441.413135-1-kaixuan.li@ntu.edu.sg>
References: <20260917151441.413135-1-kaixuan.li@ntu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaixuan Li <kaixuanli0131@gmail.com>

EXT4_IOC_GROUP_ADD casts the user pointer to struct ext4_new_group_input,
its UAPI type, but sizes the copy by struct ext4_new_group_data, the
internal type:

	struct ext4_new_group_data input;

	if (copy_from_user(&input, (struct ext4_new_group_input __user *)arg,
			sizeof(input)))

The UAPI struct is 40 bytes, the internal one 48.  A caller that follows
the UAPI and allocates 40 bytes gets 8 bytes read past its object, and the
ioctl returns EFAULT when those bytes are unmapped.  The two structs have
differed in size for as long as I can see back -- v6.12.9, v7.2.4 and
current master all have 40 against 48 -- so the copy has been over-reading
the UAPI object throughout.

The first 40 bytes of the two structs have identical layout, so copying
that much fills every field the UAPI defines.  Zero the rest:
free_clusters_count is overwritten by verify_group_input() anyway, and
mdata_blocks is read only by ext4_resize_fs(), which builds its own
group_data array.

Reproducible on v6.12.9 and v7.2.4 by placing a 40-byte struct at the end
of a mapped page whose successor is unmapped: the ioctl returns EFAULT.

Signed-off-by: Kaixuan Li <kaixuanli0131@gmail.com>
---
v2: done the way you suggested -- one struct on the stack, one copy, and a
memset of the tail, rather than v1's second struct and six field
assignments.  The only change from your sketch is the cast in the memset
address: &input is a struct ext4_new_group_data *, so &input +
sizeof(*uinput) would advance by 40 * 48 bytes.

Built fs/ext4/ioctl.o warning-free with W=1 on x86_64 (clang 21), and
checkpatch-clean.  The EFAULT reproducer behaves as before on v6.12.9 and
v7.2.4; the fix itself was not runtime-tested.

 fs/ext4/ioctl.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -1674,12 +1674,15 @@
 	}
 
 	case EXT4_IOC_GROUP_ADD: {
+		struct ext4_new_group_input __user *uinput = (void __user *)arg;
 		struct ext4_new_group_data input;
 
-		if (copy_from_user(&input, (struct ext4_new_group_input __user *)arg,
-				sizeof(input)))
+		if (copy_from_user(&input, uinput, sizeof(*uinput)))
 			return -EFAULT;
 
+		memset((char *)&input + sizeof(*uinput), 0,
+		       sizeof(input) - sizeof(*uinput));
+
 		return ext4_ioctl_group_add(filp, &input);
 	}
 
