Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359940;
	b=H9a5zjs0hamWdwtgzia6pASMu2J/hvm7jwKWdfQp4kyOoAOyETcV1gcmizIZN4FZNHQB
	 n4tXAU1v6BdgT8V4zsMUjCpaOmJgH0aSnuVYFG8ZBrdI2HrrtD+DzUu01hx4z/oTSfyuP
	 Jm3ozmkeAOu8Fy2JLZxGyz7SE/+j4CZRLNmfsSK24Cq7qkUNeGL7twTZ57HzXkbPDVURH
	 spOvoTd3MgMdWw+TxTSHuckfVCRKDkfIy41TglY25p3T3ouCUxcK/6A2VVFaaMbiFUUiK
	 llVYmvvJ5oGK4IMqaHIWTcsQoRUyFPXoIwou2V3vqn6Muszv1bnRM34FjIdm8mL/z8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gNyPl8hvDz2s418waBm5wB0iV5wzq1cuI+c5xRhCVXE=;
	b=QSN9WmPRPHryZaf5J7ZUp1qk9BKB3WCYqZJxDgOEniQ5ipPUJZl7pimE/BcB/0tfk5cM
	 0TnY/DRv3K4VZxR34NbXF69TcRocI0SpxM1M/L6fVkc5Kw0TgH0GHsQlBmxnM2yrWppLs
	 AsQC56T/OtHJ+rLx+Jc9EHglrL//hL7ZRgkdV3IUqLGZvCA7B7Wq8WtUVSTim9f2DBNtz
	 CXDM3T0TDxGoY/Pss5BjkjStJZl/NASvBNa7lpGjqW4NFQarhBpBMFgWGZz1qo80t5bSd
	 BRMrpfoeCVlVFcqu/3YuDqwtbgDl3ZLd2jsJOfkvL6Qie6VAfgfjfy0Gs4w9YCa8/OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixHBnGoN;
	arc=none smtp.remote-ip=74.125.231.73
Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECA2606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ECA2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixHBnGoN
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-4abbe52a747so1239862fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794359938; x=1794964738; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gNyPl8hvDz2s418waBm5wB0iV5wzq1cuI+c5xRhCVXE=;
        b=ixHBnGoNmKLHQjnp1EcyhfIGBb4m/7l4WLpuZeHvcXjjRCFSyz6DiGp+CUUuZyL+ni
         sc7rZxVGjrXwtLjtapYWMxcVvz4WZXQhUqirQ0embkyJvK80VU2yv0WPJa/LWjjvJr09
         AiP+81YK5M0TG7Z1djmSyh0qoTsF+q/HU5yYIWBHl0wxl7BwrdqfXfmNg7Nyqvti88E1
         pKd/OISxGMwBdHXLr+6vH6utbPQ/DGkbOtVYU0JO3mtOLHJEAddsSZuLvqsfU5AX5/GO
         NUDrOPTHrgyX/zlKuTDRhkbNiNlKLPWEN/DSBXJXV4RUgC5ymdOXq6DbNfVeEqVclr/w
         /juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794359938; x=1794964738;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gNyPl8hvDz2s418waBm5wB0iV5wzq1cuI+c5xRhCVXE=;
        b=QXrTzrlo3UvinfWhkX98PWYHjInHzsBv3RG5zd/uy/T3ti8Yn9+fSwN489SMHvrbtE
         d1jLkQh6ZrA3H78OvsoMJKX38CuGwRv+nRfv+hmpfE+c5trN0aKuqR6ZJwLnjGXM5LGO
         2mJqQneYfKVhZpszuwoxtHQbCOkaqNrG+NKM9GgmmkuRnPUiXxWvHW+FHgNsBM/F8K8k
         zH3UM1VlEvjo7mU7m8ahqXy1OVMKsS6srACOWSLp/QwNVyNvjzexusoNRfvFlpw36oOg
         Jfy+Jt6lq9Xlrp/2Mh4VLTmXpyx8SxKyz88xqA/9BtJvvZNuNO3Wcf3srj57T8wC6p85
         zeyg==
X-Forwarded-Encrypted: i=1; AL+hErEK0HgUT73XzQoUJTHuqoBNGYopTIfP8i9MdeNn0C0nPsYfY7f+T4/8S/Lk+iEQ9SInpChk29WzMHTBOOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/vaXiHHQJIA86WCeK2JI5cF2zXsGhahPWUZTlW9v/qFphmrqY
	ZBju9r7jz+hZOZuh1xqyauWDygLJmhRV4ili7EbKPoaQeJTFs7pJT70WipLUpLvGy8WTCw==
X-Gm-Gg: AYBFou2vHz1FIdUP+sKzFF1Z7nH2DzxqebFaxp5N+8/Ig4TSK1E1yzlb6sInfCjDF60
	8NRizXuykUdmWCafUxgjE6m0zlzeg7ueL2K6f/7gm0j1fPqaFjMLJ7Z+iKNRWwZYpKP7S93T2mL
	Ky7CCp6V84kmp7pHBdYMw1V22CuCRKGN0hHDem/ze4KlKjY6em4IDYfgtCiTRQ2KN2V9oQb28pC
	W18NYOYwI/hdyYo07sszou8j8bFC8MTnQH0o7eZw/FwbGub/Apw3kg4Nk/bzxNFSVzB3lAFfAq1
	dwSwa7GLLTvZFEoAT25/8ODPXnu21hh096jSOUTKTEDuqc134rS/9Xrq+8DqIoFwJB2uhczVd2U
	4xh8aN0duwqvxhynrvTJ+u3vSZBwwCQgdOPTHW1K70dUCefLWDS0LjhCm09gX/8f2WuaxgFAyD0
	Pkcnrmma+PgoBgYVWx4V5v0dHM8QgF/gJHqzexCsVOrNF6yOdZeHgE/8ZswEsQe5xADe8VaXKQx
	T6X9lL9iRM6WeWdzdSklCsTvuo4Y8mU6QYKuc+oTH4fsExAQT6nPiVYDH0Uxc8eMziA/Fj2nyT8
	BZjuIOmHa5XXsg6jAgWnZ2Jn
X-Received: by 2002:a05:6870:f61d:b0:485:d1ab:793c with SMTP id 586e51a60fabf-4ae46b8c334mr1051565fac.29.1794359938319;
        Tue, 10 Nov 2026 17:18:58 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23095c16sm2489357fac.17.2026.11.10.17.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:18:56 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 10 Nov 2026 19:18:53 -0600
Subject: [PATCH] ASoC: soc-core: start the runtime's component count at
 zero
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-rbrue-asoc-rtd-num-components-v1-1-fa0c9e0cb361@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDQAwAwK+EnA0YW0T3K6WHdU3bHMxKolIQ/
 17oPGBODHGVwAQnuhwaWg0TcANYPtneQjpjAuzarmfmlnzyXShHLeTbTLYvVOqyVhPbgsZb5om
 H4d6Pgg3g6vLS7/9/PK/rB3kgbNJvAAAA
X-Change-ID: 20261110-rbrue-asoc-rtd-num-components-93a1b188469e
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <kees+treewide@kernel.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794359935; l=2050;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ISg7w++wXHyL53KnX6PWd5Fq+DoqRxUq2YHTwfGGjcg=;
 b=wbo217doE1MovnyyC6sTYiw+dP+3D+mWK2mBBMyznqJSZf1dme7lbFHchWw868o9OFxhx2Ggp
 PP6G+cKDim7AjA3kswBmP0IQsZkiRCi7R8woGpbbXASTnjxZ1KB/DIl
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Since commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to
the devm_kmalloc_obj() family"), soc_new_pcm_runtime() allocates the
runtime with devm_kzalloc_flex(). Since components[] is
__counted_by(num_components), that also sets num_components to the array's
capacity, but snd_soc_rtd_add_component() treats num_components as the
number of components added so far and appends after it.

Every component is therefore written past the end of the allocation, and
for_each_rtd_components() stops at the first, still NULL, entry, so a
link's components are never found. On an MT8173 board the RT5514 link's
init can no longer route to the codec's AMICL widget and the card fails
to register:

  mt8173-mt6391 sound: ASoC: Failed to add route Int Mic -> AMICL(*)
  RT5514 Codec: ASoC error (-19): at snd_soc_link_init() on RT5514 Codec

Reset the count after the allocation.

Fixes: 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since v7.4-rc2, every ASoC card writes its runtimes' components past the
end of their allocation, because devm_kzalloc_flex() now sets the
__counted_by counter that snd_soc_rtd_add_component() expects to start at
zero. On an MT8173 tablet (amazon-suez) this left the card unregistered.
This fix brings it back.

This patch was developed with the help of an LLM.
---
 sound/soc/soc-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 68b54e509b65..7b3d980ef10d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -388,6 +388,8 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 		return NULL;
 	}
 
+	rtd->num_components = 0;
+
 	rtd->dev = dev;
 	INIT_LIST_HEAD(&rtd->list);
 	for_each_pcm_streams(stream) {

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261110-rbrue-asoc-rtd-num-components-93a1b188469e

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

