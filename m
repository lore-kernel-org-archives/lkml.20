Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596236;
	b=qTJ5ZsB2Bh6WsZvwJFkdJ7V1usp3s4duzdwAmeD8nrhOXzCk4yroOjnEqfFoTer4Ftyp
	 ChFzrEXb7ucMTAlRC8dLYEXUwkTO1R/vRNt2Ywug1CoL7faOfKa3L6jRoPhl+UM35/6bb
	 HpdSkyDliMG70209KQ2fw2fpXj8EwPlEf4YxVaWZi+d8k8mc5z5fBEtiYVm3y/BXuYfwe
	 /XzPfY2CbjdViTD6NYPeuJD9rpVmPAeV2rAHYJi7bmszmlP3FO6hqu1PrynA0k/L4EH3K
	 olrF0+WTP/2ssNKvjCw8uWp8bQF1oJlne8U7FkdsA7KheQAn/7UfI1a89/aJA9IdmJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ONhjpTFPtQ0dZVvMCyXrWyUMz7z7tu2awXqAUU0j9nA=;
	b=jPF63manvpIYnpB4Ov77uoV9DJXvaBB0r6E5UKqYVKpZfZkXS3uHdyp15Hwz3+qMarMV
	 XheS6ftyVP/vJjN2ibErUZPq83QmvJiRttiUdgZqEMMlGVpD32Co2x2hT94EgLmE/bfpN
	 dW1A4/NfYCBi/qoZ4D9fRyWkQ5MLEgDnZ8odEK6AzIIFgeLqExUqqm6uJeCR1gWfUe4M4
	 rt6mXbRrcV1xg2RBt1pZ93YLwfvW+ZBIAAsjq5bufyE42wSJWaz9r2nhv/aOdLMm0SzOx
	 Yfgd8xNksQMYkdP5fEbZJAWW7lEMX7iHoaWn+45V6aP72oQviDGO92xPZsBHfuDszEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EU7LD0Q3;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91213606E349
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91213606E349
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EU7LD0Q3
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491846221ffso1391293f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1794596234; x=1795201034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONhjpTFPtQ0dZVvMCyXrWyUMz7z7tu2awXqAUU0j9nA=;
        b=EU7LD0Q34y2/GmFiEKNBMr3nwrGJYv2eZY+xul22wSGPC5XGyZ2SGA5uE20prbBt6Y
         GLbOExslgBk3vHJ4nU9hENpzvNntnZB7kFQm8R5vddMamvxrt8ZlcMzHezmvNNki0+qS
         NdWI+Fh7oHuC1EljM1zlmVAsi1LWw0So5snM++RK6KC/saHwtKBDoVFQDRRj3MFJJNF+
         glHEpu/W35eqKg1MngK6wCPdqDZqF0bjZFuORY8wLOg31C3x3GonFe5MDGTnF2oh8FhT
         E7mj9dtd41ZAwSUUK0OUuYbawTyY1DR6yTaQYDd+iAKhX59Eu0u5FtXQSJBCqwyfX1tM
         ogsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596234; x=1795201034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ONhjpTFPtQ0dZVvMCyXrWyUMz7z7tu2awXqAUU0j9nA=;
        b=Eq2y7tUU/3e+ojvgwMGgQ91kgMPkHyutUQ1ujpBXgoMj1QmV5TzPnBgfUUOJIHcUFu
         WVtFFf27dQULiB5PIpeLYf+Kf4v1YdHJzjwQF+UdxDEj4uXj1NNT7hFsdl9zgswbRiXK
         DJWHQrxTcEIbp6IsWePiYxMKnrbeGfQ+shu1Exn02tEKxN/Rr6/PN8WLapO3c830uKuq
         VsXuUNjG2eyhNMitcfQLrkdxHCpmHjuo+scQBASl023oiMmw6cxWqHKtN8OkVN6LoWu/
         1vIv4XvuOGFL82ccM6U9tPTxJvbtDg3pg1cvlfRbuyzGFeX6cEOMUgCpLTYgFmHg4zgj
         dZyQ==
X-Forwarded-Encrypted: i=1; AL+hErGeTlrIOAxcCMuaAumQ8b0AySSLkM5J/e6sXKNU2E1A0S/JQkCxHe0IgSwxpLCwujkT7GdOLn4bBJuO/Hg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9amVIlVK3NUDArxYt6imZayAK/Fq6l6YDr00CwxJmL6h7p5mQa
	4DocuDuILBFnaMvycyRXFEfx5hQbWF5YickPtQasJP5wTrvNqOgjT/Qf441PwbX7mJk=
X-Gm-Gg: AYBFou14zMDTMXB12pnhf9tdOf7YAIxg06/kGK24qbhJox4VBcCzIjhPcM0PnituVKH
	4VOu49qv8bu1qjOU5rBw50WE8GQtN3gT2WEszP5ptvrhIuGnB8tRTohzG96BgqHBFgzGCxJgLBC
	5wA9Mqx+uwFrY9aPlxGjos+bI7JHowuf4s/L6Y9OA3usFLIQK4LkWwOQbFHhGGIc2fq4mEoPxfJ
	WFcIr6gTuCUfv9ObZ4S9BDDlLH1w80wHS19ZrWAtQz0lJkr4tyt/EdcbVkBckNmK9iH89H+Rujo
	3qNzKydTY/6Lz5fHoADVXTCnWMIjXDxjF/5Gh4QKDYmXv/Q0jlwvc77h426bWLnfK24TymCS3K9
	aIlUqpQkHRSu9qdW5vbb7/l5tEqSFNgGO4tVtaAxT6R0HrWN9YJJaHpYoOWJ+Xs1GLgP2LUDQjX
	9GxrUVk/JmJZWqDjgHtQY6tGPjDaJn9l+24ZU2wKm8iWma3IV45MwfmFDwISA5MwZ4rEnXsN/Xq
	9gHBr0LKzkfhiuwqfnQZFl0V0KhxGgR1rr7l73LM7n8OmFvtr1NIHOPljXYlBTE/deRElSvquA9
	vlQH9y+X8E2eJSY5nvITO6c0HrBFkQ==
X-Received: by 2002:a05:6000:4b0b:b0:48e:20f9:8d75 with SMTP id ffacd0b85a97d-49c72c9c398mr7102565f8f.48.1794596233904;
        Fri, 13 Nov 2026 10:57:13 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ec8::179:1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6417589f8f.21.2026.11.13.10.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:57:13 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <ckan@cloudflare.com>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v3 05/10] drm/locking: print deadlock backtraces with stack_depot_snprint()
Date: Fri, 13 Nov 2026 18:56:57 +0000
Message-ID: <20261113185702.1332171-6-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113185702.1332171-1-matt@readmodwrite.com>
References: <20261113185702.1332171-1-matt@readmodwrite.com>
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

From: Caleb Kan <ckan@cloudflare.com>

When a modeset lock acquisition returns -EDEADLK, DRM saves the call chain
and prints it if the caller later attempts another lock or drops its locks
without first calling drm_modeset_backoff(). This diagnostic currently
fetches the saved stack through stack_depot_fetch().

Later patches compress the frames of persistent stack depot records and
remove stack_depot_fetch(), which cannot return a pointer to them.
Use stack_depot_snprint() to format the stack. Keep the PAGE_SIZE
buffer and leave the warning text, existing indentation, and backtrace
unchanged.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
[mfleming: reworded for compressed frames]
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 drivers/gpu/drm/drm_modeset_lock.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index e14814c30d8c..f48b02379b71 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -94,16 +94,13 @@ static noinline depot_stack_handle_t __drm_stack_depot_save(void)
 static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
 {
 	struct drm_printer p = drm_dbg_printer(NULL, DRM_UT_KMS, "drm_modeset_lock");
-	unsigned long *entries;
-	unsigned int nr_entries;
 	char *buf;
 
 	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
 	if (!buf)
 		return;
 
-	nr_entries = stack_depot_fetch(stack_depot, &entries);
-	stack_trace_snprint(buf, PAGE_SIZE, entries, nr_entries, 2);
+	stack_depot_snprint(stack_depot, buf, PAGE_SIZE, 2);
 
 	drm_printf(&p, "attempting to lock a contended lock without backoff:\n%s", buf);
 
-- 
2.43.0

