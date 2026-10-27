Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092478;
	b=dwPmXnNlCtLXeFUsMEfNpDl13NUw9gN6/GGNnl5/NB3eTXAzbHpW1G1Ke9AL1bwbRVXY
	 /ELE/HA4pNMvFHPCQEuFc2EC2BTYf0Zcf6JZ1oy1frEgPXIOJhl7mRlLRDHmWnzbQrlBu
	 hB+wKOkyYENd13SlBvLnKWIWMnToe8g30wb/mXiSO3WUM/lfvza4X4+QPqIGcYCcqgxqM
	 8xe/AMuvWHyYe7TZRIjEmJKHq4P0M+nSY8+rWBAdy+PDRLaIkzEwMlqlhzygHWk69FYzm
	 ZsgPoHArnsoFG8Bop7q/SGprP81iPzTZ2VgetcPO/LCw8q0Psr/w3YzPNroMpe2Zu7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FdRV4XTc4pYPAaF+rtb7+DdwwT3YYcSdn8k9Rp0yoGA=;
	b=Cgdqp4OC06sbwwJC4ltol2PnyKhnBBZ4Kaw+3KbrbzuRe6810R0OBCQxA8/vS/tqFz8O
	 ib+PIKi/KJ/cz4Pf1X/zoeVS46PkcCh4ixpFShqmc5bjc1vACikd6WdsnNcoDFedKwVft
	 H2hhqiAQGjIEb0PPhNzA3KJNnz/YoVGFmufDRc+45Fqd/VpsyonJPeMCjf3xdfUTALEyr
	 d1IKbRG7J18oPAJgAUEdvRqR3IHowWcD7Q/Dj36X4fHPILsA+j/C6FXpAiF7Y5BI235cW
	 Y4z3HC/ZHrPXfYG2TbCssEpNdPTSlfg/4+xsRatsHS3wwVWi7cB6K9j2GPasAWffV+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="SWo3d/ti";
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CF0606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20CF0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SWo3d/ti
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35c95a3a303so420979eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793092477; x=1793697277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FdRV4XTc4pYPAaF+rtb7+DdwwT3YYcSdn8k9Rp0yoGA=;
        b=SWo3d/tiozvEWBBHsQ7PjMe5nNsCKGVdewvzmFzbZabM6YLj8YTmqP9+wG3BUJ580Z
         JtuEIRYCoWYMLee+a5RGLcXId7J5Rwr/3c0rE/9jWSnVpLrvZPHsJtL7jjncrCqX8Ht6
         vZQ+JTtUCJasd2M1gn5J6Rs21nRgeLyWYZOcVWqm8xGjeLhNVlBroctj3wlazd1AeV4c
         wCKrEwUSDC8wg3+1dmpu9+u3XCO0hAB5m60+ONDpjwNJqW6Zp3gKmE+lky6CgViDgn78
         JQQe5q0GReaENrS8iY/wuiBk0nAMb0sPrdxFrOnc7YTyhDc2wFwX8TQTZqwmjzIA5TT+
         uaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092477; x=1793697277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdRV4XTc4pYPAaF+rtb7+DdwwT3YYcSdn8k9Rp0yoGA=;
        b=pPp80wTTBxELZ1cItcwd/8n/Hip3Ed0mbEzwgiXhx6y0UVFjh5VWEwc5oOeLZKRNVv
         hrFYk6+UXYLFPNidc4mq6M+vfW1W2eR78u6DQri+o5S06yaNIGoa25B3LnRqviuXvMUS
         sw5yCxZehe7jLtDzxQNg/xv4cZFD27VC6na5OiLQuv5+I2xXDqJQgH2Dpp97FaHSC/RJ
         EsK1gVjV6/YGbWKmSKe3hBAE9lCRr89yjMsiVRJmOcDmLuAFX7Ircng1qtpb188ikzsd
         GRh1F2djOdNBCI3SIp7di2RRfH8EhINE37VhF5KPD+qUulZxzZHaCS7vJh0XtSi8iKos
         fHng==
X-Forwarded-Encrypted: i=1; AKwUvBzwoT1zp/bhE7EJZ8PTDlsgyJH1Zu+gaEOpho0C3aspLfQT1GOzt1j3BFCRjdMuNZa30fdcBFX+ceB60A4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq46GcVc6WHLlhOzqWT2lcovM0kGjWMNamFe8HiriMC63y1m2N
	WsN3hY4EtOHbWm7qpFWb1yItv0kCgWKPTaS5CiJXwcRbRp05rIe1HZut
X-Gm-Gg: AYBFou1Re/bywzIxuyHS24wZN7zyJ5qDkyNKdKa2lgCDBHbyl6xwHVKLkOGv3jbPTu3
	FXuGNzRwBgwSs2PzLSOsTOKRfqB6dF9+XLdG5AnNgFB+NfVYSaowdR+eWL/U61qbYm8NA0Lo4jq
	BjC7ImHLGxa9gPco4lpMdfLDmYxG7DkOn4VOlOWJE7wsMtI+gjWCxGLpUfDl+/3l/2N/ongRIRB
	bULi/2HSsqCDzh1uwc1Nrt2JuPE42/hwoyPzr4DpQQq2JsW/5Hu5WW2k/8B5o2BDn5B2B9Xez8R
	UWZEjW7QBJUwHBBpDoX7bdn08jOIhBYg1hNhOLbY+EIht14nlz3BIU6WQanboEq+R3xvrZOjcIN
	evLkeFGOhhbieMqxcBpMhvqdf+9xoMA5tspqIDXDssx0BWM/k39pZz2Q69Gzw2Q2tnb6KmN4dS7
	UlVIMcY/YJGzuDif4e06Sk7xDlFWKfajF6inBAJV1UMXM2gm3edQ29F7fxBb/O7BR0hj1AxhVj6
	mk9btWDz/qjNcdZ8AwHk75TrurxOhcY2Xirnev7i5DfBsF5jfy5B8R+aTjc4jcUutAqsTCiYxYB
	Mp47UQY=
X-Received: by 2002:a05:7301:5383:b0:369:f644:fac0 with SMTP id 5a478bee46e88-36a0f55dbc6mr2798061eec.8.1793092476796;
        Tue, 27 Oct 2026 02:14:36 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee72c0sm48508417eec.29.2026.10.27.02.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:14:36 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linkinjeon@kernel.org
Cc: sj1557.seo@samsung.com,
	yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jlayton@kernel.org,
	jack@suse.cz,
	dennylin0707@gmail.com
Subject: [PATCH] exfat: preserve creation times during rename
Date: Tue, 27 Oct 2026 09:13:53 +0000
Message-ID: <20261027091353.74642-1-dennylin0707@gmail.com>
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

exfat_rename() resets the destination parent directory's i_crtime after
every successful rename. A normal mv within that directory therefore
changes its STATX_BTIME, and the new creation time is also written to
disk. Moving a child does not recreate its parent directory.

The function also resets i_crtime on an overwritten target inode. An
application holding an open file descriptor can observe its birth time
change even though it still refers to the same inode.

Remove both creation-time updates. simple_rename_timestamp() already
updates the modification and change times required by rename, while
creation times should remain unchanged. Jeff Layton questioned these
updates during the timestamp accessor conversion, but they remain in
the current implementation.

Fixes: 5f2aa075070c ("exfat: add inode operations")
Suggested-by: Jeff Layton <jlayton@kernel.org>
Link: https://lore.kernel.org/r/bb698e294b0d4dbbbad4b94048693360010b8010.camel@kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/exfat/namei.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 68ddb9c5504f..d01280570f70 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -1293,7 +1293,6 @@ static int exfat_rename(const struct mnt_idmap *idmap,
 
 	inode_inc_iversion(new_dir);
 	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
-	EXFAT_I(new_dir)->i_crtime = current_time(new_dir);
 	exfat_truncate_inode_atime(new_dir);
 	if (IS_DIRSYNC(new_dir) && size != i_size_read(new_dir))
 		exfat_sync_inode(new_dir);
@@ -1331,7 +1330,6 @@ static int exfat_rename(const struct mnt_idmap *idmap,
 			exfat_warn(sb, "abnormal access to an inode dropped");
 			WARN_ON(new_inode->i_nlink == 0);
 		}
-		EXFAT_I(new_inode)->i_crtime = current_time(new_inode);
 	}
 
 unlock:
-- 
2.43.0

