Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502011;
	b=c3vPdCcWMtXMAEISErRxVbvWwmHj7lWVW0AKG+29Gzsg4Plt3H8Dg6uHzGEL9011VvoU
	 9dxHthd1WL+zpA02qDwLIy2rfhNKOulb1ChDcxEqbfBZ1ToeUju1nIo4MPjdDgRwixjRc
	 8emj3a+zMWfph919eL3dCj4Igy26HllIpcVVu1y1gWYTym30iGG9oD1zJgRrJeLY+tpJD
	 QOwTtpqfSYWhxxtfnoFxbXvAvJ4T465Npz2KAl9wV1KutAfoSoJlyzce51Leg0U0/158j
	 18RDNxV63ghUoqPvjsEr06n8TYVpCJYU76bly4ZydWCpTaS16nvBWw+Rz0GbdkEa0ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g6TNiVcn3fRI2oblLujq2Nnd5PgQ8zplDSl3IU66bRc=;
	b=A1AAjjB1mtyMY7rxtczeb0mMPmP2mHsl0g4u8zUPJx0HHN8rKaNQaBcFwQ7mdmWQVdAK
	 ggqhAx9psUnRRQYkLShtQuIXUo8B3Oa4DxrgSIfH8gkTqfRj2U4vPBcJofueTSFx/4Lmd
	 1Jv29+7Okky5SiN48tgJz6NT5xBNF5S8HRrAsjBLZY3ihWmaw6DRZxaCo+axX+CVRIvA3
	 iLeQKmTqRhm6WgFlQvbinPNKnDPvX067ZaFK+RyVXfmZPJOPP69ZjJDevuaAIPTYftdhW
	 nb2PlFIcZRp99w/LNhkfp/aOui21dY2BKmFgPfT07BQN4R45gmoGDJAUCvCFhdik89g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qovwseVM;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6B60A2631
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF6B60A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qovwseVM
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2761c69fbso8022800c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502010; x=1795106810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6TNiVcn3fRI2oblLujq2Nnd5PgQ8zplDSl3IU66bRc=;
        b=qovwseVMh0eea2nriAw1zGMkHfB2HG0lh9EmNaIy6LpK8BDrMkQciN3/13P6b5trO2
         Lqbd7QkRbfTePuohqZQomcjeK9+2Nu1hveG8plyDf7/KVW9xjL7ETJXOe7o59G9O5non
         fRrm0FG4HSMaiGxiuAAR3FkpLBvmhFHcANCseAB+8QvifSNr5YLcx8hq8pMWpDB1rcJ9
         CZ0Xkq67zILT3Mzzw6GRYSOMChSBjivMyss0/MJjTOp7VMOGkmWHLa3K8BLJvBmnGFSH
         GfkacaDvalGW32qjIjNLHWVolsb6T7LSMRcYdVmXNDx1zoj2w6+uJvT/+m6+Mz7Bpehh
         xy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502010; x=1795106810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6TNiVcn3fRI2oblLujq2Nnd5PgQ8zplDSl3IU66bRc=;
        b=lydQL4ec0mUGcZV4G4vppOkRaIJoRaz87DU//ciHQcKhwFRpXgV/efaU4+Y+GSIEfm
         8DuQEUK81aDs9SEWIbwc1TENu/AUUWmZBTO3mwMOjTXye2WF3f2f3w/RxtmG+N2+RPTV
         Ufk7R+ZuS3pHrQ4GC6uMbo3pePp6+yecTv9u3ozgSIL4QdZzjDV0pXrkxnXda5jfqIe4
         0FOarlAUZbbgZWRSmQfWQltHOleDPfeT0A5F/dZy3UTSw0DvxSDqOQKTlencHIoqOXvz
         nb9ynIz0Gvyrcn6sfycmLeW507kqNsWctwtrKDYjV66+2E9YOR0QkD1kcLKETiqG3L8B
         GsWw==
X-Forwarded-Encrypted: i=1; AL+hErHOG8DjVIR3NbqXzWdntdDTkL1HIWv5bDeDoOJiyvfz8/2g+i8doUD7T1cz95+EnhlDWaTS0g3igqipdPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DyTScVU3R89nuVVD20aXh6f1hFhFfY34IN/O/ETphdoybmVys
	VQ+hHGyNDTNFUnSgP8ZHvnWUru31OWxLTiK5Pq2xnxaxA0cPaplKXEnT
X-Gm-Gg: AYBFou1/eEm7saTCOeU8WgtECKAtzV2C01G+k8A/aVKMtxyuWkx4sfCFidNMRqjqRsZ
	DRHDnQVQXl+bDf9zlNEj/hrgFpIT1/mvfD1O6q77qbzWWjbK7PpNrXhUKk9DiSJOiJw5n4kd/TS
	kifarQsFlD8jMWuIyop8RoapUqPKR75ldcB7mx/PvNeYL8r3WBFFSxYaC1kp16viKuiTbKJmf7D
	lPbNC3HHUK0PVEliZpO5JttJJc80bDyGPW/D4xvSLAFhz3tu8P9J/RJpoJgNVjJT79LOcQ/0Sw7
	xv9gSSvu0H1R3tpn6evKccyaMG5qBR8o95fvSM44aYmeU0US9oJOQMQG5nYCHMU6EnWuq2aT+VE
	RmJa9pxfYR5jXIHiMV91Y5Wxek3gIuPuQ1AJEH8fp77BAsdllLkTI6E/GNdWzLICO2rZiQU+45R
	sZwG9Ve+mTki8ND+Xch1/dlAYGE0GSnhSSJJG/Vz5DsmGt+WQoabxtfrziQNpqZydb7WsmGXcem
	MBBEH3mPk8UdaHuj71Ifbx+6nRhDRJBa+aqZfCdzckuzaWRjc6Ireh7vgsLxx8ljGzfTl8LnAXs
	kXOl5lkEK5t6CJNno3CCXOevIS3ZuShZRjuQz3vp+px6LQrCo/xtIcIfyxk8O7iGzG1uD8hFmft
	rhRhodDDchhvHmJPDDkwthU24dBEit1xWtWGhurMNC8dQ
X-Received: by 2002:a05:701b:4213:20b0:1ac:9da7:e86e with SMTP id a92af1059eb24-1b503191ff3mr100573c88.30.1794502009885;
        Thu, 12 Nov 2026 08:46:49 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:49 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 6/7] wifi: rt2800: support A-MSDU in A-MPDU
Date: Fri, 13 Nov 2026 00:45:40 +0800
Message-ID: <20261112164544.3176458-7-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112164544.3176458-1-hjf3108@gmail.com>
References: <20261112164544.3176458-1-hjf3108@gmail.com>
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

Set SUPPORTS_AMSDU_IN_AMPDU, which can increase throughput.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index 269d621f51..ac62b56280 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -11838,6 +11838,7 @@ static int rt2800_probe_hw_mode(struct rt2x00_dev *rt2x00dev)
 	ieee80211_hw_set(rt2x00dev->hw, SIGNAL_DBM);
 	ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_PS);
 	ieee80211_hw_set(rt2x00dev->hw, TX_STATUS_NO_AMPDU_LEN);
+	ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_AMSDU_IN_AMPDU);
 
 	/*
 	 * Don't set IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING for USB devices
-- 
2.53.0

