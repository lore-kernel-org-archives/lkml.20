Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A01F422E2E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378505; cv=none; b=AkOnl/+Csa2xntpt/zzpIzMKoHJmOD4UiDxXaqyytJwwGX8TTeN0nhKvEW+ZGL2TB71ylvyB6PUFuUIp/FEDGUQnTXvcXrKYtJyC3FfL1VsjiEjcS+oyQeL48CzVogS/wY39iUZKmQ+pvVdXAb2z4dXzm+0gubloTbdElLR2e1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378505; c=relaxed/simple;
	bh=RWixKcQI2wmaygQZobVDeYA2rMusdPg2Sj3o1m1LYFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9+C6UURi201xCLoc2xRXo8IaeZVu4qr4J+jnLGsMy4DOibkcMwy/6MNzvUYeRY4u7sqxL8WnSOy7UPgerxpCZWAMMzbDdqSwXjiV0dwR+vUUBqIyEZxpHpw6UGPoi6E8fjpkhQFp/rzbxNuxzMsu75ly3JsTRzzQBp1Ipqttkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YED872fg; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YED872fg"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so1312666a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378504; x=1789983304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6IuVmpr5xM+RRdI6lEpXivXGb0nbPt12Ew5SJP1A+U=;
        b=YED872fg8vrTMmOVUyr4JuDCYViET+rLqWFovHJMHcqBEooxh5tMdIPXEZi2lw6hj5
         vBDVfKpnvQUOjKR/TFuPj8H/l3e/tmeHrqRJBRBNgOEZ/7c9fQaB/9X4/XjPzdVqXRUv
         uR0veKVwC8EQQ8bcZ9T16rIr018vxQjOvyJn5GbgnMP/9T50x1Y79U1Je6I1OhcphyOf
         IbgM/9UuEsOHgKy35MxVvOuThodPQPlF1x6LGb26mLp55R/cNmFNoSdAndTejZVlZu5O
         YDPMNgFBVB2md8IO8Sdsad2lrfTFZPjtN736wGtj/dykzsEtn+jk/bCghnvfGI+LUKZQ
         hsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378504; x=1789983304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6IuVmpr5xM+RRdI6lEpXivXGb0nbPt12Ew5SJP1A+U=;
        b=fMgkPfisytV34HTsIPqS4XdMs8X44RdfGOnADNEg9LqU0Dz5bIAqp78OybEmzhK8x+
         RIs9ztW+JwQNvh4kKygzh4jaupEYzKuHQkeh/KUqUSJnbRWe2XRq/+CHfJhUHV7t03Z6
         0CCXEwHdcHDF7x3ZmhKX8QVpH8RESnAxUUtOo0HNjIFP14T8RMw2BBlf6vewO29C1gtw
         djEAwIPtyr/f5jyku70WqtcMy0JOxquS8gOGyMLgmS8M+/D7F6zrpYVHLhJCpnO5ac5k
         mxinMsL1z2HUiZ4ubap9yaBGAurnmROymYajBRJk+lsWIcwdbFSZah4dAm729AiMCLZi
         qTkw==
X-Forwarded-Encrypted: i=1; AKwUvBzPDgNdt4u0ioeXRI3Ata5n/9yZILZ5746IJ+Upa427poc5D1M0priX5QZtVzVop3+NjBCAKvYxV4MlkUY=@vger.kernel.org
X-Gm-Message-State: AFuF++lCDSaQse+uvQcZnsxXLYIrDfcb4QIM1pJ2DvlaDB4M/iup62ND
	Ugi58JRLKGodFOPRB6hGKorIcGOihsGo+09fundpnCnJm2+fFqnjBhTc
X-Gm-Gg: AYBFou3j/btUoZdg9GLYD1vi4iUUyEswzy2WPitVx+oyHiBR+jf2/XW5HViumfejOTF
	c+LJIYuZO7N1munxf5Lj+mw+aZvISayFuhKt5AEnMeH7q/Dg81tY5oc8m2AaXOeqinutODApt+U
	h7HIQHDwi5DtAKRuFh5ZVU/Tq89A8s3Tfoy6y1xq3UDwEk2onN9OyjMz51YFZmzJqsOc2j7Gp7y
	B8HHyDX2ARb7kXlF3iPQpPGlRDsTfecGBN0VoNpfShVqAaPlFjC+KMud/iJvuwauNSD02esajBq
	QL113x1xyjh/IK2CziaLivJgfPFu47ArcnqXITVxy3Ozbg2Juu99iXNseOpKMtFS5kzY12Azu39
	5eHJcuoAqmVl3Jnaso/v9ldD1gMUqOJHW9Qx05ioLeQngM5Nq9MmiUGUC7p+ADwq3UEGUwngZ4c
	TPh78f+tRVCFzFSWDcDpgXlIsqZaM1Vwa6EwSrAt3RB+pmtpd/sYXcAq1I5s0pL2RJjnApvGxa3
	rxE+3c96eXTydNC+Q==
X-Received: by 2002:a17:903:388d:b0:2dd:143:d5 with SMTP id d9443c01a7336-2dd6c75a396mr43870995ad.22.1789378503638;
        Mon, 14 Sep 2026 02:35:03 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm46109865ad.48.2026.09.14.02.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:35:03 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org
Cc: josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 4/5] selftests/rcutorture: Fix double nerrs count in srcu_lockdep.sh
Date: Mon, 14 Sep 2026 17:34:18 +0800
Message-ID: <20260914093419.1474829-5-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914093419.1474829-1-kunwu.chan@gmail.com>
References: <20260914093419.1474829-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_PROVE_LOCKING is missing, the deadlock-detection loop
and the mixed-SRCU-readers section each increment nerrs once in
the configuration check and again in the common error path,
counting the same error twice.

Remove the stray increments so that each error advances nerrs
by one.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh b/tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh
index 72791499dd96..3acaffe52c78 100755
--- a/tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh
+++ b/tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh
@@ -56,7 +56,6 @@ do
 			if ! grep -q '^CONFIG_PROVE_LOCKING=y' .config
 			then
 				echo "rcu_torture_init_srcu_lockdep:Error: CONFIG_PROVE_LOCKING disabled in rcutorture SRCU-P scenario"
-				nerrs=$((nerrs+1))
 				err=1
 			fi
 			if test "$d" -ne 0 && test "$ret" -eq 0
@@ -126,7 +125,6 @@ do
 	if ! grep -q '^CONFIG_PROVE_LOCKING=y' .config
 	then
 		echo "rcu_torture_init_srcu_lockdep:Error: CONFIG_PROVE_LOCKING disabled in rcutorture SRCU-P scenario"
-		nerrs=$((nerrs+1))
 		err=1
 	fi
 	if test "$val" = 0xf && test "$ret" -eq 0
-- 
2.43.0

