Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A21455622
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219951; cv=none; b=gTDRyLBDVx2RrGyiFJXg2yA35JogU52arzoC63UQhqIJXlOF7jkdyE/fINv5YyxHPlRwlErThDsInseukkpH47ZlFN9/VJvqWKcful/mUlpcGzhgD5VS8EiP4VovjQCP7uUecLhjEj7LPXYH6+qsARUOYOUKg4rRzFdQB5xCUeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219951; c=relaxed/simple;
	bh=Kj3ZB4NGUzzx57UChBLjFtyCaLoMvn/Vli0A0vW8mS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EoZKSbqr7kVtWIYlgnJw6K6ALCUjSBmLLT7+sv23CVr0sqSn/52ysIrOMKOTMfomyx8ooD7r9HdV87MEPimUUi3jJ2WYwnpx1shrxx8c78eLPolalnnYD9H++TEDcWGtrAcdvUfO1MR2LjzwwjByr3lgR4wAMJXztRl60CqpaIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=jwlFnC/Q; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="jwlFnC/Q"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b0496f4bbcso1407382eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1789219948; x=1789824748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yF4NpADAT2gJ9y4z6amAZmpHfQGtqZ7onGOfxR9CK7k=;
        b=jwlFnC/QBO3jXVjIO7p/ShRgTNB58aJXL4eKQ2TsD61UcZKnEiuB3TqYD+3ri1+lI9
         718d8nLFWnQ09EtdBQGGZrENG+dNeSuMMftmc9RVosdr6TnqG3CQyTQy1b4z0qE9eoUf
         5TaIYmAPj2uJmeoUOl5MqmQYQrVlZgozeinXVb+YgA2t0gwnT1OUbsIQhLfV3T+4CtsB
         wux/Yu9fhOdk97n7++ywyziyWUyT9oUMiJtxIYBMYeo4mpcL7fIVcaRG9AF1FItx7UZ6
         hP0OITJyyHGrCmE4O5AsXaSSTYe0cn9sGzOzvABfldRrRKmt7OP3sFt7/5BlMOeDQddl
         yQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219948; x=1789824748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yF4NpADAT2gJ9y4z6amAZmpHfQGtqZ7onGOfxR9CK7k=;
        b=LKw7gXspG/Fiy6xHEc6RoKwFoNYA1kLxYf7HtDny5P5KFeRn8tQj0GEl44FKzzGu+S
         iBThvjacONzri1+X0KUDyMzSPTXoSQ2allz5wzCX8osb9hmoVgruOgF5QKClwW7orKce
         FmdwVQENrI1rhty+DK4SGCULIUHI/XxynYoStnLsaHPSIqA1tnXMOTywy8gDZPXnHVzO
         vp1Rr3oEkky5nP1savWYHst35/Aa2RusRTAR2AazvZX2XrIxuAT8MJ596XL6XNqhlNp+
         3Rbn9KufMDYIN28jn0KGkCr2eNDjXGLdwy9P3T8DI2DppGVtw3Hbd+TLDEmYALvvavHO
         /h4Q==
X-Gm-Message-State: AFuF++kObrEWZrBXRscIUAeRhcs860AFnfEz3ImS/0Z10RUGOm8IJgMr
	nCe6sXYfzWl8VrjO2mjcyCeGesCDiS+jcJcYfLd9U+qvLU1WImC18ckmGABVrFIKTgAv2LaUlzL
	pNeJq0aZzoWs=
X-Gm-Gg: AYBFou2lUIRZPpcDp8a3g6Uwb7ymo9b/NNDPP4Skgb3zsLE4dxDAwSeBAtZ7mRO4RLt
	SOZcdt3eQflU7yz74xXbmwXrn4jU+R63R1FgTrzbvU4/D9m+8V+PBMaX0RE+Ip+e85Y4hNQ4aY8
	0nUyURxQAemF5oPWhFNvRF6crTLKhx1nlEJCX6D6T8o/YeP+nQHLVabzlZJ57sTW7mlu23tXn7k
	771DnIrAk72yUhnGous6isfG8xLlM58+8TA2dQUgHqpbsa+2j52OIIMeCjPrIeKhVrS/HBhLMaH
	M8ac42R3JOZhOkWnK51nX8Lxehn7enw0x3WaaT077TKyQ/xrd7g9NPgWQ6Qc2NUgwyPOaIg6Lgt
	2WR4yE9o0YRsz/W98a45+NF1M2Q/YCbOodOk7dlseKC2s09HJJr+CA8S1GvttdTgbb/Sr0syOIb
	wxwrlCYeDT02EMQurVpTK6L5sj2n61lIsTJrAE1cv6+hRMvkAmq98rwEpb9GO8SHFZpm9VjIn6J
	DzSXlMaLYW04cwg/A==
X-Received: by 2002:a05:6820:180e:b0:6be:4202:801c with SMTP id 006d021491bc7-6c0bc1d8678mr5814390eaf.32.1789219948423;
        Sat, 12 Sep 2026 06:32:28 -0700 (PDT)
Received: from Roxy.sysu.edu.cn ([2602:feda:30:ae86:295:dff:fe84:68f4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143659a9a06sm13292002c88.0.2026.09.12.06.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:32:27 -0700 (PDT)
From: Zhiling Zou <zhilinz@nebusec.ai>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	kyungsik.lee@lge.com,
	vega@nebusec.ai,
	zhilinz@nebusec.ai
Subject: [PATCH 1/1] lib: validate in-memory LZ4 chunk length
Date: Sat, 12 Sep 2026 21:32:17 +0800
Message-ID: <59c6555c27aa7ba18ee227f9f02c78d15a37605f.1789219453.git.zhilinz@nebusec.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789219453.git.zhilinz@nebusec.ai>
References: <cover.1789219453.git.zhilinz@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

unlz4() reads the compressed chunk length from an in-memory initrd and
passes it to LZ4_decompress_safe().  It only checks the chunk length
against the allocation size when the input is filled by a callback.

Reject an in-memory chunk that extends past the remaining input before
calling the LZ4 decoder.  This prevents malformed initrds from making
the decoder read past the mapped archive.

Fixes: e76e1fdfa8f8 ("lib: add support for LZ4-compressed kernel")
Cc: stable@vger.kernel.org
Reported-by: VEGA <vega@nebusec.ai>
Assisted-by: LLM
Signed-off-by: Zhiling Zou <zhilinz@nebusec.ai>
---
 lib/decompress_unlz4.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/decompress_unlz4.c b/lib/decompress_unlz4.c
index c0dbb3cea915e..86e9aaec04f6d 100644
--- a/lib/decompress_unlz4.c
+++ b/lib/decompress_unlz4.c
@@ -139,6 +139,10 @@ STATIC inline int INIT unlz4(u8 *input, long in_len,
 		if (!fill) {
 			inp += 4;
 			size -= 4;
+			if (chunksize > size) {
+				error("data corrupted");
+				goto exit_2;
+			}
 		} else {
 			if (chunksize > LZ4_compressBound(uncomp_chunksize)) {
 				error("chunk length is longer than allocated");
-- 
2.43.0

