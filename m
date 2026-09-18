Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E554E2F1A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739376; cv=none; b=SyBjqlzS/J8o47ZXHJXuk4NmsyniDHkRxcMrGV57PIkp1Ept33QfCt3F6RzQHceijhaVWwNaSxNNhG/EBICrLiyNbBz9twEMIxfCl09QECg6S/wUGzk4XQj3D5OQ11yZW2hPaC+JULEu9GzplErIRgtzsIFU0sW0mGmCtFL9uNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739376; c=relaxed/simple;
	bh=Ep+wq/i2umiA8YS7Pl1zPbiNgVmnMR53naO/aGKJnfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YROlzbuBcUQw4+vhHuXYAQ+qXR5jZkfmXvDOAo28ByGEB0ZscfBDSvdGztT9RfZPV+GDlkfPpWCgAk1VkrrgyEerKLZP2KIKmCAchuUoHKZaWZ5JT3eDFsIDcdw6IAifO5d2ruk9ZLODILHjtYqwaVthz7Ru6SbujQlA9Nrva0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHTR+nNn; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHTR+nNn"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e211a3so682242b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789739374; x=1790344174; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FZ2x5YA1Wkn+XLaTMl1C5PiwQkP5R3MNLqBp+wmPsGk=;
        b=dHTR+nNnvAj0ZAW1rFW/ydcNrcY/lehNv6RPuL0etSjAiewifT6Oyh+vEVj+ctkwRm
         0iLCr5H+j1zj3p4EPRcEUvGh2bQbS7dZKSJTHtRgnoTFd13dbjyK8g6mnOfeCbdl5HCH
         D8zWjgMHagCOuxt6Pxlal48PBlV2gL3d+tbSbNLN0ir48NzKC1E5sOXkOd4EQxITV0fe
         pbsVvB+3tKBfyaxZy2JeFscNlkuj4PoayAQdoH3qI/pkVllPNIrBtA6nN50OeUUDGpTj
         xOi6A1fTSJQx/Ltih73tOvKHRQOzCBJ11kwAvyMZD55LmN8oe5TeYvrtIF5mWfGZXDzo
         qbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739374; x=1790344174;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FZ2x5YA1Wkn+XLaTMl1C5PiwQkP5R3MNLqBp+wmPsGk=;
        b=lEF5A6b7cRAwodo5TRFyE+51LQ71AcNSPNtJDdNMC3sRCgR5DyPo6Fvmsk0Q5fOK6K
         7wRSH1AJS/j1GjHREXRdehsKV/BXcnKlYvE/6/dlcGPQ9Xa9KF1Gad1BKkXMyKBsgZco
         AtxoVav6kogn/0+nkl4dQZ3kZpftrXY4QUvAesZlcKNH4LGmLPpKfFUxPIEHIrwnRHdD
         iNIK3MJ6ah/XYcnwvE7kuxo3iZ1Y/TF3KyI3oSczHDUGd2trfVKb0CktVivEBVuFZxut
         S8f1qPsHQ+lFIYAu4FHFsS8rRFZNvKep9H+g7ziXlvuwfp/iDoO/QyiIbxP/YciS1arR
         5R1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZ/QgCDdfnNfX74y87cxJ2ju9KebOli1XTerYaLb4ygMmwSAGYw4Up6KJpCoSHr6KI3chLGbyVKRYvVv0=@vger.kernel.org
X-Gm-Message-State: AFuF++moZpLi5B4Dk9WfAXc/jkgHC1ZsZJbm2lf4OQsPe+7X65nvEucQ
	O2LeDV0DF+j8vDG5hoTMYXwsoXTVsDuzK3iSSMSe5STbfjP216Uex7Km
X-Gm-Gg: AYBFou2++fGwJD0t6LcuyS8pTHts1G1w6CzNIKdVMzDGen0VTqgIcG5CYu6qvr272Di
	tIflQEYf7AxF0HoxO2LdviJ+GFrmzy91xv/B6L03KCNljaiEMOhv+E9aV3BiUu51ssSW2xBvY8R
	npkyCm494/5Pb/P0OBks0JwfbTuzoyKVU945TAEg05ZJ1K9EuL+bAsOnZC03IuSeniuIIIzepUy
	gvhNmRLNWU1yplF8kp2gLX8yAPS0yIVn+Gn+2ewukrhqE3jX12LqKpxHWMEv1mjBzG4dkWJM576
	lc4TRf+ULQL/2QhbBDZiIvkCKvf+omN7kPAa9D2mjhTFXyse+nmp7BgsrMacdVC9sC+M4A68enm
	BT9zH+/HSemQLwvcYVcuDKs/oYcl2YbNoUwRqDbvN7JXJ9B/tqyALQNc9Tanh5sZqkP1SZxneat
	eZO+M4BMIf5dSWJn/biShutRBik7MtLcT2DUyiy01fM3W9JYK/PsozeQmFLx+xAa7+wkbsPA6kP
	eibrkir8Q==
X-Received: by 2002:a05:6a00:2d26:b0:857:72f8:dc99 with SMTP id d2e1a72fcca58-874dddfd214mr5511344b3a.26.1789739373932;
        Fri, 18 Sep 2026 06:49:33 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875cf12d57bsm888878b3a.1.2026.09.18.06.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:49:33 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Fri, 18 Sep 2026 22:49:30 +0900
Subject: [PATCH net] selftests: net: fix CONFIG_SYSCTL sort order in
 configs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-selftests-net-config-sort-v1-1-968ea6e8c1b7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGpBrWoC/yWM0QrCMBAEf6XcswdNLGr9FemDJpt6IonkThFK/
 92oj7PszEKKKlA6dgtVvESl5AZu01G4nvMMltiYfO93/egOrLgng5pyhnEoOcnMWqrxEN0W0aV
 h9Htq/qMiyfvXPlE70/Qf9Xm5Idi3Suv6AeYWqSyCAAAA
X-Change-ID: 20260918-selftests-net-config-sort-4d13ed1f4927
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Joel Granados <joel.granados@kernel.org>, 
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=Ep+wq/i2umiA8YS7Pl1zPbiNgVmnMR53naO/aGKJnfw=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqrUFr4VG06BZEuZlW16iTbpLGKfNzDeuCZJWZ8
 h0XS22oePeJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCaq1BawAKCRAq19F1Kl0b
 TbH3D/4vwDjKgb51jQAQukW1Lr1H3sYEgNU2J4cJ5vAJctFgsT8JFa3uwrQl9iMWVZJgLPtfyeX
 Co8L1xtmER6SdKxVhJaRQFbnI6plvU6ESGuthghGbw02CuSd+e8GmrplFDl6UL10bZLatncJF7M
 9NPAGQuaZP738D7UmRhzqlZCNjij7temifArHwwwkpobD9z1yqe9IuqUNlaNgzYW8J24GGlEQij
 RzYTaoOy/9rW5leTuMSc+N4rG1KM7YAADRbURMvhjNDsf4154KeYRwHHkDI7EpWbvo9gBw59ER6
 kxV+yodMa7NyXegA1gcsGjHO49e48ZalxKjjFYZnXFCe7ndcVCYoS3ImQSIIpUlSgJp3N1B/3tv
 eaksZQ7bUlzer483RJkc+Gsz5OklacaiiCzKC4zqBO8HIYeetpWrBbF/U3ZcXUPT+HKjO61cxHi
 5y7ymRKsFQxT96iLf2eN8z4zPAkdSVfC9DfRMb00z/7xGJexzrWBLUwD1Nh7MUzjpGqsx/Yb5UX
 4C0YR5kenl6Dxux7HP0UlxIwJ0U0paaquE8ImVCnPDXG6D5g1vgxPAqR08R5H9O0ot+GkvGEpqs
 G581Ei+zYX56lGE5N55pAQnpJ7gPdsqBcP4sQn0fcdu008iwVI1D6I2GC0NwsjIdd/MJFK6fQvv
 nThWWOF3UQOtDyw==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

Commit 8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors
CONFIG_SYSCTL") renamed CONFIG_PROC_SYSCTL to CONFIG_SYSCTL in place,
which left the entry out of alphabetical order in the net and
packetdrill configs. The netdev CI check for sorted selftest configs
now fails for every patch that touches either file.

Fixes: 8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL")
Assisted-by: LLM
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 tools/testing/selftests/net/config             | 2 +-
 tools/testing/selftests/net/packetdrill/config | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 30d5fcb09a83..737e7e6327b3 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -118,10 +118,10 @@ CONFIG_NFT_NAT=m
 CONFIG_NUMA=y
 CONFIG_OPENVSWITCH=m
 CONFIG_PAGE_POOL_STATS=y
-CONFIG_SYSCTL=y
 CONFIG_PSAMPLE=m
 CONFIG_RPS=y
 CONFIG_SYN_COOKIES=y
+CONFIG_SYSCTL=y
 CONFIG_SYSFS=y
 CONFIG_TAP=m
 CONFIG_TCP_CONG_DCTCP=y
diff --git a/tools/testing/selftests/net/packetdrill/config b/tools/testing/selftests/net/packetdrill/config
index 83dde525c53c..b7df8bf30920 100644
--- a/tools/testing/selftests/net/packetdrill/config
+++ b/tools/testing/selftests/net/packetdrill/config
@@ -4,8 +4,8 @@ CONFIG_IPV6=y
 CONFIG_NET_NS=y
 CONFIG_NET_SCH_FIFO=y
 CONFIG_NET_SCH_FQ=y
-CONFIG_SYSCTL=y
 CONFIG_SYN_COOKIES=y
+CONFIG_SYSCTL=y
 CONFIG_TCP_CONG_CUBIC=y
 CONFIG_TCP_MD5SIG=y
 CONFIG_TUN=y

---
base-commit: 46bc52d13594848023e681860df8700c8db14354
change-id: 20260918-selftests-net-config-sort-4d13ed1f4927

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

