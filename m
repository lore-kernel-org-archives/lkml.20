Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442611;
	b=KaPAuZk3l9WhpWIsIfvArC2CtFv+v2Zhas7LfunRBAIWrBGehn1vjnX/gWAUL4JOTaJo
	 5r09Opcz8qG+E9Fhfl927aNEfmGyU4X4ivxWuX1rB/VQNolUZ60NrZ2a/VgvhmhR8UtKs
	 n/u1AsS8lYAFmoKLVhsZmuJ5yz5n0nMnWh6fkq4fKMHAlvqUZiOCMXgxgBySB5NNzRfyg
	 7BRF00ESLFcJh3KDo8vn7I9y6e7ilIGF5CxbGhN7EaU9VGdDnhGr/dVGf89iSrEr7rpED
	 upmBTgFhhf3Qp1I+ovrYq5X2CcGCLffjEKf89YwJ7WYMFn1nvsBUBj6+r47mPKgYBtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BFLYcLYyJpDgB8FwsuriCtQnWcNZlWPgX5/Y0ltka4Q=;
	b=IJCTgndj4U1XdvXJSF3AjVgnU1fdQZykJ4vsqdgR9sIxvV+pHXt2EpttEWHUwKq+wvYo
	 SFunSh6zQ8XR91lRmudnNkf1o678LU7XsD3Ync45BjuKPtAvwjxciW3Qu5RPFW+9d63I7
	 QRYwUk31ze+iGd7DtYkzXkB6cTmXiYvzPjKe8X5wMrjmyFYQWDsYRf/V3HW4wB66ZVt0b
	 1Ewx4djewJ1+BiIMGpej6ud+DmrKeUPi3DMo6OudO/Yzab49C04Ha2Sl11vbVckoKcS42
	 XrBC1ZPZCPMu4Fe0/ncvpy44Nv5NCciC01wP+mM2zXuv7Izpqqus361mOYQKrckp5sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dxl9rao+;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58EA606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B58EA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dxl9rao+
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36dbde64409so7479270eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794442610; x=1795047410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFLYcLYyJpDgB8FwsuriCtQnWcNZlWPgX5/Y0ltka4Q=;
        b=dxl9rao+Mve2THh2SlKEiLWxcU8xmxDUVWW9ZzDnBNaloGcEPR2gnU+RF0iacvpgRy
         qBDkN6dDwY2DqaPsLjVKfgSwV1+C7D5SjdeLSsIuu7fMX7RYF1Rg8T1h3358ueumZfe5
         vCLZsLR4aGWsz4j/Bq7dtWoMpy682KSkmpf+H9HP8HzkLmF92GUZ2wgjkiLiuRaz7+RF
         lG5ajUD9brwDyJNcJ3B9VuHoYix0WvzCyaGHtTsjVGkBAb2b5OMeWju0nA7wzKc+Xt6D
         0W4l6AeaT72UfoNCyfaFOoZan2h3s4hsEjqA9oj5Kn16XbUH8v2CBdGxOlGGkMN3GZ05
         KdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442610; x=1795047410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFLYcLYyJpDgB8FwsuriCtQnWcNZlWPgX5/Y0ltka4Q=;
        b=VEYK8H/1bpBd2JgvN57LNdpps34ml2e0FOXMFeALvMGpaghpwBdpttFZLGnLxXUfxu
         ZQ9sSqBZbaZvO3cCinKqvkBZMAFSqe1kjXSSXlBki/O8n7wM/qShD13AGpGSP82wOAwK
         q8ldakAq/jsJ7/YwL1A7MZL5reaOGDtdcyh5KlJ8ENPLZq007o49E6b523vMi4Tvg57V
         iFI/zG8IeTd/odPrSRhqAwPfYFdoGUskM+OFUz3hRw0uUIhiRGmZxiwSSuxcA47FpLpi
         dm8MJbE5mssNYbC/ngPWnsMFjjYVIvf+XkzQGUjNQowOG77hSQc09gD2fBxdugSw2dG1
         hq5A==
X-Forwarded-Encrypted: i=1; AL+hErEvew9USNFBoQv/RLJdd1dw8QkEpjCGfQN6uT2nUP/cmnWxe0kczyCrNvZ2TW9lvNd1zYR8AP1RoW2R1Wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LE+XJyO9nRuGklWfdvkh7a6/rGjzXzvUD+RbGAUqmlqVnUjvC
	uYTFlBcGboPXW7hEEhtXdd3UQnGsVoZLUe+Ra9WLyF3LyuLD9c3KyqSX
X-Gm-Gg: AYBFou35GrxK2QmFJD2tLPmG80CusycDXt5MIXOkqSeNw75SumwjE4Nw2RnUieODqGH
	i60fWP5vLUs5YwFr2eGpoXN35JXPeT01xAfWbRoahX2lK2jiiaapImSyttDHIEHsR2yx5+F0/DS
	C+fURiz6nqHo1UOKbuGeB4mkwpPFPrUG9yF9SQEMy8fhqQu4TQemsto0aL4B5aAesDsS7gDZ9n0
	pVVdiiB/vDT5QebBDt4ya7fgRXQrLRJiAwiKb+JgpCFDuqrxtX8ulJQqXt04xf4Apry9HbSUdD1
	NIbFhL5YZjNnZTp6HbyAjSz+YKl43bVhCenWB0BczV5x4FgdXcmEtKJEzUFWBB52D0+wv1NMTCT
	mUYNzLQAM9Lr2mPHE50RNLQpeN99aB/lzdiT2gHseNF9Pb87dAn3Qkn/vLLSfqR+UlwA+XmkjHR
	Tx7SNaPjPunH8KpzJiKiHbWYoZLnitxVm0Y5cCIw6YiijgAy8dDOEC3z6x22XEJmQOscXE0YYCn
	HZzOIvp2aRIHAPVMgO+jv1v8PM9AetyUNQ8YLfXdO7vMYH3Tw2KyaK3j8ftKxpm89xmhrcN0845
	RYwmXfINM8e0EcMZSEW/xx0m+ce84jahCew5ZDRI1sLAbTJPShkUvoNM+ONuUq4Xkt0xbvv7kpG
	RL2SQImYsyhXUKs5KH3OjYmR0awK7OAuvvSQ/hA==
X-Received: by 2002:a05:7300:6a8f:b0:360:e2e6:f849 with SMTP id 5a478bee46e88-376861732afmr3870927eec.28.1794442609584;
        Wed, 11 Nov 2026 16:16:49 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm40492697eec.16.2026.11.11.16.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 16:16:48 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Alfred E . Heggestad" <aeh@db.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	Thomas Reitmayr <treitmayr@devbase.at>,
	Shaun Jackman <sjackman@gmail.com>,
	Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
	Florian Euchner <florian.euchner@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Xue Lei <Xue.Lei@windriver.com>,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] powerpc/configs: drop CONFIG_INPUT_CM109 from ppc6xx_defconfig
Date: Wed, 11 Nov 2026 16:16:41 -0800
Message-ID: <20261112001642.243554-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112001642.243554-1-dmitry.torokhov@gmail.com>
References: <20261112001642.243554-1-dmitry.torokhov@gmail.com>
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

The cm109 driver is obsolete and being removed. Drop its module
selection from ppc6xx_defconfig.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 29acc77573d6..4ba35b9377d7 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -537,7 +537,6 @@ CONFIG_INPUT_PCSPKR=m
 CONFIG_INPUT_ATI_REMOTE2=m
 CONFIG_INPUT_KEYSPAN_REMOTE=m
 CONFIG_INPUT_POWERMATE=m
-CONFIG_INPUT_CM109=m
 CONFIG_INPUT_UINPUT=m
 CONFIG_SERIO_RAW=m
 CONFIG_GAMEPORT_NS558=m
-- 
2.56.0.567.gdb80ae8cd5-goog

