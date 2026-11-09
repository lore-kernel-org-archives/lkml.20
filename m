Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242036;
	b=U3mZ8WsHvpuWWVnGb1TEA56xz14NyDlAUo8GxUpiv1g79opw6W6GurH/S5bsrzT3sUUt
	 pvaOKxGzUIHjnA992ZDer/77oqKtsGRwKYLNwv/fKaqw0jrkVJfedV4p7kGCc9C4HXiQl
	 vmpOWrxRz5GrQY8zqv2J3d8HsxC6f8yAKAGYqwptMooxbOxyYpCn21fo8B83SZCRAmzJ/
	 Er/Wq3neZDk3516TmX9iJez79C7VUDwI8HVjQ3onDOWGotVIOsLcEcK2/PEcbtZoMwW96
	 /VLFG83KlCt+kdGcfXfrDb3tKJx51wpaNBGSLdwMaolQ6QIb6mKV1mC4s3QNIzSZqmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yc+NMYIoZnK9rhYeskodTJuADVgcripisADy+8ytAic=;
	b=QC3SnSWzXcVLZxiQslKHCeDQe/N2VCM6b8KWAv6X4hm6+FQQNJKt4mK9BR/Bb1Dg2R9C
	 0kommkck0PT+86EgFLpNhorOd/vCmR7Vwveeq58S1DKRzEAopP1RLDtaVNjIzWFcGrY1E
	 /GYYXOrK5O1jrWemue1zxa+WUzNfDEyC6bsre3ZCKF2SEDJ6v9U7hcANxIvQOuSxxEZGQ
	 sUek7tRUvQDK3iBJoH/dIcaKM9EbWl52rcWL9GNi7acNUXJIDSE19xlw3gxxbsznwL2Mf
	 lVPX0yaI1+PaVE0gzi5cVjbg1HA1C6AnTyWQRpy5pL+qR6WI+RhIEwsDR5VD9KbBf3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zu1rVCtM;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0C3606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E0C3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zu1rVCtM
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so448108a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242036; x=1794846836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yc+NMYIoZnK9rhYeskodTJuADVgcripisADy+8ytAic=;
        b=Zu1rVCtMoHZO+UI7/rUVwx3jIXYNxWa/jms3Xd2Y0zmMzgigWwG8rucBCDessYIKMS
         0Uh+oj4VltdwqyVJGFtVKf5tBpkb8PrXGhtJjkYQ99K9VZ1j2a39B8c6UPnaljJD4891
         D/180xNSyzPEVVR5xHT/xAIb7anx1Q+Z7mhD1QSnkJJDsLR2IOeIkxxTVe7RWjbB3JFp
         ypBoEs8wBiv0Ze5qUuJ3417LrfIf5OOh6PWYRkhgII6CRP2apqTBFPUeeEiOLW0YebTu
         D7PyoRaC6X6CWgATnc/8Ydhhaa/JFg+UNvSh/kApD/IvwZfiSYDLQQUxIizU0MiO3AVt
         4dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242036; x=1794846836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yc+NMYIoZnK9rhYeskodTJuADVgcripisADy+8ytAic=;
        b=E0gr9T79OF32E4PD1FA3Cz3jYX1hVOFIQb5SPtPSNc+dvOBVEL8Jt69FJyOz5CVc1i
         mhkZr04SnPLdkhW7DcuWrs+m/hcoPkUcnKUDyBYppiah4hL3V2CU8NVaw6gzmTya/Egn
         YnSpXBoMjp9yq5P6xW9WN24ARTHLj+ff+lkkGzG2QKu+PWaqSbxeyq4GuaaclEUV/4BN
         1keg4GNJ+ua7k3DIHlKaUp+KzzZbibW3pI+LzDP+YWAvWcYl855jshCrauby5JBErcUQ
         tXUYndRpFAZ0qMJJOx5Ox0KKeCd8adKyQG6fASivicr1/KYVz3LyWVwdJT2R2lmaaO84
         M1Qw==
X-Forwarded-Encrypted: i=1; AL+hErH8JW37N7oqlicfVvhnKJeeJoDA9lABNUy/O4wFaCx+gan1FI1dlf0oh44fV6S5EQKvgqIjtf9+zgZtOBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6x2UA1REqlJsXlyM3P1XU3h+dEx7lUix5VBMSrH3OYu7pAz47
	sGW2ALp4Xn7S4Q2nN/mUM/gskPGkaKIA08kXjY5fLcZoxxVX5dtbGKjN
X-Gm-Gg: AYBFou0pPTcc686g9dlI76KhMtQCX5Pn/y14uI8MZTyctYcXWgFfV0q5x+G220V9Inj
	GHp5oVfDrCs2FRphf2GULjRpPNDTYQYlK9c5HtQ2gs98lPt7hsBSpnLBAWMgJaXuys614+HEl3W
	/LAZ5CBW/Sc5tIHlcRK7lviUWXiErTkypDgefjego7yFx7iec1HVAppOfD+zqr2gS/7ZgaVso7e
	HkxSdAMTsCEkiD2Cl0U0NUtfqP30nWvO29TMcZqJdccgN4tlYBANrl5YWc2fwvvKKallHwBNkKK
	VCoieAVPmnCtTbM7JRdr7wSgYUoJn0nZCT4HkMeLU2r8UpmURNYCp+//PSmTAxcW/QYwVnaaURF
	QuqNLP13bXf3TtruqKcxRPf2r5xkv3Y1T86X7jx/MS774gSHXynghl0f2YSad9o/q3P/JH2muIv
	e3ZID2G7kFIG2lUnq+iS2D6SwubSIZ5ILTRScAEtkTDc86QXRsPb8kcrI7ELZF/AsH7iV4WQNQv
	I0cR0ccJWVLEXKrA3rFHiiev6x7dcbDEaOnCNl4U8wSslqFlw4L2ROajUKLpvnWgfmUpWl1zXlw
	BMlefjpebHgRmwZPdznfmop551Z1B43n4aSjsizEd472OThMazUEh+O/+S0Yk27zvTBgCU3TC/Q
	=
X-Received: by 2002:a17:90b:5247:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3b166d00578mr155922a91.67.1794242035723;
        Mon, 09 Nov 2026 08:33:55 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1679c41aasm13995a91.0.2026.11.09.08.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:33:54 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 1/2] net: dsa: motorcomm: Report error when FDB fails to add
Date: Tue, 10 Nov 2026 00:30:08 +0800
Message-ID: <20261109163117.1792478-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109163117.1792478-1-mmyangfl@gmail.com>
References: <20261109163117.1792478-1-mmyangfl@gmail.com>
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

fdb_add() ignored any errors returned by the hardware. Return error for
that case.

Not carrying a fix tag: filling up 4096-entry table with static entries
is just asking for trouble.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..a7a9a7439304 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -725,7 +725,13 @@ yt921x_fdb_add(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 	if (res)
 		return res;
 
-	return yt921x_fdb_wait(priv, &val);
+	res = yt921x_fdb_wait(priv, &val);
+	if (res)
+		return res;
+	if (val & YT921X_FDB_RESULT_NOTFOUND)
+		return -ENOSPC;
+
+	return 0;
 }
 
 static int
-- 
2.53.0

