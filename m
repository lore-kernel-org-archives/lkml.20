Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889283;
	b=MZ0grnNZvQ0eE1DBNDLk+PtcdX5sPxQA53XPEXI2Iu0dhQEfuOUSP58ioIeD+QU7i25D
	 yP+bSWQz7wu1GDI0+Eb/VuDY6fNDRGWcvYgCorG+8CmXXZCf4BuSGXm6VRyZ5/5sNVcSl
	 Diu4hSzlsJCBK7we3S0REtD9JB//scW9V9+xR9hJtaqKm+UWVz3/H2lR2SY6QhFihmPtt
	 cJJ5RMBE7/EVj5ORUgaHPtmhXuI6TLZlie+pOaTNy7rfXSvmTVHxUd6eZYnbE1CyNWPkk
	 tbAfGNHaPCj248HpWG+4IKvoIVsuaOxW9eQroZ7IyEFWlbgNDb6mni1wJtCrWsxby7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FfAlSCi1fzt8taYG0X/OqxFQ54Yq2ZMFl0MaJLw7avM=;
	b=WQKEJVtivHMrNGHroFa5heYHNaKQc4/YJQOBCy1sv80bSigKXeLOTky/L1UlYrphVLfp
	 AIDKs/bnLKfKbYspt4UcYktCx8EOJAlqFAnZdnSnuOdSb00JnNVnd2Cb7yOZ6kFRuQemN
	 0/ju+xXGHxMTYw6zQi6qr5CQcFLu8xIcas8veigg3EQGYkpUcbCkg1URBh2nJ3nq/tB3k
	 o5b4EvhoND7FXUj/RIICUqBLU+ZpK6nM+rBnBbxzelOHGztDbCDR6FIIbZ4jpmoKTMhAJ
	 0TDvI17iOSJwbneOF9AeGShgZK8C6QJl9WBMyUJ9/aiMqHki2lQyKR2cLmHRAJcYOOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7d1ffnU;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02459606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02459606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7d1ffnU
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9eb579c0eso23557855ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794889282; x=1795494082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfAlSCi1fzt8taYG0X/OqxFQ54Yq2ZMFl0MaJLw7avM=;
        b=z7d1ffnUuFsxXWxBDp48Jla0wEzcjgq0VyJh00gBTAWvG58dKZZacvjrf8VPCKjbZM
         sB30vQrNqLF5k+rWNioIDDdPKIItQ4Qph0I8aYxJHPYURwu5WyEA4S/4wQvhJqPiReLi
         +gT9/5AMYqSOxKo6SR3OLMB+xZW0pjhalhnpc1EffOPIHgosYu5nDxn7jl7SSh6tzdY5
         fFsx8PRN6IKm9l8AV5PIG/Gd6feEsJeQyBOEAftsx750ULOHV5yXtrTpgLaqqBR1tdHb
         pKGzdOAHnZsfwRxyHFQcrtWjGd59UkbsrhIVO/rkqCrwpOgXryaVyCZul0HUqtbc1OgC
         tE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794889282; x=1795494082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfAlSCi1fzt8taYG0X/OqxFQ54Yq2ZMFl0MaJLw7avM=;
        b=g9e6vq3xDvzwhDUjdpr5/4vbqYg7BNHMct8y9Gv1zw/tQEyF+vD1C3AtNru4JA8GOG
         veMKCpGLwsmUloAN50Ab5Nx14XWs6PNL+1ATStt5YF87klu5wYeIuWkvE3BHL6Tfr1Ud
         xaCZVop4BTQcH8Q7cvznlVAPmfPEe3zqLrzEFnz32reRB85Zr31wqSb9G+rF6pxuZ4tJ
         Oybar7+XinRuCdHsFBXhsOPCSzg/vWmgGFAeMiktGUR0guQEtONf1wWw0suq0q57yXvI
         owiuBy2z/gvvytE1ZXFlp4DXYp9U8tnvYVqASTnX8xgo8YEps1hwDeLGLEKTioE3TIIH
         1Dgg==
X-Forwarded-Encrypted: i=1; AL+hErEaFATzf8vE/+Mu2HLB44/6P0RwPzkKAilDeig4wwpb71f2MvYBUYULTudS2FGt4mXQOnlYFAxGQVFJlBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FREOUAhSBHAlfTz9E3nsWM3Fg1SEBxBXSZaMKNDM4H/22UJ9s
	VSZJX7Q5tCCA1qeJLbT+LwJzFMW+0E4tI0cyQh+QAa4hoHmK7J+/paRi
X-Gm-Gg: AYBFou27Nf7ngDtfmWZm+qwt7/cB7TBIPBssEz7b7lnvvvUgx0MwEzaBrncVU4WRezF
	vLEaRVwtZLoRK5EhUwbdC5GhU5xo8akADvF4r3e1O25tDIHUsVh2xdJ4HK3Vyxj8tdUDGxPIrEm
	KE/NoZpxxL853tqHB1PF3dnWUd2ky0466mdKpvZlRzUuhdleg589RhONySH28jXYYUYb6e4oam9
	uvVr47UU6D3xC0A5pdjn8PFgj3Rdzvln2TZFgRVAgsM7EPakmshT+ZVITaRAFX1OYRzYpNrt+Gx
	e5SkwCp3ayLti1bYTBcMl9G8U3HK/xTrIGeB/uuxxm4Qj+f3NWKiJNlvh+N5lknMv/rY8W2u/Eu
	eYOnkOlRHev4mu6mMZ/kdUNpQscW2aRpJ6RRoNYsVaTYquGG+aVQiCyh4CkgNSIoN5ZqJuAxddW
	ia5t1LRWVjyq98XK94HdevmbSKmreedMzG3mVBSnsdHwXfO5r6yvt/UOkwZOn8f7BwhWj4LIPvf
	e8Rm20N8saAQTrokGG2nc6q4oAecD/+SFYU4QIzBRsX5tmFNHAb9n7uorQIh7ACu+56OBIpTard
	SVMJVszkHO5H5WFMxeulcfA75U0ARs9Ei35RDFl9pwxVzTSu8SSQmVyhqNK9EzLxlz1zUmzvxU+
	8DR/eiQMrfTyg60lnFVfKiDuJSw8lrDho2cbaxcsggACHaoo8HJC+xDaAAx/F4dh+dA==
X-Received: by 2002:a17:902:ef0b:b0:2ed:1e82:ab81 with SMTP id d9443c01a7336-2ee0dc97d44mr111989845ad.57.1794889282274;
        Mon, 16 Nov 2026 20:21:22 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efe41c8df5sm412385ad.70.2026.11.16.20.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:21:21 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: cirrus: ep93xx-i2s: Clean up resource management
Date: Tue, 17 Nov 2026 11:21:00 +0700
Message-ID: <20261117042102.12442-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all, 

This series simplifies IRQ error checking and clock resource
management in the ep93xx-i2s driver.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: cirrus: ep93xx-i2s: Simplify platform_get_irq() error check
  ASoC: cirrus: ep93xx-i2s: Use devm_clk_get()

 sound/soc/cirrus/ep93xx-i2s.c | 51 +++++++++--------------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

-- 
2.43.0

