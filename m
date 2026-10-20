Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481250;
	b=hgdmri02vtzUh7ZQaVQW2RG0fQYJhjm7fNyOPc+TSaQlSMlv7GFBPE02OCbb8Fk7NrJm
	 9J1dbU6gh7GjmsehVpqjdFC1YYjFIYcN61WBB52imzLaXZB7F8Mr1lSiBAqwCXDXOx85p
	 jC972zwUeYzeY9o67WWq/yEtLxtkE/MNmEEZ/XpJbJYpncZ9I49yJKZqu1vTwxal/EnIr
	 IxGDGyvvksDmN7/ScWUYtgGdEla4d0nn2xLYqLltG493SwLs1l91mqtn0D8VbO86A/p+t
	 eijodUGiHELZTciqvy81AxVuauR2f/u5nUVtwIBU4ltf3cUzebLk9BJfA5WvyXpnNbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0zrJsy6+pFWfHViBKa8dcpiN0fO/uxJvY/CktxDW/j0=;
	b=ngOpPij+L9FRirUWReVmGpclwxtTzv6KV3v1LLJ+NpRRUw01IC5xgpLWTw7DT9fLT7Rn
	 SbzCT0QF3vEh/soO7hKGTw1ioXNDT8C8y+UAs1JxiO9E7eQ0HiMbqBYXJi8RtqjncbY+c
	 efFF1A4DCYgBnf2Ht3oEVnmaMQAkNM+2rzgHyosoNkAqfY/ABNseBq8Np9auoQl5P3nSI
	 GIjdVClrizoINIk7nKA0pijQVOuDHeIBEt2NTRPbk5Qu37vSN2l/WvEG4lyfmi788QKQQ
	 ph3zx1ClhRC/7aW95sTHgvTu1uTlykiC8rPnz8QhJNOPdvS+OHMQcEBmEypoE4hSpPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CAdKwYDi;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A54606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A54606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CAdKwYDi
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-3663e04e9a8so415785eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792481249; x=1793086049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0zrJsy6+pFWfHViBKa8dcpiN0fO/uxJvY/CktxDW/j0=;
        b=CAdKwYDieH/mM+qs+HVjyvwmt4OrcxXllqKFOPPXkDeVV4qNhYTyqJMJcrQwaev7If
         BetT3yLcc5xRJCWCUInP5oLzcBjzH8t5mFlSvZbJipgfZfevw1yK9xuYiHZ8YtlGccz3
         VBJwK4la/A4r5uVjf+8/PO/LBlgWmKFMUn0j1kY7WHtiXbrG0gzyW4yH+8JFrfaN4pep
         fI/GRuIW9ieXiPv/elFHUYZucl3lun3Bp+5Tlb1SpF9KXmjHSNqhZteX5MvuGrTF1igI
         B1s27oEw6ht+c5uE3iBQoiur1u6G999iY7nN4Bnk2/6z08lgKZ6iVJ2G9+4dxJrQLTAL
         bsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481249; x=1793086049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zrJsy6+pFWfHViBKa8dcpiN0fO/uxJvY/CktxDW/j0=;
        b=c2r9BOdNGRXyFqiImL0dCGg8QopnuD673BU+vyQ7z3ncYSyoSP05bQ+D1AnmfiAvB6
         deWHAj1y4BNULRwiQlgLZcxqCXnVYerSEZJcA4WjrN1FfUybmpVdVjmkbvjy0G8DY1Y7
         PcmFXlOXK/3Aj56yY7o9ABnwsaCM4HWWEMfPpg1XRWEFESPiVa99pLc8cSOictqfnrYH
         oYzHg8ql5IPOO3SeepNpe2PVlwPeaUGMO63lVUs5wKVROfF/jd1HCaO0RVVwsSPYHIb6
         xkLheX2nX0tXL1VYAAHC+Jl+MIVQunC7PCRcJQbJDPjoml7ku95e3eh6WKAOwuE4GAkR
         9x0g==
X-Forwarded-Encrypted: i=1; AKwUvBwJ1DC7cYWYJFkKCV/0iu2q4dJ9Al0k6kX/1ZUlIBgHGsmHEhXaMzHTIBINrO898s2LinGt/3gbKyBg9Vk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6Q6U8EeFXgVPaETWkG2rXYwOSKepcuTAKSXSj6exqI+WrC850
	tzKwtJz0Yh303HOZDRcPeGvw8uNZX4d36FwgDxfOdjTW4y7FXt4MEfgO
X-Gm-Gg: AYBFou2Q56Buo5KXlQ7MrscOUGKY7qS8Utt10/wn7qj07WE+4RkZS/N9AkqCmuRG9wb
	hg73Cf+DSBnmDJL7GcgQ0EA2dx1KRynSd56lBTNFDekGxvX7nXVi5tf9Lt51m3C5h5nS5nJRtBb
	qSp/oZlVrexWh3nP0Zhs3OwexsylGrZzPlI1VId89EhOCHMsJ2McNnguYkTuDEtfXt147s2USnC
	/OyPxyEmYzu72HpopcFel8H9T88MbRaYJ337Mfk3a0xg1WFZx3tDSW3Y73TO2diUDZX0g3ksKZF
	55f8araOnGW5fFe647H0eQBm32iKrHYujlDRyTNuEbmI+JkM9C2bVS9Wqx44gT+YagMMfsX1buQ
	gFKplVVgsMp/EyqwlPS58W/mW+jcZjrFXWsy2XV4MzcTW6xm4XYDI+I7UwcF5GkJaYR2pbPMz4k
	mWUGDCptTsGIynixzdsnrHSVeQB06KZQ3JWH9l83/l1znTe11+G43I6oHDLr8fILe79tlfJi/2+
	oR/375FGCOYTMcDH6XVnS+bhbzEwslz8iN3
X-Received: by 2002:a05:693c:8244:b0:366:8efb:bab9 with SMTP id 5a478bee46e88-3668efbc174mr439554eec.11.1792481249125;
        Tue, 20 Oct 2026 00:27:29 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819bc569sm37090220eec.11.2026.10.20.00.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:27:28 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] klp-build: Use kzalloc_objs() for object and function arrays
Date: Tue, 20 Oct 2026 07:27:12 +0000
Message-ID: <20261020072712.12633-1-dennylin0707@gmail.com>
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

Allocate the object and function arrays with kzalloc_objs() so their
element sizes are derived from the destination types and multiplication
overflow is handled by the allocation helper.

Keep the extra zeroed entry used to terminate each array. The default
allocation flags remain GFP_KERNEL.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 scripts/livepatch/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/livepatch/init.c b/scripts/livepatch/init.c
index f14d8c8fb35f..908676d6d07d 100644
--- a/scripts/livepatch/init.c
+++ b/scripts/livepatch/init.c
@@ -34,7 +34,7 @@ static int __init livepatch_mod_init(void)
 		goto err;
 	}
 
-	objs = kzalloc(sizeof(struct klp_object) * (nr_objs + 1),  GFP_KERNEL);
+	objs = kzalloc_objs(*objs, nr_objs + 1);
 	if (!objs) {
 		ret = -ENOMEM;
 		goto err_free_patch;
@@ -47,7 +47,7 @@ static int __init livepatch_mod_init(void)
 		struct klp_func *funcs = objs[i].funcs;
 		struct klp_object *obj = objs + i;
 
-		funcs = kzalloc(sizeof(struct klp_func) * (nr_funcs + 1), GFP_KERNEL);
+		funcs = kzalloc_objs(*funcs, nr_funcs + 1);
 		if (!funcs) {
 			ret = -ENOMEM;
 			for (int j = 0; j < i; j++)

base-commit: f663062d717eac2c01f77eaf321fa630528e672d
