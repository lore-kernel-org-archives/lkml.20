Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792820366;
	b=nxPu8bM73QPa+qphAXZwWZiAs5idWVTM1P0rQBcrUR8/49cXbzfD+kNzfPermeoLzuEL
	 bNpaLrIFBrYwXhdf12A8WnlbuF1qqbhCtGe3f3iSGUQPacdu34ILwYlDrzjFAzX/mAfz6
	 Bx3U6OAKJQqgbIm8QC6ofQe2T9cdRPf5kz/5SNuei8pj29e+VhjDKisomwXntWdr6r3WZ
	 MEKb8ki7cb/hTNKdRPzedKVA/yk4d/Hv4kPotr1redSYNxn/2QOHlNtNDTbWZqHCalCmu
	 FXCK50PnI89xIQlU7QfPgKfBhLctVI7lpepyLpko9rCG1lRl0cAhjyJwDHg1TE4HfaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792820366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NAlRJHzy1wsPSPz/FaTmSQg0jcdHnFgdak9YR0MMUoY=;
	b=mSPgLaRblYAdMMH3XVG8fS+S0/dvH/KH5maIzPK+INenY2puq6z88c8HvGnrvG1WcEPh
	 w42wMUPjEIP6GgkOvSLrkh5fYrmVl04Tj0WBEykbSvgvnu173x01a+DVZgVgS7mOzI/X+
	 k8tdlNzOS46BlAL8MuX9Kh1OjWm+Kr1foPG8NCROM5ZXQE0/09xt1LKxPq0UgRRjMEH6/
	 KEhh4hBa0TPZezKczdvvcRDRUol6JzJMANfHavcd7bZ+0jU85C/zyZwvgBx5Bh49YOXGa
	 av02ndoSIBvKbbz1OImAo0SGwLSwznEIjoWyNEOQPvyzhPKbZ4XnHB5A2meDm0ifvXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EtWcgvjg;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C31606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30C31606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EtWcgvjg
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35c76e9614aso2321709eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792820365; x=1793425165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAlRJHzy1wsPSPz/FaTmSQg0jcdHnFgdak9YR0MMUoY=;
        b=EtWcgvjggaTKu6c9xlUsSlUPQ6XVUNtVsXGVTtLyceX/QcXgGPbSXKY8XeO2FSGU8d
         VciVKo4mE+QmwXcFJK17qw3PZJvca5a+XpL3bfM28dRd5YnTJZ8D7Mm5d66V8NbPZjMe
         dqvXyiTC4D9CqynigaiyFXB3lqc4x51FqnkqnHA8ameVrie4P0WrFy4HLXRnpiPGVB2s
         Xuedp+gr5V5TRR0jOv/kTRom+sIznW2P/+AKjJ6DTxvyNS1sipl5zYsTJzJQnMmMJexz
         93sOWST6MHyjBHcu/uNB6dnhbSdVMJwqcTC3N+OOpw0Ys/r9SIHNDHbG24NuvR9ctKGX
         JUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792820365; x=1793425165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAlRJHzy1wsPSPz/FaTmSQg0jcdHnFgdak9YR0MMUoY=;
        b=bD1L4PaYZNnI2gcgt1wfmolJUgTeiPsJTVfpYtXVQRzPiGW4eVTrdvt7DohbfL0b64
         4OAB9ywOahV9ZbuehLdqY9ytjewWQYaxlxnV1QZRFma1pKpoGYc3tJ/mR9R4KkbEwwdY
         NgHEzNJc0iP7wymtFlgYM9gjtb7b1yzjwO7zZ4W75G1rX2WqN2A1RV5LGn6pmqdhUwQ9
         tNVvDnRDbkxHuQ0RpDIYxT3JuQI8+2bNesuROuud2fqz7qQ6LnnMORvWDAExsm60B6yV
         NorwdLeJ9svjeYMn8P0N3CyuHSmvqbQpT8JP8QFnRaEt9OWpRkXbcje7bjx8BeVgtkpo
         WsSw==
X-Gm-Message-State: AFq9FYIEbepICOx/DTMJdrV2bMES/pN8/34MdtaxuPl9S+qahwfV7oSI
	uLwb/dbZUHuEARzqMblNe9yIQg++x6r5T/F+s0dOvj3aXRCfp2a2OMB3
X-Gm-Gg: AYBFou3Y/XH5AeESO1IiIEzMkbJcv1+cstJn8q1zGyAxWse+gj3/uc2/z6pJK1G+MhR
	rOoeezM2ZhsgvjbG5AAaf70ifL1n/ojqN+nC4pNy1iChyLrpC1hFEZ1sqgL92huDDO4KfeMtgC4
	zZIHw8hBryD4ctPE7N85XyaryYUnuYtnOFLqUztV7fRjJ8u3P/k+lZ2GlUtZZOfDzJQHHDC8XWa
	l+qoBpM+YfEAgXaiLr3mTAXucMkK64dfd91W0QpIRSO6Ihk4ZhGSftjc+LmHeOxYdwZwCtlu+Z7
	9x6Y/x46y0tsY7NTZkq/02DQFvzcZxLtXisz8Qxz2urGtW0J7vG6iBR78olcUCE03PQVMDExa6M
	WLlPjOsuKwe4koJ/dH2AaGUZJBI41PuDqbfF8mxFcK6vewcgG5u8b4RU1CDk+1pmffTCeHntUfP
	zUctva/cKSWTF27S8kGpzrnvANT7bs8ZgnEUCfanGgktm0pER3Xu11ULr7Sa6/F3aYQyS1CWaP5
	eGVpBwdHH/oyNREAClrmIz+pKc25OUq3IO4M5guArvo+v/QrnMvM4TLGEK+HOkbuU1eE9wJBTxt
	zn8SXncjKenUppYSRI7t1S4AQyji5iyVEys3eWGYXqXz45EEp69FOfvY6Suv6qhyvjNX8LxqWTB
	0OhzvpNBegLuhRdI8Eo63CoMLwJ6Akg==
X-Received: by 2002:a05:693c:62d9:10b0:35f:2bc:82d3 with SMTP id 5a478bee46e88-369e84bc16bmr1906522eec.15.1792820365214;
        Fri, 23 Oct 2026 22:39:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d56957sm7466859eec.5.2026.10.23.22.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 22:39:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] wifi: ar5523: don't select ATH_COMMON
Date: Fri, 23 Oct 2026 22:39:23 -0700
Message-ID: <20261024053923.3585009-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ar5523 does not use anything from ath.ko, the module does not depend
on it. Selecting ATH_COMMON only builds ath.ko for nothing when no
other Atheros driver is enabled, so drop it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ar5523/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ar5523/Kconfig b/drivers/net/wireless/ath/ar5523/Kconfig
index 0d838c1e7b12..2ee9aadfe19e 100644
--- a/drivers/net/wireless/ath/ar5523/Kconfig
+++ b/drivers/net/wireless/ath/ar5523/Kconfig
@@ -2,7 +2,6 @@
 config AR5523
 	tristate "Atheros AR5523 wireless driver support"
 	depends on MAC80211 && USB
-	select ATH_COMMON
 	select FW_LOADER
 	help
 	  This module add support for AR5523 based USB dongles such as D-Link
-- 
2.56.0

