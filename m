Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903EE490BF9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461886; cv=none; b=r6QivjoiXEt3Kvk55tOa3zfVUk4URsaKIrZVUkkSyPHJU6T4CnzrFjtErkLLLexXzNkLzFplsn1G+JCNeFXZoLE84B0HLUMUof3UCcAZZaFW5Ms/JsgnuAznmy4ZLWMEwhAifevqqDKV2M3yM4CQAPBsCnbyYa1GF3osAsYNxqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461886; c=relaxed/simple;
	bh=9XicfmWtilTgi+eiBhdjuMb7LG/1S7fRtYRHeGAjchE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MlR+FGoUE+PzGEEnyMXzPR7+EEBTH5bUJ31tqKSt16uF4njgW3gx5Cm+wiBxmLOmOLFeeJtzwuQD3XtNT770GGbtjRIsOl/V6N87WnmImoKnpzeZb8vHTIuACn5N+I9p4BFhibj3xqvb4QfVyiWxSrVLkpxT3CrsEL3VzfGOiqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfnZtDQJ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfnZtDQJ"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so33995695ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461884; x=1790066684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0/sk2GJWWHPuapRtpSu4um/7nmREwKZC6ZaF23SvHM=;
        b=YfnZtDQJRcG9YfNCeZvXjSThwk6hvKO8YPmAzp3kqPl1i/qhjjCdht0eQe8Yw965YE
         DmeN6DJSZLNyKzEZXrafbl44rPh2rDlOIceCpTyHEJTipLoCTgnCtLd6dWKKG1z4uSHV
         x0NOQao1stkAtW3j8hsYCfRko/5voBXXTvQvhtWB9hPLk6QD6hvA1iYZNJ2hUNqDkj/p
         Hnyj6/f+INm7e0FYuTu6nj5ifqjnQuBGx/QcnSTZBELgBukYWRDGeTuKSvq2d8S4AFMU
         Cfwfti7mSHciow9ZE9rl9r5EWdvaOcSHOKY4gtR4kavSxIfcYCUDiX1MvztmciELr9oA
         gPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461884; x=1790066684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S0/sk2GJWWHPuapRtpSu4um/7nmREwKZC6ZaF23SvHM=;
        b=GOs6vPS7ufeXjElXky3JlGPtoi0GkkeEoC6NYTpSCrMNjW8KDAEz2i+yrzMSjTACc7
         OesCDsb5qQ3fklEozf1qpAiof46FbM3xieStRvgEWZXnu2Gi3bwnheWOunoOR2mHI9x9
         Rny0nmDHZkrcF+55n8vLdYdClm6Af7qceNkUMcJQ8rkc8SWM09drntKrJ6aQpdb2NQiQ
         WHEhIUQD3rICBx06N6s+X5VYrAj1xJvBDHLNxq0ccFaIgwe5U+t2k8qIapNAtsa4UWBc
         UEWdXAvFcuTDfNJW2UdNxwo/JsMEEbTMRPyCz7qyKU1745Dyj+FEQ+UYBJd90bU5wt1i
         BIrw==
X-Forwarded-Encrypted: i=1; AKwUvByf//NaCM4IlM3U/jRANHBRwrVARkWkFprzZkxWV7uctLwVyTqI/pkCshOTU7dQqc9xdl9g9pZDOo8ern8=@vger.kernel.org
X-Gm-Message-State: AFuF++nrsWGpvdekxxd7HzBL5cXMTs0FEG+8t+6Z63gsIOFby9jBgnm1
	8VfT/N3MmcPDQJNvFdJP12a0+NNlzkWxf4w0AlXemRKRUST4Mst0YFzChulkSfpS
X-Gm-Gg: AYBFou1IwhHjR9hvcdn8d3bYHCQsQvCt4zO4iUlXUeNh5v+IS0Qgi3a5UG5kAnLTjfg
	/VhleJWqwkpXjk2CqNQnSGvTlfgiz45BQYv5rICS0qXDjCpXsGVTkG7NgVJPR58dAg5+lG+Cxxg
	wRk9Ssmyj8dOY2rcB5yewxBMIfFA1weur4sGcTobSHKEkJiEWd6SguREH/w+pPj6/o+91IICj29
	vs9B3xsxe4cgsHmEmYR340BrXcUdnqVwVGHSDXbnXaULJFyNyuJwuHJXOHEVV1r5cMIVQNNfinr
	rCR3/jsgJI0NcpiGWMednZV1dbWKOooggM1XMWlUYMcBQC6C+2v1SGzpkJT9wK8U72i46jV/Pa8
	7anXN3qrZnMsdaLCHP4LjP4Ap1fTL5lcn0TwPILPe3nPudKXBfD9CM2AVS5XJ47NfAjrZlY5aHT
	zNC7tF5BUtRNfTl2PRT89bM3i+9FC5YdMTcbODVsug7As0W9A8nxfQvj9ENs5wLcPuHjdy0dRCP
	YSSaEmnYmxL3WyXDWkd+jYKzLeNuMfZlvpGCg==
X-Received: by 2002:a17:902:f541:b0:2dd:1701:3b6e with SMTP id d9443c01a7336-2dd6c73381dmr120490465ad.16.1789461883709;
        Tue, 15 Sep 2026 01:44:43 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:43 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 05/23] ALSA: emu10k1: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:06 +0530
Message-ID: <20260915084424.1007757-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/sound/emu10k1.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 4f94565c9d15..6474239a11c1 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -633,8 +633,8 @@ SUB_REG(PEFE, FILTERAMOUNT,	0x000000ff)	/* Filter envlope amount				*/
 #define A_ADCCR_RCHANENABLE	0x00000020
 #define A_ADCCR_LCHANENABLE	0x00000010
 
-#define A_ADCCR_SAMPLERATE_MASK 0x0000000F      /* Audigy sample rate convertor output rate		*/
-#define ADCCR_SAMPLERATE_MASK	0x00000007	/* Sample rate convertor output rate			*/
+#define A_ADCCR_SAMPLERATE_MASK 0x0000000F      /* Audigy sample rate converter output rate		*/
+#define ADCCR_SAMPLERATE_MASK	0x00000007	/* Sample rate converter output rate			*/
 #define ADCCR_SAMPLERATE_48	0x00000000	/* 48kHz sample rate					*/
 #define ADCCR_SAMPLERATE_44	0x00000001	/* 44.1kHz sample rate					*/
 #define ADCCR_SAMPLERATE_32	0x00000002	/* 32kHz sample rate					*/
-- 
2.48.1

