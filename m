Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9581B53A8BD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881222; cv=none; b=Y6Cz+mIgOiDsbRCrFbFT/WM/BW1NDPfxI70VyQHpmoLVHdJynn/eSpqJe6FBn1y7VQZwuPwYHMXjrUE14lWJEL/BfIKAa62uApKloovxJDigx4RTIC2T60PlIeK1slEeRxZCt0ZR+W9YtzQiHmArH4faIdcsKZgQld54nsZtSCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881222; c=relaxed/simple;
	bh=RVochWi1fW+MMf+h/8ym7cr0FagOTLPCgc18rog4v4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OJPu6Gaa5HAjJj3M5cuPSY1ecAbVsirXybkAFahwHOjwTbxKEG0ipS3WL3Szc0sUjFVf+adn7w6BwAclfhnyh8gIJPeAqUaVpk7jTB+LqaXiQOEDa/8bHueK8zCyv8ONShmi13SMCBkd8McwfdM8FDbSu66DSW7sjyxXfay5Cg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPnU7NhG; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPnU7NhG"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so43551231fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788881212; x=1789486012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZ10AumeYeSSsmJsJFaCl8FgVIUzu68KYFIXrl2PZu0=;
        b=PPnU7NhGZwp0DYsxlQMqgxNQy32V0gwvBdRBc6a8Nx3cLQTiXGaMnpY2dNjmiKB7IV
         N4w7bb2ADNmU0RWlXFFRysYqyW/ZjZDk4RDX0Z+1jFlq0YX4u3tbDh6OTde7UqVERJRD
         9RTe++ZkVXmiieaUJ0pFtmYymeknbWIg+EBzLr/FOKKDr3zF0toCj8Xe5pNubi+A8Ixg
         TQPzo+btaevnDc2t/wPG78tPp0HayF7oEE4dHuVhmlEaFQIqrF/2hxP2Vfheje206nLt
         XFsRF2VgWZSMR2o7UxheUT7saHo8/o8pYR8M5UTpkU2sBJAc2DEH7XXFDf4jK0Wy5sJX
         jTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881212; x=1789486012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZ10AumeYeSSsmJsJFaCl8FgVIUzu68KYFIXrl2PZu0=;
        b=Ktt17AtsS1iDYgaqjUGhS5H/KFs8n5tC0nPxkLQMlyWWSeVIit1KR8vroeG0dXuh0c
         PUy4pUv073J72I6624Nsi0cWoHGSaYmUfMywCBU80wvGl0YMWa57T5X798gT46RlZS1D
         92BV11cVhTkUUIFV5arhvAMvmoBKvoZ55vmuuWdcV553Tsdbcyhjqy3LPFpLjrKI3byR
         HSxkgtrRNbzL3mFkE5VyFTNyE1Js98jbCMiIB4X2Cydvw5/NIdS7FYpvO64BSkpOU5Vm
         7ovP4bSO4BuaxnU3kcE4SW2eTJ2mw1MGhg8YOcFKL+39Qil5nELTN49j7coMxX0kVzIg
         tpRQ==
X-Forwarded-Encrypted: i=1; AKwUvByeKoyimuSCi7Y0Xax0gZ+L/A6/x7cb+n1IvvdCkrsZfXvBOLb+8lCSRXzbkjseBSmSYFokaifAwOcwDDM=@vger.kernel.org
X-Gm-Message-State: AFuF++msXl8jnZIsGtwRiykyMMrGbVDANEL/lU5RNyUqcjhdIuVMVFjm
	6qQ4cURvBtehxvBEA3jaJe7nMzUI+RVD03siMWKC9HHrAqAS5chgB6ih
X-Gm-Gg: AYBFou1c1S72BIgYyKXekNa1BpDvgVAyYq1NESmIZPhcsFKrBtqA+y0NEtAKoBptDeJ
	d5+pfd9yXIF/lX8k4ji2XYHmCErnm0d+81PmOOTW0mTwmzqWwbrFA7yK0xwwDnxjtQiz3RDz4So
	IJYSjWWKkR+Tfhr9mPnXC20Zhk/wgGKTIfnU1uEqOcFKz8RzCNCEXTQKLpx1B4rmlyqnVZ9ULtk
	Vvy/Cz5F1XRd2V+aIQcVE9hpPOuSg5AU96APm85uMPZ3UdAIyeZbfedkpbTaUAKcfW275dooqq3
	jnpC4YGDt5y3UXJdIv+bGll4ojmtm8Pk8vAKOF8rymkkFp3fJnW1vlidezB3N8vF873Vu1FSBml
	7/lLpTa4uoe7OiFBlIVDuvhI+MrjvKtu3g9Fi7g5hVSfZ20QjHgDJ0iwi0S5w8eKnY0QaudoMV7
	KIYeARQkSrynH2RPmQ+FROvYCAiOcxFdYM1aOr0t0ARTVt/4G8KIiN0FUEdCLc5wcP4/U=
X-Received: by 2002:a05:6512:2c04:b0:5b6:1a81:1c8d with SMTP id 2adb3069b0e04-5b61a811f6cmr5021576e87.66.1788881211560;
        Tue, 08 Sep 2026 08:26:51 -0700 (PDT)
Received: from grower.uveon.ru ([185.32.132.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed098sm3116119e87.22.2026.09.08.08.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:26:51 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	lvc-project@linuxtesting.org,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Deepakkumar Karn <dkarn@redhat.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH 6.12/6.18] afs: Fix leak of ungot volume
Date: Tue,  8 Sep 2026 18:26:27 +0300
Message-ID: <20260908152628.200856-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Howells <dhowells@redhat.com>

commit d672c276f685a540ed2b2a8bafaed4650a89022c upstream.

Fix afs_lookup_volume_rcu() so that it doesn't leak a dying volume if
afs_try_get_volume() fails.

Fixes: 32222f09782f ("afs: Apply server breaks to mmap'd files in the call processor")
Closes: https://sashiko.dev/#/patchset/20260609081738.770127-1-dhowells%40redhat.com
Signed-off-by: David Howells <dhowells@redhat.com>
Link: https://patch.msgid.link/20260622090856.2746629-17-dhowells@redhat.com
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Deepakkumar Karn <dkarn@redhat.com>
cc: linux-afs@lists.infradead.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2026-80878
 fs/afs/callback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/afs/callback.c b/fs/afs/callback.c
index 0a09a9ca3c6b..652c4301d56e 100644
--- a/fs/afs/callback.c
+++ b/fs/afs/callback.c
@@ -138,6 +138,7 @@ static struct afs_volume *afs_lookup_volume_rcu(struct afs_cell *cell,
 
 		if (volume && afs_try_get_volume(volume, afs_volume_trace_get_callback))
 			break;
+		volume = NULL;
 		if (!need_seqretry(&cell->volume_lock, seq))
 			break;
 	}
-- 
2.43.0

