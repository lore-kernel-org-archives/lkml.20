Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1354A4EF9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461924; cv=none; b=HfJSi1BBYQZJDlSfSP2o/x69a+nREHXpfnJQs6U4EwwLRPBbb/SzXIvw4MGgzGGoSK5SEHJDhhHOrEn5X5wMRim0TPU0ISbOQCx6inwI/1HHXMtI/0peIMMaH4mt5CePhmxHXaxisLGnFdyVD67af6X7KXXTNsznFTBvtZb8AUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461924; c=relaxed/simple;
	bh=5jR6uLg5qSyjz7iwOFenidaDwI5Joosb9JoiDSQKByM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzu9WzJsVP0o198bJuKu58lJo0LjzpVrzR97R88sAVVJK5fuv1iYS0Rx22Fo2H1k4FbjTrMr9qwJDXWZeMgOFK8vCHYlmhkh/irOxxFdgCP/DAq7G8MyqAi3iRNdd6lTn9Nn6Ag1fIGMAmbt1nfC15Xee10v81tYgNYvOUF5pKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2JQstBE; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2JQstBE"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86efece610cso19264b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461923; x=1790066723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQVlFvmZNrWyCQ+kgiBgD6UinTWUtjS83tIH+0aoFT0=;
        b=K2JQstBEBvLbiyDdetTo0gpCgE+4J14SWRf/6mgYrYuJLbLhuGlLK0Jx32Ef4BBF4u
         PaccZexu7qG4RugE7cafoocOtuH77Lb6VRjS2cqRG+YPlYnXi71qXulWCy90vfHlVVmC
         tYIL0rC1rH4z9btZeEda9ksEmkKKlCWG56iuTxr7reBpvoCOK1tiyMuZGraU0DDmKFan
         H0a6BMHKO/CviiZFZvp5izdwQQRnsC6fkXl55ON75gx67Ck06bbzAWTHyzW6te1KY1CV
         ZOvZFwlpOGedJdIQnkKLPQkO6J7e+2vAw8SVnZ4soBNo39nWelWiB6gfkgaTvBcqHF6v
         XPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461923; x=1790066723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dQVlFvmZNrWyCQ+kgiBgD6UinTWUtjS83tIH+0aoFT0=;
        b=2DPWR+/kwrKMRmYSWxCyLNwENCBGkvHCDv76YPTGBY2e93ZiyCVCBCHTZ0WZ47351G
         WwkGmhk42un86CGAXC+6l+41oLhkEq2QL+TwtTuQyulGhNSaf02yX4FWOYWQWHOyn1SS
         dMlnwjKml997pzlLn/6kubvdWKeh++i3vaF6VcsCmpT9ff/2XyWoIz/N+uRmYoqtREYc
         00EVabNh0O1F16wmUR9y7JbxJ36rqyDRGChMvbhkScMGr/f4MgWlcT+fAhFxhUw4rlJj
         ForwvLLnoxrgfYsD9Gcv5Ubdrf4c8NxDgsTQFViPmiMnnkyAJHyrksSiEYEZB5y+eUPc
         9b3A==
X-Forwarded-Encrypted: i=1; AKwUvBzSJ20h0igauqQTgQ3AAC0ws7dzPsLOiquWipVQ++ELUurYPz/NJO2DjX+BnubcFapwCXtVEQopJRFuwac=@vger.kernel.org
X-Gm-Message-State: AFuF++mplW8VOvUh/sDRMYVc7Dxtm+hKijZIK7Rw5j5huc3a6FeaH6CA
	ZFH9gTrRgGBsqtp8KR7dPxANJtNd+QObZ0gRf8Mm87t2eKvdpQVyRxtAGzg8w3BI
X-Gm-Gg: AYBFou353TJ5K9iIahFSzZVKy+0NJdciHUU1HsirxgWARaNcqPMd6La6ijU/n7KHB2o
	S8CxxrI9RHCh++3Wmdv/zdjplGNyYr0hSyOo4oejK3zStjw2VUmmHt4SNpGC6VyXcrLa19el7WR
	xYMXAu0o1RxSOp6j204O7DQaW7ordgGV9LaY5QRnsu7sT6xvutJZaRC3xppRDd72g5qnAllbigV
	Omf9O8Br+sHFpnVzzgLz9UbJlnA8fJZqajhKleYtCHFWDhtoTJUwNulCXQLHiS0rxSzRxRiQAta
	Kcs1/kDsrtzhC7yNcWUN9XfmNTH4qcLAz+ngSfKH5WOSbVtsCrwh0cIAfxvCKIvZMivQPeMFAEZ
	ds1e4eD1CfYIg1KVFNtmoVM8SVPsF+eYrBOgjc80/ByMQoPu9t7r/l1SWhHNeUCbhLvATBxQoTj
	MrOQDn+jvLjbHPOhjmn+wzvZo8HigN5Yarf10KdsIVggRDUDt1P/7cAZFQ4XxSVzesJ2JjPdgaV
	G+JapxRYwOCX6pkwKOOUuuNjw==
X-Received: by 2002:a05:6a21:7007:b0:3d3:af85:eb99 with SMTP id adf61e73a8af0-3dd52933947mr467810637.27.1789461922896;
        Tue, 15 Sep 2026 01:45:22 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 19/23] ALSA: riptide: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:20 +0530
Message-ID: <20260915084424.1007757-20-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/riptide/riptide.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 99c00e46ce23..697fece744e7 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -264,7 +264,7 @@ MODULE_PARM_DESC(opl3_port, "OPL3 port # for Riptide driver.");
 #define SEND_SI2S(p,b)             sendcmd(p,PARM,SI2S,WORD2(b),RET(0))
 
 #define EOB_STATUS         0x80000000	/* status flags : block boundary */
-#define EOS_STATUS         0x40000000	/*              : stoppped */
+#define EOS_STATUS         0x40000000	/*              : stopped */
 #define EOC_STATUS         0x20000000	/*              : stream end */
 #define ERR_STATUS         0x10000000
 #define EMPTY_STATUS       0x08000000
@@ -453,7 +453,7 @@ struct snd_riptide {
 	int in_suspend;
 };
 
-struct sgd {			/* scatter gather desriptor */
+struct sgd {			/* scatter gather descriptor */
 	__le32 dwNextLink;
 	__le32 dwSegPtrPhys;
 	__le32 dwSegLen;
-- 
2.48.1

